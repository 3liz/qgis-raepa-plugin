# -*- coding: utf-8 -*-

"""
/***************************************************************************
 Raepa
                                 A QGIS plugin
 France only - Plugin dedicated to import and manage water network data by using Raepa standard
 Generated by Plugin Builder: http://g-sherman.github.io/Qgis-Plugin-Builder/
                              -------------------
        begin                : 2018-12-19
        copyright            : (C) 2018 by 3liz
        email                : info@3liz.com
 ***************************************************************************/

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
        QgsProcessingOutputString
)
import os

class RaepaCreateStructureAlgorithm(QgsProcessingAlgorithm):
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
    OUTPUT_STRING = 'OUTPUT_STRING'

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
        # Check inputs
        if len(parameters[self.CODE]) != 3:
            return False, self.tr('Le nom abbrégé doit faire 3 exactement caractères.')
        if len(parameters[self.SIREN]) != 9:
            return False, self.tr("Le SIREN doit faire exactement 9 caractères.")

        # Check database content
        ok, msg = self.checkRaepaSchema(parameters, context)
        if not ok:
            return False, msg

        return super(RaepaCreateStructureAlgorithm, self).checkParameterValues(parameters, context)

    def checkRaepaSchema(self, parameters, context):
        override = self.parameterAsBool(parameters, self.OVERRIDE, context)
        db = QSqlDatabase.addDatabase("QPSQL")
        service = parameters[self.PGSERVICE]
        sql = "SELECT to_regclass('raepa.raepa_ouvrass_p') AS test;"
        db.setConnectOptions('service=%s' % service)
        msg = ''
        ok = True
        if db.isValid():
            if db.open():
                # Run the query
                query = db.exec_(sql)
                msg =  query.lastError().databaseText()
                if msg:
                    ok = False
                else:
                    while query.next():
                        record = query.record()
                        value = record.field('test').value()
                        if value == 'raepa.raepa_ouvrass_p' and not override:
                            ok = False
                            msg = "Le schema raepa existe déjà et contient déjà une structure !"
                db.close()
            else:
                msg = db.lastError().driverText()
                ok = False
        else:
            msg = 'Cannot connect to the database via service=%s' % service
            msg+= ': %s' % db.lastError().driverText()
            ok = False
        return ok, msg

    def processAlgorithm(self, parameters, context, feedback):
        """
        Here is where the processing itself takes place.
        """
        import processing
        plugin_dir = os.path.dirname(os.path.abspath(__file__))

        # Drop schema if needed
        override = self.parameterAsBool(parameters, self.OVERRIDE, context)
        if override:
            sql = 'DROP SCHEMA raepa CASCADE;'
            feedback.pushInfo("Suppression du schéma raepa")
            exec_result = processing.run("Raepa:raepa_execute_sql_on_service", {
                'PGSERVICE': parameters[self.PGSERVICE],
                'INPUT_SQL': sql
            }, context=context, feedback=feedback)

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
        for sf in sql_files:
            sql_file = os.path.join(plugin_dir, 'sql/install/%s' % sf)
            with open(sql_file, 'r') as f:
                feedback.pushInfo(sf)
                sql = f.read()
                exec_result = processing.run("Raepa:raepa_execute_sql_on_service", {
                    'PGSERVICE': parameters[self.PGSERVICE],
                    'INPUT_SQL': sql
                }, context=context, feedback=feedback)
                feedback.pushInfo(exec_result['OUTPUT_STRING'])

        # Add metadata info
        sql = 'INSERT INTO raepa.sys_organisme_gestionnaire (nom, siren, code, actif)'
        sql+= "VALUES ('%s', '%s', '%s', True);" % (
            parameters[self.NOM].replace("'", "''"),
            parameters[self.SIREN],
            parameters[self.CODE]
        )
        feedback.pushInfo("Ajout des informations sur le gestionnaire")
        exec_result = processing.run("Raepa:raepa_execute_sql_on_service", {
            'PGSERVICE': parameters[self.PGSERVICE],
            'INPUT_SQL': sql
        }, context=context, feedback=feedback)

        return {
            self.OUTPUT_STRING: msg
        }

    def name(self):
        return 'raepa_create_structure'

    def displayName(self):
        return self.tr('Create structure in database')

    def group(self):
        return self.tr('Structure')

    def groupId(self):
        return 'raepa_structure'

    def tr(self, string):
        return QCoreApplication.translate('Processing', string)

    def createInstance(self):
        return RaepaCreateStructureAlgorithm()
