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
    <field name="_dimensionhorizontale">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="_forme">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option name="AllowMulti" value="false" type="bool"/>
            <Option name="AllowNull" value="true" type="bool"/>
            <Option name="FilterExpression" value="" type="QString"/>
            <Option name="Key" value="" type="QString"/>
            <Option name="LayerName" value="" type="QString"/>
            <Option name="NofColumns" value="1" type="int"/>
            <Option name="OrderByValue" value="true" type="bool"/>
            <Option name="UseCompleter" value="false" type="bool"/>
            <Option name="Value" value="" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="_etat">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option name="AllowMulti" value="false" type="bool"/>
            <Option name="AllowNull" value="true" type="bool"/>
            <Option name="FilterExpression" value="" type="QString"/>
            <Option name="Key" value="" type="QString"/>
            <Option name="LayerName" value="" type="QString"/>
            <Option name="NofColumns" value="1" type="int"/>
            <Option name="OrderByValue" value="true" type="bool"/>
            <Option name="UseCompleter" value="false" type="bool"/>
            <Option name="Value" value="" type="QString"/>
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
    <field name="contcanass">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option name="AllowMulti" value="false" type="bool"/>
            <Option name="AllowNull" value="true" type="bool"/>
            <Option name="FilterExpression" value="" type="QString"/>
            <Option name="Key" value="code" type="QString"/>
            <Option name="LayerName" value="val_raepa_cat_canal_ass" type="QString"/>
            <Option name="NofColumns" value="1" type="int"/>
            <Option name="OrderByValue" value="true" type="bool"/>
            <Option name="UseCompleter" value="false" type="bool"/>
            <Option name="Value" value="libelle" type="QString"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="fonccanass">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option name="AllowMulti" value="false" type="bool"/>
            <Option name="AllowNull" value="true" type="bool"/>
            <Option name="FilterExpression" value="" type="QString"/>
            <Option name="Key" value="code" type="QString"/>
            <Option name="LayerName" value="val_raepa_fonc_canal_ass" type="QString"/>
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
    <field name="zamont">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="zaval">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="sensecoul">
      <editWidget type="CheckBox">
        <config>
          <Option type="Map">
            <Option name="CheckedState" value="1" type="QString"/>
            <Option name="UncheckedState" value="0" type="QString"/>
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
    <field name="_precisionannee">
      <editWidget type="ValueRelation">
        <config>
          <Option type="Map">
            <Option name="AllowMulti" value="false" type="bool"/>
            <Option name="AllowNull" value="true" type="bool"/>
            <Option name="FilterExpression" value="" type="QString"/>
            <Option name="Key" value="code" type="QString"/>
            <Option name="LayerName" value="_val_raepa_precision_annee" type="QString"/>
            <Option name="NofColumns" value="1" type="int"/>
            <Option name="OrderByValue" value="true" type="bool"/>
            <Option name="UseCompleter" value="false" type="bool"/>
            <Option name="Value" value="libelle" type="QString"/>
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
    <field name="_pente">
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
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="_date_import">
      <editWidget type="TextEdit">
        <config>
          <Option type="Map">
            <Option name="IsMultiline" value="false" type="bool"/>
            <Option name="UseHtml" value="false" type="bool"/>
          </Option>
        </config>
      </editWidget>
    </field>
    <field name="_temp_data">
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
            <Option name="IsMultiline" value="false" type="bool"/>
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
    <alias name="Type du réseau" index="6" field="typreseau"/>
    <alias name="Matériau" index="7" field="materiau"/>
    <alias name="Diamètre nominal [mm]" index="8" field="diametre"/>
    <alias name="Diamètre nominal horizontal [mm]" index="9" field="_dimensionhorizontale"/>
    <alias name="Forme" index="10" field="_forme"/>
    <alias name="État" index="11" field="_etat"/>
    <alias name="Année de fin de pose" index="12" field="anfinpose"/>
    <alias name="Mode de circulation" index="13" field="modecirc"/>
    <alias name="Catégorie" index="14" field="contcanass"/>
    <alias name="Fonction" index="15" field="fonccanass"/>
    <alias name="Noeud initial" index="16" field="idnini"/>
    <alias name="Noeud terminal" index="17" field="idnterm"/>
    <alias name="Canalisation principale" index="18" field="idcanppale"/>
    <alias name="Fil d’eau amont [m]" index="19" field="zamont"/>
    <alias name="Fil d’eau aval [m]" index="20" field="zaval"/>
    <alias name="Sens d’écoulement" index="21" field="sensecoul"/>
    <alias name="Année de début de pose" index="22" field="andebpose"/>
    <alias name="Précision des années" index="23" field="_precisionannee"/>
    <alias name="Longueur mesurée [m]" index="24" field="longcana"/>
    <alias name="Longueur projetée calculée [m]" index="25" field="_longcana_cm"/>
    <alias name="Longueur réelle calculée [m]" index="26" field="_longcana_reelle"/>
    <alias name="Pente calculée [%]" index="27" field="_pente"/>
    <alias name="Nombre de branchements" index="28" field="nbranche"/>
    <alias name="Qualité de la géolocalisation XY" index="29" field="qualglocxy"/>
    <alias name="Qualité de la géolocalisation Z" index="30" field="qualglocz"/>
    <alias name="Date de mise à jour" index="31" field="datemaj"/>
    <alias name="Source de la mise à jour" index="32" field="sourmaj"/>
    <alias name="Qualité de l’année de pose" index="33" field="qualannee"/>
    <alias name="Date de la géolocalisation" index="34" field="dategeoloc"/>
    <alias name="Auteur de la géolocalisation" index="35" field="sourgeoloc"/>
    <alias name="Auteur des données attributaires" index="36" field="sourattrib"/>
    <alias name="Source historique" index="37" field="_source_historique"/>
    <alias name="" index="38" field="_code_chantier"/>
    <alias name="" index="39" field="_date_import"/>
    <alias name="" index="40" field="_temp_data"/>
    <alias name="Observation" index="41" field="_observation"/>
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
    <default expression="" field="typreseau" applyOnUpdate="0"/>
    <default expression="" field="materiau" applyOnUpdate="0"/>
    <default expression="-1" field="diametre" applyOnUpdate="0"/>
    <default expression="" field="_dimensionhorizontale" applyOnUpdate="0"/>
    <default expression="" field="_forme" applyOnUpdate="0"/>
    <default expression="" field="_etat" applyOnUpdate="0"/>
    <default expression="year(now())" field="anfinpose" applyOnUpdate="0"/>
    <default expression="" field="modecirc" applyOnUpdate="0"/>
    <default expression="" field="contcanass" applyOnUpdate="0"/>
    <default expression="" field="fonccanass" applyOnUpdate="0"/>
    <default expression="'INCONNU'" field="idnini" applyOnUpdate="0"/>
    <default expression="'INCONNU'" field="idnterm" applyOnUpdate="0"/>
    <default expression="'INCONNU'" field="idcanppale" applyOnUpdate="0"/>
    <default expression="" field="zamont" applyOnUpdate="0"/>
    <default expression="" field="zaval" applyOnUpdate="0"/>
    <default expression="1" field="sensecoul" applyOnUpdate="0"/>
    <default expression="" field="andebpose" applyOnUpdate="0"/>
    <default expression="" field="_precisionannee" applyOnUpdate="0"/>
    <default expression="" field="longcana" applyOnUpdate="0"/>
    <default expression="" field="_longcana_cm" applyOnUpdate="0"/>
    <default expression="" field="_longcana_reelle" applyOnUpdate="0"/>
    <default expression="" field="_pente" applyOnUpdate="0"/>
    <default expression="" field="nbranche" applyOnUpdate="0"/>
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
    <default expression="" field="_temp_data" applyOnUpdate="0"/>
    <default expression="''" field="_observation" applyOnUpdate="0"/>
  </defaults>
  <constraints>
    <constraint unique_strength="1" exp_strength="0" notnull_strength="1" constraints="3" field="id"/>
    <constraint unique_strength="1" exp_strength="0" notnull_strength="1" constraints="3" field="idcana"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="1" constraints="1" field="mouvrage"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="1" constraints="1" field="gexploit"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="1" constraints="1" field="enservice"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="1" constraints="1" field="branchemnt"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="1" constraints="1" field="typreseau"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="1" constraints="1" field="materiau"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="1" constraints="1" field="diametre"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="0" constraints="0" field="_dimensionhorizontale"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="0" constraints="0" field="_forme"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="0" constraints="0" field="_etat"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="1" constraints="1" field="anfinpose"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="1" constraints="1" field="modecirc"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="1" constraints="1" field="contcanass"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="1" constraints="1" field="fonccanass"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="1" constraints="1" field="idnini"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="1" constraints="1" field="idnterm"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="0" constraints="0" field="idcanppale"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="0" constraints="0" field="zamont"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="0" constraints="0" field="zaval"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="0" constraints="0" field="sensecoul"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="0" constraints="0" field="andebpose"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="0" constraints="0" field="_precisionannee"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="0" constraints="0" field="longcana"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="0" constraints="0" field="_longcana_cm"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="0" constraints="0" field="_longcana_reelle"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="0" constraints="0" field="_pente"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="0" constraints="0" field="nbranche"/>
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
    <constraint unique_strength="0" exp_strength="0" notnull_strength="0" constraints="0" field="_temp_data"/>
    <constraint unique_strength="0" exp_strength="0" notnull_strength="0" constraints="0" field="_observation"/>
  </constraints>
  <constraintExpressions>
    <constraint desc="" field="id" exp=""/>
    <constraint desc="" field="idcana" exp=""/>
    <constraint desc="" field="mouvrage" exp=""/>
    <constraint desc="" field="gexploit" exp=""/>
    <constraint desc="" field="enservice" exp=""/>
    <constraint desc="" field="branchemnt" exp=""/>
    <constraint desc="" field="typreseau" exp=""/>
    <constraint desc="" field="materiau" exp=""/>
    <constraint desc="" field="diametre" exp=""/>
    <constraint desc="" field="_dimensionhorizontale" exp=""/>
    <constraint desc="" field="_forme" exp=""/>
    <constraint desc="" field="_etat" exp=""/>
    <constraint desc="" field="anfinpose" exp=""/>
    <constraint desc="" field="modecirc" exp=""/>
    <constraint desc="" field="contcanass" exp=""/>
    <constraint desc="" field="fonccanass" exp=""/>
    <constraint desc="" field="idnini" exp=""/>
    <constraint desc="" field="idnterm" exp=""/>
    <constraint desc="" field="idcanppale" exp=""/>
    <constraint desc="" field="zamont" exp=""/>
    <constraint desc="" field="zaval" exp=""/>
    <constraint desc="" field="sensecoul" exp=""/>
    <constraint desc="" field="andebpose" exp=""/>
    <constraint desc="" field="_precisionannee" exp=""/>
    <constraint desc="" field="longcana" exp=""/>
    <constraint desc="" field="_longcana_cm" exp=""/>
    <constraint desc="" field="_longcana_reelle" exp=""/>
    <constraint desc="" field="_pente" exp=""/>
    <constraint desc="" field="nbranche" exp=""/>
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
    <constraint desc="" field="_temp_data" exp=""/>
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
    <attributeEditorContainer visibilityExpressionEnabled="0" visibilityExpression="" groupBox="0" showLabel="1" columnCount="1" name="Canalisation d'assainissement">
      <attributeEditorContainer visibilityExpressionEnabled="0" visibilityExpression="" groupBox="1" showLabel="1" columnCount="1" name="Général">
        <attributeEditorField index="0" showLabel="1" name="id"/>
        <attributeEditorField index="1" showLabel="1" name="idcana"/>
        <attributeEditorField index="6" showLabel="1" name="typreseau"/>
        <attributeEditorField index="14" showLabel="1" name="contcanass"/>
        <attributeEditorField index="15" showLabel="1" name="fonccanass"/>
        <attributeEditorField index="13" showLabel="1" name="modecirc"/>
        <attributeEditorField index="7" showLabel="1" name="materiau"/>
        <attributeEditorField index="5" showLabel="1" name="branchemnt"/>
        <attributeEditorField index="28" showLabel="1" name="nbranche"/>
      </attributeEditorContainer>
      <attributeEditorContainer visibilityExpressionEnabled="0" visibilityExpression="" groupBox="1" showLabel="1" columnCount="1" name="Technique">
        <attributeEditorField index="24" showLabel="1" name="longcana"/>
        <attributeEditorField index="8" showLabel="1" name="diametre"/>
        <attributeEditorField index="21" showLabel="1" name="sensecoul"/>
      </attributeEditorContainer>
      <attributeEditorContainer visibilityExpressionEnabled="0" visibilityExpression="" groupBox="1" showLabel="1" columnCount="1" name="Relations">
        <attributeEditorField index="19" showLabel="1" name="zamont"/>
        <attributeEditorField index="20" showLabel="1" name="zaval"/>
        <attributeEditorField index="16" showLabel="1" name="idnini"/>
        <attributeEditorField index="17" showLabel="1" name="idnterm"/>
        <attributeEditorField index="18" showLabel="1" name="idcanppale"/>
      </attributeEditorContainer>
      <attributeEditorContainer visibilityExpressionEnabled="0" visibilityExpression="" groupBox="1" showLabel="1" columnCount="1" name="Historique">
        <attributeEditorField index="2" showLabel="1" name="mouvrage"/>
        <attributeEditorField index="3" showLabel="1" name="gexploit"/>
        <attributeEditorField index="12" showLabel="1" name="anfinpose"/>
        <attributeEditorField index="22" showLabel="1" name="andebpose"/>
      </attributeEditorContainer>
      <attributeEditorContainer visibilityExpressionEnabled="0" visibilityExpression="" groupBox="1" showLabel="1" columnCount="1" name="Métadonnées">
        <attributeEditorField index="29" showLabel="1" name="qualglocxy"/>
        <attributeEditorField index="30" showLabel="1" name="qualglocz"/>
        <attributeEditorField index="31" showLabel="1" name="datemaj"/>
        <attributeEditorField index="32" showLabel="1" name="sourmaj"/>
        <attributeEditorField index="33" showLabel="1" name="qualannee"/>
        <attributeEditorField index="34" showLabel="1" name="dategeoloc"/>
        <attributeEditorField index="35" showLabel="1" name="sourgeoloc"/>
        <attributeEditorField index="36" showLabel="1" name="sourattrib"/>
      </attributeEditorContainer>
    </attributeEditorContainer>
  </attributeEditorForm>
  <editable>
    <field editable="1" name="_code_chantier"/>
    <field editable="1" name="_commune"/>
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
    <field editable="1" name="contcanass"/>
    <field editable="1" name="dategeoloc"/>
    <field editable="1" name="datemaj"/>
    <field editable="1" name="diametre"/>
    <field editable="1" name="enservice"/>
    <field editable="1" name="fonccanass"/>
    <field editable="1" name="gexploit"/>
    <field editable="0" name="id"/>
    <field editable="1" name="idcana"/>
    <field editable="1" name="idcanppale"/>
    <field editable="1" name="idnini"/>
    <field editable="1" name="idnterm"/>
    <field editable="1" name="longcana"/>
    <field editable="1" name="materiau"/>
    <field editable="1" name="modecirc"/>
    <field editable="1" name="mouvrage"/>
    <field editable="1" name="nbranche"/>
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
    <field labelOnTop="0" name="_commune"/>
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
    <field labelOnTop="0" name="contcanass"/>
    <field labelOnTop="0" name="dategeoloc"/>
    <field labelOnTop="0" name="datemaj"/>
    <field labelOnTop="0" name="diametre"/>
    <field labelOnTop="0" name="enservice"/>
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
  <layerGeometryType>1</layerGeometryType>
</qgis>
