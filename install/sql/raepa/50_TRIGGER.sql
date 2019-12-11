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

-- raepa_ouvraep_p raepa_apres_modification_ouvrage
CREATE TRIGGER raepa_apres_modification_ouvrage AFTER INSERT OR UPDATE ON raepa.raepa_ouvraep_p FOR EACH ROW EXECUTE PROCEDURE raepa.trg_apres_modification_ouvrage();


-- raepa_ouvrass_p raepa_apres_modification_ouvrage
CREATE TRIGGER raepa_apres_modification_ouvrage AFTER INSERT OR UPDATE ON raepa.raepa_ouvrass_p FOR EACH ROW EXECUTE PROCEDURE raepa.trg_apres_modification_ouvrage();


-- raepa_canalaep_l raepa_avant_ajout_ou_modification_canalisation
CREATE TRIGGER raepa_avant_ajout_ou_modification_canalisation BEFORE INSERT OR UPDATE ON raepa.raepa_canalaep_l FOR EACH ROW EXECUTE PROCEDURE raepa.trg_avant_ajout_ou_modification_canalisation();


-- raepa_canalass_l raepa_avant_ajout_ou_modification_canalisation
CREATE TRIGGER raepa_avant_ajout_ou_modification_canalisation BEFORE INSERT OR UPDATE ON raepa.raepa_canalass_l FOR EACH ROW EXECUTE PROCEDURE raepa.trg_avant_ajout_ou_modification_canalisation();


-- raepa_apparaep_p raepa_avant_modification_appareil
CREATE TRIGGER raepa_avant_modification_appareil BEFORE INSERT OR UPDATE ON raepa.raepa_apparaep_p FOR EACH ROW EXECUTE PROCEDURE raepa.trg_avant_modification_appareil();


-- raepa_apparass_p raepa_avant_modification_appareil
CREATE TRIGGER raepa_avant_modification_appareil BEFORE INSERT OR UPDATE ON raepa.raepa_apparass_p FOR EACH ROW EXECUTE PROCEDURE raepa.trg_avant_modification_appareil();


-- raepa_ouvraep_p raepa_avant_modification_ouvrage
CREATE TRIGGER raepa_avant_modification_ouvrage BEFORE INSERT OR UPDATE ON raepa.raepa_ouvraep_p FOR EACH ROW EXECUTE PROCEDURE raepa.trg_avant_modification_ouvrage();


-- raepa_ouvrass_p raepa_avant_modification_ouvrage
CREATE TRIGGER raepa_avant_modification_ouvrage BEFORE INSERT OR UPDATE ON raepa.raepa_ouvrass_p FOR EACH ROW EXECUTE PROCEDURE raepa.trg_avant_modification_ouvrage();


--
-- PostgreSQL database dump complete
--

