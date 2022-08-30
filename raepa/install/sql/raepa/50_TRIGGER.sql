--
-- PostgreSQL database dump
--

-- Dumped from database version 10.15 (Debian 10.15-1.pgdg100+1)
-- Dumped by pg_dump version 10.15 (Debian 10.15-1.pgdg100+1)

SET statement_timeout = 0;
SET lock_timeout = 0;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

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


-- raepa_reparaep_p raepa_avant_modification_reparation
CREATE TRIGGER raepa_avant_modification_reparation BEFORE INSERT OR UPDATE ON raepa.raepa_reparaep_p FOR EACH ROW EXECUTE PROCEDURE raepa.trg_avant_modification_reparation();


-- raepa_reparass_p raepa_avant_modification_reparation
CREATE TRIGGER raepa_avant_modification_reparation BEFORE INSERT OR UPDATE ON raepa.raepa_reparass_p FOR EACH ROW EXECUTE PROCEDURE raepa.trg_avant_modification_reparation();


--
-- PostgreSQL database dump complete
--

