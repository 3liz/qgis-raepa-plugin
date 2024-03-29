__copyright__ = 'Copyright 2020, 3Liz'
__license__ = 'GPL version 3'
__email__ = 'info@3liz.org'


from qgis.core import (
    QgsExpressionContextUtils,
    QgsProcessingContext,
    QgsProcessingLayerPostProcessorInterface,
    QgsProcessingOutputMultipleLayers,
    QgsProcessingParameterEnum,
    QgsVectorLayer,
)

from raepa.qgis_plugin_tools.tools.algorithm_processing import (
    BaseProcessingAlgorithm,
)
from raepa.sql_layer import SqlLayer


class StylesPostProcessor(QgsProcessingLayerPostProcessorInterface):

    instance = None
    qml_path = None

    def postProcessLayer(self, layer: QgsVectorLayer, context, feedback):
        layer.loadNamedStyle(self.qml_path)
        layer.triggerRepaint()

    # Hack to work around sip bug!
    @staticmethod
    def create(qml_path) -> 'StylesPostProcessor':
        StylesPostProcessor.instance = StylesPostProcessor()
        StylesPostProcessor.qml_path = qml_path
        return StylesPostProcessor.instance


class AddSqlLayers(BaseProcessingAlgorithm):
    """Add layers based on SQL."""

    FILES = 'FILES'
    OUTPUT = 'OUTPUT'

    def __init__(self):
        super().__init__()
        connection_name = QgsExpressionContextUtils.globalScope().variable('raepa_connection_name')
        self.options = SqlLayer.available_files(connection_name)

    def name(self):
        return 'add_sql_layers'

    def displayName(self):
        return 'Ajouter des vues SQL'

    def group(self):
        return 'Outils'

    def groupId(self):
        return 'raepa_tools'

    def shortHelpString(self) -> str:
        return 'Ajouter des requêtes SQL dans le canevas.\n\nCes requêtes sont des fichiers dans le plugin.'

    def initAlgorithm(self, config):
        labels = [f.name for f in self.options]
        self.addParameter(
            QgsProcessingParameterEnum(
                self.FILES,
                'Requêtes',
                optional=False,
                options=labels,
                allowMultiple=True,
            )
        )

        self.addOutput(
            QgsProcessingOutputMultipleLayers(
                self.OUTPUT,
                'Sortie'
            )
        )

    def processAlgorithm(self, parameters, context, feedback):

        files = self.parameterAsEnums(parameters, self.FILES, context)
        sql_layers = [self.options[i] for i in sorted(files)]

        result = dict()
        result[self.OUTPUT] = []
        total = len(files)

        for current, sql_layer in enumerate(sql_layers):
            feedback.pushInfo('Chargement de : {}'.format(sql_layer.name))
            layer = sql_layer.vector_layer()
            context.temporaryLayerStore().addMapLayer(layer)
            context.addLayerToLoadOnCompletion(
                layer.id(),
                QgsProcessingContext.LayerDetails(
                    sql_layer.name,
                    context.project(),
                    self.OUTPUT,
                )
            )

            if sql_layer.qml:
                context.layerToLoadOnCompletionDetails(
                    layer.id()
                ).setPostProcessor(StylesPostProcessor.create(sql_layer.qml))

            result[self.OUTPUT].append(layer.id())
            feedback.setProgress(int(current / total * 100))

        return result
