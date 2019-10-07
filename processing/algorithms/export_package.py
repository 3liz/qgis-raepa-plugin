"""
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

import os
import subprocess

from qgis.PyQt.QtCore import (
    QCoreApplication,
    QFileInfo
)
from qgis.core import (
    QgsExpression,
    QgsExpressionContext,
    QgsExpressionContextUtils,
    QgsProcessingAlgorithm,
    QgsProcessingException,
    QgsProcessingParameterString,
    QgsProcessingOutputString,
    QgsProject,
    QgsDataSourceUri
)


class ExportPackage(QgsProcessingAlgorithm):
    """
    Import Shapefile into imports schema
    """

    PGSERVICE = 'PGSERVICE'
    SRID = 'SRID'
    OUTPUT_STRING = 'OUTPUT_STRING'

    def name(self):
        return 'export_package'

    def displayName(self):
        return self.tr('Export data into one geopackage')

    def group(self):
        return self.tr('Export')

    def groupId(self):
        return 'raepa_export'

    def tr(self, string):
        return QCoreApplication.translate('Processing', string)

    def createInstance(self):
        return self.__class__()

    def initAlgorithm(self, config):
        """
        Here we define the inputs and output of the algorithm, along
        with some other properties.
        """
        # INPUTS
        self.addParameter(
            QgsProcessingParameterString(
                self.PGSERVICE, 'PostgreSQL Service',
                defaultValue='raepa',
                optional=False
            )
        )
        self.addParameter(
            QgsProcessingParameterString(
                self.SRID, 'SRID',
                defaultValue='2154',
                optional=False
            )
        )

        # OUTPUTS
        self.addOutput(
            QgsProcessingOutputString(
                self.OUTPUT_STRING, self.tr('Output message')
            )
        )

    def processAlgorithm(self, parameters, context, feedback):
        """
        Here is where the processing itself takes place.
        """
        # Create directory
        # TODO fix use of unix path
        exp = QgsExpression("'/home/' || @user_account_name || '/sup/'")
        context = QgsExpressionContext()
        context.appendScope(QgsExpressionContextUtils.globalScope())
        output_dir = exp.evaluate(context)
        if not os.path.isdir(output_dir):
            os.mkdir(output_dir)

        # Set sqlite file path
        projectFile = QgsProject.instance().fileName()
        sqlite_path = os.path.join(output_dir, QFileInfo(projectFile).fileName())
        sqlite_path = sqlite_path.replace('.qgs', '.sqlite')
        if os.path.exists(sqlite_path):
            os.remove(sqlite_path)

        # Get layers and corresponding PostgreSQL tables
        ll = []
        p = QgsProject.instance()
        layers = p.mapLayers()
        for lid, layer in layers.items():
            src = layer.source()
            uri = QgsDataSourceUri(src)
            ll.append(
                "%s.%s" % (
                    uri.schema(),
                    uri.table()
                )
            )
        tables = ','.join(ll)

        # Set PG source access string for ogr
        ogr_source = 'PG:service=%s tables=%s' % (
            parameters[self.PGSERVICE],
            tables
        )
        feedback.pushInfo('OGR source = %s' % ogr_source)

        # Set options for ogr
        ogr_command = [
            "ogr2ogr",
            '-f', 'SQLite',
            sqlite_path,
            ogr_source,
            '-lco', 'GEOMETRY_NAME=geom',
            '-lco', 'SRID=%s' % parameters[self.SRID],
            '-gt', '50000',
            '-dsco', 'SPATIALITE=YES',
            '-lco', 'SPATIAL_INDEX=YES',
            '--config', 'PG_LIST_ALL_TABLES', 'YES',
            '--config', 'PG_SKIP_VIEWS', 'YES',
            '--config', 'OGR_SQLITE_SYNCHRONOUS', 'OFF',
            '--config', 'OGR_SQLITE_CACHE', '1024'
        ]
        feedback.pushInfo('OGR command = %s' % ' '.join(ogr_command))

        # Export with ogr2og:r
        try:
            subprocess.check_call(ogr_command, stderr=subprocess.STDOUT)
        except subprocess.CalledProcessError as e:
            raise QgsProcessingException(str(e.output))

        feedback.pushInfo('Export - OK')

        return {
            self.OUTPUT_STRING: 'Export dans %s -> OK' % sqlite_path
        }
