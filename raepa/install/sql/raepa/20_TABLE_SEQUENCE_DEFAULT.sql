--
-- PostgreSQL database dump
--

-- Dumped from database version 10.14 (Debian 10.14-1.pgdg100+1)
-- Dumped by pg_dump version 10.14 (Debian 10.14-1.pgdg100+1)

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

SET default_with_oids = false;

-- _val_raepa_etat_canal_ass
CREATE TABLE raepa._val_raepa_etat_canal_ass (
    code character varying(2) NOT NULL,
    libelle text NOT NULL,
    description text,
    ordre smallint
);


-- _val_raepa_etat_canal_ass
COMMENT ON TABLE raepa._val_raepa_etat_canal_ass IS 'Nomenclature pour l’état de la canalisation';


-- _val_raepa_forme_canal_ass
CREATE TABLE raepa._val_raepa_forme_canal_ass (
    code character varying(2) NOT NULL,
    libelle text NOT NULL,
    description text,
    ordre smallint
);


-- _val_raepa_forme_canal_ass
COMMENT ON TABLE raepa._val_raepa_forme_canal_ass IS 'Nomenclature pour la forme de la canalisation (ovoide, cylindrique, etc.)';


-- _val_raepa_precision_annee
CREATE TABLE raepa._val_raepa_precision_annee (
    code character varying(2) NOT NULL,
    libelle text NOT NULL,
    description text,
    ordre smallint
);


-- _val_raepa_precision_annee
COMMENT ON TABLE raepa._val_raepa_precision_annee IS 'Nomenclature pour la précision des années de fin et début de pose';


-- _val_raepa_type_intervention_ass
CREATE TABLE raepa._val_raepa_type_intervention_ass (
    code character varying(2) NOT NULL,
    libelle text NOT NULL,
    description text,
    ordre smallint
);


-- _val_raepa_type_intervention_ass
COMMENT ON TABLE raepa._val_raepa_type_intervention_ass IS 'Nomenclature pour le type d’intervention (curage préventif, inspection, etc.)';


-- affleurant_pcrs
CREATE TABLE raepa.affleurant_pcrs (
    idaffleurant character varying(254) NOT NULL,
    gexploit character varying(100) NOT NULL,
    reference text NOT NULL,
    anglerotaion double precision NOT NULL,
    longueur double precision NOT NULL,
    largeur double precision NOT NULL,
    codecouleur text,
    z numeric(6,3),
    qualglocxy character varying(2) NOT NULL,
    qualglocz character varying(2) NOT NULL,
    geom public.geometry(Point,2154) NOT NULL
);


-- affleurant_pcrs
COMMENT ON TABLE raepa.affleurant_pcrs IS 'Classe spécialisée permettant de décrire une partie d’un réseau existant visible depuis la surface';


-- affleurant_pcrs_id_seq
CREATE SEQUENCE raepa.affleurant_pcrs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- commune
CREATE TABLE raepa.commune (
    codeinsee text NOT NULL,
    anneecog date NOT NULL,
    nom text NOT NULL,
    geom public.geometry(MultiPolygon,2154) NOT NULL
);


-- commune
COMMENT ON TABLE raepa.commune IS 'Territoire où s’exerce la compétence d’un conseil municipal';


-- raepa_apparaep_p
CREATE TABLE raepa.raepa_apparaep_p (
    id integer NOT NULL,
    idappareil character varying(254) NOT NULL,
    x numeric(10,3) NOT NULL,
    y numeric(10,3) NOT NULL,
    mouvrage character varying(100) NOT NULL,
    gexploit character varying(100) NOT NULL,
    fnappaep character varying(2) NOT NULL,
    anfinpose character varying(4) NOT NULL,
    diametre integer NOT NULL,
    idcanamont character varying(254) NOT NULL,
    idcanaval character varying(254) NOT NULL,
    idcanppale character varying(254),
    idouvrage character varying(254),
    z numeric(6,3),
    andebpose character varying(4),
    qualglocxy character varying(2) NOT NULL,
    qualglocz character varying(2) NOT NULL,
    datemaj date DEFAULT now() NOT NULL,
    sourmaj character varying(100) NOT NULL,
    qualannee character varying(2),
    dategeoloc date,
    sourgeoloc character varying(100),
    sourattrib character varying(100),
    geom public.geometry(Point,2154) NOT NULL,
    _ferme boolean DEFAULT false NOT NULL,
    _orientation double precision,
    _observation text
);


-- raepa_apparaep_p
COMMENT ON TABLE raepa.raepa_apparaep_p IS 'Table des appareillages du réseau d''AEP';


-- raepa_apparaep_p_id_seq
CREATE SEQUENCE raepa.raepa_apparaep_p_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- raepa_apparaep_p_id_seq
ALTER SEQUENCE raepa.raepa_apparaep_p_id_seq OWNED BY raepa.raepa_apparaep_p.id;


-- raepa_apparass_p
CREATE TABLE raepa.raepa_apparass_p (
    id integer NOT NULL,
    idappareil character varying(254) NOT NULL,
    x numeric(10,3) NOT NULL,
    y numeric(10,3) NOT NULL,
    mouvrage character varying(100) NOT NULL,
    gexploit character varying(100) NOT NULL,
    typreseau character varying(2) NOT NULL,
    fnappass character varying(22) NOT NULL,
    andebpose character varying(4),
    anfinpose character varying(4) NOT NULL,
    diametre integer NOT NULL,
    idcanamont character varying(254) NOT NULL,
    idcanaval character varying(254) NOT NULL,
    idcanppale character varying(254),
    idouvrage character varying(254),
    z numeric(6,3),
    qualglocxy character varying(2) NOT NULL,
    qualglocz character varying(2) NOT NULL,
    datemaj date DEFAULT now() NOT NULL,
    sourmaj character varying(100) NOT NULL,
    qualannee character varying(2),
    dategeoloc date,
    sourgeoloc character varying(100),
    sourattrib character varying(100),
    _source_historique text,
    _code_chantier text,
    _date_import text,
    geom public.geometry(Point,2154) NOT NULL,
    _temp_data public.hstore,
    _observation text
);


-- raepa_apparass_p
COMMENT ON TABLE raepa.raepa_apparass_p IS 'Table des appareillages du réseau d''assainissement collectif';


-- raepa_apparass_p_id_seq
CREATE SEQUENCE raepa.raepa_apparass_p_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- raepa_apparass_p_id_seq
ALTER SEQUENCE raepa.raepa_apparass_p_id_seq OWNED BY raepa.raepa_apparass_p.id;


-- raepa_canalaep_l
CREATE TABLE raepa.raepa_canalaep_l (
    id integer NOT NULL,
    idcana character varying(254) NOT NULL,
    mouvrage character varying(100) NOT NULL,
    gexploit character varying(100) NOT NULL,
    enservice character varying(1) NOT NULL,
    branchemnt character varying(1) NOT NULL,
    materiau character varying(2) NOT NULL,
    diametre integer NOT NULL,
    anfinpose character varying(4) NOT NULL,
    modecirc character varying(2) NOT NULL,
    contcanaep character varying(2) NOT NULL,
    fonccanaep character varying(2) NOT NULL,
    idnini character varying(254) NOT NULL,
    idnterm character varying(254) NOT NULL,
    idcanppale character varying(254),
    profgen numeric(6,2),
    andebpose character varying(4),
    longcana integer,
    _longcana_cm numeric(7,2),
    _longcana_reelle numeric(7,2),
    nbranche integer,
    qualglocxy character varying(2) NOT NULL,
    qualglocz character varying(2) NOT NULL,
    datemaj date DEFAULT now() NOT NULL,
    sourmaj character varying(100) NOT NULL,
    qualannee character varying(2),
    dategeoloc date,
    sourgeoloc character varying(100),
    sourattrib character varying(100),
    geom public.geometry(LineString,2154) NOT NULL,
    _observation text
);


-- raepa_canalaep_l
COMMENT ON TABLE raepa.raepa_canalaep_l IS 'Table des éléments linéaires du réseau d''AEP';


-- raepa_canalaep_l_id_seq
CREATE SEQUENCE raepa.raepa_canalaep_l_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- raepa_canalaep_l_id_seq
ALTER SEQUENCE raepa.raepa_canalaep_l_id_seq OWNED BY raepa.raepa_canalaep_l.id;


-- raepa_canalass_l
CREATE TABLE raepa.raepa_canalass_l (
    id integer NOT NULL,
    idcana character varying(254) NOT NULL,
    mouvrage character varying(100) NOT NULL,
    gexploit character varying(100) NOT NULL,
    enservice character varying(1) NOT NULL,
    branchemnt character varying(1) NOT NULL,
    typreseau character varying(2) NOT NULL,
    materiau character varying(2) NOT NULL,
    diametre integer NOT NULL,
    _dimensionhorizontale integer,
    _forme character varying(2),
    _etat character varying(2),
    anfinpose character varying(4) NOT NULL,
    modecirc character varying(2) NOT NULL,
    contcanass character varying(2) NOT NULL,
    fonccanass character varying(2) NOT NULL,
    idnini character varying(254) NOT NULL,
    idnterm character varying(254) NOT NULL,
    idcanppale character varying(254),
    zamont numeric(6,3),
    zaval numeric(6,3),
    sensecoul character varying(1),
    andebpose character varying(4),
    _precisionannee character varying(2),
    longcana integer,
    _longcana_cm numeric(7,2),
    _longcana_reelle numeric(7,2),
    _pente numeric(6,2),
    nbranche integer,
    qualglocxy character varying(2) NOT NULL,
    qualglocz character varying(2) NOT NULL,
    datemaj date DEFAULT now() NOT NULL,
    sourmaj character varying(100) NOT NULL,
    qualannee character varying(2),
    dategeoloc date,
    sourgeoloc character varying(100),
    sourattrib character varying(100),
    _source_historique text,
    _code_chantier text,
    _date_import text,
    geom public.geometry(LineString,2154) NOT NULL,
    _temp_data public.hstore,
    _observation text
);


-- raepa_canalass_l
COMMENT ON TABLE raepa.raepa_canalass_l IS 'Table des éléments linéaires du réseau d''assainissement collectif';


-- raepa_canalass_l_id_seq
CREATE SEQUENCE raepa.raepa_canalass_l_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- raepa_canalass_l_id_seq
ALTER SEQUENCE raepa.raepa_canalass_l_id_seq OWNED BY raepa.raepa_canalass_l.id;


-- raepa_ouvraep_p
CREATE TABLE raepa.raepa_ouvraep_p (
    id integer NOT NULL,
    idouvrage character varying(254) NOT NULL,
    x numeric(10,3) NOT NULL,
    y numeric(10,3) NOT NULL,
    mouvrage character varying(100) NOT NULL,
    gexploit character varying(100) NOT NULL,
    fnouvaep character varying(2) NOT NULL,
    anfinpose character varying(4) NOT NULL,
    idcanamont character varying(254) NOT NULL,
    idcanaval character varying(254) NOT NULL,
    idcanppale character varying(254),
    z numeric(6,3),
    andebpose character varying(4),
    qualglocxy character varying(2) NOT NULL,
    qualglocz character varying(2) NOT NULL,
    datemaj date DEFAULT now() NOT NULL,
    sourmaj character varying(100) NOT NULL,
    qualannee character varying(2),
    dategeoloc date,
    sourgeoloc character varying(100),
    sourattrib character varying(100),
    geom public.geometry(Point,2154) NOT NULL,
    _observation text
);


-- raepa_ouvraep_p
COMMENT ON TABLE raepa.raepa_ouvraep_p IS 'Table des ouvrages du réseau d''AEP';


-- raepa_ouvraep_p_id_seq
CREATE SEQUENCE raepa.raepa_ouvraep_p_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- raepa_ouvraep_p_id_seq
ALTER SEQUENCE raepa.raepa_ouvraep_p_id_seq OWNED BY raepa.raepa_ouvraep_p.id;


-- raepa_ouvrass_p
CREATE TABLE raepa.raepa_ouvrass_p (
    id integer NOT NULL,
    idouvrage character varying(254) NOT NULL,
    x numeric(10,3) NOT NULL,
    y numeric(10,3) NOT NULL,
    mouvrage character varying(100) NOT NULL,
    gexploit character varying(100) NOT NULL,
    typreseau character varying(2) NOT NULL,
    fnouvass character varying(30) NOT NULL,
    anfinpose character varying(4) NOT NULL,
    idcanamont character varying(254) NOT NULL,
    idcanaval character varying(254) NOT NULL,
    idcanppale character varying(254),
    z numeric(6,3),
    _ztampon numeric(6,3),
    _angletampon real,
    andebpose character varying(4),
    qualglocxy character varying(2) NOT NULL,
    qualglocz character varying(2) NOT NULL,
    datemaj date DEFAULT now() NOT NULL,
    sourmaj character varying(100) NOT NULL,
    qualannee character varying(2),
    dategeoloc date,
    sourgeoloc character varying(100),
    sourattrib character varying(100),
    _source_historique text,
    _code_chantier text,
    _date_import date,
    geom public.geometry(Point,2154) NOT NULL,
    _geom_emprise public.geometry(MultiPolygon,2154),
    _temp_data public.hstore,
    _observation text
);


-- raepa_ouvrass_p
COMMENT ON TABLE raepa.raepa_ouvrass_p IS 'Table des ouvrages du réseau d''assainissement collectif';


-- raepa_ouvrass_p_id_seq
CREATE SEQUENCE raepa.raepa_ouvrass_p_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- raepa_ouvrass_p_id_seq
ALTER SEQUENCE raepa.raepa_ouvrass_p_id_seq OWNED BY raepa.raepa_ouvrass_p.id;


-- raepa_reparaep_p
CREATE TABLE raepa.raepa_reparaep_p (
    id integer NOT NULL,
    idrepar character varying(254) DEFAULT raepa.generate_oid('raepa_reparaep_p'::text) NOT NULL,
    x numeric(10,3) NOT NULL,
    y numeric(10,3) NOT NULL,
    supprepare character varying(2) NOT NULL,
    defreparee character varying(2) NOT NULL,
    idsuprepar character varying(254) NOT NULL,
    daterepar date,
    mouvrage character varying(254),
    geom public.geometry(Point,2154) NOT NULL
);


-- raepa_reparaep_p
COMMENT ON TABLE raepa.raepa_reparaep_p IS 'Table des interventions en réparation sur les éléments du réseau d''AEP';


-- raepa_reparaep_p_id_seq
CREATE SEQUENCE raepa.raepa_reparaep_p_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- raepa_reparaep_p_id_seq
ALTER SEQUENCE raepa.raepa_reparaep_p_id_seq OWNED BY raepa.raepa_reparaep_p.id;


-- raepa_reparass_p
CREATE TABLE raepa.raepa_reparass_p (
    id integer NOT NULL,
    idrepar character varying(254) DEFAULT raepa.generate_oid('raepa_reparass_p'::text) NOT NULL,
    x numeric(10,3) NOT NULL,
    y numeric(10,3) NOT NULL,
    supprepare character varying(2) NOT NULL,
    defreparee character varying(2) NOT NULL,
    idsuprepar character varying(254) NOT NULL,
    daterepar date,
    mouvrage character varying(100),
    _typeintervention character varying(2) NOT NULL,
    _dateprevue date,
    _etatcanalisation character varying(2),
    _frequencecuragepreventif integer,
    _idinterventionparent character varying(254),
    geom public.geometry(Point,2154) NOT NULL
);


-- raepa_reparass_p
COMMENT ON TABLE raepa.raepa_reparass_p IS 'Table des interventions en réparation sur les éléments du réseau d''assainissement collectif';


-- raepa_reparass_p_id_seq
CREATE SEQUENCE raepa.raepa_reparass_p_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- raepa_reparass_p_id_seq
ALTER SEQUENCE raepa.raepa_reparass_p_id_seq OWNED BY raepa.raepa_reparass_p.id;


-- sys_liste_table
CREATE TABLE raepa.sys_liste_table (
    id integer NOT NULL,
    nom text NOT NULL,
    code character varying(3) NOT NULL,
    typereseau character varying(3) NOT NULL,
    cleprimaire text NOT NULL,
    libelle text NOT NULL,
    commentaire text
);


-- sys_liste_table
COMMENT ON TABLE raepa.sys_liste_table IS 'Liste les tables du schéma RAEPA';


-- sys_liste_table_id_seq
CREATE SEQUENCE raepa.sys_liste_table_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- sys_liste_table_id_seq
ALTER SEQUENCE raepa.sys_liste_table_id_seq OWNED BY raepa.sys_liste_table.id;


-- sys_organisme_gestionnaire
CREATE TABLE raepa.sys_organisme_gestionnaire (
    id integer NOT NULL,
    nom text NOT NULL,
    siren character varying(9) NOT NULL,
    code character varying(3) NOT NULL,
    actif boolean DEFAULT true NOT NULL
);


-- sys_organisme_gestionnaire
COMMENT ON TABLE raepa.sys_organisme_gestionnaire IS 'Informations sur l’organisme gestionnaire ';


-- sys_organisme_gestionnaire_id_seq
CREATE SEQUENCE raepa.sys_organisme_gestionnaire_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- sys_organisme_gestionnaire_id_seq
ALTER SEQUENCE raepa.sys_organisme_gestionnaire_id_seq OWNED BY raepa.sys_organisme_gestionnaire.id;


-- sys_structure_metadonnee
CREATE TABLE raepa.sys_structure_metadonnee (
    id integer NOT NULL,
    date_ajout date DEFAULT '2019-08-15'::date NOT NULL,
    version text NOT NULL,
    description text
);


-- sys_structure_metadonnee
COMMENT ON TABLE raepa.sys_structure_metadonnee IS 'Métadonnées sur la structure de la bdd : numéro de version, date, etc.';


-- sys_structure_metadonnee_id_seq
CREATE SEQUENCE raepa.sys_structure_metadonnee_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


-- sys_structure_metadonnee_id_seq
ALTER SEQUENCE raepa.sys_structure_metadonnee_id_seq OWNED BY raepa.sys_structure_metadonnee.id;


-- val_raepa_cat_canal_ae
CREATE TABLE raepa.val_raepa_cat_canal_ae (
    code character varying(2) NOT NULL,
    libelle text NOT NULL,
    description text,
    ordre smallint
);


-- val_raepa_cat_canal_ae
COMMENT ON TABLE raepa.val_raepa_cat_canal_ae IS 'Nomenclature pour la catégorie de canalisation AEP';


-- val_raepa_cat_canal_ass
CREATE TABLE raepa.val_raepa_cat_canal_ass (
    code character varying(2) NOT NULL,
    libelle text NOT NULL,
    description text,
    ordre smallint
);


-- val_raepa_cat_canal_ass
COMMENT ON TABLE raepa.val_raepa_cat_canal_ass IS 'Nomenclature pour la catégorie de canalisation ASS';


-- val_raepa_fonc_app_ae
CREATE TABLE raepa.val_raepa_fonc_app_ae (
    code character varying(2) NOT NULL,
    libelle text NOT NULL,
    description text,
    ordre smallint
);


-- val_raepa_fonc_app_ae
COMMENT ON TABLE raepa.val_raepa_fonc_app_ae IS 'Nomenclature pour la fonction des appareils AEP';


-- val_raepa_fonc_app_ass
CREATE TABLE raepa.val_raepa_fonc_app_ass (
    code character varying(2) NOT NULL,
    libelle text NOT NULL,
    description text,
    ordre smallint
);


-- val_raepa_fonc_app_ass
COMMENT ON TABLE raepa.val_raepa_fonc_app_ass IS 'Nomenclature pour la fonction des appareils ASS';


-- val_raepa_fonc_canal_ae
CREATE TABLE raepa.val_raepa_fonc_canal_ae (
    code character varying(2) NOT NULL,
    libelle text NOT NULL,
    description text,
    ordre smallint
);


-- val_raepa_fonc_canal_ae
COMMENT ON TABLE raepa.val_raepa_fonc_canal_ae IS 'Nomenclature pour la fonction de la canalisation AEP';


-- val_raepa_fonc_canal_ass
CREATE TABLE raepa.val_raepa_fonc_canal_ass (
    code character varying(2) NOT NULL,
    libelle text NOT NULL,
    description text,
    ordre smallint
);


-- val_raepa_fonc_canal_ass
COMMENT ON TABLE raepa.val_raepa_fonc_canal_ass IS 'Nomenclature pour la fonction de la canalisation ASS';


-- val_raepa_fonc_ouv_ae
CREATE TABLE raepa.val_raepa_fonc_ouv_ae (
    code character varying(2) NOT NULL,
    libelle text NOT NULL,
    description text,
    ordre smallint
);


-- val_raepa_fonc_ouv_ae
COMMENT ON TABLE raepa.val_raepa_fonc_ouv_ae IS 'Nomenclature pour la fonction des ouvrages AEP';


-- val_raepa_fonc_ouv_ass
CREATE TABLE raepa.val_raepa_fonc_ouv_ass (
    code character varying(2) NOT NULL,
    libelle text NOT NULL,
    description text,
    ordre smallint
);


-- val_raepa_fonc_ouv_ass
COMMENT ON TABLE raepa.val_raepa_fonc_ouv_ass IS 'Nomenclature pour la fonction des ouvrages ASS';


-- val_raepa_materiau
CREATE TABLE raepa.val_raepa_materiau (
    code character varying(2) NOT NULL,
    libelle text NOT NULL,
    description text,
    ordre smallint
);


-- val_raepa_materiau
COMMENT ON TABLE raepa.val_raepa_materiau IS 'Nomenclature pour les matériau';


-- val_raepa_mode_circulation
CREATE TABLE raepa.val_raepa_mode_circulation (
    code character varying(2) NOT NULL,
    libelle text NOT NULL,
    description text,
    ordre smallint
);


-- val_raepa_mode_circulation
COMMENT ON TABLE raepa.val_raepa_mode_circulation IS 'Nomenclature pour le mode de circulation';


-- val_raepa_qualite_anpose
CREATE TABLE raepa.val_raepa_qualite_anpose (
    code character varying(2) NOT NULL,
    libelle text NOT NULL,
    description text,
    ordre smallint
);


-- val_raepa_qualite_anpose
COMMENT ON TABLE raepa.val_raepa_qualite_anpose IS 'Nomenclature pour la qualité de l’année de pose';


-- val_raepa_qualite_geoloc
CREATE TABLE raepa.val_raepa_qualite_geoloc (
    code character varying(2) NOT NULL,
    libelle text NOT NULL,
    description text,
    ordre smallint
);


-- val_raepa_qualite_geoloc
COMMENT ON TABLE raepa.val_raepa_qualite_geoloc IS 'Nomenclature pour la qualité de la géolocalisation';


-- val_raepa_support_reparation
CREATE TABLE raepa.val_raepa_support_reparation (
    code character varying(2) NOT NULL,
    libelle text NOT NULL,
    description text,
    ordre smallint
);


-- val_raepa_support_reparation
COMMENT ON TABLE raepa.val_raepa_support_reparation IS 'Nomenclature pour le support des incidents';


-- val_raepa_typ_reseau_ass
CREATE TABLE raepa.val_raepa_typ_reseau_ass (
    code character varying(2) NOT NULL,
    libelle text NOT NULL,
    description text,
    ordre smallint
);


-- val_raepa_typ_reseau_ass
COMMENT ON TABLE raepa.val_raepa_typ_reseau_ass IS 'Nomenclature pour le type de réseau ASS';


-- val_raepa_type_defaillance
CREATE TABLE raepa.val_raepa_type_defaillance (
    code character varying(2) NOT NULL,
    libelle text NOT NULL,
    description text,
    ordre smallint
);


-- val_raepa_type_defaillance
COMMENT ON TABLE raepa.val_raepa_type_defaillance IS 'Nomenclature pour le type de défaillance';


-- raepa_apparaep_p id
ALTER TABLE ONLY raepa.raepa_apparaep_p ALTER COLUMN id SET DEFAULT nextval('raepa.raepa_apparaep_p_id_seq'::regclass);


-- raepa_apparass_p id
ALTER TABLE ONLY raepa.raepa_apparass_p ALTER COLUMN id SET DEFAULT nextval('raepa.raepa_apparass_p_id_seq'::regclass);


-- raepa_canalaep_l id
ALTER TABLE ONLY raepa.raepa_canalaep_l ALTER COLUMN id SET DEFAULT nextval('raepa.raepa_canalaep_l_id_seq'::regclass);


-- raepa_canalass_l id
ALTER TABLE ONLY raepa.raepa_canalass_l ALTER COLUMN id SET DEFAULT nextval('raepa.raepa_canalass_l_id_seq'::regclass);


-- raepa_ouvraep_p id
ALTER TABLE ONLY raepa.raepa_ouvraep_p ALTER COLUMN id SET DEFAULT nextval('raepa.raepa_ouvraep_p_id_seq'::regclass);


-- raepa_ouvrass_p id
ALTER TABLE ONLY raepa.raepa_ouvrass_p ALTER COLUMN id SET DEFAULT nextval('raepa.raepa_ouvrass_p_id_seq'::regclass);


-- raepa_reparaep_p id
ALTER TABLE ONLY raepa.raepa_reparaep_p ALTER COLUMN id SET DEFAULT nextval('raepa.raepa_reparaep_p_id_seq'::regclass);


-- raepa_reparass_p id
ALTER TABLE ONLY raepa.raepa_reparass_p ALTER COLUMN id SET DEFAULT nextval('raepa.raepa_reparass_p_id_seq'::regclass);


-- sys_liste_table id
ALTER TABLE ONLY raepa.sys_liste_table ALTER COLUMN id SET DEFAULT nextval('raepa.sys_liste_table_id_seq'::regclass);


-- sys_organisme_gestionnaire id
ALTER TABLE ONLY raepa.sys_organisme_gestionnaire ALTER COLUMN id SET DEFAULT nextval('raepa.sys_organisme_gestionnaire_id_seq'::regclass);


-- sys_structure_metadonnee id
ALTER TABLE ONLY raepa.sys_structure_metadonnee ALTER COLUMN id SET DEFAULT nextval('raepa.sys_structure_metadonnee_id_seq'::regclass);


--
-- PostgreSQL database dump complete
--

