<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="3.4.14-Madeira" styleCategories="Fields|Forms">
  <fieldConfiguration>
    <field name="id">
      <editWidget type="Range">
        <config>
          <Option type="Map">
            <Option name="AllowNull" value="true" type="bool"/>
            <Option name="Max" value="2147483647" type="int"/>
            <Option name="Min" value="-2147483648" type="int"/>
            <Option name="Precision" value="0" type="int"/>
            <Option name="Step" value="1" type="int"/>
            <Option name="Style" value="SpinBox" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="idouvrage">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="x">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="y">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="mouvrage">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option name="AllowMulti" value="false" type="bool"/>
            <Option name="AllowNull" value="true" type="bool"/>
            <Option name="FilterExpression" value="" type="QString"/>
            <Option name="Key" value="nom" type="QString"/>
            <Option name="LayerName" value="sys_organisme_gestionnaire" type="QString"/>
            <Option name="NofColumns" value="1" type="int"/>
            <Option name="OrderByValue" value="true" type="bool"/>
            <Option name="UseCompleter" value="false" type="bool"/>
            <Option name="Value" value="nom" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="gexploit">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option name="AllowMulti" value="false" type="bool"/>
            <Option name="AllowNull" value="true" type="bool"/>
            <Option name="FilterExpression" value="" type="QString"/>
            <Option name="Key" value="nom" type="QString"/>
            <Option name="LayerName" value="sys_organisme_gestionnaire" type="QString"/>
            <Option name="NofColumns" value="1" type="int"/>
            <Option name="OrderByValue" value="true" type="bool"/>
            <Option name="UseCompleter" value="false" type="bool"/>
            <Option name="Value" value="nom" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="typreseau">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option name="AllowMulti" value="false" type="bool"/>
            <Option name="AllowNull" value="true" type="bool"/>
            <Option name="FilterExpression" value="" type="QString"/>
            <Option name="Key" value="code" type="QString"/>
            <Option name="LayerName" value="val_raepa_typ_reseau_ass" type="QString"/>
            <Option name="NofColumns" value="1" type="int"/>
            <Option name="OrderByValue" value="true" type="bool"/>
            <Option name="UseCompleter" value="false" type="bool"/>
            <Option name="Value" value="libelle" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fnouvass">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option name="AllowMulti" value="false" type="bool"/>
            <Option name="AllowNull" value="true" type="bool"/>
            <Option name="FilterExpression" value="" type="QString"/>
            <Option name="Key" value="code" type="QString"/>
            <Option name="LayerName" value="val_raepa_fonc_ouv_ass" type="QString"/>
            <Option name="NofColumns" value="1" type="int"/>
            <Option name="OrderByValue" value="true" type="bool"/>
            <Option name="UseCompleter" value="false" type="bool"/>
            <Option name="Value" value="libelle" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="anfinpose">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="idcanamont">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="idcanaval">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="idcanppale">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="z">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="_ztampon">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="_angletampon">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="andebpose">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="qualglocxy">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option name="AllowMulti" value="false" type="bool"/>
            <Option name="AllowNull" value="true" type="bool"/>
            <Option name="FilterExpression" value="" type="QString"/>
            <Option name="Key" value="code" type="QString"/>
            <Option name="LayerName" value="val_raepa_qualite_geoloc" type="QString"/>
            <Option name="NofColumns" value="1" type="int"/>
            <Option name="OrderByValue" value="true" type="bool"/>
            <Option name="UseCompleter" value="false" type="bool"/>
            <Option name="Value" value="libelle" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="qualglocz">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option name="AllowMulti" value="false" type="bool"/>
            <Option name="AllowNull" value="true" type="bool"/>
            <Option name="FilterExpression" value="" type="QString"/>
            <Option name="Key" value="code" type="QString"/>
            <Option name="LayerName" value="val_raepa_qualite_geoloc" type="QString"/>
            <Option name="NofColumns" value="1" type="int"/>
            <Option name="OrderByValue" value="true" type="bool"/>
            <Option name="UseCompleter" value="false" type="bool"/>
            <Option name="Value" value="libelle" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="datemaj">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="sourmaj">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option name="AllowMulti" value="false" type="bool"/>
            <Option name="AllowNull" value="true" type="bool"/>
            <Option name="FilterExpression" value="" type="QString"/>
            <Option name="Key" value="nom" type="QString"/>
            <Option name="LayerName" value="sys_organisme_gestionnaire" type="QString"/>
            <Option name="NofColumns" value="1" type="int"/>
            <Option name="OrderByValue" value="true" type="bool"/>
            <Option name="UseCompleter" value="false" type="bool"/>
            <Option name="Value" value="nom" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="qualannee">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option name="AllowMulti" value="false" type="bool"/>
            <Option name="AllowNull" value="true" type="bool"/>
            <Option name="FilterExpression" value="" type="QString"/>
            <Option name="Key" value="code" type="QString"/>
            <Option name="LayerName" value="val_raepa_qualite_anpose" type="QString"/>
            <Option name="NofColumns" value="1" type="int"/>
            <Option name="OrderByValue" value="true" type="bool"/>
            <Option name="UseCompleter" value="false" type="bool"/>
            <Option name="Value" value="libelle" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="dategeoloc">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="sourgeoloc">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="sourattrib">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="_source_historique">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="0" type="QString"/>
            <Option name="UseHtml" value="0" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="_code_chantier">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="0" type="QString"/>
            <Option name="UseHtml" value="0" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="_date_import">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="0" type="QString"/>
            <Option name="UseHtml" value="0" type="QString"/>
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
            <Option name="IsMultiline" value="0" type="QString"/>
            <Option name="UseHtml" value="0" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="_observation">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="true" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias name="Identifiant automatique" index="0" field="id"/>
    <alias name="Code ouvrage" index="1" field="idouvrage"/>
    <alias name="X [m]" index="2" field="x"/>
    <alias name="Y [m]" index="3" field="y"/>
    <alias name="Maître d’ouvrage" index="4" field="mouvrage"/>
    <alias name="Exploitant" index="5" field="gexploit"/>
    <alias name="Type du réseau" index="6" field="typreseau"/>
    <alias name="Fonction" index="7" field="fnouvass"/>
    <alias name="Année de fin de pose" index="8" field="anfinpose"/>
    <alias name="Canalisations amont" index="9" field="idcanamont"/>
    <alias name="Canalisations aval" index="10" field="idcanaval"/>
    <alias name="Canalisation principale" index="11" field="idcanppale"/>
    <alias name="Altitude [m]" index="12" field="z"/>
    <alias name="Altitude du tampon [m]" index="13" field="_ztampon"/>
    <alias name="Rotation du tampon [°]" index="14" field="_angletampon"/>
    <alias name="Année de début de pose" index="15" field="andebpose"/>
    <alias name="Qualité de la géolocalisation XY" index="16" field="qualglocxy"/>
    <alias name="Qualité de la géolocalisation Z" index="17" field="qualglocz"/>
    <alias name="Date de mise à jour" index="18" field="datemaj"/>
    <alias name="Source de la mise à jour" index="19" field="sourmaj"/>
    <alias name="Qualité de l’année de pose" index="20" field="qualannee"/>
    <alias name="Date de la géolocalisation" index="21" field="dategeoloc"/>
    <alias name="Auteur de la géolocalisation" index="22" field="sourgeoloc"/>
    <alias name="Auteur des données attributaires" index="23" field="sourattrib"/>
    <alias name="Source historique" index="24" field="_source_historique"/>
    <alias name="" index="25" field="_code_chantier"/>
    <alias name="" index="26" field="_date_import"/>
    <alias name="" index="27" field="_geom_emprise"/>
    <alias name="" index="28" field="_temp_data"/>
    <alias name="Observation" index="29" field="_observation"/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default expression="" field="id" applyOnUpdate="0"/>
    <default expression="'INCONNU'" field="idouvrage" applyOnUpdate="0"/>
    <default expression="X( $geometry )" field="x" applyOnUpdate="0"/>
    <default expression="Y( $geometry )" field="y" applyOnUpdate="0"/>
    <default expression="" field="mouvrage" applyOnUpdate="0"/>
    <default expression="" field="gexploit" applyOnUpdate="0"/>
    <default expression="" field="typreseau" applyOnUpdate="0"/>
    <default expression="" field="fnouvass" applyOnUpdate="0"/>
    <default expression=" year( now())" field="anfinpose" applyOnUpdate="0"/>
    <default expression="'INCONNU'" field="idcanamont" applyOnUpdate="0"/>
    <default expression="'INCONNU'" field="idcanaval" applyOnUpdate="0"/>
    <default expression="'INCONNU'" field="idcanppale" applyOnUpdate="0"/>
    <default expression="" field="z" applyOnUpdate="0"/>
    <default expression="" field="_ztampon" applyOnUpdate="0"/>
    <default expression="" field="_angletampon" applyOnUpdate="0"/>
    <default expression="" field="andebpose" applyOnUpdate="0"/>
    <default expression="" field="qualglocxy" applyOnUpdate="0"/>
    <default expression="" field="qualglocz" applyOnUpdate="0"/>
    <default expression="to_date(now())" field="datemaj" applyOnUpdate="0"/>
    <default expression="" field="sourmaj" applyOnUpdate="0"/>
    <default expression="" field="qualannee" applyOnUpdate="0"/>
    <default expression="" field="dategeoloc" applyOnUpdate="0"/>
    <default expression="" field="sourgeoloc" applyOnUpdate="0"/>
    <default expression="" field="sourattrib" applyOnUpdate="0"/>
    <default expression="" field="_source_historique" applyOnUpdate="0"/>
    <default expression="" field="_code_chantier" applyOnUpdate="0"/>
    <default expression="" field="_date_import" applyOnUpdate="0"/>
    <default expression="" field="_geom_emprise" applyOnUpdate="0"/>
    <default expression="" field="_temp_data" applyOnUpdate="0"/>
    <default expression="''" field="_observation" applyOnUpdate="0"/>
  </defaults>
  <constraints>
    <constraint unique_strength="1" exp_strength="0" notnull_strength="1" constraints="3" field="id"/>
    <constraint unique_strength="1" exp_strength="0" notnull_strength="1" constraints="3" field="idouvrage"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="2" constraints="1" field="x"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="2" constraints="1" field="y"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="1" constraints="1" field="mouvrage"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="1" constraints="1" field="gexploit"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="1" constraints="1" field="typreseau"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="1" constraints="1" field="fnouvass"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="1" constraints="1" field="anfinpose"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="2" constraints="1" field="idcanamont"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="2" constraints="1" field="idcanaval"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="0" constraints="0" field="idcanppale"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="0" constraints="0" field="z"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="0" constraints="0" field="_ztampon"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="0" constraints="0" field="_angletampon"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="0" constraints="0" field="andebpose"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="1" constraints="1" field="qualglocxy"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="1" constraints="1" field="qualglocz"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="1" constraints="1" field="datemaj"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="1" constraints="1" field="sourmaj"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="0" constraints="0" field="qualannee"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="0" constraints="0" field="dategeoloc"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="0" constraints="0" field="sourgeoloc"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="0" constraints="0" field="sourattrib"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="0" constraints="0" field="_source_historique"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="0" constraints="0" field="_code_chantier"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="0" constraints="0" field="_date_import"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="0" constraints="0" field="_geom_emprise"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="0" constraints="0" field="_temp_data"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="0" constraints="0" field="_observation"/>
  </constraints>
  <constraintExpressions>
    <constraint desc="" field="id" exp=""/>
    <constraint desc="" field="idouvrage" exp=""/>
    <constraint desc="" field="x" exp=""/>
    <constraint desc="" field="y" exp=""/>
    <constraint desc="" field="mouvrage" exp=""/>
    <constraint desc="" field="gexploit" exp=""/>
    <constraint desc="" field="typreseau" exp=""/>
    <constraint desc="" field="fnouvass" exp=""/>
    <constraint desc="" field="anfinpose" exp=""/>
    <constraint desc="" field="idcanamont" exp=""/>
    <constraint desc="" field="idcanaval" exp=""/>
    <constraint desc="" field="idcanppale" exp=""/>
    <constraint desc="" field="z" exp=""/>
    <constraint desc="" field="_ztampon" exp=""/>
    <constraint desc="" field="_angletampon" exp=""/>
    <constraint desc="" field="andebpose" exp=""/>
    <constraint desc="" field="qualglocxy" exp=""/>
    <constraint desc="" field="qualglocz" exp=""/>
    <constraint desc="" field="datemaj" exp=""/>
    <constraint desc="" field="sourmaj" exp=""/>
    <constraint desc="" field="qualannee" exp=""/>
    <constraint desc="" field="dategeoloc" exp=""/>
    <constraint desc="" field="sourgeoloc" exp=""/>
    <constraint desc="" field="sourattrib" exp=""/>
    <constraint desc="" field="_source_historique" exp=""/>
    <constraint desc="" field="_code_chantier" exp=""/>
    <constraint desc="" field="_date_import" exp=""/>
    <constraint desc="" field="_geom_emprise" exp=""/>
    <constraint desc="" field="_temp_data" exp=""/>
    <constraint desc="" field="_observation" exp=""/>
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
    <attributeEditorContainer name="Ouvrage" groupBox="0" visibilityExpressionEnabled="0" columnCount="1" visibilityExpression="" showLabel="1">
      <attributeEditorContainer name="Général" groupBox="1" visibilityExpressionEnabled="0" columnCount="1" visibilityExpression="" showLabel="1">
        <attributeEditorField name="id" index="0" showLabel="1"/>
        <attributeEditorField name="idouvrage" index="1" showLabel="1"/>
        <attributeEditorField name="typreseau" index="6" showLabel="1"/>
        <attributeEditorField name="fnouvass" index="7" showLabel="1"/>
        <attributeEditorField name="_observation" index="29" showLabel="1"/>
      </attributeEditorContainer>
      <attributeEditorContainer name="Technique" groupBox="1" visibilityExpressionEnabled="0" columnCount="1" visibilityExpression="" showLabel="1">
        <attributeEditorField name="x" index="2" showLabel="1"/>
        <attributeEditorField name="y" index="3" showLabel="1"/>
        <attributeEditorField name="z" index="12" showLabel="1"/>
        <attributeEditorField name="_ztampon" index="13" showLabel="1"/>
        <attributeEditorField name="_angletampon" index="14" showLabel="1"/>
        <attributeEditorField name="qualglocxy" index="16" showLabel="1"/>
        <attributeEditorField name="qualglocz" index="17" showLabel="1"/>
      </attributeEditorContainer>
      <attributeEditorContainer name="Relations" groupBox="1" visibilityExpressionEnabled="0" columnCount="1" visibilityExpression="" showLabel="1">
        <attributeEditorField name="idcanamont" index="9" showLabel="1"/>
        <attributeEditorField name="idcanaval" index="10" showLabel="1"/>
        <attributeEditorField name="idcanppale" index="11" showLabel="1"/>
      </attributeEditorContainer>
      <attributeEditorContainer name="Historique" groupBox="1" visibilityExpressionEnabled="0" columnCount="1" visibilityExpression="" showLabel="1">
        <attributeEditorField name="mouvrage" index="4" showLabel="1"/>
        <attributeEditorField name="gexploit" index="5" showLabel="1"/>
        <attributeEditorField name="andebpose" index="15" showLabel="1"/>
        <attributeEditorField name="anfinpose" index="8" showLabel="1"/>
        <attributeEditorField name="_code_chantier" index="25" showLabel="1"/>
        <attributeEditorField name="_date_import" index="26" showLabel="1"/>
      </attributeEditorContainer>
      <attributeEditorContainer name="Métadonnées" groupBox="1" visibilityExpressionEnabled="0" columnCount="1" visibilityExpression="" showLabel="1">
        <attributeEditorField name="datemaj" index="18" showLabel="1"/>
        <attributeEditorField name="sourmaj" index="19" showLabel="1"/>
        <attributeEditorField name="qualannee" index="20" showLabel="1"/>
        <attributeEditorField name="dategeoloc" index="21" showLabel="1"/>
        <attributeEditorField name="sourgeoloc" index="22" showLabel="1"/>
        <attributeEditorField name="sourattrib" index="23" showLabel="1"/>
        <attributeEditorField name="_source_historique" index="24" showLabel="1"/>
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
    <field name="fnouvass" editable="1"/>
    <field name="gexploit" editable="1"/>
    <field name="id" editable="0"/>
    <field name="idcanamont" editable="1"/>
    <field name="idcanaval" editable="1"/>
    <field name="idcanppale" editable="1"/>
    <field name="idouvrage" editable="1"/>
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
  <layerGeometryType>0</layerGeometryType>
</qgis>
