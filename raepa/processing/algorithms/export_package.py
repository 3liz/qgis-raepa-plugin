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

from qgis.core import (
    QgsProcessingAlgorithm,
    QgsProcessingException,
    QgsProcessingParameterString,
    QgsProcessingParameterCrs,
    QgsDataSourceUri,
    QgsProcessingParameterFileDestination,
)
from processing.algs.gdal.GdalUtils import GdalUtils

from ...qgis_plugin_tools.tools.algorithm_processing import BaseProcessingAlgorithm


class ExportPackage(BaseProcessingAlgorithm):
    """
    Import Shapefile into imports schema
    """

    PGSERVICE = 'PGSERVICE'
    SRID = 'SRID'
    DESTINATION = 'DESTINATION'

    def name(self):
        return 'export_package'

    def displayName(self):
        return 'Exporter les données en geopackage'

    def group(self):
        return 'Export'

    def groupId(self):
        return 'raepa_export'

    def createInstance(self):
        return self.__class__()

    def flags(self):
        # noinspection PyTypeChecker
        return super().flags() | QgsProcessingAlgorithm.FlagNoThreading

    def shortHelpString(self) -> str:
        return (
            'Exporte toutes les couches du canvas qui appartiennent au service PostgreSQL dans un fichier SQLite. '
            'Un CRS peut-être spécifié.')

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
                'Fichier SQLite',
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
            feedback.pushDebugInfo('Le fichier SQLite précédent a été supprimé.')
            os.remove(sqlite_path)

        p = context.project()
        layers = p.mapLayers()
        for i, layer in enumerate(layers.values()):
            if not layer.isValid():
                feedback.reportError(
                    'La couche "{}" n\'est pas valide. Elle ne sera pas inclus dans le package.'
                ).format(layer.id())
                continue

            uri = QgsDataSourceUri(layer.source())
            if not uri.service() == service:
                feedback.reportError(
                    'La couche "{}" n\'appartient pas au service "{}". Elle ne sera pas inclus dans lepackage.'
                ).format(layer.id(), service)
                continue

            ogr_source = 'PG:service={} tables={}.{}'.format(service, uri.schema(), uri.table())

            # Set options for ogr
            ogr_arguments = [
                '-f', 'SQLite',
                sqlite_path,
                ogr_source,
                '-lco', 'GEOMETRY_NAME=geom',
                '-lco', 'SRID={}'.format(crs.postgisSrid()),
                '-gt', '50000',
                '-lco', 'SPATIAL_INDEX=YES',
                '--config', 'PG_LIST_ALL_TABLES', 'YES',
                '--config', 'PG_SKIP_VIEWS', 'YES',
                '--config', 'OGR_SQLITE_SYNCHRONOUS', 'OFF',
                '--config', 'OGR_SQLITE_CACHE', '1024'
            ]

            primary_key = uri.keyColumn()
            if layer.fields().field(primary_key).isNumeric():
                ogr_arguments.insert(4, '-where')
                ogr_arguments.insert(5, '{} >= 0'.format(primary_key))

            if layer.isSpatial():
                ogr_arguments.insert(4, '-geomfield')
                ogr_arguments.insert(5, 'geom')

            if i == 1:
                ogr_arguments.insert(4, '-dsco')
                ogr_arguments.insert(5, 'SPATIALITE=YES')
            else:
                ogr_arguments.insert(0, '-update')

            feedback.pushInfo('OGR command = ogr2ogr {}'.format(' '.join(ogr_arguments)))
            GdalUtils.runGdal(['ogr2ogr', GdalUtils.escapeAndJoin(ogr_arguments)], feedback)

            if feedback.isCanceled():
                break

        if not os.path.isfile(sqlite_path):
            raise QgsProcessingException('"{}" n\'a pas être crée.'.format(sqlite_path))

        feedback.pushInfo('Export - OK dans "{}"'.format(sqlite_path))

        return {}
