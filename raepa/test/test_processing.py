"""Tests for Processing without database"""

import processing

from qgis.core import QgsVectorLayer
from qgis.testing import unittest

from ..qgis_plugin_tools.tools.resources import plugin_test_data_path

__copyright__ = 'Copyright 2020, 3Liz'
__license__ = 'GPL version 3'
__email__ = 'info@3liz.org'
__revision__ = '$Format:%H$'


class TestProcessingWithoutDatabase(unittest.TestCase):

    def test_add_styles(self):
        """Test we can add styles and actions from Processing algorithm."""
        lines_layer = QgsVectorLayer(plugin_test_data_path('lines.geojson'), 'lines', 'ogr')
        self.assertTrue(lines_layer.isValid())
        self.assertEqual(len(lines_layer.actions().actions()), 0)
        params = {
            'APPARAEP': '',
            'APPARASS': '',
            'OUVRAEP': '',
            'OUVRASS': '',
            'CANALAEP': lines_layer,
            'CANALASS': '',
            'STYLETYPE': [1, 2]
        }

        processing.run('raepa:add_styles', params)
        self.assertEqual(len(lines_layer.actions().actions()), 5)
