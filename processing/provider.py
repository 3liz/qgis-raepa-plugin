"""
/***************************************************************************
 Raepa
                                 A QGIS plugin
 France only - Plugin dedicated to import and manage water network data by using Raepa standard
 Generated by Plugin Builder: http://g-sherman.github.io/Qgis-Plugin-Builder/
                              -------------------
        begin                : 2018-12-19
        copyright            : (C) 2018 by 3liz
        email                : info@3liz.com
 ***************************************************************************/

/***************************************************************************
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 ***************************************************************************/
"""

__author__ = '3liz'
__date__ = '2019-02-15'
__copyright__ = '(C) 2019 by 3liz'

# This will get replaced with a git SHA1 when you do a git archive

__revision__ = '$Format:%H$'

from qgis.PyQt.QtGui import QIcon
from qgis.core import QgsProcessingProvider

from .algorithms.add_styles import AddStyles
from .algorithms.cancel_last_modification import CancelLastModification
from .algorithms.configure_plugin import ConfigurePlugin
from .algorithms.convert_imported_data import ConvertImportedData
from .algorithms.create_database_structure import CreateDatabaseStructure
from .algorithms.execute_sql import ExecuteSql
from .algorithms.export_package import ExportPackage
from .algorithms.get_data_as_layer import GetDataAsLayer
from .algorithms.get_downstream_route import GetDownstreamRoute
from .algorithms.get_network_to_vanne import GetNetworkToVanne
from .algorithms.get_orientation_appareil import GetOrientationAppareil
from .algorithms.get_upstream_route import GetUpstreamRoute
from .algorithms.import_shapefile import ImportShapefile
from .algorithms.insert_converted_data import InsertConvertedData
from .algorithms.load_project import LoadProject
from .algorithms.tools.gabarits_aep_ass import ExportGabarits
from .algorithms.upgrade_database_structure import UpgradeDatabaseStructure
from ..qgis_plugin_tools.tools.resources import resources_path


class RaepaProvider(QgsProcessingProvider):

    def icon(self) -> QIcon:
        return QIcon(resources_path('icons/icon.png'))

    def loadAlgorithms(self):
        self.addAlgorithm(GetDataAsLayer())
        self.addAlgorithm(ConfigurePlugin())
        self.addAlgorithm(ExecuteSql())
        self.addAlgorithm(ExportGabarits())
        self.addAlgorithm(CreateDatabaseStructure())
        self.addAlgorithm(UpgradeDatabaseStructure())
        self.addAlgorithm(ImportShapefile())
        self.addAlgorithm(ConvertImportedData())
        self.addAlgorithm(InsertConvertedData())
        self.addAlgorithm(ExportPackage())
        self.addAlgorithm(GetUpstreamRoute())
        self.addAlgorithm(GetDownstreamRoute())
        self.addAlgorithm(CancelLastModification())
        self.addAlgorithm(GetOrientationAppareil())
        self.addAlgorithm(GetNetworkToVanne())
        self.addAlgorithm(LoadProject())
        self.addAlgorithm(AddStyles())

    def id(self):
        return 'raepa'

    def name(self):
        return 'RAEPA'

    def longName(self):
        return 'Réseaux d\'Adduction d\'Eau Potable et d\'Assainissement'
