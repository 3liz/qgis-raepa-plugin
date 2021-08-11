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

from .get_data_as_layer import GetDataAsLayer
from qgis.core import (
    QgsProcessingParameterString,
    QgsLineSymbol,
    QgsProcessingParameterEnum
)


class GetDownstreamRoute(GetDataAsLayer):

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
        return 'Récupération réseau aval'

    def shortHelpString(self) -> str:
        return 'Obtenir le réseau en aval d\'un ouvrage'

    def initAlgorithm(self, config):
        super(self.__class__, self).initAlgorithm(config)

        self.addParameter(
            QgsProcessingParameterString(
                self.SOURCE_ID,
                'Unique ID (idouvrage)',
                defaultValue=-1,
                optional=False
            )
        )
        self.addParameter(
            QgsProcessingParameterEnum(
                self.METHOD,
                'Méthode',
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
        super().setLayerName(parameters, context, feedback)
        if self.LAYER_NAME == '':
            self.LAYER_NAME = 'Réseau aval depuis {}'.format(parameters[self.SOURCE_ID])

    def setSymbole(self, parameters, context, feedback):
        super().setSymbole(parameters, context, feedback)
        self.SYMBOLE = QgsLineSymbol.createSimple(
            {
                'line_color': '255,50,50,255',
                'line_style': 'solid',
                'line_width': '1.8'
            }
        )
