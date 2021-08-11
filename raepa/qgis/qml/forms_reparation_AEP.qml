<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis styleCategories="Fields|Forms" version="3.10.14-A Coruña">
  <fieldConfiguration>
    <field name="id">
      <editWidget type="Range">
        <config>
          <Option type="Map">
            <Option type="bool" value="true" name="AllowNull"/>
            <Option type="int" value="2147483647" name="Max"/>
            <Option type="int" value="-2147483648" name="Min"/>
            <Option type="int" value="0" name="Precision"/>
            <Option type="int" value="1" name="Step"/>
            <Option type="QString" value="SpinBox" name="Style"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="idrepar">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" value="false" name="IsMultiline"/>
            <Option type="bool" value="false" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="x">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" value="false" name="IsMultiline"/>
            <Option type="bool" value="false" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="y">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" value="false" name="IsMultiline"/>
            <Option type="bool" value="false" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="supprepare">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option type="bool" value="false" name="AllowMulti"/>
            <Option type="bool" value="false" name="AllowNull"/>
            <Option type="QString" value="" name="FilterExpression"/>
            <Option type="QString" value="code" name="Key"/>
            <Option type="QString" value="val_raepa_support_reparation" name="LayerName"/>
            <Option type="int" value="1" name="NofColumns"/>
            <Option type="bool" value="false" name="OrderByValue"/>
            <Option type="bool" value="false" name="UseCompleter"/>
            <Option type="QString" value="libelle" name="Value"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="defreparee">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option type="bool" value="false" name="AllowMulti"/>
            <Option type="bool" value="false" name="AllowNull"/>
            <Option type="QString" value="" name="FilterExpression"/>
            <Option type="QString" value="code" name="Key"/>
            <Option type="QString" value="val_raepa_type_defaillance" name="LayerName"/>
            <Option type="int" value="1" name="NofColumns"/>
            <Option type="bool" value="false" name="OrderByValue"/>
            <Option type="bool" value="false" name="UseCompleter"/>
            <Option type="QString" value="libelle" name="Value"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="idsuprepar">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option type="bool" value="false" name="IsMultiline"/>
            <Option type="bool" value="false" name="UseHtml"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="daterepar">
      <editWidget type="DateTime">
        <config>
          <Option type="Map">
            <Option type="bool" value="true" name="allow_null"/>
            <Option type="bool" value="true" name="calendar_popup"/>
            <Option type="QString" value="yyyy-MM-dd" name="display_format"/>
            <Option type="QString" value="yyyy-MM-dd" name="field_format"/>
            <Option type="bool" value="false" name="field_iso_format"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="mouvrage">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option type="bool" value="false" name="AllowMulti"/>
            <Option type="bool" value="true" name="AllowNull"/>
            <Option type="QString" value="" name="FilterExpression"/>
            <Option type="QString" value="nom" name="Key"/>
            <Option type="QString" value="sys_organisme_gestionnaire" name="LayerName"/>
            <Option type="int" value="1" name="NofColumns"/>
            <Option type="bool" value="true" name="OrderByValue"/>
            <Option type="bool" value="false" name="UseCompleter"/>
            <Option type="QString" value="nom" name="Value"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="_source_historique">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="_code_chantier">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="_date_import">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias index="0" field="id" name="Identifiant automatique"/>
    <alias index="1" field="idrepar" name=""/>
    <alias index="2" field="x" name="X [m]"/>
    <alias index="3" field="y" name="Y [m]"/>
    <alias index="4" field="supprepare" name=""/>
    <alias index="5" field="defreparee" name=""/>
    <alias index="6" field="idsuprepar" name=""/>
    <alias index="7" field="daterepar" name=""/>
    <alias index="8" field="mouvrage" name="Maître d’ouvrage"/>
    <alias index="9" field="_source_historique" name=""/>
    <alias index="10" field="_code_chantier" name=""/>
    <alias index="11" field="_date_import" name=""/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default applyOnUpdate="0" expression="" field="id"/>
    <default applyOnUpdate="0" expression="raepa.generate_oid('raepa_reparaep_p'::text)" field="idrepar"/>
    <default applyOnUpdate="0" expression="X( $geometry )" field="x"/>
    <default applyOnUpdate="0" expression="Y( $geometry )" field="y"/>
    <default applyOnUpdate="0" expression="" field="supprepare"/>
    <default applyOnUpdate="0" expression="" field="defreparee"/>
    <default applyOnUpdate="0" expression="'INCONNU'" field="idsuprepar"/>
    <default applyOnUpdate="0" expression="" field="daterepar"/>
    <default applyOnUpdate="0" expression="" field="mouvrage"/>
    <default applyOnUpdate="0" expression="" field="_source_historique"/>
    <default applyOnUpdate="0" expression="" field="_code_chantier"/>
    <default applyOnUpdate="0" expression="" field="_date_import"/>
  </defaults>
  <constraints>
    <constraint unique_strength="1" constraints="3" notnull_strength="1" exp_strength="0" field="id"/>
    <constraint unique_strength="1" constraints="3" notnull_strength="1" exp_strength="0" field="idrepar"/>
    <constraint unique_strength="0" constraints="1" notnull_strength="2" exp_strength="0" field="x"/>
    <constraint unique_strength="0" constraints="1" notnull_strength="2" exp_strength="0" field="y"/>
    <constraint unique_strength="0" constraints="1" notnull_strength="1" exp_strength="0" field="supprepare"/>
    <constraint unique_strength="0" constraints="1" notnull_strength="1" exp_strength="0" field="defreparee"/>
    <constraint unique_strength="0" constraints="1" notnull_strength="1" exp_strength="0" field="idsuprepar"/>
    <constraint unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0" field="daterepar"/>
    <constraint unique_strength="0" constraints="1" notnull_strength="1" exp_strength="0" field="mouvrage"/>
    <constraint unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0" field="_source_historique"/>
    <constraint unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0" field="_code_chantier"/>
    <constraint unique_strength="0" constraints="0" notnull_strength="0" exp_strength="0" field="_date_import"/>
  </constraints>
  <constraintExpressions>
    <constraint desc="" exp="" field="id"/>
    <constraint desc="" exp="" field="idrepar"/>
    <constraint desc="" exp="" field="x"/>
    <constraint desc="" exp="" field="y"/>
    <constraint desc="" exp="" field="supprepare"/>
    <constraint desc="" exp="" field="defreparee"/>
    <constraint desc="" exp="" field="idsuprepar"/>
    <constraint desc="" exp="" field="daterepar"/>
    <constraint desc="" exp="" field="mouvrage"/>
    <constraint desc="" exp="" field="_source_historique"/>
    <constraint desc="" exp="" field="_code_chantier"/>
    <constraint desc="" exp="" field="_date_import"/>
  </constraintExpressions>
  <expressionfields/>
  <editform tolerant="1">/../../../.local/share/QGIS/QGIS3/profiles</editform>
  <editforminit>vw_cover_open</editforminit>
  <editforminitcodesource>0</editforminitcodesource>
  <editforminitfilepath>/../.local/share/QGIS/.local/share/QGIS/QGIS3/profiles/default/3liz/Reapa</editforminitfilepath>
  <editforminitcode><![CDATA[from qgepplugin.ui.forms import vw_cover_open
]]></editforminitcode>
  <featformsuppress>0</featformsuppress>
  <editorlayout>tablayout</editorlayout>
  <attributeEditorForm>
    <attributeEditorContainer showLabel="1" groupBox="0" visibilityExpression="" columnCount="1" name="Reparation" visibilityExpressionEnabled="0">
      <attributeEditorContainer showLabel="1" groupBox="1" visibilityExpression="" columnCount="1" name="Général" visibilityExpressionEnabled="0">
        <attributeEditorField index="0" showLabel="1" name="id"/>
        <attributeEditorField index="1" showLabel="1" name="idrepar"/>
        <attributeEditorField index="5" showLabel="1" name="defreparee"/>
      </attributeEditorContainer>
      <attributeEditorContainer showLabel="1" groupBox="1" visibilityExpression="" columnCount="1" name="Technique" visibilityExpressionEnabled="0">
        <attributeEditorField index="2" showLabel="1" name="x"/>
        <attributeEditorField index="3" showLabel="1" name="y"/>
      </attributeEditorContainer>
      <attributeEditorContainer showLabel="1" groupBox="1" visibilityExpression="" columnCount="1" name="Relations" visibilityExpressionEnabled="0">
        <attributeEditorField index="4" showLabel="1" name="supprepare"/>
        <attributeEditorField index="6" showLabel="1" name="idsuprepar"/>
      </attributeEditorContainer>
      <attributeEditorContainer showLabel="1" groupBox="1" visibilityExpression="" columnCount="1" name="Historique" visibilityExpressionEnabled="0">
        <attributeEditorField index="8" showLabel="1" name="mouvrage"/>
        <attributeEditorField index="7" showLabel="1" name="daterepar"/>
      </attributeEditorContainer>
    </attributeEditorContainer>
  </attributeEditorForm>
  <editable>
    <field editable="1" name="_angletampon"/>
    <field editable="1" name="_capacite"/>
    <field editable="1" name="_code_chantier"/>
    <field editable="1" name="_commune"/>
    <field editable="1" name="_date_import"/>
    <field editable="1" name="_dateprevue"/>
    <field editable="1" name="_etatcanalisation"/>
    <field editable="1" name="_fiche"/>
    <field editable="1" name="_frequencecuragepreventif"/>
    <field editable="1" name="_geom_emprise"/>
    <field editable="1" name="_idinterventionparent"/>
    <field editable="1" name="_image"/>
    <field editable="1" name="_nom_appareil"/>
    <field editable="1" name="_observation"/>
    <field editable="1" name="_source_historique"/>
    <field editable="1" name="_temp_data"/>
    <field editable="1" name="_typeintervention"/>
    <field editable="1" name="_ztampon"/>
    <field editable="1" name="andebpose"/>
    <field editable="1" name="anfinpose"/>
    <field editable="1" name="dategeoloc"/>
    <field editable="1" name="datemaj"/>
    <field editable="1" name="daterepar"/>
    <field editable="1" name="defreparee"/>
    <field editable="1" name="fnouvass"/>
    <field editable="1" name="gexploit"/>
    <field editable="0" name="id"/>
    <field editable="1" name="idcanamont"/>
    <field editable="1" name="idcanaval"/>
    <field editable="1" name="idcanppale"/>
    <field editable="1" name="idouvrage"/>
    <field editable="1" name="idrepar"/>
    <field editable="1" name="idsuprepar"/>
    <field editable="1" name="mouvrage"/>
    <field editable="1" name="qualannee"/>
    <field editable="1" name="qualglocxy"/>
    <field editable="1" name="qualglocz"/>
    <field editable="1" name="sourattrib"/>
    <field editable="1" name="sourgeoloc"/>
    <field editable="1" name="sourmaj"/>
    <field editable="1" name="supprepare"/>
    <field editable="1" name="typreseau"/>
    <field editable="1" name="x"/>
    <field editable="1" name="y"/>
    <field editable="1" name="z"/>
  </editable>
  <labelOnTop>
    <field labelOnTop="0" name="_angletampon"/>
    <field labelOnTop="0" name="_capacite"/>
    <field labelOnTop="0" name="_code_chantier"/>
    <field labelOnTop="0" name="_commune"/>
    <field labelOnTop="0" name="_date_import"/>
    <field labelOnTop="0" name="_dateprevue"/>
    <field labelOnTop="0" name="_etatcanalisation"/>
    <field labelOnTop="0" name="_fiche"/>
    <field labelOnTop="0" name="_frequencecuragepreventif"/>
    <field labelOnTop="0" name="_geom_emprise"/>
    <field labelOnTop="0" name="_idinterventionparent"/>
    <field labelOnTop="0" name="_image"/>
    <field labelOnTop="0" name="_nom_appareil"/>
    <field labelOnTop="0" name="_observation"/>
    <field labelOnTop="0" name="_source_historique"/>
    <field labelOnTop="0" name="_temp_data"/>
    <field labelOnTop="0" name="_typeintervention"/>
    <field labelOnTop="0" name="_ztampon"/>
    <field labelOnTop="0" name="andebpose"/>
    <field labelOnTop="0" name="anfinpose"/>
    <field labelOnTop="0" name="dategeoloc"/>
    <field labelOnTop="0" name="datemaj"/>
    <field labelOnTop="0" name="daterepar"/>
    <field labelOnTop="0" name="defreparee"/>
    <field labelOnTop="0" name="fnouvass"/>
    <field labelOnTop="0" name="gexploit"/>
    <field labelOnTop="0" name="id"/>
    <field labelOnTop="0" name="idcanamont"/>
    <field labelOnTop="0" name="idcanaval"/>
    <field labelOnTop="0" name="idcanppale"/>
    <field labelOnTop="0" name="idouvrage"/>
    <field labelOnTop="0" name="idrepar"/>
    <field labelOnTop="0" name="idsuprepar"/>
    <field labelOnTop="0" name="mouvrage"/>
    <field labelOnTop="0" name="qualannee"/>
    <field labelOnTop="0" name="qualglocxy"/>
    <field labelOnTop="0" name="qualglocz"/>
    <field labelOnTop="0" name="sourattrib"/>
    <field labelOnTop="0" name="sourgeoloc"/>
    <field labelOnTop="0" name="sourmaj"/>
    <field labelOnTop="0" name="supprepare"/>
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
  <layerGeometryType>0</layerGeometryType>
</qgis>
