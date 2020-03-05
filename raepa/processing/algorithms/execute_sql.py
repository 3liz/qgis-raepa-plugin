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

from db_manager.db_plugins import createDbPlugin
from qgis.core import (
    QgsProcessingParameterString,
    QgsProcessingOutputString,
    QgsProcessingOutputNumber,
    QgsExpressionContextUtils
)

from ...qgis_plugin_tools.tools.algorithm_processing import BaseProcessingAlgorithm
from .tools import fetchDataFromSqlQuery


class ExecuteSql(BaseProcessingAlgorithm):

    INPUT_SQL = 'INPUT_SQL'
    OUTPUT_STATUS = 'OUTPUT_STATUS'
    OUTPUT_STRING = 'OUTPUT_STRING'

    SQL = 'SELECT 1::int AS id'

    def name(self):
        return 'execute_sql'

    def displayName(self):
        return 'Execute SQL'

    def group(self):
        return 'Outils'

    def groupId(self):
        return 'raepa_tools'

    def shortHelpString(self) -> str:
        return 'Exécuter du SQL dans la base de données.'

    def initAlgorithm(self, config):
        """
        Here we define the inputs and output of the algorithm, along
        with some other properties.
        """
        # INPUTS
        self.addParameter(
            QgsProcessingParameterString(
                self.INPUT_SQL, 'INPUT_SQL',
                optional=True
            )
        )

        # OUTPUTS
        # Add output for status (integer)
        self.addOutput(
            QgsProcessingOutputNumber(
                self.OUTPUT_STATUS,
                'Statut de sortie'
            )
        )
        # Add output for message
        self.addOutput(
            QgsProcessingOutputString(
                self.OUTPUT_STRING,
                'Message de sortie'
            )
        )

    def checkParameterValues(self, parameters, context):

        # Check that the connection name has been configured
        connection_name = QgsExpressionContextUtils.globalScope().variable('raepa_connection_name')
        if not connection_name:
            msg = 'Vous devez utiliser le l\'algorithme de configuration du plugin pour paramétrer le nom de connexion.'
            return False, msg

        # Check that it corresponds to an existing connection
        dbpluginclass = createDbPlugin('postgis')
        connections = [c.connectionName() for c in dbpluginclass.connections()]
        if connection_name not in connections:
            msg = 'La connexion "{}" n\'existe pas dans QGIS : {}'.format(
                connection_name, ', '.join(connections))
            return False, msg

        return super(ExecuteSql, self).checkParameterValues(parameters, context)

    def setSql(self, parameters, context, feedback):

        sql = self.SQL
        if self.INPUT_SQL in parameters:
            input_sql = str(parameters[self.INPUT_SQL]).strip()
            if input_sql:
                sql = input_sql
        self.SQL = sql.replace('\n', ' ').rstrip(';')

    def processAlgorithm(self, parameters, context, feedback):
        """
        Here is where the processing itself takes place.
        """
        # Database connection parameters
        connection_name = QgsExpressionContextUtils.globalScope().variable('raepa_connection_name')

        msg = ''
        status = 1

        # Set SQL
        self.setSql(parameters, context, feedback)
        feedback.pushInfo(self.SQL)

        # Run SQL
        [header, data, rowCount, ok, error_message] = fetchDataFromSqlQuery(
            connection_name,
            self.SQL
        )
        if ok:
            msg = 'SQL exécuté avec succès'
            feedback.pushInfo(msg)
            status = 1
        else:
            feedback.pushInfo('* ' + error_message)
            status = 0
            raise Exception(error_message)

        return {
            self.OUTPUT_STATUS: 0,
            self.OUTPUT_STRING: msg
        }
