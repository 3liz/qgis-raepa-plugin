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


from db_manager.db_plugins import createDbPlugin

from qgis.core import (
    Qgis,
    QgsProcessingParameterVectorLayer,
    QgsProcessingOutputString,
    QgsProcessingOutputNumber,
    QgsExpressionContextUtils
)
if Qgis.QGIS_VERSION_INT >= 30800:
    from qgis import processing
else:
    import processing

from ...qgis_plugin_tools.tools.algorithm_processing import BaseProcessingAlgorithm


class ImportShapefile(BaseProcessingAlgorithm):
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
        return '01 Import des SHP dans les tables temporaires'

    def shortHelpString(self) -> str:
        return 'Import des données vecteurs dans la base de données PostGIS.'

    def group(self):
        return 'Import'

    def groupId(self):
        return 'raepa_import'

    def initAlgorithm(self, config):
        """
        Here we define the inputs and output of the algorithm, along
        with some other properties.
        """
        # INPUTS
        self.addParameter(
            QgsProcessingParameterVectorLayer(
                self.APPAREILS, 'Appareils',
                optional=False
            )
        )
        self.addParameter(
            QgsProcessingParameterVectorLayer(
                self.CANALISATIONS, 'Canalisations',
                optional=False
            )
        )
        self.addParameter(
            QgsProcessingParameterVectorLayer(
                self.OUVRAGES, 'Ouvrages',
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

        return super(ImportShapefile, self).checkParameterValues(parameters, context)

    def processAlgorithm(self, parameters, context, feedback):
        """
        Here is where the processing itself takes place.
        """
        connection_name = QgsExpressionContextUtils.globalScope().variable('raepa_connection_name')
        feedback.pushInfo('Connection name = %s' % connection_name)

        # Ouvrages
        feedback.pushInfo('Import ouvrages')
        processing.run("qgis:importintopostgis", {
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
        processing.run("qgis:importintopostgis", {
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
        processing.run("qgis:importintopostgis", {
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
            self.OUTPUT_STRING: 'Import OK'
        }
