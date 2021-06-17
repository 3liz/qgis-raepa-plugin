<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis styleCategories="AllStyleCategories" minScale="2501" labelsEnabled="1" version="3.10.14-A Coruña" simplifyDrawingHints="0" simplifyMaxScale="1" simplifyDrawingTol="1" maxScale="1" readOnly="0" hasScaleBasedVisibilityFlag="1" simplifyLocal="0" simplifyAlgorithm="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 type="RuleRenderer" forceraster="0" symbollevels="0" enableorderby="0">
    <rules key="{6736e613-3750-466f-8a9f-3310fefc92b3}">
      <rule symbol="0" label="Avaloir" key="{b7935d5d-17b1-4efa-9dcd-ce7065419c0d}" filter="&quot;fnouvass&quot; = '07'"/>
      <rule symbol="1" label="Chambre avec grille d'entrée" key="{b61883eb-a4c7-412b-b4d7-6999396f01cc}" filter="&quot;fnouvass&quot; = '_7'"/>
      <rule symbol="2" label="Regard double" key="{3103a62c-d84c-43d5-ac41-0530a9873cd5}" filter="&quot;fnouvass&quot; = '_3'"/>
      <rule symbol="3" label="Boîte de branchement" key="{e51c6d5a-9329-43d8-a377-e41b742e24d3}" filter="&quot;fnouvass&quot; = '_2'"/>
      <rule symbol="4" label="Désableur" key="{99742514-bc1e-4d8c-84df-493c1c0a4ee3}" filter="&quot;fnouvass&quot; = '_1'"/>
      <rule symbol="5" label="Station de pompage" key="{f18d5aa0-040c-40eb-83e6-2f50fd0dbfe2}" filter="&quot;fnouvass&quot; = '01'"/>
      <rule symbol="6" label="Séparateur d'hydrocarbures" key="{a58e9cd6-6bfa-482f-b54a-c2c5f08ad64e}" filter="&quot;fnouvass&quot; = '_6'"/>
      <rule symbol="7" label="Chambre de chasse" key="{2a5450d1-bf29-4f64-8700-b8f6c097e99c}" filter="&quot;fnouvass&quot; = '_5'"/>
      <rule symbol="8" label="Déversoir d'orage" key="{5124b632-c40c-42db-9a81-26c8ed050898}" filter="&quot;fnouvass&quot; = '04'"/>
      <rule symbol="9" label="Regard de visite" key="{6f401368-b8cc-4f8b-b3e1-6afb16df7684}" filter="&quot;fnouvass&quot; = '06'"/>
      <rule symbol="10" label="Racas" key="{2959f3a7-400d-4545-89e4-0859a8a98dd1}" filter="&quot;fnouvass&quot; = '_4'"/>
      <rule symbol="11" label="Autre" key="{b56796d8-f43d-4594-9034-e3b57e012d40}" filter="ELSE"/>
    </rules>
    <symbols>
      <symbol clip_to_extent="1" type="marker" force_rhr="0" alpha="1" name="0">
        <layer enabled="1" pass="3" locked="0" class="SvgMarker">
          <prop v="0" k="angle"/>
          <prop v="255,255,255,255" k="color"/>
          <prop v="0" k="fixedAspectRatio"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="/home/dhont/3liz_dev/QGIS/qgis-raepa-plugin/qgis/svg/avaloir.svg" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0,0,0,255" k="outline_color"/>
          <prop v="3" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MapUnit" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="0.8" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MapUnit" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option type="Map" name="properties">
                <Option type="Map" name="angle">
                  <Option type="bool" name="active" value="true"/>
                  <Option type="QString" name="expression" value="_angletampon"/>
                  <Option type="int" name="type" value="3"/>
                </Option>
              </Option>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" type="marker" force_rhr="0" alpha="1" name="1">
        <layer enabled="1" pass="3" locked="0" class="SimpleMarker">
          <prop v="0" k="angle"/>
          <prop v="255,255,255,255" k="color"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="square" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0,0,0,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MapUnit" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="0.5" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MapUnit" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option type="Map" name="properties">
                <Option type="Map" name="angle">
                  <Option type="bool" name="active" value="true"/>
                  <Option type="QString" name="field" value="_angletampon"/>
                  <Option type="int" name="type" value="2"/>
                </Option>
              </Option>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer enabled="1" pass="3" locked="0" class="SimpleMarker">
          <prop v="0" k="angle"/>
          <prop v="255,0,0,255" k="color"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="line" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0,0,0,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MapUnit" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="0.5" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MapUnit" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option type="Map" name="properties">
                <Option type="Map" name="angle">
                  <Option type="bool" name="active" value="true"/>
                  <Option type="QString" name="field" value="_angletampon"/>
                  <Option type="int" name="type" value="2"/>
                </Option>
              </Option>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer enabled="1" pass="3" locked="0" class="SimpleMarker">
          <prop v="0" k="angle"/>
          <prop v="255,0,0,255" k="color"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="line" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0,0,0,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MapUnit" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="0.5" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MapUnit" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option type="Map" name="properties">
                <Option type="Map" name="angle">
                  <Option type="bool" name="active" value="true"/>
                  <Option type="QString" name="field" value="_angletampon"/>
                  <Option type="int" name="type" value="2"/>
                </Option>
              </Option>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer enabled="1" pass="3" locked="0" class="SimpleMarker">
          <prop v="0" k="angle"/>
          <prop v="255,0,0,255" k="color"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="line" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0,0,0,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MapUnit" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="0.5" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MapUnit" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option type="Map" name="properties">
                <Option type="Map" name="angle">
                  <Option type="bool" name="active" value="true"/>
                  <Option type="QString" name="field" value="_angletampon"/>
                  <Option type="int" name="type" value="2"/>
                </Option>
              </Option>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" type="marker" force_rhr="0" alpha="1" name="10">
        <layer enabled="1" pass="0" locked="0" class="SimpleMarker">
          <prop v="0" k="angle"/>
          <prop v="255,255,255,255" k="color"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="circle" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0,0,0,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MapUnit" k="outline_width_unit"/>
          <prop v="area" k="scale_method"/>
          <prop v="0.3" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MapUnit" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer enabled="1" pass="0" locked="0" class="SimpleMarker">
          <prop v="0" k="angle"/>
          <prop v="0,0,0,255" k="color"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="circle" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0,0,0,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MapUnit" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="0.3" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MapUnit" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" type="marker" force_rhr="0" alpha="1" name="11">
        <layer enabled="1" pass="0" locked="0" class="SimpleMarker">
          <prop v="0" k="angle"/>
          <prop v="0,0,0,255" k="color"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="cross_fill" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0,0,0,255" k="outline_color"/>
          <prop v="no" k="outline_style"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MapUnit" k="outline_width_unit"/>
          <prop v="area" k="scale_method"/>
          <prop v="0.4" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MapUnit" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" type="marker" force_rhr="0" alpha="1" name="2">
        <layer enabled="1" pass="1" locked="0" class="SimpleMarker">
          <prop v="0" k="angle"/>
          <prop v="255,255,255,255" k="color"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="square" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="121,121,121,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MapUnit" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="1.6" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MapUnit" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option type="Map" name="properties">
                <Option type="Map" name="angle">
                  <Option type="bool" name="active" value="true"/>
                  <Option type="QString" name="field" value="_angletampon"/>
                  <Option type="int" name="type" value="2"/>
                </Option>
                <Option type="Map" name="size">
                  <Option type="bool" name="active" value="false"/>
                  <Option type="QString" name="expression" value="CASE &#xa;&#x9; WHEN @map_scale > 750 THEN 3 -- mm&#xa;&#x9; ELSE 1 -- metres&#xa; END"/>
                  <Option type="int" name="type" value="3"/>
                </Option>
              </Option>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer enabled="1" pass="1" locked="0" class="SimpleMarker">
          <prop v="0" k="angle"/>
          <prop v="255,0,0,255" k="color"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="line" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0,0,0,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MapUnit" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="1.6" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MapUnit" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option type="Map" name="properties">
                <Option type="Map" name="angle">
                  <Option type="bool" name="active" value="true"/>
                  <Option type="QString" name="field" value="_angletampon"/>
                  <Option type="int" name="type" value="2"/>
                </Option>
                <Option type="Map" name="size">
                  <Option type="bool" name="active" value="false"/>
                  <Option type="QString" name="expression" value="CASE &#xa;&#x9; WHEN @map_scale > 750 THEN 3 -- mm&#xa;&#x9; ELSE 1 -- metres&#xa; END"/>
                  <Option type="int" name="type" value="3"/>
                </Option>
              </Option>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" type="marker" force_rhr="0" alpha="1" name="3">
        <layer enabled="1" pass="1" locked="0" class="SimpleMarker">
          <prop v="0" k="angle"/>
          <prop v="255,255,255,255" k="color"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="circle" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0,0,0,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MapUnit" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="0.4" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MapUnit" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" type="marker" force_rhr="0" alpha="1" name="4">
        <layer enabled="1" pass="3" locked="0" class="EllipseMarker">
          <prop v="0" k="angle"/>
          <prop v="255,255,255,255" k="color"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="miter" k="joinstyle"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0,0,0,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MapUnit" k="outline_width_unit"/>
          <prop v="5" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MM" k="size_unit"/>
          <prop v="3" k="symbol_height"/>
          <prop v="3x:0,0,0,0,0,0" k="symbol_height_map_unit_scale"/>
          <prop v="MapUnit" k="symbol_height_unit"/>
          <prop v="rectangle" k="symbol_name"/>
          <prop v="5" k="symbol_width"/>
          <prop v="3x:0,0,0,0,0,0" k="symbol_width_map_unit_scale"/>
          <prop v="MapUnit" k="symbol_width_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option type="Map" name="properties">
                <Option type="Map" name="angle">
                  <Option type="bool" name="active" value="true"/>
                  <Option type="QString" name="expression" value="&quot;_angletampon&quot; + 90"/>
                  <Option type="int" name="type" value="3"/>
                </Option>
              </Option>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer enabled="1" pass="3" locked="0" class="SimpleMarker">
          <prop v="0" k="angle"/>
          <prop v="255,0,0,255" k="color"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="cross2" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0,0,0,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MapUnit" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="2.7" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MapUnit" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option type="Map" name="properties">
                <Option type="Map" name="angle">
                  <Option type="bool" name="active" value="true"/>
                  <Option type="QString" name="expression" value="&quot;_angletampon&quot; + 90"/>
                  <Option type="int" name="type" value="3"/>
                </Option>
              </Option>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" type="marker" force_rhr="0" alpha="1" name="5">
        <layer enabled="1" pass="3" locked="0" class="SimpleMarker">
          <prop v="0" k="angle"/>
          <prop v="255,255,255,255" k="color"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="circle" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0,0,0,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0.35" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="area" k="scale_method"/>
          <prop v="4" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MM" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <effect type="effectStack" enabled="0">
            <effect type="drawSource">
              <prop v="0" k="blend_mode"/>
              <prop v="2" k="draw_mode"/>
              <prop v="1" k="enabled"/>
              <prop v="1" k="opacity"/>
            </effect>
          </effect>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option type="Map" name="properties">
                <Option type="Map" name="outlineColor">
                  <Option type="bool" name="active" value="false"/>
                  <Option type="QString" name="expression" value="CASE WHEN channel_usage_current IN (4514, 4520) THEN '50,160,45,255' WHEN channel_usage_current = 4516 THEN '140,70,0,255' WHEN channel_usage_current = 4518 THEN '0,170,255,255' WHEN channel_usage_current = 4522 THEN '140,70,0,255' WHEN channel_usage_current IN (4524, 4526) THEN '255,0,0,255' ELSE '161,161,161,255' END"/>
                  <Option type="int" name="type" value="3"/>
                </Option>
              </Option>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer enabled="1" pass="3" locked="0" class="SimpleMarker">
          <prop v="0" k="angle"/>
          <prop v="0,0,0,255" k="color"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="equilateral_triangle" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MM" k="offset_unit"/>
          <prop v="0,0,0,255" k="outline_color"/>
          <prop v="no" k="outline_style"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MM" k="outline_width_unit"/>
          <prop v="area" k="scale_method"/>
          <prop v="3.7" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MM" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <effect type="effectStack" enabled="0">
            <effect type="drawSource">
              <prop v="0" k="blend_mode"/>
              <prop v="2" k="draw_mode"/>
              <prop v="1" k="enabled"/>
              <prop v="1" k="opacity"/>
            </effect>
          </effect>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option type="Map" name="properties">
                <Option type="Map" name="fillColor">
                  <Option type="bool" name="active" value="false"/>
                  <Option type="QString" name="expression" value="CASE WHEN channel_usage_current IN (4514, 4520) THEN '50,160,45,255' WHEN channel_usage_current = 4516 THEN '140,70,0,255' WHEN channel_usage_current = 4518 THEN '0,170,255,255' WHEN channel_usage_current = 4522 THEN '140,70,0,255' WHEN channel_usage_current IN (4524, 4526) THEN '255,0,0,255' ELSE '161,161,161,255' END"/>
                  <Option type="int" name="type" value="3"/>
                </Option>
              </Option>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" type="marker" force_rhr="0" alpha="1" name="6">
        <layer enabled="1" pass="3" locked="0" class="SimpleMarker">
          <prop v="0" k="angle"/>
          <prop v="255,255,255,255" k="color"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="square" k="name"/>
          <prop v="0.79999999999999993,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0,0,0,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MapUnit" k="outline_width_unit"/>
          <prop v="area" k="scale_method"/>
          <prop v="1.6" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MapUnit" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <effect type="effectStack" enabled="0">
            <effect type="drawSource">
              <prop v="0" k="blend_mode"/>
              <prop v="2" k="draw_mode"/>
              <prop v="1" k="enabled"/>
              <prop v="1" k="opacity"/>
            </effect>
          </effect>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option type="Map" name="properties">
                <Option type="Map" name="angle">
                  <Option type="bool" name="active" value="true"/>
                  <Option type="QString" name="field" value="_angletampon"/>
                  <Option type="int" name="type" value="2"/>
                </Option>
                <Option type="Map" name="outlineColor">
                  <Option type="bool" name="active" value="false"/>
                  <Option type="QString" name="expression" value="CASE WHEN channel_usage_current IN (4514, 4520) THEN '50,160,45,255' WHEN channel_usage_current = 4516 THEN '140,70,0,255' WHEN channel_usage_current = 4518 THEN '0,170,255,255' WHEN channel_usage_current = 4522 THEN '140,70,0,255' WHEN channel_usage_current IN (4524, 4526) THEN '255,0,0,255' ELSE '161,161,161,255' END"/>
                  <Option type="int" name="type" value="3"/>
                </Option>
              </Option>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer enabled="1" pass="3" locked="0" class="SimpleMarker">
          <prop v="0" k="angle"/>
          <prop v="255,255,255,255" k="color"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="square" k="name"/>
          <prop v="-0.79999999999999993,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0,0,0,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MapUnit" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="1.6" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MapUnit" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option type="Map" name="properties">
                <Option type="Map" name="angle">
                  <Option type="bool" name="active" value="true"/>
                  <Option type="QString" name="field" value="_angletampon"/>
                  <Option type="int" name="type" value="2"/>
                </Option>
              </Option>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer enabled="1" pass="3" locked="0" class="SimpleMarker">
          <prop v="0" k="angle"/>
          <prop v="255,255,255,255" k="color"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="circle" k="name"/>
          <prop v="0.71999999999999986,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0,0,0,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MapUnit" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="1.12" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MapUnit" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option type="Map" name="properties">
                <Option type="Map" name="angle">
                  <Option type="bool" name="active" value="true"/>
                  <Option type="QString" name="field" value="_angletampon"/>
                  <Option type="int" name="type" value="2"/>
                </Option>
              </Option>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer enabled="1" pass="3" locked="0" class="SimpleMarker">
          <prop v="0" k="angle"/>
          <prop v="255,255,255,255" k="color"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="circle" k="name"/>
          <prop v="-0.71999999999999997,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0,0,0,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MapUnit" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="1.12" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MapUnit" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option type="Map" name="properties">
                <Option type="Map" name="angle">
                  <Option type="bool" name="active" value="true"/>
                  <Option type="QString" name="field" value="_angletampon"/>
                  <Option type="int" name="type" value="2"/>
                </Option>
              </Option>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" type="marker" force_rhr="0" alpha="1" name="7">
        <layer enabled="1" pass="3" locked="0" class="SimpleMarker">
          <prop v="0" k="angle"/>
          <prop v="255,255,255,255" k="color"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="circle" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0,0,0,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MapUnit" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="1" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MapUnit" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer enabled="1" pass="3" locked="0" class="SimpleMarker">
          <prop v="0" k="angle"/>
          <prop v="255,255,255,255" k="color"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="circle" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0,0,0,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MapUnit" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="0.466668" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MapUnit" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" type="marker" force_rhr="0" alpha="1" name="8">
        <layer enabled="1" pass="2" locked="0" class="SimpleMarker">
          <prop v="0" k="angle"/>
          <prop v="255,255,255,255" k="color"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="square" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0,0,0,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MapUnit" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="1" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MapUnit" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer enabled="1" pass="2" locked="0" class="SimpleMarker">
          <prop v="45" k="angle"/>
          <prop v="255,0,0,255" k="color"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="line" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0,0,0,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MapUnit" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="1" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MapUnit" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" type="marker" force_rhr="0" alpha="1" name="9">
        <layer enabled="1" pass="1" locked="0" class="SimpleMarker">
          <prop v="0" k="angle"/>
          <prop v="255,255,255,255" k="color"/>
          <prop v="1" k="horizontal_anchor_point"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="circle" k="name"/>
          <prop v="0,0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0,0,0,255" k="outline_color"/>
          <prop v="solid" k="outline_style"/>
          <prop v="0" k="outline_width"/>
          <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
          <prop v="MapUnit" k="outline_width_unit"/>
          <prop v="diameter" k="scale_method"/>
          <prop v="1.2" k="size"/>
          <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
          <prop v="MapUnit" k="size_unit"/>
          <prop v="1" k="vertical_anchor_point"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </symbols>
    <effect type="effectStack" enabled="0">
      <effect type="drawSource">
        <prop v="0" k="blend_mode"/>
        <prop v="2" k="draw_mode"/>
        <prop v="1" k="enabled"/>
        <prop v="1" k="opacity"/>
      </effect>
    </effect>
  </renderer-v2>
  <labeling type="simple">
    <settings calloutType="simple">
      <text-style multilineHeight="1" fontWeight="50" fontWordSpacing="0" namedStyle="Normal" textColor="0,0,0,255" fontUnderline="0" fontStrikeout="0" fontCapitals="0" textOrientation="horizontal" fontItalic="0" blendMode="0" useSubstitutions="0" fontKerning="1" textOpacity="1" fontSizeMapUnitScale="3x:0,0,0,0,0,0" fontLetterSpacing="0" previewBkgrdColor="255,255,255,255" isExpression="1" fontSize="7" fontSizeUnit="Point" fieldName="concat(&#xa;&#x9;coalesce('TN ' || round(&quot;_ztampon&quot;, 2), ''),&#xa;&#x9;'@',&#xa;&#x9;coalesce('RD ' || round(&quot;z&quot;, 2), '')&#xa;)&#xa;&#xa;" fontFamily="MS Shell Dlg 2">
        <text-buffer bufferOpacity="1" bufferDraw="1" bufferNoFill="0" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferColor="255,255,255,255" bufferSize="1" bufferJoinStyle="64" bufferBlendMode="0" bufferSizeUnits="MM"/>
        <background shapeRotation="0" shapeOpacity="1" shapeSizeType="0" shapeOffsetX="0" shapeJoinStyle="64" shapeSizeUnit="MM" shapeRotationType="0" shapeBorderColor="128,128,128,255" shapeRadiiY="0" shapeOffsetY="0" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiUnit="MM" shapeBorderWidthUnit="MM" shapeSizeY="0" shapeType="0" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeBlendMode="0" shapeOffsetUnit="MM" shapeDraw="0" shapeSVGFile="" shapeFillColor="255,255,255,255" shapeRadiiX="0" shapeBorderWidth="0" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeSizeX="0">
          <symbol clip_to_extent="1" type="marker" force_rhr="0" alpha="1" name="markerSymbol">
            <layer enabled="1" pass="0" locked="0" class="SimpleMarker">
              <prop v="0" k="angle"/>
              <prop v="133,182,111,255" k="color"/>
              <prop v="1" k="horizontal_anchor_point"/>
              <prop v="bevel" k="joinstyle"/>
              <prop v="circle" k="name"/>
              <prop v="0,0" k="offset"/>
              <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
              <prop v="MM" k="offset_unit"/>
              <prop v="35,35,35,255" k="outline_color"/>
              <prop v="solid" k="outline_style"/>
              <prop v="0" k="outline_width"/>
              <prop v="3x:0,0,0,0,0,0" k="outline_width_map_unit_scale"/>
              <prop v="MM" k="outline_width_unit"/>
              <prop v="diameter" k="scale_method"/>
              <prop v="2" k="size"/>
              <prop v="3x:0,0,0,0,0,0" k="size_map_unit_scale"/>
              <prop v="MM" k="size_unit"/>
              <prop v="1" k="vertical_anchor_point"/>
              <data_defined_properties>
                <Option type="Map">
                  <Option type="QString" name="name" value=""/>
                  <Option name="properties"/>
                  <Option type="QString" name="type" value="collection"/>
                </Option>
              </data_defined_properties>
            </layer>
          </symbol>
        </background>
        <shadow shadowDraw="0" shadowRadiusAlphaOnly="0" shadowOffsetDist="1" shadowRadius="1.5" shadowRadiusUnit="MM" shadowColor="0,0,0,255" shadowUnder="0" shadowOffsetUnit="MM" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowBlendMode="6" shadowOpacity="0.7" shadowScale="100" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowOffsetAngle="135" shadowOffsetGlobal="1"/>
        <dd_properties>
          <Option type="Map">
            <Option type="QString" name="name" value=""/>
            <Option name="properties"/>
            <Option type="QString" name="type" value="collection"/>
          </Option>
        </dd_properties>
        <substitutions/>
      </text-style>
      <text-format plussign="0" useMaxLineLengthForAutoWrap="1" multilineAlign="1" rightDirectionSymbol=">" leftDirectionSymbol="&lt;" reverseDirectionSymbol="0" decimals="3" placeDirectionSymbol="0" formatNumbers="0" wrapChar="@" autoWrapLength="0" addDirectionSymbol="0"/>
      <placement distUnits="MM" repeatDistance="0" dist="3" repeatDistanceUnits="MM" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" offsetUnits="MapUnit" rotationAngle="0" overrunDistanceMapUnitScale="3x:0,0,0,0,0,0" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" yOffset="0" fitInPolygonOnly="0" maxCurvedCharAngleOut="-20" geometryGenerator="" xOffset="0" maxCurvedCharAngleIn="20" overrunDistanceUnit="MM" quadOffset="4" priority="10" preserveRotation="1" placement="0" centroidInside="0" geometryGeneratorType="PointGeometry" distMapUnitScale="3x:0,0,0,0,0,0" geometryGeneratorEnabled="0" layerType="PointGeometry" placementFlags="0" centroidWhole="0" overrunDistance="0" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" offsetType="0"/>
      <rendering scaleMin="1" fontMaxPixelSize="10000" limitNumLabels="0" obstacleType="0" scaleVisibility="0" scaleMax="5000" fontLimitPixelSize="0" mergeLines="0" zIndex="0" maxNumLabels="2000" upsidedownLabels="0" obstacleFactor="1.4" fontMinPixelSize="3" drawLabels="1" minFeatureSize="0" labelPerPart="0" obstacle="1" displayAll="1"/>
      <dd_properties>
        <Option type="Map">
          <Option type="QString" name="name" value=""/>
          <Option type="Map" name="properties">
            <Option type="Map" name="AlwaysShow">
              <Option type="bool" name="active" value="true"/>
              <Option type="QString" name="expression" value="&quot;fnouvass&quot;  IN ('07','_3', '04', '06', '_7') AND &quot;_source_historique&quot; != 'si2g'"/>
              <Option type="int" name="type" value="3"/>
            </Option>
            <Option type="Map" name="Color">
              <Option type="bool" name="active" value="true"/>
              <Option type="QString" name="expression" value="CASE &#xa;&#x9;WHEN typreseau IN ('01') THEN '50,160,45,255' &#xa;&#x9;WHEN typreseau IN ('02') THEN '255,0,0,255' &#xa;&#x9;WHEN typreseau IN ('03') THEN '140,70,0,255' &#xa;&#x9;ELSE '161,161,161,255' &#xa;END"/>
              <Option type="int" name="type" value="3"/>
            </Option>
            <Option type="Map" name="Show">
              <Option type="bool" name="active" value="true"/>
              <Option type="QString" name="expression" value="&quot;_source_historique&quot; != 'si2g' OR &quot;_source_historique&quot; IS NULL"/>
              <Option type="int" name="type" value="3"/>
            </Option>
          </Option>
          <Option type="QString" name="type" value="collection"/>
        </Option>
      </dd_properties>
      <callout type="simple">
        <Option type="Map">
          <Option type="QString" name="anchorPoint" value="pole_of_inaccessibility"/>
          <Option type="Map" name="ddProperties">
            <Option type="QString" name="name" value=""/>
            <Option name="properties"/>
            <Option type="QString" name="type" value="collection"/>
          </Option>
          <Option type="bool" name="drawToAllParts" value="false"/>
          <Option type="QString" name="enabled" value="0"/>
          <Option type="QString" name="lineSymbol" value="&lt;symbol clip_to_extent=&quot;1&quot; type=&quot;line&quot; force_rhr=&quot;0&quot; alpha=&quot;1&quot; name=&quot;symbol&quot;>&lt;layer enabled=&quot;1&quot; pass=&quot;0&quot; locked=&quot;0&quot; class=&quot;SimpleLine&quot;>&lt;prop v=&quot;square&quot; k=&quot;capstyle&quot;/>&lt;prop v=&quot;5;2&quot; k=&quot;customdash&quot;/>&lt;prop v=&quot;3x:0,0,0,0,0,0&quot; k=&quot;customdash_map_unit_scale&quot;/>&lt;prop v=&quot;MM&quot; k=&quot;customdash_unit&quot;/>&lt;prop v=&quot;0&quot; k=&quot;draw_inside_polygon&quot;/>&lt;prop v=&quot;bevel&quot; k=&quot;joinstyle&quot;/>&lt;prop v=&quot;60,60,60,255&quot; k=&quot;line_color&quot;/>&lt;prop v=&quot;solid&quot; k=&quot;line_style&quot;/>&lt;prop v=&quot;0.3&quot; k=&quot;line_width&quot;/>&lt;prop v=&quot;MM&quot; k=&quot;line_width_unit&quot;/>&lt;prop v=&quot;0&quot; k=&quot;offset&quot;/>&lt;prop v=&quot;3x:0,0,0,0,0,0&quot; k=&quot;offset_map_unit_scale&quot;/>&lt;prop v=&quot;MM&quot; k=&quot;offset_unit&quot;/>&lt;prop v=&quot;0&quot; k=&quot;ring_filter&quot;/>&lt;prop v=&quot;0&quot; k=&quot;use_custom_dash&quot;/>&lt;prop v=&quot;3x:0,0,0,0,0,0&quot; k=&quot;width_map_unit_scale&quot;/>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option type=&quot;QString&quot; name=&quot;name&quot; value=&quot;&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option type=&quot;QString&quot; name=&quot;type&quot; value=&quot;collection&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;/layer>&lt;/symbol>"/>
          <Option type="double" name="minLength" value="0"/>
          <Option type="QString" name="minLengthMapUnitScale" value="3x:0,0,0,0,0,0"/>
          <Option type="QString" name="minLengthUnit" value="MM"/>
          <Option type="double" name="offsetFromAnchor" value="0"/>
          <Option type="QString" name="offsetFromAnchorMapUnitScale" value="3x:0,0,0,0,0,0"/>
          <Option type="QString" name="offsetFromAnchorUnit" value="MM"/>
          <Option type="double" name="offsetFromLabel" value="0"/>
          <Option type="QString" name="offsetFromLabelMapUnitScale" value="3x:0,0,0,0,0,0"/>
          <Option type="QString" name="offsetFromLabelUnit" value="MM"/>
        </Option>
      </callout>
    </settings>
  </labeling>
  <customproperties>
    <property key="dualview/previewExpressions" value="idouvrage"/>
    <property key="embeddedWidgets/count" value="0"/>
    <property key="variableNames"/>
    <property key="variableValues"/>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <SingleCategoryDiagramRenderer diagramType="Histogram" attributeLegend="1">
    <DiagramCategory barWidth="5" opacity="1" penAlpha="255" height="15" width="15" scaleDependency="Area" backgroundAlpha="255" minimumSize="0" scaleBasedVisibility="0" rotationOffset="270" backgroundColor="#ffffff" sizeScale="3x:0,0,0,0,0,0" diagramOrientation="Up" enabled="0" lineSizeType="MM" penColor="#000000" sizeType="MM" lineSizeScale="3x:0,0,0,0,0,0" labelPlacementMethod="XHeight" penWidth="0" minScaleDenominator="1" maxScaleDenominator="1e+08">
      <fontProperties style="" description="Ubuntu,11,-1,5,50,0,0,0,0,0"/>
      <attribute color="#000000" label="" field=""/>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings priority="0" dist="0" showAll="1" linePlacementFlags="2" zIndex="0" obstacle="0" placement="0">
    <properties>
      <Option type="Map">
        <Option type="QString" name="name" value=""/>
        <Option name="properties"/>
        <Option type="QString" name="type" value="collection"/>
      </Option>
    </properties>
  </DiagramLayerSettings>
  <geometryOptions removeDuplicateNodes="0" geometryPrecision="0">
    <activeChecks/>
    <checkConfiguration/>
  </geometryOptions>
  <fieldConfiguration>
    <field name="id">
      <editWidget type="Range">
        <config>
          <Option type="Map">
            <Option type="bool" name="AllowNull" value="true"/>
            <Option type="int" name="Max" value="2147483647"/>
            <Option type="int" name="Min" value="-2147483648"/>
            <Option type="int" name="Precision" value="0"/>
            <Option type="int" name="Step" value="1"/>
            <Option type="QString" name="Style" value="SpinBox"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="idouvrage">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="x">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="y">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="mouvrage">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option type="bool" name="AllowMulti" value="false"/>
            <Option type="bool" name="AllowNull" value="true"/>
            <Option type="QString" name="FilterExpression" value=""/>
            <Option type="QString" name="Key" value="nom"/>
            <Option type="QString" name="LayerName" value="sys_organisme_gestionnaire"/>
            <Option type="int" name="NofColumns" value="1"/>
            <Option type="bool" name="OrderByValue" value="true"/>
            <Option type="bool" name="UseCompleter" value="false"/>
            <Option type="QString" name="Value" value="nom"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="gexploit">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option type="bool" name="AllowMulti" value="false"/>
            <Option type="bool" name="AllowNull" value="true"/>
            <Option type="QString" name="FilterExpression" value=""/>
            <Option type="QString" name="Key" value="code"/>
            <Option type="QString" name="LayerName" value="sys_organisme_gestionnaire"/>
            <Option type="int" name="NofColumns" value="1"/>
            <Option type="bool" name="OrderByValue" value="true"/>
            <Option type="bool" name="UseCompleter" value="false"/>
            <Option type="QString" name="Value" value="nom"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="typreseau">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option type="bool" name="AllowMulti" value="false"/>
            <Option type="bool" name="AllowNull" value="true"/>
            <Option type="QString" name="FilterExpression" value=""/>
            <Option type="QString" name="Key" value="code"/>
            <Option type="QString" name="LayerName" value="val_raepa_typ_reseau_ass"/>
            <Option type="int" name="NofColumns" value="1"/>
            <Option type="bool" name="OrderByValue" value="true"/>
            <Option type="bool" name="UseCompleter" value="false"/>
            <Option type="QString" name="Value" value="libelle"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fnouvass">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option type="bool" name="AllowMulti" value="false"/>
            <Option type="bool" name="AllowNull" value="true"/>
            <Option type="QString" name="FilterExpression" value=""/>
            <Option type="QString" name="Key" value="code"/>
            <Option type="QString" name="LayerName" value="val_raepa_fonc_ouv_ass"/>
            <Option type="int" name="NofColumns" value="1"/>
            <Option type="bool" name="OrderByValue" value="true"/>
            <Option type="bool" name="UseCompleter" value="false"/>
            <Option type="QString" name="Value" value="libelle"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="anfinpose">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="idcanamont">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="idcanaval">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="idcanppale">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="z">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="_ztampon">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="_angletampon">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="andebpose">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="qualglocxy">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option type="bool" name="AllowMulti" value="false"/>
            <Option type="bool" name="AllowNull" value="true"/>
            <Option type="QString" name="FilterExpression" value=""/>
            <Option type="QString" name="Key" value="code"/>
            <Option type="QString" name="LayerName" value="val_raepa_qualite_geoloc"/>
            <Option type="int" name="NofColumns" value="1"/>
            <Option type="bool" name="OrderByValue" value="true"/>
            <Option type="bool" name="UseCompleter" value="false"/>
            <Option type="QString" name="Value" value="libelle"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="qualglocz">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option type="bool" name="AllowMulti" value="false"/>
            <Option type="bool" name="AllowNull" value="true"/>
            <Option type="QString" name="FilterExpression" value=""/>
            <Option type="QString" name="Key" value="code"/>
            <Option type="QString" name="LayerName" value="val_raepa_qualite_geoloc"/>
            <Option type="int" name="NofColumns" value="1"/>
            <Option type="bool" name="OrderByValue" value="true"/>
            <Option type="bool" name="UseCompleter" value="false"/>
            <Option type="QString" name="Value" value="libelle"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="datemaj">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="sourmaj">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option type="bool" name="AllowMulti" value="false"/>
            <Option type="bool" name="AllowNull" value="true"/>
            <Option type="QString" name="FilterExpression" value=""/>
            <Option type="QString" name="Key" value="code"/>
            <Option type="QString" name="LayerName" value="sys_organisme_gestionnaire"/>
            <Option type="int" name="NofColumns" value="1"/>
            <Option type="bool" name="OrderByValue" value="true"/>
            <Option type="bool" name="UseCompleter" value="false"/>
            <Option type="QString" name="Value" value="nom"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="qualannee">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option type="bool" name="AllowMulti" value="false"/>
            <Option type="bool" name="AllowNull" value="true"/>
            <Option type="QString" name="FilterExpression" value=""/>
            <Option type="QString" name="Key" value="code"/>
            <Option type="QString" name="LayerName" value="_val_raepa_precision_annee"/>
            <Option type="int" name="NofColumns" value="1"/>
            <Option type="bool" name="OrderByValue" value="true"/>
            <Option type="bool" name="UseCompleter" value="false"/>
            <Option type="QString" name="Value" value="libelle"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="dategeoloc">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="sourgeoloc">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="sourattrib">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="_source_historique">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="_code_chantier">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="_date_import">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="_geom_emprise">
      <editWidget type="Hidden">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="_temp_data">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="_observation">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="true"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="_nom_appareil">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="_commune">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias index="0" field="id" name="Identifiant automatique"/>
    <alias index="1" field="idouvrage" name="Code ouvrage"/>
    <alias index="2" field="x" name="X [m]"/>
    <alias index="3" field="y" name="Y [m]"/>
    <alias index="4" field="mouvrage" name="Maître d’ouvrage"/>
    <alias index="5" field="gexploit" name="Exploitant"/>
    <alias index="6" field="typreseau" name="Type du réseau"/>
    <alias index="7" field="fnouvass" name="Fonction"/>
    <alias index="8" field="anfinpose" name="Année de fin de pose"/>
    <alias index="9" field="idcanamont" name="Canalisations amont"/>
    <alias index="10" field="idcanaval" name="Canalisations aval"/>
    <alias index="11" field="idcanppale" name="Canalisation principale"/>
    <alias index="12" field="z" name="Altitude [m]"/>
    <alias index="13" field="_ztampon" name="Altitude du tampon [m]"/>
    <alias index="14" field="_angletampon" name="Rotation du tampon [°]"/>
    <alias index="15" field="andebpose" name="Année de début de pose"/>
    <alias index="16" field="qualglocxy" name="Qualité de la géolocalisation XY"/>
    <alias index="17" field="qualglocz" name="Qualité de la géolocalisation Z"/>
    <alias index="18" field="datemaj" name="Date de mise à jour"/>
    <alias index="19" field="sourmaj" name="Source de la mise à jour"/>
    <alias index="20" field="qualannee" name="Qualité de l’année de pose"/>
    <alias index="21" field="dategeoloc" name="Date de la géolocalisation"/>
    <alias index="22" field="sourgeoloc" name="Auteur de la géolocalisation"/>
    <alias index="23" field="sourattrib" name="Auteur des données attributaires"/>
    <alias index="24" field="_source_historique" name="Source historique"/>
    <alias index="25" field="_code_chantier" name=""/>
    <alias index="26" field="_date_import" name=""/>
    <alias index="27" field="_geom_emprise" name=""/>
    <alias index="28" field="_temp_data" name=""/>
    <alias index="29" field="_observation" name="Observation"/>
    <alias index="30" field="_nom_appareil" name=""/>
    <alias index="31" field="_commune" name=""/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default expression="" applyOnUpdate="0" field="id"/>
    <default expression="'INCONNU'" applyOnUpdate="0" field="idouvrage"/>
    <default expression="X( $geometry )" applyOnUpdate="0" field="x"/>
    <default expression="Y( $geometry )" applyOnUpdate="0" field="y"/>
    <default expression="" applyOnUpdate="0" field="mouvrage"/>
    <default expression="" applyOnUpdate="0" field="gexploit"/>
    <default expression="" applyOnUpdate="0" field="typreseau"/>
    <default expression="" applyOnUpdate="0" field="fnouvass"/>
    <default expression=" year( now())" applyOnUpdate="0" field="anfinpose"/>
    <default expression="'INCONNU'" applyOnUpdate="0" field="idcanamont"/>
    <default expression="'INCONNU'" applyOnUpdate="0" field="idcanaval"/>
    <default expression="'INCONNU'" applyOnUpdate="0" field="idcanppale"/>
    <default expression="" applyOnUpdate="0" field="z"/>
    <default expression="" applyOnUpdate="0" field="_ztampon"/>
    <default expression="" applyOnUpdate="0" field="_angletampon"/>
    <default expression="" applyOnUpdate="0" field="andebpose"/>
    <default expression="" applyOnUpdate="0" field="qualglocxy"/>
    <default expression="" applyOnUpdate="0" field="qualglocz"/>
    <default expression="to_date(now())" applyOnUpdate="0" field="datemaj"/>
    <default expression="" applyOnUpdate="0" field="sourmaj"/>
    <default expression="" applyOnUpdate="0" field="qualannee"/>
    <default expression="" applyOnUpdate="0" field="dategeoloc"/>
    <default expression="" applyOnUpdate="0" field="sourgeoloc"/>
    <default expression="" applyOnUpdate="0" field="sourattrib"/>
    <default expression="" applyOnUpdate="0" field="_source_historique"/>
    <default expression="" applyOnUpdate="0" field="_code_chantier"/>
    <default expression="" applyOnUpdate="0" field="_date_import"/>
    <default expression="" applyOnUpdate="0" field="_geom_emprise"/>
    <default expression="" applyOnUpdate="0" field="_temp_data"/>
    <default expression="''" applyOnUpdate="0" field="_observation"/>
    <default expression="" applyOnUpdate="0" field="_nom_appareil"/>
    <default expression="" applyOnUpdate="0" field="_commune"/>
  </defaults>
  <constraints>
    <constraint notnull_strength="1" exp_strength="0" unique_strength="1" constraints="3" field="id"/>
    <constraint notnull_strength="1" exp_strength="0" unique_strength="1" constraints="3" field="idouvrage"/>
    <constraint notnull_strength="2" exp_strength="0" unique_strength="0" constraints="1" field="x"/>
    <constraint notnull_strength="2" exp_strength="0" unique_strength="0" constraints="1" field="y"/>
    <constraint notnull_strength="1" exp_strength="0" unique_strength="0" constraints="1" field="mouvrage"/>
    <constraint notnull_strength="1" exp_strength="0" unique_strength="0" constraints="1" field="gexploit"/>
    <constraint notnull_strength="1" exp_strength="0" unique_strength="0" constraints="1" field="typreseau"/>
    <constraint notnull_strength="1" exp_strength="0" unique_strength="0" constraints="1" field="fnouvass"/>
    <constraint notnull_strength="1" exp_strength="0" unique_strength="0" constraints="1" field="anfinpose"/>
    <constraint notnull_strength="2" exp_strength="0" unique_strength="0" constraints="1" field="idcanamont"/>
    <constraint notnull_strength="2" exp_strength="0" unique_strength="0" constraints="1" field="idcanaval"/>
    <constraint notnull_strength="0" exp_strength="0" unique_strength="0" constraints="0" field="idcanppale"/>
    <constraint notnull_strength="0" exp_strength="0" unique_strength="0" constraints="0" field="z"/>
    <constraint notnull_strength="0" exp_strength="0" unique_strength="0" constraints="0" field="_ztampon"/>
    <constraint notnull_strength="0" exp_strength="0" unique_strength="0" constraints="0" field="_angletampon"/>
    <constraint notnull_strength="0" exp_strength="0" unique_strength="0" constraints="0" field="andebpose"/>
    <constraint notnull_strength="1" exp_strength="0" unique_strength="0" constraints="1" field="qualglocxy"/>
    <constraint notnull_strength="1" exp_strength="0" unique_strength="0" constraints="1" field="qualglocz"/>
    <constraint notnull_strength="1" exp_strength="0" unique_strength="0" constraints="1" field="datemaj"/>
    <constraint notnull_strength="1" exp_strength="0" unique_strength="0" constraints="1" field="sourmaj"/>
    <constraint notnull_strength="0" exp_strength="0" unique_strength="0" constraints="0" field="qualannee"/>
    <constraint notnull_strength="0" exp_strength="0" unique_strength="0" constraints="0" field="dategeoloc"/>
    <constraint notnull_strength="0" exp_strength="0" unique_strength="0" constraints="0" field="sourgeoloc"/>
    <constraint notnull_strength="0" exp_strength="0" unique_strength="0" constraints="0" field="sourattrib"/>
    <constraint notnull_strength="0" exp_strength="0" unique_strength="0" constraints="0" field="_source_historique"/>
    <constraint notnull_strength="0" exp_strength="0" unique_strength="0" constraints="0" field="_code_chantier"/>
    <constraint notnull_strength="0" exp_strength="0" unique_strength="0" constraints="0" field="_date_import"/>
    <constraint notnull_strength="0" exp_strength="0" unique_strength="0" constraints="0" field="_geom_emprise"/>
    <constraint notnull_strength="0" exp_strength="0" unique_strength="0" constraints="0" field="_temp_data"/>
    <constraint notnull_strength="0" exp_strength="0" unique_strength="0" constraints="0" field="_observation"/>
    <constraint notnull_strength="0" exp_strength="0" unique_strength="0" constraints="0" field="_nom_appareil"/>
    <constraint notnull_strength="0" exp_strength="0" unique_strength="0" constraints="0" field="_commune"/>
  </constraints>
  <constraintExpressions>
    <constraint exp="" desc="" field="id"/>
    <constraint exp="" desc="" field="idouvrage"/>
    <constraint exp="" desc="" field="x"/>
    <constraint exp="" desc="" field="y"/>
    <constraint exp="" desc="" field="mouvrage"/>
    <constraint exp="" desc="" field="gexploit"/>
    <constraint exp="" desc="" field="typreseau"/>
    <constraint exp="" desc="" field="fnouvass"/>
    <constraint exp="" desc="" field="anfinpose"/>
    <constraint exp="" desc="" field="idcanamont"/>
    <constraint exp="" desc="" field="idcanaval"/>
    <constraint exp="" desc="" field="idcanppale"/>
    <constraint exp="" desc="" field="z"/>
    <constraint exp="" desc="" field="_ztampon"/>
    <constraint exp="" desc="" field="_angletampon"/>
    <constraint exp="" desc="" field="andebpose"/>
    <constraint exp="" desc="" field="qualglocxy"/>
    <constraint exp="" desc="" field="qualglocz"/>
    <constraint exp="" desc="" field="datemaj"/>
    <constraint exp="" desc="" field="sourmaj"/>
    <constraint exp="" desc="" field="qualannee"/>
    <constraint exp="" desc="" field="dategeoloc"/>
    <constraint exp="" desc="" field="sourgeoloc"/>
    <constraint exp="" desc="" field="sourattrib"/>
    <constraint exp="" desc="" field="_source_historique"/>
    <constraint exp="" desc="" field="_code_chantier"/>
    <constraint exp="" desc="" field="_date_import"/>
    <constraint exp="" desc="" field="_geom_emprise"/>
    <constraint exp="" desc="" field="_temp_data"/>
    <constraint exp="" desc="" field="_observation"/>
    <constraint exp="" desc="" field="_nom_appareil"/>
    <constraint exp="" desc="" field="_commune"/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction key="Canvas" value="{00000000-0000-0000-0000-000000000000}"/>
    <actionsetting icon="" isEnabledOnlyWhenEditable="0" type="1" shortTitle="" id="{91d42900-bbbf-42a7-a003-34d6c4efef9d}" action="from qgis.utils import plugins&#xa;plugins['raepa'].run_action(&#xa;    'parcourir_reseau_depuis_cet_objet',&#xa;    '[% idouvrage %]',&#xa;    0&#xa;)" name="Parcourir le réseau depuis cet objet" notificationMessage="" capture="0">
      <actionScope id="Canvas"/>
      <actionScope id="Feature"/>
      <actionScope id="Field"/>
    </actionsetting>
    <actionsetting icon="" isEnabledOnlyWhenEditable="0" type="1" shortTitle="" id="{be1e9ca7-5f08-46b2-8d7d-81ee36c5ca4c}" action="from qgis.utils import plugins&#xa;plugins['raepa'].run_action(&#xa;    'ouvrage_annuler_derniere_modification',&#xa;    '[% idouvrage %]',&#xa;    '[% @layer_id %]'&#xa;)" name="Annuler la dernière modification" notificationMessage="" capture="0">
      <actionScope id="Canvas"/>
      <actionScope id="Feature"/>
    </actionsetting>
    <actionsetting icon="" isEnabledOnlyWhenEditable="0" type="1" shortTitle="" id="{dd236652-912d-4e10-81fc-9cb8536e26b4}" action="from qgis.utils import plugins&#xa;plugins['raepa'].run_action(&#xa;    'ouvrage_couper_canalisation_sous_cet_ouvrage',&#xa;    '[% idouvrage %]',&#xa;    '[% @layer_id %]'&#xa;)" name="Couper la canalisation sous cet ouvrage" notificationMessage="" capture="0">
      <actionScope id="Canvas"/>
      <actionScope id="Feature"/>
      <actionScope id="Field"/>
    </actionsetting>
  </attributeactions>
  <attributetableconfig sortExpression="&quot;idouvrage&quot;" sortOrder="1" actionWidgetStyle="dropDown">
    <columns>
      <column type="actions" width="242" hidden="0"/>
      <column type="field" width="-1" name="idouvrage" hidden="0"/>
      <column type="field" width="-1" name="typreseau" hidden="0"/>
      <column type="field" width="-1" name="fnouvass" hidden="0"/>
      <column type="field" width="-1" name="z" hidden="0"/>
      <column type="field" width="-1" name="_ztampon" hidden="0"/>
      <column type="field" width="-1" name="_angletampon" hidden="0"/>
      <column type="field" width="-1" name="qualglocxy" hidden="0"/>
      <column type="field" width="-1" name="qualglocz" hidden="0"/>
      <column type="field" width="-1" name="x" hidden="1"/>
      <column type="field" width="-1" name="y" hidden="1"/>
      <column type="field" width="209" name="idcanamont" hidden="0"/>
      <column type="field" width="-1" name="idcanaval" hidden="0"/>
      <column type="field" width="-1" name="idcanppale" hidden="0"/>
      <column type="field" width="-1" name="mouvrage" hidden="1"/>
      <column type="field" width="-1" name="gexploit" hidden="1"/>
      <column type="field" width="-1" name="andebpose" hidden="1"/>
      <column type="field" width="-1" name="anfinpose" hidden="0"/>
      <column type="field" width="-1" name="datemaj" hidden="0"/>
      <column type="field" width="-1" name="sourmaj" hidden="1"/>
      <column type="field" width="-1" name="qualannee" hidden="1"/>
      <column type="field" width="-1" name="dategeoloc" hidden="1"/>
      <column type="field" width="-1" name="sourgeoloc" hidden="1"/>
      <column type="field" width="-1" name="sourattrib" hidden="1"/>
      <column type="field" width="-1" name="_geom_emprise" hidden="1"/>
      <column type="field" width="-1" name="_source_historique" hidden="1"/>
      <column type="field" width="-1" name="_code_chantier" hidden="0"/>
      <column type="field" width="-1" name="_date_import" hidden="0"/>
      <column type="field" width="-1" name="_temp_data" hidden="0"/>
      <column type="field" width="-1" name="id" hidden="0"/>
      <column type="field" width="-1" name="_observation" hidden="0"/>
      <column type="field" width="-1" name="_nom_appareil" hidden="0"/>
      <column type="field" width="-1" name="_commune" hidden="0"/>
    </columns>
  </attributetableconfig>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles/>
  </conditionalstyles>
  <storedexpressions/>
  <editform tolerant="1">/../../../.local/share/QGIS/QGIS3/profiles</editform>
  <editforminit>vw_cover_open</editforminit>
  <editforminitcodesource>0</editforminitcodesource>
  <editforminitfilepath>/../.local/share/QGIS/.local/share/QGIS/QGIS3/profiles/default/3liz/Reapa</editforminitfilepath>
  <editforminitcode><![CDATA[from qgepplugin.ui.forms import vw_cover_open
]]></editforminitcode>
  <featformsuppress>0</featformsuppress>
  <editorlayout>tablayout</editorlayout>
  <attributeEditorForm>
    <attributeEditorContainer visibilityExpressionEnabled="0" showLabel="1" groupBox="0" visibilityExpression="" columnCount="1" name="Ouvrage">
      <attributeEditorContainer visibilityExpressionEnabled="0" showLabel="1" groupBox="1" visibilityExpression="" columnCount="1" name="Général">
        <attributeEditorField index="0" showLabel="1" name="id"/>
        <attributeEditorField index="1" showLabel="1" name="idouvrage"/>
        <attributeEditorField index="6" showLabel="1" name="typreseau"/>
        <attributeEditorField index="7" showLabel="1" name="fnouvass"/>
        <attributeEditorField index="29" showLabel="1" name="_observation"/>
      </attributeEditorContainer>
      <attributeEditorContainer visibilityExpressionEnabled="0" showLabel="1" groupBox="1" visibilityExpression="" columnCount="1" name="Technique">
        <attributeEditorField index="2" showLabel="1" name="x"/>
        <attributeEditorField index="3" showLabel="1" name="y"/>
        <attributeEditorField index="12" showLabel="1" name="z"/>
        <attributeEditorField index="13" showLabel="1" name="_ztampon"/>
        <attributeEditorField index="14" showLabel="1" name="_angletampon"/>
        <attributeEditorField index="16" showLabel="1" name="qualglocxy"/>
        <attributeEditorField index="17" showLabel="1" name="qualglocz"/>
      </attributeEditorContainer>
      <attributeEditorContainer visibilityExpressionEnabled="0" showLabel="1" groupBox="1" visibilityExpression="" columnCount="1" name="Relations">
        <attributeEditorField index="9" showLabel="1" name="idcanamont"/>
        <attributeEditorField index="10" showLabel="1" name="idcanaval"/>
        <attributeEditorField index="11" showLabel="1" name="idcanppale"/>
      </attributeEditorContainer>
      <attributeEditorContainer visibilityExpressionEnabled="0" showLabel="1" groupBox="1" visibilityExpression="" columnCount="1" name="Historique">
        <attributeEditorField index="4" showLabel="1" name="mouvrage"/>
        <attributeEditorField index="5" showLabel="1" name="gexploit"/>
        <attributeEditorField index="15" showLabel="1" name="andebpose"/>
        <attributeEditorField index="8" showLabel="1" name="anfinpose"/>
        <attributeEditorField index="25" showLabel="1" name="_code_chantier"/>
        <attributeEditorField index="26" showLabel="1" name="_date_import"/>
      </attributeEditorContainer>
      <attributeEditorContainer visibilityExpressionEnabled="0" showLabel="1" groupBox="1" visibilityExpression="" columnCount="1" name="Métadonnées">
        <attributeEditorField index="18" showLabel="1" name="datemaj"/>
        <attributeEditorField index="19" showLabel="1" name="sourmaj"/>
        <attributeEditorField index="20" showLabel="1" name="qualannee"/>
        <attributeEditorField index="21" showLabel="1" name="dategeoloc"/>
        <attributeEditorField index="22" showLabel="1" name="sourgeoloc"/>
        <attributeEditorField index="23" showLabel="1" name="sourattrib"/>
        <attributeEditorField index="24" showLabel="1" name="_source_historique"/>
      </attributeEditorContainer>
    </attributeEditorContainer>
  </attributeEditorForm>
  <editable>
    <field editable="1" name="_angletampon"/>
    <field editable="1" name="_code_chantier"/>
    <field editable="1" name="_commune"/>
    <field editable="1" name="_date_import"/>
    <field editable="1" name="_geom_emprise"/>
    <field editable="1" name="_nom_appareil"/>
    <field editable="1" name="_observation"/>
    <field editable="1" name="_source_historique"/>
    <field editable="1" name="_temp_data"/>
    <field editable="1" name="_ztampon"/>
    <field editable="1" name="andebpose"/>
    <field editable="1" name="anfinpose"/>
    <field editable="1" name="dategeoloc"/>
    <field editable="1" name="datemaj"/>
    <field editable="1" name="fnouvass"/>
    <field editable="1" name="gexploit"/>
    <field editable="0" name="id"/>
    <field editable="1" name="idcanamont"/>
    <field editable="1" name="idcanaval"/>
    <field editable="1" name="idcanppale"/>
    <field editable="1" name="idouvrage"/>
    <field editable="1" name="mouvrage"/>
    <field editable="1" name="qualannee"/>
    <field editable="1" name="qualglocxy"/>
    <field editable="1" name="qualglocz"/>
    <field editable="1" name="sourattrib"/>
    <field editable="1" name="sourgeoloc"/>
    <field editable="1" name="sourmaj"/>
    <field editable="1" name="typreseau"/>
    <field editable="1" name="x"/>
    <field editable="1" name="y"/>
    <field editable="1" name="z"/>
  </editable>
  <labelOnTop>
    <field labelOnTop="0" name="_angletampon"/>
    <field labelOnTop="0" name="_code_chantier"/>
    <field labelOnTop="0" name="_commune"/>
    <field labelOnTop="0" name="_date_import"/>
    <field labelOnTop="0" name="_geom_emprise"/>
    <field labelOnTop="0" name="_nom_appareil"/>
    <field labelOnTop="0" name="_observation"/>
    <field labelOnTop="0" name="_source_historique"/>
    <field labelOnTop="0" name="_temp_data"/>
    <field labelOnTop="0" name="_ztampon"/>
    <field labelOnTop="0" name="andebpose"/>
    <field labelOnTop="0" name="anfinpose"/>
    <field labelOnTop="0" name="dategeoloc"/>
    <field labelOnTop="0" name="datemaj"/>
    <field labelOnTop="0" name="fnouvass"/>
    <field labelOnTop="0" name="gexploit"/>
    <field labelOnTop="0" name="id"/>
    <field labelOnTop="0" name="idcanamont"/>
    <field labelOnTop="0" name="idcanaval"/>
    <field labelOnTop="0" name="idcanppale"/>
    <field labelOnTop="0" name="idouvrage"/>
    <field labelOnTop="0" name="mouvrage"/>
    <field labelOnTop="0" name="qualannee"/>
    <field labelOnTop="0" name="qualglocxy"/>
    <field labelOnTop="0" name="qualglocz"/>
    <field labelOnTop="0" name="sourattrib"/>
    <field labelOnTop="0" name="sourgeoloc"/>
    <field labelOnTop="0" name="sourmaj"/>
    <field labelOnTop="0" name="typreseau"/>
    <field labelOnTop="0" name="x"/>
    <field labelOnTop="0" name="y"/>
    <field labelOnTop="0" name="z"/>
  </labelOnTop>
  <widgets>
    <widget name="_label_x">
      <config/>
    </widget>
    <widget name="_label_y">
      <config/>
    </widget>
    <widget name="od_file20160921105557083_object_vw_qgep_wastewater_structure_obj_id">
      <config/>
    </widget>
    <widget name="re_maintenance_event_wastewater_structure_fk_wastewater_structure_vw_qgep_wastewater_structure_ws_obj_id">
      <config/>
    </widget>
    <widget name="sys_parcours_reseau20171207183948125_idouvrage_raepa_ouvrass_p_geom20171203161907366_idouvrage">
      <config/>
    </widget>
    <widget name="vw_access_aid20150507162234295_fk_wastewater_structure_vw_qgep_wastewater_structure20150506155849784_obj_id">
      <config/>
    </widget>
    <widget name="vw_access_aid_fk_wastewater_structure_vw_qgep_wastewater_structure_obj_id">
      <config/>
    </widget>
    <widget name="vw_backflow_prevention20150531093552085_fk_wastewater_structure_vw_qgep_wastewater_structure_ws_obj_id">
      <config/>
    </widget>
    <widget name="vw_backflow_prevention_fk_wastewater_structure_vw_qgep_wastewater_structure_obj_id">
      <config/>
    </widget>
    <widget name="vw_benching20150507162234281_fk_wastewater_structure_vw_qgep_wastewater_structure20150506155849784_obj_id">
      <config/>
    </widget>
    <widget name="vw_benching_fk_wastewater_structure_vw_qgep_wastewater_structure_obj_id">
      <config/>
    </widget>
    <widget name="vw_cover20150507162234308_fk_wastewater_structure_vw_qgep_wastewater_structure20150506155849784_obj_id">
      <config/>
    </widget>
    <widget name="vw_cover____fk_wastewater_structure_vw_qgep_wastewater_structure_obj_id">
      <config/>
    </widget>
    <widget name="vw_dryweather_downspout20150507162234268_fk_wastewater_structure_vw_qgep_wastewater_structure20150506155849784_obj_id">
      <config/>
    </widget>
    <widget name="vw_dryweather_downspout_fk_wastewater_structure_vw_qgep_wastewater_structure_obj_id">
      <config/>
    </widget>
    <widget name="vw_dryweather_flume20150507162234250_fk_wastewater_structure_vw_qgep_wastewater_structure20150506155849784_obj_id">
      <config/>
    </widget>
    <widget name="vw_dryweather_flume_fk_wastewater_structure_vw_qgep_wastewater_structure_obj_id">
      <config/>
    </widget>
    <widget name="wastewater_node-fk_wastewater-structure">
      <config/>
    </widget>
  </widgets>
  <previewExpression>"idouvrage"</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>0</layerGeometryType>
</qgis>
