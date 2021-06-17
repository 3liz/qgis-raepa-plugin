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
    <field name="idcana">
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
    <field name="enservice">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option name="CheckedState" value="1" type="QString"/>
            <Option name="UncheckedState" value="0" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="branchemnt">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option name="CheckedState" value="1" type="QString"/>
            <Option name="UncheckedState" value="0" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="materiau">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option name="AllowMulti" value="false" type="bool"/>
            <Option name="AllowNull" value="true" type="bool"/>
            <Option name="FilterExpression" value="" type="QString"/>
            <Option name="Key" value="code" type="QString"/>
            <Option name="LayerName" value="val_raepa_materiau" type="QString"/>
            <Option name="NofColumns" value="1" type="int"/>
            <Option name="OrderByValue" value="true" type="bool"/>
            <Option name="UseCompleter" value="false" type="bool"/>
            <Option name="Value" value="libelle" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="diametre">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
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
    <field name="modecirc">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option name="AllowMulti" value="false" type="bool"/>
            <Option name="AllowNull" value="true" type="bool"/>
            <Option name="FilterExpression" value="" type="QString"/>
            <Option name="Key" value="code" type="QString"/>
            <Option name="LayerName" value="val_raepa_mode_circulation" type="QString"/>
            <Option name="NofColumns" value="1" type="int"/>
            <Option name="OrderByValue" value="true" type="bool"/>
            <Option name="UseCompleter" value="false" type="bool"/>
            <Option name="Value" value="libelle" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="contcanaep">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option name="AllowMulti" value="false" type="bool"/>
            <Option name="AllowNull" value="true" type="bool"/>
            <Option name="FilterExpression" value="" type="QString"/>
            <Option name="Key" value="code" type="QString"/>
            <Option name="LayerName" value="val_raepa_fonc_canal_ae" type="QString"/>
            <Option name="NofColumns" value="1" type="int"/>
            <Option name="OrderByValue" value="true" type="bool"/>
            <Option name="UseCompleter" value="false" type="bool"/>
            <Option name="Value" value="libelle" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fonccanaep">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option name="AllowMulti" value="false" type="bool"/>
            <Option name="AllowNull" value="true" type="bool"/>
            <Option name="FilterExpression" value="" type="QString"/>
            <Option name="Key" value="code" type="QString"/>
            <Option name="LayerName" value="val_raepa_fonc_canal_ae" type="QString"/>
            <Option name="NofColumns" value="1" type="int"/>
            <Option name="OrderByValue" value="true" type="bool"/>
            <Option name="UseCompleter" value="false" type="bool"/>
            <Option name="Value" value="libelle" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="idnini">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="idnterm">
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
    <field name="profgen">
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
    <field name="longcana">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="_longcana_cm">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="_longcana_reelle">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="nbranche">
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
      <editWidget type="DateTime">
        <config>
          <Option type="Map">
            <Option name="allow_null" value="true" type="bool"/>
            <Option name="calendar_popup" value="true" type="bool"/>
            <Option name="display_format" value="yyyy-MM-dd" type="QString"/>
            <Option name="field_format" value="yyyy-MM-dd" type="QString"/>
            <Option name="field_iso_format" value="false" type="bool"/>
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
      <editWidget type="DateTime">
        <config>
          <Option type="Map">
            <Option name="allow_null" value="true" type="bool"/>
            <Option name="calendar_popup" value="true" type="bool"/>
            <Option name="display_format" value="yyyy-MM-dd" type="QString"/>
            <Option name="field_format" value="yyyy-MM-dd" type="QString"/>
            <Option name="field_iso_format" value="false" type="bool"/>
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
    <alias name="Code canalisation" index="1" field="idcana"/>
    <alias name="Maître d’ouvrage" index="2" field="mouvrage"/>
    <alias name="Exploitant" index="3" field="gexploit"/>
    <alias name="En service" index="4" field="enservice"/>
    <alias name="Branchement" index="5" field="branchemnt"/>
    <alias name="Matériau" index="6" field="materiau"/>
    <alias name="Diamètre nominal [mm]" index="7" field="diametre"/>
    <alias name="Année de fin de pose" index="8" field="anfinpose"/>
    <alias name="Mode de circulation" index="9" field="modecirc"/>
    <alias name="Catégorie" index="10" field="contcanaep"/>
    <alias name="Fonction" index="11" field="fonccanaep"/>
    <alias name="Noeud initial" index="12" field="idnini"/>
    <alias name="Noeud terminal" index="13" field="idnterm"/>
    <alias name="Canalisation principale" index="14" field="idcanppale"/>
    <alias name="Profondeur moyenne de la génératrice supérieure" index="15" field="profgen"/>
    <alias name="Année de début de pose" index="16" field="andebpose"/>
    <alias name="Longueur mesurée [m]" index="17" field="longcana"/>
    <alias name="Longueur projetée calculée [m]" index="18" field="_longcana_cm"/>
    <alias name="Longueur réelle calculée [m]" index="19" field="_longcana_reelle"/>
    <alias name="Nombre de branchements" index="20" field="nbranche"/>
    <alias name="Qualité de la géolocalisation XY" index="21" field="qualglocxy"/>
    <alias name="Qualité de la géolocalisation Z" index="22" field="qualglocz"/>
    <alias name="Date de mise à jour" index="23" field="datemaj"/>
    <alias name="Source de la mise à jour" index="24" field="sourmaj"/>
    <alias name="Qualité de l’année de pose" index="25" field="qualannee"/>
    <alias name="Date de la géolocalisation" index="26" field="dategeoloc"/>
    <alias name="Auteur de la géolocalisation" index="27" field="sourgeoloc"/>
    <alias name="Auteur des données attributaires" index="28" field="sourattrib"/>
    <alias name="Observation" index="29" field="_observation"/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default expression="" field="id" applyOnUpdate="0"/>
    <default expression="'INCONNU'" field="idcana" applyOnUpdate="0"/>
    <default expression="" field="mouvrage" applyOnUpdate="0"/>
    <default expression="" field="gexploit" applyOnUpdate="0"/>
    <default expression="" field="enservice" applyOnUpdate="0"/>
    <default expression="" field="branchemnt" applyOnUpdate="0"/>
    <default expression="" field="materiau" applyOnUpdate="0"/>
    <default expression="-1" field="diametre" applyOnUpdate="0"/>
    <default expression="year(now())" field="anfinpose" applyOnUpdate="0"/>
    <default expression="" field="modecirc" applyOnUpdate="0"/>
    <default expression="" field="contcanaep" applyOnUpdate="0"/>
    <default expression="" field="fonccanaep" applyOnUpdate="0"/>
    <default expression="'INCONNU'" field="idnini" applyOnUpdate="0"/>
    <default expression="'INCONNU'" field="idnterm" applyOnUpdate="0"/>
    <default expression="'INCONNU'" field="idcanppale" applyOnUpdate="0"/>
    <default expression="" field="profgen" applyOnUpdate="0"/>
    <default expression="" field="andebpose" applyOnUpdate="0"/>
    <default expression="" field="longcana" applyOnUpdate="0"/>
    <default expression="" field="_longcana_cm" applyOnUpdate="0"/>
    <default expression="" field="_longcana_reelle" applyOnUpdate="0"/>
    <default expression="" field="nbranche" applyOnUpdate="0"/>
    <default expression="" field="qualglocxy" applyOnUpdate="0"/>
    <default expression="" field="qualglocz" applyOnUpdate="0"/>
    <default expression="to_date(now())" field="datemaj" applyOnUpdate="0"/>
    <default expression="" field="sourmaj" applyOnUpdate="0"/>
    <default expression="" field="qualannee" applyOnUpdate="0"/>
    <default expression="" field="dategeoloc" applyOnUpdate="0"/>
    <default expression="" field="sourgeoloc" applyOnUpdate="0"/>
    <default expression="" field="sourattrib" applyOnUpdate="0"/>
    <default expression="''" field="_observation" applyOnUpdate="0"/>
  </defaults>
  <constraints>
    <constraint unique_strength="1" exp_strength="0" notnull_strength="1" constraints="3" field="id"/>
    <constraint unique_strength="1" exp_strength="0" notnull_strength="1" constraints="3" field="idcana"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="1" constraints="1" field="mouvrage"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="1" constraints="1" field="gexploit"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="1" constraints="1" field="enservice"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="1" constraints="1" field="branchemnt"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="1" constraints="1" field="materiau"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="1" constraints="1" field="diametre"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="1" constraints="1" field="anfinpose"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="1" constraints="1" field="modecirc"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="1" constraints="1" field="contcanaep"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="1" constraints="1" field="fonccanaep"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="2" constraints="1" field="idnini"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="2" constraints="1" field="idnterm"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="0" constraints="0" field="idcanppale"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="0" constraints="0" field="profgen"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="0" constraints="0" field="andebpose"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="0" constraints="0" field="longcana"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="0" constraints="0" field="_longcana_cm"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="0" constraints="0" field="_longcana_reelle"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="0" constraints="0" field="nbranche"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="1" constraints="1" field="qualglocxy"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="1" constraints="1" field="qualglocz"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="2" constraints="1" field="datemaj"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="1" constraints="1" field="sourmaj"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="0" constraints="0" field="qualannee"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="0" constraints="0" field="dategeoloc"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="0" constraints="0" field="sourgeoloc"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="0" constraints="0" field="sourattrib"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="0" constraints="0" field="_observation"/>
  </constraints>
  <constraintExpressions>
    <constraint desc="" field="id" exp=""/>
    <constraint desc="" field="idcana" exp=""/>
    <constraint desc="" field="mouvrage" exp=""/>
    <constraint desc="" field="gexploit" exp=""/>
    <constraint desc="" field="enservice" exp=""/>
    <constraint desc="" field="branchemnt" exp=""/>
    <constraint desc="" field="materiau" exp=""/>
    <constraint desc="" field="diametre" exp=""/>
    <constraint desc="" field="anfinpose" exp=""/>
    <constraint desc="" field="modecirc" exp=""/>
    <constraint desc="" field="contcanaep" exp=""/>
    <constraint desc="" field="fonccanaep" exp=""/>
    <constraint desc="" field="idnini" exp=""/>
    <constraint desc="" field="idnterm" exp=""/>
    <constraint desc="" field="idcanppale" exp=""/>
    <constraint desc="" field="profgen" exp=""/>
    <constraint desc="" field="andebpose" exp=""/>
    <constraint desc="" field="longcana" exp=""/>
    <constraint desc="" field="_longcana_cm" exp=""/>
    <constraint desc="" field="_longcana_reelle" exp=""/>
    <constraint desc="" field="nbranche" exp=""/>
    <constraint desc="" field="qualglocxy" exp=""/>
    <constraint desc="" field="qualglocz" exp=""/>
    <constraint desc="" field="datemaj" exp=""/>
    <constraint desc="" field="sourmaj" exp=""/>
    <constraint desc="" field="qualannee" exp=""/>
    <constraint desc="" field="dategeoloc" exp=""/>
    <constraint desc="" field="sourgeoloc" exp=""/>
    <constraint desc="" field="sourattrib" exp=""/>
    <constraint desc="" field="_observation" exp=""/>
  </constraintExpressions>
  <expressionfields/>
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
    <attributeEditorContainer name="Canalisation d'assainissement" groupBox="0" visibilityExpressionEnabled="0" columnCount="1" visibilityExpression="" showLabel="1">
      <attributeEditorContainer name="Général" groupBox="1" visibilityExpressionEnabled="0" columnCount="1" visibilityExpression="" showLabel="1">
        <attributeEditorField name="id" index="0" showLabel="1"/>
        <attributeEditorField name="idcana" index="1" showLabel="1"/>
        <attributeEditorField name="typreseau" index="-1" showLabel="1"/>
        <attributeEditorField name="contcanaep" index="10" showLabel="1"/>
        <attributeEditorField name="fonccanaep" index="11" showLabel="1"/>
        <attributeEditorField name="modecirc" index="9" showLabel="1"/>
        <attributeEditorField name="materiau" index="6" showLabel="1"/>
        <attributeEditorField name="branchemnt" index="5" showLabel="1"/>
        <attributeEditorField name="nbranche" index="20" showLabel="1"/>
        <attributeEditorField name="_observation" index="29" showLabel="1"/>
      </attributeEditorContainer>
      <attributeEditorContainer name="Technique" groupBox="1" visibilityExpressionEnabled="0" columnCount="1" visibilityExpression="" showLabel="1">
        <attributeEditorField name="longcana" index="17" showLabel="1"/>
        <attributeEditorField name="_longcana_cm" index="18" showLabel="1"/>
        <attributeEditorField name="_longcana_reelle" index="19" showLabel="1"/>
        <attributeEditorField name="diametre" index="7" showLabel="1"/>
        <attributeEditorField name="sensecoul" index="-1" showLabel="1"/>
      </attributeEditorContainer>
      <attributeEditorContainer name="Relations" groupBox="1" visibilityExpressionEnabled="0" columnCount="1" visibilityExpression="" showLabel="1">
        <attributeEditorField name="zamont" index="-1" showLabel="1"/>
        <attributeEditorField name="zaval" index="-1" showLabel="1"/>
        <attributeEditorField name="idnini" index="12" showLabel="1"/>
        <attributeEditorField name="idnterm" index="13" showLabel="1"/>
        <attributeEditorField name="idcanppale" index="14" showLabel="1"/>
      </attributeEditorContainer>
      <attributeEditorContainer name="Historique" groupBox="1" visibilityExpressionEnabled="0" columnCount="1" visibilityExpression="" showLabel="1">
        <attributeEditorField name="mouvrage" index="2" showLabel="1"/>
        <attributeEditorField name="gexploit" index="3" showLabel="1"/>
        <attributeEditorField name="anfinpose" index="8" showLabel="1"/>
        <attributeEditorField name="andebpose" index="16" showLabel="1"/>
      </attributeEditorContainer>
      <attributeEditorContainer name="Métadonnées" groupBox="1" visibilityExpressionEnabled="0" columnCount="1" visibilityExpression="" showLabel="1">
        <attributeEditorField name="qualglocxy" index="21" showLabel="1"/>
        <attributeEditorField name="qualglocz" index="22" showLabel="1"/>
        <attributeEditorField name="datemaj" index="23" showLabel="1"/>
        <attributeEditorField name="sourmaj" index="24" showLabel="1"/>
        <attributeEditorField name="qualannee" index="25" showLabel="1"/>
        <attributeEditorField name="dategeoloc" index="26" showLabel="1"/>
        <attributeEditorField name="sourgeoloc" index="27" showLabel="1"/>
        <attributeEditorField name="sourattrib" index="28" showLabel="1"/>
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
    <field name="idcana" editable="1"/>
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
  <layerGeometryType>1</layerGeometryType>
</qgis>
