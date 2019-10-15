"""Actions."""

from qgis.core import (
    QgsProject, QgsLineSymbol, QgsFeatureRequest,
    Qgis)
from qgis.utils import iface

try:
    # QGIS >= 3.8
    from qgis import processing
except ImportError:
    # QGIS < 3.8
    import processing

__copyright__ = 'Copyright 2019, 3Liz'
__license__ = 'GPL version 3'
__email__ = 'info@3liz.org'
__revision__ = '$Format:%H$'


def inverser(*args):
    id_ouvrage = args[0]
    id_layer = args[1]

    layer = QgsProject.instance().mapLayer(id_layer)

    # materialized feature in new layer
    request = QgsFeatureRequest()
    request.setFilterFids([id_ouvrage])
    mat = layer.materialize(request)

    # run the processing alg "reverse line direction"
    out = processing.run(
        "native:reverselinedirection",
        {
            'INPUT': mat,
            'OUTPUT': 'memory:test'}
    )
    vout = out['OUTPUT']
    for feat in vout.getFeatures():
        if layer.changeGeometry(id_ouvrage, feat.geometry()):
            # message
            iface.messageBar().pushMessage(
                "Line direction has been reversed",
                level=Qgis.Success,
                duration=2
            )
            iface.mapCanvas().refresh()
        else:
            iface.messageBar().pushMessage(
                "Line direction has NOT been reversed. Check if the layer is editable",
                level=Qgis.Critical,
                duration=2
            )


def annuler_la_derniere_modification(*args):
    id_ouvrage = args[0]
    id_layer = args[1]

    layer = QgsProject.instance().mapLayer(id_layer)

    # use processing alg cancel_last_modification
    processing.run(
        "raepa:cancel_last_modification",
        {
            'SOURCE_LAYER': layer,
            'SOURCE_ID': id_ouvrage
        }
    )

    # Refresh upstream and downstream
    for layername in [layer.name(), 'Canalisations']:
        gl = QgsProject.instance().mapLayersByName(layername)
        if gl:
            gl[0].triggerRepaint()


def couper_la_canalisation_sous_cet_ouvrage(*args):
    id_ouvrage = args[0]
    id_layer = args[1]

    layer = QgsProject.instance().mapLayer(id_layer)

    # Use alg to do cut_pipe_under_item
    sql = "SELECT raepa.decoupage_canalisation_par_ouvrage('{}');".format(id_ouvrage)
    processing.run(
        "raepa:execute_sql",
        {
            'INPUT_SQL': sql
        }
    )

    # Refresh layers
    for layername in [layer.name(), 'Canalisations']:
        gl = QgsProject.instance().mapLayersByName(layername)
        if gl:
            gl[0].triggerRepaint()


def parcourir_reseau_depuis_cet_ouvrage(*args):
    idouvrage = args[0]
    target_table = args[1]

    # Use alg get_downstream_route and get_upstream_route
    down = processing.run(
        "raepa:get_downstream_route",
        {
            'OUTPUT_LAYER_NAME': '',
            'SOURCE_ID': idouvrage,
            'TARGET_TABLE': target_table
        }
    )
    if down['OUTPUT_STATUS'] == 1:
        layer = down['OUTPUT_LAYER']
        layer.setName(down['OUTPUT_LAYER_RESULT_NAME'])
        symbol = QgsLineSymbol.createSimple(
            {
                'line_color': '255,50,50,255',
                'line_style': 'solid',
                'line_width': '1.8'
            }
        )
        layer.renderer().setSymbol(symbol)
        QgsProject.instance().addMapLayer(layer)


    up = processing.run(
        "raepa:get_upstream_route",
        {
            'OUTPUT_LAYER_NAME': '',
            'SOURCE_ID': idouvrage,
            'TARGET_TABLE': target_table
        }
    )
    if up['OUTPUT_STATUS'] == 1:
        layer = up['OUTPUT_LAYER']
        layer.setName(up['OUTPUT_LAYER_RESULT_NAME'])
        symbol = QgsLineSymbol.createSimple(
            {
                'line_color': '50,255,50,255',
                'line_style': 'solid',
                'line_width': '1.8'
            }
        )
        layer.renderer().setSymbol(symbol)
        QgsProject.instance().addMapLayer(layer)
