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

# This will get replaced with a git SHA1 when you do a git archive

__revision__ = '$Format:%H$'

import configparser
import os

from db_manager.db_plugins import createDbPlugin
from qgis.core import (
    QgsProcessingParameterString,
    QgsProcessingParameterCrs,
    QgsProcessingParameterBoolean,
    QgsProcessingOutputNumber,
    QgsProcessingOutputString,
    QgsExpressionContextUtils
)

from ..raepa_algorithm import RaepaAlgorithm
from .tools import fetchDataFromSqlQuery


class CreateDatabaseStructure(RaepaAlgorithm):
    """
    Create Raepa structure in Database
    """

    # Constants used to refer to parameters and outputs. They will be
    # used when calling the algorithm from another algorithm, or when
    # calling from the QGIS console.

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

    def createInstance(self):
        return self.__class__()

    def initAlgorithm(self, config):
        """
        Here we define the inputs and output of the algorithm, along
        with some other properties.
        """
        # INPUTS
        self.addParameter(
            QgsProcessingParameterBoolean(
                self.OVERRIDE, 'Écraser le schéma raepa et toutes les données ? ** ATTENTION **',
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
                self.CODE, 'Nom abbrégé en 3 caractères',
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
        dbpluginclass = createDbPlugin('postgis')
        connections = [c.connectionName() for c in dbpluginclass.connections()]
        if connection_name not in connections:
            msg = 'La connexion "{}" n\'existe pas dans QGIS : {}'.format(
                connection_name, ', '.join(connections))
            return False, msg

        # Check database content
        ok, msg = self.checkSchema(parameters, context)
        if not ok:
            return False, msg

        # Check inputs
        if len(parameters[self.CODE]) != 3:
            return False, 'Le nom abbrégé doit faire 3 exactement caractères.'
        if len(parameters[self.SIREN]) != 9:
            return False, "Le SIREN doit faire exactement 9 caractères."

        return super(CreateDatabaseStructure, self).checkParameterValues(parameters, context)

    def checkSchema(self, parameters, context):
        sql = '''
            SELECT schema_name
            FROM information_schema.schemata
            WHERE schema_name = 'raepa';
        '''
        connection_name = QgsExpressionContextUtils.globalScope().variable('raepa_connection_name')
        [header, data, rowCount, ok, error_message] = fetchDataFromSqlQuery(
            connection_name,
            sql
        )
        if not ok:
            return ok, error_message
        override = parameters[self.OVERRIDE]
        msg = 'Le schéma raepa n\'existe pas. On continue...'
        for a in data:
            schema = a[0]
            if schema == 'raepa' and not override:
                ok = False
                msg = (
                    'Le schéma raepa existe déjà dans la base de données ! Si vous souhaitez réelement supprimer '
                    'et recréer (et perdre les données existantes), cochez la case "Écrasement".')
        return ok, msg

    def processAlgorithm(self, parameters, context, feedback):
        """
        Here is where the processing itself takes place.
        """
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

            [header, data, rowCount, ok, error_message] = fetchDataFromSqlQuery(
                connection_name,
                sql
            )
            if ok:
                feedback.pushInfo("* Schéma raepa supprimé.")
            else:
                feedback.pushInfo(error_message)
                status = 0
                # raise Exception(msg)
                return {
                    self.OUTPUT_STATUS: status,
                    self.OUTPUT_STRING: error_message
                }

        # Create full structure
        sql_files = [
            '00_initialize_database.sql',
            'audit/audit.sql',
            'raepa/10_FUNCTION.sql',
            'raepa/20_TABLE_SEQUENCE_DEFAULT.sql',
            'raepa/30_VIEW.sql',
            'raepa/40_INDEX.sql',
            'raepa/50_TRIGGER.sql',
            'raepa/60_CONSTRAINT.sql',
            'raepa/70_COMMENT.sql',
            'raepa/90_GLOSSARY.sql',
            '99_finalize_database.sql'
        ]
        msg = ''
        alg_dir = os.path.dirname(__file__)
        plugin_dir = os.path.join(alg_dir, '../../')

        # Get input srid
        crs = parameters[self.SRID]
        srid = crs.authid().replace('EPSG:', '')
        feedback.pushInfo('SRID = %s' % srid)

        # Audit all tables id asked
        add_audit = self.parameterAsBool(parameters, self.ADD_AUDIT, context)
        if add_audit:
            sql_files.append('add_audit.sql')

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

                [header, data, rowCount, ok, error_message] = fetchDataFromSqlQuery(
                    connection_name,
                    sql
                )
                if ok:
                    feedback.pushInfo('  Success !')
                else:
                    feedback.pushInfo('* ' + error_message)
                    status = 0
                    raise Exception(error_message)
                    # return {
                    # self.OUTPUT_STATUS: status,
                    # self.OUTPUT_STRING: error_message
                    # }

        # Add version
        config = configparser.ConfigParser()
        config.read(str(os.path.join(plugin_dir, 'metadata.txt')))
        version = config['general']['version']
        sql = '''
            INSERT INTO raepa.sys_structure_metadonnee
            (version, date_ajout)
            VALUES (
                '%s', now()::timestamp(0)
            )
        ''' % version
        [header, data, rowCount, ok, error_message] = fetchDataFromSqlQuery(
            connection_name,
            sql
        )

        # Add metadata info
        sql = 'INSERT INTO raepa.sys_organisme_gestionnaire (nom, siren, code, actif)'
        sql += "VALUES ('%s', '%s', '%s', True);" % (
            parameters[self.NOM].replace("'", "''"),
            parameters[self.SIREN],
            parameters[self.CODE]
        )
        [header, data, rowCount, ok, error_message] = fetchDataFromSqlQuery(
            connection_name,
            sql
        )

        return {
            self.OUTPUT_STATUS: 1,
            self.OUTPUT_STRING: '*** STRUCTURE RAEPA CRÉÉE AVEC SUCCÈS ***'
        }
