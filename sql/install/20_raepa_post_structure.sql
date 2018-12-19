BEGIN;


SET search_path TO raepa,public;

-- SÉQUENCES

CREATE SEQUENCE IF NOT EXISTS raepa_canalaep_l_id_seq;
CREATE SEQUENCE IF NOT EXISTS raepa_apparaep_p_id_seq;
CREATE SEQUENCE IF NOT EXISTS raepa_ouvraep_p_id_seq;
CREATE SEQUENCE IF NOT EXISTS raepa_reparaep_p_id_seq;
CREATE SEQUENCE IF NOT EXISTS raepa_canalass_l_id_seq;
CREATE SEQUENCE IF NOT EXISTS raepa_apparass_p_id_seq;
CREATE SEQUENCE IF NOT EXISTS raepa_ouvrass_p_id_seq;
CREATE SEQUENCE IF NOT EXISTS raepa_reparass_p_id_seq;
CREATE SEQUENCE IF NOT EXISTS affleurant_pcrs_id_seq;

CREATE OR REPLACE FUNCTION raepa.generate_oid(table_name text)
  RETURNS text AS
$BODY$
DECLARE
  myrec_prefix record;
  myrec_shortcut record;
  myrec_seq record;
BEGIN

  -- first we have to get the OID prefix
  BEGIN
    SELECT concat(code, siren) AS prefix INTO myrec_prefix FROM raepa.sys_organisme_gestionnaire WHERE actif = TRUE;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
           RAISE EXCEPTION 'no active record found in table raepa.sys_organisme_gestionnaire';
        WHEN TOO_MANY_ROWS THEN
       RAISE EXCEPTION 'more than one active records found in table raepa.sys_organisme_gestionnaire';
  END;
  -- test if prefix is of correct length
  IF char_length(myrec_prefix.prefix) != 12 THEN
    RAISE EXCEPTION 'character length of prefix must be 12';
  END IF;

  --get table 6 char shortcut
  BEGIN
    SELECT concat(code, typereseau) AS shortcut INTO STRICT myrec_shortcut FROM raepa.sys_liste_table WHERE nom = table_name;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE EXCEPTION 'dictionary entry for table % not found', table_name;
        WHEN TOO_MANY_ROWS THEN
            RAISE EXCEPTION 'dictonary entry for table % not unique', table_name;
  END;

  --get sequence for table
  SELECT lastval() AS seqval INTO myrec_seq;
  IF NOT FOUND THEN
    RAISE EXCEPTION 'sequence for table % not found', table_name;
  END IF;

  -- return concatenated value
  RETURN myrec_prefix.prefix || myrec_shortcut.shortcut || to_char(myrec_seq.seqval,'FM000000');
END;
$BODY$
  LANGUAGE plpgsql STABLE
  COST 100;



-- INDEXES

CREATE INDEX IF NOT EXISTS "raepa_canalass_l_startpoint_geom_idx" ON "raepa_canalass_l" USING GIST (st_startpoint("geom"));
CREATE INDEX IF NOT EXISTS "raepa_canalass_l_endpoint_geom_idx" ON "raepa_canalass_l" USING GIST (st_endpoint("geom"));


-- PARCOURS DU RESEAU
CREATE TABLE IF NOT EXISTS raepa.sys_parcours_reseau (
  id serial NOT NULL PRIMARY KEY,
  id_ouvrage TEXT NOT NULL
);

-- downstream
CREATE OR REPLACE FUNCTION raepa.downstream(text)
RETURNS geometry
LANGUAGE sql AS '
WITH RECURSIVE walk_network(id_canalisation, idnini, idnterm) AS (
    SELECT idcana::text,
    idnini, idnterm
    FROM raepa.raepa_canalass_l
    WHERE idnini = $1
  UNION
    SELECT n.idcana::text,
    n.idnini, n.idnterm
    FROM raepa.raepa_canalass_l n, walk_network w
    WHERE TRUE
    AND n.idnini = w.idnterm AND n.idnini != ''INCONNU''
  )
  SELECT ST_Union(r.geom) AS geom
  FROM walk_network wn
  INNER JOIN raepa.raepa_canalass_l r
  ON wn.id_canalisation = r.idcana
' IMMUTABLE;

-- upstream
CREATE OR REPLACE FUNCTION raepa.upstream(text)
RETURNS geometry
LANGUAGE sql AS '
WITH RECURSIVE walk_network(id_canalisation, idnini, idnterm) AS (
    SELECT idcana::text,
    idnini, idnterm
    FROM raepa.raepa_canalass_l
    WHERE idnterm = $1
  UNION
    SELECT n.idcana::text,
    n.idnini, n.idnterm
    FROM raepa.raepa_canalass_l n, walk_network w
    WHERE TRUE
    AND n.idnterm = w.idnini AND n.idnterm != ''INCONNU''
  )
  SELECT ST_Union(r.geom) AS geom
  FROM walk_network wn
  INNER JOIN raepa.raepa_canalass_l r
  ON wn.id_canalisation = r.idcana
' IMMUTABLE;



-- Découpe d'une canalisation par un ouvrage
CREATE OR REPLACE FUNCTION raepa.decoupage_canalisation_par_ouvrage(ouvrage_id text)
RETURNS boolean AS
$BODY$
DECLARE
    can record;
    ouv record;
    geom_init geometry;
    geom_term geometry;
    new_idcana text;
BEGIN

    -- Récupération de l'ouvrage
    SELECT INTO ouv
    o.*
    FROM raepa.raepa_ouvrass_p o
    WHERE idouvrage = ouvrage_id
    LIMIT 1
    ;
    IF ouv.idouvrage IS NULL THEN
        RETURN 0;
    END IF;

    -- Vérifier si une canalisation est proche de l'ouvrage
    SELECT INTO can
    c.*
    FROM raepa.raepa_canalass_l c
    WHERE TRUE
    AND ST_DWithin(c.geom, ouv.geom, 0.05)
    -- seulement si l'ouvrage est à plus d'un mètre
    AND NOT ST_DWithin(ST_StartPoint(c.geom), ouv.geom, 1)
    AND NOT ST_DWithin(ST_EndPoint(c.geom), ouv.geom, 1)
    LIMIT 1
    ;
    IF can.idcana IS NULL THEN
        RETURN 0;
    END IF;

    geom_init := ST_LineSubstring(can.geom, 0, ST_LineLocatePoint(can.geom, ouv.geom));
    geom_term := ST_LineSubstring(can.geom, ST_LineLocatePoint(can.geom, ouv.geom), 1);

    -- Modification de la canalisation :
    -- OA----------(O)----------OB devient  OA----------(O)
    UPDATE raepa.raepa_canalass_l c
    SET
        geom = ST_Snap(geom_init, ouv.geom, 0.05),
        zaval = NULL,
        idnterm = ouv.idouvrage
    WHERE idcana = can.idcana;
    -- Le reste est fait par les triggers lancés après modification de la cana

    -- Création d'une nouvelle canalisation pour la partie temrinale :
    -- (O)----------OB
    -- On récupère les valeurs issus de la cana d'origine
    INSERT INTO raepa.raepa_canalass_l
    (
        typreseau, materiau, diametre, _dimensionhorizontale, _forme, _etat, anfinpose, modecirc, contcanass, fonccanass,
        idnini,
        zamont, zaval,
        sensecoul, andebpose, _precisionannee, qualglocxy, qualglocz, qualannee, dategeoloc, sourgeoloc, sourattrib,
        geom
    )
    VALUES(
        can.typreseau, can.materiau, can.diametre, can._dimensionhorizontale, can._forme, can._etat, can.anfinpose, can.modecirc, can.contcanass, can.fonccanass,
        ouv.idouvrage,
        NULL, can.zaval,
        can.sensecoul, can.andebpose, can._precisionannee, can.qualglocxy, can.qualglocz, can.qualannee, can.dategeoloc, can.sourgeoloc, can.sourattrib,
        ST_Snap(geom_term, ouv.geom, 0.05)
    )
    RETURNING idcana
    INTO new_idcana;

    -- Modification des valeurs idcanaval et idcanamont de l'ouvrage
    UPDATE raepa.raepa_ouvrass_p o
    SET
    idcanamont = can.idcana,
    idcanaval = new_idcana
    WHERE idouvrage = ouv.idouvrage
    ;

    -- Return 1
    RETURN 1;

END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;


COMMIT;
