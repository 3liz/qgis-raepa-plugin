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

from qgis.core import (
    QgsProcessingParameterVectorLayer
)

from .execute_sql import *


class GetOrientationAppareil(ExecuteSql):
    """
    Insert imported and converted data into the schema raepa
    """

    SOURCE_ID = 'SOURCE_ID'

    def name(self):
        return 'get_orientation_appareil'

    def displayName(self):
        return self.tr('Get orientation appareil')

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
                self.SOURCE_ID, 'Unique ID (idappareil)',
                defaultValue=-1,
                optional=False
            )
        )

    def checkParameterValues(self, parameters, context):
        return super(GetOrientationAppareil, self).checkParameterValues(parameters, context)

    def setSql(self, parameters, context, feedback):
        # Get source layer uri and table name + id name
        leid = self.parameterAsString(parameters, self.SOURCE_ID, context)
        sql = '''
        CALL raepa.calculate_apparaep_orientation('{0}')
        '''.format(
            leid
        )

        feedback.pushInfo(self.tr('Calcul orientation' + ' on %s' % leid))
        feedback.pushInfo(sql)

        self.SQL = sql.replace('\n', ' ').rstrip(';')
