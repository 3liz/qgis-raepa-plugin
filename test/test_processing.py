"""Tests for Processing algorithms."""

from qgis.PyQt.QtCore import QCoreApplication, QSettings
from qgis.core import (
    edit,
    QgsApplication,
    QgsProject,
    QgsVectorLayer,
    QgsFeature,
    QgsExpression,
    QgsExpressionContext,
    QgsExpressionContextUtils,
    QgsSingleSymbolRenderer, QgsRuleBasedRenderer)

from qgis.testing import unittest, start_app
from processing.core.Processing import Processing

try:
    # QGIS >= 3.8
    from qgis import processing
except ImportError:
    # QGIS < 3.8
    import processing

from ..processing.provider import RaepaProvider
from ..qgis_plugin_tools.tools.resources import plugin_test_data_path

__copyright__ = 'Copyright 2019, 3Liz'
__license__ = 'GPL version 3'
__email__ = 'info@3liz.org'
__revision__ = '$Format:%H$'


class TestProcessing(unittest.TestCase):

    def test_add_styles(self):
        """Test we can add styles and actions from Processing algorithm."""
        provider = RaepaProvider()
        QgsApplication.processingRegistry().addProvider(provider)

        lines_layer = QgsVectorLayer(plugin_test_data_path('lines.geojson'), 'lines', 'ogr')
        self.assertTrue(lines_layer.isValid())
        self.assertIsInstance(lines_layer.renderer(), QgsSingleSymbolRenderer)
        params = {
            'APPARAEP': '',
            'APPARASS': '',
            'OUVRAEP': '',
            'OUVRASS': '',
            'CANALAEP': lines_layer,
            'CANALASS': '',
            'STYLETYPE': [1, 2]}

        processing.run('raepa:add_styles', params)
        self.assertIsInstance(lines_layer.renderer(), QgsRuleBasedRenderer, 'Le renderer n\'est pas correct.')
