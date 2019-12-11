--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.16
-- Dumped by pg_dump version 9.6.16

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: _val_raepa_etat_canal_ass; Type: TABLE DATA; Schema: raepa; Owner: -
--

INSERT INTO raepa._val_raepa_etat_canal_ass (code, libelle, description, ordre) VALUES ('00', 'Indéterminé', 'Etat de canalisation inconnu', NULL);
INSERT INTO raepa._val_raepa_etat_canal_ass (code, libelle, description, ordre) VALUES ('01', 'Très bon', 'Très bon état', NULL);
INSERT INTO raepa._val_raepa_etat_canal_ass (code, libelle, description, ordre) VALUES ('02', 'Bon', 'Bon état', NULL);
INSERT INTO raepa._val_raepa_etat_canal_ass (code, libelle, description, ordre) VALUES ('03', 'Médiocre', 'Etat médiocre', NULL);
INSERT INTO raepa._val_raepa_etat_canal_ass (code, libelle, description, ordre) VALUES ('04', 'Mauvais', 'Mauvais état', NULL);


--
-- Data for Name: _val_raepa_forme_canal_ass; Type: TABLE DATA; Schema: raepa; Owner: -
--

INSERT INTO raepa._val_raepa_forme_canal_ass (code, libelle, description, ordre) VALUES ('00', 'Indéterminée', 'Type de profil inconnu', NULL);
INSERT INTO raepa._val_raepa_forme_canal_ass (code, libelle, description, ordre) VALUES ('01', 'Circulaire', 'Profil circulaire', NULL);
INSERT INTO raepa._val_raepa_forme_canal_ass (code, libelle, description, ordre) VALUES ('02', 'Ovoïde', 'Profil ovoïde', NULL);
INSERT INTO raepa._val_raepa_forme_canal_ass (code, libelle, description, ordre) VALUES ('03', 'Rectangulaire', 'Profil rectangulaire', NULL);
INSERT INTO raepa._val_raepa_forme_canal_ass (code, libelle, description, ordre) VALUES ('04', 'Dalot', 'Dalot', NULL);
INSERT INTO raepa._val_raepa_forme_canal_ass (code, libelle, description, ordre) VALUES ('99', 'Autre', 'Profil connu, mais non typé', NULL);


--
-- Data for Name: _val_raepa_precision_annee; Type: TABLE DATA; Schema: raepa; Owner: -
--

INSERT INTO raepa._val_raepa_precision_annee (code, libelle, description, ordre) VALUES ('00', 'Indéterminé', 'Précision inconnue', NULL);
INSERT INTO raepa._val_raepa_precision_annee (code, libelle, description, ordre) VALUES ('01', 'Année', 'Précis à l’année', NULL);
INSERT INTO raepa._val_raepa_precision_annee (code, libelle, description, ordre) VALUES ('02', 'Décennie', 'Précis à la décennie', NULL);
INSERT INTO raepa._val_raepa_precision_annee (code, libelle, description, ordre) VALUES ('03', 'Siècle', 'Précis au siècle', NULL);


--
-- Data for Name: _val_raepa_type_intervention_ass; Type: TABLE DATA; Schema: raepa; Owner: -
--

INSERT INTO raepa._val_raepa_type_intervention_ass (code, libelle, description, ordre) VALUES ('00', 'Indéterminé', 'Type d’intervention inconnu', NULL);
INSERT INTO raepa._val_raepa_type_intervention_ass (code, libelle, description, ordre) VALUES ('01', 'Réparation', 'Réparation', NULL);
INSERT INTO raepa._val_raepa_type_intervention_ass (code, libelle, description, ordre) VALUES ('02', 'Curage préventif', 'Curage préventif', NULL);
INSERT INTO raepa._val_raepa_type_intervention_ass (code, libelle, description, ordre) VALUES ('03', 'Curage curatif', 'Curage curatif', NULL);
INSERT INTO raepa._val_raepa_type_intervention_ass (code, libelle, description, ordre) VALUES ('04', 'Inspection', 'Inspection (ITV)', NULL);


--
-- Data for Name: sys_liste_table; Type: TABLE DATA; Schema: raepa; Owner: -
--

INSERT INTO raepa.sys_liste_table (id, nom, code, typereseau, cleprimaire, libelle, commentaire) VALUES (1, 'val_raepa_materiau', 'mat', 'all', 'code', 'Matériaux', 'Nomenclature pour les matériau');
INSERT INTO raepa.sys_liste_table (id, nom, code, typereseau, cleprimaire, libelle, commentaire) VALUES (2, 'val_raepa_mode_circulation', 'moc', 'all', 'code', 'Modes de circulation', 'Nomenclature pour le mode de circulation');
INSERT INTO raepa.sys_liste_table (id, nom, code, typereseau, cleprimaire, libelle, commentaire) VALUES (3, 'val_raepa_cat_canal_ae', 'cca', 'aep', 'code', 'Catégories de canalisations AEP', 'Nomenclature pour la catégorie de canalisation AEP');
INSERT INTO raepa.sys_liste_table (id, nom, code, typereseau, cleprimaire, libelle, commentaire) VALUES (4, 'val_raepa_fonc_canal_ae', 'fca', 'aep', 'code', 'Fonctions de canalisations AEP', 'Nomenclature pour la fonction de la canalisation AEP');
INSERT INTO raepa.sys_liste_table (id, nom, code, typereseau, cleprimaire, libelle, commentaire) VALUES (5, 'val_raepa_cat_canal_ass', 'cca', 'ass', 'code', 'Catégories de canalisations ASS', 'Nomenclature pour la catégorie de canalisation ASS');
INSERT INTO raepa.sys_liste_table (id, nom, code, typereseau, cleprimaire, libelle, commentaire) VALUES (6, 'val_raepa_fonc_canal_ass', 'fca', 'ass', 'code', 'Fonctions de canalisations ASS', 'Nomenclature pour la fonction de la canalisation ASS');
INSERT INTO raepa.sys_liste_table (id, nom, code, typereseau, cleprimaire, libelle, commentaire) VALUES (7, 'val_raepa_typ_reseau_ass', 'tre', 'ass', 'code', 'Types de réseau ASS', 'Nomenclature pour le type de réseau ASS');
INSERT INTO raepa.sys_liste_table (id, nom, code, typereseau, cleprimaire, libelle, commentaire) VALUES (8, 'val_raepa_fonc_app_ae', 'fap', 'aep', 'code', 'Fonctions des appareils AEP', 'Nomenclature pour la fonction des appareils AEP');
INSERT INTO raepa.sys_liste_table (id, nom, code, typereseau, cleprimaire, libelle, commentaire) VALUES (9, 'val_raepa_fonc_ouv_ae', 'fou', 'aep', 'code', 'Fonctions des ouvrages AEP', 'Nomenclature pour la fonction des ouvrages AEP');
INSERT INTO raepa.sys_liste_table (id, nom, code, typereseau, cleprimaire, libelle, commentaire) VALUES (10, 'val_raepa_fonc_app_ass', 'fap', 'ass', 'code', 'Fonctions des appareils ASS', 'Nomenclature pour la fonction des appareils ASS');
INSERT INTO raepa.sys_liste_table (id, nom, code, typereseau, cleprimaire, libelle, commentaire) VALUES (11, 'val_raepa_fonc_ouv_ass', 'fou', 'ass', 'code', 'Fonctions des ouvrages ASS', 'Nomenclature pour la fonction des ouvrages ASS');
INSERT INTO raepa.sys_liste_table (id, nom, code, typereseau, cleprimaire, libelle, commentaire) VALUES (12, 'val_raepa_support_reparation', 'sup', 'all', 'code', 'Supports des incidents', 'Nomenclature pour le support des incidents');
INSERT INTO raepa.sys_liste_table (id, nom, code, typereseau, cleprimaire, libelle, commentaire) VALUES (13, 'val_raepa_type_defaillance', 'tde', 'all', 'code', 'Types de défaillance', 'Nomenclature pour le type de défaillance');
INSERT INTO raepa.sys_liste_table (id, nom, code, typereseau, cleprimaire, libelle, commentaire) VALUES (14, 'val_raepa_qualite_geoloc', 'qge', 'all', 'code', 'Qualités de la géolocalisation', 'Nomenclature pour la qualité de la géolocalisation');
INSERT INTO raepa.sys_liste_table (id, nom, code, typereseau, cleprimaire, libelle, commentaire) VALUES (15, 'val_raepa_qualite_anpose', 'qan', 'all', 'code', 'Qualités de l’année de pose', 'Nomenclature pour la qualité de l’année de pose');
INSERT INTO raepa.sys_liste_table (id, nom, code, typereseau, cleprimaire, libelle, commentaire) VALUES (16, '_val_raepa_forme_canal_ass', 'foc', 'ass', 'code', 'Formes de la canalisation ASS', 'Nomenclature pour la forme de la canalisation (ovoide, cylindrique, etc.)');
INSERT INTO raepa.sys_liste_table (id, nom, code, typereseau, cleprimaire, libelle, commentaire) VALUES (17, '_val_raepa_etat_canal_ass', 'eca', 'ass', 'code', 'États de la canalisation ASS', 'Nomenclature pour l’état de la canalisation');
INSERT INTO raepa.sys_liste_table (id, nom, code, typereseau, cleprimaire, libelle, commentaire) VALUES (18, '_val_raepa_precision_annee', 'pan', 'all', 'code', 'Précisions des années de pose', 'Nomenclature pour la précision des années de fin et début de pose');
INSERT INTO raepa.sys_liste_table (id, nom, code, typereseau, cleprimaire, libelle, commentaire) VALUES (19, '_val_raepa_type_intervention_ass', 'tin', 'all', 'code', 'Types d’intervention', 'Nomenclature pour le type d’intervention (curage préventif, inspection, etc.)');
INSERT INTO raepa.sys_liste_table (id, nom, code, typereseau, cleprimaire, libelle, commentaire) VALUES (20, 'raepa_canalaep_l', 'can', 'aep', 'idcana', 'Canalisations AEP', 'Table des éléments linéaires du réseau d''AEP');
INSERT INTO raepa.sys_liste_table (id, nom, code, typereseau, cleprimaire, libelle, commentaire) VALUES (21, 'raepa_apparaep_p', 'app', 'aep', 'idappareil', 'Appareillages AEP', 'Table des appareillages du réseau d''AEP');
INSERT INTO raepa.sys_liste_table (id, nom, code, typereseau, cleprimaire, libelle, commentaire) VALUES (22, 'raepa_ouvraep_p', 'ouv', 'aep', 'idouvrage', 'Ouvrages AEP', 'Table des ouvrages du réseau d''AEP');
INSERT INTO raepa.sys_liste_table (id, nom, code, typereseau, cleprimaire, libelle, commentaire) VALUES (23, 'raepa_reparaep_p', 'int', 'aep', 'idrepar', 'Interventions AEP', 'Table des interventions en réparation sur les éléments du réseau d''AEP');
INSERT INTO raepa.sys_liste_table (id, nom, code, typereseau, cleprimaire, libelle, commentaire) VALUES (24, 'raepa_canalass_l', 'can', 'ass', 'idcana', 'Canalisations ASS', 'Table des éléments linéaires du réseau d''assainissement collectif');
INSERT INTO raepa.sys_liste_table (id, nom, code, typereseau, cleprimaire, libelle, commentaire) VALUES (25, 'raepa_apparass_p', 'app', 'ass', 'idappareil', 'Appareillages ASS', 'Table des appareillages du réseau d''assainissement collectif');
INSERT INTO raepa.sys_liste_table (id, nom, code, typereseau, cleprimaire, libelle, commentaire) VALUES (26, 'raepa_ouvrass_p', 'ouv', 'ass', 'idouvrage', 'Ouvrages ASS', 'Table des ouvrages du réseau d''assainissement collectif');
INSERT INTO raepa.sys_liste_table (id, nom, code, typereseau, cleprimaire, libelle, commentaire) VALUES (27, 'raepa_reparass_p', 'int', 'ass', 'idrepar', 'Interventions ASS', 'Table des interventions en réparation sur les éléments du réseau d''assainissement collectif');
INSERT INTO raepa.sys_liste_table (id, nom, code, typereseau, cleprimaire, libelle, commentaire) VALUES (28, 'affleurant_pcrs', 'aff', 'all', 'idaffleurant', 'Affleurants PCRS', 'Classe spécialisée permettant de décrire une partie d’un réseau existant visible depuis la surface');
INSERT INTO raepa.sys_liste_table (id, nom, code, typereseau, cleprimaire, libelle, commentaire) VALUES (29, 'commune', 'com', 'all', 'codeinsee', 'Communes', 'Territoire où s’exerce la compétence d’un conseil municipal');
INSERT INTO raepa.sys_liste_table (id, nom, code, typereseau, cleprimaire, libelle, commentaire) VALUES (30, 'sys_structure_metadonnee', 'str', 'all', 'id', 'Métadonnées sur la structure de la bdd', 'Métadonnées sur la structure de la bdd : numéro de version, date, etc.');
INSERT INTO raepa.sys_liste_table (id, nom, code, typereseau, cleprimaire, libelle, commentaire) VALUES (31, 'sys_liste_table', 'tab', 'all', 'id', 'Liste des tables du schéma RAEPA', 'Liste les tables du schéma RAEPA');
INSERT INTO raepa.sys_liste_table (id, nom, code, typereseau, cleprimaire, libelle, commentaire) VALUES (32, 'sys_organisme_gestionnaire', 'ges', 'all', 'id', 'Informations sur l’organisme gestionnaire', 'Informations sur l’organisme gestionnaire ');


--
-- Name: sys_liste_table_id_seq; Type: SEQUENCE SET; Schema: raepa; Owner: -
--

SELECT pg_catalog.setval('raepa.sys_liste_table_id_seq', 32, true);


--
-- Data for Name: val_raepa_cat_canal_ae; Type: TABLE DATA; Schema: raepa; Owner: -
--

INSERT INTO raepa.val_raepa_cat_canal_ae (code, libelle, description, ordre) VALUES ('00', 'Indéterminée', 'Nature des eaux véhiculées par la canalisation inconnue', NULL);
INSERT INTO raepa.val_raepa_cat_canal_ae (code, libelle, description, ordre) VALUES ('01', 'Eau brute', 'Canalisation véhiculant de l''eau brute', NULL);
INSERT INTO raepa.val_raepa_cat_canal_ae (code, libelle, description, ordre) VALUES ('02', 'Eau potable', 'Canalisation véhiculant de l''eau potable', NULL);
INSERT INTO raepa.val_raepa_cat_canal_ae (code, libelle, description, ordre) VALUES ('99', 'Autre', 'Canalisation véhiculant tantôt de l''eau brute, tantôt de l''eau potable', NULL);


--
-- Data for Name: val_raepa_cat_canal_ass; Type: TABLE DATA; Schema: raepa; Owner: -
--

INSERT INTO raepa.val_raepa_cat_canal_ass (code, libelle, description, ordre) VALUES ('00', 'Indéterminée', 'Nature des eaux véhiculées par la canalisation inconnue', NULL);
INSERT INTO raepa.val_raepa_cat_canal_ass (code, libelle, description, ordre) VALUES ('01', 'Eaux pluviales', 'Canalisation véhiculant des eaux pluviales', NULL);
INSERT INTO raepa.val_raepa_cat_canal_ass (code, libelle, description, ordre) VALUES ('02', 'Eaux usées', 'Canalisation véhiculant des eaux usées', NULL);
INSERT INTO raepa.val_raepa_cat_canal_ass (code, libelle, description, ordre) VALUES ('03', 'Unitaire', 'Canalisation véhiculant des eaux usées et pluviales en fonctionnement normal', NULL);
INSERT INTO raepa.val_raepa_cat_canal_ass (code, libelle, description, ordre) VALUES ('99', 'Autre', 'Canalisation véhiculant tantôt des eaux pluviales, tantôt des eaux usées', NULL);


--
-- Data for Name: val_raepa_fonc_app_ae; Type: TABLE DATA; Schema: raepa; Owner: -
--

INSERT INTO raepa.val_raepa_fonc_app_ae (code, libelle, description, ordre) VALUES ('00', 'Indéterminé', 'Type d''appareillage inconnu', NULL);
INSERT INTO raepa.val_raepa_fonc_app_ae (code, libelle, description, ordre) VALUES ('01', 'Point de branchement', 'Piquage de branchement individuel', NULL);
INSERT INTO raepa.val_raepa_fonc_app_ae (code, libelle, description, ordre) VALUES ('02', 'Ventouse', 'Ventouse d''adduction d''eau', NULL);
INSERT INTO raepa.val_raepa_fonc_app_ae (code, libelle, description, ordre) VALUES ('03', 'Vanne', 'Vanne d''adduction d''eau', NULL);
INSERT INTO raepa.val_raepa_fonc_app_ae (code, libelle, description, ordre) VALUES ('04', 'Vidange', 'Vidange d''adduction d''eau', NULL);
INSERT INTO raepa.val_raepa_fonc_app_ae (code, libelle, description, ordre) VALUES ('05', 'Régulateur de pression', 'Régulateur de pression', NULL);
INSERT INTO raepa.val_raepa_fonc_app_ae (code, libelle, description, ordre) VALUES ('06', 'Hydrant', 'Poteau de défense contre l''incendie', NULL);
INSERT INTO raepa.val_raepa_fonc_app_ae (code, libelle, description, ordre) VALUES ('07', 'Compteur', 'Appareil de mesure des volumes transités', NULL);
INSERT INTO raepa.val_raepa_fonc_app_ae (code, libelle, description, ordre) VALUES ('08', 'Débitmètre', 'Appareil de mesure des débits transités', NULL);
INSERT INTO raepa.val_raepa_fonc_app_ae (code, libelle, description, ordre) VALUES ('99', 'Autre', 'Appareillage dont le type ne figure pas dans la liste ci-dessus', NULL);


--
-- Data for Name: val_raepa_fonc_app_ass; Type: TABLE DATA; Schema: raepa; Owner: -
--

INSERT INTO raepa.val_raepa_fonc_app_ass (code, libelle, description, ordre) VALUES ('01', 'Point de branchement', 'Piquage de branchement individuel', NULL);
INSERT INTO raepa.val_raepa_fonc_app_ass (code, libelle, description, ordre) VALUES ('02', 'Ventouse', 'Ventouse d''assainissement', NULL);
INSERT INTO raepa.val_raepa_fonc_app_ass (code, libelle, description, ordre) VALUES ('03', 'Vanne', 'Vanne d''assainissement', NULL);
INSERT INTO raepa.val_raepa_fonc_app_ass (code, libelle, description, ordre) VALUES ('04', 'Débitmètre', 'Appareil de mesure des débits transités', NULL);
INSERT INTO raepa.val_raepa_fonc_app_ass (code, libelle, description, ordre) VALUES ('99', 'Autre', 'Appareillage dont le type ne figure pas dans la liste ci-dessus', NULL);
INSERT INTO raepa.val_raepa_fonc_app_ass (code, libelle, description, ordre) VALUES ('_1', 'Purge', 'Purge', NULL);


--
-- Data for Name: val_raepa_fonc_canal_ae; Type: TABLE DATA; Schema: raepa; Owner: -
--

INSERT INTO raepa.val_raepa_fonc_canal_ae (code, libelle, description, ordre) VALUES ('00', 'Indéterminée', 'Fonction de la canalisation dans le réseau inconnue', NULL);
INSERT INTO raepa.val_raepa_fonc_canal_ae (code, libelle, description, ordre) VALUES ('01', 'Transport', 'Canalisation de transport', NULL);
INSERT INTO raepa.val_raepa_fonc_canal_ae (code, libelle, description, ordre) VALUES ('02', 'Distribution', 'Canalisation de distribution', NULL);
INSERT INTO raepa.val_raepa_fonc_canal_ae (code, libelle, description, ordre) VALUES ('99', 'Autre', 'Canalisation dont la fonction dans le réseau ne figure pas dans la liste ci-dessus', NULL);


--
-- Data for Name: val_raepa_fonc_canal_ass; Type: TABLE DATA; Schema: raepa; Owner: -
--

INSERT INTO raepa.val_raepa_fonc_canal_ass (code, libelle, description, ordre) VALUES ('00', 'Indéterminée', 'Fonction de la canalisation dans le réseau inconnue', NULL);
INSERT INTO raepa.val_raepa_fonc_canal_ass (code, libelle, description, ordre) VALUES ('01', 'Transport', 'Canalisation de transport', NULL);
INSERT INTO raepa.val_raepa_fonc_canal_ass (code, libelle, description, ordre) VALUES ('02', 'Collecte', 'Canalisation de collecte', NULL);
INSERT INTO raepa.val_raepa_fonc_canal_ass (code, libelle, description, ordre) VALUES ('99', 'Autre', 'Canalisation dont la fonction dans le réseau ne figure pas dans la liste ci-dessus', NULL);


--
-- Data for Name: val_raepa_fonc_ouv_ae; Type: TABLE DATA; Schema: raepa; Owner: -
--

INSERT INTO raepa.val_raepa_fonc_ouv_ae (code, libelle, description, ordre) VALUES ('00', 'Indéterminé', 'Type d''ouvrage inconnu', NULL);
INSERT INTO raepa.val_raepa_fonc_ouv_ae (code, libelle, description, ordre) VALUES ('01', 'Station de pompage', 'Station de pompage d''eau potable', NULL);
INSERT INTO raepa.val_raepa_fonc_ouv_ae (code, libelle, description, ordre) VALUES ('02', 'Station de traitement', 'Station de traitement d''eau potable', NULL);
INSERT INTO raepa.val_raepa_fonc_ouv_ae (code, libelle, description, ordre) VALUES ('03', 'Réservoir', 'Réservoir d''eau potable', NULL);
INSERT INTO raepa.val_raepa_fonc_ouv_ae (code, libelle, description, ordre) VALUES ('04', 'Chambre de comptage', 'Chambre de comptage', NULL);
INSERT INTO raepa.val_raepa_fonc_ouv_ae (code, libelle, description, ordre) VALUES ('05', 'Captage', 'Captage', NULL);
INSERT INTO raepa.val_raepa_fonc_ouv_ae (code, libelle, description, ordre) VALUES ('99', 'Autre', 'Ouvrage dont le type ne figure pas dans la liste ci-dessus', NULL);


--
-- Data for Name: val_raepa_fonc_ouv_ass; Type: TABLE DATA; Schema: raepa; Owner: -
--

INSERT INTO raepa.val_raepa_fonc_ouv_ass (code, libelle, description, ordre) VALUES ('00', 'Indéterminé', 'Type d''ouvrage inconnu', NULL);
INSERT INTO raepa.val_raepa_fonc_ouv_ass (code, libelle, description, ordre) VALUES ('01', 'Station de pompage', 'Station de pompage d''eaux usées et/ou pluviales', NULL);
INSERT INTO raepa.val_raepa_fonc_ouv_ass (code, libelle, description, ordre) VALUES ('02', 'Station d''épuration', 'Station de traitement d''eaux usées', NULL);
INSERT INTO raepa.val_raepa_fonc_ouv_ass (code, libelle, description, ordre) VALUES ('03', 'Bassin de stockage', 'Ouvrage de stockage d''eaux usées et/ou pluviales', NULL);
INSERT INTO raepa.val_raepa_fonc_ouv_ass (code, libelle, description, ordre) VALUES ('04', 'Déversoir d''orage', 'Ouvrage de décharge du trop-plein d''effluents d''une canalisation d''assainissement collectif vers un milieu naturel récepteur', NULL);
INSERT INTO raepa.val_raepa_fonc_ouv_ass (code, libelle, description, ordre) VALUES ('05', 'Rejet', 'Rejet (exutoire) dans le milieu naturel d''eaux usées ou pluviales', NULL);
INSERT INTO raepa.val_raepa_fonc_ouv_ass (code, libelle, description, ordre) VALUES ('06', 'Regard', 'Regard', NULL);
INSERT INTO raepa.val_raepa_fonc_ouv_ass (code, libelle, description, ordre) VALUES ('07', 'Avaloir', 'Avaloir', NULL);
INSERT INTO raepa.val_raepa_fonc_ouv_ass (code, libelle, description, ordre) VALUES ('99', 'Autre', 'Ouvrage dont le type ne figure pas dans la liste ci-dessus', NULL);
INSERT INTO raepa.val_raepa_fonc_ouv_ass (code, libelle, description, ordre) VALUES ('_1', 'Désableur', 'Désableur', NULL);
INSERT INTO raepa.val_raepa_fonc_ouv_ass (code, libelle, description, ordre) VALUES ('_2', 'Boîte de branchement', 'Boîte de branchement', NULL);
INSERT INTO raepa.val_raepa_fonc_ouv_ass (code, libelle, description, ordre) VALUES ('_3', 'Regard double', 'Regard double', NULL);
INSERT INTO raepa.val_raepa_fonc_ouv_ass (code, libelle, description, ordre) VALUES ('_4', 'RACAS', 'RACAS', NULL);
INSERT INTO raepa.val_raepa_fonc_ouv_ass (code, libelle, description, ordre) VALUES ('_5', 'Chasse', 'Chasse', NULL);
INSERT INTO raepa.val_raepa_fonc_ouv_ass (code, libelle, description, ordre) VALUES ('_6', 'Dégraisseur', 'Dégraisseur', NULL);
INSERT INTO raepa.val_raepa_fonc_ouv_ass (code, libelle, description, ordre) VALUES ('_7', 'Grille', 'Grille', NULL);


--
-- Data for Name: val_raepa_materiau; Type: TABLE DATA; Schema: raepa; Owner: -
--

INSERT INTO raepa.val_raepa_materiau (code, libelle, description, ordre) VALUES ('00', 'Indéterminé', 'Canalisation composée de tuyaux dont le matériau est inconnu', NULL);
INSERT INTO raepa.val_raepa_materiau (code, libelle, description, ordre) VALUES ('01', 'Acier', 'Canalisation composée de tuyaux d''acier', NULL);
INSERT INTO raepa.val_raepa_materiau (code, libelle, description, ordre) VALUES ('02', 'Amiante-ciment', 'Canalisation composée de tuyaux d''amiante-ciment', NULL);
INSERT INTO raepa.val_raepa_materiau (code, libelle, description, ordre) VALUES ('03', 'Béton âme tôle', 'Canalisation composée de tuyaux de béton âme tôle', NULL);
INSERT INTO raepa.val_raepa_materiau (code, libelle, description, ordre) VALUES ('04', 'Béton armé', 'Canalisation composée de tuyaux de béton armé', NULL);
INSERT INTO raepa.val_raepa_materiau (code, libelle, description, ordre) VALUES ('05', 'Béton fibré', 'Canalisation composée de tuyaux de béton fibré', NULL);
INSERT INTO raepa.val_raepa_materiau (code, libelle, description, ordre) VALUES ('06', 'Béton non armé', 'Canalisation composée de tuyaux de béton non armé', NULL);
INSERT INTO raepa.val_raepa_materiau (code, libelle, description, ordre) VALUES ('07', 'Cuivre', 'Canalisation composée de tuyaux de cuivre', NULL);
INSERT INTO raepa.val_raepa_materiau (code, libelle, description, ordre) VALUES ('08', 'Fibre ciment', 'Canalisation composée de tuyaux de fibre ciment', NULL);
INSERT INTO raepa.val_raepa_materiau (code, libelle, description, ordre) VALUES ('09', 'Fibre de verre', 'Canalisation composée de tuyaux de fibre de verre', NULL);
INSERT INTO raepa.val_raepa_materiau (code, libelle, description, ordre) VALUES ('10', 'Fibrociment', 'Canalisation composée de tuyaux de fibrociment', NULL);
INSERT INTO raepa.val_raepa_materiau (code, libelle, description, ordre) VALUES ('11', 'Fonte ductile', 'Canalisation composée de tuyaux de fonte ductile', NULL);
INSERT INTO raepa.val_raepa_materiau (code, libelle, description, ordre) VALUES ('12', 'Fonte grise', 'Canalisation composée de tuyaux de fonte grise', NULL);
INSERT INTO raepa.val_raepa_materiau (code, libelle, description, ordre) VALUES ('13', 'Grès', 'Canalisation composée de tuyaux de grès', NULL);
INSERT INTO raepa.val_raepa_materiau (code, libelle, description, ordre) VALUES ('14', 'Maçonné', 'Canalisation maçonnée', NULL);
INSERT INTO raepa.val_raepa_materiau (code, libelle, description, ordre) VALUES ('15', 'Meulière', 'Canalisation construite en pierre meulière', NULL);
INSERT INTO raepa.val_raepa_materiau (code, libelle, description, ordre) VALUES ('16', 'PEBD', 'Canalisation composée de tuyaux de polyéthylène basse densité', NULL);
INSERT INTO raepa.val_raepa_materiau (code, libelle, description, ordre) VALUES ('17', 'PEHD annelé', 'Canalisation composée de tuyaux de polyéthylène haute densité annelés', NULL);
INSERT INTO raepa.val_raepa_materiau (code, libelle, description, ordre) VALUES ('18', 'PEHD lisse', 'Canalisation composée de tuyaux de polyéthylène haute densité lisses', NULL);
INSERT INTO raepa.val_raepa_materiau (code, libelle, description, ordre) VALUES ('19', 'Plomb', 'Canalisation composée de tuyaux de plomb', NULL);
INSERT INTO raepa.val_raepa_materiau (code, libelle, description, ordre) VALUES ('20', 'PP annelé', 'Canalisation composée de tuyaux de polypropylène annelés', NULL);
INSERT INTO raepa.val_raepa_materiau (code, libelle, description, ordre) VALUES ('21', 'PP lisse', 'Canalisation composée de tuyaux de polypropylène lisses', NULL);
INSERT INTO raepa.val_raepa_materiau (code, libelle, description, ordre) VALUES ('22', 'PRV A', 'Canalisation composée de polyester renforcé de fibre de verre (série A)', NULL);
INSERT INTO raepa.val_raepa_materiau (code, libelle, description, ordre) VALUES ('23', 'PRV B', 'Canalisation composée de polyester renforcé de fibre de verre (série B)', NULL);
INSERT INTO raepa.val_raepa_materiau (code, libelle, description, ordre) VALUES ('24', 'PVC ancien', 'Canalisation composée de tuyaux de polychlorure de vinyle posés avant 1980', NULL);
INSERT INTO raepa.val_raepa_materiau (code, libelle, description, ordre) VALUES ('25', 'PVC BO', 'Canalisation composée de tuyaux de polychlorure de vinyle bi-orienté', NULL);
INSERT INTO raepa.val_raepa_materiau (code, libelle, description, ordre) VALUES ('26', 'PVC U annelé', 'Canalisation composée de tuyaux de polychlorure de vinyle rigide annelés', NULL);
INSERT INTO raepa.val_raepa_materiau (code, libelle, description, ordre) VALUES ('27', 'PVC U lisse', 'Canalisation composée de tuyaux de polychlorure de vinyle rigide lisses', NULL);
INSERT INTO raepa.val_raepa_materiau (code, libelle, description, ordre) VALUES ('28', 'Tôle galvanisée', 'Canalisation construite en tôle galvanisée', NULL);
INSERT INTO raepa.val_raepa_materiau (code, libelle, description, ordre) VALUES ('99', 'Autre', 'Canalisation composée de tuyaux dont le matériau ne figure pas dans la liste ci-dessus', NULL);


--
-- Data for Name: val_raepa_mode_circulation; Type: TABLE DATA; Schema: raepa; Owner: -
--

INSERT INTO raepa.val_raepa_mode_circulation (code, libelle, description, ordre) VALUES ('00', 'Indéterminé', 'Mode de circulation inconnu', NULL);
INSERT INTO raepa.val_raepa_mode_circulation (code, libelle, description, ordre) VALUES ('01', 'Gravitaire', 'L''eau s''écoule par l''effet de la pesanteur dans la canalisation en pente', NULL);
INSERT INTO raepa.val_raepa_mode_circulation (code, libelle, description, ordre) VALUES ('02', 'Forcé', 'L''eau circule sous pression dans la canalisation grâce à un système de pompage', NULL);
INSERT INTO raepa.val_raepa_mode_circulation (code, libelle, description, ordre) VALUES ('03', 'Sous-vide', 'L''eau circule par l''effet de la mise sous vide de la canalisation par une centrale d''aspiration', NULL);
INSERT INTO raepa.val_raepa_mode_circulation (code, libelle, description, ordre) VALUES ('99', 'Autre', 'L''eau circule tantôt dans un des modes ci-dessus tantôt dans un autre', NULL);


--
-- Data for Name: val_raepa_qualite_anpose; Type: TABLE DATA; Schema: raepa; Owner: -
--

INSERT INTO raepa.val_raepa_qualite_anpose (code, libelle, description, ordre) VALUES ('00', 'Indéterminée', 'Information ou qualité de l''information inconnue', NULL);
INSERT INTO raepa.val_raepa_qualite_anpose (code, libelle, description, ordre) VALUES ('01', 'Certaine', 'Année constatée durant les travaux de pose', NULL);
INSERT INTO raepa.val_raepa_qualite_anpose (code, libelle, description, ordre) VALUES ('02', 'Récolement', 'Année reprise sur plans de récolement', NULL);
INSERT INTO raepa.val_raepa_qualite_anpose (code, libelle, description, ordre) VALUES ('03', 'Projet', 'Année reprise sur plans de projet', NULL);
INSERT INTO raepa.val_raepa_qualite_anpose (code, libelle, description, ordre) VALUES ('04', 'Mémoire', 'Année issue de souvenir(s) individuel(s)', NULL);
INSERT INTO raepa.val_raepa_qualite_anpose (code, libelle, description, ordre) VALUES ('05', 'Déduite', 'Année déduite du matériau ou de l''état de l''équipement', NULL);


--
-- Data for Name: val_raepa_qualite_geoloc; Type: TABLE DATA; Schema: raepa; Owner: -
--

INSERT INTO raepa.val_raepa_qualite_geoloc (code, libelle, description, ordre) VALUES ('01', 'Classe A', 'Classe de précision inférieure 40 cm', NULL);
INSERT INTO raepa.val_raepa_qualite_geoloc (code, libelle, description, ordre) VALUES ('02', 'Classe B', 'Classe de précision supérieure à 40 cm et inférieure à 1,50 m', NULL);
INSERT INTO raepa.val_raepa_qualite_geoloc (code, libelle, description, ordre) VALUES ('03', 'Classe C', 'Classe de précision supérieure à 1,50 m', NULL);


--
-- Data for Name: val_raepa_support_reparation; Type: TABLE DATA; Schema: raepa; Owner: -
--

INSERT INTO raepa.val_raepa_support_reparation (code, libelle, description, ordre) VALUES ('01', 'Canalisation', 'Réparation sur une canalisation', NULL);
INSERT INTO raepa.val_raepa_support_reparation (code, libelle, description, ordre) VALUES ('02', 'Appareillage', 'Réparation d''un appareillage', NULL);
INSERT INTO raepa.val_raepa_support_reparation (code, libelle, description, ordre) VALUES ('03', 'Ouvrage', 'Réparation d''un ouvrage', NULL);


--
-- Data for Name: val_raepa_typ_reseau_ass; Type: TABLE DATA; Schema: raepa; Owner: -
--

INSERT INTO raepa.val_raepa_typ_reseau_ass (code, libelle, description, ordre) VALUES ('01', 'Pluvial', 'Réseau de collecte de seules eaux pluviales', NULL);
INSERT INTO raepa.val_raepa_typ_reseau_ass (code, libelle, description, ordre) VALUES ('02', 'Eaux usées', 'Réseau de collecte de seules eaux usées', NULL);
INSERT INTO raepa.val_raepa_typ_reseau_ass (code, libelle, description, ordre) VALUES ('03', 'Unitaire', 'Réseau de collecte des eaux usées et des eaux pluviales', NULL);
INSERT INTO raepa.val_raepa_typ_reseau_ass (code, libelle, description, ordre) VALUES ('00', 'Indéterminé', 'Type d''appareillage inconnu', NULL);


--
-- Data for Name: val_raepa_type_defaillance; Type: TABLE DATA; Schema: raepa; Owner: -
--

INSERT INTO raepa.val_raepa_type_defaillance (code, libelle, description, ordre) VALUES ('00', 'Indéterminée', 'Défaillance de type inconnu', NULL);
INSERT INTO raepa.val_raepa_type_defaillance (code, libelle, description, ordre) VALUES ('01', 'Casse longitudinale', 'Canalisation fendue sur sa longueur', NULL);
INSERT INTO raepa.val_raepa_type_defaillance (code, libelle, description, ordre) VALUES ('02', 'Casse nette', 'Canalisation cassée', NULL);
INSERT INTO raepa.val_raepa_type_defaillance (code, libelle, description, ordre) VALUES ('03', 'Déboîtement', 'Déboîtement de tuyau(x) de la canalisation', NULL);
INSERT INTO raepa.val_raepa_type_defaillance (code, libelle, description, ordre) VALUES ('04', 'Fissure', 'Canalisation fissurée', NULL);
INSERT INTO raepa.val_raepa_type_defaillance (code, libelle, description, ordre) VALUES ('05', 'Joint', 'Joint défectueux', NULL);
INSERT INTO raepa.val_raepa_type_defaillance (code, libelle, description, ordre) VALUES ('06', 'Percement', 'Canalisation percée', NULL);
INSERT INTO raepa.val_raepa_type_defaillance (code, libelle, description, ordre) VALUES ('99', 'Autre', 'Défaillance dont le type ne figure pas dans la liste ci-dessus', NULL);


--
-- PostgreSQL database dump complete
--

