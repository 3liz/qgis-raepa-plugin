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
        return 'Charger les styles des couches'

    def group(self):
        return 'Configuration'

    def groupId(self):
        return 'raepa_configuration'

    def shortHelpString(self) -> str:
        return 'Ajoute les styles et/ou les actions par défaut pour chacune des couches.'

    def createInstance(self):
        return self.__class__()

    def initAlgorithm(self, config):
        self.addParameter(
            QgsProcessingParameterVectorLayer(
                self.APPARAEP,
                'Couche Appareil AEP',
                types=[QgsProcessing.TypeVector]
            )
        )

        self.addParameter(
            QgsProcessingParameterVectorLayer(
                self.APPARASS,
                'Couche Appareil ASS',
                types=[QgsProcessing.TypeVector]
            )
        )

        self.addParameter(
            QgsProcessingParameterVectorLayer(
                self.OUVRAEP,
                'Couche Ouvrage AEP',
                types=[QgsProcessing.TypeVector]
            )
        )

        self.addParameter(
            QgsProcessingParameterVectorLayer(
                self.OUVRASS,
                'Couche Ouvrage ASS',
                types=[QgsProcessing.TypeVector]
            )
        )

        self.addParameter(
            QgsProcessingParameterVectorLayer(
                self.CANALAEP,
                'Couche Canalisation AEP',
                types=[QgsProcessing.TypeVector]
            )
        )

        self.addParameter(
            QgsProcessingParameterVectorLayer(
                self.CANALASS,
                'Couche Canalisation ASS',
                types=[QgsProcessing.TypeVector]
            )
        )

        self.addParameter(
            QgsProcessingParameterBoolean(
                self.STYLETYPE, 'Importer uniquement les actions',
                optional=False
            )
        )


        self.addOutput(
            QgsProcessingOutputString(
                self.OUTPUT_STRING,
                'Message de sortie'
            )
        )

    def processAlgorithm(self, parameters, context, feedback):
        msg = ''
        msgl = ''
        Sdir_path = os.path.join(os.path.dirname(os.path.realpath(__file__)), '..', '..', 'qgis', 'qml')
        layer = self.parameterAsVectorLayer(parameters, self.APPARAEP, context)
        style = self.parameterAsBool(parameters, self.STYLETYPE, context)
        if layer.isValid():
            fileName = 'appareils_AEP.qml'
            if style:
                fileName = 'actions_appareils_AEP.qml'
            layer.loadNamedStyle(os.path.join(Sdir_path, fileName))
            layer.triggerRepaint()
            msg += ' path : ' + Sdir_path + fileName + ' style: ' + layer.name() + ' is load'
            msg = os.path.join(Sdir_path, fileName)
        else:
            msgl += "!! "+layer.name()+" style not load !!"

        layer = self.parameterAsVectorLayer(parameters, self.APPARASS, context)
        if layer.isValid():
            fileName = 'appareils_ASS.qml'
            if style:
                fileName = 'actions_appareils_ASS.qml'
            layer.loadNamedStyle(os.path.join(Sdir_path, fileName))
            layer.triggerRepaint()
            msg += ' path : ' + Sdir_path + fileName + ' style: ' + layer.name() + ' is load'
            msg = os.path.join(Sdir_path, fileName)
        else:
            msgl += "!! "+layer.name()+" style not load !!"

        layer = self.parameterAsVectorLayer(parameters, self.OUVRAEP, context)
        if layer.isValid():
            fileName = 'ouvrages_AEP.qml'
            if style:
                fileName = 'actions_ouvrages_AEP.qml'
            layer.loadNamedStyle(os.path.join(Sdir_path, fileName))
            layer.triggerRepaint()
            msg += ' path : ' + Sdir_path + fileName + ' style: ' + layer.name() + ' is load'
            msg = os.path.join(Sdir_path, fileName)
        else:
            msgl += "!! "+layer.name()+" style not load !!"

        layer = self.parameterAsVectorLayer(parameters, self.OUVRASS, context)
        if layer.isValid():
            fileName = 'ouvrages_ASS.qml'
            if style:
                fileName = 'actions_ouvrages_ASS.qml'
            layer.loadNamedStyle(os.path.join(Sdir_path, fileName))
            layer.triggerRepaint()
            msg += ' path : ' + Sdir_path + fileName + ' style: ' + layer.name() + ' is load'
            msg = os.path.join(Sdir_path, fileName)
        else:
            msgl += "!! "+layer.name()+" style not load !!"

        layer = self.parameterAsVectorLayer(parameters, self.CANALAEP, context)
        if layer.isValid():
            fileName = 'canalisations_AEP.qml'
            if style:
                fileName = 'actions_canalisations_AEP.qml'
            layer.loadNamedStyle(os.path.join(Sdir_path, fileName))
            layer.triggerRepaint()
            msg += ' path : ' + Sdir_path + fileName + ' style: ' + layer.name() + ' is load'
            msg = os.path.join(Sdir_path, fileName)
        else:
            msgl += "!! "+layer.name()+" style not load !!"

        layer = self.parameterAsVectorLayer(parameters, self.CANALASS, context)
        if layer.isValid():
            fileName = 'canalisations_ASS.qml'
            if style:
                fileName = 'actions_canalisation_ASS.qml'
            layer.loadNamedStyle(os.path.join(Sdir_path, fileName))
            layer.triggerRepaint()
            msg += ' path : ' + Sdir_path + fileName + ' style: ' + layer.name() + ' is load'
            msg = os.path.join(Sdir_path, fileName)
        else:
            msgl += "!! "+layer.name()+" style not load !!"

        return {
            self.OUTPUT_STRING: msg + msgl
        }
