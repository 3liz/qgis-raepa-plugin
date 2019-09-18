# -*- coding: utf-8 -*-

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

from qgis.core import QgsProcessingProvider
from .algorithms.get_data_as_layer import GetDataAsLayer
from .algorithms.configure_plugin import ConfigurePlugin
from .algorithms.execute_sql import ExecuteSql
from .algorithms.create_database_structure import CreateDatabaseStructure
from .algorithms.upgrade_database_structure import UpgradeDatabaseStructure
from .algorithms.import_shapefile import ImportShapefile
from .algorithms.convert_imported_data import ConvertImportedData
from .algorithms.insert_converted_data import InsertConvertedData
from .algorithms.export_package import ExportPackage
from .algorithms.get_upstream_route import GetUpstreamRoute
from .algorithms.get_downstream_route import GetDownstreamRoute
from .algorithms.cancel_last_modification import CancelLastModification


class RaepaProvider(QgsProcessingProvider):

    def unload(self):
        """
        Unloads the provider. Any tear-down steps required by the provider
        should be implemented here.
        """
        pass

    def loadAlgorithms(self):

        self.addAlgorithm(GetDataAsLayer())
        self.addAlgorithm(ConfigurePlugin())
        self.addAlgorithm(ExecuteSql())
        self.addAlgorithm(CreateDatabaseStructure())
        self.addAlgorithm(UpgradeDatabaseStructure())
        self.addAlgorithm(ImportShapefile())
        self.addAlgorithm(ConvertImportedData())
        self.addAlgorithm(InsertConvertedData())
        self.addAlgorithm(ExportPackage())
        self.addAlgorithm(GetUpstreamRoute())
        self.addAlgorithm(GetDownstreamRoute())
        self.addAlgorithm(CancelLastModification())

    def id(self):
        return 'raepa'

    def name(self):
        return self.tr('Raepa')

    def longName(self):
        return self.tr('Raepa')
