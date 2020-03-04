<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="3.4.13-Madeira" styleCategories="Actions">
  <attributeactions>
    <defaultAction key="Canvas" value="{00000000-0000-0000-0000-000000000000}"/>
    <actionsetting action="from qgis.utils import plugins&#xa;plugins['raepa'].run_action(&#xa;    'parcourir_reseau_depuis_cet_objet',&#xa;    '[% idouvrage %]',&#xa;    0&#xa;)" capture="0" isEnabledOnlyWhenEditable="0" type="1" id="{1e5d98eb-d17d-4a6b-931b-449da645abb7}" name="Parcourir le réseau depuis cet objet" shortTitle="" icon="" notificationMessage="">
      <actionScope id="Feature"/>
      <actionScope id="Field"/>
      <actionScope id="Canvas"/>
    </actionsetting>
    <actionsetting action="from qgis.utils import plugins&#xa;plugins['raepa'].run_action(&#xa;    'ouvrage_annuler_derniere_modification',&#xa;    '[% idouvrage %]',&#xa;    '[% @layer_id %]'&#xa;)" capture="0" isEnabledOnlyWhenEditable="0" type="1" id="{fba02aa2-e198-465a-a32b-a8732055a1f6}" name="Annuler la dernière modification" shortTitle="" icon="" notificationMessage="">
      <actionScope id="Feature"/>
      <actionScope id="Canvas"/>
    </actionsetting>
    <actionsetting action="from qgis.utils import plugins&#xa;plugins['raepa'].run_action(&#xa;    'ouvrage_couper_canalisation_sous_cet_ouvrage',&#xa;    '[% idouvrage %]',&#xa;    '[% @layer_id %]'&#xa;)" capture="0" isEnabledOnlyWhenEditable="0" type="1" id="{360178e6-c002-4276-a2f4-4f5cdee65480}" name="Couper la canalisation sous cet ouvrage" shortTitle="" icon="" notificationMessage="">
      <actionScope id="Feature"/>
      <actionScope id="Field"/>
      <actionScope id="Canvas"/>
    </actionsetting>
  </attributeactions>
  <layerGeometryType>0</layerGeometryType>
</qgis>
