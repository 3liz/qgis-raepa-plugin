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
    QgsProcessingParameterBoolean
)

from .execute_sql import *


class InsertConvertedData(ExecuteSql):
    """
    Insert imported and converted data into the schema raepa
    """

    SOURCE_HISTORIQUE = 'SOURCE_HISTORIQUE'
    CODE_CHANTIER = 'CODE_CHANTIER'
    NETTOYER_AVANT_INSERTION = 'NETTOYER_AVANT_INSERTION'

    def name(self):
        return 'insert_converted_data'

    def displayName(self):
        return self.tr('03 Insert converted data')

    def shortHelpString(self) -> str:
        # TODO
        return None

    def group(self):
        return self.tr('Import')

    def groupId(self):
        return 'raepa_import'

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
                self.SOURCE_HISTORIQUE, 'Source historique',
                defaultValue='test',
                optional=False
            )
        )
        self.addParameter(
            QgsProcessingParameterString(
                self.CODE_CHANTIER, 'Code Chantier',
                defaultValue='test',
                optional=False
            )
        )
        self.addParameter(
            QgsProcessingParameterBoolean(
                self.NETTOYER_AVANT_INSERTION, 'Nettoyer avant insertion',
                defaultValue=True,
                optional=False
            )
        )

    def checkParameterValues(self, parameters, context):
        return super(InsertConvertedData, self).checkParameterValues(parameters, context)

    def setSql(self, parameters, context, feedback):
        sql = '''SELECT raepa.import_tables_temporaires_dans_raepa(
            '%s', '%s', %s
        )
        ''' % (
            parameters[self.SOURCE_HISTORIQUE],
            parameters[self.CODE_CHANTIER],
            parameters[self.NETTOYER_AVANT_INSERTION]
        )
        feedback.pushInfo(self.tr('Insert converted data into the raepa schema.'))
        feedback.pushInfo(sql)

        self.SQL = sql.replace('\n', ' ').rstrip(';')
