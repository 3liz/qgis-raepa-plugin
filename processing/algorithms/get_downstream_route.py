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
    TARGET_TABLE = 'TARGET_TABLE'
    TARGET_TABLES = [
        "ASS",
        "AEP"
    ]

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
        self.addParameter(
            QgsProcessingParameterEnum(
                self.TARGET_TABLE, 'Target table',
                defaultValue='ASS',
                options=self.TARGET_TABLES,
                optional=False
            )
        )

    def setSql(self, parameters, context, feedback):
        target_table = self.TARGET_TABLES[parameters[self.TARGET_TABLE]]
        target = 'raepa.raepa_canalass_l'
        if target_table == 'AEP':
            target = 'raepa.raepa_canalaep_l'

        # Build SQL
        sql = '''
            SELECT 1 AS id,
            raepa.downstream_by_idn(
                '{0}', '{1}'
            ) AS geom
        '''.format(
            parameters[self.SOURCE_ID],
            target
        )
        self.SQL = sql.replace('\n', ' ').rstrip(';')

    def setLayerName(self, parameters, context, feedback):
        self.LAYER_NAME = self.tr('Downstream route from') + ' %s' % parameters[self.SOURCE_ID]
