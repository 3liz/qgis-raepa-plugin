<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="3.10.14-A Coruña" styleCategories="Actions">
  <attributeactions>
    <defaultAction value="{00000000-0000-0000-0000-000000000000}" key="Canvas"/>
    <actionsetting shortTitle="" isEnabledOnlyWhenEditable="0" type="1" id="{2a1dea20-c895-477e-ac50-65733bc3ea58}" icon="" action="from qgis.utils import plugins&#xa;plugins['raepa'].run_action(&#xa;    'parcourir_reseau_depuis_cet_objet',&#xa;    '[% idouvrage %]',&#xa;    0&#xa;)" notificationMessage="" name="Parcourir le réseau depuis cet objet" capture="0">
      <actionScope id="Feature"/>
      <actionScope id="Canvas"/>
      <actionScope id="Field"/>
    </actionsetting>
    <actionsetting shortTitle="" isEnabledOnlyWhenEditable="0" type="1" id="{370a8188-ce76-4d53-8054-2c6aff523d4c}" icon="" action="from qgis.utils import plugins&#xa;plugins['raepa'].run_action(&#xa;    'ouvrage_annuler_derniere_modification',&#xa;    '[% idouvrage %]',&#xa;    '[% @layer_id %]'&#xa;)" notificationMessage="" name="Annuler la dernière modification" capture="0">
      <actionScope id="Feature"/>
      <actionScope id="Canvas"/>
    </actionsetting>
  </attributeactions>
  <layerGeometryType>0</layerGeometryType>
</qgis>
