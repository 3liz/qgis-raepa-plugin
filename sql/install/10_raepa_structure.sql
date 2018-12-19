BEGIN;

-- Table val_raepa_materiau
--DROP SCHEMA IF EXISTS "raepa" CASCADE;
CREATE SCHEMA IF NOT EXISTS "raepa" ;
SET search_path TO raepa,public ;
CREATE TABLE IF NOT EXISTS "val_raepa_materiau" () ;

COMMENT ON TABLE "val_raepa_materiau" IS 'Nomenclature pour les matériau' ;

ALTER TABLE "val_raepa_materiau" ADD COLUMN IF NOT EXISTS "code" varchar(2) NOT NULL ;
COMMENT ON COLUMN "val_raepa_materiau"."code" IS 'Code' ;

ALTER TABLE "val_raepa_materiau" ADD COLUMN IF NOT EXISTS "libelle" text NOT NULL ;
COMMENT ON COLUMN "val_raepa_materiau"."libelle" IS 'Libellé' ;

ALTER TABLE "val_raepa_materiau" ADD COLUMN IF NOT EXISTS "description" text  ;
COMMENT ON COLUMN "val_raepa_materiau"."description" IS 'Description ' ;

ALTER TABLE "val_raepa_materiau" ADD COLUMN IF NOT EXISTS "ordre" smallint  ;
COMMENT ON COLUMN "val_raepa_materiau"."ordre" IS 'Ordre' ;

ALTER TABLE "val_raepa_materiau" ADD PRIMARY KEY ("code");


-- Table val_raepa_mode_circulation
CREATE SCHEMA IF NOT EXISTS "raepa" ;
SET search_path TO raepa,public ;
CREATE TABLE IF NOT EXISTS "val_raepa_mode_circulation" () ;

COMMENT ON TABLE "val_raepa_mode_circulation" IS 'Nomenclature pour le mode de circulation' ;

ALTER TABLE "val_raepa_mode_circulation" ADD COLUMN IF NOT EXISTS "code" varchar(2) NOT NULL ;
COMMENT ON COLUMN "val_raepa_mode_circulation"."code" IS 'Code' ;

ALTER TABLE "val_raepa_mode_circulation" ADD COLUMN IF NOT EXISTS "libelle" text NOT NULL ;
COMMENT ON COLUMN "val_raepa_mode_circulation"."libelle" IS 'Libellé' ;

ALTER TABLE "val_raepa_mode_circulation" ADD COLUMN IF NOT EXISTS "description" text  ;
COMMENT ON COLUMN "val_raepa_mode_circulation"."description" IS 'Description ' ;

ALTER TABLE "val_raepa_mode_circulation" ADD COLUMN IF NOT EXISTS "ordre" smallint  ;
COMMENT ON COLUMN "val_raepa_mode_circulation"."ordre" IS 'Ordre' ;

ALTER TABLE "val_raepa_mode_circulation" ADD PRIMARY KEY ("code");


-- Table val_raepa_cat_canal_ae
CREATE SCHEMA IF NOT EXISTS "raepa" ;
SET search_path TO raepa,public ;
CREATE TABLE IF NOT EXISTS "val_raepa_cat_canal_ae" () ;

COMMENT ON TABLE "val_raepa_cat_canal_ae" IS 'Nomenclature pour la catégorie de canalisation AEP' ;

ALTER TABLE "val_raepa_cat_canal_ae" ADD COLUMN IF NOT EXISTS "code" varchar(2) NOT NULL ;
COMMENT ON COLUMN "val_raepa_cat_canal_ae"."code" IS 'Code' ;

ALTER TABLE "val_raepa_cat_canal_ae" ADD COLUMN IF NOT EXISTS "libelle" text NOT NULL ;
COMMENT ON COLUMN "val_raepa_cat_canal_ae"."libelle" IS 'Libellé' ;

ALTER TABLE "val_raepa_cat_canal_ae" ADD COLUMN IF NOT EXISTS "description" text  ;
COMMENT ON COLUMN "val_raepa_cat_canal_ae"."description" IS 'Description ' ;

ALTER TABLE "val_raepa_cat_canal_ae" ADD COLUMN IF NOT EXISTS "ordre" smallint  ;
COMMENT ON COLUMN "val_raepa_cat_canal_ae"."ordre" IS 'Ordre' ;

ALTER TABLE "val_raepa_cat_canal_ae" ADD PRIMARY KEY ("code");


-- Table val_raepa_fonc_canal_ae
CREATE SCHEMA IF NOT EXISTS "raepa" ;
SET search_path TO raepa,public ;
CREATE TABLE IF NOT EXISTS "val_raepa_fonc_canal_ae" () ;

COMMENT ON TABLE "val_raepa_fonc_canal_ae" IS 'Nomenclature pour la fonction de la canalisation AEP' ;

ALTER TABLE "val_raepa_fonc_canal_ae" ADD COLUMN IF NOT EXISTS "code" varchar(2) NOT NULL ;
COMMENT ON COLUMN "val_raepa_fonc_canal_ae"."code" IS 'Code' ;

ALTER TABLE "val_raepa_fonc_canal_ae" ADD COLUMN IF NOT EXISTS "libelle" text NOT NULL ;
COMMENT ON COLUMN "val_raepa_fonc_canal_ae"."libelle" IS 'Libellé' ;

ALTER TABLE "val_raepa_fonc_canal_ae" ADD COLUMN IF NOT EXISTS "description" text  ;
COMMENT ON COLUMN "val_raepa_fonc_canal_ae"."description" IS 'Description ' ;

ALTER TABLE "val_raepa_fonc_canal_ae" ADD COLUMN IF NOT EXISTS "ordre" smallint  ;
COMMENT ON COLUMN "val_raepa_fonc_canal_ae"."ordre" IS 'Ordre' ;

ALTER TABLE "val_raepa_fonc_canal_ae" ADD PRIMARY KEY ("code");


-- Table val_raepa_cat_canal_ass
CREATE SCHEMA IF NOT EXISTS "raepa" ;
SET search_path TO raepa,public ;
CREATE TABLE IF NOT EXISTS "val_raepa_cat_canal_ass" () ;

COMMENT ON TABLE "val_raepa_cat_canal_ass" IS 'Nomenclature pour la catégorie de canalisation ASS' ;

ALTER TABLE "val_raepa_cat_canal_ass" ADD COLUMN IF NOT EXISTS "code" varchar(2) NOT NULL ;
COMMENT ON COLUMN "val_raepa_cat_canal_ass"."code" IS 'Code' ;

ALTER TABLE "val_raepa_cat_canal_ass" ADD COLUMN IF NOT EXISTS "libelle" text NOT NULL ;
COMMENT ON COLUMN "val_raepa_cat_canal_ass"."libelle" IS 'Libellé' ;

ALTER TABLE "val_raepa_cat_canal_ass" ADD COLUMN IF NOT EXISTS "description" text  ;
COMMENT ON COLUMN "val_raepa_cat_canal_ass"."description" IS 'Description ' ;

ALTER TABLE "val_raepa_cat_canal_ass" ADD COLUMN IF NOT EXISTS "ordre" smallint  ;
COMMENT ON COLUMN "val_raepa_cat_canal_ass"."ordre" IS 'Ordre' ;

ALTER TABLE "val_raepa_cat_canal_ass" ADD PRIMARY KEY ("code");


-- Table val_raepa_fonc_canal_ass
CREATE SCHEMA IF NOT EXISTS "raepa" ;
SET search_path TO raepa,public ;
CREATE TABLE IF NOT EXISTS "val_raepa_fonc_canal_ass" () ;

COMMENT ON TABLE "val_raepa_fonc_canal_ass" IS 'Nomenclature pour la fonction de la canalisation ASS' ;

ALTER TABLE "val_raepa_fonc_canal_ass" ADD COLUMN IF NOT EXISTS "code" varchar(2) NOT NULL ;
COMMENT ON COLUMN "val_raepa_fonc_canal_ass"."code" IS 'Code' ;

ALTER TABLE "val_raepa_fonc_canal_ass" ADD COLUMN IF NOT EXISTS "libelle" text NOT NULL ;
COMMENT ON COLUMN "val_raepa_fonc_canal_ass"."libelle" IS 'Libellé' ;

ALTER TABLE "val_raepa_fonc_canal_ass" ADD COLUMN IF NOT EXISTS "description" text  ;
COMMENT ON COLUMN "val_raepa_fonc_canal_ass"."description" IS 'Description ' ;

ALTER TABLE "val_raepa_fonc_canal_ass" ADD COLUMN IF NOT EXISTS "ordre" smallint  ;
COMMENT ON COLUMN "val_raepa_fonc_canal_ass"."ordre" IS 'Ordre' ;

ALTER TABLE "val_raepa_fonc_canal_ass" ADD PRIMARY KEY ("code");


-- Table val_raepa_typ_reseau_ass
CREATE SCHEMA IF NOT EXISTS "raepa" ;
SET search_path TO raepa,public ;
CREATE TABLE IF NOT EXISTS "val_raepa_typ_reseau_ass" () ;

COMMENT ON TABLE "val_raepa_typ_reseau_ass" IS 'Nomenclature pour le type de réseau ASS' ;

ALTER TABLE "val_raepa_typ_reseau_ass" ADD COLUMN IF NOT EXISTS "code" varchar(2) NOT NULL ;
COMMENT ON COLUMN "val_raepa_typ_reseau_ass"."code" IS 'Code' ;

ALTER TABLE "val_raepa_typ_reseau_ass" ADD COLUMN IF NOT EXISTS "libelle" text NOT NULL ;
COMMENT ON COLUMN "val_raepa_typ_reseau_ass"."libelle" IS 'Libellé' ;

ALTER TABLE "val_raepa_typ_reseau_ass" ADD COLUMN IF NOT EXISTS "description" text  ;
COMMENT ON COLUMN "val_raepa_typ_reseau_ass"."description" IS 'Description ' ;

ALTER TABLE "val_raepa_typ_reseau_ass" ADD COLUMN IF NOT EXISTS "ordre" smallint  ;
COMMENT ON COLUMN "val_raepa_typ_reseau_ass"."ordre" IS 'Ordre' ;

ALTER TABLE "val_raepa_typ_reseau_ass" ADD PRIMARY KEY ("code");


-- Table val_raepa_fonc_app_ae
CREATE SCHEMA IF NOT EXISTS "raepa" ;
SET search_path TO raepa,public ;
CREATE TABLE IF NOT EXISTS "val_raepa_fonc_app_ae" () ;

COMMENT ON TABLE "val_raepa_fonc_app_ae" IS 'Nomenclature pour la fonction des appareils AEP' ;

ALTER TABLE "val_raepa_fonc_app_ae" ADD COLUMN IF NOT EXISTS "code" varchar(2) NOT NULL ;
COMMENT ON COLUMN "val_raepa_fonc_app_ae"."code" IS 'Code' ;

ALTER TABLE "val_raepa_fonc_app_ae" ADD COLUMN IF NOT EXISTS "libelle" text NOT NULL ;
COMMENT ON COLUMN "val_raepa_fonc_app_ae"."libelle" IS 'Libellé' ;

ALTER TABLE "val_raepa_fonc_app_ae" ADD COLUMN IF NOT EXISTS "description" text  ;
COMMENT ON COLUMN "val_raepa_fonc_app_ae"."description" IS 'Description ' ;

ALTER TABLE "val_raepa_fonc_app_ae" ADD COLUMN IF NOT EXISTS "ordre" smallint  ;
COMMENT ON COLUMN "val_raepa_fonc_app_ae"."ordre" IS 'Ordre' ;

ALTER TABLE "val_raepa_fonc_app_ae" ADD PRIMARY KEY ("code");


-- Table val_raepa_fonc_ouv_ae
CREATE SCHEMA IF NOT EXISTS "raepa" ;
SET search_path TO raepa,public ;
CREATE TABLE IF NOT EXISTS "val_raepa_fonc_ouv_ae" () ;

COMMENT ON TABLE "val_raepa_fonc_ouv_ae" IS 'Nomenclature pour la fonction des ouvrages AEP' ;

ALTER TABLE "val_raepa_fonc_ouv_ae" ADD COLUMN IF NOT EXISTS "code" varchar(2) NOT NULL ;
COMMENT ON COLUMN "val_raepa_fonc_ouv_ae"."code" IS 'Code' ;

ALTER TABLE "val_raepa_fonc_ouv_ae" ADD COLUMN IF NOT EXISTS "libelle" text NOT NULL ;
COMMENT ON COLUMN "val_raepa_fonc_ouv_ae"."libelle" IS 'Libellé' ;

ALTER TABLE "val_raepa_fonc_ouv_ae" ADD COLUMN IF NOT EXISTS "description" text  ;
COMMENT ON COLUMN "val_raepa_fonc_ouv_ae"."description" IS 'Description ' ;

ALTER TABLE "val_raepa_fonc_ouv_ae" ADD COLUMN IF NOT EXISTS "ordre" smallint  ;
COMMENT ON COLUMN "val_raepa_fonc_ouv_ae"."ordre" IS 'Ordre' ;

ALTER TABLE "val_raepa_fonc_ouv_ae" ADD PRIMARY KEY ("code");


-- Table val_raepa_fonc_app_ass
CREATE SCHEMA IF NOT EXISTS "raepa" ;
SET search_path TO raepa,public ;
CREATE TABLE IF NOT EXISTS "val_raepa_fonc_app_ass" () ;

COMMENT ON TABLE "val_raepa_fonc_app_ass" IS 'Nomenclature pour la fonction des appareils ASS' ;

ALTER TABLE "val_raepa_fonc_app_ass" ADD COLUMN IF NOT EXISTS "code" varchar(2) NOT NULL ;
COMMENT ON COLUMN "val_raepa_fonc_app_ass"."code" IS 'Code' ;

ALTER TABLE "val_raepa_fonc_app_ass" ADD COLUMN IF NOT EXISTS "libelle" text NOT NULL ;
COMMENT ON COLUMN "val_raepa_fonc_app_ass"."libelle" IS 'Libellé' ;

ALTER TABLE "val_raepa_fonc_app_ass" ADD COLUMN IF NOT EXISTS "description" text  ;
COMMENT ON COLUMN "val_raepa_fonc_app_ass"."description" IS 'Description ' ;

ALTER TABLE "val_raepa_fonc_app_ass" ADD COLUMN IF NOT EXISTS "ordre" smallint  ;
COMMENT ON COLUMN "val_raepa_fonc_app_ass"."ordre" IS 'Ordre' ;

ALTER TABLE "val_raepa_fonc_app_ass" ADD PRIMARY KEY ("code");


-- Table val_raepa_fonc_ouv_ass
CREATE SCHEMA IF NOT EXISTS "raepa" ;
SET search_path TO raepa,public ;
CREATE TABLE IF NOT EXISTS "val_raepa_fonc_ouv_ass" () ;

COMMENT ON TABLE "val_raepa_fonc_ouv_ass" IS 'Nomenclature pour la fonction des ouvrages ASS' ;

ALTER TABLE "val_raepa_fonc_ouv_ass" ADD COLUMN IF NOT EXISTS "code" varchar(2) NOT NULL ;
COMMENT ON COLUMN "val_raepa_fonc_ouv_ass"."code" IS 'Code' ;

ALTER TABLE "val_raepa_fonc_ouv_ass" ADD COLUMN IF NOT EXISTS "libelle" text NOT NULL ;
COMMENT ON COLUMN "val_raepa_fonc_ouv_ass"."libelle" IS 'Libellé' ;

ALTER TABLE "val_raepa_fonc_ouv_ass" ADD COLUMN IF NOT EXISTS "description" text  ;
COMMENT ON COLUMN "val_raepa_fonc_ouv_ass"."description" IS 'Description ' ;

ALTER TABLE "val_raepa_fonc_ouv_ass" ADD COLUMN IF NOT EXISTS "ordre" smallint  ;
COMMENT ON COLUMN "val_raepa_fonc_ouv_ass"."ordre" IS 'Ordre' ;

ALTER TABLE "val_raepa_fonc_ouv_ass" ADD PRIMARY KEY ("code");


-- Table val_raepa_support_reparation
CREATE SCHEMA IF NOT EXISTS "raepa" ;
SET search_path TO raepa,public ;
CREATE TABLE IF NOT EXISTS "val_raepa_support_reparation" () ;

COMMENT ON TABLE "val_raepa_support_reparation" IS 'Nomenclature pour le support des incidents' ;

ALTER TABLE "val_raepa_support_reparation" ADD COLUMN IF NOT EXISTS "code" varchar(2) NOT NULL ;
COMMENT ON COLUMN "val_raepa_support_reparation"."code" IS 'Code' ;

ALTER TABLE "val_raepa_support_reparation" ADD COLUMN IF NOT EXISTS "libelle" text NOT NULL ;
COMMENT ON COLUMN "val_raepa_support_reparation"."libelle" IS 'Libellé' ;

ALTER TABLE "val_raepa_support_reparation" ADD COLUMN IF NOT EXISTS "description" text  ;
COMMENT ON COLUMN "val_raepa_support_reparation"."description" IS 'Description ' ;

ALTER TABLE "val_raepa_support_reparation" ADD COLUMN IF NOT EXISTS "ordre" smallint  ;
COMMENT ON COLUMN "val_raepa_support_reparation"."ordre" IS 'Ordre' ;

ALTER TABLE "val_raepa_support_reparation" ADD PRIMARY KEY ("code");


-- Table val_raepa_type_defaillance
CREATE SCHEMA IF NOT EXISTS "raepa" ;
SET search_path TO raepa,public ;
CREATE TABLE IF NOT EXISTS "val_raepa_type_defaillance" () ;

COMMENT ON TABLE "val_raepa_type_defaillance" IS 'Nomenclature pour le type de défaillance' ;

ALTER TABLE "val_raepa_type_defaillance" ADD COLUMN IF NOT EXISTS "code" varchar(2) NOT NULL ;
COMMENT ON COLUMN "val_raepa_type_defaillance"."code" IS 'Code' ;

ALTER TABLE "val_raepa_type_defaillance" ADD COLUMN IF NOT EXISTS "libelle" text NOT NULL ;
COMMENT ON COLUMN "val_raepa_type_defaillance"."libelle" IS 'Libellé' ;

ALTER TABLE "val_raepa_type_defaillance" ADD COLUMN IF NOT EXISTS "description" text  ;
COMMENT ON COLUMN "val_raepa_type_defaillance"."description" IS 'Description ' ;

ALTER TABLE "val_raepa_type_defaillance" ADD COLUMN IF NOT EXISTS "ordre" smallint  ;
COMMENT ON COLUMN "val_raepa_type_defaillance"."ordre" IS 'Ordre' ;

ALTER TABLE "val_raepa_type_defaillance" ADD PRIMARY KEY ("code");


-- Table val_raepa_qualite_geoloc
CREATE SCHEMA IF NOT EXISTS "raepa" ;
SET search_path TO raepa,public ;
CREATE TABLE IF NOT EXISTS "val_raepa_qualite_geoloc" () ;

COMMENT ON TABLE "val_raepa_qualite_geoloc" IS 'Nomenclature pour la qualité de la géolocalisation' ;

ALTER TABLE "val_raepa_qualite_geoloc" ADD COLUMN IF NOT EXISTS "code" varchar(2) NOT NULL ;
COMMENT ON COLUMN "val_raepa_qualite_geoloc"."code" IS 'Code' ;

ALTER TABLE "val_raepa_qualite_geoloc" ADD COLUMN IF NOT EXISTS "libelle" text NOT NULL ;
COMMENT ON COLUMN "val_raepa_qualite_geoloc"."libelle" IS 'Libellé' ;

ALTER TABLE "val_raepa_qualite_geoloc" ADD COLUMN IF NOT EXISTS "description" text  ;
COMMENT ON COLUMN "val_raepa_qualite_geoloc"."description" IS 'Description ' ;

ALTER TABLE "val_raepa_qualite_geoloc" ADD COLUMN IF NOT EXISTS "ordre" smallint  ;
COMMENT ON COLUMN "val_raepa_qualite_geoloc"."ordre" IS 'Ordre' ;

ALTER TABLE "val_raepa_qualite_geoloc" ADD PRIMARY KEY ("code");


-- Table val_raepa_qualite_anpose
CREATE SCHEMA IF NOT EXISTS "raepa" ;
SET search_path TO raepa,public ;
CREATE TABLE IF NOT EXISTS "val_raepa_qualite_anpose" () ;

COMMENT ON TABLE "val_raepa_qualite_anpose" IS 'Nomenclature pour la qualité de l’année de pose' ;

ALTER TABLE "val_raepa_qualite_anpose" ADD COLUMN IF NOT EXISTS "code" varchar(2) NOT NULL ;
COMMENT ON COLUMN "val_raepa_qualite_anpose"."code" IS 'Code' ;

ALTER TABLE "val_raepa_qualite_anpose" ADD COLUMN IF NOT EXISTS "libelle" text NOT NULL ;
COMMENT ON COLUMN "val_raepa_qualite_anpose"."libelle" IS 'Libellé' ;

ALTER TABLE "val_raepa_qualite_anpose" ADD COLUMN IF NOT EXISTS "description" text  ;
COMMENT ON COLUMN "val_raepa_qualite_anpose"."description" IS 'Description ' ;

ALTER TABLE "val_raepa_qualite_anpose" ADD COLUMN IF NOT EXISTS "ordre" smallint  ;
COMMENT ON COLUMN "val_raepa_qualite_anpose"."ordre" IS 'Ordre' ;

ALTER TABLE "val_raepa_qualite_anpose" ADD PRIMARY KEY ("code");


-- Table _val_raepa_forme_canal_ass
CREATE SCHEMA IF NOT EXISTS "raepa" ;
SET search_path TO raepa,public ;
CREATE TABLE IF NOT EXISTS "_val_raepa_forme_canal_ass" () ;

COMMENT ON TABLE "_val_raepa_forme_canal_ass" IS 'Nomenclature pour la forme de la canalisation (ovoide, cylindrique, etc.)' ;

ALTER TABLE "_val_raepa_forme_canal_ass" ADD COLUMN IF NOT EXISTS "code" varchar(2) NOT NULL ;
COMMENT ON COLUMN "_val_raepa_forme_canal_ass"."code" IS 'Code' ;

ALTER TABLE "_val_raepa_forme_canal_ass" ADD COLUMN IF NOT EXISTS "libelle" text NOT NULL ;
COMMENT ON COLUMN "_val_raepa_forme_canal_ass"."libelle" IS 'Libellé' ;

ALTER TABLE "_val_raepa_forme_canal_ass" ADD COLUMN IF NOT EXISTS "description" text  ;
COMMENT ON COLUMN "_val_raepa_forme_canal_ass"."description" IS 'Description ' ;

ALTER TABLE "_val_raepa_forme_canal_ass" ADD COLUMN IF NOT EXISTS "ordre" smallint  ;
COMMENT ON COLUMN "_val_raepa_forme_canal_ass"."ordre" IS 'Ordre' ;

ALTER TABLE "_val_raepa_forme_canal_ass" ADD PRIMARY KEY ("code");


-- Table _val_raepa_etat_canal_ass
CREATE SCHEMA IF NOT EXISTS "raepa" ;
SET search_path TO raepa,public ;
CREATE TABLE IF NOT EXISTS "_val_raepa_etat_canal_ass" () ;

COMMENT ON TABLE "_val_raepa_etat_canal_ass" IS 'Nomenclature pour l’état de la canalisation' ;

ALTER TABLE "_val_raepa_etat_canal_ass" ADD COLUMN IF NOT EXISTS "code" varchar(2) NOT NULL ;
COMMENT ON COLUMN "_val_raepa_etat_canal_ass"."code" IS 'Code' ;

ALTER TABLE "_val_raepa_etat_canal_ass" ADD COLUMN IF NOT EXISTS "libelle" text NOT NULL ;
COMMENT ON COLUMN "_val_raepa_etat_canal_ass"."libelle" IS 'Libellé' ;

ALTER TABLE "_val_raepa_etat_canal_ass" ADD COLUMN IF NOT EXISTS "description" text  ;
COMMENT ON COLUMN "_val_raepa_etat_canal_ass"."description" IS 'Description ' ;

ALTER TABLE "_val_raepa_etat_canal_ass" ADD COLUMN IF NOT EXISTS "ordre" smallint  ;
COMMENT ON COLUMN "_val_raepa_etat_canal_ass"."ordre" IS 'Ordre' ;

ALTER TABLE "_val_raepa_etat_canal_ass" ADD PRIMARY KEY ("code");


-- Table _val_raepa_precision_annee
CREATE SCHEMA IF NOT EXISTS "raepa" ;
SET search_path TO raepa,public ;
CREATE TABLE IF NOT EXISTS "_val_raepa_precision_annee" () ;

COMMENT ON TABLE "_val_raepa_precision_annee" IS 'Nomenclature pour la précision des années de fin et début de pose' ;

ALTER TABLE "_val_raepa_precision_annee" ADD COLUMN IF NOT EXISTS "code" varchar(2) NOT NULL ;
COMMENT ON COLUMN "_val_raepa_precision_annee"."code" IS 'Code' ;

ALTER TABLE "_val_raepa_precision_annee" ADD COLUMN IF NOT EXISTS "libelle" text NOT NULL ;
COMMENT ON COLUMN "_val_raepa_precision_annee"."libelle" IS 'Libellé' ;

ALTER TABLE "_val_raepa_precision_annee" ADD COLUMN IF NOT EXISTS "description" text  ;
COMMENT ON COLUMN "_val_raepa_precision_annee"."description" IS 'Description ' ;

ALTER TABLE "_val_raepa_precision_annee" ADD COLUMN IF NOT EXISTS "ordre" smallint  ;
COMMENT ON COLUMN "_val_raepa_precision_annee"."ordre" IS 'Ordre' ;

ALTER TABLE "_val_raepa_precision_annee" ADD PRIMARY KEY ("code");


-- Table _val_raepa_type_intervention_ass
CREATE SCHEMA IF NOT EXISTS "raepa" ;
SET search_path TO raepa,public ;
CREATE TABLE IF NOT EXISTS "_val_raepa_type_intervention_ass" () ;

COMMENT ON TABLE "_val_raepa_type_intervention_ass" IS 'Nomenclature pour le type d’intervention (curage préventif, inspection, etc.)' ;

ALTER TABLE "_val_raepa_type_intervention_ass" ADD COLUMN IF NOT EXISTS "code" varchar(2) NOT NULL ;
COMMENT ON COLUMN "_val_raepa_type_intervention_ass"."code" IS 'Code' ;

ALTER TABLE "_val_raepa_type_intervention_ass" ADD COLUMN IF NOT EXISTS "libelle" text NOT NULL ;
COMMENT ON COLUMN "_val_raepa_type_intervention_ass"."libelle" IS 'Libellé' ;

ALTER TABLE "_val_raepa_type_intervention_ass" ADD COLUMN IF NOT EXISTS "description" text  ;
COMMENT ON COLUMN "_val_raepa_type_intervention_ass"."description" IS 'Description ' ;

ALTER TABLE "_val_raepa_type_intervention_ass" ADD COLUMN IF NOT EXISTS "ordre" smallint  ;
COMMENT ON COLUMN "_val_raepa_type_intervention_ass"."ordre" IS 'Ordre' ;

ALTER TABLE "_val_raepa_type_intervention_ass" ADD PRIMARY KEY ("code");


-- Table raepa_canalaep_l
CREATE SCHEMA IF NOT EXISTS "raepa" ;
SET search_path TO raepa,public ;
CREATE TABLE IF NOT EXISTS "raepa_canalaep_l" () ;

COMMENT ON TABLE "raepa_canalaep_l" IS 'Table des éléments linéaires du réseau d''AEP' ;

ALTER TABLE "raepa_canalaep_l" ADD COLUMN IF NOT EXISTS "id" serial NOT NULL ;
COMMENT ON COLUMN "raepa_canalaep_l"."id" IS 'Identifiant numérique auto (clé primaire)' ;

ALTER TABLE "raepa_canalaep_l" ADD COLUMN IF NOT EXISTS "idcana" varchar(254) NOT NULL ;
ALTER TABLE "raepa_canalaep_l" ALTER COLUMN "idcana" SET DEFAULT 'raepa.generate_oid(‘raepa_canalaep_l’)';
COMMENT ON COLUMN "raepa_canalaep_l"."idcana" IS 'Identifiant de la canalisation (code textuel)' ;

ALTER TABLE "raepa_canalaep_l" ADD COLUMN IF NOT EXISTS "mouvrage" varchar(100) NOT NULL ;
COMMENT ON COLUMN "raepa_canalaep_l"."mouvrage" IS 'Maître d''ouvrage du réseau' ;

ALTER TABLE "raepa_canalaep_l" ADD COLUMN IF NOT EXISTS "gexploit" varchar(100) NOT NULL ;
COMMENT ON COLUMN "raepa_canalaep_l"."gexploit" IS 'Gestionnaire exploitant du réseau' ;

ALTER TABLE "raepa_canalaep_l" ADD COLUMN IF NOT EXISTS "enservice" varchar(1) NOT NULL ;
COMMENT ON COLUMN "raepa_canalaep_l"."enservice" IS 'Canalisation en service / Canalisation abandonnée
O / N' ;

ALTER TABLE "raepa_canalaep_l" ADD COLUMN IF NOT EXISTS "branchemnt" varchar(1) NOT NULL ;
COMMENT ON COLUMN "raepa_canalaep_l"."branchemnt" IS 'Canalisation de branchement individuel : O
Canalisation de transport ou de distribution : N' ;

ALTER TABLE "raepa_canalaep_l" ADD COLUMN IF NOT EXISTS "materiau" varchar(2) NOT NULL ;
COMMENT ON COLUMN "raepa_canalaep_l"."materiau" IS 'Matériau de la canalisation d''adduction d''eau potable
Codes de la table VAL_RAEPA_MATERIAU' ;

ALTER TABLE "raepa_canalaep_l" ADD COLUMN IF NOT EXISTS "diametre" integer NOT NULL ;
COMMENT ON COLUMN "raepa_canalaep_l"."diametre" IS 'Diamètre nominal de la canalisation (en millimètres)' ;

ALTER TABLE "raepa_canalaep_l" ADD COLUMN IF NOT EXISTS "anfinpose" varchar(4) NOT NULL ;
COMMENT ON COLUMN "raepa_canalaep_l"."anfinpose" IS 'Année marquant la fin de la période de pose de la canalisation' ;

ALTER TABLE "raepa_canalaep_l" ADD COLUMN IF NOT EXISTS "modecirc" varchar(2) NOT NULL ;
COMMENT ON COLUMN "raepa_canalaep_l"."modecirc" IS 'Mode de circulation de l''eau à l''intérieur de la canalisation
Codes de la table VAL_RAEPA_MODE_CIRCULATION' ;

ALTER TABLE "raepa_canalaep_l" ADD COLUMN IF NOT EXISTS "contcanaep" varchar(2) NOT NULL ;
COMMENT ON COLUMN "raepa_canalaep_l"."contcanaep" IS 'Catégorie de la canalisation d''adduction d''eau potable
Codes de la table VAL_RAEPA_CAT_CANAL_AE' ;

ALTER TABLE "raepa_canalaep_l" ADD COLUMN IF NOT EXISTS "fonccanaep" varchar(2) NOT NULL ;
COMMENT ON COLUMN "raepa_canalaep_l"."fonccanaep" IS 'Fonction de la canalisation d''adduction d''eau potable
Codes de la table VAL_RAEPA_FONC_CANAL_AE' ;

ALTER TABLE "raepa_canalaep_l" ADD COLUMN IF NOT EXISTS "idnini" varchar(254) NOT NULL ;
COMMENT ON COLUMN "raepa_canalaep_l"."idnini" IS 'Identifiant du nœud de début de la canalisation (clé étrangère)' ;
CREATE INDEX ON "raepa_canalaep_l" ("idnini") ;

ALTER TABLE "raepa_canalaep_l" ADD COLUMN IF NOT EXISTS "idnterm" varchar(254) NOT NULL ;
COMMENT ON COLUMN "raepa_canalaep_l"."idnterm" IS 'Identifiant du nœud de fin de la canalisation (clé étrangère)' ;
CREATE INDEX ON "raepa_canalaep_l" ("idnterm") ;

ALTER TABLE "raepa_canalaep_l" ADD COLUMN IF NOT EXISTS "idcanppale" varchar(254)  ;
COMMENT ON COLUMN "raepa_canalaep_l"."idcanppale" IS 'Identifiant de la canalisation principale (clé étrangère)' ;
CREATE INDEX ON "raepa_canalaep_l" ("idcanppale") ;

ALTER TABLE "raepa_canalaep_l" ADD COLUMN IF NOT EXISTS "profgen" Numeric(6,2)  ;
COMMENT ON COLUMN "raepa_canalaep_l"."profgen" IS 'Profondeur moyenne de la génératrice supérieure de la
canalisation' ;

ALTER TABLE "raepa_canalaep_l" ADD COLUMN IF NOT EXISTS "andebpose" varchar(4)  ;
COMMENT ON COLUMN "raepa_canalaep_l"."andebpose" IS 'Année marquant le début de la période de pose de la
canalisation' ;

ALTER TABLE "raepa_canalaep_l" ADD COLUMN IF NOT EXISTS "longcana" integer  ;
COMMENT ON COLUMN "raepa_canalaep_l"."longcana" IS 'Longueur mesurée de canalisation (en mètres)' ;

ALTER TABLE "raepa_canalaep_l" ADD COLUMN IF NOT EXISTS "_longcana_cm" numeric(7,2)  ;
COMMENT ON COLUMN "raepa_canalaep_l"."_longcana_cm" IS 'Longueur calculée de canalisation projetée (en mètres avec une précision centimétrique)' ;

ALTER TABLE "raepa_canalaep_l" ADD COLUMN IF NOT EXISTS "_longcana_reelle" numeric(7,2)  ;
COMMENT ON COLUMN "raepa_canalaep_l"."_longcana_reelle" IS 'Longueur calculée de canalisation réelle, en prenant en compte la pente (précision cm)' ;

ALTER TABLE "raepa_canalaep_l" ADD COLUMN IF NOT EXISTS "nbranche" integer  ;
COMMENT ON COLUMN "raepa_canalaep_l"."nbranche" IS 'Nombre de branchements individuels sur la canalisation
d''adduction d''eau potable' ;

ALTER TABLE "raepa_canalaep_l" ADD COLUMN IF NOT EXISTS "qualglocxy" varchar(2) NOT NULL ;
COMMENT ON COLUMN "raepa_canalaep_l"."qualglocxy" IS 'Qualité de la géolocalisation planimétrique (XY)
Codes de la table VAL_RAEPA_QUALITE_GEOLOC' ;

ALTER TABLE "raepa_canalaep_l" ADD COLUMN IF NOT EXISTS "qualglocz" varchar(2) NOT NULL ;
COMMENT ON COLUMN "raepa_canalaep_l"."qualglocz" IS 'Qualité de la géolocalisation altimétrique (Z)
Codes de la table VAL_RAEPA_QUALITE_GEOLOC' ;

ALTER TABLE "raepa_canalaep_l" ADD COLUMN IF NOT EXISTS "datemaj" date NOT NULL ;
ALTER TABLE "raepa_canalaep_l" ALTER COLUMN "datemaj" SET DEFAULT 'now()';
COMMENT ON COLUMN "raepa_canalaep_l"."datemaj" IS 'Date de la dernière mise à jour des informations' ;

ALTER TABLE "raepa_canalaep_l" ADD COLUMN IF NOT EXISTS "sourmaj" varchar(100) NOT NULL ;
COMMENT ON COLUMN "raepa_canalaep_l"."sourmaj" IS 'Source de la mise à jour' ;

ALTER TABLE "raepa_canalaep_l" ADD COLUMN IF NOT EXISTS "qualannee" varchar(2)  ;
COMMENT ON COLUMN "raepa_canalaep_l"."qualannee" IS 'Fiabilité, lorsque ANDEBPOSE = ANFINPOSE, de l''année de
pose
Codes de la table VAL_RAEPA_QUALITE_ANPOSE' ;

ALTER TABLE "raepa_canalaep_l" ADD COLUMN IF NOT EXISTS "dategeoloc" date  ;
COMMENT ON COLUMN "raepa_canalaep_l"."dategeoloc" IS 'Date de la géolocalisation' ;

ALTER TABLE "raepa_canalaep_l" ADD COLUMN IF NOT EXISTS "sourgeoloc" varchar(100)  ;
COMMENT ON COLUMN "raepa_canalaep_l"."sourgeoloc" IS 'Auteur de la géolocalisation' ;

ALTER TABLE "raepa_canalaep_l" ADD COLUMN IF NOT EXISTS "sourattrib" varchar(100)  ;
COMMENT ON COLUMN "raepa_canalaep_l"."sourattrib" IS 'Auteur de la saisie des données attributaires (lorsque différent
de l''auteur de la géolocalisation)' ;

ALTER TABLE "raepa_canalaep_l" ADD COLUMN IF NOT EXISTS "geom" geometry(Linestring, 2154) NOT NULL ;
COMMENT ON COLUMN "raepa_canalaep_l"."geom" IS 'Géométrie' ;
CREATE INDEX ON "raepa_canalaep_l" ("geom") ;

ALTER TABLE "raepa_canalaep_l" ADD PRIMARY KEY ("id");
ALTER TABLE "raepa_canalaep_l" ADD UNIQUE ("idcana");
CREATE INDEX ON "raepa_canalaep_l" ("idcana") ;

-- Table raepa_apparaep_p
CREATE SCHEMA IF NOT EXISTS "raepa" ;
SET search_path TO raepa,public ;
CREATE TABLE IF NOT EXISTS "raepa_apparaep_p" () ;

COMMENT ON TABLE "raepa_apparaep_p" IS 'Table des appareillages du réseau d''AEP' ;

ALTER TABLE "raepa_apparaep_p" ADD COLUMN IF NOT EXISTS "id" serial  NOT NULL ;
COMMENT ON COLUMN "raepa_apparaep_p"."id" IS 'Identifiant numérique auto (clé primaire)' ;

ALTER TABLE "raepa_apparaep_p" ADD COLUMN IF NOT EXISTS "idappareil" varchar(254) NOT NULL ;
ALTER TABLE "raepa_apparaep_p" ALTER COLUMN "idappareil" SET DEFAULT 'raepa.generate_oid(‘raepa_apparaep_p’)';
COMMENT ON COLUMN "raepa_apparaep_p"."idappareil" IS 'Identifiant de l''appareillage' ;

ALTER TABLE "raepa_apparaep_p" ADD COLUMN IF NOT EXISTS "x" numeric(10,3) NOT NULL ;
COMMENT ON COLUMN "raepa_apparaep_p"."x" IS 'Coordonnée X Lambert 93 (en mètres)' ;

ALTER TABLE "raepa_apparaep_p" ADD COLUMN IF NOT EXISTS "y" numeric(10,3) NOT NULL ;
COMMENT ON COLUMN "raepa_apparaep_p"."y" IS 'Coordonnée X Lambert 93 (en mètres)' ;

ALTER TABLE "raepa_apparaep_p" ADD COLUMN IF NOT EXISTS "mouvrage" varchar(100) NOT NULL ;
COMMENT ON COLUMN "raepa_apparaep_p"."mouvrage" IS 'Maître d''ouvrage du réseau' ;

ALTER TABLE "raepa_apparaep_p" ADD COLUMN IF NOT EXISTS "gexploit" varchar(100) NOT NULL ;
COMMENT ON COLUMN "raepa_apparaep_p"."gexploit" IS 'Gestionnaire exploitant du réseau' ;

ALTER TABLE "raepa_apparaep_p" ADD COLUMN IF NOT EXISTS "fnappaep" varchar(2) NOT NULL ;
COMMENT ON COLUMN "raepa_apparaep_p"."fnappaep" IS 'Fonction de l''appareillage d''adduction d''eau potable
Codes de la table VAL_RAEPA_FONC_APP_AE' ;

ALTER TABLE "raepa_apparaep_p" ADD COLUMN IF NOT EXISTS "anfinpose" varchar(4) NOT NULL ;
COMMENT ON COLUMN "raepa_apparaep_p"."anfinpose" IS 'Année marquant la fin de la période de mise en service de
l''appareillage' ;

ALTER TABLE "raepa_apparaep_p" ADD COLUMN IF NOT EXISTS "diametre" integer NOT NULL ;
COMMENT ON COLUMN "raepa_apparaep_p"."diametre" IS 'Diamètre nominal de l''appareillage (en millimètres)' ;

ALTER TABLE "raepa_apparaep_p" ADD COLUMN IF NOT EXISTS "idcanamont" varchar(254) NOT NULL ;
COMMENT ON COLUMN "raepa_apparaep_p"."idcanamont" IS 'Identifiant de la canalisation d''amont de l''appareillage (clé
étrangère)' ;
CREATE INDEX ON "raepa_apparaep_p" ("idcanamont") ;

ALTER TABLE "raepa_apparaep_p" ADD COLUMN IF NOT EXISTS "idcanaval" varchar(254) NOT NULL ;
COMMENT ON COLUMN "raepa_apparaep_p"."idcanaval" IS 'Identifiant de la canalisation d''aval de l''appareillage (clé
étrangère)' ;
CREATE INDEX ON "raepa_apparaep_p" ("idcanaval") ;

ALTER TABLE "raepa_apparaep_p" ADD COLUMN IF NOT EXISTS "idcanppale" varchar(254)  ;
COMMENT ON COLUMN "raepa_apparaep_p"."idcanppale" IS 'Identifiant de la canalisation principale (clé étrangère)' ;
CREATE INDEX ON "raepa_apparaep_p" ("idcanppale") ;

ALTER TABLE "raepa_apparaep_p" ADD COLUMN IF NOT EXISTS "idouvrage" varchar(254)  ;
COMMENT ON COLUMN "raepa_apparaep_p"."idouvrage" IS 'Identifiant de l''ouvrage d''accueil (clé étrangère)' ;
CREATE INDEX ON "raepa_apparaep_p" ("idouvrage") ;

ALTER TABLE "raepa_apparaep_p" ADD COLUMN IF NOT EXISTS "z" numeric(6,3)  ;
COMMENT ON COLUMN "raepa_apparaep_p"."z" IS 'Altitude (en mètres, référentiel NGF-IGN69) du radier' ;

ALTER TABLE "raepa_apparaep_p" ADD COLUMN IF NOT EXISTS "andebpose" varchar(4)  ;
COMMENT ON COLUMN "raepa_apparaep_p"."andebpose" IS 'Année marquant le début de la période de mise en service de
l''appareillage' ;

ALTER TABLE "raepa_apparaep_p" ADD COLUMN IF NOT EXISTS "qualglocxy" varchar(2) NOT NULL ;
COMMENT ON COLUMN "raepa_apparaep_p"."qualglocxy" IS 'Qualité de la géolocalisation planimétrique (XY)
Codes de la table VAL_RAEPA_QUALITE_GEOLOC' ;

ALTER TABLE "raepa_apparaep_p" ADD COLUMN IF NOT EXISTS "qualglocz" varchar(2) NOT NULL ;
COMMENT ON COLUMN "raepa_apparaep_p"."qualglocz" IS 'Qualité de la géolocalisation altimétrique (Z)
Codes de la table VAL_RAEPA_QUALITE_GEOLOC' ;

ALTER TABLE "raepa_apparaep_p" ADD COLUMN IF NOT EXISTS "datemaj" date NOT NULL ;
ALTER TABLE "raepa_apparaep_p" ALTER COLUMN "datemaj" SET DEFAULT 'now()';
COMMENT ON COLUMN "raepa_apparaep_p"."datemaj" IS 'Date de la dernière mise à jour des informations' ;

ALTER TABLE "raepa_apparaep_p" ADD COLUMN IF NOT EXISTS "sourmaj" varchar(100) NOT NULL ;
COMMENT ON COLUMN "raepa_apparaep_p"."sourmaj" IS 'Source de la mise à jour' ;

ALTER TABLE "raepa_apparaep_p" ADD COLUMN IF NOT EXISTS "qualannee" varchar(2)  ;
COMMENT ON COLUMN "raepa_apparaep_p"."qualannee" IS 'Fiabilité, lorsque ANDEBPOSE = ANFINPOSE, de l''année de
mise en service
Codes de la table VAL_RAEPA_QUALITE_ANPOSE' ;

ALTER TABLE "raepa_apparaep_p" ADD COLUMN IF NOT EXISTS "dategeoloc" date  ;
COMMENT ON COLUMN "raepa_apparaep_p"."dategeoloc" IS 'Date de la géolocalisation' ;

ALTER TABLE "raepa_apparaep_p" ADD COLUMN IF NOT EXISTS "sourgeoloc" varchar(100)  ;
COMMENT ON COLUMN "raepa_apparaep_p"."sourgeoloc" IS 'Auteur de la géolocalisation' ;

ALTER TABLE "raepa_apparaep_p" ADD COLUMN IF NOT EXISTS "sourattrib" varchar(100)  ;
COMMENT ON COLUMN "raepa_apparaep_p"."sourattrib" IS 'Auteur de la saisie des données attributaires (lorsque différent
de l''auteur de la géolocalisation)' ;

ALTER TABLE "raepa_apparaep_p" ADD COLUMN IF NOT EXISTS "geom" geometry(Point, 2154) NOT NULL ;
COMMENT ON COLUMN "raepa_apparaep_p"."geom" IS 'Géométrie' ;
CREATE INDEX ON "raepa_apparaep_p" ("geom") ;

ALTER TABLE "raepa_apparaep_p" ADD PRIMARY KEY ("id");
ALTER TABLE "raepa_apparaep_p" ADD UNIQUE ("idappareil");
CREATE INDEX ON "raepa_apparaep_p" ("idappareil") ;

-- Table raepa_ouvraep_p
CREATE SCHEMA IF NOT EXISTS "raepa" ;
SET search_path TO raepa,public ;
CREATE TABLE IF NOT EXISTS "raepa_ouvraep_p" () ;

COMMENT ON TABLE "raepa_ouvraep_p" IS 'Table des ouvrages du réseau d''AEP' ;

ALTER TABLE "raepa_ouvraep_p" ADD COLUMN IF NOT EXISTS "id" serial  NOT NULL ;
COMMENT ON COLUMN "raepa_ouvraep_p"."id" IS 'Identifiant numérique auto (clé primaire)' ;

ALTER TABLE "raepa_ouvraep_p" ADD COLUMN IF NOT EXISTS "idouvrage" varchar(254) NOT NULL ;
ALTER TABLE "raepa_ouvraep_p" ALTER COLUMN "idouvrage" SET DEFAULT 'raepa.generate_oid(‘raepa_ouvraep_p’)';
COMMENT ON COLUMN "raepa_ouvraep_p"."idouvrage" IS 'Identifiant de l''ouvrage' ;

ALTER TABLE "raepa_ouvraep_p" ADD COLUMN IF NOT EXISTS "x" numeric(10,3) NOT NULL ;
COMMENT ON COLUMN "raepa_ouvraep_p"."x" IS 'Coordonnée X Lambert 93 (en mètres)' ;

ALTER TABLE "raepa_ouvraep_p" ADD COLUMN IF NOT EXISTS "y" numeric(10,3) NOT NULL ;
COMMENT ON COLUMN "raepa_ouvraep_p"."y" IS 'Coordonnée X Lambert 93 (en mètres)' ;

ALTER TABLE "raepa_ouvraep_p" ADD COLUMN IF NOT EXISTS "mouvrage" varchar(100) NOT NULL ;
COMMENT ON COLUMN "raepa_ouvraep_p"."mouvrage" IS 'Maître d''ouvrage du réseau' ;

ALTER TABLE "raepa_ouvraep_p" ADD COLUMN IF NOT EXISTS "gexploit" varchar(100) NOT NULL ;
COMMENT ON COLUMN "raepa_ouvraep_p"."gexploit" IS 'Gestionnaire exploitant du réseau' ;

ALTER TABLE "raepa_ouvraep_p" ADD COLUMN IF NOT EXISTS "fnouvaep" varchar(2) NOT NULL ;
COMMENT ON COLUMN "raepa_ouvraep_p"."fnouvaep" IS 'Fonction de l''ouvrage d''adduction d''eau potable
Codes de la table VAL_RAEPA_FONC_OUV_AE' ;

ALTER TABLE "raepa_ouvraep_p" ADD COLUMN IF NOT EXISTS "anfinpose" varchar(4) NOT NULL ;
COMMENT ON COLUMN "raepa_ouvraep_p"."anfinpose" IS 'Année marquant la fin de la période de mise en service de
l''ouvrage' ;

ALTER TABLE "raepa_ouvraep_p" ADD COLUMN IF NOT EXISTS "idcanamont" varchar(254) NOT NULL ;
COMMENT ON COLUMN "raepa_ouvraep_p"."idcanamont" IS 'Identifiants des canalisations d''amont de l''ouvrage (clés
étrangères)' ;
CREATE INDEX ON "raepa_ouvraep_p" ("idcanamont") ;

ALTER TABLE "raepa_ouvraep_p" ADD COLUMN IF NOT EXISTS "idcanaval" varchar(254) NOT NULL ;
COMMENT ON COLUMN "raepa_ouvraep_p"."idcanaval" IS 'Identifiants des canalisations d''aval de l''ouvrage (clés
étrangères)' ;
CREATE INDEX ON "raepa_ouvraep_p" ("idcanaval") ;

ALTER TABLE "raepa_ouvraep_p" ADD COLUMN IF NOT EXISTS "idcanppale" varchar(254)  ;
COMMENT ON COLUMN "raepa_ouvraep_p"."idcanppale" IS 'Identifiant de la canalisation principale (clé étrangère)' ;
CREATE INDEX ON "raepa_ouvraep_p" ("idcanppale") ;

ALTER TABLE "raepa_ouvraep_p" ADD COLUMN IF NOT EXISTS "z" numeric(6,3)  ;
COMMENT ON COLUMN "raepa_ouvraep_p"."z" IS 'Altitude (en mètres, référentiel NGF-IGN69)' ;

ALTER TABLE "raepa_ouvraep_p" ADD COLUMN IF NOT EXISTS "andebpose" varchar(4)  ;
COMMENT ON COLUMN "raepa_ouvraep_p"."andebpose" IS 'Année marquant le début de la période de mise en service de
l''ouvrage' ;

ALTER TABLE "raepa_ouvraep_p" ADD COLUMN IF NOT EXISTS "qualglocxy" varchar(2) NOT NULL ;
COMMENT ON COLUMN "raepa_ouvraep_p"."qualglocxy" IS 'Qualité de la géolocalisation planimétrique (XY)
Codes de la table VAL_RAEPA_QUALITE_GEOLOC' ;

ALTER TABLE "raepa_ouvraep_p" ADD COLUMN IF NOT EXISTS "qualglocz" varchar(2) NOT NULL ;
COMMENT ON COLUMN "raepa_ouvraep_p"."qualglocz" IS 'Qualité de la géolocalisation altimétrique (Z)
Codes de la table VAL_RAEPA_QUALITE_GEOLOC' ;

ALTER TABLE "raepa_ouvraep_p" ADD COLUMN IF NOT EXISTS "datemaj" date NOT NULL ;
ALTER TABLE "raepa_ouvraep_p" ALTER COLUMN "datemaj" SET DEFAULT 'now()';
COMMENT ON COLUMN "raepa_ouvraep_p"."datemaj" IS 'Date de la dernière mise à jour des informations' ;

ALTER TABLE "raepa_ouvraep_p" ADD COLUMN IF NOT EXISTS "sourmaj" varchar(100) NOT NULL ;
COMMENT ON COLUMN "raepa_ouvraep_p"."sourmaj" IS 'Source de la mise à jour' ;

ALTER TABLE "raepa_ouvraep_p" ADD COLUMN IF NOT EXISTS "qualannee" varchar(2)  ;
COMMENT ON COLUMN "raepa_ouvraep_p"."qualannee" IS 'Fiabilité, lorsque ANDEBPOSE = ANFINPOSE, de l''année de
mise en service
Codes de la table VAL_RAEPA_QUALITE_ANPOSE' ;

ALTER TABLE "raepa_ouvraep_p" ADD COLUMN IF NOT EXISTS "dategeoloc" date  ;
COMMENT ON COLUMN "raepa_ouvraep_p"."dategeoloc" IS 'Date de la géolocalisation' ;

ALTER TABLE "raepa_ouvraep_p" ADD COLUMN IF NOT EXISTS "sourgeoloc" varchar(100)  ;
COMMENT ON COLUMN "raepa_ouvraep_p"."sourgeoloc" IS 'Auteur de la géolocalisation' ;

ALTER TABLE "raepa_ouvraep_p" ADD COLUMN IF NOT EXISTS "sourattrib" varchar(100)  ;
COMMENT ON COLUMN "raepa_ouvraep_p"."sourattrib" IS 'Auteur de la saisie des données attributaires (lorsque différent
de l''auteur de la géolocalisation)' ;

ALTER TABLE "raepa_ouvraep_p" ADD COLUMN IF NOT EXISTS "geom" geometry(Point, 2154) NOT NULL ;
COMMENT ON COLUMN "raepa_ouvraep_p"."geom" IS 'Géométrie' ;
CREATE INDEX ON "raepa_ouvraep_p" ("geom") ;

ALTER TABLE "raepa_ouvraep_p" ADD PRIMARY KEY ("id");
ALTER TABLE "raepa_ouvraep_p" ADD UNIQUE ("idouvrage");
CREATE INDEX ON "raepa_ouvraep_p" ("idouvrage");


-- Table raepa_reparaep_p
CREATE SCHEMA IF NOT EXISTS "raepa" ;
SET search_path TO raepa,public ;
CREATE TABLE IF NOT EXISTS "raepa_reparaep_p" () ;

COMMENT ON TABLE "raepa_reparaep_p" IS 'Table des interventions en réparation sur les éléments du réseau d''AEP' ;

ALTER TABLE "raepa_reparaep_p" ADD COLUMN IF NOT EXISTS "id" serial  NOT NULL ;
COMMENT ON COLUMN "raepa_reparaep_p"."id" IS 'Identifiant numérique auto (clé primaire)' ;

ALTER TABLE "raepa_reparaep_p" ADD COLUMN IF NOT EXISTS "idrepar" varchar(254) NOT NULL ;
ALTER TABLE "raepa_reparaep_p" ALTER COLUMN "idrepar" SET DEFAULT 'raepa.generate_oid(‘raepa_reparaep_p’)';
COMMENT ON COLUMN "raepa_reparaep_p"."idrepar" IS 'Identifiant de la réparation effectuée' ;

ALTER TABLE "raepa_reparaep_p" ADD COLUMN IF NOT EXISTS "x" numeric(10,3) NOT NULL ;
COMMENT ON COLUMN "raepa_reparaep_p"."x" IS 'Coordonnée X Lambert 93 (en mètres)' ;

ALTER TABLE "raepa_reparaep_p" ADD COLUMN IF NOT EXISTS "y" numeric(10,3) NOT NULL ;
COMMENT ON COLUMN "raepa_reparaep_p"."y" IS 'Coordonnée X Lambert 93 (en mètres)' ;

ALTER TABLE "raepa_reparaep_p" ADD COLUMN IF NOT EXISTS "supprepare" varchar(2) NOT NULL ;
COMMENT ON COLUMN "raepa_reparaep_p"."supprepare" IS 'Type du support de la réparation
Codes de la table VAL_RAEPA_SUPPORT_REPARATION' ;

ALTER TABLE "raepa_reparaep_p" ADD COLUMN IF NOT EXISTS "defreparee" varchar(2) NOT NULL ;
COMMENT ON COLUMN "raepa_reparaep_p"."defreparee" IS 'Type de la défaillance réparée
Codes de la table VAL_RAEPA_TYPE_DEFAILLANCE' ;

ALTER TABLE "raepa_reparaep_p" ADD COLUMN IF NOT EXISTS "idsuprepar" varchar(254) NOT NULL ;
COMMENT ON COLUMN "raepa_reparaep_p"."idsuprepar" IS 'Identifiant du support de la réparation (clé étrangère)' ;
CREATE INDEX ON "raepa_reparaep_p" ("idsuprepar") ;

ALTER TABLE "raepa_reparaep_p" ADD COLUMN IF NOT EXISTS "daterepar" date  ;
COMMENT ON COLUMN "raepa_reparaep_p"."daterepar" IS 'Date de l''intervention en réparation' ;

ALTER TABLE "raepa_reparaep_p" ADD COLUMN IF NOT EXISTS "mouvrage" varchar(254)  ;
COMMENT ON COLUMN "raepa_reparaep_p"."mouvrage" IS 'Maître d''ouvrage de la réparation' ;

ALTER TABLE "raepa_reparaep_p" ADD COLUMN IF NOT EXISTS "geom" geometry(Point, 2154) NOT NULL ;
COMMENT ON COLUMN "raepa_reparaep_p"."geom" IS 'Géométrie' ;
CREATE INDEX ON "raepa_reparaep_p" ("geom") ;

ALTER TABLE "raepa_reparaep_p" ADD PRIMARY KEY ("id");
ALTER TABLE "raepa_reparaep_p" ADD UNIQUE ("idrepar");
CREATE INDEX ON "raepa_reparaep_p" ("idrepar");


-- Table raepa_canalass_l
CREATE SCHEMA IF NOT EXISTS "raepa" ;
SET search_path TO raepa,public ;
CREATE TABLE IF NOT EXISTS "raepa_canalass_l" () ;

COMMENT ON TABLE "raepa_canalass_l" IS 'Table des éléments linéaires du réseau d''assainissement collectif' ;

ALTER TABLE "raepa_canalass_l" ADD COLUMN IF NOT EXISTS "id" serial  NOT NULL ;
COMMENT ON COLUMN "raepa_canalass_l"."id" IS 'Identifiant numérique auto (clé primaire)' ;

ALTER TABLE "raepa_canalass_l" ADD COLUMN IF NOT EXISTS "idcana" varchar(254) NOT NULL ;
ALTER TABLE "raepa_canalass_l" ALTER COLUMN "idcana" SET DEFAULT 'raepa.generate_oid(‘raepa_canalass_l’)';
COMMENT ON COLUMN "raepa_canalass_l"."idcana" IS 'Identifiant de la canalisation' ;

ALTER TABLE "raepa_canalass_l" ADD COLUMN IF NOT EXISTS "mouvrage" varchar(100) NOT NULL ;
COMMENT ON COLUMN "raepa_canalass_l"."mouvrage" IS 'Maître d''ouvrage du réseau' ;

ALTER TABLE "raepa_canalass_l" ADD COLUMN IF NOT EXISTS "gexploit" varchar(100) NOT NULL ;
COMMENT ON COLUMN "raepa_canalass_l"."gexploit" IS 'Gestionnaire exploitant du réseau' ;

ALTER TABLE "raepa_canalass_l" ADD COLUMN IF NOT EXISTS "enservice" varchar(1) NOT NULL ;
COMMENT ON COLUMN "raepa_canalass_l"."enservice" IS 'Canalisation en service / Canalisation abandonnée
O / N' ;

ALTER TABLE "raepa_canalass_l" ADD COLUMN IF NOT EXISTS "branchemnt" varchar(1) NOT NULL ;
COMMENT ON COLUMN "raepa_canalass_l"."branchemnt" IS 'Canalisation de branchement individuel : O
Canalisation de transport ou collecte : N' ;

ALTER TABLE "raepa_canalass_l" ADD COLUMN IF NOT EXISTS "typreseau" varchar(2) NOT NULL ;
COMMENT ON COLUMN "raepa_canalass_l"."typreseau" IS 'Type du réseau d''assainissement collectif
Codes de la table VAL_RAEPA_TYP_RESEAU_ASS' ;

ALTER TABLE "raepa_canalass_l" ADD COLUMN IF NOT EXISTS "materiau" varchar(2) NOT NULL ;
COMMENT ON COLUMN "raepa_canalass_l"."materiau" IS 'Matériau de la canalisation d''assainissement collectif
Codes de la table VAL_RAEPA_MATERIAU' ;

ALTER TABLE "raepa_canalass_l" ADD COLUMN IF NOT EXISTS "diametre" integer NOT NULL ;
COMMENT ON COLUMN "raepa_canalass_l"."diametre" IS 'Diamètre nominal de la canalisation (en millimètres)' ;

ALTER TABLE "raepa_canalass_l" ADD COLUMN IF NOT EXISTS "_dimensionhorizontale" integer  ;
COMMENT ON COLUMN "raepa_canalass_l"."_dimensionhorizontale" IS 'Dimension horizontale (complète le diamètre nominal qui est la dimension verticale)' ;

ALTER TABLE "raepa_canalass_l" ADD COLUMN IF NOT EXISTS "_forme" Varchar(2)  ;
COMMENT ON COLUMN "raepa_canalass_l"."_forme" IS 'Forme de la canalisation (cylindrique, ovoïde, etc)' ;

ALTER TABLE "raepa_canalass_l" ADD COLUMN IF NOT EXISTS "_etat" Varchar(2)  ;
COMMENT ON COLUMN "raepa_canalass_l"."_etat" IS 'Etat de la canalisation' ;

ALTER TABLE "raepa_canalass_l" ADD COLUMN IF NOT EXISTS "anfinpose" varchar(4) NOT NULL ;
COMMENT ON COLUMN "raepa_canalass_l"."anfinpose" IS 'Année marquant la fin de la période de pose de la canalisation' ;

ALTER TABLE "raepa_canalass_l" ADD COLUMN IF NOT EXISTS "modecirc" varchar(2) NOT NULL ;
COMMENT ON COLUMN "raepa_canalass_l"."modecirc" IS 'Mode de circulation de l''eau à l''intérieur de la canalisation
Codes de la table VAL_RAEPA_MODE_CIRCULATION' ;

ALTER TABLE "raepa_canalass_l" ADD COLUMN IF NOT EXISTS "contcanass" varchar(2) NOT NULL ;
COMMENT ON COLUMN "raepa_canalass_l"."contcanass" IS 'Catégorie de la canalisation d''assainissement collectif
Codes de la table VAL_RAEPA_CAT_CANAL_ASS' ;

ALTER TABLE "raepa_canalass_l" ADD COLUMN IF NOT EXISTS "fonccanass" varchar(2) NOT NULL ;
COMMENT ON COLUMN "raepa_canalass_l"."fonccanass" IS 'Fonction de la canalisation d''assainissement collectif
Codes de la table VAL_RAEPA_FONC_CANAL_ASS' ;

ALTER TABLE "raepa_canalass_l" ADD COLUMN IF NOT EXISTS "idnini" varchar(254) NOT NULL ;
COMMENT ON COLUMN "raepa_canalass_l"."idnini" IS 'Identifiant du nœud de début de la canalisation (clé étrangère)' ;
CREATE INDEX ON "raepa_canalass_l" ("idnini") ;

ALTER TABLE "raepa_canalass_l" ADD COLUMN IF NOT EXISTS "idnterm" varchar(254) NOT NULL ;
COMMENT ON COLUMN "raepa_canalass_l"."idnterm" IS 'Identifiant du nœud de fin de la canalisation (clé étrangère)' ;
CREATE INDEX ON "raepa_canalass_l" ("idnterm") ;

ALTER TABLE "raepa_canalass_l" ADD COLUMN IF NOT EXISTS "idcanppale" varchar(254)  ;
COMMENT ON COLUMN "raepa_canalass_l"."idcanppale" IS 'Identifiant de la canalisation principale (clé étrangère)' ;
CREATE INDEX ON "raepa_canalass_l" ("idcanppale") ;

ALTER TABLE "raepa_canalass_l" ADD COLUMN IF NOT EXISTS "zamont" numeric(6,3)  ;
COMMENT ON COLUMN "raepa_canalass_l"."zamont" IS 'Altitude à l''extrémité amont (en mètres, Référentiel NGF-
IGN69)' ;

ALTER TABLE "raepa_canalass_l" ADD COLUMN IF NOT EXISTS "zaval" numeric(6,3)  ;
COMMENT ON COLUMN "raepa_canalass_l"."zaval" IS 'Altitude à l''extrémité aval (en mètres, Référentiel NGF-IGN69)' ;

ALTER TABLE "raepa_canalass_l" ADD COLUMN IF NOT EXISTS "sensecoul" varchar(1)  ;
COMMENT ON COLUMN "raepa_canalass_l"."sensecoul" IS 'Sens de l''écoulement dans la canalisation d''assainissement
collectif
0 (nœud terminal → nœud initial) • 1 (nœud initial → nœud
terminal)' ;

ALTER TABLE "raepa_canalass_l" ADD COLUMN IF NOT EXISTS "andebpose" varchar(4)  ;
COMMENT ON COLUMN "raepa_canalass_l"."andebpose" IS 'Année marquant le début de la période de pose de la
canalisation' ;

ALTER TABLE "raepa_canalass_l" ADD COLUMN IF NOT EXISTS "_precisionannee" varchar(2)  ;
COMMENT ON COLUMN "raepa_canalass_l"."_precisionannee" IS 'Précision des années de fin et début de pose' ;

ALTER TABLE "raepa_canalass_l" ADD COLUMN IF NOT EXISTS "longcana" integer  ;
COMMENT ON COLUMN "raepa_canalass_l"."longcana" IS 'Longueur mesurée de canalisation (en mètres)' ;

ALTER TABLE "raepa_canalass_l" ADD COLUMN IF NOT EXISTS "_longcana_cm" numeric(7,2)  ;
COMMENT ON COLUMN "raepa_canalass_l"."_longcana_cm" IS 'Longueur calculée de canalisation projetée (en mètres avec une précision centimétrique)' ;

ALTER TABLE "raepa_canalass_l" ADD COLUMN IF NOT EXISTS "_longcana_reelle" numeric(7,2)  ;
COMMENT ON COLUMN "raepa_canalass_l"."_longcana_reelle" IS 'Longueur calculée de canalisation réelle, en prenant en compte la pente (précision cm)' ;

ALTER TABLE "raepa_canalass_l" ADD COLUMN IF NOT EXISTS "_pente" numeric(6,2)  ;
COMMENT ON COLUMN "raepa_canalass_l"."_pente" IS 'Pente de la canalisation (en %)' ;

ALTER TABLE "raepa_canalass_l" ADD COLUMN IF NOT EXISTS "nbranche" integer  ;
COMMENT ON COLUMN "raepa_canalass_l"."nbranche" IS 'Nombre de branchements individuels sur la canalisation
d''assainissement collectif' ;

ALTER TABLE "raepa_canalass_l" ADD COLUMN IF NOT EXISTS "qualglocxy" varchar(2) NOT NULL ;
COMMENT ON COLUMN "raepa_canalass_l"."qualglocxy" IS 'Qualité de la géolocalisation planimétrique (XY)
Codes de la table VAL_RAEPA_QUALITE_GEOLOC' ;

ALTER TABLE "raepa_canalass_l" ADD COLUMN IF NOT EXISTS "qualglocz" varchar(2) NOT NULL ;
COMMENT ON COLUMN "raepa_canalass_l"."qualglocz" IS 'Qualité de la géolocalisation altimétrique (Z)
Codes de la table VAL_RAEPA_QUALITE_GEOLOC' ;

ALTER TABLE "raepa_canalass_l" ADD COLUMN IF NOT EXISTS "datemaj" date NOT NULL ;
ALTER TABLE "raepa_canalass_l" ALTER COLUMN "datemaj" SET DEFAULT 'now()';
COMMENT ON COLUMN "raepa_canalass_l"."datemaj" IS 'Date de la dernière mise à jour des informations' ;

ALTER TABLE "raepa_canalass_l" ADD COLUMN IF NOT EXISTS "sourmaj" varchar(100) NOT NULL ;
COMMENT ON COLUMN "raepa_canalass_l"."sourmaj" IS 'Source de la mise à jour' ;

ALTER TABLE "raepa_canalass_l" ADD COLUMN IF NOT EXISTS "qualannee" varchar(2)  ;
COMMENT ON COLUMN "raepa_canalass_l"."qualannee" IS 'Fiabilité, lorsque ANDEBPOSE = ANFINPOSE, de l''année de
pose
Codes de la table VAL_RAEPA_QUALITE_ANPOSE' ;

ALTER TABLE "raepa_canalass_l" ADD COLUMN IF NOT EXISTS "dategeoloc" date  ;
COMMENT ON COLUMN "raepa_canalass_l"."dategeoloc" IS 'Date de la géolocalisation' ;

ALTER TABLE "raepa_canalass_l" ADD COLUMN IF NOT EXISTS "sourgeoloc" varchar(100)  ;
COMMENT ON COLUMN "raepa_canalass_l"."sourgeoloc" IS 'Auteur de la géolocalisation' ;

ALTER TABLE "raepa_canalass_l" ADD COLUMN IF NOT EXISTS "sourattrib" varchar(100)  ;
COMMENT ON COLUMN "raepa_canalass_l"."sourattrib" IS 'Auteur de la saisie des données attributaires (lorsque différent
de l''auteur de la géolocalisation)' ;

ALTER TABLE "raepa_canalass_l" ADD COLUMN IF NOT EXISTS "_source_historique" text  ;
COMMENT ON COLUMN "raepa_canalass_l"."_source_historique" IS 'Source de la donnée ( si2g ou geomap)' ;

ALTER TABLE "raepa_canalass_l" ADD COLUMN IF NOT EXISTS "_code_chantier" text ;
COMMENT ON COLUMN "raepa_canalass_l"."_code_chantier" IS 'Code du chantier, qui doit être explicite et unique entre les chantiers. Par ex : SOISSONS-PL REPUBLIQUE-2018' ;

ALTER TABLE "raepa_canalass_l" ADD COLUMN IF NOT EXISTS "_date_import" text ;
COMMENT ON COLUMN "raepa_canalass_l"."_date_import" IS 'Date de l''import' ;

ALTER TABLE "raepa_canalass_l" ADD COLUMN IF NOT EXISTS "geom" geometry(Linestring, 2154) NOT NULL ;
COMMENT ON COLUMN "raepa_canalass_l"."geom" IS 'Géométrie' ;
CREATE INDEX ON "raepa_canalass_l" ("geom") ;

ALTER TABLE "raepa_canalass_l" ADD PRIMARY KEY ("id");
ALTER TABLE "raepa_canalass_l" ADD UNIQUE ("idcana");
CREATE INDEX ON "raepa_canalass_l" ("idcana");


-- Table raepa_apparass_p
CREATE SCHEMA IF NOT EXISTS "raepa" ;
SET search_path TO raepa,public ;
CREATE TABLE IF NOT EXISTS "raepa_apparass_p" () ;

COMMENT ON TABLE "raepa_apparass_p" IS 'Table des appareillages du réseau d''assainissement collectif' ;

ALTER TABLE "raepa_apparass_p" ADD COLUMN IF NOT EXISTS "id" serial  NOT NULL ;
COMMENT ON COLUMN "raepa_apparass_p"."id" IS 'Identifiant numérique auto (clé primaire)' ;

ALTER TABLE "raepa_apparass_p" ADD COLUMN IF NOT EXISTS "idappareil" varchar(254) NOT NULL ;
ALTER TABLE "raepa_apparass_p" ALTER COLUMN "idappareil" SET DEFAULT 'raepa.generate_oid(‘raepa_apparass_p’)';
COMMENT ON COLUMN "raepa_apparass_p"."idappareil" IS 'Identifiant de l''appareillage' ;

ALTER TABLE "raepa_apparass_p" ADD COLUMN IF NOT EXISTS "x" numeric(10,3) NOT NULL ;
COMMENT ON COLUMN "raepa_apparass_p"."x" IS 'Coordonnée X Lambert 93 (en mètres)' ;

ALTER TABLE "raepa_apparass_p" ADD COLUMN IF NOT EXISTS "y" numeric(10,3) NOT NULL ;
COMMENT ON COLUMN "raepa_apparass_p"."y" IS 'Coordonnée X Lambert 93 (en mètres)' ;

ALTER TABLE "raepa_apparass_p" ADD COLUMN IF NOT EXISTS "mouvrage" varchar(100) NOT NULL ;
COMMENT ON COLUMN "raepa_apparass_p"."mouvrage" IS 'Maître d''ouvrage du réseau' ;

ALTER TABLE "raepa_apparass_p" ADD COLUMN IF NOT EXISTS "gexploit" varchar(100) NOT NULL ;
COMMENT ON COLUMN "raepa_apparass_p"."gexploit" IS 'Gestionnaire exploitant du réseau' ;

ALTER TABLE "raepa_apparass_p" ADD COLUMN IF NOT EXISTS "typreseau" varchar(2) NOT NULL ;
COMMENT ON COLUMN "raepa_apparass_p"."typreseau" IS 'Type du réseau d''assainissement collectif
Codes de la table VAL_RAEPA_TYP_RESEAU_ASS' ;

ALTER TABLE "raepa_apparass_p" ADD COLUMN IF NOT EXISTS "fnappass" varchar(22) NOT NULL ;
COMMENT ON COLUMN "raepa_apparass_p"."fnappass" IS 'Fonction de l''appareillage d''assainissement collectif
Codes de la table VAL_RAEPA_FONC_APP_ASS' ;

ALTER TABLE "raepa_apparass_p" ADD COLUMN IF NOT EXISTS "andebpose" varchar(4)  ;
COMMENT ON COLUMN "raepa_apparass_p"."andebpose" IS 'Année marquant le début de la période de mise en service de
l''appareillage' ;

ALTER TABLE "raepa_apparass_p" ADD COLUMN IF NOT EXISTS "anfinpose" varchar(4) NOT NULL ;
COMMENT ON COLUMN "raepa_apparass_p"."anfinpose" IS 'Année marquant la fin de la période de mise en service de
l''appareillage' ;

ALTER TABLE "raepa_apparass_p" ADD COLUMN IF NOT EXISTS "diametre" integer NOT NULL ;
COMMENT ON COLUMN "raepa_apparass_p"."diametre" IS 'Diamètre nominal de l''appareillage (en millimètres)' ;

ALTER TABLE "raepa_apparass_p" ADD COLUMN IF NOT EXISTS "idcanamont" varchar(254) NOT NULL ;
COMMENT ON COLUMN "raepa_apparass_p"."idcanamont" IS 'Identifiant de la canalisation d''amont de l''appareillage (clé
étrangère)' ;
CREATE INDEX ON "raepa_apparass_p" ("idcanamont") ;

ALTER TABLE "raepa_apparass_p" ADD COLUMN IF NOT EXISTS "idcanaval" varchar(254) NOT NULL ;
COMMENT ON COLUMN "raepa_apparass_p"."idcanaval" IS 'Identifiant de la canalisation d''aval de l''appareillage (clé
étrangère)' ;
CREATE INDEX ON "raepa_apparass_p" ("idcanaval") ;

ALTER TABLE "raepa_apparass_p" ADD COLUMN IF NOT EXISTS "idcanppale" varchar(254)  ;
COMMENT ON COLUMN "raepa_apparass_p"."idcanppale" IS 'Identifiant de la canalisation principale (clé étrangère)' ;
CREATE INDEX ON "raepa_apparass_p" ("idcanppale") ;

ALTER TABLE "raepa_apparass_p" ADD COLUMN IF NOT EXISTS "idouvrage" varchar(254)  ;
COMMENT ON COLUMN "raepa_apparass_p"."idouvrage" IS 'Identifiant de l''ouvrage d''accueil (clé étrangère)' ;
CREATE INDEX ON "raepa_apparass_p" ("idouvrage") ;

ALTER TABLE "raepa_apparass_p" ADD COLUMN IF NOT EXISTS "z" numeric(6,3)  ;
COMMENT ON COLUMN "raepa_apparass_p"."z" IS 'Altitude (en mètres, référentiel NGF-IGN69)' ;

ALTER TABLE "raepa_apparass_p" ADD COLUMN IF NOT EXISTS "qualglocxy" varchar(2) NOT NULL ;
COMMENT ON COLUMN "raepa_apparass_p"."qualglocxy" IS 'Qualité de la géolocalisation planimétrique (XY)
Codes de la table VAL_RAEPA_QUALITE_GEOLOC' ;

ALTER TABLE "raepa_apparass_p" ADD COLUMN IF NOT EXISTS "qualglocz" varchar(2) NOT NULL ;
COMMENT ON COLUMN "raepa_apparass_p"."qualglocz" IS 'Qualité de la géolocalisation altimétrique (Z)
Codes de la table VAL_RAEPA_QUALITE_GEOLOC' ;

ALTER TABLE "raepa_apparass_p" ADD COLUMN IF NOT EXISTS "datemaj" date NOT NULL ;
ALTER TABLE "raepa_apparass_p" ALTER COLUMN "datemaj" SET DEFAULT 'now()';
COMMENT ON COLUMN "raepa_apparass_p"."datemaj" IS 'Date de la dernière mise à jour des informations' ;

ALTER TABLE "raepa_apparass_p" ADD COLUMN IF NOT EXISTS "sourmaj" varchar(100) NOT NULL ;
COMMENT ON COLUMN "raepa_apparass_p"."sourmaj" IS 'Source de la mise à jour' ;

ALTER TABLE "raepa_apparass_p" ADD COLUMN IF NOT EXISTS "qualannee" varchar(2)  ;
COMMENT ON COLUMN "raepa_apparass_p"."qualannee" IS 'Fiabilité, lorsque ANDEBPOSE = ANFINPOSE, de l''année de
mise en service
Codes de la table VAL_RAEPA_QUALITE_ANPOSE' ;

ALTER TABLE "raepa_apparass_p" ADD COLUMN IF NOT EXISTS "dategeoloc" date  ;
COMMENT ON COLUMN "raepa_apparass_p"."dategeoloc" IS 'Date de la géolocalisation' ;

ALTER TABLE "raepa_apparass_p" ADD COLUMN IF NOT EXISTS "sourgeoloc" varchar(100)  ;
COMMENT ON COLUMN "raepa_apparass_p"."sourgeoloc" IS 'Auteur de la géolocalisation' ;

ALTER TABLE "raepa_apparass_p" ADD COLUMN IF NOT EXISTS "sourattrib" varchar(100)  ;
COMMENT ON COLUMN "raepa_apparass_p"."sourattrib" IS 'Auteur de la saisie des données attributaires (lorsque différent
de l''auteur de la géolocalisation)' ;

ALTER TABLE "raepa_apparass_p" ADD COLUMN IF NOT EXISTS "_source_historique" text  ;
COMMENT ON COLUMN "raepa_apparass_p"."_source_historique" IS 'Source de la donnée ( si2g ou geomap)' ;

ALTER TABLE "raepa_apparass_p" ADD COLUMN IF NOT EXISTS "_code_chantier" text ;
COMMENT ON COLUMN "raepa_apparass_p"."_code_chantier" IS 'Code du chantier, qui doit être explicite et unique entre les chantiers. Par ex : SOISSONS-PL REPUBLIQUE-2018' ;

ALTER TABLE "raepa_apparass_p" ADD COLUMN IF NOT EXISTS "_date_import" text ;
COMMENT ON COLUMN "raepa_apparass_p"."_date_import" IS 'Date de l''import' ;

ALTER TABLE "raepa_apparass_p" ADD COLUMN IF NOT EXISTS "geom" geometry(Point, 2154) NOT NULL ;
COMMENT ON COLUMN "raepa_apparass_p"."geom" IS 'Géométrie' ;
CREATE INDEX ON "raepa_apparass_p" ("geom") ;

ALTER TABLE "raepa_apparass_p" ADD PRIMARY KEY ("id");
ALTER TABLE "raepa_apparass_p" ADD UNIQUE ("idappareil");
CREATE INDEX ON "raepa_apparass_p" ("idappareil");


-- Table raepa_ouvrass_p
CREATE SCHEMA IF NOT EXISTS "raepa" ;
SET search_path TO raepa,public ;
CREATE TABLE IF NOT EXISTS "raepa_ouvrass_p" () ;

COMMENT ON TABLE "raepa_ouvrass_p" IS 'Table des ouvrages du réseau d''assainissement collectif' ;

ALTER TABLE "raepa_ouvrass_p" ADD COLUMN IF NOT EXISTS "id" serial  NOT NULL ;
COMMENT ON COLUMN "raepa_ouvrass_p"."id" IS 'Identifiant numérique auto (clé primaire)' ;

ALTER TABLE "raepa_ouvrass_p" ADD COLUMN IF NOT EXISTS "idouvrage" varchar(254) NOT NULL ;
ALTER TABLE "raepa_ouvrass_p" ALTER COLUMN "idouvrage" SET DEFAULT 'raepa.generate_oid(‘raepa_ouvrass_p’)';
COMMENT ON COLUMN "raepa_ouvrass_p"."idouvrage" IS 'Identifiant de l''ouvrage' ;

ALTER TABLE "raepa_ouvrass_p" ADD COLUMN IF NOT EXISTS "x" numeric(10,3) NOT NULL ;
COMMENT ON COLUMN "raepa_ouvrass_p"."x" IS 'Coordonnée X Lambert 93 (en mètres)' ;

ALTER TABLE "raepa_ouvrass_p" ADD COLUMN IF NOT EXISTS "y" numeric(10,3) NOT NULL ;
COMMENT ON COLUMN "raepa_ouvrass_p"."y" IS 'Coordonnée X Lambert 93 (en mètres)' ;

ALTER TABLE "raepa_ouvrass_p" ADD COLUMN IF NOT EXISTS "mouvrage" varchar(100) NOT NULL ;
COMMENT ON COLUMN "raepa_ouvrass_p"."mouvrage" IS 'Maître d''ouvrage du réseau' ;

ALTER TABLE "raepa_ouvrass_p" ADD COLUMN IF NOT EXISTS "gexploit" varchar(100) NOT NULL ;
COMMENT ON COLUMN "raepa_ouvrass_p"."gexploit" IS 'Gestionnaire exploitant du réseau' ;

ALTER TABLE "raepa_ouvrass_p" ADD COLUMN IF NOT EXISTS "typreseau" varchar(2) NOT NULL ;
COMMENT ON COLUMN "raepa_ouvrass_p"."typreseau" IS 'Type du réseau d''assainissement collectif
Codes de la table VAL_RAEPA_TYP_RESEAU_ASS' ;

ALTER TABLE "raepa_ouvrass_p" ADD COLUMN IF NOT EXISTS "fnouvass" varchar(30) NOT NULL ;
COMMENT ON COLUMN "raepa_ouvrass_p"."fnouvass" IS 'Fonction de l''ouvrage d''assainissement collectif
Codes de la table VAL_RAEPA_FONC_OUV_ASS' ;

ALTER TABLE "raepa_ouvrass_p" ADD COLUMN IF NOT EXISTS "anfinpose" varchar(4) NOT NULL ;
COMMENT ON COLUMN "raepa_ouvrass_p"."anfinpose" IS 'Année marquant la fin de la période de mise en service de
l''ouvrage' ;

ALTER TABLE "raepa_ouvrass_p" ADD COLUMN IF NOT EXISTS "idcanamont" varchar(254) NOT NULL ;
COMMENT ON COLUMN "raepa_ouvrass_p"."idcanamont" IS 'Identifiants des canalisations d''amont de l''ouvrage (clés
étrangères)' ;
CREATE INDEX ON "raepa_ouvrass_p" ("idcanamont") ;

ALTER TABLE "raepa_ouvrass_p" ADD COLUMN IF NOT EXISTS "idcanaval" varchar(254) NOT NULL ;
COMMENT ON COLUMN "raepa_ouvrass_p"."idcanaval" IS 'Identifiants des canalisations d''aval de l''ouvrage (clés
étrangères)' ;
CREATE INDEX ON "raepa_ouvrass_p" ("idcanaval") ;

ALTER TABLE "raepa_ouvrass_p" ADD COLUMN IF NOT EXISTS "idcanppale" varchar(254)  ;
COMMENT ON COLUMN "raepa_ouvrass_p"."idcanppale" IS 'Identifiant de la canalisation principale (clé étrangère)' ;
CREATE INDEX ON "raepa_ouvrass_p" ("idcanppale") ;

ALTER TABLE "raepa_ouvrass_p" ADD COLUMN IF NOT EXISTS "z" numeric(6,3)  ;
COMMENT ON COLUMN "raepa_ouvrass_p"."z" IS 'Altitude (en mètres, référentiel NGF-IGN69)' ;

ALTER TABLE "raepa_ouvrass_p" ADD COLUMN IF NOT EXISTS "_ztampon" numeric(6,3)  ;
COMMENT ON COLUMN "raepa_ouvrass_p"."_ztampon" IS 'Altitude du tampon (en mètres, référentiel NGF-IGN69)' ;

ALTER TABLE "raepa_ouvrass_p" ADD COLUMN IF NOT EXISTS "_angletampon" real  ;
COMMENT ON COLUMN "raepa_ouvrass_p"."_angletampon" IS 'Angle du tampon' ;

ALTER TABLE "raepa_ouvrass_p" ADD COLUMN IF NOT EXISTS "andebpose" varchar(4)  ;
COMMENT ON COLUMN "raepa_ouvrass_p"."andebpose" IS 'Année marquant le début de la période de mise en service de
l''ouvrage' ;

ALTER TABLE "raepa_ouvrass_p" ADD COLUMN IF NOT EXISTS "qualglocxy" varchar(2) NOT NULL ;
COMMENT ON COLUMN "raepa_ouvrass_p"."qualglocxy" IS 'Qualité de la géolocalisation planimétrique (XY)
Codes de la table VAL_RAEPA_QUALITE_GEOLOC' ;

ALTER TABLE "raepa_ouvrass_p" ADD COLUMN IF NOT EXISTS "qualglocz" varchar(2) NOT NULL ;
COMMENT ON COLUMN "raepa_ouvrass_p"."qualglocz" IS 'Qualité de la géolocalisation altimétrique (Z)
Codes de la table VAL_RAEPA_QUALITE_GEOLOC' ;

ALTER TABLE "raepa_ouvrass_p" ADD COLUMN IF NOT EXISTS "datemaj" date NOT NULL ;
ALTER TABLE "raepa_ouvrass_p" ALTER COLUMN "datemaj" SET DEFAULT 'now()';
COMMENT ON COLUMN "raepa_ouvrass_p"."datemaj" IS 'Date de la dernière mise à jour des informations' ;

ALTER TABLE "raepa_ouvrass_p" ADD COLUMN IF NOT EXISTS "sourmaj" varchar(100) NOT NULL ;
COMMENT ON COLUMN "raepa_ouvrass_p"."sourmaj" IS 'Source de la mise à jour' ;

ALTER TABLE "raepa_ouvrass_p" ADD COLUMN IF NOT EXISTS "qualannee" varchar(2)  ;
COMMENT ON COLUMN "raepa_ouvrass_p"."qualannee" IS 'Fiabilité, lorsque ANDEBPOSE = ANFINPOSE, de l''année de
mise en service
Codes de la table VAL_RAEPA_QUALITE_ANPOSE' ;

ALTER TABLE "raepa_ouvrass_p" ADD COLUMN IF NOT EXISTS "dategeoloc" date  ;
COMMENT ON COLUMN "raepa_ouvrass_p"."dategeoloc" IS 'Date de la géolocalisation' ;

ALTER TABLE "raepa_ouvrass_p" ADD COLUMN IF NOT EXISTS "sourgeoloc" varchar(100)  ;
COMMENT ON COLUMN "raepa_ouvrass_p"."sourgeoloc" IS 'Auteur de la géolocalisation' ;

ALTER TABLE "raepa_ouvrass_p" ADD COLUMN IF NOT EXISTS "sourattrib" varchar(100)  ;
COMMENT ON COLUMN "raepa_ouvrass_p"."sourattrib" IS 'Auteur de la saisie des données attributaires (lorsque différent
de l''auteur de la géolocalisation)' ;

ALTER TABLE "raepa_ouvrass_p" ADD COLUMN IF NOT EXISTS "_source_historique" text  ;
COMMENT ON COLUMN "raepa_ouvrass_p"."_source_historique" IS 'Source de la donnée ( si2g ou geomap)' ;

ALTER TABLE "raepa_ouvrass_p" ADD COLUMN IF NOT EXISTS "_code_chantier" text ;
COMMENT ON COLUMN "raepa_ouvrass_p"."_code_chantier" IS 'Code du chantier, qui doit être explicite et unique entre les chantiers. Par ex : SOISSONS-PL REPUBLIQUE-2018' ;

ALTER TABLE "raepa_ouvrass_p" ADD COLUMN IF NOT EXISTS "_date_import" date ;
COMMENT ON COLUMN "raepa_ouvrass_p"."_date_import" IS 'Date de l''import' ;

ALTER TABLE "raepa_ouvrass_p" ADD COLUMN IF NOT EXISTS "geom" geometry(Point, 2154) NOT NULL ;
COMMENT ON COLUMN "raepa_ouvrass_p"."geom" IS 'Géométrie' ;
CREATE INDEX ON "raepa_ouvrass_p" ("geom") ;

ALTER TABLE "raepa_ouvrass_p" ADD COLUMN IF NOT EXISTS "_geom_emprise" geometry(multipolygon, 2154)  ;
COMMENT ON COLUMN "raepa_ouvrass_p"."_geom_emprise" IS 'Emprise de l’ouvrage (polygone). Optionnel' ;

ALTER TABLE "raepa_ouvrass_p" ADD PRIMARY KEY ("id");
ALTER TABLE "raepa_ouvrass_p" ADD UNIQUE ("idouvrage");
CREATE INDEX ON "raepa_ouvrass_p" ("idouvrage");


-- Table raepa_reparass_p
CREATE SCHEMA IF NOT EXISTS "raepa" ;
SET search_path TO raepa,public ;
CREATE TABLE IF NOT EXISTS "raepa_reparass_p" () ;

COMMENT ON TABLE "raepa_reparass_p" IS 'Table des interventions en réparation sur les éléments du réseau d''assainissement collectif' ;

ALTER TABLE "raepa_reparass_p" ADD COLUMN IF NOT EXISTS "id" serial  NOT NULL ;
COMMENT ON COLUMN "raepa_reparass_p"."id" IS 'Identifiant numérique auto (clé primaire)' ;

ALTER TABLE "raepa_reparass_p" ADD COLUMN IF NOT EXISTS "idrepar" varchar(254) NOT NULL ;
ALTER TABLE "raepa_reparass_p" ALTER COLUMN "idrepar" SET DEFAULT 'raepa.generate_oid(‘raepa_reparass_p’)';
COMMENT ON COLUMN "raepa_reparass_p"."idrepar" IS 'Identifiant de la réparation effectuée' ;

ALTER TABLE "raepa_reparass_p" ADD COLUMN IF NOT EXISTS "x" numeric(10,3) NOT NULL ;
COMMENT ON COLUMN "raepa_reparass_p"."x" IS 'Coordonnée X Lambert 93 (en mètres)' ;

ALTER TABLE "raepa_reparass_p" ADD COLUMN IF NOT EXISTS "y" numeric(10,3) NOT NULL ;
COMMENT ON COLUMN "raepa_reparass_p"."y" IS 'Coordonnée X Lambert 93 (en mètres)' ;

ALTER TABLE "raepa_reparass_p" ADD COLUMN IF NOT EXISTS "supprepare" varchar(2) NOT NULL ;
COMMENT ON COLUMN "raepa_reparass_p"."supprepare" IS 'Type du support de la réparation
Codes de la table VAL_RAEPA_SUPPORT_REPARATION' ;

ALTER TABLE "raepa_reparass_p" ADD COLUMN IF NOT EXISTS "defreparee" varchar(2) NOT NULL ;
COMMENT ON COLUMN "raepa_reparass_p"."defreparee" IS 'Type de la défaillance réparée
Codes de la table VAL_RAEPA_TYPE_DEFAILLANCE' ;

ALTER TABLE "raepa_reparass_p" ADD COLUMN IF NOT EXISTS "idsuprepar" varchar(254) NOT NULL ;
COMMENT ON COLUMN "raepa_reparass_p"."idsuprepar" IS 'Identifiant du support de la réparation (clé étrangère)' ;
CREATE INDEX ON "raepa_reparass_p" ("idsuprepar") ;

ALTER TABLE "raepa_reparass_p" ADD COLUMN IF NOT EXISTS "daterepar" date  ;
COMMENT ON COLUMN "raepa_reparass_p"."daterepar" IS 'Date de l''intervention en réparation' ;

ALTER TABLE "raepa_reparass_p" ADD COLUMN IF NOT EXISTS "mouvrage" varchar(100)  ;
COMMENT ON COLUMN "raepa_reparass_p"."mouvrage" IS 'Maître d''ouvrage de la réparation' ;
CREATE INDEX ON "raepa_reparass_p" ("mouvrage") ;

ALTER TABLE "raepa_reparass_p" ADD COLUMN IF NOT EXISTS "_typeintervention" varchar(2) NOT NULL ;
COMMENT ON COLUMN "raepa_reparass_p"."_typeintervention" IS 'Type d’intervention : réparation, curage, inspection' ;

ALTER TABLE "raepa_reparass_p" ADD COLUMN IF NOT EXISTS "_dateprevue" date  ;
COMMENT ON COLUMN "raepa_reparass_p"."_dateprevue" IS 'Date d’intervention prévue' ;

ALTER TABLE "raepa_reparass_p" ADD COLUMN IF NOT EXISTS "_etatcanalisation" varchar(2)  ;
COMMENT ON COLUMN "raepa_reparass_p"."_etatcanalisation" IS 'Etat de la canalisation à la date d’intervention' ;

ALTER TABLE "raepa_reparass_p" ADD COLUMN IF NOT EXISTS "_frequencecuragepreventif" integer  ;
COMMENT ON COLUMN "raepa_reparass_p"."_frequencecuragepreventif" IS 'Fréquence du curage préventif en mois' ;

ALTER TABLE "raepa_reparass_p" ADD COLUMN IF NOT EXISTS "_idinterventionparent" varchar(254)  ;
COMMENT ON COLUMN "raepa_reparass_p"."_idinterventionparent" IS 'Identifiant de l’intervention parente, par exemple si le parent est un curage préventif qui entraîne une réparation' ;

ALTER TABLE "raepa_reparass_p" ADD COLUMN IF NOT EXISTS "geom" geometry(Point, 2154) NOT NULL ;
COMMENT ON COLUMN "raepa_reparass_p"."geom" IS 'Géométrie' ;
CREATE INDEX ON "raepa_reparass_p" ("geom") ;

ALTER TABLE "raepa_reparass_p" ADD PRIMARY KEY ("id");
ALTER TABLE "raepa_reparass_p" ADD UNIQUE ("idrepar");
CREATE INDEX ON "raepa_reparass_p" ("idrepar");


-- Table affleurant_pcrs
CREATE SCHEMA IF NOT EXISTS "raepa" ;
SET search_path TO raepa,public ;
CREATE TABLE IF NOT EXISTS "affleurant_pcrs" () ;

COMMENT ON TABLE "affleurant_pcrs" IS 'Classe spécialisée permettant de décrire une partie d’un réseau existant visible depuis la surface' ;

ALTER TABLE "affleurant_pcrs" ADD COLUMN IF NOT EXISTS "idaffleurant" varchar(254) NOT NULL ;
COMMENT ON COLUMN "affleurant_pcrs"."idaffleurant" IS 'Identifiant de l’affleurant PCRS' ;

ALTER TABLE "affleurant_pcrs" ADD COLUMN IF NOT EXISTS "gexploit" varchar(100) NOT NULL ;
COMMENT ON COLUMN "affleurant_pcrs"."gexploit" IS 'Gestionnaire exploitant du réseau' ;

ALTER TABLE "affleurant_pcrs" ADD COLUMN IF NOT EXISTS "reference" text NOT NULL ;
COMMENT ON COLUMN "affleurant_pcrs"."reference" IS 'Désignation du symbole à utiliser pour la représentation de l’affleurant' ;

ALTER TABLE "affleurant_pcrs" ADD COLUMN IF NOT EXISTS "anglerotaion" float NOT NULL ;
COMMENT ON COLUMN "affleurant_pcrs"."anglerotaion" IS 'Utilisé uniquement pour l’orientation du symbole d’affleurant' ;

ALTER TABLE "affleurant_pcrs" ADD COLUMN IF NOT EXISTS "longueur" float NOT NULL ;
COMMENT ON COLUMN "affleurant_pcrs"."longueur" IS 'Utilisé uniquement pour la mise à l’échelle X du symbole d’affleurant' ;

ALTER TABLE "affleurant_pcrs" ADD COLUMN IF NOT EXISTS "largeur" float NOT NULL ;
COMMENT ON COLUMN "affleurant_pcrs"."largeur" IS 'Utilisé uniquement pour la mise à l’échelle Y du symbole d’affleurant' ;

ALTER TABLE "affleurant_pcrs" ADD COLUMN IF NOT EXISTS "codecouleur" text  ;
COMMENT ON COLUMN "affleurant_pcrs"."codecouleur" IS 'Code couleur du symbole' ;

ALTER TABLE "affleurant_pcrs" ADD COLUMN IF NOT EXISTS "z" numeric(6,3)  ;
COMMENT ON COLUMN "affleurant_pcrs"."z" IS 'Altitude (en mètres, référentiel NGF-IGN69)' ;

ALTER TABLE "affleurant_pcrs" ADD COLUMN IF NOT EXISTS "qualglocxy" varchar(2) NOT NULL ;
COMMENT ON COLUMN "affleurant_pcrs"."qualglocxy" IS 'Qualité de la géolocalisation planimétrique (XY)
Codes de la table VAL_RAEPA_QUALITE_GEOLOC' ;

ALTER TABLE "affleurant_pcrs" ADD COLUMN IF NOT EXISTS "qualglocz" varchar(2) NOT NULL ;
COMMENT ON COLUMN "affleurant_pcrs"."qualglocz" IS 'Qualité de la géolocalisation altimétrique (Z)
Codes de la table VAL_RAEPA_QUALITE_GEOLOC' ;

ALTER TABLE "affleurant_pcrs" ADD COLUMN IF NOT EXISTS "geom" geometry(point,2154) NOT NULL ;
COMMENT ON COLUMN "affleurant_pcrs"."geom" IS 'Géométrie' ;

ALTER TABLE "affleurant_pcrs" ADD PRIMARY KEY ("idaffleurant");


-- Table commune
CREATE SCHEMA IF NOT EXISTS "raepa" ;
SET search_path TO raepa,public ;
CREATE TABLE IF NOT EXISTS "commune" () ;

COMMENT ON TABLE "commune" IS 'Territoire où s’exerce la compétence d’un conseil municipal' ;

ALTER TABLE "commune" ADD COLUMN IF NOT EXISTS "codeinsee" text NOT NULL ;
COMMENT ON COLUMN "commune"."codeinsee" IS 'Code officiel géographique (COG) de la commune' ;

ALTER TABLE "commune" ADD COLUMN IF NOT EXISTS "anneecog" date NOT NULL ;
COMMENT ON COLUMN "commune"."anneecog" IS 'Année de publication par l''INSEE du COG' ;

ALTER TABLE "commune" ADD COLUMN IF NOT EXISTS "nom" text NOT NULL ;
COMMENT ON COLUMN "commune"."nom" IS 'Nom de la commune' ;

ALTER TABLE "commune" ADD COLUMN IF NOT EXISTS "geom" geometry(multipolygon, 2154) NOT NULL ;
COMMENT ON COLUMN "commune"."geom" IS 'Géométrie' ;

ALTER TABLE "commune" ADD PRIMARY KEY ("codeinsee");


-- Table sys_structure_metadonnee
CREATE SCHEMA IF NOT EXISTS "raepa" ;
SET search_path TO raepa,public ;
CREATE TABLE IF NOT EXISTS "sys_structure_metadonnee" () ;

COMMENT ON TABLE "sys_structure_metadonnee" IS 'Métadonnées sur la structure de la bdd : numéro de version, date, etc.' ;

ALTER TABLE "sys_structure_metadonnee" ADD COLUMN IF NOT EXISTS "id" serial NOT NULL ;
COMMENT ON COLUMN "sys_structure_metadonnee"."id" IS 'Identifiant' ;

ALTER TABLE "sys_structure_metadonnee" ADD COLUMN IF NOT EXISTS "date_ajout" date NOT NULL ;
ALTER TABLE "sys_structure_metadonnee" ALTER COLUMN "date_ajout" SET DEFAULT 'now()';
COMMENT ON COLUMN "sys_structure_metadonnee"."date_ajout" IS 'Date d’ajout' ;

ALTER TABLE "sys_structure_metadonnee" ADD COLUMN IF NOT EXISTS "version" text NOT NULL ;
COMMENT ON COLUMN "sys_structure_metadonnee"."version" IS 'Version de la structure du schéma RAEPA' ;

ALTER TABLE "sys_structure_metadonnee" ADD COLUMN IF NOT EXISTS "description" text  ;
COMMENT ON COLUMN "sys_structure_metadonnee"."description" IS 'Description ' ;

ALTER TABLE "sys_structure_metadonnee" ADD PRIMARY KEY ("id");


-- Table sys_liste_table
CREATE SCHEMA IF NOT EXISTS "raepa" ;
SET search_path TO raepa,public ;
CREATE TABLE IF NOT EXISTS "sys_liste_table" () ;

COMMENT ON TABLE "sys_liste_table" IS 'Liste les tables du schéma RAEPA' ;

ALTER TABLE "sys_liste_table" ADD COLUMN IF NOT EXISTS "id" serial NOT NULL ;
COMMENT ON COLUMN "sys_liste_table"."id" IS 'Identifiant' ;

ALTER TABLE "sys_liste_table" ADD COLUMN IF NOT EXISTS "nom" text NOT NULL ;
COMMENT ON COLUMN "sys_liste_table"."nom" IS 'Nom de la table dans la base de données' ;

ALTER TABLE "sys_liste_table" ADD COLUMN IF NOT EXISTS "code" Varchar(3) NOT NULL ;
COMMENT ON COLUMN "sys_liste_table"."code" IS 'Code en 3 caractères, par exemple can pour les canalisations' ;

ALTER TABLE "sys_liste_table" ADD COLUMN IF NOT EXISTS "typereseau" Varchar(3) NOT NULL ;
COMMENT ON COLUMN "sys_liste_table"."typereseau" IS 'Type de réseau : AEP ou ASS' ;

ALTER TABLE "sys_liste_table" ADD COLUMN IF NOT EXISTS "cleprimaire" text NOT NULL ;
COMMENT ON COLUMN "sys_liste_table"."cleprimaire" IS 'Clé primaire' ;

ALTER TABLE "sys_liste_table" ADD COLUMN IF NOT EXISTS "libelle" text NOT NULL ;
COMMENT ON COLUMN "sys_liste_table"."libelle" IS 'Libellé (utilisable dans QGIS par exemple)' ;

ALTER TABLE "sys_liste_table" ADD COLUMN IF NOT EXISTS "commentaire" text  ;
COMMENT ON COLUMN "sys_liste_table"."commentaire" IS 'Commentaire sur la table' ;

ALTER TABLE "sys_liste_table" ADD PRIMARY KEY ("id");


-- Table sys_organisme_gestionnaire
CREATE SCHEMA IF NOT EXISTS "raepa" ;
SET search_path TO raepa,public ;
CREATE TABLE IF NOT EXISTS "sys_organisme_gestionnaire" () ;

COMMENT ON TABLE "sys_organisme_gestionnaire" IS 'Informations sur l’organisme gestionnaire ' ;

ALTER TABLE "sys_organisme_gestionnaire" ADD COLUMN IF NOT EXISTS "id" serial NOT NULL ;
COMMENT ON COLUMN "sys_organisme_gestionnaire"."id" IS 'Identifiant' ;

ALTER TABLE "sys_organisme_gestionnaire" ADD COLUMN IF NOT EXISTS "nom" text NOT NULL ;
COMMENT ON COLUMN "sys_organisme_gestionnaire"."nom" IS 'Nom de l’organisme gestionnaire' ;

ALTER TABLE "sys_organisme_gestionnaire" ADD COLUMN IF NOT EXISTS "siren" Varchar(9) NOT NULL ;
COMMENT ON COLUMN "sys_organisme_gestionnaire"."siren" IS 'SIREN. Code SIREN, ex 240200477 pour la CAS' ;

ALTER TABLE "sys_organisme_gestionnaire" ADD COLUMN IF NOT EXISTS "code" Varchar(3) NOT NULL ;
COMMENT ON COLUMN "sys_organisme_gestionnaire"."code" IS 'Nom abbrégé en 3 caractères. Exemple : CAS pour la Communauté d’agglomération du Soissonnais' ;

ALTER TABLE "sys_organisme_gestionnaire" ADD COLUMN IF NOT EXISTS "actif" boolean NOT NULL ;
ALTER TABLE "sys_organisme_gestionnaire" ALTER COLUMN "actif" SET DEFAULT '1';
COMMENT ON COLUMN "sys_organisme_gestionnaire"."actif" IS 'Si il est actif (le dernier l’emporte dans les calculs d’identifiants)' ;


-- Tables pour les imports
-- Schéma et champs pour imports
CREATE SCHEMA IF NOT EXISTS imports;

ALTER TABLE "raepa_apparass_p" ADD COLUMN IF NOT EXISTS "_temp_data" hstore  ;
COMMENT ON COLUMN "raepa_apparass_p"."_temp_data" IS 'Champ pour ajouter des données temporaires pendant l''import' ;

ALTER TABLE "raepa_ouvrass_p" ADD COLUMN IF NOT EXISTS "_temp_data" hstore  ;
COMMENT ON COLUMN "raepa_ouvrass_p"."_temp_data" IS 'Champ pour ajouter des données temporaires pendant l''import' ;

ALTER TABLE "raepa_canalass_l" ADD COLUMN IF NOT EXISTS "_temp_data" hstore  ;
COMMENT ON COLUMN "raepa_canalass_l"."_temp_data" IS 'Champ pour ajouter des données temporaires pendant l''import' ;


--
-- Contraintes
--

ALTER TABLE "sys_organisme_gestionnaire" ADD PRIMARY KEY ("id");

ALTER TABLE "raepa_canalaep_l" ADD CONSTRAINT raepa_canalaep_l_materiau_fkey FOREIGN KEY (materiau)  REFERENCES "val_raepa_materiau" (code);

ALTER TABLE "raepa_canalaep_l" ADD CONSTRAINT raepa_canalaep_l_modecirc_fkey FOREIGN KEY (modecirc)  REFERENCES "val_raepa_mode_circulation" (code);

ALTER TABLE "raepa_canalaep_l" ADD CONSTRAINT raepa_canalaep_l_contcanaep_fkey FOREIGN KEY (contcanaep)  REFERENCES "val_raepa_cat_canal_ae" (code);

ALTER TABLE "raepa_canalaep_l" ADD CONSTRAINT raepa_canalaep_l_fonccanaep_fkey FOREIGN KEY (fonccanaep)  REFERENCES "val_raepa_fonc_canal_ae" (code);

ALTER TABLE "raepa_canalaep_l" ADD CONSTRAINT raepa_canalaep_l_qualglocxy_fkey FOREIGN KEY (qualglocxy)  REFERENCES "val_raepa_qualite_geoloc" (code);

ALTER TABLE "raepa_canalaep_l" ADD CONSTRAINT raepa_canalaep_l_qualglocz_fkey FOREIGN KEY (qualglocz)  REFERENCES "val_raepa_qualite_geoloc" (code);

ALTER TABLE "raepa_canalaep_l" ADD CONSTRAINT raepa_canalaep_l_qualannee_fkey FOREIGN KEY (qualannee)  REFERENCES "val_raepa_qualite_anpose" (code);

ALTER TABLE "raepa_apparaep_p" ADD CONSTRAINT raepa_apparaep_p_fnappaep_fkey FOREIGN KEY (fnappaep)  REFERENCES "val_raepa_fonc_app_ae" (code);

ALTER TABLE "raepa_apparaep_p" ADD CONSTRAINT raepa_apparaep_p_qualglocxy_fkey FOREIGN KEY (qualglocxy)  REFERENCES "val_raepa_qualite_geoloc" (code);

ALTER TABLE "raepa_apparaep_p" ADD CONSTRAINT raepa_apparaep_p_qualglocz_fkey FOREIGN KEY (qualglocz)  REFERENCES "val_raepa_qualite_geoloc" (code);

ALTER TABLE "raepa_apparaep_p" ADD CONSTRAINT raepa_apparaep_p_qualannee_fkey FOREIGN KEY (qualannee)  REFERENCES "val_raepa_qualite_anpose" (code);

ALTER TABLE "raepa_ouvraep_p" ADD CONSTRAINT raepa_ouvraep_p_fnouvaep_fkey FOREIGN KEY (fnouvaep)  REFERENCES "val_raepa_fonc_ouv_ae" (code);

ALTER TABLE "raepa_ouvraep_p" ADD CONSTRAINT raepa_ouvraep_p_qualglocxy_fkey FOREIGN KEY (qualglocxy)  REFERENCES "val_raepa_qualite_geoloc" (code);

ALTER TABLE "raepa_ouvraep_p" ADD CONSTRAINT raepa_ouvraep_p_qualglocz_fkey FOREIGN KEY (qualglocz)  REFERENCES "val_raepa_qualite_geoloc" (code);

ALTER TABLE "raepa_ouvraep_p" ADD CONSTRAINT raepa_ouvraep_p_qualannee_fkey FOREIGN KEY (qualannee)  REFERENCES "val_raepa_qualite_anpose" (code);

ALTER TABLE "raepa_reparaep_p" ADD CONSTRAINT raepa_reparaep_p_supprepare_fkey FOREIGN KEY (supprepare)  REFERENCES "val_raepa_support_reparation" (code);

ALTER TABLE "raepa_reparaep_p" ADD CONSTRAINT raepa_reparaep_p_defreparee_fkey FOREIGN KEY (defreparee)  REFERENCES "val_raepa_type_defaillance" (code);

ALTER TABLE "raepa_canalass_l" ADD CONSTRAINT raepa_canalass_l_typreseau_fkey FOREIGN KEY (typreseau)  REFERENCES "val_raepa_typ_reseau_ass" (code);

ALTER TABLE "raepa_canalass_l" ADD CONSTRAINT raepa_canalass_l_materiau_fkey FOREIGN KEY (materiau)  REFERENCES "val_raepa_materiau" (code);

ALTER TABLE "raepa_canalass_l" ADD CONSTRAINT raepa_canalass_l__forme_fkey FOREIGN KEY (_forme)  REFERENCES "_val_raepa_forme_canal_ass" (code);

ALTER TABLE "raepa_canalass_l" ADD CONSTRAINT raepa_canalass_l__etat_fkey FOREIGN KEY (_etat)  REFERENCES "_val_raepa_etat_canal_ass" (code);

ALTER TABLE "raepa_canalass_l" ADD CONSTRAINT raepa_canalass_l_modecirc_fkey FOREIGN KEY (modecirc)  REFERENCES "val_raepa_mode_circulation" (code);

ALTER TABLE "raepa_canalass_l" ADD CONSTRAINT raepa_canalass_l_contcanass_fkey FOREIGN KEY (contcanass)  REFERENCES "val_raepa_cat_canal_ass" (code);

ALTER TABLE "raepa_canalass_l" ADD CONSTRAINT raepa_canalass_l_fonccanass_fkey FOREIGN KEY (fonccanass)  REFERENCES "val_raepa_fonc_canal_ass" (code);

ALTER TABLE "raepa_canalass_l" ADD CONSTRAINT raepa_canalass_l_idnini_fkey FOREIGN KEY (idnini)  REFERENCES "raepa_ouvrass_p" (idouvrage);

ALTER TABLE "raepa_canalass_l" ADD CONSTRAINT raepa_canalass_l_idnterm_fkey FOREIGN KEY (idnterm)  REFERENCES "raepa_ouvrass_p" (idouvrage);

ALTER TABLE "raepa_canalass_l" ADD CONSTRAINT raepa_canalass_l__precisionannee_fkey FOREIGN KEY (_precisionannee)  REFERENCES "_val_raepa_precision_annee" (code);

ALTER TABLE "raepa_canalass_l" ADD CONSTRAINT raepa_canalass_l_qualglocxy_fkey FOREIGN KEY (qualglocxy)  REFERENCES "val_raepa_qualite_geoloc" (code);

ALTER TABLE "raepa_canalass_l" ADD CONSTRAINT raepa_canalass_l_qualglocz_fkey FOREIGN KEY (qualglocz)  REFERENCES "val_raepa_qualite_geoloc" (code);

ALTER TABLE "raepa_canalass_l" ADD CONSTRAINT raepa_canalass_l_qualannee_fkey FOREIGN KEY (qualannee)  REFERENCES "val_raepa_qualite_anpose" (code);

ALTER TABLE "raepa_apparass_p" ADD CONSTRAINT raepa_apparass_p_typreseau_fkey FOREIGN KEY (typreseau)  REFERENCES "val_raepa_typ_reseau_ass" (code);

ALTER TABLE "raepa_apparass_p" ADD CONSTRAINT raepa_apparass_p_fnappass_fkey FOREIGN KEY (fnappass)  REFERENCES "val_raepa_fonc_app_ass" (code);

ALTER TABLE "raepa_apparass_p" ADD CONSTRAINT raepa_apparass_p_idcanppale_fkey FOREIGN KEY (idcanppale)  REFERENCES "raepa_canalass_l" (idcana);

ALTER TABLE "raepa_apparass_p" ADD CONSTRAINT raepa_apparass_p_idouvrage_fkey FOREIGN KEY (idouvrage)  REFERENCES "raepa_ouvrass_p" (idouvrage);

ALTER TABLE "raepa_apparass_p" ADD CONSTRAINT raepa_apparass_p_qualglocxy_fkey FOREIGN KEY (qualglocxy)  REFERENCES "val_raepa_qualite_geoloc" (code);

ALTER TABLE "raepa_apparass_p" ADD CONSTRAINT raepa_apparass_p_qualglocz_fkey FOREIGN KEY (qualglocz)  REFERENCES "val_raepa_qualite_geoloc" (code);

ALTER TABLE "raepa_apparass_p" ADD CONSTRAINT raepa_apparass_p_qualannee_fkey FOREIGN KEY (qualannee)  REFERENCES "val_raepa_qualite_anpose" (code);

ALTER TABLE "raepa_ouvrass_p" ADD CONSTRAINT raepa_ouvrass_p_typreseau_fkey FOREIGN KEY (typreseau)  REFERENCES "val_raepa_typ_reseau_ass" (code);

ALTER TABLE "raepa_ouvrass_p" ADD CONSTRAINT raepa_ouvrass_p_fnouvass_fkey FOREIGN KEY (fnouvass)  REFERENCES "val_raepa_fonc_ouv_ass" (code);

ALTER TABLE "raepa_ouvrass_p" ADD CONSTRAINT raepa_ouvrass_p_idcanppale_fkey FOREIGN KEY (idcanppale)  REFERENCES "raepa_canalass_l" (idcana);

ALTER TABLE "raepa_ouvrass_p" ADD CONSTRAINT raepa_ouvrass_p_qualglocxy_fkey FOREIGN KEY (qualglocxy)  REFERENCES "val_raepa_qualite_geoloc" (code);

ALTER TABLE "raepa_ouvrass_p" ADD CONSTRAINT raepa_ouvrass_p_qualglocz_fkey FOREIGN KEY (qualglocz)  REFERENCES "val_raepa_qualite_geoloc" (code);

ALTER TABLE "raepa_ouvrass_p" ADD CONSTRAINT raepa_ouvrass_p_qualannee_fkey FOREIGN KEY (qualannee)  REFERENCES "val_raepa_qualite_anpose" (code);

ALTER TABLE "raepa_reparass_p" ADD CONSTRAINT raepa_reparass_p_supprepare_fkey FOREIGN KEY (supprepare)  REFERENCES "val_raepa_support_reparation" (code);

ALTER TABLE "raepa_reparass_p" ADD CONSTRAINT raepa_reparass_p_defreparee_fkey FOREIGN KEY (defreparee)  REFERENCES "val_raepa_type_defaillance" (code);

ALTER TABLE "raepa_reparass_p" ADD CONSTRAINT raepa_reparass_p__typeintervention_fkey FOREIGN KEY (_typeintervention)  REFERENCES "_val_raepa_type_intervention_ass" (code);

ALTER TABLE "raepa_reparass_p" ADD CONSTRAINT raepa_reparass_p__etatcanalisation_fkey FOREIGN KEY (_etatcanalisation)  REFERENCES "_val_raepa_etat_canal_ass" (code);

ALTER TABLE "affleurant_pcrs" ADD CONSTRAINT affleurant_pcrs_qualglocxy_fkey FOREIGN KEY (qualglocxy)  REFERENCES "val_raepa_qualite_geoloc" (code);

ALTER TABLE "affleurant_pcrs" ADD CONSTRAINT affleurant_pcrs_qualglocz_fkey FOREIGN KEY (qualglocz)  REFERENCES "val_raepa_qualite_geoloc" (code);

COMMIT;
