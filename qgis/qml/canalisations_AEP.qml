<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis simplifyDrawingHints="1" readOnly="0" hasScaleBasedVisibilityFlag="0" version="3.4.13-Madeira" styleCategories="AllStyleCategories" simplifyAlgorithm="0" maxScale="1" labelsEnabled="1" simplifyDrawingTol="1" simplifyMaxScale="1" minScale="50001" simplifyLocal="1">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 symbollevels="0" forceraster="0" type="RuleRenderer" enableorderby="0">
    <rules key="{b3f3f0a1-c8d2-4416-8d68-3de95a17bc02}">
      <rule key="{9e580459-8bfa-4f04-be8f-68986341bd8e}" scalemindenom="1" scalemaxdenom="2001" label="Canalisation, échelle &lt;= 2000" symbol="0"/>
      <rule key="{d0a8418c-2231-46eb-abe3-d840c2c67437}" scalemindenom="2001" scalemaxdenom="500000" label="Canalisation, échelle > 2000" symbol="1"/>
    </rules>
    <symbols>
      <symbol clip_to_extent="1" alpha="1" force_rhr="0" type="line" name="0">
        <layer class="SimpleLine" locked="0" pass="0" enabled="1">
          <prop k="capstyle" v="flat"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="0,0,0,255"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="0.26"/>
          <prop k="line_width_unit" v="MapUnit"/>
          <prop k="offset" v="0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="ring_filter" v="0"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
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
                  <Option type="bool" name="active" value="true"/>
                  <Option type="QString" name="expression" value="CASE &#xa;&#x9;WHEN &quot;contcanaep&quot; IN ('00') THEN '161,161,161,255'&#xa;&#x9;WHEN &quot;contcanaep&quot; IN ('01') THEN '40,53,131,255' &#xa;&#x9;WHEN &quot;contcanaep&quot; IN ('02') THEN '48,140,198,255' &#xa;&#x9;ELSE '161,161,161,255'&#xa;END"/>
                  <Option type="int" name="type" value="3"/>
                </Option>
                <Option type="Map" name="outlineWidth">
                  <Option type="bool" name="active" value="true"/>
                  <Option type="QString" name="expression" value="toreal(&quot;diametre&quot; ) / 1000"/>
                  <Option type="int" name="type" value="3"/>
                </Option>
              </Option>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer class="SimpleLine" locked="0" pass="0" enabled="1">
          <prop k="capstyle" v="flat"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="203,176,112,255"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="0.3"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MapUnit"/>
          <prop k="ring_filter" v="0"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
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
                <Option type="Map" name="offset">
                  <Option type="bool" name="active" value="true"/>
                  <Option type="QString" name="expression" value="toreal( &quot;diametre&quot; ) / 2000"/>
                  <Option type="int" name="type" value="3"/>
                </Option>
                <Option type="Map" name="outlineColor">
                  <Option type="bool" name="active" value="true"/>
                  <Option type="QString" name="expression" value="CASE &#xa;&#x9;WHEN &quot;contcanaep&quot; IN ('00') THEN '161,161,161,255'&#xa;&#x9;WHEN &quot;contcanaep&quot; IN ('01') THEN '40,53,131,255' &#xa;&#x9;WHEN &quot;contcanaep&quot; IN ('02') THEN '48,140,198,255' &#xa;&#x9;ELSE '161,161,161,255'&#xa;END"/>
                  <Option type="int" name="type" value="3"/>
                </Option>
              </Option>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer class="SimpleLine" locked="0" pass="0" enabled="1">
          <prop k="capstyle" v="flat"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="0,0,0,255"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="0.3"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MapUnit"/>
          <prop k="ring_filter" v="0"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
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
                <Option type="Map" name="offset">
                  <Option type="bool" name="active" value="true"/>
                  <Option type="QString" name="expression" value="toreal(&quot;diametre&quot; ) / - 2000"/>
                  <Option type="int" name="type" value="3"/>
                </Option>
                <Option type="Map" name="outlineColor">
                  <Option type="bool" name="active" value="true"/>
                  <Option type="QString" name="expression" value="CASE &#xa;&#x9;WHEN &quot;contcanaep&quot; IN ('00') THEN '161,161,161,255'&#xa;&#x9;WHEN &quot;contcanaep&quot; IN ('01') THEN '40,53,131,255' &#xa;&#x9;WHEN &quot;contcanaep&quot; IN ('02') THEN '48,140,198,255' &#xa;&#x9;ELSE '161,161,161,255'&#xa;END"/>
                  <Option type="int" name="type" value="3"/>
                </Option>
              </Option>
              <Option type="QString" name="type" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol clip_to_extent="1" alpha="1" force_rhr="0" type="line" name="1">
        <layer class="SimpleLine" locked="0" pass="0" enabled="1">
          <prop k="capstyle" v="flat"/>
          <prop k="customdash" v="5;2"/>
          <prop k="customdash_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="customdash_unit" v="MM"/>
          <prop k="draw_inside_polygon" v="0"/>
          <prop k="joinstyle" v="bevel"/>
          <prop k="line_color" v="0,0,0,255"/>
          <prop k="line_style" v="solid"/>
          <prop k="line_width" v="0.5"/>
          <prop k="line_width_unit" v="MM"/>
          <prop k="offset" v="0"/>
          <prop k="offset_map_unit_scale" v="3x:0,0,0,0,0,0"/>
          <prop k="offset_unit" v="MM"/>
          <prop k="ring_filter" v="0"/>
          <prop k="use_custom_dash" v="0"/>
          <prop k="width_map_unit_scale" v="3x:0,0,0,0,0,0"/>
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
                  <Option type="bool" name="active" value="true"/>
                  <Option type="QString" name="expression" value="CASE &#xa;&#x9;WHEN &quot;contcanaep&quot; IN ('00') THEN '161,161,161,255'&#xa;&#x9;WHEN &quot;contcanaep&quot; IN ('01') THEN '40,53,131,255' &#xa;&#x9;WHEN &quot;contcanaep&quot; IN ('02') THEN '48,140,198,255' &#xa;&#x9;ELSE '161,161,161,255'&#xa;END"/>
                  <Option type="int" name="type" value="3"/>
                </Option>
              </Option>
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
  <labeling type="simple">
    <settings>
      <text-style namedStyle="Regular" textOpacity="1" multilineHeight="1" textColor="0,0,0,255" previewBkgrdColor="#ffffff" isExpression="1" blendMode="0" fontItalic="0" fontWeight="50" fontStrikeout="0" fontSizeUnit="Point" fontWordSpacing="0" fontUnderline="0" fontCapitals="0" fontFamily="Ubuntu" fontLetterSpacing="0" fieldName="CONCAT(&#xa;&#x9;CASE &#xa;&#x9;WHEN &quot;contcanaep&quot; = '00' THEN 'IN'&#xa;&#x9;WHEN &quot;contcanaep&quot; = '01' THEN 'EB'&#xa;&#x9;WHEN &quot;contcanaep&quot; = '02' THEN 'EP'&#xa;&#x9;WHEN &quot;contcanaep&quot; = '99' THEN 'AU'&#xa;&#x9;ELSE 'IN' END,&#xa;&#x9;' ' ,&#xa;&#x9;COALESCE(&quot;diametre&quot;||' ', ''), 'mm',&#xa;&#x9;'@' || &quot;_longcana_cm&quot;|| 'm' &#xa;)" fontSizeMapUnitScale="3x:0,0,0,0,0,0" fontSize="8" useSubstitutions="0">
        <text-buffer bufferNoFill="0" bufferOpacity="1" bufferJoinStyle="64" bufferSize="1" bufferColor="255,255,255,255" bufferDraw="1" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferBlendMode="0" bufferSizeUnits="MM"/>
        <background shapeBorderWidth="0" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeType="0" shapeSizeUnit="MM" shapeBorderWidthUnit="MM" shapeOpacity="1" shapeRotation="0" shapeOffsetY="0" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeBorderColor="128,128,128,255" shapeSizeX="0" shapeDraw="0" shapeFillColor="255,255,255,255" shapeRadiiUnit="MM" shapeRotationType="0" shapeSVGFile="" shapeRadiiX="0" shapeRadiiY="0" shapeOffsetX="0" shapeSizeY="0" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeJoinStyle="64" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeSizeType="0" shapeOffsetUnit="MM" shapeBlendMode="0"/>
        <shadow shadowScale="100" shadowBlendMode="6" shadowRadiusAlphaOnly="0" shadowOffsetDist="1" shadowRadius="1.5" shadowOffsetUnit="MM" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowDraw="0" shadowOffsetAngle="135" shadowUnder="0" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowOffsetGlobal="1" shadowColor="0,0,0,255" shadowRadiusUnit="MM" shadowOpacity="0.7"/>
        <substitutions/>
      </text-style>
      <text-format reverseDirectionSymbol="0" plussign="0" formatNumbers="0" autoWrapLength="0" rightDirectionSymbol="  >" wrapChar="@" addDirectionSymbol="1" useMaxLineLengthForAutoWrap="1" multilineAlign="1" leftDirectionSymbol="&lt;  " placeDirectionSymbol="0" decimals="3"/>
      <placement distMapUnitScale="3x:0,0,0,0,0,0" dist="0.3" distUnits="MapUnit" quadOffset="4" xOffset="0" priority="5" placement="2" preserveRotation="1" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" maxCurvedCharAngleOut="-20" rotationAngle="0" centroidWhole="0" placementFlags="10" fitInPolygonOnly="0" offsetType="0" centroidInside="0" maxCurvedCharAngleIn="20" yOffset="0" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" offsetUnits="MapUnit" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" repeatDistanceUnits="MM" repeatDistance="0"/>
      <rendering labelPerPart="0" maxNumLabels="2000" upsidedownLabels="0" scaleMin="1" fontMaxPixelSize="10000" zIndex="0" obstacle="1" displayAll="0" scaleMax="2001" drawLabels="1" mergeLines="0" scaleVisibility="1" limitNumLabels="0" fontMinPixelSize="3" minFeatureSize="12" obstacleType="0" fontLimitPixelSize="0" obstacleFactor="1"/>
      <dd_properties>
        <Option type="Map">
          <Option type="QString" name="name" value=""/>
          <Option type="Map" name="properties">
            <Option type="Map" name="Color">
              <Option type="bool" name="active" value="true"/>
              <Option type="QString" name="expression" value="CASE &#xa;&#x9;WHEN &quot;contcanaep&quot; IN ('00') THEN '161,161,161,255'&#xa;&#x9;WHEN &quot;contcanaep&quot; IN ('01') THEN '40,53,131,255' &#xa;&#x9;WHEN &quot;contcanaep&quot; IN ('02') THEN '48,140,198,255' &#xa;&#x9;ELSE '161,161,161,255'&#xa;END"/>
              <Option type="int" name="type" value="3"/>
            </Option>
            <Option type="Map" name="LabelDistance">
              <Option type="bool" name="active" value="true"/>
              <Option type="QString" name="expression" value="COALESCE(&quot;diametre&quot;, 0) / 2000.0 + 0.1"/>
              <Option type="int" name="type" value="3"/>
            </Option>
          </Option>
          <Option type="QString" name="type" value="collection"/>
        </Option>
      </dd_properties>
    </settings>
  </labeling>
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
    <DiagramCategory penAlpha="255" height="15" lineSizeType="MM" diagramOrientation="Up" minScaleDenominator="1" backgroundAlpha="255" enabled="0" sizeScale="3x:0,0,0,0,0,0" lineSizeScale="3x:0,0,0,0,0,0" minimumSize="0" width="15" barWidth="5" sizeType="MM" scaleDependency="Area" rotationOffset="270" scaleBasedVisibility="0" backgroundColor="#ffffff" opacity="1" labelPlacementMethod="XHeight" penColor="#000000" maxScaleDenominator="50001" penWidth="0">
      <fontProperties description="Ubuntu,11,-1,5,50,0,0,0,0,0" style=""/>
      <attribute field="" color="#000000" label=""/>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings zIndex="0" linePlacementFlags="18" obstacle="0" dist="0" showAll="1" placement="2" priority="0">
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
    <field name="idcana">
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
    <field name="enservice">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option type="QString" name="CheckedState" value="1"/>
            <Option type="QString" name="UncheckedState" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="branchemnt">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option type="QString" name="CheckedState" value="1"/>
            <Option type="QString" name="UncheckedState" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="materiau">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option type="bool" name="AllowMulti" value="false"/>
            <Option type="bool" name="AllowNull" value="true"/>
            <Option type="QString" name="FilterExpression" value=""/>
            <Option type="QString" name="Key" value="code"/>
            <Option type="QString" name="Layer" value="val_raepa_materiau201910091036565381184808403"/>
            <Option type="int" name="NofColumns" value="1"/>
            <Option type="bool" name="OrderByValue" value="true"/>
            <Option type="bool" name="UseCompleter" value="false"/>
            <Option type="QString" name="Value" value="libelle"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="diametre">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
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
    <field name="modecirc">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option type="bool" name="AllowMulti" value="false"/>
            <Option type="bool" name="AllowNull" value="true"/>
            <Option type="QString" name="FilterExpression" value=""/>
            <Option type="QString" name="Key" value="code"/>
            <Option type="QString" name="Layer" value="val_raepa_mode_circulation20191009103656538101934309"/>
            <Option type="int" name="NofColumns" value="1"/>
            <Option type="bool" name="OrderByValue" value="true"/>
            <Option type="bool" name="UseCompleter" value="false"/>
            <Option type="QString" name="Value" value="libelle"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="contcanaep">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option type="bool" name="AllowMulti" value="false"/>
            <Option type="bool" name="AllowNull" value="true"/>
            <Option type="QString" name="FilterExpression" value=""/>
            <Option type="QString" name="Key" value="code"/>
            <Option type="QString" name="Layer" value="val_raepa_fonc_canal_ae201910091036565371961455885"/>
            <Option type="int" name="NofColumns" value="1"/>
            <Option type="bool" name="OrderByValue" value="true"/>
            <Option type="bool" name="UseCompleter" value="false"/>
            <Option type="QString" name="Value" value="libelle"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fonccanaep">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option type="bool" name="AllowMulti" value="false"/>
            <Option type="bool" name="AllowNull" value="true"/>
            <Option type="QString" name="FilterExpression" value=""/>
            <Option type="QString" name="Key" value="code"/>
            <Option type="QString" name="Layer" value="val_raepa_fonc_canal_ae201910091036565371961455885"/>
            <Option type="int" name="NofColumns" value="1"/>
            <Option type="bool" name="OrderByValue" value="true"/>
            <Option type="bool" name="UseCompleter" value="false"/>
            <Option type="QString" name="Value" value="libelle"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="idnini">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="idnterm">
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
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="profgen">
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
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="longcana">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="_longcana_cm">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="QString" name="IsMultiline" value="0"/>
            <Option type="QString" name="UseHtml" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="_longcana_reelle">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" name="IsMultiline" value="false"/>
            <Option type="bool" name="UseHtml" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="nbranche">
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
    <alias index="1" field="idcana" name="Code canalisation"/>
    <alias index="2" field="mouvrage" name="Maître d’ouvrage"/>
    <alias index="3" field="gexploit" name="Exploitant"/>
    <alias index="4" field="enservice" name="En service"/>
    <alias index="5" field="branchemnt" name="Branchement"/>
    <alias index="6" field="materiau" name="Matériau"/>
    <alias index="7" field="diametre" name="Diamètre nominal [mm]"/>
    <alias index="8" field="anfinpose" name="Année de fin de pose"/>
    <alias index="9" field="modecirc" name="Mode de circulation"/>
    <alias index="10" field="contcanaep" name="Catégorie"/>
    <alias index="11" field="fonccanaep" name="Fonction"/>
    <alias index="12" field="idnini" name="Noeud initial"/>
    <alias index="13" field="idnterm" name="Noeud terminal"/>
    <alias index="14" field="idcanppale" name="Canalisation principale"/>
    <alias index="15" field="profgen" name="Profondeur moyenne de la génératrice supérieure"/>
    <alias index="16" field="andebpose" name="Année de début de pose"/>
    <alias index="17" field="longcana" name="Longueur mesurée [m]"/>
    <alias index="18" field="_longcana_cm" name="Longueur projetée calculée [m]"/>
    <alias index="19" field="_longcana_reelle" name="Longueur réelle calculée [m]"/>
    <alias index="20" field="nbranche" name="Nombre de branchements"/>
    <alias index="21" field="qualglocxy" name="Qualité de la géolocalisation XY"/>
    <alias index="22" field="qualglocz" name="Qualité de la géolocalisation Z"/>
    <alias index="23" field="datemaj" name="Date de mise à jour"/>
    <alias index="24" field="sourmaj" name="Source de la mise à jour"/>
    <alias index="25" field="qualannee" name="Qualité de l’année de pose"/>
    <alias index="26" field="dategeoloc" name="Date de la géolocalisation"/>
    <alias index="27" field="sourgeoloc" name="Auteur de la géolocalisation"/>
    <alias index="28" field="sourattrib" name="Auteur des données attributaires"/>
    <alias index="29" field="_observation" name="Observation"/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default field="id" expression="" applyOnUpdate="0"/>
    <default field="idcana" expression="" applyOnUpdate="0"/>
    <default field="mouvrage" expression="" applyOnUpdate="0"/>
    <default field="gexploit" expression="" applyOnUpdate="0"/>
    <default field="enservice" expression="" applyOnUpdate="0"/>
    <default field="branchemnt" expression="" applyOnUpdate="0"/>
    <default field="materiau" expression="" applyOnUpdate="0"/>
    <default field="diametre" expression="" applyOnUpdate="0"/>
    <default field="anfinpose" expression="year(now())" applyOnUpdate="0"/>
    <default field="modecirc" expression="" applyOnUpdate="0"/>
    <default field="contcanaep" expression="" applyOnUpdate="0"/>
    <default field="fonccanaep" expression="" applyOnUpdate="0"/>
    <default field="idnini" expression="" applyOnUpdate="0"/>
    <default field="idnterm" expression="" applyOnUpdate="0"/>
    <default field="idcanppale" expression="" applyOnUpdate="0"/>
    <default field="profgen" expression="" applyOnUpdate="0"/>
    <default field="andebpose" expression="" applyOnUpdate="0"/>
    <default field="longcana" expression="" applyOnUpdate="0"/>
    <default field="_longcana_cm" expression="" applyOnUpdate="0"/>
    <default field="_longcana_reelle" expression="" applyOnUpdate="0"/>
    <default field="nbranche" expression="" applyOnUpdate="0"/>
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
    <constraint unique_strength="1" field="idcana" notnull_strength="1" exp_strength="0" constraints="3"/>
    <constraint unique_strength="0" field="mouvrage" notnull_strength="1" exp_strength="0" constraints="1"/>
    <constraint unique_strength="0" field="gexploit" notnull_strength="1" exp_strength="0" constraints="1"/>
    <constraint unique_strength="0" field="enservice" notnull_strength="1" exp_strength="0" constraints="1"/>
    <constraint unique_strength="0" field="branchemnt" notnull_strength="1" exp_strength="0" constraints="1"/>
    <constraint unique_strength="0" field="materiau" notnull_strength="1" exp_strength="0" constraints="1"/>
    <constraint unique_strength="0" field="diametre" notnull_strength="1" exp_strength="0" constraints="1"/>
    <constraint unique_strength="0" field="anfinpose" notnull_strength="1" exp_strength="0" constraints="1"/>
    <constraint unique_strength="0" field="modecirc" notnull_strength="1" exp_strength="0" constraints="1"/>
    <constraint unique_strength="0" field="contcanaep" notnull_strength="1" exp_strength="0" constraints="1"/>
    <constraint unique_strength="0" field="fonccanaep" notnull_strength="1" exp_strength="0" constraints="1"/>
    <constraint unique_strength="0" field="idnini" notnull_strength="2" exp_strength="0" constraints="1"/>
    <constraint unique_strength="0" field="idnterm" notnull_strength="2" exp_strength="0" constraints="1"/>
    <constraint unique_strength="0" field="idcanppale" notnull_strength="0" exp_strength="0" constraints="0"/>
    <constraint unique_strength="0" field="profgen" notnull_strength="0" exp_strength="0" constraints="0"/>
    <constraint unique_strength="0" field="andebpose" notnull_strength="0" exp_strength="0" constraints="0"/>
    <constraint unique_strength="0" field="longcana" notnull_strength="0" exp_strength="0" constraints="0"/>
    <constraint unique_strength="0" field="_longcana_cm" notnull_strength="0" exp_strength="0" constraints="0"/>
    <constraint unique_strength="0" field="_longcana_reelle" notnull_strength="0" exp_strength="0" constraints="0"/>
    <constraint unique_strength="0" field="nbranche" notnull_strength="0" exp_strength="0" constraints="0"/>
    <constraint unique_strength="0" field="qualglocxy" notnull_strength="1" exp_strength="0" constraints="1"/>
    <constraint unique_strength="0" field="qualglocz" notnull_strength="1" exp_strength="0" constraints="1"/>
    <constraint unique_strength="0" field="datemaj" notnull_strength="2" exp_strength="0" constraints="1"/>
    <constraint unique_strength="0" field="sourmaj" notnull_strength="1" exp_strength="0" constraints="1"/>
    <constraint unique_strength="0" field="qualannee" notnull_strength="0" exp_strength="0" constraints="0"/>
    <constraint unique_strength="0" field="dategeoloc" notnull_strength="0" exp_strength="0" constraints="0"/>
    <constraint unique_strength="0" field="sourgeoloc" notnull_strength="0" exp_strength="0" constraints="0"/>
    <constraint unique_strength="0" field="sourattrib" notnull_strength="0" exp_strength="0" constraints="0"/>
    <constraint unique_strength="0" field="_observation" notnull_strength="0" exp_strength="0" constraints="0"/>
  </constraints>
  <constraintExpressions>
    <constraint field="id" exp="" desc=""/>
    <constraint field="idcana" exp="" desc=""/>
    <constraint field="mouvrage" exp="" desc=""/>
    <constraint field="gexploit" exp="" desc=""/>
    <constraint field="enservice" exp="" desc=""/>
    <constraint field="branchemnt" exp="" desc=""/>
    <constraint field="materiau" exp="" desc=""/>
    <constraint field="diametre" exp="" desc=""/>
    <constraint field="anfinpose" exp="" desc=""/>
    <constraint field="modecirc" exp="" desc=""/>
    <constraint field="contcanaep" exp="" desc=""/>
    <constraint field="fonccanaep" exp="" desc=""/>
    <constraint field="idnini" exp="" desc=""/>
    <constraint field="idnterm" exp="" desc=""/>
    <constraint field="idcanppale" exp="" desc=""/>
    <constraint field="profgen" exp="" desc=""/>
    <constraint field="andebpose" exp="" desc=""/>
    <constraint field="longcana" exp="" desc=""/>
    <constraint field="_longcana_cm" exp="" desc=""/>
    <constraint field="_longcana_reelle" exp="" desc=""/>
    <constraint field="nbranche" exp="" desc=""/>
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
    <actionsetting action="from qgis.utils import plugins&#xa;plugins['raepa'].run_action(&#xa;    'inverser_canalisation',&#xa;    '[% id %]',&#xa;    '[% @layer_id %]'&#xa;)" capture="0" isEnabledOnlyWhenEditable="0" type="1" id="{8993dd12-4115-4d86-9ccb-34f957ee6bae}" name="Inverser la canalisation" shortTitle="Inverser la canalisation" icon="" notificationMessage="">
      <actionScope id="Feature"/>
      <actionScope id="Field"/>
    </actionsetting>
    <actionsetting action="from qgis.utils import plugins&#xa;plugins['raepa'].run_action(&#xa;    'parcourir_reseau_depuis_cet_objet',&#xa;    '[% idcana %]',&#xa;    0&#xa;)" capture="0" isEnabledOnlyWhenEditable="0" type="1" id="{b61897ab-51c5-4ab3-aaec-3bb0a5ccb0d0}" name="Parcourir le réseau depuis cet objet" shortTitle="" icon="" notificationMessage="">
      <actionScope id="Feature"/>
      <actionScope id="Field"/>
      <actionScope id="Canvas"/>
    </actionsetting>
    <actionsetting action="from qgis.utils import plugins&#xa;plugins['raepa'].run_action(&#xa;    'network_to_vanne',&#xa;    '[% idcana %]'&#xa;)" capture="0" isEnabledOnlyWhenEditable="0" type="1" id="{b130bd7a-a24f-481c-a3d5-876d47d006e1}" name="Parcourir le sous réseau jusqu'à une vanne" shortTitle="Parcours réseau vanne" icon="" notificationMessage="">
      <actionScope id="Feature"/>
      <actionScope id="Field"/>
      <actionScope id="Canvas"/>
    </actionsetting>
  </attributeactions>
  <attributetableconfig sortOrder="0" actionWidgetStyle="dropDown" sortExpression="">
    <columns>
      <column width="-1" type="field" name="id" hidden="0"/>
      <column width="-1" type="field" name="idcana" hidden="0"/>
      <column width="-1" type="field" name="mouvrage" hidden="0"/>
      <column width="-1" type="field" name="gexploit" hidden="0"/>
      <column width="-1" type="field" name="enservice" hidden="0"/>
      <column width="-1" type="field" name="branchemnt" hidden="0"/>
      <column width="-1" type="field" name="materiau" hidden="0"/>
      <column width="123" type="field" name="diametre" hidden="0"/>
      <column width="-1" type="field" name="anfinpose" hidden="0"/>
      <column width="-1" type="field" name="modecirc" hidden="0"/>
      <column width="-1" type="field" name="contcanaep" hidden="0"/>
      <column width="-1" type="field" name="fonccanaep" hidden="0"/>
      <column width="-1" type="field" name="idnini" hidden="0"/>
      <column width="-1" type="field" name="idnterm" hidden="0"/>
      <column width="-1" type="field" name="idcanppale" hidden="0"/>
      <column width="-1" type="field" name="profgen" hidden="0"/>
      <column width="-1" type="field" name="andebpose" hidden="0"/>
      <column width="-1" type="field" name="longcana" hidden="0"/>
      <column width="-1" type="field" name="_longcana_cm" hidden="0"/>
      <column width="-1" type="field" name="_longcana_reelle" hidden="0"/>
      <column width="-1" type="field" name="nbranche" hidden="0"/>
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
  <editforminit/>
  <editforminitcodesource>0</editforminitcodesource>
  <editforminitfilepath>/../.local/share/QGIS/.local/share/QGIS/QGIS3/profiles/default/3liz/Reapa</editforminitfilepath>
  <editforminitcode><![CDATA[# -*- coding: utf-8 -*-
"""
QGIS forms can have a Python function that is called when the form is
opened.

Use this function to add extra logic to your forms.

Enter the name of the function in the "Python Init function"
field.
An example follows:
"""
from PyQt4.QtGui import QWidget

def my_form_open(dialog, layer, feature):
  geom = feature.geometry()
  control = dialog.findChild(QWidget, "MyLineEdit")
]]></editforminitcode>
  <featformsuppress>0</featformsuppress>
  <editorlayout>tablayout</editorlayout>
  <attributeEditorForm>
    <attributeEditorContainer groupBox="0" visibilityExpressionEnabled="0" showLabel="1" name="Canalisation d'assainissement" columnCount="1" visibilityExpression="">
      <attributeEditorContainer groupBox="1" visibilityExpressionEnabled="0" showLabel="1" name="Général" columnCount="1" visibilityExpression="">
        <attributeEditorField index="0" showLabel="1" name="id"/>
        <attributeEditorField index="1" showLabel="1" name="idcana"/>
        <attributeEditorField index="-1" showLabel="1" name="typreseau"/>
        <attributeEditorField index="10" showLabel="1" name="contcanaep"/>
        <attributeEditorField index="11" showLabel="1" name="fonccanaep"/>
        <attributeEditorField index="9" showLabel="1" name="modecirc"/>
        <attributeEditorField index="6" showLabel="1" name="materiau"/>
        <attributeEditorField index="5" showLabel="1" name="branchemnt"/>
        <attributeEditorField index="20" showLabel="1" name="nbranche"/>
        <attributeEditorField index="29" showLabel="1" name="_observation"/>
      </attributeEditorContainer>
      <attributeEditorContainer groupBox="1" visibilityExpressionEnabled="0" showLabel="1" name="Technique" columnCount="1" visibilityExpression="">
        <attributeEditorField index="17" showLabel="1" name="longcana"/>
        <attributeEditorField index="18" showLabel="1" name="_longcana_cm"/>
        <attributeEditorField index="19" showLabel="1" name="_longcana_reelle"/>
        <attributeEditorField index="7" showLabel="1" name="diametre"/>
        <attributeEditorField index="-1" showLabel="1" name="sensecoul"/>
      </attributeEditorContainer>
      <attributeEditorContainer groupBox="1" visibilityExpressionEnabled="0" showLabel="1" name="Relations" columnCount="1" visibilityExpression="">
        <attributeEditorField index="-1" showLabel="1" name="zamont"/>
        <attributeEditorField index="-1" showLabel="1" name="zaval"/>
        <attributeEditorField index="12" showLabel="1" name="idnini"/>
        <attributeEditorField index="13" showLabel="1" name="idnterm"/>
        <attributeEditorField index="14" showLabel="1" name="idcanppale"/>
      </attributeEditorContainer>
      <attributeEditorContainer groupBox="1" visibilityExpressionEnabled="0" showLabel="1" name="Historique" columnCount="1" visibilityExpression="">
        <attributeEditorField index="2" showLabel="1" name="mouvrage"/>
        <attributeEditorField index="3" showLabel="1" name="gexploit"/>
        <attributeEditorField index="8" showLabel="1" name="anfinpose"/>
        <attributeEditorField index="16" showLabel="1" name="andebpose"/>
      </attributeEditorContainer>
      <attributeEditorContainer groupBox="1" visibilityExpressionEnabled="0" showLabel="1" name="Métadonnées" columnCount="1" visibilityExpression="">
        <attributeEditorField index="21" showLabel="1" name="qualglocxy"/>
        <attributeEditorField index="22" showLabel="1" name="qualglocz"/>
        <attributeEditorField index="23" showLabel="1" name="datemaj"/>
        <attributeEditorField index="24" showLabel="1" name="sourmaj"/>
        <attributeEditorField index="25" showLabel="1" name="qualannee"/>
        <attributeEditorField index="26" showLabel="1" name="dategeoloc"/>
        <attributeEditorField index="27" showLabel="1" name="sourgeoloc"/>
        <attributeEditorField index="28" showLabel="1" name="sourattrib"/>
      </attributeEditorContainer>
    </attributeEditorContainer>
  </attributeEditorForm>
  <editable>
    <field editable="1" name="_code_chantier"/>
    <field editable="1" name="_date_import"/>
    <field editable="1" name="_dimensionhorizontale"/>
    <field editable="1" name="_etat"/>
    <field editable="1" name="_forme"/>
    <field editable="1" name="_longcana_cm"/>
    <field editable="1" name="_longcana_reelle"/>
    <field editable="1" name="_observation"/>
    <field editable="1" name="_pente"/>
    <field editable="1" name="_precisionannee"/>
    <field editable="1" name="_source_historique"/>
    <field editable="1" name="_temp_data"/>
    <field editable="1" name="andebpose"/>
    <field editable="1" name="anfinpose"/>
    <field editable="1" name="branchemnt"/>
    <field editable="1" name="contcanaep"/>
    <field editable="1" name="contcanass"/>
    <field editable="1" name="dategeoloc"/>
    <field editable="1" name="datemaj"/>
    <field editable="1" name="diametre"/>
    <field editable="1" name="enservice"/>
    <field editable="1" name="fonccanaep"/>
    <field editable="1" name="fonccanass"/>
    <field editable="1" name="gexploit"/>
    <field editable="0" name="id"/>
    <field editable="0" name="idcana"/>
    <field editable="1" name="idcanppale"/>
    <field editable="1" name="idnini"/>
    <field editable="1" name="idnterm"/>
    <field editable="1" name="longcana"/>
    <field editable="1" name="materiau"/>
    <field editable="1" name="modecirc"/>
    <field editable="1" name="mouvrage"/>
    <field editable="1" name="nbranche"/>
    <field editable="1" name="profgen"/>
    <field editable="1" name="qualannee"/>
    <field editable="1" name="qualglocxy"/>
    <field editable="1" name="qualglocz"/>
    <field editable="1" name="sensecoul"/>
    <field editable="1" name="sourattrib"/>
    <field editable="1" name="sourgeoloc"/>
    <field editable="1" name="sourmaj"/>
    <field editable="1" name="typreseau"/>
    <field editable="0" name="val_raepa_cat_canal_ass_libelle"/>
    <field editable="0" name="val_raepa_fonc_canal_ass_libelle"/>
    <field editable="0" name="val_raepa_materiau_libelle"/>
    <field editable="0" name="val_raepa_mode_circulation_libelle"/>
    <field editable="0" name="val_raepa_qualite_geoloc_libelle"/>
    <field editable="1" name="zamont"/>
    <field editable="1" name="zaval"/>
  </editable>
  <labelOnTop>
    <field labelOnTop="0" name="_code_chantier"/>
    <field labelOnTop="0" name="_date_import"/>
    <field labelOnTop="0" name="_dimensionhorizontale"/>
    <field labelOnTop="0" name="_etat"/>
    <field labelOnTop="0" name="_forme"/>
    <field labelOnTop="0" name="_longcana_cm"/>
    <field labelOnTop="0" name="_longcana_reelle"/>
    <field labelOnTop="0" name="_observation"/>
    <field labelOnTop="0" name="_pente"/>
    <field labelOnTop="0" name="_precisionannee"/>
    <field labelOnTop="0" name="_source_historique"/>
    <field labelOnTop="0" name="_temp_data"/>
    <field labelOnTop="0" name="andebpose"/>
    <field labelOnTop="0" name="anfinpose"/>
    <field labelOnTop="0" name="branchemnt"/>
    <field labelOnTop="0" name="contcanaep"/>
    <field labelOnTop="0" name="contcanass"/>
    <field labelOnTop="0" name="dategeoloc"/>
    <field labelOnTop="0" name="datemaj"/>
    <field labelOnTop="0" name="diametre"/>
    <field labelOnTop="0" name="enservice"/>
    <field labelOnTop="0" name="fonccanaep"/>
    <field labelOnTop="0" name="fonccanass"/>
    <field labelOnTop="0" name="gexploit"/>
    <field labelOnTop="0" name="id"/>
    <field labelOnTop="0" name="idcana"/>
    <field labelOnTop="0" name="idcanppale"/>
    <field labelOnTop="0" name="idnini"/>
    <field labelOnTop="0" name="idnterm"/>
    <field labelOnTop="0" name="longcana"/>
    <field labelOnTop="0" name="materiau"/>
    <field labelOnTop="0" name="modecirc"/>
    <field labelOnTop="0" name="mouvrage"/>
    <field labelOnTop="0" name="nbranche"/>
    <field labelOnTop="0" name="profgen"/>
    <field labelOnTop="0" name="qualannee"/>
    <field labelOnTop="0" name="qualglocxy"/>
    <field labelOnTop="0" name="qualglocz"/>
    <field labelOnTop="0" name="sensecoul"/>
    <field labelOnTop="0" name="sourattrib"/>
    <field labelOnTop="0" name="sourgeoloc"/>
    <field labelOnTop="0" name="sourmaj"/>
    <field labelOnTop="0" name="typreseau"/>
    <field labelOnTop="0" name="val_raepa_cat_canal_ass_libelle"/>
    <field labelOnTop="0" name="val_raepa_fonc_canal_ass_libelle"/>
    <field labelOnTop="0" name="val_raepa_materiau_libelle"/>
    <field labelOnTop="0" name="val_raepa_mode_circulation_libelle"/>
    <field labelOnTop="0" name="val_raepa_qualite_geoloc_libelle"/>
    <field labelOnTop="0" name="zamont"/>
    <field labelOnTop="0" name="zaval"/>
  </labelOnTop>
  <widgets>
    <widget name="od_file20160921105557083_object_vw_qgep_reach_ws_obj_id">
      <config/>
    </widget>
    <widget name="re_maintenance_wasterwaterstructure_reach">
      <config/>
    </widget>
  </widgets>
  <previewExpression>id</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>1</layerGeometryType>
</qgis>
