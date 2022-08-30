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
    QgsProcessingParameterBoolean,
    QgsProcessingParameterEnum,
    QgsProcessingParameterString,
)

from raepa.processing.algorithms.execute_sql import ExecuteSql


class InsertConvertedData(ExecuteSql):
    """
    Insert imported and converted data into the schema raepa
    """

    TYPE = 'TYPE'
    SOURCE_HISTORIQUE = 'SOURCE_HISTORIQUE'
    CODE_CHANTIER = 'CODE_CHANTIER'
    NETTOYER_AVANT_INSERTION = 'NETTOYER_AVANT_INSERTION'

    def __init__(self):
        super().__init__()
        self.import_type = ['ASS', 'AEP']

    def name(self):
        return 'insert_converted_data'

    def displayName(self):
        return '03 Insertion données converties'

    def shortHelpString(self) -> str:
        # TODO
        return None

    def group(self):
        return 'Import'

    def groupId(self):
        return 'raepa_import'

    def initAlgorithm(self, config):
        super(self.__class__, self).initAlgorithm(config)

        # INPUTS
        self.removeParameter('INPUT_SQL')

        self.addParameter(
            QgsProcessingParameterEnum(
                self.TYPE,
                'Type d\'import',
                self.import_type,
                False,
                0
            )
        )
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

    def setSql(self, parameters, context, feedback):
        import_TYPE = self.parameterAsEnum(parameters, self.TYPE, context)
        import_TYPE = self.import_type[import_TYPE].lower()
        sql = '''SELECT raepa.import_tables_temporaires_dans_raepa(
            '%s', '%s', %s, '%s'
        )
        ''' % (
            parameters[self.SOURCE_HISTORIQUE],
            parameters[self.CODE_CHANTIER],
            parameters[self.NETTOYER_AVANT_INSERTION],
            import_TYPE
        )
        feedback.pushInfo('Insertion données converties dans le schéma RAEPA.')
        feedback.pushInfo(sql)

        self.SQL = sql.replace('\n', ' ').rstrip(';')
