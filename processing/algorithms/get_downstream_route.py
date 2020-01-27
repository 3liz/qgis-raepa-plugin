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

from .get_data_as_layer import *
from qgis.core import (
    QgsProcessingParameterEnum
)


class GetDownstreamRoute(GetDataAsLayer):
    """

    """

    GEOM_FIELD = 'geom'
    LAYER_NAME = ''
    SOURCE_ID = 'SOURCE_ID'
    METHOD = 'METHOD'
    METHODS = [
        'geom',
        'attribute'
    ]

    def name(self):
        return 'get_downstream_route'

    def displayName(self):
        return self.tr('Get the downstream route')

    def shortHelpString(self) -> str:
        return 'Obtenir le réseau en aval d\'un ouvrage'

    def initAlgorithm(self, config):
        """
        """
        # use parent class to get other parameters
        super(self.__class__, self).initAlgorithm(config)

        self.addParameter(
            QgsProcessingParameterString(
                self.SOURCE_ID,
                self.tr('Unique ID (idouvrage)'),
                defaultValue=-1,
                optional=False
            )
        )
        self.addParameter(
            QgsProcessingParameterEnum(
                self.METHOD,
                self.tr('Method'),
                options=self.METHODS,
                optional=False
            )
        )

    def setSql(self, parameters, context, feedback):
        method = self.METHODS[parameters[self.METHOD]]
        func = 'downstream_by_geom'
        if method != 'geom':
            func = 'downstream_by_idn'
        # Build SQL
        sql = '''
            SELECT 1 AS id,
            raepa.{0}(
                '{1}'
            ) AS geom
        '''.format(
            func,
            parameters[self.SOURCE_ID]
        )
        self.SQL = sql.replace('\n', ' ').rstrip(';')

    def setLayerName(self, parameters, context, feedback):
        self.LAYER_NAME = self.tr('Downstream route from') + ' %s' % parameters[self.SOURCE_ID]
