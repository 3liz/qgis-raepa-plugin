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

from qgis.core import (
    QgsProcessingAlgorithm,
    QgsProcessingParameterString,
    QgsProcessingOutputString,
    QgsProcessingOutputNumber,
    QgsExpressionContextUtils,
    QgsVectorLayer,
    QgsProcessingOutputMultipleLayers,
    QgsProcessingContext,
    QgsApplication,
    QgsProject
)
from qgis.PyQt.QtSql import *
from .tools import *
from processing.tools.postgis import uri_from_name, GeoDB
import os

class AddStyles(QgsProcessingAlgorithm):
    """

    """

    # Constants used to refer to parameters and outputs. They will be
    # used when calling the algorithm from another algorithm, or when
    # calling from the QGIS console.

    INPUT_SQL = 'INPUT_SQL'

    OUTPUT_LAYERS = 'OUTPUT_LAYERS'
    OUTPUT_STRING = 'OUTPUT_STRING'

    def name(self):
        return 'add_styles'

    def displayName(self):
        return self.tr('Load styles on layers')

    def group(self):
        return self.tr('Configuration')

    def groupId(self):
        return 'raepa_configuration'

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
                self.INPUT_SQL, 'INPUT_SQL',
                optional=True
            )
        )


        # OUTPUTS
        # Add output for message
        self.addOutput(
            QgsProcessingOutputString(
                self.OUTPUT_STRING,
                self.tr('Output message')
            )
        )

    def processAlgorithm(self, parameters, context, feedback):
        """
        Here is where the processing itself takes place.
        """
        msg = ''
        msgl = ''
        Sdir_path = os.path.join(os.path.dirname(os.path.realpath(__file__)),'..','..','qgis', 'qml')
        layers = QgsProject.instance().mapLayers()
        for lyr in layers:
            layer = context.project().mapLayer(lyr)
            if layer.isValid():
                name = layer.name()
                fileName= ''
                if name == "raepa_canalaep_l":
                    fileName = "canalisations_AEP.qml"
                if name == "raepa_canalass_l":
                    fileName = "canalisations_ASS.qml"
                if name == "raepa_ouvraep_p":
                    fileName = "ouvrages_AEP.qml"
                if name == "raepa_ouvrass_p":
                    fileName = "ouvrages_ASS.qml"
                if name == "raepa_apparaep_p":
                    fileName = "appareils_AEP.qml"
                if name == "raepa_apparass_p":
                    fileName = "appareils_ASS.qml"
                if fileName != '':
                    layer.loadNamedStyle(os.path.join(Sdir_path, fileName))
                    layer.triggerRepaint()
                    msg +=' path : '+ Sdir_path + fileName +' style: '+ layer.name()+ ' is load'
                    msg = os.path.join(Sdir_path, fileName)

            else:
                msgl += "!! "+layer.name()+" style not load !!"
        return {
            self.OUTPUT_STRING: msg
        }
