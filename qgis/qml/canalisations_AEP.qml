<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis maxScale="1" simplifyLocal="1" minScale="50001" simplifyMaxScale="1" version="3.4.14-Madeira" simplifyDrawingHints="1" styleCategories="AllStyleCategories" labelsEnabled="1" simplifyDrawingTol="1" hasScaleBasedVisibilityFlag="0" simplifyAlgorithm="0" readOnly="0">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 forceraster="0" symbollevels="0" enableorderby="0" type="RuleRenderer">
    <rules key="{b3f3f0a1-c8d2-4416-8d68-3de95a17bc02}">
      <rule label="Canalisation, échelle &lt;= 2000" scalemaxdenom="2001" key="{9e580459-8bfa-4f04-be8f-68986341bd8e}" symbol="0" scalemindenom="1"/>
      <rule label="Canalisation, échelle > 2000" scalemaxdenom="500000" key="{d0a8418c-2231-46eb-abe3-d840c2c67437}" symbol="1" scalemindenom="2001"/>
    </rules>
    <symbols>
      <symbol alpha="1" clip_to_extent="1" force_rhr="0" name="0" type="line">
        <layer enabled="1" class="SimpleLine" pass="0" locked="0">
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
                  <Option name="active" type="bool" value="true"/>
                  <Option name="expression" type="QString" value="CASE &#xa;&#x9;WHEN &quot;contcanaep&quot; IN ('00') THEN '161,161,161,255'&#xa;&#x9;WHEN &quot;contcanaep&quot; IN ('01') THEN '40,53,131,255' &#xa;&#x9;WHEN &quot;contcanaep&quot; IN ('02') THEN '48,140,198,255' &#xa;&#x9;ELSE '161,161,161,255'&#xa;END"/>
                  <Option name="type" type="int" value="3"/>
                </Option>
                <Option name="outlineWidth" type="Map">
                  <Option name="active" type="bool" value="true"/>
                  <Option name="expression" type="QString" value="toreal(&quot;diametre&quot; ) / 1000"/>
                  <Option name="type" type="int" value="3"/>
                </Option>
              </Option>
              <Option name="type" type="QString" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer enabled="1" class="SimpleLine" pass="0" locked="0">
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
                <Option name="offset" type="Map">
                  <Option name="active" type="bool" value="true"/>
                  <Option name="expression" type="QString" value="toreal( &quot;diametre&quot; ) / 2000"/>
                  <Option name="type" type="int" value="3"/>
                </Option>
                <Option name="outlineColor" type="Map">
                  <Option name="active" type="bool" value="true"/>
                  <Option name="expression" type="QString" value="CASE &#xa;&#x9;WHEN &quot;contcanaep&quot; IN ('00') THEN '161,161,161,255'&#xa;&#x9;WHEN &quot;contcanaep&quot; IN ('01') THEN '40,53,131,255' &#xa;&#x9;WHEN &quot;contcanaep&quot; IN ('02') THEN '48,140,198,255' &#xa;&#x9;ELSE '161,161,161,255'&#xa;END"/>
                  <Option name="type" type="int" value="3"/>
                </Option>
              </Option>
              <Option name="type" type="QString" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
        <layer enabled="1" class="SimpleLine" pass="0" locked="0">
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
                <Option name="offset" type="Map">
                  <Option name="active" type="bool" value="true"/>
                  <Option name="expression" type="QString" value="toreal(&quot;diametre&quot; ) / - 2000"/>
                  <Option name="type" type="int" value="3"/>
                </Option>
                <Option name="outlineColor" type="Map">
                  <Option name="active" type="bool" value="true"/>
                  <Option name="expression" type="QString" value="CASE &#xa;&#x9;WHEN &quot;contcanaep&quot; IN ('00') THEN '161,161,161,255'&#xa;&#x9;WHEN &quot;contcanaep&quot; IN ('01') THEN '40,53,131,255' &#xa;&#x9;WHEN &quot;contcanaep&quot; IN ('02') THEN '48,140,198,255' &#xa;&#x9;ELSE '161,161,161,255'&#xa;END"/>
                  <Option name="type" type="int" value="3"/>
                </Option>
              </Option>
              <Option name="type" type="QString" value="collection"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" clip_to_extent="1" force_rhr="0" name="1" type="line">
        <layer enabled="1" class="SimpleLine" pass="0" locked="0">
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
                  <Option name="active" type="bool" value="true"/>
                  <Option name="expression" type="QString" value="CASE &#xa;&#x9;WHEN &quot;contcanaep&quot; IN ('00') THEN '161,161,161,255'&#xa;&#x9;WHEN &quot;contcanaep&quot; IN ('01') THEN '40,53,131,255' &#xa;&#x9;WHEN &quot;contcanaep&quot; IN ('02') THEN '48,140,198,255' &#xa;&#x9;ELSE '161,161,161,255'&#xa;END"/>
                  <Option name="type" type="int" value="3"/>
                </Option>
              </Option>
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
  <labeling type="simple">
    <settings>
      <text-style fontSizeUnit="Point" multilineHeight="1" textOpacity="1" blendMode="0" isExpression="1" fontWeight="50" fontSizeMapUnitScale="3x:0,0,0,0,0,0" fontFamily="Ubuntu" fontItalic="0" fontUnderline="0" namedStyle="Regular" fieldName="CONCAT(&#xa;&#x9;CASE &#xa;&#x9;WHEN &quot;contcanaep&quot; = '00' THEN 'IN'&#xa;&#x9;WHEN &quot;contcanaep&quot; = '01' THEN 'EB'&#xa;&#x9;WHEN &quot;contcanaep&quot; = '02' THEN 'EP'&#xa;&#x9;WHEN &quot;contcanaep&quot; = '99' THEN 'AU'&#xa;&#x9;ELSE 'IN' END,&#xa;&#x9;' ' ,&#xa;&#x9;COALESCE(&quot;diametre&quot;||' ', ''), 'mm',&#xa;&#x9;'@' || &quot;_longcana_cm&quot;|| 'm' &#xa;)" fontLetterSpacing="0" fontCapitals="0" previewBkgrdColor="#ffffff" useSubstitutions="0" fontWordSpacing="0" fontStrikeout="0" textColor="0,0,0,255" fontSize="8">
        <text-buffer bufferJoinStyle="64" bufferOpacity="1" bufferSizeUnits="MM" bufferNoFill="0" bufferColor="255,255,255,255" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferBlendMode="0" bufferSize="1" bufferDraw="1"/>
        <background shapeDraw="0" shapeType="0" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeBorderColor="128,128,128,255" shapeSizeType="0" shapeFillColor="255,255,255,255" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiUnit="MM" shapeRotationType="0" shapeJoinStyle="64" shapeSizeX="0" shapeBorderWidthUnit="MM" shapeSizeY="0" shapeRotation="0" shapeRadiiX="0" shapeOffsetX="0" shapeSVGFile="" shapeOffsetUnit="MM" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeBlendMode="0" shapeSizeUnit="MM" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiY="0" shapeOffsetY="0" shapeBorderWidth="0" shapeOpacity="1"/>
        <shadow shadowColor="0,0,0,255" shadowDraw="0" shadowRadius="1.5" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowScale="100" shadowOffsetAngle="135" shadowRadiusUnit="MM" shadowOffsetDist="1" shadowOffsetUnit="MM" shadowRadiusAlphaOnly="0" shadowBlendMode="6" shadowUnder="0" shadowOffsetGlobal="1" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowOpacity="0.7"/>
        <substitutions/>
      </text-style>
      <text-format formatNumbers="0" multilineAlign="1" addDirectionSymbol="1" autoWrapLength="0" decimals="3" leftDirectionSymbol="&lt;  " rightDirectionSymbol="  >" reverseDirectionSymbol="0" placeDirectionSymbol="0" plussign="0" useMaxLineLengthForAutoWrap="1" wrapChar="@"/>
      <placement yOffset="0" xOffset="0" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" maxCurvedCharAngleIn="20" priority="5" quadOffset="4" offsetUnits="MapUnit" maxCurvedCharAngleOut="-20" dist="0.3" rotationAngle="0" fitInPolygonOnly="0" repeatDistanceUnits="MM" placementFlags="10" centroidWhole="0" repeatDistance="0" distUnits="MapUnit" offsetType="0" centroidInside="0" distMapUnitScale="3x:0,0,0,0,0,0" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" placement="2" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" preserveRotation="1"/>
      <rendering maxNumLabels="2000" labelPerPart="0" scaleVisibility="1" scaleMax="2001" scaleMin="1" fontMinPixelSize="3" drawLabels="1" fontLimitPixelSize="0" mergeLines="0" obstacleFactor="1" displayAll="0" minFeatureSize="12" fontMaxPixelSize="10000" obstacle="1" obstacleType="0" limitNumLabels="0" upsidedownLabels="0" zIndex="0"/>
      <dd_properties>
        <Option type="Map">
          <Option name="name" type="QString" value=""/>
          <Option name="properties" type="Map">
            <Option name="Color" type="Map">
              <Option name="active" type="bool" value="true"/>
              <Option name="expression" type="QString" value="CASE &#xa;&#x9;WHEN &quot;contcanaep&quot; IN ('00') THEN '161,161,161,255'&#xa;&#x9;WHEN &quot;contcanaep&quot; IN ('01') THEN '40,53,131,255' &#xa;&#x9;WHEN &quot;contcanaep&quot; IN ('02') THEN '48,140,198,255' &#xa;&#x9;ELSE '161,161,161,255'&#xa;END"/>
              <Option name="type" type="int" value="3"/>
            </Option>
            <Option name="LabelDistance" type="Map">
              <Option name="active" type="bool" value="true"/>
              <Option name="expression" type="QString" value="COALESCE(&quot;diametre&quot;, 0) / 2000.0 + 0.1"/>
              <Option name="type" type="int" value="3"/>
            </Option>
          </Option>
          <Option name="type" type="QString" value="collection"/>
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
    <DiagramCategory sizeScale="3x:0,0,0,0,0,0" rotationOffset="270" sizeType="MM" labelPlacementMethod="XHeight" backgroundColor="#ffffff" width="15" lineSizeScale="3x:0,0,0,0,0,0" penAlpha="255" penWidth="0" backgroundAlpha="255" scaleDependency="Area" minimumSize="0" enabled="0" diagramOrientation="Up" maxScaleDenominator="50001" barWidth="5" penColor="#000000" scaleBasedVisibility="0" lineSizeType="MM" opacity="1" height="15" minScaleDenominator="1">
      <fontProperties style="" description="Ubuntu,11,-1,5,50,0,0,0,0,0"/>
      <attribute label="" field="" color="#000000"/>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings showAll="1" dist="0" placement="2" priority="0" zIndex="0" linePlacementFlags="18" obstacle="0">
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
    <field name="idcana">
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
    <field name="enservice">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option name="CheckedState" type="QString" value="1"/>
            <Option name="UncheckedState" type="QString" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="branchemnt">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option name="CheckedState" type="QString" value="1"/>
            <Option name="UncheckedState" type="QString" value="0"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="materiau">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option name="AllowMulti" type="bool" value="false"/>
            <Option name="AllowNull" type="bool" value="true"/>
            <Option name="FilterExpression" type="QString" value=""/>
            <Option name="Key" type="QString" value="code"/>
            <Option name="Layer" type="QString" value="val_raepa_materiau201910091036565381184808403"/>
            <Option name="NofColumns" type="int" value="1"/>
            <Option name="OrderByValue" type="bool" value="true"/>
            <Option name="UseCompleter" type="bool" value="false"/>
            <Option name="Value" type="QString" value="libelle"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="diametre">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" type="bool" value="false"/>
            <Option name="UseHtml" type="bool" value="false"/>
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
    <field name="modecirc">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option name="AllowMulti" type="bool" value="false"/>
            <Option name="AllowNull" type="bool" value="true"/>
            <Option name="FilterExpression" type="QString" value=""/>
            <Option name="Key" type="QString" value="code"/>
            <Option name="Layer" type="QString" value="val_raepa_mode_circulation20191009103656538101934309"/>
            <Option name="NofColumns" type="int" value="1"/>
            <Option name="OrderByValue" type="bool" value="true"/>
            <Option name="UseCompleter" type="bool" value="false"/>
            <Option name="Value" type="QString" value="libelle"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="contcanaep">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option name="AllowMulti" type="bool" value="false"/>
            <Option name="AllowNull" type="bool" value="true"/>
            <Option name="FilterExpression" type="QString" value=""/>
            <Option name="Key" type="QString" value="code"/>
            <Option name="Layer" type="QString" value="val_raepa_fonc_canal_ae201910091036565371961455885"/>
            <Option name="NofColumns" type="int" value="1"/>
            <Option name="OrderByValue" type="bool" value="true"/>
            <Option name="UseCompleter" type="bool" value="false"/>
            <Option name="Value" type="QString" value="libelle"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fonccanaep">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option name="AllowMulti" type="bool" value="false"/>
            <Option name="AllowNull" type="bool" value="true"/>
            <Option name="FilterExpression" type="QString" value=""/>
            <Option name="Key" type="QString" value="code"/>
            <Option name="Layer" type="QString" value="val_raepa_fonc_canal_ae201910091036565371961455885"/>
            <Option name="NofColumns" type="int" value="1"/>
            <Option name="OrderByValue" type="bool" value="true"/>
            <Option name="UseCompleter" type="bool" value="false"/>
            <Option name="Value" type="QString" value="libelle"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="idnini">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" type="bool" value="false"/>
            <Option name="UseHtml" type="bool" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="idnterm">
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
    <field name="profgen">
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
    <field name="longcana">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" type="bool" value="false"/>
            <Option name="UseHtml" type="bool" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="_longcana_cm">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" type="bool" value="false"/>
            <Option name="UseHtml" type="bool" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="_longcana_reelle">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" type="bool" value="false"/>
            <Option name="UseHtml" type="bool" value="false"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="nbranche">
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
    <default applyOnUpdate="0" expression="" field="id"/>
    <default applyOnUpdate="0" expression="'INCONNU'" field="idcana"/>
    <default applyOnUpdate="0" expression="" field="mouvrage"/>
    <default applyOnUpdate="0" expression="" field="gexploit"/>
    <default applyOnUpdate="0" expression="" field="enservice"/>
    <default applyOnUpdate="0" expression="" field="branchemnt"/>
    <default applyOnUpdate="0" expression="" field="materiau"/>
    <default applyOnUpdate="0" expression="-1" field="diametre"/>
    <default applyOnUpdate="0" expression="year(now())" field="anfinpose"/>
    <default applyOnUpdate="0" expression="" field="modecirc"/>
    <default applyOnUpdate="0" expression="" field="contcanaep"/>
    <default applyOnUpdate="0" expression="" field="fonccanaep"/>
    <default applyOnUpdate="0" expression="'INCONNU'" field="idnini"/>
    <default applyOnUpdate="0" expression="'INCONNU'" field="idnterm"/>
    <default applyOnUpdate="0" expression="'INCONNU'" field="idcanppale"/>
    <default applyOnUpdate="0" expression="" field="profgen"/>
    <default applyOnUpdate="0" expression="" field="andebpose"/>
    <default applyOnUpdate="0" expression="" field="longcana"/>
    <default applyOnUpdate="0" expression="" field="_longcana_cm"/>
    <default applyOnUpdate="0" expression="" field="_longcana_reelle"/>
    <default applyOnUpdate="0" expression="" field="nbranche"/>
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
    <constraint unique_strength="1" notnull_strength="1" constraints="3" exp_strength="0" field="idcana"/>
    <constraint unique_strength="0" notnull_strength="1" constraints="1" exp_strength="0" field="mouvrage"/>
    <constraint unique_strength="0" notnull_strength="1" constraints="1" exp_strength="0" field="gexploit"/>
    <constraint unique_strength="0" notnull_strength="1" constraints="1" exp_strength="0" field="enservice"/>
    <constraint unique_strength="0" notnull_strength="1" constraints="1" exp_strength="0" field="branchemnt"/>
    <constraint unique_strength="0" notnull_strength="1" constraints="1" exp_strength="0" field="materiau"/>
    <constraint unique_strength="0" notnull_strength="1" constraints="1" exp_strength="0" field="diametre"/>
    <constraint unique_strength="0" notnull_strength="1" constraints="1" exp_strength="0" field="anfinpose"/>
    <constraint unique_strength="0" notnull_strength="1" constraints="1" exp_strength="0" field="modecirc"/>
    <constraint unique_strength="0" notnull_strength="1" constraints="1" exp_strength="0" field="contcanaep"/>
    <constraint unique_strength="0" notnull_strength="1" constraints="1" exp_strength="0" field="fonccanaep"/>
    <constraint unique_strength="0" notnull_strength="2" constraints="1" exp_strength="0" field="idnini"/>
    <constraint unique_strength="0" notnull_strength="2" constraints="1" exp_strength="0" field="idnterm"/>
    <constraint unique_strength="0" notnull_strength="0" constraints="0" exp_strength="0" field="idcanppale"/>
    <constraint unique_strength="0" notnull_strength="0" constraints="0" exp_strength="0" field="profgen"/>
    <constraint unique_strength="0" notnull_strength="0" constraints="0" exp_strength="0" field="andebpose"/>
    <constraint unique_strength="0" notnull_strength="0" constraints="0" exp_strength="0" field="longcana"/>
    <constraint unique_strength="0" notnull_strength="0" constraints="0" exp_strength="0" field="_longcana_cm"/>
    <constraint unique_strength="0" notnull_strength="0" constraints="0" exp_strength="0" field="_longcana_reelle"/>
    <constraint unique_strength="0" notnull_strength="0" constraints="0" exp_strength="0" field="nbranche"/>
    <constraint unique_strength="0" notnull_strength="1" constraints="1" exp_strength="0" field="qualglocxy"/>
    <constraint unique_strength="0" notnull_strength="1" constraints="1" exp_strength="0" field="qualglocz"/>
    <constraint unique_strength="0" notnull_strength="2" constraints="1" exp_strength="0" field="datemaj"/>
    <constraint unique_strength="0" notnull_strength="1" constraints="1" exp_strength="0" field="sourmaj"/>
    <constraint unique_strength="0" notnull_strength="0" constraints="0" exp_strength="0" field="qualannee"/>
    <constraint unique_strength="0" notnull_strength="0" constraints="0" exp_strength="0" field="dategeoloc"/>
    <constraint unique_strength="0" notnull_strength="0" constraints="0" exp_strength="0" field="sourgeoloc"/>
    <constraint unique_strength="0" notnull_strength="0" constraints="0" exp_strength="0" field="sourattrib"/>
    <constraint unique_strength="0" notnull_strength="0" constraints="0" exp_strength="0" field="_observation"/>
  </constraints>
  <constraintExpressions>
    <constraint desc="" exp="" field="id"/>
    <constraint desc="" exp="" field="idcana"/>
    <constraint desc="" exp="" field="mouvrage"/>
    <constraint desc="" exp="" field="gexploit"/>
    <constraint desc="" exp="" field="enservice"/>
    <constraint desc="" exp="" field="branchemnt"/>
    <constraint desc="" exp="" field="materiau"/>
    <constraint desc="" exp="" field="diametre"/>
    <constraint desc="" exp="" field="anfinpose"/>
    <constraint desc="" exp="" field="modecirc"/>
    <constraint desc="" exp="" field="contcanaep"/>
    <constraint desc="" exp="" field="fonccanaep"/>
    <constraint desc="" exp="" field="idnini"/>
    <constraint desc="" exp="" field="idnterm"/>
    <constraint desc="" exp="" field="idcanppale"/>
    <constraint desc="" exp="" field="profgen"/>
    <constraint desc="" exp="" field="andebpose"/>
    <constraint desc="" exp="" field="longcana"/>
    <constraint desc="" exp="" field="_longcana_cm"/>
    <constraint desc="" exp="" field="_longcana_reelle"/>
    <constraint desc="" exp="" field="nbranche"/>
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
    <actionsetting notificationMessage="" isEnabledOnlyWhenEditable="0" id="{f50540f8-a508-4967-a669-566d2126e2ab}" icon="" action="from qgis.utils import plugins&#xa;plugins['raepa'].run_action(&#xa;    'inverser_canalisation',&#xa;    '[% id %]',&#xa;    '[% @layer_id %]'&#xa;)" shortTitle="Inverser la canalisation" capture="0" name="Inverser la canalisation" type="1">
      <actionScope id="Field"/>
      <actionScope id="Feature"/>
    </actionsetting>
    <actionsetting notificationMessage="" isEnabledOnlyWhenEditable="0" id="{cd1c0793-3bff-4e15-b967-6c85383cb0b6}" icon="" action="from qgis.utils import plugins&#xa;plugins['raepa'].run_action(&#xa;    'parcourir_reseau_depuis_cet_objet',&#xa;    '[% idcana %]',&#xa;    0&#xa;)" shortTitle="" capture="0" name="Parcourir le réseau depuis cet objet" type="1">
      <actionScope id="Canvas"/>
      <actionScope id="Field"/>
      <actionScope id="Feature"/>
    </actionsetting>
    <actionsetting notificationMessage="" isEnabledOnlyWhenEditable="0" id="{3f4724e9-df45-4774-9389-51c765a1d0e3}" icon="" action="from qgis.utils import plugins&#xa;plugins['raepa'].run_action(&#xa;    'network_to_vanne',&#xa;    '[% idcana %]'&#xa;)" shortTitle="Parcours réseau vanne" capture="0" name="Parcourir le sous réseau jusqu'à une vanne" type="1">
      <actionScope id="Canvas"/>
      <actionScope id="Field"/>
      <actionScope id="Feature"/>
    </actionsetting>
  </attributeactions>
  <attributetableconfig actionWidgetStyle="dropDown" sortExpression="" sortOrder="0">
    <columns>
      <column width="-1" name="id" hidden="0" type="field"/>
      <column width="-1" name="idcana" hidden="0" type="field"/>
      <column width="-1" name="mouvrage" hidden="0" type="field"/>
      <column width="-1" name="gexploit" hidden="0" type="field"/>
      <column width="-1" name="enservice" hidden="0" type="field"/>
      <column width="-1" name="branchemnt" hidden="0" type="field"/>
      <column width="-1" name="materiau" hidden="0" type="field"/>
      <column width="123" name="diametre" hidden="0" type="field"/>
      <column width="-1" name="anfinpose" hidden="0" type="field"/>
      <column width="-1" name="modecirc" hidden="0" type="field"/>
      <column width="-1" name="contcanaep" hidden="0" type="field"/>
      <column width="-1" name="fonccanaep" hidden="0" type="field"/>
      <column width="-1" name="idnini" hidden="0" type="field"/>
      <column width="-1" name="idnterm" hidden="0" type="field"/>
      <column width="-1" name="idcanppale" hidden="0" type="field"/>
      <column width="-1" name="profgen" hidden="0" type="field"/>
      <column width="-1" name="andebpose" hidden="0" type="field"/>
      <column width="-1" name="longcana" hidden="0" type="field"/>
      <column width="-1" name="_longcana_cm" hidden="0" type="field"/>
      <column width="-1" name="_longcana_reelle" hidden="0" type="field"/>
      <column width="-1" name="nbranche" hidden="0" type="field"/>
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
    <attributeEditorContainer showLabel="1" visibilityExpression="" visibilityExpressionEnabled="0" columnCount="1" groupBox="0" name="Canalisation d'assainissement">
      <attributeEditorContainer showLabel="1" visibilityExpression="" visibilityExpressionEnabled="0" columnCount="1" groupBox="1" name="Général">
        <attributeEditorField showLabel="1" index="0" name="id"/>
        <attributeEditorField showLabel="1" index="1" name="idcana"/>
        <attributeEditorField showLabel="1" index="-1" name="typreseau"/>
        <attributeEditorField showLabel="1" index="10" name="contcanaep"/>
        <attributeEditorField showLabel="1" index="11" name="fonccanaep"/>
        <attributeEditorField showLabel="1" index="9" name="modecirc"/>
        <attributeEditorField showLabel="1" index="6" name="materiau"/>
        <attributeEditorField showLabel="1" index="5" name="branchemnt"/>
        <attributeEditorField showLabel="1" index="20" name="nbranche"/>
        <attributeEditorField showLabel="1" index="29" name="_observation"/>
      </attributeEditorContainer>
      <attributeEditorContainer showLabel="1" visibilityExpression="" visibilityExpressionEnabled="0" columnCount="1" groupBox="1" name="Technique">
        <attributeEditorField showLabel="1" index="17" name="longcana"/>
        <attributeEditorField showLabel="1" index="18" name="_longcana_cm"/>
        <attributeEditorField showLabel="1" index="19" name="_longcana_reelle"/>
        <attributeEditorField showLabel="1" index="7" name="diametre"/>
        <attributeEditorField showLabel="1" index="-1" name="sensecoul"/>
      </attributeEditorContainer>
      <attributeEditorContainer showLabel="1" visibilityExpression="" visibilityExpressionEnabled="0" columnCount="1" groupBox="1" name="Relations">
        <attributeEditorField showLabel="1" index="-1" name="zamont"/>
        <attributeEditorField showLabel="1" index="-1" name="zaval"/>
        <attributeEditorField showLabel="1" index="12" name="idnini"/>
        <attributeEditorField showLabel="1" index="13" name="idnterm"/>
        <attributeEditorField showLabel="1" index="14" name="idcanppale"/>
      </attributeEditorContainer>
      <attributeEditorContainer showLabel="1" visibilityExpression="" visibilityExpressionEnabled="0" columnCount="1" groupBox="1" name="Historique">
        <attributeEditorField showLabel="1" index="2" name="mouvrage"/>
        <attributeEditorField showLabel="1" index="3" name="gexploit"/>
        <attributeEditorField showLabel="1" index="8" name="anfinpose"/>
        <attributeEditorField showLabel="1" index="16" name="andebpose"/>
      </attributeEditorContainer>
      <attributeEditorContainer showLabel="1" visibilityExpression="" visibilityExpressionEnabled="0" columnCount="1" groupBox="1" name="Métadonnées">
        <attributeEditorField showLabel="1" index="21" name="qualglocxy"/>
        <attributeEditorField showLabel="1" index="22" name="qualglocz"/>
        <attributeEditorField showLabel="1" index="23" name="datemaj"/>
        <attributeEditorField showLabel="1" index="24" name="sourmaj"/>
        <attributeEditorField showLabel="1" index="25" name="qualannee"/>
        <attributeEditorField showLabel="1" index="26" name="dategeoloc"/>
        <attributeEditorField showLabel="1" index="27" name="sourgeoloc"/>
        <attributeEditorField showLabel="1" index="28" name="sourattrib"/>
      </attributeEditorContainer>
    </attributeEditorContainer>
  </attributeEditorForm>
  <editable>
    <field name="_code_chantier" editable="1"/>
    <field name="_date_import" editable="1"/>
    <field name="_dimensionhorizontale" editable="1"/>
    <field name="_etat" editable="1"/>
    <field name="_forme" editable="1"/>
    <field name="_longcana_cm" editable="1"/>
    <field name="_longcana_reelle" editable="1"/>
    <field name="_observation" editable="1"/>
    <field name="_pente" editable="1"/>
    <field name="_precisionannee" editable="1"/>
    <field name="_source_historique" editable="1"/>
    <field name="_temp_data" editable="1"/>
    <field name="andebpose" editable="1"/>
    <field name="anfinpose" editable="1"/>
    <field name="branchemnt" editable="1"/>
    <field name="contcanaep" editable="1"/>
    <field name="contcanass" editable="1"/>
    <field name="dategeoloc" editable="1"/>
    <field name="datemaj" editable="1"/>
    <field name="diametre" editable="1"/>
    <field name="enservice" editable="1"/>
    <field name="fonccanaep" editable="1"/>
    <field name="fonccanass" editable="1"/>
    <field name="gexploit" editable="1"/>
    <field name="id" editable="0"/>
    <field name="idcana" editable="0"/>
    <field name="idcanppale" editable="1"/>
    <field name="idnini" editable="1"/>
    <field name="idnterm" editable="1"/>
    <field name="longcana" editable="1"/>
    <field name="materiau" editable="1"/>
    <field name="modecirc" editable="1"/>
    <field name="mouvrage" editable="1"/>
    <field name="nbranche" editable="1"/>
    <field name="profgen" editable="1"/>
    <field name="qualannee" editable="1"/>
    <field name="qualglocxy" editable="1"/>
    <field name="qualglocz" editable="1"/>
    <field name="sensecoul" editable="1"/>
    <field name="sourattrib" editable="1"/>
    <field name="sourgeoloc" editable="1"/>
    <field name="sourmaj" editable="1"/>
    <field name="typreseau" editable="1"/>
    <field name="val_raepa_cat_canal_ass_libelle" editable="0"/>
    <field name="val_raepa_fonc_canal_ass_libelle" editable="0"/>
    <field name="val_raepa_materiau_libelle" editable="0"/>
    <field name="val_raepa_mode_circulation_libelle" editable="0"/>
    <field name="val_raepa_qualite_geoloc_libelle" editable="0"/>
    <field name="zamont" editable="1"/>
    <field name="zaval" editable="1"/>
  </editable>
  <labelOnTop>
    <field name="_code_chantier" labelOnTop="0"/>
    <field name="_date_import" labelOnTop="0"/>
    <field name="_dimensionhorizontale" labelOnTop="0"/>
    <field name="_etat" labelOnTop="0"/>
    <field name="_forme" labelOnTop="0"/>
    <field name="_longcana_cm" labelOnTop="0"/>
    <field name="_longcana_reelle" labelOnTop="0"/>
    <field name="_observation" labelOnTop="0"/>
    <field name="_pente" labelOnTop="0"/>
    <field name="_precisionannee" labelOnTop="0"/>
    <field name="_source_historique" labelOnTop="0"/>
    <field name="_temp_data" labelOnTop="0"/>
    <field name="andebpose" labelOnTop="0"/>
    <field name="anfinpose" labelOnTop="0"/>
    <field name="branchemnt" labelOnTop="0"/>
    <field name="contcanaep" labelOnTop="0"/>
    <field name="contcanass" labelOnTop="0"/>
    <field name="dategeoloc" labelOnTop="0"/>
    <field name="datemaj" labelOnTop="0"/>
    <field name="diametre" labelOnTop="0"/>
    <field name="enservice" labelOnTop="0"/>
    <field name="fonccanaep" labelOnTop="0"/>
    <field name="fonccanass" labelOnTop="0"/>
    <field name="gexploit" labelOnTop="0"/>
    <field name="id" labelOnTop="0"/>
    <field name="idcana" labelOnTop="0"/>
    <field name="idcanppale" labelOnTop="0"/>
    <field name="idnini" labelOnTop="0"/>
    <field name="idnterm" labelOnTop="0"/>
    <field name="longcana" labelOnTop="0"/>
    <field name="materiau" labelOnTop="0"/>
    <field name="modecirc" labelOnTop="0"/>
    <field name="mouvrage" labelOnTop="0"/>
    <field name="nbranche" labelOnTop="0"/>
    <field name="profgen" labelOnTop="0"/>
    <field name="qualannee" labelOnTop="0"/>
    <field name="qualglocxy" labelOnTop="0"/>
    <field name="qualglocz" labelOnTop="0"/>
    <field name="sensecoul" labelOnTop="0"/>
    <field name="sourattrib" labelOnTop="0"/>
    <field name="sourgeoloc" labelOnTop="0"/>
    <field name="sourmaj" labelOnTop="0"/>
    <field name="typreseau" labelOnTop="0"/>
    <field name="val_raepa_cat_canal_ass_libelle" labelOnTop="0"/>
    <field name="val_raepa_fonc_canal_ass_libelle" labelOnTop="0"/>
    <field name="val_raepa_materiau_libelle" labelOnTop="0"/>
    <field name="val_raepa_mode_circulation_libelle" labelOnTop="0"/>
    <field name="val_raepa_qualite_geoloc_libelle" labelOnTop="0"/>
    <field name="zamont" labelOnTop="0"/>
    <field name="zaval" labelOnTop="0"/>
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
