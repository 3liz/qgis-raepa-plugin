__copyright__ = 'Copyright 2020, 3Liz'
__license__ = 'GPL version 3'
__email__ = 'info@3liz.org'
__revision__ = '$Format:%H$'

from qgis.PyQt.QtGui import QIcon
from qgis.core import QgsProcessingProvider

from .algorithms.add_styles import AddStyles
from .algorithms.cancel_last_modification import CancelLastModification
from .algorithms.configure_plugin import ConfigurePlugin
from .algorithms.convert_imported_data import ConvertImportedData
from .algorithms.create_database_structure import CreateDatabaseStructure
from .algorithms.export_package import ExportPackage
from .algorithms.gabarits_aep_ass import ExportGabarits
from .algorithms.get_downstream_route import GetDownstreamRoute
from .algorithms.get_network_to_vanne import GetNetworkToVanne
from .algorithms.get_network_to_vanne_ferme_from_point import GetNetworkToVanneFermeFromPoint
from .algorithms.get_network_to_vanne_from_point import GetNetworkToVanneFromPoint
from .algorithms.get_orientation_appareil import GetOrientationAppareil
from .algorithms.get_upstream_route import GetUpstreamRoute
from .algorithms.import_shapefile import ImportShapefile
from .algorithms.insert_converted_data import InsertConvertedData
from .algorithms.load_project import LoadProject
from .algorithms.sql_layers import AddSqlLayers
from .algorithms.upgrade_database_structure import UpgradeDatabaseStructure
from ..qgis_plugin_tools.tools.resources import resources_path


class RaepaProvider(QgsProcessingProvider):

    def icon(self) -> QIcon:
        return QIcon(resources_path('icons/icon.png'))

    def loadAlgorithms(self):
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
