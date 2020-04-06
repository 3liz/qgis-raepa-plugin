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

# This will get replaced with a git SHA1 when you do a git archive

__revision__ = '$Format:%H$'

import configparser
import os

from db_manager.db_plugins import createDbPlugin
from qgis.core import (
    QgsProcessingParameterBoolean,
    QgsProcessingParameterCrs,
    QgsProcessingOutputNumber,
    QgsProcessingOutputString,
    QgsExpressionContextUtils
)

from ...qgis_plugin_tools.tools.algorithm_processing import BaseProcessingAlgorithm
from .tools import fetchDataFromSqlQuery, getVersionInteger


class UpgradeDatabaseStructure(BaseProcessingAlgorithm):

    RUNIT = 'RUNIT'
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
                self.RUNIT,
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
        runit = self.parameterAsBool(parameters, self.RUNIT, context)
        if not runit:
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
        [header, data, rowCount, ok, error_message] = fetchDataFromSqlQuery(
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
        runit = self.parameterAsBool(parameters, self.RUNIT, context)
        if not runit:
            status = 0
            msg = 'Vous devez cocher cette case à cocher pour faire la mise à jour !'
            # raise Exception(msg)
            return {
                self.OUTPUT_STATUS: status,
                self.OUTPUT_STRING: msg
            }

        # get database version
        sql = '''
            SELECT version
            FROM raepa.sys_structure_metadonnee
            ORDER BY date_ajout DESC
            LIMIT 1;
        '''
        [header, data, rowCount, ok, error_message] = fetchDataFromSqlQuery(
            connection_name,
            sql
        )
        if not ok:
            feedback.pushInfo(error_message)
            status = 0
            raise Exception(error_message)
        db_version = None
        for a in data:
            db_version = a[0]
        if not db_version:
            error_message = 'Pas de version installée dans la base de données !'
            raise Exception(error_message)
        feedback.pushInfo('Version de la structure de la base de données : {}'.format(db_version))

        # get plugin version
        alg_dir = os.path.dirname(__file__)
        plugin_dir = os.path.join(alg_dir, '../../')
        config = configparser.ConfigParser()
        config.read(os.path.join(plugin_dir, 'metadata.txt'))
        plugin_version = config['general']['version']
        feedback.pushInfo('Version du plugin : {}'.format(plugin_version))

        # Return if nothing to do
        if db_version == plugin_version:
            return {
                self.OUTPUT_STATUS: 1,
                self.OUTPUT_STRING: (
                    'La version de la base de données correspond déjà à la version du plugin. Pas de mise à jour '
                    'nécessaire.')
            }

        # Get input srid
        crs = parameters[self.SRID]
        srid = crs.authid().replace('EPSG:', '')
        feedback.pushInfo('SRID = {}'.format(srid))

        # Get all the upgrade SQL files between db versions and plugin version
        upgrade_dir = os.path.join(plugin_dir, 'install/sql/upgrade/')
        get_files = [
            f for f in os.listdir(upgrade_dir)
            if os.path.isfile(os.path.join(upgrade_dir, f))
        ]
        files = []
        db_version_integer = getVersionInteger(db_version)
        for f in get_files:
            k = getVersionInteger(
                f.replace('upgrade_to_', '').replace('.sql', '').strip()
            )
            if k > db_version_integer:
                files.append(
                    [k, f]
                )

        def getKey(item):
            return item[0]

        sfiles = sorted(files, key=getKey)
        sql_files = [s[1] for s in sfiles]

        msg = ''
        # Loop sql files and run SQL code
        for sf in sql_files:
            sql_file = os.path.join(plugin_dir, 'install/sql/upgrade/%s' % sf)
            with open(sql_file, 'r') as f:
                sql = f.read()
                if len(sql.strip()) == 0:
                    feedback.pushInfo('* ' + sf + ' -- SKIPPED (EMPTY FILE)')
                    continue

                # Replace 2154 by given srid
                sql = sql.replace('2154', srid)

                # Add SQL database version in raepa.metadata
                new_db_version = sf.replace('upgrade_to_', '').replace('.sql', '').strip()
                feedback.pushInfo('* NEW DB VERSION' + new_db_version)
                sql += '''
                    UPDATE raepa.sys_structure_metadonnee
                    SET (version, date_ajout)
                    = ( '%s', now()::timestamp(0) );
                ''' % new_db_version

                [header, data, rowCount, ok, error_message] = fetchDataFromSqlQuery(
                    connection_name,
                    sql
                )
                if ok:
                    feedback.pushInfo('* ' + sf + ' -- SUCCESS !')
                else:
                    feedback.pushInfo(error_message)
                    status = 0
                    raise Exception(error_message)
                    # return {
                    # self.OUTPUT_STATUS: status,
                    # self.OUTPUT_STRING: error_message
                    # }

        return {
            self.OUTPUT_STATUS: 1,
            self.OUTPUT_STRING: '*** STRUCTURE RAEPA MISE À JOUR AVEC SUCCÈS ***'
        }
