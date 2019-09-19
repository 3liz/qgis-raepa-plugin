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

from PyQt5.QtCore import (
    QCoreApplication,
    QSettings
)
from qgis.core import (
    QgsProcessing,
    QgsProcessingAlgorithm,
    QgsProcessingUtils,
    QgsProcessingException,
    QgsProcessingParameterString,
    QgsProcessingParameterVectorLayer,
    QgsProcessingOutputString,
    QgsProcessingOutputNumber,
    QgsExpressionContextUtils
)
import os
from db_manager.db_plugins import createDbPlugin

class ImportShapefile(QgsProcessingAlgorithm):
    """
    Import Shapefile into imports schema
    """

    APPAREILS = 'APPAREILS'
    CANALISATIONS = 'CANALISATIONS'
    OUVRAGES = 'OUVRAGES'
    OUTPUT_STRING = 'OUTPUT_STRING'
    OUTPUT_STATUS = 'OUTPUT_STATUS'

    def name(self):
        return 'import_shapefile'

    def displayName(self):
        return self.tr('01 Import SHP into temporary tables')

    def group(self):
        return self.tr('Import')

    def groupId(self):
        return 'raepa_import'

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
            QgsProcessingParameterVectorLayer(
                self.APPAREILS, self.tr('Appareils'),
                optional=False
            )
        )
        self.addParameter(
            QgsProcessingParameterVectorLayer(
                self.CANALISATIONS, self.tr('Canalisations'),
                optional=False
            )
        )
        self.addParameter(
            QgsProcessingParameterVectorLayer(
                self.OUVRAGES, self.tr('Ouvrages'),
                optional=False
            )
        )

        # OUTPUTS
        # Add output for status (integer)
        self.addOutput(
            QgsProcessingOutputNumber(
                self.OUTPUT_STATUS,
                self.tr('Output status')
            )
        )
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

        return super(ImportShapefile, self).checkParameterValues(parameters, context)


    def processAlgorithm(self, parameters, context, feedback):
        """
        Here is where the processing itself takes place.
        """
        import processing
        plugin_dir = os.path.dirname(os.path.abspath(__file__))

        connection_name = QgsExpressionContextUtils.globalScope().variable('raepa_connection_name')
        feedback.pushInfo('Connection name = %s' % connection_name)

        # Ouvrages
        feedback.pushInfo('Import ouvrages')
        ouvrages_conversion = processing.run("qgis:importintopostgis", {
            'INPUT': parameters[self.OUVRAGES],
            'DATABASE': connection_name,
            'SCHEMA': 'imports',
            'TABLENAME': 'gabarit_ouvrages',
            'PRIMARY_KEY': None,
            'GEOMETRY_COLUMN': 'geom',
            'ENCODING': 'UTF-8',
            'OVERWRITE': True,
            'CREATEINDEX': True,
            'LOWERCASE_NAMES': True,
            'DROP_STRING_LENGTH': True,
            'FORCE_SINGLEPART': True
        }, context=context, feedback=feedback)
        feedback.pushInfo('Import ouvrages - OK')

        # Appareils
        feedback.pushInfo('Import appareils')
        appareil_conversion = processing.run("qgis:importintopostgis", {
            'INPUT': parameters[self.APPAREILS],
            'DATABASE': connection_name,
            'SCHEMA': 'imports',
            'TABLENAME': 'gabarit_appareils',
            'PRIMARY_KEY': None,
            'GEOMETRY_COLUMN': 'geom',
            'ENCODING': 'UTF-8',
            'OVERWRITE': True,
            'CREATEINDEX': True,
            'LOWERCASE_NAMES': True,
            'DROP_STRING_LENGTH': True,
            'FORCE_SINGLEPART': True
        }, context=context, feedback=feedback)
        feedback.pushInfo('Import appareils - OK')

        # Canalisations
        feedback.pushInfo('Import canalisations')
        canalisation_conversion = processing.run("qgis:importintopostgis", {
            'INPUT': parameters[self.CANALISATIONS],
            'DATABASE': connection_name,
            'SCHEMA': 'imports',
            'TABLENAME': 'gabarit_canalisations',
            'PRIMARY_KEY': None,
            'GEOMETRY_COLUMN': 'geom',
            'ENCODING': 'UTF-8',
            'OVERWRITE': True,
            'CREATEINDEX': True,
            'LOWERCASE_NAMES': True,
            'DROP_STRING_LENGTH': True,
            'FORCE_SINGLEPART': True
        }, context=context, feedback=feedback)
        feedback.pushInfo('Import canalisations - OK')

        return {
            self.OUTPUT_STATUS: 1,
            self.OUTPUT_STRING: self.tr('Import OK')
        }
