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


from qgis.core import (
    QgsExpressionContextUtils,
    QgsProcessingOutputNumber,
    QgsProcessingOutputString,
    QgsProcessingParameterProviderConnection,
)

from raepa.qgis_plugin_tools.tools.algorithm_processing import (
    BaseProcessingAlgorithm,
)


class ConfigurePlugin(BaseProcessingAlgorithm):

    CONNECTION_NAME = 'CONNECTION_NAME'

    OUTPUT_STATUS = 'OUTPUT_STATUS'
    OUTPUT_STRING = 'OUTPUT_STRING'

    def name(self):
        return 'configure_plugin'

    def displayName(self):
        return 'Configurer le plugin RAEPA'

    def group(self):
        return 'Configuration'

    def groupId(self):
        return 'raepa_configuration'

    def shortHelpString(self) -> str:
        return 'Ajoute la variable "raepa_connection_name" à QGIS.'

    def initAlgorithm(self, config):
        default = QgsExpressionContextUtils.globalScope().variable('raepa_connection_name')
        param = QgsProcessingParameterProviderConnection(
            self.CONNECTION_NAME,
            "Connexion PostgreSQL vers la base de données",
            "postgres",
            defaultValue=default
        )
        param.setHelp("Base de données de destination")
        self.addParameter(param)

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

    def processAlgorithm(self, parameters, context, feedback):
        """
        Here is where the processing itself takes place.
        """
        connection_name = self.parameterAsConnectionName(parameters, self.CONNECTION_NAME, context)

        # Set global variable
        # noinspection PyCallByClass,PyArgumentList
        QgsExpressionContextUtils.setGlobalVariable('raepa_connection_name', connection_name)
        feedback.pushInfo('Connection PostgreSQL à la base RAEPA "{}"'.format(connection_name))

        msg = 'La configuration a été faite'
        feedback.pushInfo(msg)
        status = 1

        return {
            self.OUTPUT_STATUS: status,
            self.OUTPUT_STRING: msg
        }
