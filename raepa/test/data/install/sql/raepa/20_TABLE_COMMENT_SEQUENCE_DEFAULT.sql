--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.15
-- Dumped by pg_dump version 9.6.15

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
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


-- _val_raepa_etat_canal_ass.code
COMMENT ON COLUMN raepa._val_raepa_etat_canal_ass.code IS 'Code';


-- _val_raepa_etat_canal_ass.libelle
COMMENT ON COLUMN raepa._val_raepa_etat_canal_ass.libelle IS 'Libellé';


-- _val_raepa_etat_canal_ass.description
COMMENT ON COLUMN raepa._val_raepa_etat_canal_ass.description IS 'Description ';


-- _val_raepa_etat_canal_ass.ordre
COMMENT ON COLUMN raepa._val_raepa_etat_canal_ass.ordre IS 'Ordre';


-- _val_raepa_forme_canal_ass
CREATE TABLE raepa._val_raepa_forme_canal_ass (
    code character varying(2) NOT NULL,
    libelle text NOT NULL,
    description text,
    ordre smallint
);


-- _val_raepa_forme_canal_ass
COMMENT ON TABLE raepa._val_raepa_forme_canal_ass IS 'Nomenclature pour la forme de la canalisation (ovoide, cylindrique, etc.)';


-- _val_raepa_forme_canal_ass.code
COMMENT ON COLUMN raepa._val_raepa_forme_canal_ass.code IS 'Code';


-- _val_raepa_forme_canal_ass.libelle
COMMENT ON COLUMN raepa._val_raepa_forme_canal_ass.libelle IS 'Libellé';


-- _val_raepa_forme_canal_ass.description
COMMENT ON COLUMN raepa._val_raepa_forme_canal_ass.description IS 'Description ';


-- _val_raepa_forme_canal_ass.ordre
COMMENT ON COLUMN raepa._val_raepa_forme_canal_ass.ordre IS 'Ordre';


-- _val_raepa_precision_annee
CREATE TABLE raepa._val_raepa_precision_annee (
    code character varying(2) NOT NULL,
    libelle text NOT NULL,
    description text,
    ordre smallint
);


-- _val_raepa_precision_annee
COMMENT ON TABLE raepa._val_raepa_precision_annee IS 'Nomenclature pour la précision des années de fin et début de pose';


-- _val_raepa_precision_annee.code
COMMENT ON COLUMN raepa._val_raepa_precision_annee.code IS 'Code';


-- _val_raepa_precision_annee.libelle
COMMENT ON COLUMN raepa._val_raepa_precision_annee.libelle IS 'Libellé';


-- _val_raepa_precision_annee.description
COMMENT ON COLUMN raepa._val_raepa_precision_annee.description IS 'Description ';


-- _val_raepa_precision_annee.ordre
COMMENT ON COLUMN raepa._val_raepa_precision_annee.ordre IS 'Ordre';


-- _val_raepa_type_intervention_ass
CREATE TABLE raepa._val_raepa_type_intervention_ass (
    code character varying(2) NOT NULL,
    libelle text NOT NULL,
    description text,
    ordre smallint
);


-- _val_raepa_type_intervention_ass
COMMENT ON TABLE raepa._val_raepa_type_intervention_ass IS 'Nomenclature pour le type d’intervention (curage préventif, inspection, etc.)';


-- _val_raepa_type_intervention_ass.code
COMMENT ON COLUMN raepa._val_raepa_type_intervention_ass.code IS 'Code';


-- _val_raepa_type_intervention_ass.libelle
COMMENT ON COLUMN raepa._val_raepa_type_intervention_ass.libelle IS 'Libellé';


-- _val_raepa_type_intervention_ass.description
COMMENT ON COLUMN raepa._val_raepa_type_intervention_ass.description IS 'Description ';


-- _val_raepa_type_intervention_ass.ordre
COMMENT ON COLUMN raepa._val_raepa_type_intervention_ass.ordre IS 'Ordre';


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


-- affleurant_pcrs.idaffleurant
COMMENT ON COLUMN raepa.affleurant_pcrs.idaffleurant IS 'Identifiant de l’affleurant PCRS';


-- affleurant_pcrs.gexploit
COMMENT ON COLUMN raepa.affleurant_pcrs.gexploit IS 'Gestionnaire exploitant du réseau';


-- affleurant_pcrs.reference
COMMENT ON COLUMN raepa.affleurant_pcrs.reference IS 'Désignation du symbole à utiliser pour la représentation de l’affleurant';


-- affleurant_pcrs.anglerotaion
COMMENT ON COLUMN raepa.affleurant_pcrs.anglerotaion IS 'Utilisé uniquement pour l’orientation du symbole d’affleurant';


-- affleurant_pcrs.longueur
COMMENT ON COLUMN raepa.affleurant_pcrs.longueur IS 'Utilisé uniquement pour la mise à l’échelle X du symbole d’affleurant';


-- affleurant_pcrs.largeur
COMMENT ON COLUMN raepa.affleurant_pcrs.largeur IS 'Utilisé uniquement pour la mise à l’échelle Y du symbole d’affleurant';


-- affleurant_pcrs.codecouleur
COMMENT ON COLUMN raepa.affleurant_pcrs.codecouleur IS 'Code couleur du symbole';


-- affleurant_pcrs.z
COMMENT ON COLUMN raepa.affleurant_pcrs.z IS 'Altitude (en mètres, référentiel NGF-IGN69)';


-- affleurant_pcrs.qualglocxy
COMMENT ON COLUMN raepa.affleurant_pcrs.qualglocxy IS 'Qualité de la géolocalisation planimétrique (XY)
Codes de la table VAL_RAEPA_QUALITE_GEOLOC';


-- affleurant_pcrs.qualglocz
COMMENT ON COLUMN raepa.affleurant_pcrs.qualglocz IS 'Qualité de la géolocalisation altimétrique (Z)
Codes de la table VAL_RAEPA_QUALITE_GEOLOC';


-- affleurant_pcrs.geom
COMMENT ON COLUMN raepa.affleurant_pcrs.geom IS 'Géométrie';


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


-- commune.codeinsee
COMMENT ON COLUMN raepa.commune.codeinsee IS 'Code officiel géographique (COG) de la commune';


-- commune.anneecog
COMMENT ON COLUMN raepa.commune.anneecog IS 'Année de publication par l''INSEE du COG';


-- commune.nom
COMMENT ON COLUMN raepa.commune.nom IS 'Nom de la commune';


-- commune.geom
COMMENT ON COLUMN raepa.commune.geom IS 'Géométrie';


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
    datemaj date DEFAULT '2019-08-15'::date NOT NULL,
    sourmaj character varying(100) NOT NULL,
    qualannee character varying(2),
    dategeoloc date,
    sourgeoloc character varying(100),
    sourattrib character varying(100),
    geom public.geometry(Point,2154) NOT NULL
);


-- raepa_apparaep_p
COMMENT ON TABLE raepa.raepa_apparaep_p IS 'Table des appareillages du réseau d''AEP';


-- raepa_apparaep_p.id
COMMENT ON COLUMN raepa.raepa_apparaep_p.id IS 'Identifiant numérique auto (clé primaire)';


-- raepa_apparaep_p.idappareil
COMMENT ON COLUMN raepa.raepa_apparaep_p.idappareil IS 'Identifiant de l''appareillage';


-- raepa_apparaep_p.x
COMMENT ON COLUMN raepa.raepa_apparaep_p.x IS 'Coordonnée X Lambert 93 (en mètres)';


-- raepa_apparaep_p.y
COMMENT ON COLUMN raepa.raepa_apparaep_p.y IS 'Coordonnée X Lambert 93 (en mètres)';


-- raepa_apparaep_p.mouvrage
COMMENT ON COLUMN raepa.raepa_apparaep_p.mouvrage IS 'Maître d''ouvrage du réseau';


-- raepa_apparaep_p.gexploit
COMMENT ON COLUMN raepa.raepa_apparaep_p.gexploit IS 'Gestionnaire exploitant du réseau';


-- raepa_apparaep_p.fnappaep
COMMENT ON COLUMN raepa.raepa_apparaep_p.fnappaep IS 'Fonction de l''appareillage d''adduction d''eau potable
Codes de la table VAL_RAEPA_FONC_APP_AE';


-- raepa_apparaep_p.anfinpose
COMMENT ON COLUMN raepa.raepa_apparaep_p.anfinpose IS 'Année marquant la fin de la période de mise en service de
l''appareillage';


-- raepa_apparaep_p.diametre
COMMENT ON COLUMN raepa.raepa_apparaep_p.diametre IS 'Diamètre nominal de l''appareillage (en millimètres)';


-- raepa_apparaep_p.idcanamont
COMMENT ON COLUMN raepa.raepa_apparaep_p.idcanamont IS 'Identifiant de la canalisation d''amont de l''appareillage (clé
étrangère)';


-- raepa_apparaep_p.idcanaval
COMMENT ON COLUMN raepa.raepa_apparaep_p.idcanaval IS 'Identifiant de la canalisation d''aval de l''appareillage (clé
étrangère)';


-- raepa_apparaep_p.idcanppale
COMMENT ON COLUMN raepa.raepa_apparaep_p.idcanppale IS 'Identifiant de la canalisation principale (clé étrangère)';


-- raepa_apparaep_p.idouvrage
COMMENT ON COLUMN raepa.raepa_apparaep_p.idouvrage IS 'Identifiant de l''ouvrage d''accueil (clé étrangère)';


-- raepa_apparaep_p.z
COMMENT ON COLUMN raepa.raepa_apparaep_p.z IS 'Altitude (en mètres, référentiel NGF-IGN69) du radier';


-- raepa_apparaep_p.andebpose
COMMENT ON COLUMN raepa.raepa_apparaep_p.andebpose IS 'Année marquant le début de la période de mise en service de
l''appareillage';


-- raepa_apparaep_p.qualglocxy
COMMENT ON COLUMN raepa.raepa_apparaep_p.qualglocxy IS 'Qualité de la géolocalisation planimétrique (XY)
Codes de la table VAL_RAEPA_QUALITE_GEOLOC';


-- raepa_apparaep_p.qualglocz
COMMENT ON COLUMN raepa.raepa_apparaep_p.qualglocz IS 'Qualité de la géolocalisation altimétrique (Z)
Codes de la table VAL_RAEPA_QUALITE_GEOLOC';


-- raepa_apparaep_p.datemaj
COMMENT ON COLUMN raepa.raepa_apparaep_p.datemaj IS 'Date de la dernière mise à jour des informations';


-- raepa_apparaep_p.sourmaj
COMMENT ON COLUMN raepa.raepa_apparaep_p.sourmaj IS 'Source de la mise à jour';


-- raepa_apparaep_p.qualannee
COMMENT ON COLUMN raepa.raepa_apparaep_p.qualannee IS 'Fiabilité, lorsque ANDEBPOSE = ANFINPOSE, de l''année de
mise en service
Codes de la table VAL_RAEPA_QUALITE_ANPOSE';


-- raepa_apparaep_p.dategeoloc
COMMENT ON COLUMN raepa.raepa_apparaep_p.dategeoloc IS 'Date de la géolocalisation';


-- raepa_apparaep_p.sourgeoloc
COMMENT ON COLUMN raepa.raepa_apparaep_p.sourgeoloc IS 'Auteur de la géolocalisation';


-- raepa_apparaep_p.sourattrib
COMMENT ON COLUMN raepa.raepa_apparaep_p.sourattrib IS 'Auteur de la saisie des données attributaires (lorsque différent
de l''auteur de la géolocalisation)';


-- raepa_apparaep_p.geom
COMMENT ON COLUMN raepa.raepa_apparaep_p.geom IS 'Géométrie';


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
    datemaj date DEFAULT '2019-08-15'::date NOT NULL,
    sourmaj character varying(100) NOT NULL,
    qualannee character varying(2),
    dategeoloc date,
    sourgeoloc character varying(100),
    sourattrib character varying(100),
    _source_historique text,
    _code_chantier text,
    _date_import text,
    geom public.geometry(Point,2154) NOT NULL,
    _temp_data public.hstore
);


-- raepa_apparass_p
COMMENT ON TABLE raepa.raepa_apparass_p IS 'Table des appareillages du réseau d''assainissement collectif';


-- raepa_apparass_p.id
COMMENT ON COLUMN raepa.raepa_apparass_p.id IS 'Identifiant numérique auto (clé primaire)';


-- raepa_apparass_p.idappareil
COMMENT ON COLUMN raepa.raepa_apparass_p.idappareil IS 'Identifiant de l''appareillage';


-- raepa_apparass_p.x
COMMENT ON COLUMN raepa.raepa_apparass_p.x IS 'Coordonnée X Lambert 93 (en mètres)';


-- raepa_apparass_p.y
COMMENT ON COLUMN raepa.raepa_apparass_p.y IS 'Coordonnée X Lambert 93 (en mètres)';


-- raepa_apparass_p.mouvrage
COMMENT ON COLUMN raepa.raepa_apparass_p.mouvrage IS 'Maître d''ouvrage du réseau';


-- raepa_apparass_p.gexploit
COMMENT ON COLUMN raepa.raepa_apparass_p.gexploit IS 'Gestionnaire exploitant du réseau';


-- raepa_apparass_p.typreseau
COMMENT ON COLUMN raepa.raepa_apparass_p.typreseau IS 'Type du réseau d''assainissement collectif
Codes de la table VAL_RAEPA_TYP_RESEAU_ASS';


-- raepa_apparass_p.fnappass
COMMENT ON COLUMN raepa.raepa_apparass_p.fnappass IS 'Fonction de l''appareillage d''assainissement collectif
Codes de la table VAL_RAEPA_FONC_APP_ASS';


-- raepa_apparass_p.andebpose
COMMENT ON COLUMN raepa.raepa_apparass_p.andebpose IS 'Année marquant le début de la période de mise en service de
l''appareillage';


-- raepa_apparass_p.anfinpose
COMMENT ON COLUMN raepa.raepa_apparass_p.anfinpose IS 'Année marquant la fin de la période de mise en service de
l''appareillage';


-- raepa_apparass_p.diametre
COMMENT ON COLUMN raepa.raepa_apparass_p.diametre IS 'Diamètre nominal de l''appareillage (en millimètres)';


-- raepa_apparass_p.idcanamont
COMMENT ON COLUMN raepa.raepa_apparass_p.idcanamont IS 'Identifiant de la canalisation d''amont de l''appareillage (clé
étrangère)';


-- raepa_apparass_p.idcanaval
COMMENT ON COLUMN raepa.raepa_apparass_p.idcanaval IS 'Identifiant de la canalisation d''aval de l''appareillage (clé
étrangère)';


-- raepa_apparass_p.idcanppale
COMMENT ON COLUMN raepa.raepa_apparass_p.idcanppale IS 'Identifiant de la canalisation principale (clé étrangère)';


-- raepa_apparass_p.idouvrage
COMMENT ON COLUMN raepa.raepa_apparass_p.idouvrage IS 'Identifiant de l''ouvrage d''accueil (clé étrangère)';


-- raepa_apparass_p.z
COMMENT ON COLUMN raepa.raepa_apparass_p.z IS 'Altitude (en mètres, référentiel NGF-IGN69)';


-- raepa_apparass_p.qualglocxy
COMMENT ON COLUMN raepa.raepa_apparass_p.qualglocxy IS 'Qualité de la géolocalisation planimétrique (XY)
Codes de la table VAL_RAEPA_QUALITE_GEOLOC';


-- raepa_apparass_p.qualglocz
COMMENT ON COLUMN raepa.raepa_apparass_p.qualglocz IS 'Qualité de la géolocalisation altimétrique (Z)
Codes de la table VAL_RAEPA_QUALITE_GEOLOC';


-- raepa_apparass_p.datemaj
COMMENT ON COLUMN raepa.raepa_apparass_p.datemaj IS 'Date de la dernière mise à jour des informations';


-- raepa_apparass_p.sourmaj
COMMENT ON COLUMN raepa.raepa_apparass_p.sourmaj IS 'Source de la mise à jour';


-- raepa_apparass_p.qualannee
COMMENT ON COLUMN raepa.raepa_apparass_p.qualannee IS 'Fiabilité, lorsque ANDEBPOSE = ANFINPOSE, de l''année de
mise en service
Codes de la table VAL_RAEPA_QUALITE_ANPOSE';


-- raepa_apparass_p.dategeoloc
COMMENT ON COLUMN raepa.raepa_apparass_p.dategeoloc IS 'Date de la géolocalisation';


-- raepa_apparass_p.sourgeoloc
COMMENT ON COLUMN raepa.raepa_apparass_p.sourgeoloc IS 'Auteur de la géolocalisation';


-- raepa_apparass_p.sourattrib
COMMENT ON COLUMN raepa.raepa_apparass_p.sourattrib IS 'Auteur de la saisie des données attributaires (lorsque différent
de l''auteur de la géolocalisation)';


-- raepa_apparass_p._source_historique
COMMENT ON COLUMN raepa.raepa_apparass_p._source_historique IS 'Source de la donnée ( si2g ou geomap)';


-- raepa_apparass_p._code_chantier
COMMENT ON COLUMN raepa.raepa_apparass_p._code_chantier IS 'Code du chantier, qui doit être explicite et unique entre les chantiers. Par ex : SOISSONS-PL REPUBLIQUE-2018';


-- raepa_apparass_p._date_import
COMMENT ON COLUMN raepa.raepa_apparass_p._date_import IS 'Date de l''import';


-- raepa_apparass_p.geom
COMMENT ON COLUMN raepa.raepa_apparass_p.geom IS 'Géométrie';


-- raepa_apparass_p._temp_data
COMMENT ON COLUMN raepa.raepa_apparass_p._temp_data IS 'Champ pour ajouter des données temporaires pendant l''import';


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
    datemaj date DEFAULT '2019-08-15'::date NOT NULL,
    sourmaj character varying(100) NOT NULL,
    qualannee character varying(2),
    dategeoloc date,
    sourgeoloc character varying(100),
    sourattrib character varying(100),
    geom public.geometry(LineString,2154) NOT NULL
);


-- raepa_canalaep_l
COMMENT ON TABLE raepa.raepa_canalaep_l IS 'Table des éléments linéaires du réseau d''AEP';


-- raepa_canalaep_l.id
COMMENT ON COLUMN raepa.raepa_canalaep_l.id IS 'Identifiant numérique auto (clé primaire)';


-- raepa_canalaep_l.idcana
COMMENT ON COLUMN raepa.raepa_canalaep_l.idcana IS 'Identifiant de la canalisation (code textuel)';


-- raepa_canalaep_l.mouvrage
COMMENT ON COLUMN raepa.raepa_canalaep_l.mouvrage IS 'Maître d''ouvrage du réseau';


-- raepa_canalaep_l.gexploit
COMMENT ON COLUMN raepa.raepa_canalaep_l.gexploit IS 'Gestionnaire exploitant du réseau';


-- raepa_canalaep_l.enservice
COMMENT ON COLUMN raepa.raepa_canalaep_l.enservice IS 'Canalisation en service / Canalisation abandonnée
O / N';


-- raepa_canalaep_l.branchemnt
COMMENT ON COLUMN raepa.raepa_canalaep_l.branchemnt IS 'Canalisation de branchement individuel : O
Canalisation de transport ou de distribution : N';


-- raepa_canalaep_l.materiau
COMMENT ON COLUMN raepa.raepa_canalaep_l.materiau IS 'Matériau de la canalisation d''adduction d''eau potable
Codes de la table VAL_RAEPA_MATERIAU';


-- raepa_canalaep_l.diametre
COMMENT ON COLUMN raepa.raepa_canalaep_l.diametre IS 'Diamètre nominal de la canalisation (en millimètres)';


-- raepa_canalaep_l.anfinpose
COMMENT ON COLUMN raepa.raepa_canalaep_l.anfinpose IS 'Année marquant la fin de la période de pose de la canalisation';


-- raepa_canalaep_l.modecirc
COMMENT ON COLUMN raepa.raepa_canalaep_l.modecirc IS 'Mode de circulation de l''eau à l''intérieur de la canalisation
Codes de la table VAL_RAEPA_MODE_CIRCULATION';


-- raepa_canalaep_l.contcanaep
COMMENT ON COLUMN raepa.raepa_canalaep_l.contcanaep IS 'Catégorie de la canalisation d''adduction d''eau potable
Codes de la table VAL_RAEPA_CAT_CANAL_AE';


-- raepa_canalaep_l.fonccanaep
COMMENT ON COLUMN raepa.raepa_canalaep_l.fonccanaep IS 'Fonction de la canalisation d''adduction d''eau potable
Codes de la table VAL_RAEPA_FONC_CANAL_AE';


-- raepa_canalaep_l.idnini
COMMENT ON COLUMN raepa.raepa_canalaep_l.idnini IS 'Identifiant du nœud de début de la canalisation (clé étrangère)';


-- raepa_canalaep_l.idnterm
COMMENT ON COLUMN raepa.raepa_canalaep_l.idnterm IS 'Identifiant du nœud de fin de la canalisation (clé étrangère)';


-- raepa_canalaep_l.idcanppale
COMMENT ON COLUMN raepa.raepa_canalaep_l.idcanppale IS 'Identifiant de la canalisation principale (clé étrangère)';


-- raepa_canalaep_l.profgen
COMMENT ON COLUMN raepa.raepa_canalaep_l.profgen IS 'Profondeur moyenne de la génératrice supérieure de la
canalisation';


-- raepa_canalaep_l.andebpose
COMMENT ON COLUMN raepa.raepa_canalaep_l.andebpose IS 'Année marquant le début de la période de pose de la
canalisation';


-- raepa_canalaep_l.longcana
COMMENT ON COLUMN raepa.raepa_canalaep_l.longcana IS 'Longueur mesurée de canalisation (en mètres)';


-- raepa_canalaep_l._longcana_cm
COMMENT ON COLUMN raepa.raepa_canalaep_l._longcana_cm IS 'Longueur calculée de canalisation projetée (en mètres avec une précision centimétrique)';


-- raepa_canalaep_l._longcana_reelle
COMMENT ON COLUMN raepa.raepa_canalaep_l._longcana_reelle IS 'Longueur calculée de canalisation réelle, en prenant en compte la pente (précision cm)';


-- raepa_canalaep_l.nbranche
COMMENT ON COLUMN raepa.raepa_canalaep_l.nbranche IS 'Nombre de branchements individuels sur la canalisation
d''adduction d''eau potable';


-- raepa_canalaep_l.qualglocxy
COMMENT ON COLUMN raepa.raepa_canalaep_l.qualglocxy IS 'Qualité de la géolocalisation planimétrique (XY)
Codes de la table VAL_RAEPA_QUALITE_GEOLOC';


-- raepa_canalaep_l.qualglocz
COMMENT ON COLUMN raepa.raepa_canalaep_l.qualglocz IS 'Qualité de la géolocalisation altimétrique (Z)
Codes de la table VAL_RAEPA_QUALITE_GEOLOC';


-- raepa_canalaep_l.datemaj
COMMENT ON COLUMN raepa.raepa_canalaep_l.datemaj IS 'Date de la dernière mise à jour des informations';


-- raepa_canalaep_l.sourmaj
COMMENT ON COLUMN raepa.raepa_canalaep_l.sourmaj IS 'Source de la mise à jour';


-- raepa_canalaep_l.qualannee
COMMENT ON COLUMN raepa.raepa_canalaep_l.qualannee IS 'Fiabilité, lorsque ANDEBPOSE = ANFINPOSE, de l''année de
pose
Codes de la table VAL_RAEPA_QUALITE_ANPOSE';


-- raepa_canalaep_l.dategeoloc
COMMENT ON COLUMN raepa.raepa_canalaep_l.dategeoloc IS 'Date de la géolocalisation';


-- raepa_canalaep_l.sourgeoloc
COMMENT ON COLUMN raepa.raepa_canalaep_l.sourgeoloc IS 'Auteur de la géolocalisation';


-- raepa_canalaep_l.sourattrib
COMMENT ON COLUMN raepa.raepa_canalaep_l.sourattrib IS 'Auteur de la saisie des données attributaires (lorsque différent
de l''auteur de la géolocalisation)';


-- raepa_canalaep_l.geom
COMMENT ON COLUMN raepa.raepa_canalaep_l.geom IS 'Géométrie';


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
    datemaj date DEFAULT '2019-08-15'::date NOT NULL,
    sourmaj character varying(100) NOT NULL,
    qualannee character varying(2),
    dategeoloc date,
    sourgeoloc character varying(100),
    sourattrib character varying(100),
    _source_historique text,
    _code_chantier text,
    _date_import text,
    geom public.geometry(LineString,2154) NOT NULL,
    _temp_data public.hstore
);


-- raepa_canalass_l
COMMENT ON TABLE raepa.raepa_canalass_l IS 'Table des éléments linéaires du réseau d''assainissement collectif';


-- raepa_canalass_l.id
COMMENT ON COLUMN raepa.raepa_canalass_l.id IS 'Identifiant numérique auto (clé primaire)';


-- raepa_canalass_l.idcana
COMMENT ON COLUMN raepa.raepa_canalass_l.idcana IS 'Identifiant de la canalisation';


-- raepa_canalass_l.mouvrage
COMMENT ON COLUMN raepa.raepa_canalass_l.mouvrage IS 'Maître d''ouvrage du réseau';


-- raepa_canalass_l.gexploit
COMMENT ON COLUMN raepa.raepa_canalass_l.gexploit IS 'Gestionnaire exploitant du réseau';


-- raepa_canalass_l.enservice
COMMENT ON COLUMN raepa.raepa_canalass_l.enservice IS 'Canalisation en service / Canalisation abandonnée
O / N';


-- raepa_canalass_l.branchemnt
COMMENT ON COLUMN raepa.raepa_canalass_l.branchemnt IS 'Canalisation de branchement individuel : O
Canalisation de transport ou collecte : N';


-- raepa_canalass_l.typreseau
COMMENT ON COLUMN raepa.raepa_canalass_l.typreseau IS 'Type du réseau d''assainissement collectif
Codes de la table VAL_RAEPA_TYP_RESEAU_ASS';


-- raepa_canalass_l.materiau
COMMENT ON COLUMN raepa.raepa_canalass_l.materiau IS 'Matériau de la canalisation d''assainissement collectif
Codes de la table VAL_RAEPA_MATERIAU';


-- raepa_canalass_l.diametre
COMMENT ON COLUMN raepa.raepa_canalass_l.diametre IS 'Diamètre nominal de la canalisation (en millimètres)';


-- raepa_canalass_l._dimensionhorizontale
COMMENT ON COLUMN raepa.raepa_canalass_l._dimensionhorizontale IS 'Dimension horizontale (complète le diamètre nominal qui est la dimension verticale)';


-- raepa_canalass_l._forme
COMMENT ON COLUMN raepa.raepa_canalass_l._forme IS 'Forme de la canalisation (cylindrique, ovoïde, etc)';


-- raepa_canalass_l._etat
COMMENT ON COLUMN raepa.raepa_canalass_l._etat IS 'Etat de la canalisation';


-- raepa_canalass_l.anfinpose
COMMENT ON COLUMN raepa.raepa_canalass_l.anfinpose IS 'Année marquant la fin de la période de pose de la canalisation';


-- raepa_canalass_l.modecirc
COMMENT ON COLUMN raepa.raepa_canalass_l.modecirc IS 'Mode de circulation de l''eau à l''intérieur de la canalisation
Codes de la table VAL_RAEPA_MODE_CIRCULATION';


-- raepa_canalass_l.contcanass
COMMENT ON COLUMN raepa.raepa_canalass_l.contcanass IS 'Catégorie de la canalisation d''assainissement collectif
Codes de la table VAL_RAEPA_CAT_CANAL_ASS';


-- raepa_canalass_l.fonccanass
COMMENT ON COLUMN raepa.raepa_canalass_l.fonccanass IS 'Fonction de la canalisation d''assainissement collectif
Codes de la table VAL_RAEPA_FONC_CANAL_ASS';


-- raepa_canalass_l.idnini
COMMENT ON COLUMN raepa.raepa_canalass_l.idnini IS 'Identifiant du nœud de début de la canalisation (clé étrangère)';


-- raepa_canalass_l.idnterm
COMMENT ON COLUMN raepa.raepa_canalass_l.idnterm IS 'Identifiant du nœud de fin de la canalisation (clé étrangère)';


-- raepa_canalass_l.idcanppale
COMMENT ON COLUMN raepa.raepa_canalass_l.idcanppale IS 'Identifiant de la canalisation principale (clé étrangère)';


-- raepa_canalass_l.zamont
COMMENT ON COLUMN raepa.raepa_canalass_l.zamont IS 'Altitude à l''extrémité amont (en mètres, Référentiel NGF-
IGN69)';


-- raepa_canalass_l.zaval
COMMENT ON COLUMN raepa.raepa_canalass_l.zaval IS 'Altitude à l''extrémité aval (en mètres, Référentiel NGF-IGN69)';


-- raepa_canalass_l.sensecoul
COMMENT ON COLUMN raepa.raepa_canalass_l.sensecoul IS 'Sens de l''écoulement dans la canalisation d''assainissement
collectif
0 (nœud terminal → nœud initial) • 1 (nœud initial → nœud
terminal)';


-- raepa_canalass_l.andebpose
COMMENT ON COLUMN raepa.raepa_canalass_l.andebpose IS 'Année marquant le début de la période de pose de la
canalisation';


-- raepa_canalass_l._precisionannee
COMMENT ON COLUMN raepa.raepa_canalass_l._precisionannee IS 'Précision des années de fin et début de pose';


-- raepa_canalass_l.longcana
COMMENT ON COLUMN raepa.raepa_canalass_l.longcana IS 'Longueur mesurée de canalisation (en mètres)';


-- raepa_canalass_l._longcana_cm
COMMENT ON COLUMN raepa.raepa_canalass_l._longcana_cm IS 'Longueur calculée de canalisation projetée (en mètres avec une précision centimétrique)';


-- raepa_canalass_l._longcana_reelle
COMMENT ON COLUMN raepa.raepa_canalass_l._longcana_reelle IS 'Longueur calculée de canalisation réelle, en prenant en compte la pente (précision cm)';


-- raepa_canalass_l._pente
COMMENT ON COLUMN raepa.raepa_canalass_l._pente IS 'Pente de la canalisation (en %)';


-- raepa_canalass_l.nbranche
COMMENT ON COLUMN raepa.raepa_canalass_l.nbranche IS 'Nombre de branchements individuels sur la canalisation
d''assainissement collectif';


-- raepa_canalass_l.qualglocxy
COMMENT ON COLUMN raepa.raepa_canalass_l.qualglocxy IS 'Qualité de la géolocalisation planimétrique (XY)
Codes de la table VAL_RAEPA_QUALITE_GEOLOC';


-- raepa_canalass_l.qualglocz
COMMENT ON COLUMN raepa.raepa_canalass_l.qualglocz IS 'Qualité de la géolocalisation altimétrique (Z)
Codes de la table VAL_RAEPA_QUALITE_GEOLOC';


-- raepa_canalass_l.datemaj
COMMENT ON COLUMN raepa.raepa_canalass_l.datemaj IS 'Date de la dernière mise à jour des informations';


-- raepa_canalass_l.sourmaj
COMMENT ON COLUMN raepa.raepa_canalass_l.sourmaj IS 'Source de la mise à jour';


-- raepa_canalass_l.qualannee
COMMENT ON COLUMN raepa.raepa_canalass_l.qualannee IS 'Fiabilité, lorsque ANDEBPOSE = ANFINPOSE, de l''année de
pose
Codes de la table VAL_RAEPA_QUALITE_ANPOSE';


-- raepa_canalass_l.dategeoloc
COMMENT ON COLUMN raepa.raepa_canalass_l.dategeoloc IS 'Date de la géolocalisation';


-- raepa_canalass_l.sourgeoloc
COMMENT ON COLUMN raepa.raepa_canalass_l.sourgeoloc IS 'Auteur de la géolocalisation';


-- raepa_canalass_l.sourattrib
COMMENT ON COLUMN raepa.raepa_canalass_l.sourattrib IS 'Auteur de la saisie des données attributaires (lorsque différent
de l''auteur de la géolocalisation)';


-- raepa_canalass_l._source_historique
COMMENT ON COLUMN raepa.raepa_canalass_l._source_historique IS 'Source de la donnée ( si2g ou geomap)';


-- raepa_canalass_l._code_chantier
COMMENT ON COLUMN raepa.raepa_canalass_l._code_chantier IS 'Code du chantier, qui doit être explicite et unique entre les chantiers. Par ex : SOISSONS-PL REPUBLIQUE-2018';


-- raepa_canalass_l._date_import
COMMENT ON COLUMN raepa.raepa_canalass_l._date_import IS 'Date de l''import';


-- raepa_canalass_l.geom
COMMENT ON COLUMN raepa.raepa_canalass_l.geom IS 'Géométrie';


-- raepa_canalass_l._temp_data
COMMENT ON COLUMN raepa.raepa_canalass_l._temp_data IS 'Champ pour ajouter des données temporaires pendant l''import';


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
    datemaj date DEFAULT '2019-08-15'::date NOT NULL,
    sourmaj character varying(100) NOT NULL,
    qualannee character varying(2),
    dategeoloc date,
    sourgeoloc character varying(100),
    sourattrib character varying(100),
    geom public.geometry(Point,2154) NOT NULL
);


-- raepa_ouvraep_p
COMMENT ON TABLE raepa.raepa_ouvraep_p IS 'Table des ouvrages du réseau d''AEP';


-- raepa_ouvraep_p.id
COMMENT ON COLUMN raepa.raepa_ouvraep_p.id IS 'Identifiant numérique auto (clé primaire)';


-- raepa_ouvraep_p.idouvrage
COMMENT ON COLUMN raepa.raepa_ouvraep_p.idouvrage IS 'Identifiant de l''ouvrage';


-- raepa_ouvraep_p.x
COMMENT ON COLUMN raepa.raepa_ouvraep_p.x IS 'Coordonnée X Lambert 93 (en mètres)';


-- raepa_ouvraep_p.y
COMMENT ON COLUMN raepa.raepa_ouvraep_p.y IS 'Coordonnée X Lambert 93 (en mètres)';


-- raepa_ouvraep_p.mouvrage
COMMENT ON COLUMN raepa.raepa_ouvraep_p.mouvrage IS 'Maître d''ouvrage du réseau';


-- raepa_ouvraep_p.gexploit
COMMENT ON COLUMN raepa.raepa_ouvraep_p.gexploit IS 'Gestionnaire exploitant du réseau';


-- raepa_ouvraep_p.fnouvaep
COMMENT ON COLUMN raepa.raepa_ouvraep_p.fnouvaep IS 'Fonction de l''ouvrage d''adduction d''eau potable
Codes de la table VAL_RAEPA_FONC_OUV_AE';


-- raepa_ouvraep_p.anfinpose
COMMENT ON COLUMN raepa.raepa_ouvraep_p.anfinpose IS 'Année marquant la fin de la période de mise en service de
l''ouvrage';


-- raepa_ouvraep_p.idcanamont
COMMENT ON COLUMN raepa.raepa_ouvraep_p.idcanamont IS 'Identifiants des canalisations d''amont de l''ouvrage (clés
étrangères)';


-- raepa_ouvraep_p.idcanaval
COMMENT ON COLUMN raepa.raepa_ouvraep_p.idcanaval IS 'Identifiants des canalisations d''aval de l''ouvrage (clés
étrangères)';


-- raepa_ouvraep_p.idcanppale
COMMENT ON COLUMN raepa.raepa_ouvraep_p.idcanppale IS 'Identifiant de la canalisation principale (clé étrangère)';


-- raepa_ouvraep_p.z
COMMENT ON COLUMN raepa.raepa_ouvraep_p.z IS 'Altitude (en mètres, référentiel NGF-IGN69)';


-- raepa_ouvraep_p.andebpose
COMMENT ON COLUMN raepa.raepa_ouvraep_p.andebpose IS 'Année marquant le début de la période de mise en service de
l''ouvrage';


-- raepa_ouvraep_p.qualglocxy
COMMENT ON COLUMN raepa.raepa_ouvraep_p.qualglocxy IS 'Qualité de la géolocalisation planimétrique (XY)
Codes de la table VAL_RAEPA_QUALITE_GEOLOC';


-- raepa_ouvraep_p.qualglocz
COMMENT ON COLUMN raepa.raepa_ouvraep_p.qualglocz IS 'Qualité de la géolocalisation altimétrique (Z)
Codes de la table VAL_RAEPA_QUALITE_GEOLOC';


-- raepa_ouvraep_p.datemaj
COMMENT ON COLUMN raepa.raepa_ouvraep_p.datemaj IS 'Date de la dernière mise à jour des informations';


-- raepa_ouvraep_p.sourmaj
COMMENT ON COLUMN raepa.raepa_ouvraep_p.sourmaj IS 'Source de la mise à jour';


-- raepa_ouvraep_p.qualannee
COMMENT ON COLUMN raepa.raepa_ouvraep_p.qualannee IS 'Fiabilité, lorsque ANDEBPOSE = ANFINPOSE, de l''année de
mise en service
Codes de la table VAL_RAEPA_QUALITE_ANPOSE';


-- raepa_ouvraep_p.dategeoloc
COMMENT ON COLUMN raepa.raepa_ouvraep_p.dategeoloc IS 'Date de la géolocalisation';


-- raepa_ouvraep_p.sourgeoloc
COMMENT ON COLUMN raepa.raepa_ouvraep_p.sourgeoloc IS 'Auteur de la géolocalisation';


-- raepa_ouvraep_p.sourattrib
COMMENT ON COLUMN raepa.raepa_ouvraep_p.sourattrib IS 'Auteur de la saisie des données attributaires (lorsque différent
de l''auteur de la géolocalisation)';


-- raepa_ouvraep_p.geom
COMMENT ON COLUMN raepa.raepa_ouvraep_p.geom IS 'Géométrie';


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
    datemaj date DEFAULT '2019-08-15'::date NOT NULL,
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
    _temp_data public.hstore
);


-- raepa_ouvrass_p
COMMENT ON TABLE raepa.raepa_ouvrass_p IS 'Table des ouvrages du réseau d''assainissement collectif';


-- raepa_ouvrass_p.id
COMMENT ON COLUMN raepa.raepa_ouvrass_p.id IS 'Identifiant numérique auto (clé primaire)';


-- raepa_ouvrass_p.idouvrage
COMMENT ON COLUMN raepa.raepa_ouvrass_p.idouvrage IS 'Identifiant de l''ouvrage';


-- raepa_ouvrass_p.x
COMMENT ON COLUMN raepa.raepa_ouvrass_p.x IS 'Coordonnée X Lambert 93 (en mètres)';


-- raepa_ouvrass_p.y
COMMENT ON COLUMN raepa.raepa_ouvrass_p.y IS 'Coordonnée X Lambert 93 (en mètres)';


-- raepa_ouvrass_p.mouvrage
COMMENT ON COLUMN raepa.raepa_ouvrass_p.mouvrage IS 'Maître d''ouvrage du réseau';


-- raepa_ouvrass_p.gexploit
COMMENT ON COLUMN raepa.raepa_ouvrass_p.gexploit IS 'Gestionnaire exploitant du réseau';


-- raepa_ouvrass_p.typreseau
COMMENT ON COLUMN raepa.raepa_ouvrass_p.typreseau IS 'Type du réseau d''assainissement collectif
Codes de la table VAL_RAEPA_TYP_RESEAU_ASS';


-- raepa_ouvrass_p.fnouvass
COMMENT ON COLUMN raepa.raepa_ouvrass_p.fnouvass IS 'Fonction de l''ouvrage d''assainissement collectif
Codes de la table VAL_RAEPA_FONC_OUV_ASS';


-- raepa_ouvrass_p.anfinpose
COMMENT ON COLUMN raepa.raepa_ouvrass_p.anfinpose IS 'Année marquant la fin de la période de mise en service de
l''ouvrage';


-- raepa_ouvrass_p.idcanamont
COMMENT ON COLUMN raepa.raepa_ouvrass_p.idcanamont IS 'Identifiants des canalisations d''amont de l''ouvrage (clés
étrangères)';


-- raepa_ouvrass_p.idcanaval
COMMENT ON COLUMN raepa.raepa_ouvrass_p.idcanaval IS 'Identifiants des canalisations d''aval de l''ouvrage (clés
étrangères)';


-- raepa_ouvrass_p.idcanppale
COMMENT ON COLUMN raepa.raepa_ouvrass_p.idcanppale IS 'Identifiant de la canalisation principale (clé étrangère)';


-- raepa_ouvrass_p.z
COMMENT ON COLUMN raepa.raepa_ouvrass_p.z IS 'Altitude (en mètres, référentiel NGF-IGN69)';


-- raepa_ouvrass_p._ztampon
COMMENT ON COLUMN raepa.raepa_ouvrass_p._ztampon IS 'Altitude du tampon (en mètres, référentiel NGF-IGN69)';


-- raepa_ouvrass_p._angletampon
COMMENT ON COLUMN raepa.raepa_ouvrass_p._angletampon IS 'Angle du tampon';


-- raepa_ouvrass_p.andebpose
COMMENT ON COLUMN raepa.raepa_ouvrass_p.andebpose IS 'Année marquant le début de la période de mise en service de
l''ouvrage';


-- raepa_ouvrass_p.qualglocxy
COMMENT ON COLUMN raepa.raepa_ouvrass_p.qualglocxy IS 'Qualité de la géolocalisation planimétrique (XY)
Codes de la table VAL_RAEPA_QUALITE_GEOLOC';


-- raepa_ouvrass_p.qualglocz
COMMENT ON COLUMN raepa.raepa_ouvrass_p.qualglocz IS 'Qualité de la géolocalisation altimétrique (Z)
Codes de la table VAL_RAEPA_QUALITE_GEOLOC';


-- raepa_ouvrass_p.datemaj
COMMENT ON COLUMN raepa.raepa_ouvrass_p.datemaj IS 'Date de la dernière mise à jour des informations';


-- raepa_ouvrass_p.sourmaj
COMMENT ON COLUMN raepa.raepa_ouvrass_p.sourmaj IS 'Source de la mise à jour';


-- raepa_ouvrass_p.qualannee
COMMENT ON COLUMN raepa.raepa_ouvrass_p.qualannee IS 'Fiabilité, lorsque ANDEBPOSE = ANFINPOSE, de l''année de
mise en service
Codes de la table VAL_RAEPA_QUALITE_ANPOSE';


-- raepa_ouvrass_p.dategeoloc
COMMENT ON COLUMN raepa.raepa_ouvrass_p.dategeoloc IS 'Date de la géolocalisation';


-- raepa_ouvrass_p.sourgeoloc
COMMENT ON COLUMN raepa.raepa_ouvrass_p.sourgeoloc IS 'Auteur de la géolocalisation';


-- raepa_ouvrass_p.sourattrib
COMMENT ON COLUMN raepa.raepa_ouvrass_p.sourattrib IS 'Auteur de la saisie des données attributaires (lorsque différent
de l''auteur de la géolocalisation)';


-- raepa_ouvrass_p._source_historique
COMMENT ON COLUMN raepa.raepa_ouvrass_p._source_historique IS 'Source de la donnée ( si2g ou geomap)';


-- raepa_ouvrass_p._code_chantier
COMMENT ON COLUMN raepa.raepa_ouvrass_p._code_chantier IS 'Code du chantier, qui doit être explicite et unique entre les chantiers. Par ex : SOISSONS-PL REPUBLIQUE-2018';


-- raepa_ouvrass_p._date_import
COMMENT ON COLUMN raepa.raepa_ouvrass_p._date_import IS 'Date de l''import';


-- raepa_ouvrass_p.geom
COMMENT ON COLUMN raepa.raepa_ouvrass_p.geom IS 'Géométrie';


-- raepa_ouvrass_p._geom_emprise
COMMENT ON COLUMN raepa.raepa_ouvrass_p._geom_emprise IS 'Emprise de l’ouvrage (polygone). Optionnel';


-- raepa_ouvrass_p._temp_data
COMMENT ON COLUMN raepa.raepa_ouvrass_p._temp_data IS 'Champ pour ajouter des données temporaires pendant l''import';


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


-- raepa_reparaep_p.id
COMMENT ON COLUMN raepa.raepa_reparaep_p.id IS 'Identifiant numérique auto (clé primaire)';


-- raepa_reparaep_p.idrepar
COMMENT ON COLUMN raepa.raepa_reparaep_p.idrepar IS 'Identifiant de la réparation effectuée';


-- raepa_reparaep_p.x
COMMENT ON COLUMN raepa.raepa_reparaep_p.x IS 'Coordonnée X Lambert 93 (en mètres)';


-- raepa_reparaep_p.y
COMMENT ON COLUMN raepa.raepa_reparaep_p.y IS 'Coordonnée X Lambert 93 (en mètres)';


-- raepa_reparaep_p.supprepare
COMMENT ON COLUMN raepa.raepa_reparaep_p.supprepare IS 'Type du support de la réparation
Codes de la table VAL_RAEPA_SUPPORT_REPARATION';


-- raepa_reparaep_p.defreparee
COMMENT ON COLUMN raepa.raepa_reparaep_p.defreparee IS 'Type de la défaillance réparée
Codes de la table VAL_RAEPA_TYPE_DEFAILLANCE';


-- raepa_reparaep_p.idsuprepar
COMMENT ON COLUMN raepa.raepa_reparaep_p.idsuprepar IS 'Identifiant du support de la réparation (clé étrangère)';


-- raepa_reparaep_p.daterepar
COMMENT ON COLUMN raepa.raepa_reparaep_p.daterepar IS 'Date de l''intervention en réparation';


-- raepa_reparaep_p.mouvrage
COMMENT ON COLUMN raepa.raepa_reparaep_p.mouvrage IS 'Maître d''ouvrage de la réparation';


-- raepa_reparaep_p.geom
COMMENT ON COLUMN raepa.raepa_reparaep_p.geom IS 'Géométrie';


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


-- raepa_reparass_p.id
COMMENT ON COLUMN raepa.raepa_reparass_p.id IS 'Identifiant numérique auto (clé primaire)';


-- raepa_reparass_p.idrepar
COMMENT ON COLUMN raepa.raepa_reparass_p.idrepar IS 'Identifiant de la réparation effectuée';


-- raepa_reparass_p.x
COMMENT ON COLUMN raepa.raepa_reparass_p.x IS 'Coordonnée X Lambert 93 (en mètres)';


-- raepa_reparass_p.y
COMMENT ON COLUMN raepa.raepa_reparass_p.y IS 'Coordonnée X Lambert 93 (en mètres)';


-- raepa_reparass_p.supprepare
COMMENT ON COLUMN raepa.raepa_reparass_p.supprepare IS 'Type du support de la réparation
Codes de la table VAL_RAEPA_SUPPORT_REPARATION';


-- raepa_reparass_p.defreparee
COMMENT ON COLUMN raepa.raepa_reparass_p.defreparee IS 'Type de la défaillance réparée
Codes de la table VAL_RAEPA_TYPE_DEFAILLANCE';


-- raepa_reparass_p.idsuprepar
COMMENT ON COLUMN raepa.raepa_reparass_p.idsuprepar IS 'Identifiant du support de la réparation (clé étrangère)';


-- raepa_reparass_p.daterepar
COMMENT ON COLUMN raepa.raepa_reparass_p.daterepar IS 'Date de l''intervention en réparation';


-- raepa_reparass_p.mouvrage
COMMENT ON COLUMN raepa.raepa_reparass_p.mouvrage IS 'Maître d''ouvrage de la réparation';


-- raepa_reparass_p._typeintervention
COMMENT ON COLUMN raepa.raepa_reparass_p._typeintervention IS 'Type d’intervention : réparation, curage, inspection';


-- raepa_reparass_p._dateprevue
COMMENT ON COLUMN raepa.raepa_reparass_p._dateprevue IS 'Date d’intervention prévue';


-- raepa_reparass_p._etatcanalisation
COMMENT ON COLUMN raepa.raepa_reparass_p._etatcanalisation IS 'Etat de la canalisation à la date d’intervention';


-- raepa_reparass_p._frequencecuragepreventif
COMMENT ON COLUMN raepa.raepa_reparass_p._frequencecuragepreventif IS 'Fréquence du curage préventif en mois';


-- raepa_reparass_p._idinterventionparent
COMMENT ON COLUMN raepa.raepa_reparass_p._idinterventionparent IS 'Identifiant de l’intervention parente, par exemple si le parent est un curage préventif qui entraîne une réparation';


-- raepa_reparass_p.geom
COMMENT ON COLUMN raepa.raepa_reparass_p.geom IS 'Géométrie';


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


-- sys_liste_table.id
COMMENT ON COLUMN raepa.sys_liste_table.id IS 'Identifiant';


-- sys_liste_table.nom
COMMENT ON COLUMN raepa.sys_liste_table.nom IS 'Nom de la table dans la base de données';


-- sys_liste_table.code
COMMENT ON COLUMN raepa.sys_liste_table.code IS 'Code en 3 caractères, par exemple can pour les canalisations';


-- sys_liste_table.typereseau
COMMENT ON COLUMN raepa.sys_liste_table.typereseau IS 'Type de réseau : AEP ou ASS';


-- sys_liste_table.cleprimaire
COMMENT ON COLUMN raepa.sys_liste_table.cleprimaire IS 'Clé primaire';


-- sys_liste_table.libelle
COMMENT ON COLUMN raepa.sys_liste_table.libelle IS 'Libellé (utilisable dans QGIS par exemple)';


-- sys_liste_table.commentaire
COMMENT ON COLUMN raepa.sys_liste_table.commentaire IS 'Commentaire sur la table';


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


-- sys_organisme_gestionnaire.id
COMMENT ON COLUMN raepa.sys_organisme_gestionnaire.id IS 'Identifiant';


-- sys_organisme_gestionnaire.nom
COMMENT ON COLUMN raepa.sys_organisme_gestionnaire.nom IS 'Nom de l’organisme gestionnaire';


-- sys_organisme_gestionnaire.siren
COMMENT ON COLUMN raepa.sys_organisme_gestionnaire.siren IS 'SIREN. Code SIREN, ex 240200477 pour la CAS';


-- sys_organisme_gestionnaire.code
COMMENT ON COLUMN raepa.sys_organisme_gestionnaire.code IS 'Nom abbrégé en 3 caractères. Exemple : CAS pour la Communauté d’agglomération du Soissonnais';


-- sys_organisme_gestionnaire.actif
COMMENT ON COLUMN raepa.sys_organisme_gestionnaire.actif IS 'Si il est actif (le dernier l’emporte dans les calculs d’identifiants)';


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


-- sys_structure_metadonnee.id
COMMENT ON COLUMN raepa.sys_structure_metadonnee.id IS 'Identifiant';


-- sys_structure_metadonnee.date_ajout
COMMENT ON COLUMN raepa.sys_structure_metadonnee.date_ajout IS 'Date d’ajout';


-- sys_structure_metadonnee.version
COMMENT ON COLUMN raepa.sys_structure_metadonnee.version IS 'Version de la structure du schéma RAEPA';


-- sys_structure_metadonnee.description
COMMENT ON COLUMN raepa.sys_structure_metadonnee.description IS 'Description ';


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


-- val_raepa_cat_canal_ae.code
COMMENT ON COLUMN raepa.val_raepa_cat_canal_ae.code IS 'Code';


-- val_raepa_cat_canal_ae.libelle
COMMENT ON COLUMN raepa.val_raepa_cat_canal_ae.libelle IS 'Libellé';


-- val_raepa_cat_canal_ae.description
COMMENT ON COLUMN raepa.val_raepa_cat_canal_ae.description IS 'Description ';


-- val_raepa_cat_canal_ae.ordre
COMMENT ON COLUMN raepa.val_raepa_cat_canal_ae.ordre IS 'Ordre';


-- val_raepa_cat_canal_ass
CREATE TABLE raepa.val_raepa_cat_canal_ass (
    code character varying(2) NOT NULL,
    libelle text NOT NULL,
    description text,
    ordre smallint
);


-- val_raepa_cat_canal_ass
COMMENT ON TABLE raepa.val_raepa_cat_canal_ass IS 'Nomenclature pour la catégorie de canalisation ASS';


-- val_raepa_cat_canal_ass.code
COMMENT ON COLUMN raepa.val_raepa_cat_canal_ass.code IS 'Code';


-- val_raepa_cat_canal_ass.libelle
COMMENT ON COLUMN raepa.val_raepa_cat_canal_ass.libelle IS 'Libellé';


-- val_raepa_cat_canal_ass.description
COMMENT ON COLUMN raepa.val_raepa_cat_canal_ass.description IS 'Description ';


-- val_raepa_cat_canal_ass.ordre
COMMENT ON COLUMN raepa.val_raepa_cat_canal_ass.ordre IS 'Ordre';


-- val_raepa_fonc_app_ae
CREATE TABLE raepa.val_raepa_fonc_app_ae (
    code character varying(2) NOT NULL,
    libelle text NOT NULL,
    description text,
    ordre smallint
);


-- val_raepa_fonc_app_ae
COMMENT ON TABLE raepa.val_raepa_fonc_app_ae IS 'Nomenclature pour la fonction des appareils AEP';


-- val_raepa_fonc_app_ae.code
COMMENT ON COLUMN raepa.val_raepa_fonc_app_ae.code IS 'Code';


-- val_raepa_fonc_app_ae.libelle
COMMENT ON COLUMN raepa.val_raepa_fonc_app_ae.libelle IS 'Libellé';


-- val_raepa_fonc_app_ae.description
COMMENT ON COLUMN raepa.val_raepa_fonc_app_ae.description IS 'Description ';


-- val_raepa_fonc_app_ae.ordre
COMMENT ON COLUMN raepa.val_raepa_fonc_app_ae.ordre IS 'Ordre';


-- val_raepa_fonc_app_ass
CREATE TABLE raepa.val_raepa_fonc_app_ass (
    code character varying(2) NOT NULL,
    libelle text NOT NULL,
    description text,
    ordre smallint
);


-- val_raepa_fonc_app_ass
COMMENT ON TABLE raepa.val_raepa_fonc_app_ass IS 'Nomenclature pour la fonction des appareils ASS';


-- val_raepa_fonc_app_ass.code
COMMENT ON COLUMN raepa.val_raepa_fonc_app_ass.code IS 'Code';


-- val_raepa_fonc_app_ass.libelle
COMMENT ON COLUMN raepa.val_raepa_fonc_app_ass.libelle IS 'Libellé';


-- val_raepa_fonc_app_ass.description
COMMENT ON COLUMN raepa.val_raepa_fonc_app_ass.description IS 'Description ';


-- val_raepa_fonc_app_ass.ordre
COMMENT ON COLUMN raepa.val_raepa_fonc_app_ass.ordre IS 'Ordre';


-- val_raepa_fonc_canal_ae
CREATE TABLE raepa.val_raepa_fonc_canal_ae (
    code character varying(2) NOT NULL,
    libelle text NOT NULL,
    description text,
    ordre smallint
);


-- val_raepa_fonc_canal_ae
COMMENT ON TABLE raepa.val_raepa_fonc_canal_ae IS 'Nomenclature pour la fonction de la canalisation AEP';


-- val_raepa_fonc_canal_ae.code
COMMENT ON COLUMN raepa.val_raepa_fonc_canal_ae.code IS 'Code';


-- val_raepa_fonc_canal_ae.libelle
COMMENT ON COLUMN raepa.val_raepa_fonc_canal_ae.libelle IS 'Libellé';


-- val_raepa_fonc_canal_ae.description
COMMENT ON COLUMN raepa.val_raepa_fonc_canal_ae.description IS 'Description ';


-- val_raepa_fonc_canal_ae.ordre
COMMENT ON COLUMN raepa.val_raepa_fonc_canal_ae.ordre IS 'Ordre';


-- val_raepa_fonc_canal_ass
CREATE TABLE raepa.val_raepa_fonc_canal_ass (
    code character varying(2) NOT NULL,
    libelle text NOT NULL,
    description text,
    ordre smallint
);


-- val_raepa_fonc_canal_ass
COMMENT ON TABLE raepa.val_raepa_fonc_canal_ass IS 'Nomenclature pour la fonction de la canalisation ASS';


-- val_raepa_fonc_canal_ass.code
COMMENT ON COLUMN raepa.val_raepa_fonc_canal_ass.code IS 'Code';


-- val_raepa_fonc_canal_ass.libelle
COMMENT ON COLUMN raepa.val_raepa_fonc_canal_ass.libelle IS 'Libellé';


-- val_raepa_fonc_canal_ass.description
COMMENT ON COLUMN raepa.val_raepa_fonc_canal_ass.description IS 'Description ';


-- val_raepa_fonc_canal_ass.ordre
COMMENT ON COLUMN raepa.val_raepa_fonc_canal_ass.ordre IS 'Ordre';


-- val_raepa_fonc_ouv_ae
CREATE TABLE raepa.val_raepa_fonc_ouv_ae (
    code character varying(2) NOT NULL,
    libelle text NOT NULL,
    description text,
    ordre smallint
);


-- val_raepa_fonc_ouv_ae
COMMENT ON TABLE raepa.val_raepa_fonc_ouv_ae IS 'Nomenclature pour la fonction des ouvrages AEP';


-- val_raepa_fonc_ouv_ae.code
COMMENT ON COLUMN raepa.val_raepa_fonc_ouv_ae.code IS 'Code';


-- val_raepa_fonc_ouv_ae.libelle
COMMENT ON COLUMN raepa.val_raepa_fonc_ouv_ae.libelle IS 'Libellé';


-- val_raepa_fonc_ouv_ae.description
COMMENT ON COLUMN raepa.val_raepa_fonc_ouv_ae.description IS 'Description ';


-- val_raepa_fonc_ouv_ae.ordre
COMMENT ON COLUMN raepa.val_raepa_fonc_ouv_ae.ordre IS 'Ordre';


-- val_raepa_fonc_ouv_ass
CREATE TABLE raepa.val_raepa_fonc_ouv_ass (
    code character varying(2) NOT NULL,
    libelle text NOT NULL,
    description text,
    ordre smallint
);


-- val_raepa_fonc_ouv_ass
COMMENT ON TABLE raepa.val_raepa_fonc_ouv_ass IS 'Nomenclature pour la fonction des ouvrages ASS';


-- val_raepa_fonc_ouv_ass.code
COMMENT ON COLUMN raepa.val_raepa_fonc_ouv_ass.code IS 'Code';


-- val_raepa_fonc_ouv_ass.libelle
COMMENT ON COLUMN raepa.val_raepa_fonc_ouv_ass.libelle IS 'Libellé';


-- val_raepa_fonc_ouv_ass.description
COMMENT ON COLUMN raepa.val_raepa_fonc_ouv_ass.description IS 'Description ';


-- val_raepa_fonc_ouv_ass.ordre
COMMENT ON COLUMN raepa.val_raepa_fonc_ouv_ass.ordre IS 'Ordre';


-- val_raepa_materiau
CREATE TABLE raepa.val_raepa_materiau (
    code character varying(2) NOT NULL,
    libelle text NOT NULL,
    description text,
    ordre smallint
);


-- val_raepa_materiau
COMMENT ON TABLE raepa.val_raepa_materiau IS 'Nomenclature pour les matériau';


-- val_raepa_materiau.code
COMMENT ON COLUMN raepa.val_raepa_materiau.code IS 'Code';


-- val_raepa_materiau.libelle
COMMENT ON COLUMN raepa.val_raepa_materiau.libelle IS 'Libellé';


-- val_raepa_materiau.description
COMMENT ON COLUMN raepa.val_raepa_materiau.description IS 'Description ';


-- val_raepa_materiau.ordre
COMMENT ON COLUMN raepa.val_raepa_materiau.ordre IS 'Ordre';


-- val_raepa_mode_circulation
CREATE TABLE raepa.val_raepa_mode_circulation (
    code character varying(2) NOT NULL,
    libelle text NOT NULL,
    description text,
    ordre smallint
);


-- val_raepa_mode_circulation
COMMENT ON TABLE raepa.val_raepa_mode_circulation IS 'Nomenclature pour le mode de circulation';


-- val_raepa_mode_circulation.code
COMMENT ON COLUMN raepa.val_raepa_mode_circulation.code IS 'Code';


-- val_raepa_mode_circulation.libelle
COMMENT ON COLUMN raepa.val_raepa_mode_circulation.libelle IS 'Libellé';


-- val_raepa_mode_circulation.description
COMMENT ON COLUMN raepa.val_raepa_mode_circulation.description IS 'Description ';


-- val_raepa_mode_circulation.ordre
COMMENT ON COLUMN raepa.val_raepa_mode_circulation.ordre IS 'Ordre';


-- val_raepa_qualite_anpose
CREATE TABLE raepa.val_raepa_qualite_anpose (
    code character varying(2) NOT NULL,
    libelle text NOT NULL,
    description text,
    ordre smallint
);


-- val_raepa_qualite_anpose
COMMENT ON TABLE raepa.val_raepa_qualite_anpose IS 'Nomenclature pour la qualité de l’année de pose';


-- val_raepa_qualite_anpose.code
COMMENT ON COLUMN raepa.val_raepa_qualite_anpose.code IS 'Code';


-- val_raepa_qualite_anpose.libelle
COMMENT ON COLUMN raepa.val_raepa_qualite_anpose.libelle IS 'Libellé';


-- val_raepa_qualite_anpose.description
COMMENT ON COLUMN raepa.val_raepa_qualite_anpose.description IS 'Description ';


-- val_raepa_qualite_anpose.ordre
COMMENT ON COLUMN raepa.val_raepa_qualite_anpose.ordre IS 'Ordre';


-- val_raepa_qualite_geoloc
CREATE TABLE raepa.val_raepa_qualite_geoloc (
    code character varying(2) NOT NULL,
    libelle text NOT NULL,
    description text,
    ordre smallint
);


-- val_raepa_qualite_geoloc
COMMENT ON TABLE raepa.val_raepa_qualite_geoloc IS 'Nomenclature pour la qualité de la géolocalisation';


-- val_raepa_qualite_geoloc.code
COMMENT ON COLUMN raepa.val_raepa_qualite_geoloc.code IS 'Code';


-- val_raepa_qualite_geoloc.libelle
COMMENT ON COLUMN raepa.val_raepa_qualite_geoloc.libelle IS 'Libellé';


-- val_raepa_qualite_geoloc.description
COMMENT ON COLUMN raepa.val_raepa_qualite_geoloc.description IS 'Description ';


-- val_raepa_qualite_geoloc.ordre
COMMENT ON COLUMN raepa.val_raepa_qualite_geoloc.ordre IS 'Ordre';


-- val_raepa_support_reparation
CREATE TABLE raepa.val_raepa_support_reparation (
    code character varying(2) NOT NULL,
    libelle text NOT NULL,
    description text,
    ordre smallint
);


-- val_raepa_support_reparation
COMMENT ON TABLE raepa.val_raepa_support_reparation IS 'Nomenclature pour le support des incidents';


-- val_raepa_support_reparation.code
COMMENT ON COLUMN raepa.val_raepa_support_reparation.code IS 'Code';


-- val_raepa_support_reparation.libelle
COMMENT ON COLUMN raepa.val_raepa_support_reparation.libelle IS 'Libellé';


-- val_raepa_support_reparation.description
COMMENT ON COLUMN raepa.val_raepa_support_reparation.description IS 'Description ';


-- val_raepa_support_reparation.ordre
COMMENT ON COLUMN raepa.val_raepa_support_reparation.ordre IS 'Ordre';


-- val_raepa_typ_reseau_ass
CREATE TABLE raepa.val_raepa_typ_reseau_ass (
    code character varying(2) NOT NULL,
    libelle text NOT NULL,
    description text,
    ordre smallint
);


-- val_raepa_typ_reseau_ass
COMMENT ON TABLE raepa.val_raepa_typ_reseau_ass IS 'Nomenclature pour le type de réseau ASS';


-- val_raepa_typ_reseau_ass.code
COMMENT ON COLUMN raepa.val_raepa_typ_reseau_ass.code IS 'Code';


-- val_raepa_typ_reseau_ass.libelle
COMMENT ON COLUMN raepa.val_raepa_typ_reseau_ass.libelle IS 'Libellé';


-- val_raepa_typ_reseau_ass.description
COMMENT ON COLUMN raepa.val_raepa_typ_reseau_ass.description IS 'Description ';


-- val_raepa_typ_reseau_ass.ordre
COMMENT ON COLUMN raepa.val_raepa_typ_reseau_ass.ordre IS 'Ordre';


-- val_raepa_type_defaillance
CREATE TABLE raepa.val_raepa_type_defaillance (
    code character varying(2) NOT NULL,
    libelle text NOT NULL,
    description text,
    ordre smallint
);


-- val_raepa_type_defaillance
COMMENT ON TABLE raepa.val_raepa_type_defaillance IS 'Nomenclature pour le type de défaillance';


-- val_raepa_type_defaillance.code
COMMENT ON COLUMN raepa.val_raepa_type_defaillance.code IS 'Code';


-- val_raepa_type_defaillance.libelle
COMMENT ON COLUMN raepa.val_raepa_type_defaillance.libelle IS 'Libellé';


-- val_raepa_type_defaillance.description
COMMENT ON COLUMN raepa.val_raepa_type_defaillance.description IS 'Description ';


-- val_raepa_type_defaillance.ordre
COMMENT ON COLUMN raepa.val_raepa_type_defaillance.ordre IS 'Ordre';


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
