<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="3.4.13-Madeira" styleCategories="Actions">
  <attributeactions>
    <defaultAction key="Canvas" value="{00000000-0000-0000-0000-000000000000}"/>
    <actionsetting action="from qgis.utils import plugins&#xa;plugins['raepa'].run_action(&#xa;    'parcourir_reseau_depuis_cet_objet',&#xa;    '[% idappareil %]',&#xa;    0&#xa;)" capture="0" isEnabledOnlyWhenEditable="0" type="1" id="{b3bb6295-70ae-44c6-97f7-bbc71a51d4ee}" name="Parcourir le réseau depuis cet objet" shortTitle="" icon="" notificationMessage="">
      <actionScope id="Feature"/>
      <actionScope id="Field"/>
      <actionScope id="Canvas"/>
    </actionsetting>
    <actionsetting action="from qgis.utils import plugins&#xa;plugins['raepa'].run_action(&#xa;    'calcul_orientation_appareil',&#xa;    '[% idappareil %]',&#xa;)" capture="0" isEnabledOnlyWhenEditable="0" type="1" id="{efbd9a79-f784-43b0-876a-c3254754d686}" name="Calcul de l'orientation de l'appareil" shortTitle="" icon="" notificationMessage="">
      <actionScope id="Feature"/>
      <actionScope id="Field"/>
      <actionScope id="Canvas"/>
    </actionsetting>
  </attributeactions>
  <layerGeometryType>0</layerGeometryType>
</qgis>
