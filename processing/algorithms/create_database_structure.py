# -*- coding: utf-8 -*-

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

from PyQt5.QtCore import QCoreApplication
from PyQt5.QtSql import QSqlDatabase, QSqlQuery
from qgis.core import (
    QgsProcessing,
    QgsProcessingAlgorithm,
    QgsProcessingUtils,
    QgsProcessingException,
    QgsProcessingParameterString,
    QgsProcessingParameterBoolean,
    QgsProcessingOutputNumber,
    QgsProcessingOutputString,
    QgsExpressionContextUtils
)
import processing
import os
from .tools import *
import configparser
from db_manager.db_plugins import createDbPlugin

class CreateDatabaseStructure(QgsProcessingAlgorithm):
    """
    Create Raepa structure in Database
    """

    # Constants used to refer to parameters and outputs. They will be
    # used when calling the algorithm from another algorithm, or when
    # calling from the QGIS console.

    PGSERVICE = 'PGSERVICE'
    OVERRIDE = 'OVERRIDE'
    NOM = 'NOM'
    SIREN = 'SIREN'
    CODE = 'CODE'
    OUTPUT_STATUS = 'OUTPUT_STATUS'
    OUTPUT_STRING = 'OUTPUT_STRING'

    def name(self):
        return 'create_database_structure'

    def displayName(self):
        return self.tr('Create database structure')

    def group(self):
        return self.tr('Structure')

    def groupId(self):
        return 'raepa_structure'

    def tr(self, string):
        return QCoreApplication.translate('Processing', string)

    def createInstance(self):
        return self.__class__()

    def initAlgorithm(self, config):
        """
        Here we define the inputs and output of the algorithm, along
        with some other properties.
        """
        # INPUTS
        self.addParameter(
            QgsProcessingParameterString(
                self.PGSERVICE, 'PostgreSQL Service',
                defaultValue='raepa',
                optional=False
            )
        )
        self.addParameter(
            QgsProcessingParameterBoolean(
                self.OVERRIDE, 'Ecraser le schéma raepa et toutes les données ? ** ATTENTION **',
                defaultValue=False,
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
        self.addOutput(
            QgsProcessingOutputString(
                self.OUTPUT_STRING, self.tr('Output message')
            )
        )

    def checkParameterValues(self, parameters, context):

        # Check that the connection name has been configured
        connection_name = QgsExpressionContextUtils.globalScope().variable('raepa_connection_name')
        if not connection_name:
            return False, self.tr('You must use the "Configure Raepa plugin" alg to set the database connection name')

        # Check that it corresponds to an existing connection
        dbpluginclass = createDbPlugin( 'postgis' )
        connections = [c.connectionName() for c in dbpluginclass.connections()]
        if connection_name not in connections:
            return False, self.tr('The configured connection name does not exists in QGIS')

        # Check database content
        ok, msg = self.checkSchema(parameters, context)
        if not ok:
            return False, msg

        # Check inputs
        if len(parameters[self.CODE]) != 3:
            return False, self.tr('Le nom abbrégé doit faire 3 exactement caractères.')
        if len(parameters[self.SIREN]) != 9:
            return False, self.tr("Le SIREN doit faire exactement 9 caractères.")

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
        msg = self.tr('Schema raepa does not exists. Continue...')
        for a in data:
            schema = a[0]
            if schema == 'raepa' and not override:
                ok = False
                msg = self.tr("Schema raepa already exists in database ! If you REALLY want to drop and recreate it (and loose all data), check the *Overwrite* checkbox")
        return ok, msg

    def processAlgorithm(self, parameters, context, feedback):
        """
        Here is where the processing itself takes place.
        """
        connection_name = QgsExpressionContextUtils.globalScope().variable('raepa_connection_name')

        # Drop schema if needed
        override = self.parameterAsBool(parameters, self.OVERRIDE, context)
        if override:
            feedback.pushInfo(self.tr("Trying to drop schema raepa..."))
            sql = 'DROP SCHEMA IF EXISTS raepa CASCADE;'

            [header, data, rowCount, ok, error_message] = fetchDataFromSqlQuery(
                connection_name,
                sql
            )
            if ok:
                feedback.pushInfo(self.tr("Schema raepa has been droped."))
            else:
                feedback.pushInfo(error_message)
                status = 0
                # raise Exception(msg)
                return {
                    self.OUTPUT_STATUS: status,
                    self.OUTPUT_STRING: msg
                }

        # Create full structure
        sql_files = [
            '00_raepa_pre_structure.sql',
            '10_raepa_structure.sql',
            '20_raepa_post_structure.sql',
            '30_raepa_triggers.sql',
            '40_raepa_verification.sql',
            '50_raepa_audit.sql',
            '60_raepa_import_gabarits_shapefile.sql',
            '90_raepa_nomenclature.sql'
        ]
        msg = ''
        alg_dir = os.path.dirname(__file__)
        plugin_dir = os.path.join(alg_dir, '../../')

        # Loop sql files and run SQL code
        for sf in sql_files:
            sql_file = os.path.join(plugin_dir, 'install/sql/%s' % sf)
            with open(sql_file, 'r') as f:
                sql = f.read()
                if len(sql.strip()) == 0:
                    feedback.pushInfo('* ' + sf + ' -> SKIPPED (EMPTY FILE)')
                    continue

                [header, data, rowCount, ok, error_message] = fetchDataFromSqlQuery(
                    connection_name,
                    sql
                )
                if ok:
                    feedback.pushInfo('* ' + sf + ' -> SUCCESS !')
                else:
                    feedback.pushInfo(error_message)
                    status = 0
                    raise Exception(error_message)
                    # return {
                        # self.OUTPUT_STATUS: status,
                        # self.OUTPUT_STRING: error_message
                    # }

        # Add version
        config = configparser.ConfigParser()
        config.read(os.path.join(plugin_dir, 'metadata.txt'))
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
        sql+= "VALUES ('%s', '%s', '%s', True);" % (
            parameters[self.NOM].replace("'", "''"),
            parameters[self.SIREN],
            parameters[self.CODE]
        )
        feedback.pushInfo("Ajout des informations sur le gestionnaire")
        [header, data, rowCount, ok, error_message] = fetchDataFromSqlQuery(
            connection_name,
            sql
        )

        return {
            self.OUTPUT_STATUS: 1,
            self.OUTPUT_STRING: self.tr('*** RAEPA STRUCTURE HAS BEEN SUCCESSFULLY CREATED ***')
        }
