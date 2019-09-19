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
__date__ = '2019-02-15'
__copyright__ = '(C) 2019 by 3liz'

# This will get replaced with a git SHA1 when you do a git archive

__revision__ = '$Format:%H$'

from PyQt5.QtCore import QCoreApplication
from qgis.core import (
    QgsVectorLayer,
    QgsProcessing,
    QgsProcessingAlgorithm,
    QgsProcessingContext,
    QgsProcessingUtils,
    QgsProcessingException,
    QgsProcessingParameterString,
    QgsProcessingOutputString,
    QgsProcessingOutputNumber,
    QgsProcessingOutputVectorLayer
)
from .tools import *
from .get_data_as_layer import *
from processing.tools import postgis

class GetDownstreamRoute(GetDataAsLayer):
    """

    """

    GEOM_FIELD = 'geom'
    LAYER_NAME = ''
    SOURCE_ID = 'SOURCE_ID'

    def name(self):
        return 'get_downstream_route'

    def displayName(self):
        return self.tr('Get the downstream route')

    def initAlgorithm(self, config):
        """
        """
        # use parent class to get other parameters
        super(self.__class__, self).initAlgorithm(config)

        self.addParameter(
            QgsProcessingParameterString(
                self.SOURCE_ID, 'Unique ID (idouvrage)',
                defaultValue=-1,
                optional=False
            )
        )


    def setSql(self, parameters, context, feedback):

        # Build SQL
        sql = '''
            SELECT 1 AS id, raepa.downstream('{0}') AS geom
        '''.format(
            parameters[self.SOURCE_ID]
        )
        self.SQL = sql.replace('\n', ' ').rstrip(';')

    def setLayerName(self, parameters, context, feedback):
        self.LAYER_NAME = self.tr('Downstream route from') + ' %s' % parameters[self.SOURCE_ID]

