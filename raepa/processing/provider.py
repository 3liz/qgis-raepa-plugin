__copyright__ = 'Copyright 2020, 3Liz'
__license__ = 'GPL version 3'
__email__ = 'info@3liz.org'

from qgis.core import QgsProcessingProvider
from qgis.PyQt.QtGui import QIcon

from raepa.processing.algorithms.add_styles import AddStyles
from raepa.processing.algorithms.cancel_last_modification import (
    CancelLastModification,
)
from raepa.processing.algorithms.configure_plugin import ConfigurePlugin
from raepa.processing.algorithms.convert_imported_data import (
    ConvertImportedData,
)
from raepa.processing.algorithms.create_database_structure import (
    CreateDatabaseStructure,
)
from raepa.processing.algorithms.execute_sql import ExecuteSql
from raepa.processing.algorithms.export_package import ExportPackage
from raepa.processing.algorithms.gabarits_aep_ass import ExportGabarits
from raepa.processing.algorithms.get_downstream_route import GetDownstreamRoute
from raepa.processing.algorithms.get_network_to_vanne import GetNetworkToVanne
from raepa.processing.algorithms.get_network_to_vanne_ferme_from_point import (
    GetNetworkToVanneFermeFromPoint,
)
from raepa.processing.algorithms.get_network_to_vanne_from_point import (
    GetNetworkToVanneFromPoint,
)
from raepa.processing.algorithms.get_orientation_appareil import (
    GetOrientationAppareil,
)
from raepa.processing.algorithms.get_upstream_route import GetUpstreamRoute
from raepa.processing.algorithms.import_shapefile import ImportShapefile
from raepa.processing.algorithms.insert_converted_data import (
    InsertConvertedData,
)
from raepa.processing.algorithms.load_project import LoadProject
from raepa.processing.algorithms.sql_layers import AddSqlLayers
from raepa.processing.algorithms.upgrade_database_structure import (
    UpgradeDatabaseStructure,
)
from raepa.qgis_plugin_tools.tools.resources import resources_path


class RaepaProvider(QgsProcessingProvider):

    def icon(self) -> QIcon:
        return QIcon(resources_path('icons/icon.png'))

    def loadAlgorithms(self):
        self.addAlgorithm(ExecuteSql())
        self.addAlgorithm(AddSqlLayers())
        self.addAlgorithm(AddStyles())
        self.addAlgorithm(CancelLastModification())
        self.addAlgorithm(ConfigurePlugin())
        self.addAlgorithm(ConvertImportedData())
        self.addAlgorithm(CreateDatabaseStructure())
        self.addAlgorithm(ExportGabarits())
        self.addAlgorithm(ExportPackage())
        self.addAlgorithm(GetDownstreamRoute())
        self.addAlgorithm(GetNetworkToVanne())
        self.addAlgorithm(GetNetworkToVanneFermeFromPoint())
        self.addAlgorithm(GetNetworkToVanneFromPoint())
        self.addAlgorithm(GetOrientationAppareil())
        self.addAlgorithm(GetUpstreamRoute())
        self.addAlgorithm(ImportShapefile())
        self.addAlgorithm(InsertConvertedData())
        self.addAlgorithm(LoadProject())
        self.addAlgorithm(UpgradeDatabaseStructure())

    def id(self):
        return 'raepa'

    def name(self):
        return 'RAEPA'

    def longName(self):
        return 'Réseaux d\'Adduction d\'Eau Potable et d\'Assainissement'
