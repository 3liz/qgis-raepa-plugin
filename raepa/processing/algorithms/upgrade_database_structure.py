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
__date__ = '2019-02-15'
__copyright__ = '(C) 2019 by 3liz'

import os

from db_manager.db_plugins import createDbPlugin
from qgis.core import (
    QgsProcessingParameterBoolean,
    QgsProcessingParameterCrs,
    QgsProcessingOutputNumber,
    QgsProcessingOutputString,
    QgsExpressionContextUtils, QgsProcessingException
)

from ...qgis_plugin_tools.tools.database import (
    available_migrations,
    fetch_data_from_sql_query,
)
from ...qgis_plugin_tools.tools.algorithm_processing import BaseProcessingAlgorithm
from ...qgis_plugin_tools.tools.resources import plugin_path
from ...qgis_plugin_tools.tools.version import format_version_integer, version

SCHEMA = "raepa"


class UpgradeDatabaseStructure(BaseProcessingAlgorithm):

    RUN_MIGRATIONS = 'RUN_MIGRATIONS'
    SRID = 'SRID'
    OUTPUT_STATUS = 'OUTPUT_STATUS'
    OUTPUT_STRING = 'OUTPUT_STRING'

    def name(self):
        return 'upgrade_database_structure'

    def displayName(self):
        return 'Mise à jour de la structure de la BDD'

    def shortHelpString(self) -> str:
        return (
            'Applique les migrations SQL nécéssaires sur la base de données. '
            'Cela est à faire lors d\'une mise à jour du plugin.')

    def group(self):
        return 'Structure'

    def groupId(self):
        return 'raepa_structure'

    def initAlgorithm(self, config):

        self.addParameter(
            QgsProcessingParameterBoolean(
                self.RUN_MIGRATIONS,
                'Cocher cette case pour faire la mise à jour. Autrement, aucune action ne se passera.',
                defaultValue=False,
            )
        )
        self.addParameter(
            QgsProcessingParameterCrs(
                self.SRID, 'Projection des géométries',
                defaultValue='EPSG:2154',
                optional=False
            )
        )
        self.addOutput(
            QgsProcessingOutputNumber(
                self.OUTPUT_STATUS,
                'Statut de sortie'
            )
        )
        self.addOutput(
            QgsProcessingOutputString(
                self.OUTPUT_STRING,
                'Message de sortie'
            )
        )

    def checkParameterValues(self, parameters, context):
        # Check if runit is checked
        run_migration = self.parameterAsBool(parameters, self.RUN_MIGRATIONS, context)
        if not run_migration:
            msg = 'Vous devez cocher cette case à cocher pour faire la mise à jour !'
            ok = False
            return ok, msg

        # Check that the connection name has been configured
        connection_name = QgsExpressionContextUtils.globalScope().variable('raepa_connection_name')
        if not connection_name:
            msg = (
                'Vous devez utiliser l\'algorithme "Configuration du plugin RAEPA" pour paramètrer le nom de la '
                'connexion.')
            return False, msg

        # Check that it corresponds to an existing connection
        dbpluginclass = createDbPlugin('postgis')
        connections = [c.connectionName() for c in dbpluginclass.connections()]
        if connection_name not in connections:
            msg = (
                'La connexion configurée "{}" n\'existe pas dans QGIS : {}'.format(
                    connection_name, ', '.join(connections)))
            return False, msg

        # Check database content
        ok, msg = self.checkSchema(parameters, context)
        if not ok:
            return False, msg

        return super(UpgradeDatabaseStructure, self).checkParameterValues(parameters, context)

    def checkSchema(self, parameters, context):
        sql = '''
            SELECT schema_name
            FROM information_schema.schemata
            WHERE schema_name = 'raepa';
        '''
        connection_name = QgsExpressionContextUtils.globalScope().variable('raepa_connection_name')
        [header, data, rowCount, ok, error_message] = fetch_data_from_sql_query(
            connection_name,
            sql
        )
        if not ok:
            return ok, error_message
        ok = False
        msg = 'Le schéma RAEPA n\'existe pas dans la base de données.'
        for a in data:
            schema = a[0]
            if schema == 'raepa':
                ok = True
                msg = ''
        return ok, msg

    def processAlgorithm(self, parameters, context, feedback):
        connection_name = QgsExpressionContextUtils.globalScope().variable('raepa_connection_name')

        # Drop schema if needed
        runit = self.parameterAsBool(parameters, self.RUN_MIGRATIONS, context)
        if not runit:
            msg = 'Vous devez cocher cette case à cocher pour faire la mise à jour !'
            raise QgsProcessingException(msg)

        # get database version
        sql = '''
            SELECT version
            FROM raepa.sys_structure_metadonnee
            ORDER BY date_ajout DESC
            LIMIT 1;
        '''
        [header, data, rowCount, ok, error_message] = fetch_data_from_sql_query(
            connection_name,
            sql
        )
        if not ok:
            raise QgsProcessingException(error_message)

        db_version = None
        for a in data:
            db_version = a[0]
        if not db_version:
            error_message = 'Pas de version installée dans la base de données !'
            raise QgsProcessingException(error_message)
        feedback.pushInfo('Version de la structure de la base de données : {}'.format(db_version))

        # Get plugin version
        plugin_version = version()
        if plugin_version in ["master", "dev"]:
            migrations = available_migrations(000000)
            last_migration = migrations[-1]
            plugin_version = (
                last_migration.replace("upgrade_to_", "").replace(".sql", "").strip()
            )
            feedback.reportError(
                "Be careful, running the migrations on a development branch!"
            )
            feedback.reportError(
                "Latest available migration is {}".format(plugin_version)
            )
        else:
            feedback.pushInfo("Version du plugin" + " = {}".format(plugin_version))

        # Return if nothing to do
        if db_version == plugin_version:
            return {
                self.OUTPUT_STATUS: 1,
                self.OUTPUT_STRING: (
                    "La version de la base de données et du plugin sont les mêmes. Aucune mise-à-jour "
                    "n'est nécessaire")
            }

        db_version_integer = format_version_integer(db_version)
        sql_files = available_migrations(db_version_integer)

        # Get input srid
        crs = parameters[self.SRID]
        srid = crs.authid().replace('EPSG:', '')
        feedback.pushInfo('SRID = {}'.format(srid))

        # Loop sql files and run SQL code
        for sf in sql_files:
            sql_file = os.path.join(plugin_path(), 'install/sql/upgrade/%s' % sf)
            with open(sql_file, 'r') as f:
                sql = f.read()
                if len(sql.strip()) == 0:
                    feedback.pushInfo('* ' + sf + ' -- SKIPPED (EMPTY FILE)')
                    continue

                # Replace 2154 by given srid
                sql = sql.replace('2154', srid)

                # Add SQL database version in raepa.metadata
                new_db_version = sf.replace('upgrade_to_', '').replace('.sql', '').strip()
                feedback.pushInfo('* NEW DB VERSION ' + new_db_version)
                sql += '''
                    UPDATE raepa.sys_structure_metadonnee
                    SET (version, date_ajout)
                    = ( '%s', now()::timestamp(0) );
                ''' % new_db_version

                [header, data, rowCount, ok, error_message] = fetch_data_from_sql_query(
                    connection_name,
                    sql
                )
                if ok:
                    feedback.pushInfo('* ' + sf + ' -- SUCCESS !')
                else:
                    raise QgsProcessingException(error_message)

        # Everything is fine, we now update to the plugin version
        sql += '''
            UPDATE {}.sys_structure_metadonnee
            SET (version, date_ajout)
            = ( '{}', now()::timestamp(0) );
        '''.format(SCHEMA, plugin_version)

        _, _, _, ok, error_message = fetch_data_from_sql_query(connection_name, sql)
        if not ok:
            raise QgsProcessingException(error_message)

        return {
            self.OUTPUT_STATUS: 1,
            self.OUTPUT_STRING: "*** LA STRUCTURE A BIEN ÉTÉ MISE À JOUR SUR LA BASE DE DONNÉES ***"
        }
