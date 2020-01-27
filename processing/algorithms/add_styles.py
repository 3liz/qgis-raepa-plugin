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

__copyright__ = 'Copyright 2020, 3Liz'
__license__ = 'GPL version 3'
__email__ = 'info@3liz.org'
__revision__ = '$Format:%H$'

from qgis.core import (
    QgsProcessingAlgorithm,
    QgsProcessingOutputString,
    QgsProcessingParameterVectorLayer,
    QgsProcessingParameterBoolean,
    QgsProcessing
)
from .tools import *
import os


class AddStyles(QgsProcessingAlgorithm):
    """Add styles algorithm."""

    APPARAEP = 'APPARAEP'
    APPARASS = 'APPARASS'
    OUVRAEP = 'OUVRAEP'
    OUVRASS = 'OUVRASS'
    CANALAEP = 'CANALAEP'
    CANALASS = 'CANALASS'
    STYLETYPE = 'STYLETYPE'
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
        self.addParameter(
            QgsProcessingParameterVectorLayer(
                self.APPARAEP,
                self.tr('Couche Appareil AEP'),
                types=[QgsProcessing.TypeVector]
            )
        )

        self.addParameter(
            QgsProcessingParameterVectorLayer(
                self.APPARASS,
                self.tr('Couche Appareil ASS'),
                types=[QgsProcessing.TypeVector]
            )
        )

        self.addParameter(
            QgsProcessingParameterVectorLayer(
                self.OUVRAEP,
                self.tr('Couche Ouvrage AEP'),
                types=[QgsProcessing.TypeVector]
            )
        )

        self.addParameter(
            QgsProcessingParameterVectorLayer(
                self.OUVRASS,
                self.tr('Couche Ouvrage ASS'),
                types=[QgsProcessing.TypeVector]
            )
        )

        self.addParameter(
            QgsProcessingParameterVectorLayer(
                self.CANALAEP,
                self.tr('Couche Canalisation AEP'),
                types=[QgsProcessing.TypeVector]
            )
        )

        self.addParameter(
            QgsProcessingParameterVectorLayer(
                self.CANALASS,
                self.tr('Couche Canalisation ASS'),
                types=[QgsProcessing.TypeVector]
            )
        )

        self.addParameter(
            QgsProcessingParameterBoolean(
                self.STYLETYPE, self.tr('Importer uniquement les actions'),
                optional=False
            )
        )


        self.addOutput(
            QgsProcessingOutputString(
                self.OUTPUT_STRING,
                self.tr('Output message')
            )
        )

    def processAlgorithm(self, parameters, context, feedback):
        msg = ''
        msgl = ''
        Sdir_path = os.path.join(os.path.dirname(os.path.realpath(__file__)), '..', '..', 'qgis', 'qml')
        layer = self.parameterAsVectorLayer(parameters, self.APPARAEP, context)
        style = self.parameterAsBool(parameters, self.STYLETYPE, context)
        if layer.isValid():
            if style:
                fileName = 'actions_appareils_AEP.qml'
            else:
                fileName = 'appareils_AEP.qml'
            layer.loadNamedStyle(os.path.join(Sdir_path, fileName))
            layer.triggerRepaint()
            msg +=' path : '+ Sdir_path + fileName +' style: '+ layer.name()+ ' is load'
            msg = os.path.join(Sdir_path, fileName)
        else:
            msgl += "!! "+layer.name()+" style not load !!"

        layer = self.parameterAsVectorLayer(parameters, self.APPARASS, context)
        if layer.isValid():
            if style:
                fileName = 'actions_appareils_ASS.qml'
            else:
                fileName = 'appareils_ASS.qml'
            layer.loadNamedStyle(os.path.join(Sdir_path, fileName))
            layer.triggerRepaint()
            msg +=' path : '+ Sdir_path + fileName +' style: '+ layer.name()+ ' is load'
            msg = os.path.join(Sdir_path, fileName)
        else:
            msgl += "!! "+layer.name()+" style not load !!"

        layer = self.parameterAsVectorLayer(parameters, self.OUVRAEP, context)
        if layer.isValid():
            if style:
                fileName = 'actions_ouvrages_AEP.qml'
            else:
                fileName = 'ouvrages_AEP.qml'
            layer.loadNamedStyle(os.path.join(Sdir_path, fileName))
            layer.triggerRepaint()
            msg +=' path : '+ Sdir_path + fileName +' style: '+ layer.name()+ ' is load'
            msg = os.path.join(Sdir_path, fileName)
        else:
            msgl += "!! "+layer.name()+" style not load !!"

        layer = self.parameterAsVectorLayer(parameters, self.OUVRASS, context)
        if layer.isValid():
            if style:
                fileName = 'actions_ouvrages_ASS.qml'
            else:
                fileName = 'ouvrages_ASS.qml'
            layer.loadNamedStyle(os.path.join(Sdir_path, fileName))
            layer.triggerRepaint()
            msg +=' path : '+ Sdir_path + fileName +' style: '+ layer.name()+ ' is load'
            msg = os.path.join(Sdir_path, fileName)
        else:
            msgl += "!! "+layer.name()+" style not load !!"

        layer = self.parameterAsVectorLayer(parameters, self.CANALAEP, context)
        if layer.isValid():
            if style:
                fileName = 'actions_canalisations_AEP.qml'
            else:
                fileName = 'canalisations_AEP.qml'
            layer.loadNamedStyle(os.path.join(Sdir_path, fileName))
            layer.triggerRepaint()
            msg +=' path : '+ Sdir_path + fileName +' style: '+ layer.name()+ ' is load'
            msg = os.path.join(Sdir_path, fileName)
        else:
            msgl += "!! "+layer.name()+" style not load !!"

        layer = self.parameterAsVectorLayer(parameters, self.CANALASS, context)
        if layer.isValid():
            if style:
                fileName = 'actions_canalisation_ASS.qml'
            else:
                fileName = 'canalisations_ASS.qml'
            layer.loadNamedStyle(os.path.join(Sdir_path, fileName))
            layer.triggerRepaint()
            msg +=' path : '+ Sdir_path + fileName +' style: '+ layer.name()+ ' is load'
            msg = os.path.join(Sdir_path, fileName)
        else:
            msgl += "!! "+layer.name()+" style not load !!"

        return {
            self.OUTPUT_STRING: msg + msgl
        }
