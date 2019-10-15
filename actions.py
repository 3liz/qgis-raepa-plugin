"""Actions."""

from qgis.core import QgsProject, QgsLineSymbol

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


def parcourir_reseau_depuis_cet_ouvrage(*args):
    # Identifiant de l'ouvrage
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
