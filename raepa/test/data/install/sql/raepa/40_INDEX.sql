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

SET default_tablespace = '';

-- raepa_apparaep_p_geom_idx
CREATE INDEX raepa_apparaep_p_geom_idx ON raepa.raepa_apparaep_p USING btree (geom);


-- raepa_apparaep_p_idappareil_idx
CREATE INDEX raepa_apparaep_p_idappareil_idx ON raepa.raepa_apparaep_p USING btree (idappareil);


-- raepa_apparaep_p_idcanamont_idx
CREATE INDEX raepa_apparaep_p_idcanamont_idx ON raepa.raepa_apparaep_p USING btree (idcanamont);


-- raepa_apparaep_p_idcanaval_idx
CREATE INDEX raepa_apparaep_p_idcanaval_idx ON raepa.raepa_apparaep_p USING btree (idcanaval);


-- raepa_apparaep_p_idcanppale_idx
CREATE INDEX raepa_apparaep_p_idcanppale_idx ON raepa.raepa_apparaep_p USING btree (idcanppale);


-- raepa_apparaep_p_idouvrage_idx
CREATE INDEX raepa_apparaep_p_idouvrage_idx ON raepa.raepa_apparaep_p USING btree (idouvrage);


-- raepa_apparass_p_geom_idx
CREATE INDEX raepa_apparass_p_geom_idx ON raepa.raepa_apparass_p USING btree (geom);


-- raepa_apparass_p_idappareil_idx
CREATE INDEX raepa_apparass_p_idappareil_idx ON raepa.raepa_apparass_p USING btree (idappareil);


-- raepa_apparass_p_idcanamont_idx
CREATE INDEX raepa_apparass_p_idcanamont_idx ON raepa.raepa_apparass_p USING btree (idcanamont);


-- raepa_apparass_p_idcanaval_idx
CREATE INDEX raepa_apparass_p_idcanaval_idx ON raepa.raepa_apparass_p USING btree (idcanaval);


-- raepa_apparass_p_idcanppale_idx
CREATE INDEX raepa_apparass_p_idcanppale_idx ON raepa.raepa_apparass_p USING btree (idcanppale);


-- raepa_apparass_p_idouvrage_idx
CREATE INDEX raepa_apparass_p_idouvrage_idx ON raepa.raepa_apparass_p USING btree (idouvrage);


-- raepa_canalaep_l_geom_idx
CREATE INDEX raepa_canalaep_l_geom_idx ON raepa.raepa_canalaep_l USING btree (geom);


-- raepa_canalaep_l_idcana_idx
CREATE INDEX raepa_canalaep_l_idcana_idx ON raepa.raepa_canalaep_l USING btree (idcana);


-- raepa_canalaep_l_idcanppale_idx
CREATE INDEX raepa_canalaep_l_idcanppale_idx ON raepa.raepa_canalaep_l USING btree (idcanppale);


-- raepa_canalaep_l_idnini_idx
CREATE INDEX raepa_canalaep_l_idnini_idx ON raepa.raepa_canalaep_l USING btree (idnini);


-- raepa_canalaep_l_idnterm_idx
CREATE INDEX raepa_canalaep_l_idnterm_idx ON raepa.raepa_canalaep_l USING btree (idnterm);


-- raepa_canalass_l_endpoint_geom_idx
CREATE INDEX raepa_canalass_l_endpoint_geom_idx ON raepa.raepa_canalass_l USING gist (public.st_endpoint(geom));


-- raepa_canalass_l_geom_idx
CREATE INDEX raepa_canalass_l_geom_idx ON raepa.raepa_canalass_l USING btree (geom);


-- raepa_canalass_l_idcana_idx
CREATE INDEX raepa_canalass_l_idcana_idx ON raepa.raepa_canalass_l USING btree (idcana);


-- raepa_canalass_l_idcanppale_idx
CREATE INDEX raepa_canalass_l_idcanppale_idx ON raepa.raepa_canalass_l USING btree (idcanppale);


-- raepa_canalass_l_idnini_idx
CREATE INDEX raepa_canalass_l_idnini_idx ON raepa.raepa_canalass_l USING btree (idnini);


-- raepa_canalass_l_idnterm_idx
CREATE INDEX raepa_canalass_l_idnterm_idx ON raepa.raepa_canalass_l USING btree (idnterm);


-- raepa_canalass_l_startpoint_geom_idx
CREATE INDEX raepa_canalass_l_startpoint_geom_idx ON raepa.raepa_canalass_l USING gist (public.st_startpoint(geom));


-- raepa_ouvraep_p_geom_idx
CREATE INDEX raepa_ouvraep_p_geom_idx ON raepa.raepa_ouvraep_p USING btree (geom);


-- raepa_ouvraep_p_idcanamont_idx
CREATE INDEX raepa_ouvraep_p_idcanamont_idx ON raepa.raepa_ouvraep_p USING btree (idcanamont);


-- raepa_ouvraep_p_idcanaval_idx
CREATE INDEX raepa_ouvraep_p_idcanaval_idx ON raepa.raepa_ouvraep_p USING btree (idcanaval);


-- raepa_ouvraep_p_idcanppale_idx
CREATE INDEX raepa_ouvraep_p_idcanppale_idx ON raepa.raepa_ouvraep_p USING btree (idcanppale);


-- raepa_ouvraep_p_idouvrage_idx
CREATE INDEX raepa_ouvraep_p_idouvrage_idx ON raepa.raepa_ouvraep_p USING btree (idouvrage);


-- raepa_ouvrass_p_geom_idx
CREATE INDEX raepa_ouvrass_p_geom_idx ON raepa.raepa_ouvrass_p USING btree (geom);


-- raepa_ouvrass_p_idcanamont_idx
CREATE INDEX raepa_ouvrass_p_idcanamont_idx ON raepa.raepa_ouvrass_p USING btree (idcanamont);


-- raepa_ouvrass_p_idcanaval_idx
CREATE INDEX raepa_ouvrass_p_idcanaval_idx ON raepa.raepa_ouvrass_p USING btree (idcanaval);


-- raepa_ouvrass_p_idcanppale_idx
CREATE INDEX raepa_ouvrass_p_idcanppale_idx ON raepa.raepa_ouvrass_p USING btree (idcanppale);


-- raepa_ouvrass_p_idouvrage_idx
CREATE INDEX raepa_ouvrass_p_idouvrage_idx ON raepa.raepa_ouvrass_p USING btree (idouvrage);


-- raepa_reparaep_p_geom_idx
CREATE INDEX raepa_reparaep_p_geom_idx ON raepa.raepa_reparaep_p USING btree (geom);


-- raepa_reparaep_p_idrepar_idx
CREATE INDEX raepa_reparaep_p_idrepar_idx ON raepa.raepa_reparaep_p USING btree (idrepar);


-- raepa_reparaep_p_idsuprepar_idx
CREATE INDEX raepa_reparaep_p_idsuprepar_idx ON raepa.raepa_reparaep_p USING btree (idsuprepar);


-- raepa_reparass_p_geom_idx
CREATE INDEX raepa_reparass_p_geom_idx ON raepa.raepa_reparass_p USING btree (geom);


-- raepa_reparass_p_idrepar_idx
CREATE INDEX raepa_reparass_p_idrepar_idx ON raepa.raepa_reparass_p USING btree (idrepar);


-- raepa_reparass_p_idsuprepar_idx
CREATE INDEX raepa_reparass_p_idsuprepar_idx ON raepa.raepa_reparass_p USING btree (idsuprepar);


-- raepa_reparass_p_mouvrage_idx
CREATE INDEX raepa_reparass_p_mouvrage_idx ON raepa.raepa_reparass_p USING btree (mouvrage);


--
-- PostgreSQL database dump complete
--

