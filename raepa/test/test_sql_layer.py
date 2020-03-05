"""Tests for SQL layers."""

import os

from qgis.testing import unittest

from ..sql_layer import SqlLayer
from ..qgis_plugin_tools.tools.resources import plugin_test_data_path

__copyright__ = 'Copyright 2020, 3Liz'
__license__ = 'GPL version 3'
__email__ = 'info@3liz.org'
__revision__ = '$Format:%H$'


class TestSqlLayer(unittest.TestCase):

    def setUp(self) -> None:
        self.directory = plugin_test_data_path('sql_layer')

    def test_list_sql_layers(self):
        """Test we can read SQL layer directory."""
        expected = [
            os.path.join(self.directory, 'layer_1.sql'),
            os.path.join(self.directory, 'layer_2.sql'),
        ]
        self.assertListEqual(
            expected,
            SqlLayer.scan_folder(self.directory))

    def test_load_sql_file(self):
        """Test loading a SQL file."""
        # Not existing
        with self.assertRaises(Exception):
            SqlLayer('/root/do_not_exist.sql', 'fake')

        # Layer 1
        sql_file = plugin_test_data_path('sql_layer', 'layer_1.sql')
        sql_layer = SqlLayer(sql_file, 'test')
        self.assertEqual('Name of the layer', sql_layer.name)
        self.assertEqual('Description of the layer', sql_layer.description)
        self.assertEqual('geom', sql_layer.geom)
        self.assertEqual('id', sql_layer.pk)
        self.assertEqual("(SELECT '1' AS id, ST_GeomFromText('POINT(0 0)') as geom)", sql_layer.sql)
        self.assertIsNone(sql_layer.qml)

        # Layer 2
        sql_file = plugin_test_data_path('sql_layer', 'layer_2.sql')
        sql_layer = SqlLayer(sql_file, 'test')
        self.assertEqual(plugin_test_data_path('sql_layer', 'layer_2.qml'), sql_layer.qml)
