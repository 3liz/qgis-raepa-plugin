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

from .get_data_as_layer import *

from .execute_sql import *


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
        return self.tr('Get network to vanne')

    def group(self):
        return self.tr('Tools')

    def groupId(self):
        return 'raepa_tools'

    def tr(self, string):
        return QCoreApplication.translate('Processing', string)

    def createInstance(self):
        return self.__class__()

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

    def checkParameterValues(self, parameters, context):
        return super(GetNetworkToVanne, self).checkParameterValues(parameters, context)

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
        self.LAYER_NAME = self.tr('Network to vanne from') + ' %s' % parameters[self.SOURCE_ID]
