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

from qgis.PyQt.QtCore import (
    QCoreApplication,
)
from qgis.core import (
    QgsProcessingAlgorithm,
    QgsProcessingException,
    QgsProcessingParameterString,
    QgsProcessingParameterCrs,
    QgsDataSourceUri,
    QgsProcessingParameterFileDestination,
)
from processing.algs.gdal.GdalUtils import GdalUtils


class ExportPackage(QgsProcessingAlgorithm):
    """
    Import Shapefile into imports schema
    """

    PGSERVICE = 'PGSERVICE'
    SRID = 'SRID'
    DESTINATION = 'DESTINATION'

    def name(self):
        return 'export_package'

    def displayName(self):
        return self.tr('Export data into one geopackage')

    def group(self):
        return self.tr('Export')

    def groupId(self):
        return 'raepa_export'

    @staticmethod
    def tr(string):
        return QCoreApplication.translate('Processing', string)

    def createInstance(self):
        return self.__class__()

    def flags(self):
        # noinspection PyTypeChecker
        return super().flags() | QgsProcessingAlgorithm.FlagNoThreading

    def shortHelpString(self) -> str:
        return self.tr(
            'Export all layers from your canvas which belong to '
            'the specified PostgreSQL service in a SQLite file. \n'
            'A custom CRS can be specified.')

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
            QgsProcessingParameterCrs(
                self.SRID, 'Projection',
                defaultValue='EPSG:32620',
                optional=False
            )
        )
        self.addParameter(
            QgsProcessingParameterFileDestination(
                self.DESTINATION,
                self.tr('Sqlite file'),
                fileFilter='sqlite'
            )
        )

    def processAlgorithm(self, parameters, context, feedback):
        """
        Here is where the processing itself takes place.
        """
        service = self.parameterAsString(parameters, self.PGSERVICE, context)
        crs = self.parameterAsCrs(parameters, self.SRID, context)
        sqlite_path = self.parameterAsString(parameters, self.DESTINATION, context)

        if not sqlite_path.lower().endswith('.sqlite'):
            sqlite_path += '.sqlite'

        if os.path.exists(sqlite_path):
            feedback.pushDebugInfo('Previous SQLite file has been deleted.')
            os.remove(sqlite_path)

        # Get layers and corresponding PostgreSQL tables
        ll = []
        p = context.project()
        layers = p.mapLayers()
        for lid, layer in layers.items():
            if not layer.isValid():
                feedback.reportError(self.tr(
                    'Layer {} is not valid. It is not included in the package.'
                ).format(layer.id()))
                continue

            src = layer.source()
            uri = QgsDataSourceUri(src)
            if not uri.service() == service:
                feedback.reportError(self.tr(
                    'Layer {} does not belong to the service "{}". It is not included in the package.'
                ).format(layer.id(), service))
                continue

            # TODO fix this layer
            if uri.table() in ['raepa_ouvrass_p']:
                feedback.reportError(self.tr(
                    'Layer {} is not supported for now. It is not included in the package.'
                ).format(layer.id(), service))
                continue

            ll.append(
                "%s.%s" % (
                    uri.schema(),
                    uri.table()
                )
            )
        tables = ','.join(ll)

        # Set PG source access string for ogr
        ogr_source = 'PG:service={} tables={}'.format(service, tables)
        # feedback.pushInfo('OGR source = %s' % ogr_source)

        # Set options for ogr
        ogr_command = [
            # 'ogr2ogr',
            '-f', 'SQLite',
            sqlite_path,
            ogr_source,
            '-lco', 'GEOMETRY_NAME=geom',
            '-lco', 'SRID={}'.format(crs.postgisSrid()),
            '-gt', '50000',
            '-dsco', 'SPATIALITE=YES',
            '-lco', 'SPATIAL_INDEX=YES',
            '--config', 'PG_LIST_ALL_TABLES', 'YES',
            '--config', 'PG_SKIP_VIEWS', 'YES',
            '--config', 'OGR_SQLITE_SYNCHRONOUS', 'OFF',
            '--config', 'OGR_SQLITE_CACHE', '1024'
        ]
        feedback.pushInfo('OGR command = ogr2ogr {}'.format(' '.join(ogr_command)))

        # Export with ogr2og
        GdalUtils.runGdal(['ogr2ogr', GdalUtils.escapeAndJoin(ogr_command)], feedback)

        if not os.path.isfile(sqlite_path):
            raise QgsProcessingException('{} could not be created.'.format(sqlite_path))

        feedback.pushInfo('Export - OK in {}'.format(sqlite_path))

        return {}
