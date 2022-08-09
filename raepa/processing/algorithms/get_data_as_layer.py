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


from db_manager.db_plugins import createDbPlugin
from processing.tools import postgis
from qgis.core import (
    QgsExpressionContextUtils,
    QgsLineSymbol,
    QgsProcessingContext,
    QgsProcessingException,
    QgsProcessingOutputNumber,
    QgsProcessingOutputString,
    QgsProcessingOutputVectorLayer,
    QgsProcessingParameterString,
    QgsVectorLayer,
)

from raepa.qgis_plugin_tools.tools.algorithm_processing import (
    BaseProcessingAlgorithm,
)


class GetDataAsLayer(BaseProcessingAlgorithm):

    OUTPUT_STATUS = 'OUTPUT_STATUS'
    OUTPUT_STRING = 'OUTPUT_STRING'
    OUTPUT_LAYER = 'OUTPUT_LAYER'
    OUTPUT_LAYER_NAME = 'OUTPUT_LAYER_NAME'
    OUTPUT_LAYER_RESULT_NAME = 'OUTPUT_LAYER_RESULT_NAME'
    SYMBOLE = 'SYMBOLE'

    SQL = 'SELECT 1::int AS id'
    LAYER_NAME = ''
    GEOM_FIELD = None

    def name(self):
        return 'get_data_as_layer'

    def displayName(self):
        return 'Récupération des données dans une couche'

    def group(self):
        return 'Outils'

    def groupId(self):
        return 'raepa_tools'

    def shortHelpString(self) -> str:
        return 'Charger une couche vecteur'

    def initAlgorithm(self, config):
        """
        Here we define the inputs and output of the algorithm, along
        with some other properties.
        """
        # INPUTS

        # Name of the layer
        self.addParameter(
            QgsProcessingParameterString(
                self.OUTPUT_LAYER_NAME,
                'Nom de la couche de sortie',
                optional=True
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
        # Add output for message
        self.addOutput(
            QgsProcessingOutputString(
                self.OUTPUT_STRING,
                'Message de sortie'
            )
        )

        # Output vector layer
        self.addOutput(
            QgsProcessingOutputVectorLayer(
                self.OUTPUT_LAYER,
                'Couche de sortie'
            )
        )

        # Output vector layer name (set by the user or the alg)
        self.addOutput(
            QgsProcessingOutputString(
                self.OUTPUT_LAYER_RESULT_NAME,
                'Nom de la couche de sortie'
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

        return super(GetDataAsLayer, self).checkParameterValues(parameters, context)

    def setSql(self, parameters, context, feedback):

        self.SQL = self.SQL.replace('\n', ' ').rstrip(';')

    def setLayerName(self, parameters, context, feedback):

        # Name given by the user
        output_layer_name = parameters[self.OUTPUT_LAYER_NAME]
        self.LAYER_NAME = output_layer_name

    def setSymbole(self, parameters, context, feedback):
        self.SYMBOLE = QgsLineSymbol.createSimple(
            {
                'line_color': '0,0,0',
                'line_style': 'solid',
                'line_width': '1'
            })

    def processAlgorithm(self, parameters, context, feedback):
        """
        Here is where the processing itself takes place.
        """
        # Database connection parameters
        connection_name = QgsExpressionContextUtils.globalScope().variable('raepa_connection_name')

        msg = ''
        status = 1

        # Set SQL
        self.setSql(parameters, context, feedback)
        # Set output layer name
        self.setLayerName(parameters, context, feedback)
        # Set symbole
        self.setSymbole(parameters, context, feedback)

        # Buid QGIS uri to load layer
        id_field = 'id'
        uri = postgis.uri_from_name(connection_name)
        uri.setDataSource("", "(" + self.SQL + ")", self.GEOM_FIELD, "", id_field)
        vlayer = QgsVectorLayer(uri.uri(), "layername", "postgres")
        if not vlayer.isValid():
            feedback.pushInfo('SQL = \n' + self.SQL)
            raise QgsProcessingException("""Cette couche est invalide!
                Vérifier les logs de PostGIS pour des messages d\'erreurs.""")

        # Load layer
        vlayer.renderer().setSymbol(self.SYMBOLE)
        context.temporaryLayerStore().addMapLayer(vlayer)
        context.addLayerToLoadOnCompletion(
            vlayer.id(),
            QgsProcessingContext.LayerDetails(
                self.LAYER_NAME,
                context.project(),
                self.OUTPUT_LAYER,
            )
        )

        return {
            self.OUTPUT_STATUS: status,
            self.OUTPUT_STRING: msg,
            self.OUTPUT_LAYER: vlayer.id(),
            self.OUTPUT_LAYER_RESULT_NAME: self.LAYER_NAME
        }
