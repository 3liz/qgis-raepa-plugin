<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="3.4.13-Madeira" styleCategories="Actions">
  <attributeactions>
    <actionsetting action="from qgis.utils import plugins&#xa;plugins['raepa'].run_action(&#xa;    'parcourir_reseau_jusquaux_vannes_fermees',&#xa;    '[% @click_x %]',&#xa;    '[% @click_y %]'&#xa;)" capture="0" isEnabledOnlyWhenEditable="0" type="1" id="{b661253b-1f14-4077-a7e2-8375868562db}" name="Parcours jusqu'aux vannes fermées" shortTitle="Parcours réseaux jusqu'aux vannes fermées depuis un point" icon="" notificationMessage="">
      <actionScope id="Canvas"/>
    </actionsetting>
    <actionsetting action="from qgis.utils import plugins&#xa;plugins['raepa'].run_action(&#xa;    'parcourir_reseau_jusquaux_vannes',&#xa;    '[% @click_x %]',&#xa;    '[% @click_y %]'&#xa;)" capture="0" isEnabledOnlyWhenEditable="0" type="1" id="{b661253b-1f14-4077-a7e2-8375868562db}" name="Parcours jusqu'aux vannes" shortTitle="Parcours réseaux jusqu'aux vannes depuis un point" icon="" notificationMessage="">
      <actionScope id="Canvas"/>
    </actionsetting>
    <actionsetting action="from qgis.utils import plugins&#xa;plugins['raepa'].run_action(&#xa;    'inverser_canalisation',&#xa;    '[% id %]',&#xa;    '[% @layer_id %]'&#xa;)" capture="0" isEnabledOnlyWhenEditable="0" type="1" id="{b661253b-1f14-4077-a7e2-8375868562db}" name="Inverser la canalisation" shortTitle="Inverser la canalisation" icon="" notificationMessage="">
      <actionScope id="Feature"/>
      <actionScope id="Field"/>
    </actionsetting>
    <actionsetting action="from qgis.utils import plugins&#xa;plugins['raepa'].run_action(&#xa;    'parcourir_reseau_depuis_cet_objet',&#xa;    '[% idcana %]',&#xa;    0&#xa;)" capture="0" isEnabledOnlyWhenEditable="0" type="1" id="{2a9144ec-949e-42c0-89d3-9fe9020b32dd}" name="Parcourir le réseau depuis cet objet" shortTitle="" icon="" notificationMessage="">
      <actionScope id="Feature"/>
      <actionScope id="Field"/>
      <actionScope id="Canvas"/>
    </actionsetting>
    <actionsetting action="from qgis.utils import plugins&#xa;plugins['raepa'].run_action(&#xa;    'network_to_vanne',&#xa;    '[% idcana %]'&#xa;)" capture="0" isEnabledOnlyWhenEditable="0" type="1" id="{1249ed38-1d64-4036-a8e3-bdf8a363898a}" name="Parcourir le sous réseau jusqu'à une vanne" shortTitle="Parcours réseau vanne" icon="" notificationMessage="">
      <actionScope id="Feature"/>
      <actionScope id="Field"/>
      <actionScope id="Canvas"/>
    </actionsetting>
  </attributeactions>
  <layerGeometryType>1</layerGeometryType>
</qgis>
