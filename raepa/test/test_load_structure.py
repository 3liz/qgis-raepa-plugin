"""Tests for Processing algorithms."""

import os
import time

import processing
import psycopg2

from qgis.core import (
    QgsApplication,
    QgsCoordinateReferenceSystem,
    QgsProcessingException,
)
from qgis.testing import unittest

from raepa.processing.provider import RaepaProvider as ProcessingProvider
from raepa.qgis_plugin_tools.tools.database import available_migrations
from raepa.qgis_plugin_tools.tools.logger_processing import (
    LoggerProcessingFeedBack,
)

__copyright__ = "Copyright 2020, 3Liz"
__license__ = "GPL version 3"
__email__ = "info@3liz.org"

SCHEMA = "raepa"
VERSION = "0.2.0"


class TestProcessing(unittest.TestCase):
    def setUp(self) -> None:
        self.connection = psycopg2.connect(
            user="docker", password="docker", host="db", port="5432", database="gis"
        )
        self.cursor = self.connection.cursor()

    def tearDown(self) -> None:
        del self.cursor
        del self.connection
        time.sleep(1)

    def test_load_structure_with_migration(self):
        """Test we can load the PostGIS structure with migrations."""
        provider = ProcessingProvider()
        registry = QgsApplication.processingRegistry()
        if not registry.providerById(provider.id()):
            registry.addProvider(provider)

        feedback = LoggerProcessingFeedBack()
        params = {
            'OVERRIDE': True,
            'ADD_AUDIT': True,
            'SRID': QgsCoordinateReferenceSystem('EPSG:32620'),
            'NOM': 'CC de Test',
            'SIREN': '123456789',
            'CODE': 'cat'
        }

        os.environ["TEST_DATABASE_INSTALL_{}".format(SCHEMA.upper())] = VERSION
        alg = "{}:create_database_structure".format(provider.id())
        processing_output = processing.run(alg, params, feedback=feedback)

        del os.environ["TEST_DATABASE_INSTALL_{}".format(SCHEMA.upper())]

        self.cursor.execute(
            "SELECT table_name FROM information_schema.tables WHERE table_schema = '{}'".format(
                SCHEMA
            )
        )
        records = self.cursor.fetchall()
        result = [r[0] for r in records]
        # Expected tables in the specific version written above at the beginning of the test.
        # DO NOT CHANGE HERE, change below at the end of the test.
        expected = [
            'affleurant_pcrs',
            'commune',
            'sys_liste_table',
            'sys_organisme_gestionnaire',
            'sys_structure_metadonnee',
            'val_raepa_fonc_app_ae',
            'v_canalisation_avec_z_manquant',
            'v_canalisation_avec_zaval_manquant',
            'v_canalisation_branchement',
            'v_canalisation_sans_ouvrage',
            'raepa_apparaep_p',
            'val_raepa_fonc_app_ass',
            'raepa_apparass_p',
            'val_raepa_cat_canal_ae',
            'val_raepa_fonc_canal_ae',
            'raepa_canalaep_l',
            '_val_raepa_forme_canal_ass',
            '_val_raepa_precision_annee',
            'val_raepa_cat_canal_ass',
            'val_raepa_fonc_canal_ass',
            'val_raepa_materiau',
            'val_raepa_mode_circulation',
            'raepa_canalass_l',
            'val_raepa_qualite_geoloc',
            'val_raepa_typ_reseau_ass',
            'val_raepa_fonc_ouv_ae',
            'raepa_ouvraep_p',
            'val_raepa_qualite_anpose',
            'val_raepa_fonc_ouv_ass',
            'raepa_ouvrass_p',
            'val_raepa_type_defaillance',
            'raepa_reparaep_p',
            'val_raepa_support_reparation',
            '_val_raepa_etat_canal_ass',
            'raepa_reparass_p',
            '_val_raepa_type_intervention_ass',
        ]

        self.assertCountEqual(expected, result, result)
        expected = "*** LA STRUCTURE {} A BIEN ÉTÉ CRÉÉE '{}'***".format(SCHEMA, VERSION)
        self.assertEqual(expected, processing_output["OUTPUT_STRING"])

        sql = """
            SELECT version
            FROM {}.sys_structure_metadonnee
            ORDER BY date_ajout DESC
            LIMIT 1;
        """.format(
            SCHEMA
        )
        self.cursor.execute(sql)
        record = self.cursor.fetchone()
        self.assertEqual(VERSION, record[0])

        feedback.pushDebugInfo("Update the database")
        params = {
            "CONNECTION_NAME": "test",
            "RUN_MIGRATIONS": True,
            'SRID': QgsCoordinateReferenceSystem('EPSG:32620'),
        }
        alg = "{}:upgrade_database_structure".format(provider.id())
        results = processing.run(alg, params, feedback=feedback)
        self.assertEqual(1, results["OUTPUT_STATUS"], 1)
        self.assertEqual(
            "*** LA STRUCTURE A BIEN ÉTÉ MISE À JOUR SUR LA BASE DE DONNÉES ***",
            results["OUTPUT_STRING"],
        )

        sql = """
            SELECT version
            FROM {}.sys_structure_metadonnee
            ORDER BY date_ajout DESC
            LIMIT 1;
        """.format(
            SCHEMA
        )
        self.cursor.execute(sql)
        record = self.cursor.fetchone()

        migrations = available_migrations(000000)
        last_migration = migrations[-1]
        metadata_version = (
            last_migration.replace("upgrade_to_", "").replace(".sql", "").strip()
        )
        self.assertEqual(metadata_version, record[0])

        self.cursor.execute(
            "SELECT table_name FROM information_schema.tables WHERE table_schema = '{}'".format(
                SCHEMA
            )
        )
        records = self.cursor.fetchall()
        result = [r[0] for r in records]
        expected = [
            'commune',
            'affleurant_pcrs',
            'sys_liste_table',
            'sys_organisme_gestionnaire',
            'sys_structure_metadonnee',
            'val_raepa_fonc_app_ae',
            'v_canalisation_avec_z_manquant',
            'v_canalisation_avec_zaval_manquant',
            'v_canalisation_branchement',
            'v_canalisation_sans_ouvrage',
            'val_raepa_fonc_app_ass',
            'raepa_apparaep_p',
            'raepa_apparass_p',
            'val_raepa_cat_canal_ae',
            'val_raepa_fonc_canal_ae',
            '_val_raepa_forme_canal_ass',
            'raepa_canalaep_l',
            '_val_raepa_precision_annee',
            'val_raepa_cat_canal_ass',
            'val_raepa_fonc_canal_ass',
            'val_raepa_materiau',
            'val_raepa_mode_circulation',
            'val_raepa_fonc_ouv_ae',
            'raepa_canalass_l',
            'raepa_ouvraep_p',
            'val_raepa_fonc_ouv_ass',
            'val_raepa_qualite_anpose',
            'val_raepa_qualite_geoloc',
            'val_raepa_typ_reseau_ass',
            '_val_raepa_etat_canal_ass',
            '_val_raepa_type_intervention_ass',
            'raepa_ouvrass_p',
            'val_raepa_type_defaillance',
            'val_raepa_support_reparation',
            'raepa_reparaep_p',
            'raepa_reparass_p',
        ]
        self.assertCountEqual(expected, result, result)

    def test_load_structure_without_migrations(self):
        """Test we can load the PostGIS structure without migrations."""
        provider = ProcessingProvider()
        registry = QgsApplication.processingRegistry()
        if not registry.providerById(provider.id()):
            registry.addProvider(provider)

        feedback = LoggerProcessingFeedBack()
        self.cursor.execute("SELECT version();")
        record = self.cursor.fetchone()
        feedback.pushInfo("PostgreSQL version : {}".format(record[0]))

        self.cursor.execute("SELECT PostGIS_Version();")
        record = self.cursor.fetchone()
        feedback.pushInfo("PostGIS version : {}".format(record[0]))

        params = {
            'OVERRIDE': True,
            'ADD_AUDIT': True,
            'SRID': QgsCoordinateReferenceSystem('EPSG:32620'),
            'NOM': 'CC de Test',
            'SIREN': '123456789',
            'CODE': 'cat'
        }

        alg = "{}:create_database_structure".format(provider.id())
        processing.run(alg, params, feedback=feedback)

        self.cursor.execute(
            "SELECT table_name FROM information_schema.tables WHERE table_schema = '{}'".format(
                SCHEMA
            )
        )
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
        self.assertCountEqual(expected, result, result)

        feedback.pushDebugInfo("Relaunch the algorithm without override")
        params = {
            'OVERRIDE': False,
            'ADD_AUDIT': True,
            'SRID': QgsCoordinateReferenceSystem('EPSG:32620'),
            'NOM': 'CC de Test',
            'SIREN': '123456789',
            'CODE': 'cat'
        }

        with self.assertRaises(QgsProcessingException):
            processing.run(alg, params, feedback=feedback)

        expected = (
            "Unable to execute algorithm\nLe schéma raepa existe déjà dans la base de données ! Si vous souhaitez "
            "réellement supprimer et recréer (et perdre les données existantes), cochez la case \"Écrasement\"."
        )
        self.assertEqual(expected, feedback.last, feedback.last)

        feedback.pushDebugInfo("Update the database")
        params = {
            "CONNECTION_NAME": "test",
            "RUN_MIGRATIONS": True,
            'SRID': QgsCoordinateReferenceSystem('EPSG:32620'),
        }
        alg = "{}:upgrade_database_structure".format(provider.id())
        results = processing.run(alg, params, feedback=feedback)
        self.assertEqual(1, results["OUTPUT_STATUS"], 1)
        self.assertEqual(
            "La version de la base de données et du plugin sont les mêmes. Aucune mise-à-jour "
            "n'est nécessaire",
            results["OUTPUT_STRING"],
        )
