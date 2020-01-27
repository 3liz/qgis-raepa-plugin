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

from .execute_sql import *


class ConvertImportedData(ExecuteSql):
    """
    Convert imported Shapefile data into Raepa model structure
    """

    ANNEE_FIN_POSE = 'ANNEE_FIN_POSE'
    QUALITE_XY = 'QUALITE_XY'
    QUALITE_Z = 'QUALITE_Z'
    ETAT = 'ETAT'
    SOURCE_HISTORIQUE = 'SOURCE_HISTORIQUE'
    CODE_CHANTIER = 'CODE_CHANTIER'

    def name(self):
        return 'convert_imported_data'

    def displayName(self):
        return self.tr('02 Convert imported data into Raepa model')

    def group(self):
        return self.tr('Import')

    def groupId(self):
        return 'raepa_import'

    def shortHelpString(self) -> str:
        # TODO
        return None

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

    def checkParameterValues(self, parameters, context):
        return super(ConvertImportedData, self).checkParameterValues(parameters, context)

    def setSql(self, parameters, context, feedback):
        sql = '''
        SELECT raepa.import_gabarit_dans_tables_temporaires(
            '%s', '%s', '%s', '%s',
            '%s', '%s'
        )
        ''' % (
            parameters[self.ANNEE_FIN_POSE],
            parameters[self.QUALITE_XY], parameters[self.QUALITE_Z],
            parameters[self.ETAT],
            parameters[self.SOURCE_HISTORIQUE], parameters[self.CODE_CHANTIER]
        )
        feedback.pushInfo(self.tr('Convert imported data'))
        feedback.pushInfo(sql)

        self.SQL = sql.replace('\n', ' ').rstrip(';')
