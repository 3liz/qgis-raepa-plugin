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


from .get_data_as_layer import GetDataAsLayer
from qgis.core import (
    QgsProcessingParameterPoint,
    QgsLineSymbol
)


class GetNetworkToVanneFermeFromPoint(GetDataAsLayer):

    GEOM_FIELD = 'geom'
    LAYER_NAME = ''
    POINT = 'POINT'

    def name(self):
        return 'get_network_to_vanne_ferme_from_point'

    def displayName(self):
        return 'Parcours réseau jusqu\'aux vannes fermées depuis un point'

    def group(self):
        return 'Outils'

    def groupId(self):
        return 'raepa_tools'

    def initAlgorithm(self, config):
        """
        Here we define the inputs and output of the algorithm, along
        with some other properties.
        """
        # use parent class to get other parameters
        super(self.__class__, self).initAlgorithm(config)

        # INPUTS
        self.addParameter(
            QgsProcessingParameterPoint(
                self.POINT, 'Point de départ',
                optional=False
            )
        )

    def setSql(self, parameters, context, feedback):
        # Get source layer uri and table name + id name
        pt = self.parameterAsPoint(parameters, self.POINT, context)
        crs = self.parameterAsPointCrs(parameters, self.POINT, context)

        sql = '''
        SELECT 1 AS id, c.idcana, ST_Line_Locate_Point(c.geom, p.geom) as loc, ST_Distance(c.geom, p.geom) as dist, raepa.get_network_to_vanne_ferme_from_point(c.idcana, ST_Line_Locate_Point(c.geom, p.geom)) AS geom
          FROM raepa.raepa_canalaep_l as c
               JOIN (SELECT 1 as id, ST_Transform(ST_SetSRID(ST_MakePoint({0}, {1}), {2}), Find_SRID('raepa', 'raepa_canalaep_l', 'geom')) as geom) as p
                 ON ST_DWithin(c.geom, p.geom, 1)
          ORDER BY dist
          LIMIT 1
        '''.format(
            pt.x(),
            pt.y(),
            crs.postgisSrid()
        )
        feedback.pushInfo(sql)

        self.SQL = sql.replace('\n', ' ').rstrip(';')

    def setLayerName(self, parameters, context, feedback):
        super().setLayerName(parameters, context, feedback)
        if self.LAYER_NAME == '':
            self.LAYER_NAME = 'Réseau jusqu\'aux vannes fermées depuis {}'.format(self.parameterAsString(parameters, self.POINT, context))

    def setSymbole(self, parameters, context, feedback):
        super().setSymbole(parameters, context, feedback)
        self.SYMBOLE = QgsLineSymbol.createSimple(
            {
                'line_color': '255,50,50,255',
                'line_style': 'solid',
                'line_width': '1.8'
            }
        )
