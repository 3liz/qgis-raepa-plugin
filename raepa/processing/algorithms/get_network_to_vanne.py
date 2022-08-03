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


from qgis.core import (
    QgsProcessingParameterString,
    QgsLineSymbol
)

from .get_data_as_layer import GetDataAsLayer


class GetNetworkToVanne(GetDataAsLayer):
    """
    Insert imported and converted data into the schema raepa
    """

    GEOM_FIELD = 'geom'
    LAYER_NAME = ''
    SOURCE_ID = 'SOURCE_ID'

    def name(self):
        return 'get_network_to_vanne'

    def displayName(self):
        return 'Réseau vers une vanne'

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
            QgsProcessingParameterString(
                self.SOURCE_ID, 'Unique ID (idcana)',
                defaultValue=-1,
                optional=False
            )
        )

    def setSql(self, parameters, context, feedback):
        # Get source layer uri and table name + id name
        leid = self.parameterAsString(parameters, self.SOURCE_ID, context)
        sql = '''
        SELECT 1 AS id, raepa.network_to_vanne('{0}') AS geom
        '''.format(
            leid
        )

        self.SQL = sql.replace('\n', ' ').rstrip(';')

    def setLayerName(self, parameters, context, feedback):
        super().setLayerName(parameters, context, feedback)
        if self.LAYER_NAME == '':
            self.LAYER_NAME = 'Réseau vers la vanne depuis {}'.format(parameters[self.SOURCE_ID])

    def setSymbole(self, parameters, context, feedback):
        super().setSymbole(parameters, context, feedback)
        self.SYMBOLE = QgsLineSymbol.createSimple(
            {
                'line_color': '255,50,50,255',
                'line_style': 'solid',
                'line_width': '1.8'
            }
        )
