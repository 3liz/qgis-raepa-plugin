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
    QgsProcessingParameterEnum
)

from .execute_sql import ExecuteSql


class ConvertImportedData(ExecuteSql):
    """
    Convert imported Shapefile data into Raepa model structure
    """

    TYPE = 'TYPE'
    ANNEE_FIN_POSE = 'ANNEE_FIN_POSE'
    QUALITE_XY = 'QUALITE_XY'
    QUALITE_Z = 'QUALITE_Z'
    ETAT = 'ETAT'
    SOURCE_HISTORIQUE = 'SOURCE_HISTORIQUE'
    CODE_CHANTIER = 'CODE_CHANTIER'

    def __init__(self):
        super().__init__()
        self.import_type = ['ASS', 'AEP']

    def name(self):
        return 'convert_imported_data'

    def displayName(self):
        return '02 Conversion données importées dans le modèle RAEPA'

    def group(self):
        return 'Import'

    def groupId(self):
        return 'raepa_import'

    def shortHelpString(self) -> str:
        # TODO
        return None

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
                self.ANNEE_FIN_POSE, 'Année de fin de pose',
                defaultValue='2018',
                optional=False
            )
        )
        self.addParameter(
            QgsProcessingParameterString(
                self.QUALITE_XY, 'Qualité XY',
                defaultValue='A',
                optional=False
            )
        )
        self.addParameter(
            QgsProcessingParameterString(
                self.QUALITE_Z, 'Qualité Z',
                defaultValue='A',
                optional=False
            )
        )
        self.addParameter(
            QgsProcessingParameterString(
                self.ETAT, 'État',
                defaultValue='00',
                optional=False
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

    def setSql(self, parameters, context, feedback):
        import_TYPE = self.parameterAsEnum(parameters, self.TYPE, context)
        import_TYPE = self.import_type[import_TYPE].lower()
        sql = '''
        SELECT raepa.import_gabarit_dans_tables_temporaires(
            '%s', '%s', '%s', '%s',
            '%s', '%s', '%s'
        )
        ''' % (
            parameters[self.ANNEE_FIN_POSE],
            parameters[self.QUALITE_XY], parameters[self.QUALITE_Z],
            parameters[self.ETAT],
            parameters[self.SOURCE_HISTORIQUE], parameters[self.CODE_CHANTIER],
            import_TYPE
        )
        feedback.pushInfo('Conversion des données importées')
        feedback.pushInfo(sql)

        self.SQL = sql.replace('\n', ' ').rstrip(';')
