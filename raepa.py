"""
/***************************************************************************
 Raepa
                                 A QGIS plugin
 France only - Plugin dedicated to import and manage water network data by using Raepa standard
 Generated by Plugin Builder: http://g-sherman.github.io/Qgis-Plugin-Builder/
                              -------------------
        begin                : 2018-12-19
        copyright            : (C) 2018 by 3liz
        email                : info@3liz.com
 ***************************************************************************/

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

from qgis.core import QgsApplication, QgsMessageLog, Qgis
from qgis.utils import iface
from qgis.PyQt.QtCore import Qt
from qgis.PyQt.QtWidgets import QMessageBox

from .actions import (
    parcourir_reseau_depuis_cet_objet,
    couper_la_canalisation_sous_cet_ouvrage,
    annuler_la_derniere_modification,
    inverser_canalisation,
    parcourir_reseau_jusquaux_vannes,
    calcul_orientation_appareil,
    network_to_vanne,
)
from .dock import RaepaDock
from .processing.provider import RaepaProvider


class Raepa:

    def __init__(self):
        self.provider = None
        self.dock = None

    def initProcessing(self):
        """Init Processing provider for QGIS >= 3.8."""
        self.provider = RaepaProvider()
        QgsApplication.processingRegistry().addProvider(self.provider)

    def initGui(self):
        """Init the user interface."""
        self.initProcessing()
        self.dock = RaepaDock()
        iface.addDockWidget(Qt.RightDockWidgetArea, self.dock)

    def unload(self):
        """Unload the plugin."""
        QgsApplication.processingRegistry().removeProvider(self.provider)
        iface.removeDockWidget(self.dock)
        self.dock.deleteLater()

    @staticmethod
    def run_action(name, *args):
        """Run a specific action.

        Do not rename this function, it's part of the public API of the plugin.

        These lines are included in the QGIS project.

        from qgis.utils import plugins
        plugins['raepa'].run_action('action_name', params)
        """
        # Dictionary of actions
        # number of arguments it expects
        # function to call
        # extra args to add on runtime
        actions = {
            'inverser_canalisation':
                [2, inverser_canalisation],
            'ouvrage_annuler_derniere_modification':
                [2, annuler_la_derniere_modification],
            'ouvrage_couper_canalisation_sous_cet_ouvrage':
                [2, couper_la_canalisation_sous_cet_ouvrage],
            'parcourir_reseau_depuis_cet_objet':
                [2, parcourir_reseau_depuis_cet_objet, 0],
            'parcourir_reseau_jusquaux_vannes':
                [2, parcourir_reseau_jusquaux_vannes],
            'calcul_orientation_appareil':
                [1, calcul_orientation_appareil],
            'network_to_vanne':
                [1, network_to_vanne]
        }
        if name not in actions:
            QMessageBox.critical(
                None, 'Action non trouvée', 'L\'action n\'a pas été trouvée.')
            return

        if actions[name][0] != len(args):
            QMessageBox.critical(
                None, 'Mauvais nombre d\'arguments', 'Mauvais nombre d\'arguments pour l\'action.')
            return

        params = list(args)
        if len(actions[name]) > 2:
            params += actions[name][2:]

        QgsMessageLog.logMessage(
            'Appel de l\'action {} avec les arguments: {}'.format(name, ', '.join(['{}'.format(i) for i in params])),
            'RAEPA', Qgis.Info)
        actions[name][1](*params)
