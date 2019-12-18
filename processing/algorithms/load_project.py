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

from qgis.core import (
    QgsProcessingAlgorithm,
    QgsProcessingParameterString,
    QgsProcessingOutputString,
    QgsProcessingOutputNumber,
    QgsExpressionContextUtils,
    QgsVectorLayer,
    QgsProcessingOutputMultipleLayers,
    QgsProcessingContext,
    QgsApplication,
    QgsProject
)
from qgis.PyQt.QtSql import *
from .tools import *
from processing.tools.postgis import uri_from_name, GeoDB
import os

class LoadProject(QgsProcessingAlgorithm):
    """

    """

    # Constants used to refer to parameters and outputs. They will be
    # used when calling the algorithm from another algorithm, or when
    # calling from the QGIS console.

    RIEN = 'RIEN'

    OUTPUT_LAYERS = 'OUTPUT_LAYERS'
    OUTPUT_STRING = 'OUTPUT_STRING'

    def name(self):
        return 'load_project'

    def displayName(self):
        return self.tr('Load project after generated database')

    def group(self):
        return self.tr('Configuration')

    def groupId(self):
        return 'raepa_configuration'

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
                self.RIEN, 'Champ qui sert à rien !',
                optional=True
            )
        )


        # OUTPUTS
        # Add output for message
        self.addOutput(
            QgsProcessingOutputString(
                self.OUTPUT_STRING,
                self.tr('Output message')
            )
        )

        self.addOutput(
            QgsProcessingOutputMultipleLayers(
                self.OUTPUT_LAYERS,
                self.tr('Output message')
            )
        )

    def initLayer(self, context, uri, table, geom, sql, id):
        layer = None
        uri.setDataSource("raepa", table, geom, sql, id)
        layer = QgsVectorLayer(uri.uri(), table, "postgres")
        context.temporaryLayerStore().addMapLayer(layer)
        context.addLayerToLoadOnCompletion(
            layer.id(),
            QgsProcessingContext.LayerDetails(table,
                context.project(),
                self.OUTPUT_LAYERS
            )
        )
        return layer

    def processAlgorithm(self, parameters, context, feedback):
        """
        Here is where the processing itself takes place.
        """
        uri = uri_from_name(QgsExpressionContextUtils.globalScope().variable('raepa_connection_name'))


        layers_name = {
            "sys_structure_metadonnee": {'geomfield': None, 'pk': 'id'},
            "sys_liste_table": {'geomfield': None, 'pk': 'id'},
            "sys_organisme_gestionnaire": {'geomfield': None, 'pk': 'id'},
            "val_raepa_cat_canal_ae": {'geomfield': None, 'pk': 'id'},
            "val_raepa_cat_canal_ass": {'geomfield': None, 'pk': 'id'},
            "val_raepa_fonc_app_ae":{'geomfield': None, 'pk': 'id'},
            "val_raepa_fonc_app_ass":{'geomfield': None, 'pk': 'id'},
            "val_raepa_fonc_canal_ae":{'geomfield': None, 'pk': 'id'},
            "val_raepa_fonc_canal_ass":{'geomfield': None, 'pk': 'id'},
            "val_raepa_fonc_ouv_ae":{'geomfield': None, 'pk': 'id'},
            "commune": {'geomfield': "geom", 'pk': 'id'},
            "_val_raepa_precision_annee":{'geomfield': None, 'pk': 'id'},
            "_val_raepa_type_intervention_ass":{'geomfield': None, 'pk': 'id'},
            "raepa_apparaep_p": {'geomfield': "geom", 'pk': 'id'},
            "raepa_apparass_p": {'geomfield': "geom", 'pk': 'id'},
            "affleurant_pcrs": {'geomfield': "geom", 'pk': 'id'},
            "_val_raepa_etat_canal_ass":{'geomfield': None, 'pk': 'id'},
            "_val_raepa_forme_canal_ass":{'geomfield': None, 'pk': 'id'},
            "raepa_canalaep_l": {'geomfield': "geom", 'pk': 'id'},
            "raepa_reparaep_p": {'geomfield': "geom", 'pk': 'id'},
            "raepa_reparass_p": {'geomfield': "geom", 'pk': 'id'},
            "raepa_ouvraep_p": {'geomfield': "geom", 'pk': 'id'},
            "raepa_ouvrass_p": {'geomfield': "geom", 'pk': 'id'},
            "raepa_canalass_l": {'geomfield': "geom", 'pk': 'id'},
            "v_canalisation_avec_z_manquant":{'geomfield': "geom", 'pk': 'id'},
            "v_canalisation_avec_zaval_manquant":{'geomfield': "geom", 'pk': 'id'},
            "v_canalisation_branchement":{'geomfield': "geom", 'pk': 'id'},
            "v_canalisation_sans_ouvrage":{'geomfield': "geom", 'pk': 'id'},
            "val_raepa_qualite_geoloc":{'geomfield': None, 'pk': 'id'},
            "val_raepa_qualite_anpose":{'geomfield': None, 'pk': 'id'},
            "val_raepa_typ_reseau_ass":{'geomfield': None, 'pk': 'id'},
            "val_raepa_materiau":{'geomfield': None, 'pk': 'id'},
            "val_raepa_mode_circulation":{'geomfield': None, 'pk': 'id'},
            "val_raepa_fonc_ouv_ass":{'geomfield': None, 'pk': 'id'},
            "val_raepa_type_defaillance":{'geomfield': None, 'pk': 'id'},
            "val_raepa_support_reparation":{'geomfield': None, 'pk': 'id'}
        }
        output_layers = []
        msg = ''
        msgl = ''
        for e in layers_name:
            layer = self.initLayer(context, uri, e, layers_name[e]['geomfield'], "", layers_name[e]['pk'])
            if layer.isValid():
                output_layers.append(layer)
                msgl += " ## "+layer.name()+" loaded ##"

            else:
                msgl += " !! "+layer.name()+" did not load !!"


        if len(output_layers) > 0:
            msg = 'Import de couche ok ! '
        msg += msgl
        return {
            self.OUTPUT_LAYERS: output_layers,
            self.OUTPUT_STRING: msg
        }
