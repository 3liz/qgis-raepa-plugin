# -*- coding: utf-8 -*-

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
    QgsProcessingOutputString,
    QgsProcessingOutputNumber,
    QgsExpressionContextUtils
)
import os
from .tools import *
from db_manager.db_plugins import createDbPlugin

class ConvertImportedData(QgsProcessingAlgorithm):
    """
    Convert imported Shapefile data into Raepa model structure
    """

    ANNEE_FIN_POSE = 'ANNEE_FIN_POSE'
    QUALITE_XY = 'QUALITE_XY'
    QUALITE_Z = 'QUALITE_Z'
    ETAT = 'ETAT'
    SOURCE_HISTORIQUE = 'SOURCE_HISTORIQUE'
    CODE_CHANTIER = 'CODE_CHANTIER'
    OUTPUT_STRING = 'OUTPUT_STRING'
    OUTPUT_STATUS = 'OUTPUT_STATUS'

    def name(self):
        return 'convert_imported_data'

    def displayName(self):
        return self.tr('02 Convert imported data into Raepa model')

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

        # OUTPUTS
        # Add output for status (integer)
        self.addOutput(
            QgsProcessingOutputNumber(
                self.OUTPUT_STATUS,
                self.tr('Output status')
            )
        )
        self.addOutput(
            QgsProcessingOutputString(
                self.OUTPUT_STRING, self.tr('Output message')
            )
        )

    def checkParameterValues(self, parameters, context):

        # Check that the connection name has been configured
        connection_name = QgsExpressionContextUtils.globalScope().variable('raepa_connection_name')
        if not connection_name:
            return False, self.tr('You must use the "Configure Raepa plugin" alg to set the database connection name')

        # Check that it corresponds to an existing connection
        dbpluginclass = createDbPlugin( 'postgis' )
        connections = [c.connectionName() for c in dbpluginclass.connections()]
        if connection_name not in connections:
            return False, self.tr('The configured connection name does not exists in QGIS')

        return super(ConvertImportedData, self).checkParameterValues(parameters, context)

    def processAlgorithm(self, parameters, context, feedback):
        """
        Here is where the processing itself takes place.
        """
        connection_name = QgsExpressionContextUtils.globalScope().variable('raepa_connection_name')

        msg = ''
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

        [header, data, rowCount, ok, error_message] = fetchDataFromSqlQuery(
            connection_name,
            sql
        )
        if ok:
            msg = self.tr('Conversion successfull !')
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
