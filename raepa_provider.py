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
__date__ = '2018-12-19'
__copyright__ = '(C) 2018 by 3liz'

# This will get replaced with a git SHA1 when you do a git archive

__revision__ = '$Format:%H$'

from qgis.core import QgsProcessingProvider
from .raepa_execute_sql_on_service_algorithm import RaepaExecuteSqlOnServiceAlgorithm
from .raepa_create_structure_algorithm import RaepaCreateStructureAlgorithm
from .raepa_import_shapefile_algorithm import RaepaImportShapefileAlgorithm
from .raepa_import_convert_into_model_algorithm import RaepaImportConvertIntoModelAlgorithm
from .raepa_import_insert_converted_data_algorithm import RaepaImportInsertConvertedDataAlgorithm


class RaepaProvider(QgsProcessingProvider):

    def __init__(self):
        QgsProcessingProvider.__init__(self)

        # Load algorithms
        self.alglist = [
            RaepaExecuteSqlOnServiceAlgorithm(),
            RaepaCreateStructureAlgorithm(),
            RaepaImportShapefileAlgorithm(),
            RaepaImportConvertIntoModelAlgorithm(),
            RaepaImportInsertConvertedDataAlgorithm()
        ]

    def unload(self):
        """
        Unloads the provider. Any tear-down steps required by the provider
        should be implemented here.
        """
        pass

    def loadAlgorithms(self):
        for alg in self.alglist:
            self.addAlgorithm( alg )

    def id(self):
        return 'Raepa'

    def name(self):
        return self.tr('Raepa')

    def longName(self):
        return self.tr('Outils Raepa')
