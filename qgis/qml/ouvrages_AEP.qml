<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis simplifyDrawingHints="0" readOnly="0" hasScaleBasedVisibilityFlag="1" version="3.4.13-Madeira" styleCategories="AllStyleCategories" simplifyAlgorithm="0" maxScale="1" labelsEnabled="0" simplifyDrawingTol="1" simplifyMaxScale="1" minScale="2501" simplifyLocal="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 symbollevels="0" forceraster="0" type="RuleRenderer" enableorderby="0">
    <rules key="{6736e613-3750-466f-8a9f-3310fefc92b3}">
      <rule key="{85abc532-ce36-437d-b0cf-48fbebdc5b95}" filter="&quot;fnouvaep&quot; = '01'" label="Station de pompage" symbol="0"/>
      <rule key="{3103a62c-d84c-43d5-ac41-0530a9873cd5}" filter="&quot;fnouvaep&quot; = '02'" label="Station de traitement" symbol="1"/>
      <rule key="{e51c6d5a-9329-43d8-a377-e41b742e24d3}" filter="&quot;fnouvaep&quot; = '03'" label="Réservoir" symbol="2"/>
      <rule key="{31322e09-08e1-4427-99ca-6abe3cf11756}" filter="&quot;fnouvaep&quot; = '04'" label="Chambre de comptage" symbol="3"/>
      <rule key="{99742514-bc1e-4d8c-84df-493c1c0a4ee3}" filter="&quot;fnouvaep&quot; = '05'" label="Captage" symbol="4"/>
      <rule key="{a58e9cd6-6bfa-482f-b54a-c2c5f08ad64e}" filter="&quot;fnouvaep&quot; = '00'" label="Indéterminé" symbol="5"/>
      <rule key="{b56796d8-f43d-4594-9034-e3b57e012d40}" filter="&quot;fnouvaep&quot; = '99'" label="Autre" symbol="6"/>
    </rules>
    <symbols>
      <symbol clip_to_extent="1" alpha="1" force_rhr="0" type="marker" name="0">
        <layer class="SimpleMarker" locked="0" pass="3" enabled="1">
          <prop k="angle" v="0"/>
          <prop k="color" v="255,255,255,255"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="circle"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MapUnit"/>
          <prop k="outline_color" v="0,0,0,255"/>
          <prop k="outline_style" v="solid"/>
          <prop k="outline_width" v="0.35"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MapUnit"/>
          <prop k="scale_method" v="area"/>
          <prop k="size" v="5"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MapUnit"/>
          <prop k="vertical_anchor_point" v="1"/>
          <effect type="effectStack" enabled="0">
            <effect type="drawSource">
              <prop k="blend_mode" v="0"/>
              <prop k="draw_mode" v="2"/>
              <prop k="enabled" v="1"/>
              <prop k="opacity" v="1"/>
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
        <layer class="SimpleMarker" locked="0" pass="3" enabled="1">
          <prop k="angle" v="0"/>
          <prop k="color" v="0,0,0,255"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="equilateral_triangle"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MapUnit"/>
          <prop k="outline_color" v="0,0,0,255"/>
          <prop k="outline_style" v="no"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MapUnit"/>
          <prop k="scale_method" v="area"/>
          <prop k="size" v="4.625"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MapUnit"/>
          <prop k="vertical_anchor_point" v="1"/>
          <effect type="effectStack" enabled="0">
            <effect type="drawSource">
              <prop k="blend_mode" v="0"/>
              <prop k="draw_mode" v="2"/>
              <prop k="enabled" v="1"/>
              <prop k="opacity" v="1"/>
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
      <symbol clip_to_extent="1" alpha="1" force_rhr="0" type="marker" name="1">
        <layer class="SimpleMarker" locked="0" pass="0" enabled="1">
          <prop k="angle" v="0"/>
          <prop k="color" v="255,255,255,255"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="circle"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MapUnit"/>
          <prop k="outline_color" v="0,0,0,255"/>
          <prop k="outline_style" v="solid"/>
          <prop k="outline_width" v="0.4"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MapUnit"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="6"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MapUnit"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" alpha="1" force_rhr="0" type="marker" name="2">
        <layer class="SimpleMarker" locked="0" pass="0" enabled="1">
          <prop k="angle" v="0"/>
          <prop k="color" v="72,123,182,255"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="circle"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MapUnit"/>
          <prop k="outline_color" v="50,87,128,255"/>
          <prop k="outline_style" v="solid"/>
          <prop k="outline_width" v="0.4"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MapUnit"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="6"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MapUnit"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" alpha="1" force_rhr="0" type="marker" name="3">
        <layer class="SimpleMarker" locked="0" pass="0" enabled="1">
          <prop k="angle" v="0"/>
          <prop k="color" v="255,255,255,255"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="circle"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MapUnit"/>
          <prop k="outline_color" v="0,0,0,255"/>
          <prop k="outline_style" v="solid"/>
          <prop k="outline_width" v="0.4"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MapUnit"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="1"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MapUnit"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" alpha="1" force_rhr="0" type="marker" name="4">
        <layer class="SimpleMarker" locked="0" pass="0" enabled="1">
          <prop k="angle" v="0"/>
          <prop k="color" v="100,175,255,255"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="circle"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MapUnit"/>
          <prop k="outline_color" v="0,0,0,255"/>
          <prop k="outline_style" v="solid"/>
          <prop k="outline_width" v="0.4"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MapUnit"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="5"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MapUnit"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option name="properties"/>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" alpha="1" force_rhr="0" type="marker" name="5">
        <layer class="SimpleMarker" locked="0" pass="3" enabled="1">
          <prop k="angle" v="0"/>
          <prop k="color" v="115,115,115,255"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="circle"/>
          <prop k="offset" v="-0.39999999999999997,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MapUnit"/>
          <prop k="outline_color" v="0,0,0,255"/>
          <prop k="outline_style" v="solid"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MapUnit"/>
          <prop k="scale_method" v="diameter"/>
          <prop k="size" v="1"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MapUnit"/>
          <prop k="vertical_anchor_point" v="1"/>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" name="name" value=""/>
              <Option type="Map" name="properties">
                <Option type="Map" name="angle">
                  <Option type="bool" name="active" value="false"/>
                  <Option type="QString" name="expression" value=""/>
                  <Option type="int" name="type" value="3"/>
                </Option>
              </Option>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" alpha="1" force_rhr="0" type="marker" name="6">
        <layer class="SimpleMarker" locked="0" pass="0" enabled="1">
          <prop k="angle" v="0"/>
          <prop k="color" v="0,0,0,255"/>
          <prop k="horizontal_anchor_point" v="1"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="name" v="cross_fill"/>
          <prop k="offset" v="0,0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MapUnit"/>
          <prop k="outline_color" v="0,0,0,255"/>
          <prop k="outline_style" v="no"/>
          <prop k="outline_width" v="0"/>
          <prop k="outline_width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="outline_width_unit" v="MapUnit"/>
          <prop k="scale_method" v="area"/>
          <prop k="size" v="0.4"/>
          <prop k="size_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="size_unit" v="MapUnit"/>
          <prop k="vertical_anchor_point" v="1"/>
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
        <prop k="blend_mode" v="0"/>
        <prop k="draw_mode" v="2"/>
        <prop k="enabled" v="1"/>
        <prop k="opacity" v="1"/>
      </effect>
    </effect>
  </renderer-v2>
  <customproperties>
    <property key="dualview/previewExpressions" value="id"/>
    <property key="embeddedWidgets/count" value="0"/>
    <property key="variableNames"/>
    <property key="variableValues"/>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <SingleCategoryDiagramRenderer diagramType="Histogram" attributeLegend="1">
    <DiagramCategory penAlpha="255" height="15" lineSizeType="MM" diagramOrientation="Up" minScaleDenominator="1" backgroundAlpha="255" enabled="0" sizeScale="3x:0,0,0,0,0,0" lineSizeScale="3x:0,0,0,0,0,0" minimumSize="0" width="15" barWidth="5" sizeType="MM" scaleDependency="Area" rotationOffset="270" scaleBasedVisibility="1" backgroundColor="#ffffff" opacity="1" labelPlacementMethod="XHeight" penColor="#000000" maxScaleDenominator="2501" penWidth="0">
      <fontProperties description="Ubuntu,11,-1,5,50,0,0,0,0,0" style=""/>
      <attribute field="" color="#000000" label=""/>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings zIndex="0" linePlacementFlags="18" obstacle="0" dist="0" showAll="1" placement="0" priority="0">
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
            <Option type="QString" name="Layer" value="sys_organisme_gestionnaire2019100910365653369926340"/>
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
            <Option type="QString" name="Key" value="nom"/>
            <Option type="QString" name="Layer" value="sys_organisme_gestionnaire2019100910365653369926340"/>
            <Option type="int" name="NofColumns" value="1"/>
            <Option type="bool" name="OrderByValue" value="true"/>
            <Option type="bool" name="UseCompleter" value="false"/>
            <Option type="QString" name="Value" value="nom"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fnouvaep">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option type="bool" name="AllowMulti" value="false"/>
            <Option type="bool" name="AllowNull" value="true"/>
            <Option type="QString" name="FilterExpression" value=""/>
            <Option type="QString" name="Key" value="code"/>
            <Option type="QString" name="Layer" value="val_raepa_fonc_ouv_ae201910091036565371693200831"/>
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
            <Option type="QString" name="Layer" value="val_raepa_qualite_geoloc201910091036565392031560565"/>
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
            <Option type="QString" name="Layer" value="val_raepa_qualite_geoloc201910091036565392031560565"/>
            <Option type="int" name="NofColumns" value="1"/>
            <Option type="bool" name="OrderByValue" value="true"/>
            <Option type="bool" name="UseCompleter" value="false"/>
            <Option type="QString" name="Value" value="libelle"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="datemaj">
      <editWidget type="DateTime">
        <config>
          <Option type="Map">
            <Option type="bool" name="allow_null" value="true"/>
            <Option type="bool" name="calendar_popup" value="true"/>
            <Option type="QString" name="display_format" value="yyyy-MM-dd"/>
            <Option type="QString" name="field_format" value="yyyy-MM-dd"/>
            <Option type="bool" name="field_iso_format" value="false"/>
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
            <Option type="QString" name="Key" value="nom"/>
            <Option type="QString" name="Layer" value="sys_organisme_gestionnaire2019100910365653369926340"/>
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
            <Option type="QString" name="Layer" value="val_raepa_qualite_anpose20191009103656539585994462"/>
            <Option type="int" name="NofColumns" value="1"/>
            <Option type="bool" name="OrderByValue" value="true"/>
            <Option type="bool" name="UseCompleter" value="false"/>
            <Option type="QString" name="Value" value="libelle"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="dategeoloc">
      <editWidget type="DateTime">
        <config>
          <Option type="Map">
            <Option type="bool" name="allow_null" value="true"/>
            <Option type="bool" name="calendar_popup" value="true"/>
            <Option type="QString" name="display_format" value="yyyy-MM-dd"/>
            <Option type="QString" name="field_format" value="yyyy-MM-dd"/>
            <Option type="bool" name="field_iso_format" value="false"/>
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
  </fieldConfiguration>
  <aliases>
    <alias index="0" field="id" name="Identifiant automatique"/>
    <alias index="1" field="idouvrage" name="Code ouvrage"/>
    <alias index="2" field="x" name="X [m]"/>
    <alias index="3" field="y" name="Y [m]"/>
    <alias index="4" field="mouvrage" name="Maître d’ouvrage"/>
    <alias index="5" field="gexploit" name="Exploitant"/>
    <alias index="6" field="fnouvaep" name="Fonction"/>
    <alias index="7" field="anfinpose" name="Année de fin de pose"/>
    <alias index="8" field="idcanamont" name="Canalisations amont"/>
    <alias index="9" field="idcanaval" name="Canalisations aval"/>
    <alias index="10" field="idcanppale" name="Canalisation principale"/>
    <alias index="11" field="z" name="Altitude [m]"/>
    <alias index="12" field="andebpose" name="Année de début de pose"/>
    <alias index="13" field="qualglocxy" name="Qualité de la géolocalisation XY"/>
    <alias index="14" field="qualglocz" name="Qualité de la géolocalisation Z"/>
    <alias index="15" field="datemaj" name="Date de mise à jour"/>
    <alias index="16" field="sourmaj" name="Source de la mise à jour"/>
    <alias index="17" field="qualannee" name="Qualité de l’année de pose"/>
    <alias index="18" field="dategeoloc" name="Date de la géolocalisation"/>
    <alias index="19" field="sourgeoloc" name="Auteur de la géolocalisation"/>
    <alias index="20" field="sourattrib" name="Auteur des données attributaires"/>
    <alias index="21" field="_observation" name="Observation"/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default field="id" expression="" applyOnUpdate="0"/>
    <default field="idouvrage" expression="" applyOnUpdate="0"/>
    <default field="x" expression="" applyOnUpdate="0"/>
    <default field="y" expression="" applyOnUpdate="0"/>
    <default field="mouvrage" expression="" applyOnUpdate="0"/>
    <default field="gexploit" expression="" applyOnUpdate="0"/>
    <default field="fnouvaep" expression="" applyOnUpdate="0"/>
    <default field="anfinpose" expression=" year( now())" applyOnUpdate="0"/>
    <default field="idcanamont" expression="" applyOnUpdate="0"/>
    <default field="idcanaval" expression="" applyOnUpdate="0"/>
    <default field="idcanppale" expression="" applyOnUpdate="0"/>
    <default field="z" expression="" applyOnUpdate="0"/>
    <default field="andebpose" expression="" applyOnUpdate="0"/>
    <default field="qualglocxy" expression="" applyOnUpdate="0"/>
    <default field="qualglocz" expression="" applyOnUpdate="0"/>
    <default field="datemaj" expression="" applyOnUpdate="0"/>
    <default field="sourmaj" expression="" applyOnUpdate="0"/>
    <default field="qualannee" expression="" applyOnUpdate="0"/>
    <default field="dategeoloc" expression="" applyOnUpdate="0"/>
    <default field="sourgeoloc" expression="" applyOnUpdate="0"/>
    <default field="sourattrib" expression="" applyOnUpdate="0"/>
    <default field="_observation" expression="" applyOnUpdate="0"/>
  </defaults>
  <constraints>
    <constraint unique_strength="1" field="id" notnull_strength="1" exp_strength="0" constraints="3"/>
    <constraint unique_strength="1" field="idouvrage" notnull_strength="1" exp_strength="0" constraints="3"/>
    <constraint unique_strength="0" field="x" notnull_strength="2" exp_strength="0" constraints="1"/>
    <constraint unique_strength="0" field="y" notnull_strength="2" exp_strength="0" constraints="1"/>
    <constraint unique_strength="0" field="mouvrage" notnull_strength="1" exp_strength="0" constraints="1"/>
    <constraint unique_strength="0" field="gexploit" notnull_strength="1" exp_strength="0" constraints="1"/>
    <constraint unique_strength="0" field="fnouvaep" notnull_strength="1" exp_strength="0" constraints="1"/>
    <constraint unique_strength="0" field="anfinpose" notnull_strength="1" exp_strength="0" constraints="1"/>
    <constraint unique_strength="0" field="idcanamont" notnull_strength="2" exp_strength="0" constraints="1"/>
    <constraint unique_strength="0" field="idcanaval" notnull_strength="2" exp_strength="0" constraints="1"/>
    <constraint unique_strength="0" field="idcanppale" notnull_strength="0" exp_strength="0" constraints="0"/>
    <constraint unique_strength="0" field="z" notnull_strength="0" exp_strength="0" constraints="0"/>
    <constraint unique_strength="0" field="andebpose" notnull_strength="0" exp_strength="0" constraints="0"/>
    <constraint unique_strength="0" field="qualglocxy" notnull_strength="1" exp_strength="0" constraints="1"/>
    <constraint unique_strength="0" field="qualglocz" notnull_strength="1" exp_strength="0" constraints="1"/>
    <constraint unique_strength="0" field="datemaj" notnull_strength="1" exp_strength="0" constraints="1"/>
    <constraint unique_strength="0" field="sourmaj" notnull_strength="1" exp_strength="0" constraints="1"/>
    <constraint unique_strength="0" field="qualannee" notnull_strength="0" exp_strength="0" constraints="0"/>
    <constraint unique_strength="0" field="dategeoloc" notnull_strength="0" exp_strength="0" constraints="0"/>
    <constraint unique_strength="0" field="sourgeoloc" notnull_strength="0" exp_strength="0" constraints="0"/>
    <constraint unique_strength="0" field="sourattrib" notnull_strength="0" exp_strength="0" constraints="0"/>
    <constraint unique_strength="0" field="_observation" notnull_strength="0" exp_strength="0" constraints="0"/>
  </constraints>
  <constraintExpressions>
    <constraint field="id" exp="" desc=""/>
    <constraint field="idouvrage" exp="" desc=""/>
    <constraint field="x" exp="" desc=""/>
    <constraint field="y" exp="" desc=""/>
    <constraint field="mouvrage" exp="" desc=""/>
    <constraint field="gexploit" exp="" desc=""/>
    <constraint field="fnouvaep" exp="" desc=""/>
    <constraint field="anfinpose" exp="" desc=""/>
    <constraint field="idcanamont" exp="" desc=""/>
    <constraint field="idcanaval" exp="" desc=""/>
    <constraint field="idcanppale" exp="" desc=""/>
    <constraint field="z" exp="" desc=""/>
    <constraint field="andebpose" exp="" desc=""/>
    <constraint field="qualglocxy" exp="" desc=""/>
    <constraint field="qualglocz" exp="" desc=""/>
    <constraint field="datemaj" exp="" desc=""/>
    <constraint field="sourmaj" exp="" desc=""/>
    <constraint field="qualannee" exp="" desc=""/>
    <constraint field="dategeoloc" exp="" desc=""/>
    <constraint field="sourgeoloc" exp="" desc=""/>
    <constraint field="sourattrib" exp="" desc=""/>
    <constraint field="_observation" exp="" desc=""/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction key="Canvas" value="{00000000-0000-0000-0000-000000000000}"/>
    <actionsetting action="from qgis.utils import plugins&#xa;plugins['raepa'].run_action(&#xa;    'parcourir_reseau_depuis_cet_objet',&#xa;    '[% idouvrage %]',&#xa;    0&#xa;)" capture="0" isEnabledOnlyWhenEditable="0" type="1" id="{0df194bc-4507-4097-8ef1-79df9802061c}" name="Parcourir le réseau depuis cet objet" shortTitle="" icon="" notificationMessage="">
      <actionScope id="Feature"/>
      <actionScope id="Field"/>
      <actionScope id="Canvas"/>
    </actionsetting>
    <actionsetting action="from qgis.utils import plugins&#xa;plugins['raepa'].run_action(&#xa;    'ouvrage_annuler_derniere_modification',&#xa;    '[% idouvrage %]',&#xa;    '[% @layer_id %]'&#xa;)" capture="0" isEnabledOnlyWhenEditable="0" type="1" id="{7fbc9de2-5eda-48d5-bc63-59d8b99b3aa7}" name="Annuler la dernière modification" shortTitle="" icon="" notificationMessage="">
      <actionScope id="Feature"/>
      <actionScope id="Canvas"/>
    </actionsetting>
    <actionsetting action="from qgis.utils import plugins&#xa;plugins['raepa'].run_action(&#xa;    'ouvrage_couper_canalisation_sous_cet_ouvrage',&#xa;    '[% idouvrage %]',&#xa;    '[% @layer_id %]'&#xa;)" capture="0" isEnabledOnlyWhenEditable="0" type="1" id="{9f979e93-9fe8-474a-a7d3-0ed9baeb21e8}" name="Couper la canalisation sous cet ouvrage" shortTitle="" icon="" notificationMessage="">
      <actionScope id="Feature"/>
      <actionScope id="Field"/>
      <actionScope id="Canvas"/>
    </actionsetting>
  </attributeactions>
  <attributetableconfig sortOrder="0" actionWidgetStyle="dropDown" sortExpression="&quot;fnouvaep&quot;">
    <columns>
      <column width="-1" type="field" name="id" hidden="0"/>
      <column width="-1" type="field" name="idouvrage" hidden="0"/>
      <column width="-1" type="field" name="x" hidden="0"/>
      <column width="-1" type="field" name="y" hidden="0"/>
      <column width="-1" type="field" name="mouvrage" hidden="0"/>
      <column width="-1" type="field" name="gexploit" hidden="0"/>
      <column width="236" type="field" name="fnouvaep" hidden="0"/>
      <column width="-1" type="field" name="anfinpose" hidden="0"/>
      <column width="-1" type="field" name="idcanamont" hidden="0"/>
      <column width="-1" type="field" name="idcanaval" hidden="0"/>
      <column width="-1" type="field" name="idcanppale" hidden="0"/>
      <column width="-1" type="field" name="z" hidden="0"/>
      <column width="-1" type="field" name="andebpose" hidden="0"/>
      <column width="-1" type="field" name="qualglocxy" hidden="0"/>
      <column width="-1" type="field" name="qualglocz" hidden="0"/>
      <column width="-1" type="field" name="datemaj" hidden="0"/>
      <column width="-1" type="field" name="sourmaj" hidden="0"/>
      <column width="-1" type="field" name="qualannee" hidden="0"/>
      <column width="-1" type="field" name="dategeoloc" hidden="0"/>
      <column width="-1" type="field" name="sourgeoloc" hidden="0"/>
      <column width="-1" type="field" name="sourattrib" hidden="0"/>
      <column width="-1" type="actions" hidden="1"/>
      <column width="-1" type="field" name="_observation" hidden="0"/>
    </columns>
  </attributetableconfig>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles/>
  </conditionalstyles>
  <editform tolerant="1">/../../../.local/share/QGIS/QGIS3/profiles</editform>
  <editforminit>vw_cover_open</editforminit>
  <editforminitcodesource>0</editforminitcodesource>
  <editforminitfilepath>/../.local/share/QGIS/.local/share/QGIS/QGIS3/profiles/default/3liz/Reapa</editforminitfilepath>
  <editforminitcode><![CDATA[from qgepplugin.ui.forms import vw_cover_open
]]></editforminitcode>
  <featformsuppress>0</featformsuppress>
  <editorlayout>tablayout</editorlayout>
  <attributeEditorForm>
    <attributeEditorContainer groupBox="0" visibilityExpressionEnabled="0" showLabel="1" name="Ouvrage" columnCount="1" visibilityExpression="">
      <attributeEditorContainer groupBox="1" visibilityExpressionEnabled="0" showLabel="1" name="Général" columnCount="1" visibilityExpression="">
        <attributeEditorField index="0" showLabel="1" name="id"/>
        <attributeEditorField index="1" showLabel="1" name="idouvrage"/>
        <attributeEditorField index="-1" showLabel="1" name="typreseau"/>
        <attributeEditorField index="6" showLabel="1" name="fnouvaep"/>
        <attributeEditorField index="21" showLabel="1" name="_observation"/>
      </attributeEditorContainer>
      <attributeEditorContainer groupBox="1" visibilityExpressionEnabled="0" showLabel="1" name="Technique" columnCount="1" visibilityExpression="">
        <attributeEditorField index="2" showLabel="1" name="x"/>
        <attributeEditorField index="3" showLabel="1" name="y"/>
        <attributeEditorField index="11" showLabel="1" name="z"/>
        <attributeEditorField index="13" showLabel="1" name="qualglocxy"/>
        <attributeEditorField index="14" showLabel="1" name="qualglocz"/>
      </attributeEditorContainer>
      <attributeEditorContainer groupBox="1" visibilityExpressionEnabled="0" showLabel="1" name="Relations" columnCount="1" visibilityExpression="">
        <attributeEditorField index="8" showLabel="1" name="idcanamont"/>
        <attributeEditorField index="9" showLabel="1" name="idcanaval"/>
        <attributeEditorField index="10" showLabel="1" name="idcanppale"/>
      </attributeEditorContainer>
      <attributeEditorContainer groupBox="1" visibilityExpressionEnabled="0" showLabel="1" name="Historique" columnCount="1" visibilityExpression="">
        <attributeEditorField index="4" showLabel="1" name="mouvrage"/>
        <attributeEditorField index="5" showLabel="1" name="gexploit"/>
        <attributeEditorField index="12" showLabel="1" name="andebpose"/>
        <attributeEditorField index="7" showLabel="1" name="anfinpose"/>
      </attributeEditorContainer>
      <attributeEditorContainer groupBox="1" visibilityExpressionEnabled="0" showLabel="1" name="Métadonnées" columnCount="1" visibilityExpression="">
        <attributeEditorField index="15" showLabel="1" name="datemaj"/>
        <attributeEditorField index="16" showLabel="1" name="sourmaj"/>
        <attributeEditorField index="17" showLabel="1" name="qualannee"/>
        <attributeEditorField index="18" showLabel="1" name="dategeoloc"/>
        <attributeEditorField index="19" showLabel="1" name="sourgeoloc"/>
        <attributeEditorField index="20" showLabel="1" name="sourattrib"/>
      </attributeEditorContainer>
    </attributeEditorContainer>
  </attributeEditorForm>
  <editable>
    <field editable="1" name="_angletampon"/>
    <field editable="1" name="_code_chantier"/>
    <field editable="1" name="_date_import"/>
    <field editable="1" name="_geom_emprise"/>
    <field editable="1" name="_observation"/>
    <field editable="1" name="_source_historique"/>
    <field editable="1" name="_temp_data"/>
    <field editable="1" name="_ztampon"/>
    <field editable="1" name="andebpose"/>
    <field editable="1" name="anfinpose"/>
    <field editable="1" name="dategeoloc"/>
    <field editable="1" name="datemaj"/>
    <field editable="1" name="fnouvaep"/>
    <field editable="1" name="fnouvass"/>
    <field editable="1" name="gexploit"/>
    <field editable="0" name="id"/>
    <field editable="1" name="idcanamont"/>
    <field editable="1" name="idcanaval"/>
    <field editable="1" name="idcanppale"/>
    <field editable="0" name="idouvrage"/>
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
    <field labelOnTop="0" name="_date_import"/>
    <field labelOnTop="0" name="_geom_emprise"/>
    <field labelOnTop="0" name="_observation"/>
    <field labelOnTop="0" name="_source_historique"/>
    <field labelOnTop="0" name="_temp_data"/>
    <field labelOnTop="0" name="_ztampon"/>
    <field labelOnTop="0" name="andebpose"/>
    <field labelOnTop="0" name="anfinpose"/>
    <field labelOnTop="0" name="dategeoloc"/>
    <field labelOnTop="0" name="datemaj"/>
    <field labelOnTop="0" name="fnouvaep"/>
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
  <previewExpression>id</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>0</layerGeometryType>
</qgis>
