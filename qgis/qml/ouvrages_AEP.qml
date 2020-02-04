<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis maxScale="1" simplifyLocal="0" minScale="2501" simplifyMaxScale="1" version="3.4.14-Madeira" simplifyDrawingHints="0" styleCategories="AllStyleCategories" labelsEnabled="0" simplifyDrawingTol="1" hasScaleBasedVisibilityFlag="1" simplifyAlgorithm="0" readOnly="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 forceraster="0" symbollevels="0" enableorderby="0" type="RuleRenderer">
    <rules key="{6736e613-3750-466f-8a9f-3310fefc92b3}">
      <rule label="Station de pompage" filter="&quot;fnouvaep&quot; = '01'" key="{85abc532-ce36-437d-b0cf-48fbebdc5b95}" symbol="0"/>
      <rule label="Station de traitement" filter="&quot;fnouvaep&quot; = '02'" key="{3103a62c-d84c-43d5-ac41-0530a9873cd5}" symbol="1"/>
      <rule label="Réservoir" filter="&quot;fnouvaep&quot; = '03'" key="{e51c6d5a-9329-43d8-a377-e41b742e24d3}" symbol="2"/>
      <rule label="Chambre de comptage" filter="&quot;fnouvaep&quot; = '04'" key="{31322e09-08e1-4427-99ca-6abe3cf11756}" symbol="3"/>
      <rule label="Captage" filter="&quot;fnouvaep&quot; = '05'" key="{99742514-bc1e-4d8c-84df-493c1c0a4ee3}" symbol="4"/>
      <rule label="Indéterminé" filter="&quot;fnouvaep&quot; = '00'" key="{a58e9cd6-6bfa-482f-b54a-c2c5f08ad64e}" symbol="5"/>
      <rule label="Autre" filter="&quot;fnouvaep&quot; = '99'" key="{b56796d8-f43d-4594-9034-e3b57e012d40}" symbol="6"/>
    </rules>
    <symbols>
      <symbol alpha="1" clip_to_extent="1" force_rhr="0" name="0" type="marker">
        <layer enabled="1" class="SimpleMarker" pass="3" locked="0">
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
          <effect enabled="0" type="effectStack">
            <effect type="drawSource">
              <prop k="blend_mode" v="0"/>
              <prop k="draw_mode" v="2"/>
              <prop k="enabled" v="1"/>
              <prop k="opacity" v="1"/>
            </effect>
          </effect>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" type="QString" value=""/>
              <Option name="properties" type="Map">
                <Option name="outlineColor" type="Map">
                  <Option name="active" type="bool" value="false"/>
                  <Option name="expression" type="QString" value="CASE WHEN channel_usage_current IN (4514, 4520) THEN '50,160,45,255' WHEN channel_usage_current = 4516 THEN '140,70,0,255' WHEN channel_usage_current = 4518 THEN '0,170,255,255' WHEN channel_usage_current = 4522 THEN '140,70,0,255' WHEN channel_usage_current IN (4524, 4526) THEN '255,0,0,255' ELSE '161,161,161,255' END"/>
                  <Option name="type" type="int" value="3"/>
                </Option>
              </Option>
              <Option name="type" type="QString" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer enabled="1" class="SimpleMarker" pass="3" locked="0">
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
          <effect enabled="0" type="effectStack">
            <effect type="drawSource">
              <prop k="blend_mode" v="0"/>
              <prop k="draw_mode" v="2"/>
              <prop k="enabled" v="1"/>
              <prop k="opacity" v="1"/>
            </effect>
          </effect>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" type="QString" value=""/>
              <Option name="properties" type="Map">
                <Option name="fillColor" type="Map">
                  <Option name="active" type="bool" value="false"/>
                  <Option name="expression" type="QString" value="CASE WHEN channel_usage_current IN (4514, 4520) THEN '50,160,45,255' WHEN channel_usage_current = 4516 THEN '140,70,0,255' WHEN channel_usage_current = 4518 THEN '0,170,255,255' WHEN channel_usage_current = 4522 THEN '140,70,0,255' WHEN channel_usage_current IN (4524, 4526) THEN '255,0,0,255' ELSE '161,161,161,255' END"/>
                  <Option name="type" type="int" value="3"/>
                </Option>
              </Option>
              <Option name="type" type="QString" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" clip_to_extent="1" force_rhr="0" name="1" type="marker">
        <layer enabled="1" class="SimpleMarker" pass="0" locked="0">
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
              <Option name="name" type="QString" value=""/>
              <Option name="properties"/>
              <Option name="type" type="QString" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" clip_to_extent="1" force_rhr="0" name="2" type="marker">
        <layer enabled="1" class="SimpleMarker" pass="0" locked="0">
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
              <Option name="name" type="QString" value=""/>
              <Option name="properties"/>
              <Option name="type" type="QString" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" clip_to_extent="1" force_rhr="0" name="3" type="marker">
        <layer enabled="1" class="SimpleMarker" pass="0" locked="0">
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
              <Option name="name" type="QString" value=""/>
              <Option name="properties"/>
              <Option name="type" type="QString" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" clip_to_extent="1" force_rhr="0" name="4" type="marker">
        <layer enabled="1" class="SimpleMarker" pass="0" locked="0">
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
              <Option name="name" type="QString" value=""/>
              <Option name="properties"/>
              <Option name="type" type="QString" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" clip_to_extent="1" force_rhr="0" name="5" type="marker">
        <layer enabled="1" class="SimpleMarker" pass="3" locked="0">
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
              <Option name="name" type="QString" value=""/>
              <Option name="properties" type="Map">
                <Option name="angle" type="Map">
                  <Option name="active" type="bool" value="false"/>
                  <Option name="expression" type="QString" value=""/>
                  <Option name="type" type="int" value="3"/>
                </Option>
              </Option>
              <Option name="type" type="QString" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" clip_to_extent="1" force_rhr="0" name="6" type="marker">
        <layer enabled="1" class="SimpleMarker" pass="0" locked="0">
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
              <Option name="name" type="QString" value=""/>
              <Option name="properties"/>
              <Option name="type" type="QString" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </symbols>
    <effect enabled="0" type="effectStack">
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
    <DiagramCategory sizeScale="3x:0,0,0,0,0,0" rotationOffset="270" sizeType="MM" labelPlacementMethod="XHeight" backgroundColor="#ffffff" width="15" lineSizeScale="3x:0,0,0,0,0,0" penAlpha="255" penWidth="0" backgroundAlpha="255" scaleDependency="Area" minimumSize="0" enabled="0" diagramOrientation="Up" maxScaleDenominator="2501" barWidth="5" penColor="#000000" scaleBasedVisibility="1" lineSizeType="MM" opacity="1" height="15" minScaleDenominator="1">
      <fontProperties style="" description="Ubuntu,11,-1,5,50,0,0,0,0,0"/>
      <attribute label="" field="" color="#000000"/>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings showAll="1" dist="0" placement="0" priority="0" zIndex="0" linePlacementFlags="18" obstacle="0">
    <properties>
      <Option type="Map">
        <Option name="name" type="QString" value=""/>
        <Option name="properties"/>
        <Option name="type" type="QString" value="collection"/>
      </Option>
    </properties>
  </DiagramLayerSettings>
  <geometryOptions geometryPrecision="0" removeDuplicateNodes="0">
    <activeChecks/>
    <checkConfiguration/>
  </geometryOptions>
  <fieldConfiguration>
    <field name="id">
      <editWidget type="Range">
        <config>
          <Option type="Map">
            <Option name="AllowNull" type="bool" value="true"/>
            <Option name="Max" type="int" value="2147483647"/>
            <Option name="Min" type="int" value="-2147483648"/>
            <Option name="Precision" type="int" value="0"/>
            <Option name="Step" type="int" value="1"/>
            <Option name="Style" type="QString" value="SpinBox"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="idouvrage">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" type="bool" value="false"/>
            <Option name="UseHtml" type="bool" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="x">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" type="bool" value="false"/>
            <Option name="UseHtml" type="bool" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="y">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" type="bool" value="false"/>
            <Option name="UseHtml" type="bool" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="mouvrage">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option name="AllowMulti" type="bool" value="false"/>
            <Option name="AllowNull" type="bool" value="true"/>
            <Option name="FilterExpression" type="QString" value=""/>
            <Option name="Key" type="QString" value="nom"/>
            <Option name="Layer" type="QString" value="sys_organisme_gestionnaire2019100910365653369926340"/>
            <Option name="NofColumns" type="int" value="1"/>
            <Option name="OrderByValue" type="bool" value="true"/>
            <Option name="UseCompleter" type="bool" value="false"/>
            <Option name="Value" type="QString" value="nom"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="gexploit">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option name="AllowMulti" type="bool" value="false"/>
            <Option name="AllowNull" type="bool" value="true"/>
            <Option name="FilterExpression" type="QString" value=""/>
            <Option name="Key" type="QString" value="nom"/>
            <Option name="Layer" type="QString" value="sys_organisme_gestionnaire2019100910365653369926340"/>
            <Option name="NofColumns" type="int" value="1"/>
            <Option name="OrderByValue" type="bool" value="true"/>
            <Option name="UseCompleter" type="bool" value="false"/>
            <Option name="Value" type="QString" value="nom"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fnouvaep">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option name="AllowMulti" type="bool" value="false"/>
            <Option name="AllowNull" type="bool" value="true"/>
            <Option name="FilterExpression" type="QString" value=""/>
            <Option name="Key" type="QString" value="code"/>
            <Option name="Layer" type="QString" value="val_raepa_fonc_ouv_ae201910091036565371693200831"/>
            <Option name="NofColumns" type="int" value="1"/>
            <Option name="OrderByValue" type="bool" value="true"/>
            <Option name="UseCompleter" type="bool" value="false"/>
            <Option name="Value" type="QString" value="libelle"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="anfinpose">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" type="bool" value="false"/>
            <Option name="UseHtml" type="bool" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="idcanamont">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" type="bool" value="false"/>
            <Option name="UseHtml" type="bool" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="idcanaval">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" type="bool" value="false"/>
            <Option name="UseHtml" type="bool" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="idcanppale">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" type="bool" value="false"/>
            <Option name="UseHtml" type="bool" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="z">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" type="bool" value="false"/>
            <Option name="UseHtml" type="bool" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="andebpose">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" type="bool" value="false"/>
            <Option name="UseHtml" type="bool" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="qualglocxy">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option name="AllowMulti" type="bool" value="false"/>
            <Option name="AllowNull" type="bool" value="true"/>
            <Option name="FilterExpression" type="QString" value=""/>
            <Option name="Key" type="QString" value="code"/>
            <Option name="Layer" type="QString" value="val_raepa_qualite_geoloc201910091036565392031560565"/>
            <Option name="NofColumns" type="int" value="1"/>
            <Option name="OrderByValue" type="bool" value="true"/>
            <Option name="UseCompleter" type="bool" value="false"/>
            <Option name="Value" type="QString" value="libelle"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="qualglocz">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option name="AllowMulti" type="bool" value="false"/>
            <Option name="AllowNull" type="bool" value="true"/>
            <Option name="FilterExpression" type="QString" value=""/>
            <Option name="Key" type="QString" value="code"/>
            <Option name="Layer" type="QString" value="val_raepa_qualite_geoloc201910091036565392031560565"/>
            <Option name="NofColumns" type="int" value="1"/>
            <Option name="OrderByValue" type="bool" value="true"/>
            <Option name="UseCompleter" type="bool" value="false"/>
            <Option name="Value" type="QString" value="libelle"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="datemaj">
      <editWidget type="DateTime">
        <config>
          <Option type="Map">
            <Option name="allow_null" type="bool" value="true"/>
            <Option name="calendar_popup" type="bool" value="true"/>
            <Option name="display_format" type="QString" value="yyyy-MM-dd"/>
            <Option name="field_format" type="QString" value="yyyy-MM-dd"/>
            <Option name="field_iso_format" type="bool" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="sourmaj">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option name="AllowMulti" type="bool" value="false"/>
            <Option name="AllowNull" type="bool" value="true"/>
            <Option name="FilterExpression" type="QString" value=""/>
            <Option name="Key" type="QString" value="nom"/>
            <Option name="Layer" type="QString" value="sys_organisme_gestionnaire2019100910365653369926340"/>
            <Option name="NofColumns" type="int" value="1"/>
            <Option name="OrderByValue" type="bool" value="true"/>
            <Option name="UseCompleter" type="bool" value="false"/>
            <Option name="Value" type="QString" value="nom"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="qualannee">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option name="AllowMulti" type="bool" value="false"/>
            <Option name="AllowNull" type="bool" value="true"/>
            <Option name="FilterExpression" type="QString" value=""/>
            <Option name="Key" type="QString" value="code"/>
            <Option name="Layer" type="QString" value="val_raepa_qualite_anpose20191009103656539585994462"/>
            <Option name="NofColumns" type="int" value="1"/>
            <Option name="OrderByValue" type="bool" value="true"/>
            <Option name="UseCompleter" type="bool" value="false"/>
            <Option name="Value" type="QString" value="libelle"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="dategeoloc">
      <editWidget type="DateTime">
        <config>
          <Option type="Map">
            <Option name="allow_null" type="bool" value="true"/>
            <Option name="calendar_popup" type="bool" value="true"/>
            <Option name="display_format" type="QString" value="yyyy-MM-dd"/>
            <Option name="field_format" type="QString" value="yyyy-MM-dd"/>
            <Option name="field_iso_format" type="bool" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="sourgeoloc">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" type="bool" value="false"/>
            <Option name="UseHtml" type="bool" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="sourattrib">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" type="bool" value="false"/>
            <Option name="UseHtml" type="bool" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="_observation">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" type="bool" value="true"/>
            <Option name="UseHtml" type="bool" value="false"/>
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
    <default applyOnUpdate="0" expression="" field="id"/>
    <default applyOnUpdate="0" expression="'INCONNU'" field="idouvrage"/>
    <default applyOnUpdate="0" expression="X( $geometry )" field="x"/>
    <default applyOnUpdate="0" expression="Y( $geometry )" field="y"/>
    <default applyOnUpdate="0" expression="" field="mouvrage"/>
    <default applyOnUpdate="0" expression="" field="gexploit"/>
    <default applyOnUpdate="0" expression="" field="fnouvaep"/>
    <default applyOnUpdate="0" expression="year(now())" field="anfinpose"/>
    <default applyOnUpdate="0" expression="'INCONNU'" field="idcanamont"/>
    <default applyOnUpdate="0" expression="'INCONNU'" field="idcanaval"/>
    <default applyOnUpdate="0" expression="'INCONNU'" field="idcanppale"/>
    <default applyOnUpdate="0" expression="" field="z"/>
    <default applyOnUpdate="0" expression="" field="andebpose"/>
    <default applyOnUpdate="0" expression="" field="qualglocxy"/>
    <default applyOnUpdate="0" expression="" field="qualglocz"/>
    <default applyOnUpdate="0" expression="to_date(now())" field="datemaj"/>
    <default applyOnUpdate="0" expression="" field="sourmaj"/>
    <default applyOnUpdate="0" expression="" field="qualannee"/>
    <default applyOnUpdate="0" expression="" field="dategeoloc"/>
    <default applyOnUpdate="0" expression="" field="sourgeoloc"/>
    <default applyOnUpdate="0" expression="" field="sourattrib"/>
    <default applyOnUpdate="0" expression="''" field="_observation"/>
  </defaults>
  <constraints>
    <constraint unique_strength="1" notnull_strength="1" constraints="3" exp_strength="0" field="id"/>
    <constraint unique_strength="1" notnull_strength="1" constraints="3" exp_strength="0" field="idouvrage"/>
    <constraint unique_strength="0" notnull_strength="2" constraints="1" exp_strength="0" field="x"/>
    <constraint unique_strength="0" notnull_strength="2" constraints="1" exp_strength="0" field="y"/>
    <constraint unique_strength="0" notnull_strength="1" constraints="1" exp_strength="0" field="mouvrage"/>
    <constraint unique_strength="0" notnull_strength="1" constraints="1" exp_strength="0" field="gexploit"/>
    <constraint unique_strength="0" notnull_strength="1" constraints="1" exp_strength="0" field="fnouvaep"/>
    <constraint unique_strength="0" notnull_strength="1" constraints="1" exp_strength="0" field="anfinpose"/>
    <constraint unique_strength="0" notnull_strength="2" constraints="1" exp_strength="0" field="idcanamont"/>
    <constraint unique_strength="0" notnull_strength="2" constraints="1" exp_strength="0" field="idcanaval"/>
    <constraint unique_strength="0" notnull_strength="0" constraints="0" exp_strength="0" field="idcanppale"/>
    <constraint unique_strength="0" notnull_strength="0" constraints="0" exp_strength="0" field="z"/>
    <constraint unique_strength="0" notnull_strength="0" constraints="0" exp_strength="0" field="andebpose"/>
    <constraint unique_strength="0" notnull_strength="1" constraints="1" exp_strength="0" field="qualglocxy"/>
    <constraint unique_strength="0" notnull_strength="1" constraints="1" exp_strength="0" field="qualglocz"/>
    <constraint unique_strength="0" notnull_strength="1" constraints="1" exp_strength="0" field="datemaj"/>
    <constraint unique_strength="0" notnull_strength="1" constraints="1" exp_strength="0" field="sourmaj"/>
    <constraint unique_strength="0" notnull_strength="0" constraints="0" exp_strength="0" field="qualannee"/>
    <constraint unique_strength="0" notnull_strength="0" constraints="0" exp_strength="0" field="dategeoloc"/>
    <constraint unique_strength="0" notnull_strength="0" constraints="0" exp_strength="0" field="sourgeoloc"/>
    <constraint unique_strength="0" notnull_strength="0" constraints="0" exp_strength="0" field="sourattrib"/>
    <constraint unique_strength="0" notnull_strength="0" constraints="0" exp_strength="0" field="_observation"/>
  </constraints>
  <constraintExpressions>
    <constraint desc="" exp="" field="id"/>
    <constraint desc="" exp="" field="idouvrage"/>
    <constraint desc="" exp="" field="x"/>
    <constraint desc="" exp="" field="y"/>
    <constraint desc="" exp="" field="mouvrage"/>
    <constraint desc="" exp="" field="gexploit"/>
    <constraint desc="" exp="" field="fnouvaep"/>
    <constraint desc="" exp="" field="anfinpose"/>
    <constraint desc="" exp="" field="idcanamont"/>
    <constraint desc="" exp="" field="idcanaval"/>
    <constraint desc="" exp="" field="idcanppale"/>
    <constraint desc="" exp="" field="z"/>
    <constraint desc="" exp="" field="andebpose"/>
    <constraint desc="" exp="" field="qualglocxy"/>
    <constraint desc="" exp="" field="qualglocz"/>
    <constraint desc="" exp="" field="datemaj"/>
    <constraint desc="" exp="" field="sourmaj"/>
    <constraint desc="" exp="" field="qualannee"/>
    <constraint desc="" exp="" field="dategeoloc"/>
    <constraint desc="" exp="" field="sourgeoloc"/>
    <constraint desc="" exp="" field="sourattrib"/>
    <constraint desc="" exp="" field="_observation"/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction key="Canvas" value="{00000000-0000-0000-0000-000000000000}"/>
    <actionsetting notificationMessage="" isEnabledOnlyWhenEditable="0" id="{b29a2786-fbdd-462d-9d9a-ca6707ed5c70}" icon="" action="from qgis.utils import plugins&#xa;plugins['raepa'].run_action(&#xa;    'parcourir_reseau_depuis_cet_objet',&#xa;    '[% idouvrage %]',&#xa;    0&#xa;)" shortTitle="" capture="0" name="Parcourir le réseau depuis cet objet" type="1">
      <actionScope id="Canvas"/>
      <actionScope id="Field"/>
      <actionScope id="Feature"/>
    </actionsetting>
    <actionsetting notificationMessage="" isEnabledOnlyWhenEditable="0" id="{1cbb62ec-af9f-43ae-926a-0eed3512c6dd}" icon="" action="from qgis.utils import plugins&#xa;plugins['raepa'].run_action(&#xa;    'ouvrage_annuler_derniere_modification',&#xa;    '[% idouvrage %]',&#xa;    '[% @layer_id %]'&#xa;)" shortTitle="" capture="0" name="Annuler la dernière modification" type="1">
      <actionScope id="Canvas"/>
      <actionScope id="Feature"/>
    </actionsetting>
    <actionsetting notificationMessage="" isEnabledOnlyWhenEditable="0" id="{b1ba3622-cf3b-4d03-bd39-50ecb0d70f74}" icon="" action="from qgis.utils import plugins&#xa;plugins['raepa'].run_action(&#xa;    'ouvrage_couper_canalisation_sous_cet_ouvrage',&#xa;    '[% idouvrage %]',&#xa;    '[% @layer_id %]'&#xa;)" shortTitle="" capture="0" name="Couper la canalisation sous cet ouvrage" type="1">
      <actionScope id="Canvas"/>
      <actionScope id="Field"/>
      <actionScope id="Feature"/>
    </actionsetting>
  </attributeactions>
  <attributetableconfig actionWidgetStyle="dropDown" sortExpression="&quot;fnouvaep&quot;" sortOrder="0">
    <columns>
      <column width="-1" name="id" hidden="0" type="field"/>
      <column width="-1" name="idouvrage" hidden="0" type="field"/>
      <column width="-1" name="x" hidden="0" type="field"/>
      <column width="-1" name="y" hidden="0" type="field"/>
      <column width="-1" name="mouvrage" hidden="0" type="field"/>
      <column width="-1" name="gexploit" hidden="0" type="field"/>
      <column width="236" name="fnouvaep" hidden="0" type="field"/>
      <column width="-1" name="anfinpose" hidden="0" type="field"/>
      <column width="-1" name="idcanamont" hidden="0" type="field"/>
      <column width="-1" name="idcanaval" hidden="0" type="field"/>
      <column width="-1" name="idcanppale" hidden="0" type="field"/>
      <column width="-1" name="z" hidden="0" type="field"/>
      <column width="-1" name="andebpose" hidden="0" type="field"/>
      <column width="-1" name="qualglocxy" hidden="0" type="field"/>
      <column width="-1" name="qualglocz" hidden="0" type="field"/>
      <column width="-1" name="datemaj" hidden="0" type="field"/>
      <column width="-1" name="sourmaj" hidden="0" type="field"/>
      <column width="-1" name="qualannee" hidden="0" type="field"/>
      <column width="-1" name="dategeoloc" hidden="0" type="field"/>
      <column width="-1" name="sourgeoloc" hidden="0" type="field"/>
      <column width="-1" name="sourattrib" hidden="0" type="field"/>
      <column width="-1" hidden="1" type="actions"/>
      <column width="-1" name="_observation" hidden="0" type="field"/>
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
    <attributeEditorContainer showLabel="1" visibilityExpression="" visibilityExpressionEnabled="0" columnCount="1" groupBox="0" name="Ouvrage">
      <attributeEditorContainer showLabel="1" visibilityExpression="" visibilityExpressionEnabled="0" columnCount="1" groupBox="1" name="Général">
        <attributeEditorField showLabel="1" index="0" name="id"/>
        <attributeEditorField showLabel="1" index="1" name="idouvrage"/>
        <attributeEditorField showLabel="1" index="-1" name="typreseau"/>
        <attributeEditorField showLabel="1" index="6" name="fnouvaep"/>
        <attributeEditorField showLabel="1" index="21" name="_observation"/>
      </attributeEditorContainer>
      <attributeEditorContainer showLabel="1" visibilityExpression="" visibilityExpressionEnabled="0" columnCount="1" groupBox="1" name="Technique">
        <attributeEditorField showLabel="1" index="2" name="x"/>
        <attributeEditorField showLabel="1" index="3" name="y"/>
        <attributeEditorField showLabel="1" index="11" name="z"/>
        <attributeEditorField showLabel="1" index="13" name="qualglocxy"/>
        <attributeEditorField showLabel="1" index="14" name="qualglocz"/>
      </attributeEditorContainer>
      <attributeEditorContainer showLabel="1" visibilityExpression="" visibilityExpressionEnabled="0" columnCount="1" groupBox="1" name="Relations">
        <attributeEditorField showLabel="1" index="8" name="idcanamont"/>
        <attributeEditorField showLabel="1" index="9" name="idcanaval"/>
        <attributeEditorField showLabel="1" index="10" name="idcanppale"/>
      </attributeEditorContainer>
      <attributeEditorContainer showLabel="1" visibilityExpression="" visibilityExpressionEnabled="0" columnCount="1" groupBox="1" name="Historique">
        <attributeEditorField showLabel="1" index="4" name="mouvrage"/>
        <attributeEditorField showLabel="1" index="5" name="gexploit"/>
        <attributeEditorField showLabel="1" index="12" name="andebpose"/>
        <attributeEditorField showLabel="1" index="7" name="anfinpose"/>
      </attributeEditorContainer>
      <attributeEditorContainer showLabel="1" visibilityExpression="" visibilityExpressionEnabled="0" columnCount="1" groupBox="1" name="Métadonnées">
        <attributeEditorField showLabel="1" index="15" name="datemaj"/>
        <attributeEditorField showLabel="1" index="16" name="sourmaj"/>
        <attributeEditorField showLabel="1" index="17" name="qualannee"/>
        <attributeEditorField showLabel="1" index="18" name="dategeoloc"/>
        <attributeEditorField showLabel="1" index="19" name="sourgeoloc"/>
        <attributeEditorField showLabel="1" index="20" name="sourattrib"/>
      </attributeEditorContainer>
    </attributeEditorContainer>
  </attributeEditorForm>
  <editable>
    <field name="_angletampon" editable="1"/>
    <field name="_code_chantier" editable="1"/>
    <field name="_date_import" editable="1"/>
    <field name="_geom_emprise" editable="1"/>
    <field name="_observation" editable="1"/>
    <field name="_source_historique" editable="1"/>
    <field name="_temp_data" editable="1"/>
    <field name="_ztampon" editable="1"/>
    <field name="andebpose" editable="1"/>
    <field name="anfinpose" editable="1"/>
    <field name="dategeoloc" editable="1"/>
    <field name="datemaj" editable="1"/>
    <field name="fnouvaep" editable="1"/>
    <field name="fnouvass" editable="1"/>
    <field name="gexploit" editable="1"/>
    <field name="id" editable="0"/>
    <field name="idcanamont" editable="1"/>
    <field name="idcanaval" editable="1"/>
    <field name="idcanppale" editable="1"/>
    <field name="idouvrage" editable="0"/>
    <field name="mouvrage" editable="1"/>
    <field name="qualannee" editable="1"/>
    <field name="qualglocxy" editable="1"/>
    <field name="qualglocz" editable="1"/>
    <field name="sourattrib" editable="1"/>
    <field name="sourgeoloc" editable="1"/>
    <field name="sourmaj" editable="1"/>
    <field name="typreseau" editable="1"/>
    <field name="x" editable="1"/>
    <field name="y" editable="1"/>
    <field name="z" editable="1"/>
  </editable>
  <labelOnTop>
    <field name="_angletampon" labelOnTop="0"/>
    <field name="_code_chantier" labelOnTop="0"/>
    <field name="_date_import" labelOnTop="0"/>
    <field name="_geom_emprise" labelOnTop="0"/>
    <field name="_observation" labelOnTop="0"/>
    <field name="_source_historique" labelOnTop="0"/>
    <field name="_temp_data" labelOnTop="0"/>
    <field name="_ztampon" labelOnTop="0"/>
    <field name="andebpose" labelOnTop="0"/>
    <field name="anfinpose" labelOnTop="0"/>
    <field name="dategeoloc" labelOnTop="0"/>
    <field name="datemaj" labelOnTop="0"/>
    <field name="fnouvaep" labelOnTop="0"/>
    <field name="fnouvass" labelOnTop="0"/>
    <field name="gexploit" labelOnTop="0"/>
    <field name="id" labelOnTop="0"/>
    <field name="idcanamont" labelOnTop="0"/>
    <field name="idcanaval" labelOnTop="0"/>
    <field name="idcanppale" labelOnTop="0"/>
    <field name="idouvrage" labelOnTop="0"/>
    <field name="mouvrage" labelOnTop="0"/>
    <field name="qualannee" labelOnTop="0"/>
    <field name="qualglocxy" labelOnTop="0"/>
    <field name="qualglocz" labelOnTop="0"/>
    <field name="sourattrib" labelOnTop="0"/>
    <field name="sourgeoloc" labelOnTop="0"/>
    <field name="sourmaj" labelOnTop="0"/>
    <field name="typreseau" labelOnTop="0"/>
    <field name="x" labelOnTop="0"/>
    <field name="y" labelOnTop="0"/>
    <field name="z" labelOnTop="0"/>
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
