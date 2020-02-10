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
    QgsProcessingParameterVectorLayer,
    QgsProcessingParameterEnum,
    QgsProcessing,
    QgsMapLayer,
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
    STYLETYPELIST = [
        ('all', 'Tout'),
        ('actions', 'Actions'),
        ('forms', 'Forms'),
    ]

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
                optional=True,
                types=[QgsProcessing.TypeVectorPoint]
            )
        )

        self.addParameter(
            QgsProcessingParameterVectorLayer(
                self.APPARASS,
                'Couche Appareil ASS',
                optional=True,
                types=[QgsProcessing.TypeVectorPoint]
            )
        )

        self.addParameter(
            QgsProcessingParameterVectorLayer(
                self.OUVRAEP,
                'Couche Ouvrage AEP',
                optional=True,
                types=[QgsProcessing.TypeVectorPoint]
            )
        )

        self.addParameter(
            QgsProcessingParameterVectorLayer(
                self.OUVRASS,
                'Couche Ouvrage ASS',
                optional=True,
                types=[QgsProcessing.TypeVectorPoint]
            )
        )

        self.addParameter(
            QgsProcessingParameterVectorLayer(
                self.CANALAEP,
                'Couche Canalisation AEP',
                optional=True,
                types=[QgsProcessing.TypeVectorLine]
            )
        )

        self.addParameter(
            QgsProcessingParameterVectorLayer(
                self.CANALASS,
                'Couche Canalisation ASS',
                optional=True,
                types=[QgsProcessing.TypeVectorLine]
            )
        )

        self.addParameter(
            QgsProcessingParameterEnum(
                self.STYLETYPE, 'Importer uniquement les actions',
                options=[s[1] for s in self.STYLETYPELIST], allowMultiple=True,
                defaultValue=[1, 2]
            )
        )

    def processAlgorithm(self, parameters, context, feedback):

        qml_path = os.path.join(
            os.path.dirname(os.path.realpath(__file__)), '..', '..', 'qgis', 'qml')

        styles = [
            self.STYLETYPELIST[i][0] for i in sorted(self.parameterAsEnums(parameters, self.STYLETYPE, context))]

        layer = self.parameterAsVectorLayer(parameters, self.APPARAEP, context)
        self.load_qml_file(feedback, 'appareils_AEP.qml', layer, qml_path, styles)

        feedback.setProgress(int(100 * 1/6))

        layer = self.parameterAsVectorLayer(parameters, self.APPARASS, context)
        self.load_qml_file(feedback, 'appareils_ASS.qml', layer, qml_path, styles)

        feedback.setProgress(int(100 * 2/6))

        layer = self.parameterAsVectorLayer(parameters, self.OUVRAEP, context)
        self.load_qml_file(feedback, 'ouvrages_AEP.qml', layer, qml_path, styles)

        feedback.setProgress(int(100 * 3/6))

        layer = self.parameterAsVectorLayer(parameters, self.OUVRASS, context)
        self.load_qml_file(feedback, 'ouvrages_ASS.qml', layer, qml_path, styles)

        feedback.setProgress(int(100 * 4/6))

        layer = self.parameterAsVectorLayer(parameters, self.CANALAEP, context)
        self.load_qml_file(feedback, 'canalisations_AEP.qml', layer, qml_path, styles)

        feedback.setProgress(int(100 * 5/6))

        layer = self.parameterAsVectorLayer(parameters, self.CANALASS, context)
        self.load_qml_file(feedback, 'canalisations_ASS.qml', layer, qml_path, styles)

        feedback.setProgress(int(100 * 6/6))

        return {}

    @staticmethod
    def load_qml_file(feedback, file_name, layer, qml_path, styles):
        if not layer or not layer.isValid():
            return

        for s in styles:
            if s == 'all':
                layer.loadNamedStyle(os.path.join(qml_path, file_name))
                layer.triggerRepaint()
                feedback.pushInfo('QML file {} has been loaded on {} for ALL'.format(file_name, layer.name()))
                return
            elif s == 'actions':
                layer.loadNamedStyle(os.path.join(qml_path, file_name), categories=QgsMapLayer.Actions)
                feedback.pushInfo('QML file {} has been loaded on {} for ACTIONS'.format(file_name, layer.name()))
            elif s == 'forms':
                layer.loadNamedStyle(os.path.join(qml_path, file_name), categories=QgsMapLayer.Forms)
                feedback.pushInfo('QML file {} has been loaded on {} for FORMS'.format(file_name, layer.name()))

            layer.triggerRepaint()
