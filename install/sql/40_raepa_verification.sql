BEGIN;

SET search_path TO raepa,public;

-- canalisations sans zamont ou zaval
DROP VIEW IF EXISTS v_canalisation_avec_zamont_manquant;
CREATE VIEW v_canalisation_avec_z_manquant AS
SELECT *
FROM raepa_canalass_l
WHERE
Coalesce(zamont, 0) = 0
;
DROP VIEW IF EXISTS v_canalisation_avec_zaval_manquant;
CREATE VIEW v_canalisation_avec_zaval_manquant AS
SELECT *
FROM raepa_canalass_l
WHERE
Coalesce(zaval, 0) = 0
;


-- canalisations de branchement
DROP VIEW IF EXISTS v_canalisation_branchement;
CREATE VIEW v_canalisation_branchement AS
SELECT r.*
FROM raepa_canalass_l r
INNER JOIN raepa_ouvrass_p o
ON o.fnouvass = '_2'
AND r.idnini = o.idouvrage
;


-- canalisation sans ouvrages amont ou aval
DROP VIEW IF EXISTS v_canalisation_sans_ouvrage;
CREATE VIEW v_canalisation_sans_ouvrage AS
SELECT r.*
FROM raepa_canalass_l r
WHERE idnini IS NULL OR idnterm IS NULL
;

-- End et Start points
CREATE TABLE IF NOT EXISTS raepa.startpoint AS SELECT idcana, st_startpoint(geom) geom FROM raepa.raepa_canalass_l;
CREATE INDEX ON raepa.startpoint USING GIST (geom);
CREATE TABLE IF NOT EXISTS raepa.endpoint AS SELECT idcana, st_endpoint(geom) geom FROM raepa.raepa_canalass_l;
CREATE INDEX ON raepa.endpoint USING GIST (geom);

-- impasses basses = points ou les canalisations sont dessinées  --->--O--<----
DROP VIEW IF EXISTS raepa.v_impasses_basses;
CREATE VIEW raepa.v_impasses_basses AS
SELECT DISTINCT e1.idcana, e1.geom::geometry(point,2154) AS geom
FROM raepa.endpoint e1
INNER JOIN raepa.endpoint e2 ON ST_Intersects(e1.geom, e2.geom) AND e1.idcana != e2.idcana
LEFT JOIN raepa.startpoint s ON ST_Intersects(e1.geom, s.geom)
WHERE s.idcana IS NULL
;

-- ipassages basses
DROP VIEW IF EXISTS raepa.v_impasses_hautes;
CREATE VIEW raepa.v_impasses_hautes AS
SELECT DISTINCT s1.idcana, s1.geom::geometry(point,2154) AS geom
FROM raepa.endpoint s1
INNER JOIN raepa.endpoint s2 ON ST_Intersects(s1.geom, s2.geom) AND s1.idcana != s2.idcana
LEFT JOIN raepa.startpoint e ON ST_Intersects(s1.geom, e.geom)
WHERE e.idcana IS NULL
;
COMMIT;
