"""Export gabarits AEP/ASS."""

import os
import shutil

from qgis.core import (
    QgsProcessingParameterFileDestination,
    QgsProcessingParameterEnum,
)

from ...qgis_plugin_tools.tools.algorithm_processing import BaseProcessingAlgorithm
from ...qgis_plugin_tools.tools.resources import plugin_path

__copyright__ = 'Copyright 2019, 3Liz'
__license__ = 'GPL version 3'
__email__ = 'info@3liz.org'
__revision__ = '$Format:%H$'


class ExportGabarits(BaseProcessingAlgorithm):

    TYPE = 'TYPE'
    DESTINATION = 'DESTINATION'
    CRS = 'CRS'

    def __init__(self):
        super().__init__()
        self.gabarit_type = ['ASS', 'AEP']
        self.projection = ['EPSG:2154', 'EPSG:32620']

    def name(self):
        return 'gabarits'

    def displayName(self):
        return 'Obtenir les gabarits AEP/ASS'

    def group(self):
        return 'Outils'

    def groupId(self):
        return 'raepa_tools'

    def shortHelpString(self) -> str:
        return 'Obtenir un zip des gabarits AEP/ASS'

    def initAlgorithm(self, config):

        self.addParameter(
            QgsProcessingParameterEnum(
                self.TYPE,
                'Type de gabarits',
                self.gabarit_type,
                False,
                0
            )
        )

        self.addParameter(
            QgsProcessingParameterEnum(
                self.CRS, 'Projection',
                self.projection,
                optional=False
            )
        )

        self.addParameter(
            QgsProcessingParameterFileDestination(
                self.DESTINATION,
                'Fichier ZIP',
                fileFilter='zip'
            )
        )

    def processAlgorithm(self, parameters, context, feedback):
        gabarit = self.parameterAsEnum(parameters, self.TYPE, context)
        gabarit = self.gabarit_type[gabarit].lower()
        crs = self.parameterAsEnum(parameters, self.CRS, context)
        crs = self.projection[crs - 1]
        zip_path = self.parameterAsFile(parameters, self.DESTINATION, context)

        if not zip_path.lower().endswith('.zip'):
            zip_path += '.zip'

        if os.path.exists(zip_path):
            feedback.pushDebugInfo('Le fichier zip existe. Suppression du zip existant.')
            os.remove(zip_path)

        crs = crs.replace('EPSG:', '')
        source_zip = 'gabarits_{}_{}.zip'.format(gabarit, crs)
        source = os.path.join(plugin_path(), 'import', 'gabarits', source_zip)
        shutil.copyfile(source, zip_path)

        feedback.pushInfo('Copie du zip vers "{}"'.format(zip_path))

        output = {
            self.DESTINATION: zip_path
        }
        return output
