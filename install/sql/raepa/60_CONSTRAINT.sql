--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.16
-- Dumped by pg_dump version 9.6.16

SET statement_timeout = 0;
SET lock_timeout = 0;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

-- _val_raepa_etat_canal_ass _val_raepa_etat_canal_ass_pkey
ALTER TABLE ONLY raepa._val_raepa_etat_canal_ass
    ADD CONSTRAINT _val_raepa_etat_canal_ass_pkey PRIMARY KEY (code);


-- _val_raepa_forme_canal_ass _val_raepa_forme_canal_ass_pkey
ALTER TABLE ONLY raepa._val_raepa_forme_canal_ass
    ADD CONSTRAINT _val_raepa_forme_canal_ass_pkey PRIMARY KEY (code);


-- _val_raepa_precision_annee _val_raepa_precision_annee_pkey
ALTER TABLE ONLY raepa._val_raepa_precision_annee
    ADD CONSTRAINT _val_raepa_precision_annee_pkey PRIMARY KEY (code);


-- _val_raepa_type_intervention_ass _val_raepa_type_intervention_ass_pkey
ALTER TABLE ONLY raepa._val_raepa_type_intervention_ass
    ADD CONSTRAINT _val_raepa_type_intervention_ass_pkey PRIMARY KEY (code);


-- affleurant_pcrs affleurant_pcrs_pkey
ALTER TABLE ONLY raepa.affleurant_pcrs
    ADD CONSTRAINT affleurant_pcrs_pkey PRIMARY KEY (idaffleurant);


-- commune commune_pkey
ALTER TABLE ONLY raepa.commune
    ADD CONSTRAINT commune_pkey PRIMARY KEY (codeinsee);


-- raepa_apparaep_p raepa_apparaep_p_idappareil_key
ALTER TABLE ONLY raepa.raepa_apparaep_p
    ADD CONSTRAINT raepa_apparaep_p_idappareil_key UNIQUE (idappareil);


-- raepa_apparaep_p raepa_apparaep_p_pkey
ALTER TABLE ONLY raepa.raepa_apparaep_p
    ADD CONSTRAINT raepa_apparaep_p_pkey PRIMARY KEY (id);


-- raepa_apparass_p raepa_apparass_p_idappareil_key
ALTER TABLE ONLY raepa.raepa_apparass_p
    ADD CONSTRAINT raepa_apparass_p_idappareil_key UNIQUE (idappareil);


-- raepa_apparass_p raepa_apparass_p_pkey
ALTER TABLE ONLY raepa.raepa_apparass_p
    ADD CONSTRAINT raepa_apparass_p_pkey PRIMARY KEY (id);


-- raepa_canalaep_l raepa_canalaep_l_idcana_key
ALTER TABLE ONLY raepa.raepa_canalaep_l
    ADD CONSTRAINT raepa_canalaep_l_idcana_key UNIQUE (idcana);


-- raepa_canalaep_l raepa_canalaep_l_pkey
ALTER TABLE ONLY raepa.raepa_canalaep_l
    ADD CONSTRAINT raepa_canalaep_l_pkey PRIMARY KEY (id);


-- raepa_canalass_l raepa_canalass_l_idcana_key
ALTER TABLE ONLY raepa.raepa_canalass_l
    ADD CONSTRAINT raepa_canalass_l_idcana_key UNIQUE (idcana);


-- raepa_canalass_l raepa_canalass_l_pkey
ALTER TABLE ONLY raepa.raepa_canalass_l
    ADD CONSTRAINT raepa_canalass_l_pkey PRIMARY KEY (id);


-- raepa_ouvraep_p raepa_ouvraep_p_idouvrage_key
ALTER TABLE ONLY raepa.raepa_ouvraep_p
    ADD CONSTRAINT raepa_ouvraep_p_idouvrage_key UNIQUE (idouvrage);


-- raepa_ouvraep_p raepa_ouvraep_p_pkey
ALTER TABLE ONLY raepa.raepa_ouvraep_p
    ADD CONSTRAINT raepa_ouvraep_p_pkey PRIMARY KEY (id);


-- raepa_ouvrass_p raepa_ouvrass_p_idouvrage_key
ALTER TABLE ONLY raepa.raepa_ouvrass_p
    ADD CONSTRAINT raepa_ouvrass_p_idouvrage_key UNIQUE (idouvrage);


-- raepa_ouvrass_p raepa_ouvrass_p_pkey
ALTER TABLE ONLY raepa.raepa_ouvrass_p
    ADD CONSTRAINT raepa_ouvrass_p_pkey PRIMARY KEY (id);


-- raepa_reparaep_p raepa_reparaep_p_idrepar_key
ALTER TABLE ONLY raepa.raepa_reparaep_p
    ADD CONSTRAINT raepa_reparaep_p_idrepar_key UNIQUE (idrepar);


-- raepa_reparaep_p raepa_reparaep_p_pkey
ALTER TABLE ONLY raepa.raepa_reparaep_p
    ADD CONSTRAINT raepa_reparaep_p_pkey PRIMARY KEY (id);


-- raepa_reparass_p raepa_reparass_p_idrepar_key
ALTER TABLE ONLY raepa.raepa_reparass_p
    ADD CONSTRAINT raepa_reparass_p_idrepar_key UNIQUE (idrepar);


-- raepa_reparass_p raepa_reparass_p_pkey
ALTER TABLE ONLY raepa.raepa_reparass_p
    ADD CONSTRAINT raepa_reparass_p_pkey PRIMARY KEY (id);


-- sys_liste_table sys_liste_table_pkey
ALTER TABLE ONLY raepa.sys_liste_table
    ADD CONSTRAINT sys_liste_table_pkey PRIMARY KEY (id);


-- sys_organisme_gestionnaire sys_organisme_gestionnaire_pkey
ALTER TABLE ONLY raepa.sys_organisme_gestionnaire
    ADD CONSTRAINT sys_organisme_gestionnaire_pkey PRIMARY KEY (id);


-- sys_structure_metadonnee sys_structure_metadonnee_pkey
ALTER TABLE ONLY raepa.sys_structure_metadonnee
    ADD CONSTRAINT sys_structure_metadonnee_pkey PRIMARY KEY (id);


-- val_raepa_cat_canal_ae val_raepa_cat_canal_ae_pkey
ALTER TABLE ONLY raepa.val_raepa_cat_canal_ae
    ADD CONSTRAINT val_raepa_cat_canal_ae_pkey PRIMARY KEY (code);


-- val_raepa_cat_canal_ass val_raepa_cat_canal_ass_pkey
ALTER TABLE ONLY raepa.val_raepa_cat_canal_ass
    ADD CONSTRAINT val_raepa_cat_canal_ass_pkey PRIMARY KEY (code);


-- val_raepa_fonc_app_ae val_raepa_fonc_app_ae_pkey
ALTER TABLE ONLY raepa.val_raepa_fonc_app_ae
    ADD CONSTRAINT val_raepa_fonc_app_ae_pkey PRIMARY KEY (code);


-- val_raepa_fonc_app_ass val_raepa_fonc_app_ass_pkey
ALTER TABLE ONLY raepa.val_raepa_fonc_app_ass
    ADD CONSTRAINT val_raepa_fonc_app_ass_pkey PRIMARY KEY (code);


-- val_raepa_fonc_canal_ae val_raepa_fonc_canal_ae_pkey
ALTER TABLE ONLY raepa.val_raepa_fonc_canal_ae
    ADD CONSTRAINT val_raepa_fonc_canal_ae_pkey PRIMARY KEY (code);


-- val_raepa_fonc_canal_ass val_raepa_fonc_canal_ass_pkey
ALTER TABLE ONLY raepa.val_raepa_fonc_canal_ass
    ADD CONSTRAINT val_raepa_fonc_canal_ass_pkey PRIMARY KEY (code);


-- val_raepa_fonc_ouv_ae val_raepa_fonc_ouv_ae_pkey
ALTER TABLE ONLY raepa.val_raepa_fonc_ouv_ae
    ADD CONSTRAINT val_raepa_fonc_ouv_ae_pkey PRIMARY KEY (code);


-- val_raepa_fonc_ouv_ass val_raepa_fonc_ouv_ass_pkey
ALTER TABLE ONLY raepa.val_raepa_fonc_ouv_ass
    ADD CONSTRAINT val_raepa_fonc_ouv_ass_pkey PRIMARY KEY (code);


-- val_raepa_materiau val_raepa_materiau_pkey
ALTER TABLE ONLY raepa.val_raepa_materiau
    ADD CONSTRAINT val_raepa_materiau_pkey PRIMARY KEY (code);


-- val_raepa_mode_circulation val_raepa_mode_circulation_pkey
ALTER TABLE ONLY raepa.val_raepa_mode_circulation
    ADD CONSTRAINT val_raepa_mode_circulation_pkey PRIMARY KEY (code);


-- val_raepa_qualite_anpose val_raepa_qualite_anpose_pkey
ALTER TABLE ONLY raepa.val_raepa_qualite_anpose
    ADD CONSTRAINT val_raepa_qualite_anpose_pkey PRIMARY KEY (code);


-- val_raepa_qualite_geoloc val_raepa_qualite_geoloc_pkey
ALTER TABLE ONLY raepa.val_raepa_qualite_geoloc
    ADD CONSTRAINT val_raepa_qualite_geoloc_pkey PRIMARY KEY (code);


-- val_raepa_support_reparation val_raepa_support_reparation_pkey
ALTER TABLE ONLY raepa.val_raepa_support_reparation
    ADD CONSTRAINT val_raepa_support_reparation_pkey PRIMARY KEY (code);


-- val_raepa_typ_reseau_ass val_raepa_typ_reseau_ass_pkey
ALTER TABLE ONLY raepa.val_raepa_typ_reseau_ass
    ADD CONSTRAINT val_raepa_typ_reseau_ass_pkey PRIMARY KEY (code);


-- val_raepa_type_defaillance val_raepa_type_defaillance_pkey
ALTER TABLE ONLY raepa.val_raepa_type_defaillance
    ADD CONSTRAINT val_raepa_type_defaillance_pkey PRIMARY KEY (code);


-- affleurant_pcrs affleurant_pcrs_qualglocxy_fkey
ALTER TABLE ONLY raepa.affleurant_pcrs
    ADD CONSTRAINT affleurant_pcrs_qualglocxy_fkey FOREIGN KEY (qualglocxy) REFERENCES raepa.val_raepa_qualite_geoloc(code);


-- affleurant_pcrs affleurant_pcrs_qualglocz_fkey
ALTER TABLE ONLY raepa.affleurant_pcrs
    ADD CONSTRAINT affleurant_pcrs_qualglocz_fkey FOREIGN KEY (qualglocz) REFERENCES raepa.val_raepa_qualite_geoloc(code);


-- raepa_apparaep_p raepa_apparaep_p_fnappaep_fkey
ALTER TABLE ONLY raepa.raepa_apparaep_p
    ADD CONSTRAINT raepa_apparaep_p_fnappaep_fkey FOREIGN KEY (fnappaep) REFERENCES raepa.val_raepa_fonc_app_ae(code);


-- raepa_apparaep_p raepa_apparaep_p_qualannee_fkey
ALTER TABLE ONLY raepa.raepa_apparaep_p
    ADD CONSTRAINT raepa_apparaep_p_qualannee_fkey FOREIGN KEY (qualannee) REFERENCES raepa.val_raepa_qualite_anpose(code);


-- raepa_apparaep_p raepa_apparaep_p_qualglocxy_fkey
ALTER TABLE ONLY raepa.raepa_apparaep_p
    ADD CONSTRAINT raepa_apparaep_p_qualglocxy_fkey FOREIGN KEY (qualglocxy) REFERENCES raepa.val_raepa_qualite_geoloc(code);


-- raepa_apparaep_p raepa_apparaep_p_qualglocz_fkey
ALTER TABLE ONLY raepa.raepa_apparaep_p
    ADD CONSTRAINT raepa_apparaep_p_qualglocz_fkey FOREIGN KEY (qualglocz) REFERENCES raepa.val_raepa_qualite_geoloc(code);


-- raepa_apparass_p raepa_apparass_p_fnappass_fkey
ALTER TABLE ONLY raepa.raepa_apparass_p
    ADD CONSTRAINT raepa_apparass_p_fnappass_fkey FOREIGN KEY (fnappass) REFERENCES raepa.val_raepa_fonc_app_ass(code);


-- raepa_apparass_p raepa_apparass_p_idcanppale_fkey
ALTER TABLE ONLY raepa.raepa_apparass_p
    ADD CONSTRAINT raepa_apparass_p_idcanppale_fkey FOREIGN KEY (idcanppale) REFERENCES raepa.raepa_canalass_l(idcana);


-- raepa_apparass_p raepa_apparass_p_idouvrage_fkey
ALTER TABLE ONLY raepa.raepa_apparass_p
    ADD CONSTRAINT raepa_apparass_p_idouvrage_fkey FOREIGN KEY (idouvrage) REFERENCES raepa.raepa_ouvrass_p(idouvrage);


-- raepa_apparass_p raepa_apparass_p_qualannee_fkey
ALTER TABLE ONLY raepa.raepa_apparass_p
    ADD CONSTRAINT raepa_apparass_p_qualannee_fkey FOREIGN KEY (qualannee) REFERENCES raepa.val_raepa_qualite_anpose(code);


-- raepa_apparass_p raepa_apparass_p_qualglocxy_fkey
ALTER TABLE ONLY raepa.raepa_apparass_p
    ADD CONSTRAINT raepa_apparass_p_qualglocxy_fkey FOREIGN KEY (qualglocxy) REFERENCES raepa.val_raepa_qualite_geoloc(code);


-- raepa_apparass_p raepa_apparass_p_qualglocz_fkey
ALTER TABLE ONLY raepa.raepa_apparass_p
    ADD CONSTRAINT raepa_apparass_p_qualglocz_fkey FOREIGN KEY (qualglocz) REFERENCES raepa.val_raepa_qualite_geoloc(code);


-- raepa_apparass_p raepa_apparass_p_typreseau_fkey
ALTER TABLE ONLY raepa.raepa_apparass_p
    ADD CONSTRAINT raepa_apparass_p_typreseau_fkey FOREIGN KEY (typreseau) REFERENCES raepa.val_raepa_typ_reseau_ass(code);


-- raepa_canalaep_l raepa_canalaep_l_contcanaep_fkey
ALTER TABLE ONLY raepa.raepa_canalaep_l
    ADD CONSTRAINT raepa_canalaep_l_contcanaep_fkey FOREIGN KEY (contcanaep) REFERENCES raepa.val_raepa_cat_canal_ae(code);


-- raepa_canalaep_l raepa_canalaep_l_fonccanaep_fkey
ALTER TABLE ONLY raepa.raepa_canalaep_l
    ADD CONSTRAINT raepa_canalaep_l_fonccanaep_fkey FOREIGN KEY (fonccanaep) REFERENCES raepa.val_raepa_fonc_canal_ae(code);


-- raepa_canalaep_l raepa_canalaep_l_materiau_fkey
ALTER TABLE ONLY raepa.raepa_canalaep_l
    ADD CONSTRAINT raepa_canalaep_l_materiau_fkey FOREIGN KEY (materiau) REFERENCES raepa.val_raepa_materiau(code);


-- raepa_canalaep_l raepa_canalaep_l_modecirc_fkey
ALTER TABLE ONLY raepa.raepa_canalaep_l
    ADD CONSTRAINT raepa_canalaep_l_modecirc_fkey FOREIGN KEY (modecirc) REFERENCES raepa.val_raepa_mode_circulation(code);


-- raepa_canalaep_l raepa_canalaep_l_qualannee_fkey
ALTER TABLE ONLY raepa.raepa_canalaep_l
    ADD CONSTRAINT raepa_canalaep_l_qualannee_fkey FOREIGN KEY (qualannee) REFERENCES raepa.val_raepa_qualite_anpose(code);


-- raepa_canalaep_l raepa_canalaep_l_qualglocxy_fkey
ALTER TABLE ONLY raepa.raepa_canalaep_l
    ADD CONSTRAINT raepa_canalaep_l_qualglocxy_fkey FOREIGN KEY (qualglocxy) REFERENCES raepa.val_raepa_qualite_geoloc(code);


-- raepa_canalaep_l raepa_canalaep_l_qualglocz_fkey
ALTER TABLE ONLY raepa.raepa_canalaep_l
    ADD CONSTRAINT raepa_canalaep_l_qualglocz_fkey FOREIGN KEY (qualglocz) REFERENCES raepa.val_raepa_qualite_geoloc(code);


-- raepa_canalass_l raepa_canalass_l__etat_fkey
ALTER TABLE ONLY raepa.raepa_canalass_l
    ADD CONSTRAINT raepa_canalass_l__etat_fkey FOREIGN KEY (_etat) REFERENCES raepa._val_raepa_etat_canal_ass(code);


-- raepa_canalass_l raepa_canalass_l__forme_fkey
ALTER TABLE ONLY raepa.raepa_canalass_l
    ADD CONSTRAINT raepa_canalass_l__forme_fkey FOREIGN KEY (_forme) REFERENCES raepa._val_raepa_forme_canal_ass(code);


-- raepa_canalass_l raepa_canalass_l__precisionannee_fkey
ALTER TABLE ONLY raepa.raepa_canalass_l
    ADD CONSTRAINT raepa_canalass_l__precisionannee_fkey FOREIGN KEY (_precisionannee) REFERENCES raepa._val_raepa_precision_annee(code);


-- raepa_canalass_l raepa_canalass_l_contcanass_fkey
ALTER TABLE ONLY raepa.raepa_canalass_l
    ADD CONSTRAINT raepa_canalass_l_contcanass_fkey FOREIGN KEY (contcanass) REFERENCES raepa.val_raepa_cat_canal_ass(code);


-- raepa_canalass_l raepa_canalass_l_fonccanass_fkey
ALTER TABLE ONLY raepa.raepa_canalass_l
    ADD CONSTRAINT raepa_canalass_l_fonccanass_fkey FOREIGN KEY (fonccanass) REFERENCES raepa.val_raepa_fonc_canal_ass(code);


-- raepa_canalass_l raepa_canalass_l_idnini_fkey
ALTER TABLE ONLY raepa.raepa_canalass_l
    ADD CONSTRAINT raepa_canalass_l_idnini_fkey FOREIGN KEY (idnini) REFERENCES raepa.raepa_ouvrass_p(idouvrage);


-- raepa_canalass_l raepa_canalass_l_idnterm_fkey
ALTER TABLE ONLY raepa.raepa_canalass_l
    ADD CONSTRAINT raepa_canalass_l_idnterm_fkey FOREIGN KEY (idnterm) REFERENCES raepa.raepa_ouvrass_p(idouvrage);


-- raepa_canalass_l raepa_canalass_l_materiau_fkey
ALTER TABLE ONLY raepa.raepa_canalass_l
    ADD CONSTRAINT raepa_canalass_l_materiau_fkey FOREIGN KEY (materiau) REFERENCES raepa.val_raepa_materiau(code);


-- raepa_canalass_l raepa_canalass_l_modecirc_fkey
ALTER TABLE ONLY raepa.raepa_canalass_l
    ADD CONSTRAINT raepa_canalass_l_modecirc_fkey FOREIGN KEY (modecirc) REFERENCES raepa.val_raepa_mode_circulation(code);


-- raepa_canalass_l raepa_canalass_l_qualannee_fkey
ALTER TABLE ONLY raepa.raepa_canalass_l
    ADD CONSTRAINT raepa_canalass_l_qualannee_fkey FOREIGN KEY (qualannee) REFERENCES raepa.val_raepa_qualite_anpose(code);


-- raepa_canalass_l raepa_canalass_l_qualglocxy_fkey
ALTER TABLE ONLY raepa.raepa_canalass_l
    ADD CONSTRAINT raepa_canalass_l_qualglocxy_fkey FOREIGN KEY (qualglocxy) REFERENCES raepa.val_raepa_qualite_geoloc(code);


-- raepa_canalass_l raepa_canalass_l_qualglocz_fkey
ALTER TABLE ONLY raepa.raepa_canalass_l
    ADD CONSTRAINT raepa_canalass_l_qualglocz_fkey FOREIGN KEY (qualglocz) REFERENCES raepa.val_raepa_qualite_geoloc(code);


-- raepa_canalass_l raepa_canalass_l_typreseau_fkey
ALTER TABLE ONLY raepa.raepa_canalass_l
    ADD CONSTRAINT raepa_canalass_l_typreseau_fkey FOREIGN KEY (typreseau) REFERENCES raepa.val_raepa_typ_reseau_ass(code);


-- raepa_ouvraep_p raepa_ouvraep_p_fnouvaep_fkey
ALTER TABLE ONLY raepa.raepa_ouvraep_p
    ADD CONSTRAINT raepa_ouvraep_p_fnouvaep_fkey FOREIGN KEY (fnouvaep) REFERENCES raepa.val_raepa_fonc_ouv_ae(code);


-- raepa_ouvraep_p raepa_ouvraep_p_qualannee_fkey
ALTER TABLE ONLY raepa.raepa_ouvraep_p
    ADD CONSTRAINT raepa_ouvraep_p_qualannee_fkey FOREIGN KEY (qualannee) REFERENCES raepa.val_raepa_qualite_anpose(code);


-- raepa_ouvraep_p raepa_ouvraep_p_qualglocxy_fkey
ALTER TABLE ONLY raepa.raepa_ouvraep_p
    ADD CONSTRAINT raepa_ouvraep_p_qualglocxy_fkey FOREIGN KEY (qualglocxy) REFERENCES raepa.val_raepa_qualite_geoloc(code);


-- raepa_ouvraep_p raepa_ouvraep_p_qualglocz_fkey
ALTER TABLE ONLY raepa.raepa_ouvraep_p
    ADD CONSTRAINT raepa_ouvraep_p_qualglocz_fkey FOREIGN KEY (qualglocz) REFERENCES raepa.val_raepa_qualite_geoloc(code);


-- raepa_ouvrass_p raepa_ouvrass_p_fnouvass_fkey
ALTER TABLE ONLY raepa.raepa_ouvrass_p
    ADD CONSTRAINT raepa_ouvrass_p_fnouvass_fkey FOREIGN KEY (fnouvass) REFERENCES raepa.val_raepa_fonc_ouv_ass(code);


-- raepa_ouvrass_p raepa_ouvrass_p_idcanppale_fkey
ALTER TABLE ONLY raepa.raepa_ouvrass_p
    ADD CONSTRAINT raepa_ouvrass_p_idcanppale_fkey FOREIGN KEY (idcanppale) REFERENCES raepa.raepa_canalass_l(idcana);


-- raepa_ouvrass_p raepa_ouvrass_p_qualannee_fkey
ALTER TABLE ONLY raepa.raepa_ouvrass_p
    ADD CONSTRAINT raepa_ouvrass_p_qualannee_fkey FOREIGN KEY (qualannee) REFERENCES raepa.val_raepa_qualite_anpose(code);


-- raepa_ouvrass_p raepa_ouvrass_p_qualglocxy_fkey
ALTER TABLE ONLY raepa.raepa_ouvrass_p
    ADD CONSTRAINT raepa_ouvrass_p_qualglocxy_fkey FOREIGN KEY (qualglocxy) REFERENCES raepa.val_raepa_qualite_geoloc(code);


-- raepa_ouvrass_p raepa_ouvrass_p_qualglocz_fkey
ALTER TABLE ONLY raepa.raepa_ouvrass_p
    ADD CONSTRAINT raepa_ouvrass_p_qualglocz_fkey FOREIGN KEY (qualglocz) REFERENCES raepa.val_raepa_qualite_geoloc(code);


-- raepa_ouvrass_p raepa_ouvrass_p_typreseau_fkey
ALTER TABLE ONLY raepa.raepa_ouvrass_p
    ADD CONSTRAINT raepa_ouvrass_p_typreseau_fkey FOREIGN KEY (typreseau) REFERENCES raepa.val_raepa_typ_reseau_ass(code);


-- raepa_reparaep_p raepa_reparaep_p_defreparee_fkey
ALTER TABLE ONLY raepa.raepa_reparaep_p
    ADD CONSTRAINT raepa_reparaep_p_defreparee_fkey FOREIGN KEY (defreparee) REFERENCES raepa.val_raepa_type_defaillance(code);


-- raepa_reparaep_p raepa_reparaep_p_supprepare_fkey
ALTER TABLE ONLY raepa.raepa_reparaep_p
    ADD CONSTRAINT raepa_reparaep_p_supprepare_fkey FOREIGN KEY (supprepare) REFERENCES raepa.val_raepa_support_reparation(code);


-- raepa_reparass_p raepa_reparass_p__etatcanalisation_fkey
ALTER TABLE ONLY raepa.raepa_reparass_p
    ADD CONSTRAINT raepa_reparass_p__etatcanalisation_fkey FOREIGN KEY (_etatcanalisation) REFERENCES raepa._val_raepa_etat_canal_ass(code);


-- raepa_reparass_p raepa_reparass_p__typeintervention_fkey
ALTER TABLE ONLY raepa.raepa_reparass_p
    ADD CONSTRAINT raepa_reparass_p__typeintervention_fkey FOREIGN KEY (_typeintervention) REFERENCES raepa._val_raepa_type_intervention_ass(code);


-- raepa_reparass_p raepa_reparass_p_defreparee_fkey
ALTER TABLE ONLY raepa.raepa_reparass_p
    ADD CONSTRAINT raepa_reparass_p_defreparee_fkey FOREIGN KEY (defreparee) REFERENCES raepa.val_raepa_type_defaillance(code);


-- raepa_reparass_p raepa_reparass_p_supprepare_fkey
ALTER TABLE ONLY raepa.raepa_reparass_p
    ADD CONSTRAINT raepa_reparass_p_supprepare_fkey FOREIGN KEY (supprepare) REFERENCES raepa.val_raepa_support_reparation(code);


--
-- PostgreSQL database dump complete
--

