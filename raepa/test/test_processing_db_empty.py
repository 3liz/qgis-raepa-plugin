"""Tests for Processing algorithms."""
import psycopg2

from qgis.core import (
    Qgis,
    QgsApplication,
    QgsVectorLayer,
    QgsExpressionContextUtils,
    QgsCoordinateReferenceSystem,
)
from qgis.testing import unittest

if Qgis.QGIS_VERSION_INT >= 30800:
    from qgis import processing
else:
    import processing

from ..processing.provider import RaepaProvider
from ..qgis_plugin_tools.tools.logger_processing import LoggerProcessingFeedBack
from ..qgis_plugin_tools.tools.resources import plugin_test_data_path

__copyright__ = 'Copyright 2019, 3Liz'
__license__ = 'GPL version 3'
__email__ = 'info@3liz.org'
__revision__ = '$Format:%H$'


class TestProcessing(unittest.TestCase):

    def setUp(self) -> None:
        self.connection = psycopg2.connect(
            user='docker',
            password='docker',
            host='db',
            port='5432',
            database='gis'
        )
        self.current_value = QgsExpressionContextUtils.globalScope().variable('raepa_connection_name')
        QgsExpressionContextUtils.setGlobalVariable('raepa_connection_name', 'test')

        self.cursor = self.connection.cursor()

        self.provider = RaepaProvider()
        registry = QgsApplication.processingRegistry()
        if not registry.providerById(self.provider.id()):
            registry.addProvider(self.provider)

    def tearDown(self) -> None:
        QgsApplication.processingRegistry().removeProvider(self.provider)
        QgsExpressionContextUtils.setGlobalVariable('raepa_connection_name', self.current_value)

    def test_load_structure(self):
        """Test load structure."""
        feedback = LoggerProcessingFeedBack()
        params = {
            'OVERRIDE': True,
            'ADD_AUDIT': True,
            'SRID': QgsCoordinateReferenceSystem('EPSG:32620'),
            'NOM': 'CC de Test',
            'SIREN': '123456789',
            'CODE': 'cat'
        }
        processing.run('raepa:create_database_structure', params, feedback=feedback)

        self.cursor.execute('SELECT table_name FROM information_schema.tables WHERE table_schema = \'raepa\'')
        records = self.cursor.fetchall()
        result = [r[0] for r in records]
        expected = [
            '_val_raepa_etat_canal_ass',
            '_val_raepa_forme_canal_ass',
            '_val_raepa_precision_annee',
            '_val_raepa_type_intervention_ass',
            'affleurant_pcrs',
            'commune',
            'raepa_apparaep_p',
            'raepa_apparass_p',
            'raepa_canalaep_l',
            'raepa_canalass_l',
            'raepa_ouvraep_p',
            'raepa_ouvrass_p',
            'raepa_reparaep_p',
            'raepa_reparass_p',
            'sys_liste_table',
            'sys_organisme_gestionnaire',
            'sys_structure_metadonnee',
            'v_canalisation_avec_z_manquant',
            'v_canalisation_avec_zaval_manquant',
            'v_canalisation_branchement',
            'v_canalisation_sans_ouvrage',
            'val_raepa_cat_canal_ae',
            'val_raepa_cat_canal_ass',
            'val_raepa_fonc_app_ae',
            'val_raepa_fonc_app_ass',
            'val_raepa_fonc_canal_ae',
            'val_raepa_fonc_canal_ass',
            'val_raepa_fonc_ouv_ae',
            'val_raepa_fonc_ouv_ass',
            'val_raepa_materiau',
            'val_raepa_mode_circulation',
            'val_raepa_qualite_anpose',
            'val_raepa_qualite_geoloc',
            'val_raepa_support_reparation',
            'val_raepa_typ_reseau_ass',
            'val_raepa_type_defaillance',
        ]
        self.assertCountEqual(expected, result)

    @unittest.skip
    def test_sql_layers(self):
        """Test for SQL layers."""
        params = {
            'FILES': '',
        }
        processing.run('raepa:add_sql_layers', params)

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
