<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="3.10.14-A Coruña" styleCategories="Actions">
  <attributeactions>
    <defaultAction value="{00000000-0000-0000-0000-000000000000}" key="Canvas"/>
    <actionsetting shortTitle="" name="Parcourir le réseau depuis cet objet" icon="" notificationMessage="" type="1" id="{fdbef2bf-aed1-43ba-a9d2-e99475cdf871}" isEnabledOnlyWhenEditable="0" capture="0" action="from qgis.utils import plugins&#xa;plugins['raepa'].run_action(&#xa;    'parcourir_reseau_depuis_cet_objet',&#xa;    '[% idouvrage %]',&#xa;    0&#xa;)">
      <actionScope id="Canvas"/>
      <actionScope id="Field"/>
      <actionScope id="Feature"/>
    </actionsetting>
    <actionsetting shortTitle="" name="Annuler la dernière modification" icon="" notificationMessage="" type="1" id="{ac2bf017-8c8b-4191-b480-c2bb5f0b4c5c}" isEnabledOnlyWhenEditable="0" capture="0" action="from qgis.utils import plugins&#xa;plugins['raepa'].run_action(&#xa;    'ouvrage_annuler_derniere_modification',&#xa;    '[% idouvrage %]',&#xa;    '[% @layer_id %]'&#xa;)">
      <actionScope id="Canvas"/>
      <actionScope id="Feature"/>
    </actionsetting>
  </attributeactions>
  <layerGeometryType>0</layerGeometryType>
</qgis>
