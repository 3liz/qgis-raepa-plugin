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
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

-- v_canalisation_avec_z_manquant
CREATE VIEW raepa.v_canalisation_avec_z_manquant AS
 SELECT raepa_canalass_l.id,
    raepa_canalass_l.idcana,
    raepa_canalass_l.mouvrage,
    raepa_canalass_l.gexploit,
    raepa_canalass_l.enservice,
    raepa_canalass_l.branchemnt,
    raepa_canalass_l.typreseau,
    raepa_canalass_l.materiau,
    raepa_canalass_l.diametre,
    raepa_canalass_l._dimensionhorizontale,
    raepa_canalass_l._forme,
    raepa_canalass_l._etat,
    raepa_canalass_l.anfinpose,
    raepa_canalass_l.modecirc,
    raepa_canalass_l.contcanass,
    raepa_canalass_l.fonccanass,
    raepa_canalass_l.idnini,
    raepa_canalass_l.idnterm,
    raepa_canalass_l.idcanppale,
    raepa_canalass_l.zamont,
    raepa_canalass_l.zaval,
    raepa_canalass_l.sensecoul,
    raepa_canalass_l.andebpose,
    raepa_canalass_l._precisionannee,
    raepa_canalass_l.longcana,
    raepa_canalass_l._longcana_cm,
    raepa_canalass_l._longcana_reelle,
    raepa_canalass_l._pente,
    raepa_canalass_l.nbranche,
    raepa_canalass_l.qualglocxy,
    raepa_canalass_l.qualglocz,
    raepa_canalass_l.datemaj,
    raepa_canalass_l.sourmaj,
    raepa_canalass_l.qualannee,
    raepa_canalass_l.dategeoloc,
    raepa_canalass_l.sourgeoloc,
    raepa_canalass_l.sourattrib,
    raepa_canalass_l._source_historique,
    raepa_canalass_l._code_chantier,
    raepa_canalass_l._date_import,
    raepa_canalass_l.geom,
    raepa_canalass_l._temp_data
   FROM raepa.raepa_canalass_l
  WHERE (COALESCE(raepa_canalass_l.zamont, (0)::numeric) = (0)::numeric);


-- v_canalisation_avec_zaval_manquant
CREATE VIEW raepa.v_canalisation_avec_zaval_manquant AS
 SELECT raepa_canalass_l.id,
    raepa_canalass_l.idcana,
    raepa_canalass_l.mouvrage,
    raepa_canalass_l.gexploit,
    raepa_canalass_l.enservice,
    raepa_canalass_l.branchemnt,
    raepa_canalass_l.typreseau,
    raepa_canalass_l.materiau,
    raepa_canalass_l.diametre,
    raepa_canalass_l._dimensionhorizontale,
    raepa_canalass_l._forme,
    raepa_canalass_l._etat,
    raepa_canalass_l.anfinpose,
    raepa_canalass_l.modecirc,
    raepa_canalass_l.contcanass,
    raepa_canalass_l.fonccanass,
    raepa_canalass_l.idnini,
    raepa_canalass_l.idnterm,
    raepa_canalass_l.idcanppale,
    raepa_canalass_l.zamont,
    raepa_canalass_l.zaval,
    raepa_canalass_l.sensecoul,
    raepa_canalass_l.andebpose,
    raepa_canalass_l._precisionannee,
    raepa_canalass_l.longcana,
    raepa_canalass_l._longcana_cm,
    raepa_canalass_l._longcana_reelle,
    raepa_canalass_l._pente,
    raepa_canalass_l.nbranche,
    raepa_canalass_l.qualglocxy,
    raepa_canalass_l.qualglocz,
    raepa_canalass_l.datemaj,
    raepa_canalass_l.sourmaj,
    raepa_canalass_l.qualannee,
    raepa_canalass_l.dategeoloc,
    raepa_canalass_l.sourgeoloc,
    raepa_canalass_l.sourattrib,
    raepa_canalass_l._source_historique,
    raepa_canalass_l._code_chantier,
    raepa_canalass_l._date_import,
    raepa_canalass_l.geom,
    raepa_canalass_l._temp_data
   FROM raepa.raepa_canalass_l
  WHERE (COALESCE(raepa_canalass_l.zaval, (0)::numeric) = (0)::numeric);


-- v_canalisation_branchement
CREATE VIEW raepa.v_canalisation_branchement AS
 SELECT r.id,
    r.idcana,
    r.mouvrage,
    r.gexploit,
    r.enservice,
    r.branchemnt,
    r.typreseau,
    r.materiau,
    r.diametre,
    r._dimensionhorizontale,
    r._forme,
    r._etat,
    r.anfinpose,
    r.modecirc,
    r.contcanass,
    r.fonccanass,
    r.idnini,
    r.idnterm,
    r.idcanppale,
    r.zamont,
    r.zaval,
    r.sensecoul,
    r.andebpose,
    r._precisionannee,
    r.longcana,
    r._longcana_cm,
    r._longcana_reelle,
    r._pente,
    r.nbranche,
    r.qualglocxy,
    r.qualglocz,
    r.datemaj,
    r.sourmaj,
    r.qualannee,
    r.dategeoloc,
    r.sourgeoloc,
    r.sourattrib,
    r._source_historique,
    r._code_chantier,
    r._date_import,
    r.geom,
    r._temp_data
   FROM (raepa.raepa_canalass_l r
     JOIN raepa.raepa_ouvrass_p o ON ((((o.fnouvass)::text = '_2'::text) AND ((r.idnini)::text = (o.idouvrage)::text))));


-- v_canalisation_sans_ouvrage
CREATE VIEW raepa.v_canalisation_sans_ouvrage AS
 SELECT r.id,
    r.idcana,
    r.mouvrage,
    r.gexploit,
    r.enservice,
    r.branchemnt,
    r.typreseau,
    r.materiau,
    r.diametre,
    r._dimensionhorizontale,
    r._forme,
    r._etat,
    r.anfinpose,
    r.modecirc,
    r.contcanass,
    r.fonccanass,
    r.idnini,
    r.idnterm,
    r.idcanppale,
    r.zamont,
    r.zaval,
    r.sensecoul,
    r.andebpose,
    r._precisionannee,
    r.longcana,
    r._longcana_cm,
    r._longcana_reelle,
    r._pente,
    r.nbranche,
    r.qualglocxy,
    r.qualglocz,
    r.datemaj,
    r.sourmaj,
    r.qualannee,
    r.dategeoloc,
    r.sourgeoloc,
    r.sourattrib,
    r._source_historique,
    r._code_chantier,
    r._date_import,
    r.geom,
    r._temp_data
   FROM raepa.raepa_canalass_l r
  WHERE ((r.idnini IS NULL) OR (r.idnterm IS NULL));


--
-- PostgreSQL database dump complete
--

