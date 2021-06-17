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
    QgsProcessingParameterVectorLayer,
    QgsProcessingParameterString,
)

from .execute_sql import ExecuteSql


class CancelLastModification(ExecuteSql):

    SOURCE_LAYER = 'SOURCE_LAYER'
    SOURCE_ID = 'SOURCE_ID'

    def name(self):
        return 'cancel_last_modification'

    def displayName(self):
        return 'Annuler la dernière modification'

    def group(self):
        return 'Outils'

    def groupId(self):
        return 'raepa_tools'

    def shortHelpString(self) -> str:
        return 'Annule la dernière modification sur la base de données.'

    def initAlgorithm(self, config):
        """
        Here we define the inputs and output of the algorithm, along
        with some other properties.
        """
        # use parent class to get other parameters
        super(self.__class__, self).initAlgorithm(config)

        # INPUTS
        self.removeParameter('INPUT_SQL')

        self.addParameter(
            QgsProcessingParameterString(
                self.SOURCE_ID, 'Unique ID (id)',
                defaultValue=-1,
                optional=False
            )
        )

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

        feedback.pushInfo('Annuler la dernière modication sur "{}"'.format(table_name))
        feedback.pushInfo(sql)

        self.SQL = sql.replace('\n', ' ').rstrip(';')
