"""
/***************************************************************************
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 ***************************************************************************/
"""

__author__ = '3liz'
__date__ = '2018-12-19'
__copyright__ = '(C) 2018 by 3liz'

import os

from qgis.core import (
    QgsExpressionContextUtils,
    QgsProcessingException,
    QgsProcessingOutputNumber,
    QgsProcessingOutputString,
    QgsProcessingParameterBoolean,
    QgsProcessingParameterCrs,
    QgsProcessingParameterString,
    QgsProviderRegistry,
)

from raepa.processing.algorithms.tools import fetch_data_from_sql_query
from raepa.qgis_plugin_tools.tools.algorithm_processing import (
    BaseProcessingAlgorithm,
)
from raepa.qgis_plugin_tools.tools.database import available_migrations
from raepa.qgis_plugin_tools.tools.resources import (
    plugin_path,
    plugin_test_data_path,
)
from raepa.qgis_plugin_tools.tools.version import version

SCHEMA = "raepa"


class CreateDatabaseStructure(BaseProcessingAlgorithm):
    """
    Create Raepa structure in Database
    """

    OVERRIDE = 'OVERRIDE'
    ADD_AUDIT = 'ADD_AUDIT'
    SRID = 'SRID'
    NOM = 'NOM'
    SIREN = 'SIREN'
    CODE = 'CODE'
    OUTPUT_STATUS = 'OUTPUT_STATUS'
    OUTPUT_STRING = 'OUTPUT_STRING'

    def name(self):
        return 'create_database_structure'

    def displayName(self):
        return 'Création de la structure BDD'

    def group(self):
        return 'Structure'

    def groupId(self):
        return 'raepa_structure'

    def shortHelpString(self) -> str:
        return 'Crée la base de données avec les schémas et les tables.'

    def initAlgorithm(self, config):
        self.addParameter(
            QgsProcessingParameterBoolean(
                self.OVERRIDE, 'Écraser les schémas raepa,audit et import et toutes les données ? ** ATTENTION **',
                defaultValue=False,
                optional=False
            )
        )
        self.addParameter(
            QgsProcessingParameterBoolean(
                self.ADD_AUDIT, 'Ajouter un audit de suivi des modifications sur les tables ?',
                defaultValue=True,
                optional=False
            )
        )
        self.addParameter(
            QgsProcessingParameterCrs(
                self.SRID, 'Projection des géométries',
                defaultValue='EPSG:2154',
                optional=False
            )
        )
        self.addParameter(
            QgsProcessingParameterString(
                self.NOM, 'Nom du gestionnaire',
                defaultValue='Communauté d\'Agglomération de Test',
                optional=False
            )
        )
        self.addParameter(
            QgsProcessingParameterString(
                self.SIREN, 'SIREN',
                defaultValue='123456789',
                optional=False
            )
        )
        self.addParameter(
            QgsProcessingParameterString(
                self.CODE, 'Nom abrégé en 3 caractères',
                defaultValue='cat',
                optional=False
            )
        )

        # OUTPUTS
        # Add output for status (integer)
        self.addOutput(
            QgsProcessingOutputNumber(
                self.OUTPUT_STATUS,
                'Statut de sortie'
            )
        )
        self.addOutput(
            QgsProcessingOutputString(
                self.OUTPUT_STRING, 'Message de sortie'
            )
        )

    def checkParameterValues(self, parameters, context):

        # Check that the connection name has been configured
        connection_name = QgsExpressionContextUtils.globalScope().variable('raepa_connection_name')
        if not connection_name:
            msg = 'Vous devez utiliser le l\'algorithme de configuration du plugin pour paramétrer le nom de connexion.'
            return False, msg

        # Check that it corresponds to an existing connection
        metadata = QgsProviderRegistry.instance().providerMetadata('postgres')
        connection = metadata.findConnection(connection_name)
        if not connection:
            msg = 'La connexion "{}" n\'existe pas dans QGIS'.format(connection_name)
            return False, msg

        override = parameters[self.OVERRIDE]

        # Check database content
        if 'raepa' in connection.schemas() and not override:
            msg = (
                'Le schéma raepa existe déjà dans la base de données ! Si vous souhaitez réellement supprimer '
                'et recréer (et perdre les données existantes), cochez la case "Écrasement".'
            )
            return False, msg

        # Check inputs
        if len(parameters[self.CODE]) != 3:
            return False, 'Le nom abrégé doit faire 3 exactement caractères.'
        if len(parameters[self.SIREN]) != 9:
            return False, "Le SIREN doit faire exactement 9 caractères."

        return super(CreateDatabaseStructure, self).checkParameterValues(parameters, context)

    def processAlgorithm(self, parameters, context, feedback):
        connection_name = QgsExpressionContextUtils.globalScope().variable('raepa_connection_name')

        # Drop schema if needed
        override = self.parameterAsBool(parameters, self.OVERRIDE, context)
        if override:
            feedback.pushInfo("Tentative de suppression du schéma raepa, audit, imports")
            sql = '''
                DROP SCHEMA IF EXISTS raepa CASCADE;
                DROP SCHEMA IF EXISTS audit CASCADE;
                DROP SCHEMA IF EXISTS imports CASCADE;
            '''

            _, error_message = fetch_data_from_sql_query(connection_name, sql)
            if error_message:
                raise QgsProcessingException(error_message)
            feedback.pushInfo("* Schéma raepa, audit et imports supprimés.")

        plugin_dir = plugin_path()
        plugin_version = version()
        dev_version = False
        run_migration = os.environ.get(
            "TEST_DATABASE_INSTALL_{}".format(SCHEMA.upper())
        )
        if plugin_version in ["master", "dev"] and not run_migration:
            feedback.reportError(
                "Be careful, running the install on a development branch!"
            )
            dev_version = True

        # Create full structure
        sql_files = [
            "00_initialize_database.sql",
            "audit/audit.sql",
            "{}/10_FUNCTION.sql".format(SCHEMA),
        ]
        if run_migration:
            sql_files.append(
                "{}/20_TABLE_COMMENT_SEQUENCE_DEFAULT.sql".format(SCHEMA)
            )
        else:
            sql_files.append(
                "{}/20_TABLE_SEQUENCE_DEFAULT.sql".format(SCHEMA)
            )

        sql_files += [
            "{}/30_VIEW.sql".format(SCHEMA),
            "{}/40_INDEX.sql".format(SCHEMA),
            "{}/50_TRIGGER.sql".format(SCHEMA),
            "{}/60_CONSTRAINT.sql".format(SCHEMA),
            "{}/70_COMMENT.sql".format(SCHEMA),
            "{}/90_GLOSSARY.sql".format(SCHEMA),
            "99_finalize_database.sql",
        ]

        # Get input srid
        crs = parameters[self.SRID]
        srid = crs.authid().replace('EPSG:', '')
        feedback.pushInfo('SRID = %s' % srid)

        # Audit all tables id asked
        add_audit = self.parameterAsBool(parameters, self.ADD_AUDIT, context)
        if add_audit:
            sql_files.append('add_audit.sql')

        if run_migration:
            plugin_dir = plugin_test_data_path()
            feedback.reportError(
                "Be careful, running migrations on an empty database using {} "
                "instead of {}".format(run_migration, plugin_version)
            )
            plugin_version = run_migration

        # Loop sql files and run SQL code
        for sf in sql_files:
            feedback.pushInfo(sf)
            sql_file = os.path.join(plugin_dir, 'install/sql/%s' % sf)
            if not os.path.isfile(sql_file):
                feedback.pushInfo('  Fichier non trouvé')
                continue
            with open(sql_file, 'r') as f:
                sql = f.read()
                if len(sql.strip()) == 0:
                    feedback.pushInfo('  Skipped (empty file)')
                    continue
                sql = sql.replace('2154', srid)

                _, error_message = fetch_data_from_sql_query(connection_name, sql)
                if error_message:
                    raise QgsProcessingException(error_message)
                feedback.pushInfo('  Success !')

        # Add version
        if run_migration or not dev_version:
            metadata_version = plugin_version
        else:
            migrations = available_migrations(000000)
            last_migration = migrations[-1]
            metadata_version = (
                last_migration.replace("upgrade_to_", "").replace(".sql", "").strip()
            )
            feedback.reportError("Latest migration is {}".format(metadata_version))
        sql = '''
            INSERT INTO {}.sys_structure_metadonnee
            (version, date_ajout)
            VALUES (
                '{}', now()::timestamp(0)
            )
        '''.format(SCHEMA, metadata_version)
        _, error_message = fetch_data_from_sql_query(connection_name, sql)
        if error_message:
            raise QgsProcessingException(error_message)

        # Add metadata info
        sql = 'INSERT INTO raepa.sys_organisme_gestionnaire (nom, siren, code, actif)'
        sql += "VALUES ('%s', '%s', '%s', True);" % (
            parameters[self.NOM].replace("'", "''"),
            parameters[self.SIREN],
            parameters[self.CODE]
        )
        _, error_message = fetch_data_from_sql_query(connection_name, sql)
        if error_message:
            raise QgsProcessingException(error_message)

        return {
            self.OUTPUT_STATUS: 1,
            self.OUTPUT_STRING: (
                "*** LA STRUCTURE {} A BIEN ÉTÉ CRÉÉE '{}'***".format(
                    SCHEMA, metadata_version
                )
            ),
        }
