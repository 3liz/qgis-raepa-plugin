"""Dock file."""
from functools import partial
from webbrowser import open_new

from qgis.PyQt.QtWidgets import QDockWidget, QPushButton

try:
    # QGIS < 3.8
    # noinspection PyPep8Naming,PyUnresolvedReferences
    from processing import execAlgorithmDialog
except ModuleNotFoundError:
    # QGIS >= 3.8
    # noinspection PyPep8Naming,PyUnresolvedReferences
    from qgis.processing import execAlgorithmDialog

from raepa.qgis_plugin_tools.tools.resources import load_ui

DOCK_CLASS = load_ui('dock.ui')


__copyright__ = 'Copyright 2020, 3Liz'
__license__ = 'GPL version 3'
__email__ = 'info@3liz.org'


class RaepaDock(QDockWidget, DOCK_CLASS):

    def __init__(self, parent=None):
        super().__init__(parent)

        self.setupUi(self)
        self.tab_widget.setCurrentIndex(0)

        self.algorithms = [
            # Tools
            'add_sql_layers',
            'cancel_last_modification',
            'gabarits',
            'get_orientation_appareil',
            'get_network_to_vanne_from_point',
            'get_network_to_vanne_ferme_from_point',
            'get_upstream_route',
            'get_downstream_route',
            'get_network_to_vanne',
            # Import
            'import_shapefile',
            'convert_imported_data',
            'insert_converted_data',
            # Export
            'export_package',
            # Installation
            'create_database_structure',
            'upgrade_database_structure',
            # Configuration
            'load_project',
            'add_styles',
            'configure_plugin',
        ]
        for alg in self.algorithms:
            button = self.findChild(QPushButton, '{}{}'.format('button_algo_', alg))
            if not button:
                continue
            button.clicked.connect(partial(self.run_algorithm, alg))

        button = self.findChild(QPushButton, 'button_help_plugin')
        if button:
            button.clicked.connect(self.help_plugin)

    @staticmethod
    def run_algorithm(name):
        alg_name = 'raepa:{}'.format(name)
        execAlgorithmDialog(alg_name, {})

    @staticmethod
    def help_plugin():
        """
        Display the help on database structure
        """
        open_new(r'https://3liz.github.io/qgis-raepa-plugin/')
