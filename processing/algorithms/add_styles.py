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
    QgsProcessingParameterEnum,
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
    STYLETYPELIST = [
        ('all', 'Tout'),
        ('actions', 'Actions'),
        ('forms', 'Forms'),
    ]
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


        self.addOutput(
            QgsProcessingOutputString(
                self.OUTPUT_STRING,
                'Message de sortie'
            )
        )

    def processAlgorithm(self, parameters, context, feedback):
        msg = []
        msgl = []
        Sdir_path = os.path.join(os.path.dirname(os.path.realpath(__file__)), '..', '..', 'qgis', 'qml')

        styles = [
            self.STYLETYPELIST[i][0] for i in sorted(self.parameterAsEnums(parameters, self.STYLETYPE, context))]

        layer = self.parameterAsVectorLayer(parameters, self.APPARAEP, context)
        if layer and layer.isValid():
            fileNames = []
            for s in styles:
                fileName = 'appareils_AEP.qml'
                if s == 'all':
                    fileNames = [fileName]
                    break
                else:
                    fileNames.append(s+'_'+fileName)
            for fileName in fileNames:
                layer.loadNamedStyle(os.path.join(Sdir_path, fileName))
                layer.triggerRepaint()
                feed = ' QML file ' + fileName + ' has been loaded on ' + layer.name()
                feedback.pushInfo(feed)
                msg.append(feed)
        else:
            feed = "!! " + self.APPARAEP + " not valid, style not loads !!"
            feedback.reportError(feed)
            msgl.append(feed)

        feedback.setProgress(int(100 * 1/6))

        layer = self.parameterAsVectorLayer(parameters, self.APPARASS, context)
        if layer and layer.isValid():
            fileNames = []
            for s in styles:
                fileName = 'appareils_ASS.qml'
                if s == 'all':
                    fileNames = [fileName]
                    break
                else:
                    fileNames.append(s+'_'+fileName)
            for fileName in fileNames:
                layer.loadNamedStyle(os.path.join(Sdir_path, fileName))
                layer.triggerRepaint()
                feed = ' QML file ' + fileName + ' has been loaded on ' + layer.name()
                feedback.pushInfo(feed)
                msg.append(feed)
        else:
            feed = "!! " + self.APPARASS + " not valid, style not loads !!"
            feedback.reportError(feed)
            msgl.append(feed)

        feedback.setProgress(int(100 * 2/6))

        layer = self.parameterAsVectorLayer(parameters, self.OUVRAEP, context)
        if layer and layer.isValid():
            fileNames = []
            for s in styles:
                fileName = 'ouvrages_AEP.qml'
                if s == 'all':
                    fileNames = [fileName]
                    break
                else:
                    fileNames.append(s+'_'+fileName)
            for fileName in fileNames:
                layer.loadNamedStyle(os.path.join(Sdir_path, fileName))
                layer.triggerRepaint()
                feed = ' QML file ' + fileName + ' has been loaded on ' + layer.name()
                feedback.pushInfo(feed)
                msg.append(feed)
        else:
            feed = "!! " + self.OUVRAEP + " not valid, style not loads !!"
            feedback.reportError(feed)
            msgl.append(feed)

        feedback.setProgress(int(100 * 3/6))

        layer = self.parameterAsVectorLayer(parameters, self.OUVRASS, context)
        if layer and layer.isValid():
            fileNames = []
            for s in styles:
                fileName = 'ouvrages_ASS.qml'
                if s == 'all':
                    fileNames = [fileName]
                    break
                else:
                    fileNames.append(s+'_'+fileName)
            for fileName in fileNames:
                layer.loadNamedStyle(os.path.join(Sdir_path, fileName))
                layer.triggerRepaint()
                feed = ' QML file ' + fileName + ' has been loaded on ' + layer.name()
                feedback.pushInfo(feed)
                msg.append(feed)
        else:
            feed = "!! " + self.OUVRASS + " not valid, style not loads !!"
            feedback.reportError(feed)
            msgl.append(feed)

        feedback.setProgress(int(100 * 4/6))

        layer = self.parameterAsVectorLayer(parameters, self.CANALAEP, context)
        if layer and layer.isValid():
            fileNames = []
            for s in styles:
                fileName = 'canalisations_AEP.qml'
                if s == 'all':
                    fileNames = [fileName]
                    break
                else:
                    fileNames.append(s+'_'+fileName)
            for fileName in fileNames:
                layer.loadNamedStyle(os.path.join(Sdir_path, fileName))
                layer.triggerRepaint()
                feed = ' QML file ' + fileName + ' has been loaded on ' + layer.name()
                feedback.pushInfo(feed)
                msg.append(feed)
        else:
            feed = "!! " + self.CANALAEP + " not valid, style not loads !!"
            feedback.reportError(feed)
            msgl.append(feed)

        feedback.setProgress(int(100 * 5/6))

        layer = self.parameterAsVectorLayer(parameters, self.CANALASS, context)
        if layer and layer.isValid():
            fileNames = []
            for s in styles:
                fileName = 'canalisations_ASS.qml'
                if s == 'all':
                    fileNames = [fileName]
                    break
                else:
                    fileNames.append(s+'_'+fileName)
            for fileName in fileNames:
                layer.loadNamedStyle(os.path.join(Sdir_path, fileName))
                layer.triggerRepaint()
                feed = ' QML file ' + fileName + ' has been loaded on ' + layer.name()
                feedback.pushInfo(feed)
                msg.append(feed)
        else:
            feed = "!! " + self.CANALASS + " not valid, style not loads !!"
            feedback.reportError(feed)
            msgl.append(feed)

        feedback.setProgress(int(100 * 6/6))

        return {
            self.OUTPUT_STRING: '\n'.join(msg + msgl)
        }
