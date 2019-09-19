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

from PyQt5.QtCore import QCoreApplication
from qgis.core import (
    QgsProcessing,
    QgsProcessingAlgorithm,
    QgsProcessingUtils,
    QgsProcessingException,
    QgsProcessingParameterString,
    QgsProcessingOutputNumber,
    QgsProcessingOutputString,
    QgsProcessingParameterVectorLayer,
    QgsExpressionContextUtils
)
import os
from .tools import *
from db_manager.db_plugins import createDbPlugin
from .execute_sql import *

class CancelLastModification(ExecuteSql):
    """
    Insert imported and converted data into the schema raepa
    """

    SOURCE_LAYER = 'SOURCE_LAYER'
    SOURCE_ID = 'SOURCE_ID'

    def name(self):
        return 'cancel_last_modification'

    def displayName(self):
        return self.tr('Cancel last modification')

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
            QgsProcessingParameterVectorLayer(
                self.SOURCE_LAYER, self.tr('Source layer'),
                optional=False
            )
        )
        self.addParameter(
            QgsProcessingParameterString(
                self.SOURCE_ID, 'Unique ID (id)',
                defaultValue=-1,
                optional=False
            )
        )

    def checkParameterValues(self, parameters, context):

        return super(CancelLastModification, self).checkParameterValues(parameters, context)

    def setSql(self, parameters, context, feedback):

        # Get source layer uri and table name + id name
        layer = self.parameterAsVectorLayer(parameters, self.SOURCE_LAYER, context)
        schema_name = layer.dataProvider().uri().schema()
        table_name = layer.dataProvider().uri().table()
        key_column = layer.dataProvider().uri().keyColumn()

        sql = '''
        SELECT audit.rollback_event(foo.event_id) FROM (
             SELECT event_id
             FROM audit.logged_actions
             WHERE schema_name = '{0}' AND table_name = '{1}'
             AND (row_data->'{2}')::integer = {3}
             ORDER BY action_tstamp_tx DESC
             LIMIT 1
        ) foo
        '''.format(
            schema_name,
            table_name,
            key_column,
            parameters[self.SOURCE_ID]
        )

        feedback.pushInfo(self.tr('Cancel last modification' + ' on %s' % table_name))
        feedback.pushInfo(sql)

        self.SQL = sql.replace('\n', ' ').rstrip(';')

