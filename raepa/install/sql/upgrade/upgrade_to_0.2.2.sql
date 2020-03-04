BEGIN;

CREATE OR REPLACE FUNCTION raepa.get_canalisation_id_by_object_id(p_id_object text)
RETURNS text[]
LANGUAGE plpgsql
AS
$$
DECLARE
  p_cana_id text;
  p_cana_table regclass;
  p_object_table regclass;
  p_object_id_column text;
  sql_text text;
  parcours public.geometry;
BEGIN

  -- Get target canalisation table
  IF p_id_object similar to '%(ouvass|appass|canass)%' THEN
    p_cana_table:= 'raepa.raepa_canalass_l';
  ELSE
    p_cana_table:= 'raepa.raepa_canalaep_l';
  END IF;

  -- Get first canalisation depending on object id given
  -- ouvrage
  p_cana_id = '';

  -- ouvrage / appareil
  IF p_id_object similar to '%(ouvass|ouvaep|appass|appaep)%' THEN

    -- Get source object table
    IF     p_id_object LIKE '%ouvass%' THEN
      p_object_table:= 'raepa.raepa_ouvrass_p';
      p_object_id_column:= 'idouvrage';
    ELSEIF p_id_object LIKE '%ouvaep%' THEN
      p_object_table:= 'raepa.raepa_ouvraep_p';
      p_object_id_column:= 'idouvrage';
    ELSEIF p_id_object LIKE '%appass%' THEN
      p_object_table:= 'raepa.raepa_apparass_p';
      p_object_id_column:= 'idappareil';
    ELSEIF p_id_object LIKE '%appaep%' THEN
      p_object_table:= 'raepa.raepa_apparaep_p';
      p_object_id_column:= 'idappareil';
    END IF;

    -- Get canalisation id
    EXECUTE format('
      SELECT idcana::text
      FROM %s AS c
      WHERE idnterm = ''%s''
      OR ST_Dwithin(
        c.geom,
        (SELECT geom FROM %s WHERE "%s" = ''%s''),
        0.05
      )
    ',
      p_cana_table,
      p_id_object,
      p_object_table, p_object_id_column, p_id_object
    )
    INTO p_cana_id;
  END IF;

  -- canalisation
  IF p_id_object similar to '%(canass|canaep)%' THEN
    p_cana_id:= p_id_object;
  END IF;

  RETURN ARRAY[p_cana_id, p_cana_table]::text[];

END;
$$;

-- downstream_by_geom(text, regclass)
DROP FUNCTION IF EXISTS raepa.downstream_by_geom(text, regclass);
CREATE OR REPLACE FUNCTION raepa.downstream_by_geom(p_id_object text)
RETURNS public.geometry
LANGUAGE plpgsql
AS $$
DECLARE
  p_cana_table regclass;
  get_cana text[];
  p_cana_id text;
  sql_text text;
  parcours public.geometry;
BEGIN

  -- Get canalisation id
  SELECT raepa.get_canalisation_id_by_object_id(p_id_object)
  INTO get_cana;
  p_cana_id = get_cana[1];
  p_cana_table = get_cana[2];
  IF p_cana_id = '' THEN
    RETURN NULL;
  END IF;
  -- RAISE NOTICE 'Canalisation d''origine = %s', p_cana_id;

  EXECUTE format('
    WITH RECURSIVE walk_network(idcana, idnini, idnterm, all_parents, geom) AS (
      SELECT idcana::text,
      idnini, idnterm,
      array[idcana::text] as all_parents,
      geom
      FROM %s
      WHERE idcana = ''%s''
    UNION ALL
      SELECT n.idcana::text,
      n.idnini, n.idnterm,
      w.all_parents || n.idcana::text,
      n.geom
      FROM %s AS n, walk_network AS w
      WHERE TRUE
      AND ST_Dwithin(st_startpoint(n.geom), st_endpoint(w.geom), 0.05)
      AND n.idcana <> ALL (w.all_parents)
    )
    SELECT ST_Union(DISTINCT r.geom) AS geom
    FROM walk_network wn
    INNER JOIN %s AS r
    ON wn.idcana = r.idcana
    ',
    p_cana_table, p_cana_id,
    p_cana_table,
    p_cana_table
  ) INTO parcours;

  RETURN parcours;
END;
$$;


-- downstream_by_idn(text, regclass)
DROP FUNCTION IF EXISTS raepa.downstream_by_idn(text, regclass);
CREATE OR REPLACE FUNCTION raepa.downstream_by_idn(p_id_object text)
RETURNS public.geometry
LANGUAGE plpgsql
AS $$
DECLARE
  p_cana_table regclass;
  get_cana text[];
  p_cana_id text;
  sql_text text;
  parcours public.geometry;
BEGIN

  -- Get canalisation id
  SELECT raepa.get_canalisation_id_by_object_id(p_id_object)
  INTO get_cana;
  p_cana_id = get_cana[1];
  p_cana_table = get_cana[2];
  IF p_cana_id = '' THEN
    RETURN NULL;
  END IF;
  -- RAISE NOTICE 'Canalisation d''origine = %s', p_cana_id;

  EXECUTE format('
    WITH RECURSIVE walk_network(idcana, idnini, idnterm, all_parents) AS (
      SELECT idcana::text,
      idnini, idnterm,
      array[idcana::text] as all_parents
      FROM %s
      WHERE idcana = ''%s''
    UNION
      SELECT n.idcana::text,
      n.idnini, n.idnterm,
      w.all_parents || n.idcana::text
      FROM %s AS n, walk_network AS w
      WHERE TRUE
      AND n.idnini = w.idnterm AND n.idnini != ''INCONNU''
      AND n.idcana <> ALL (w.all_parents)
    )
    SELECT ST_Union(DISTINCT r.geom) AS geom
    FROM walk_network wn
    INNER JOIN %s AS r
    ON wn.idcana = r.idcana
    ',
    p_cana_table, p_cana_id,
    p_cana_table,
    p_cana_table
  ) INTO parcours;

  RETURN parcours;
END;
$$;


-- upstream_by_geom(text, regclass)
DROP FUNCTION IF EXISTS raepa.upstream_by_geom(text, regclass);
CREATE OR REPLACE FUNCTION raepa.upstream_by_geom(p_id_object text)
RETURNS public.geometry
LANGUAGE plpgsql
AS $$
DECLARE
  p_cana_table regclass;
  get_cana text[];
  p_cana_id text;
  sql_text text;
  parcours public.geometry;
BEGIN

  -- Get canalisation id
  SELECT raepa.get_canalisation_id_by_object_id(p_id_object)
  INTO get_cana;
  p_cana_id = get_cana[1];
  p_cana_table = get_cana[2];
  IF p_cana_id = '' THEN
    RETURN NULL;
  END IF;
  -- RAISE NOTICE 'Canalisation d''origine = %s', p_cana_id;

  -- Build geometry
  EXECUTE format('
    WITH RECURSIVE walk_network(idcana, idnini, idnterm, all_parents, geom) AS (
      SELECT idcana::text,
      idnini, idnterm,
      array[idcana::text] as all_parents,
      geom
      FROM %s
      WHERE idcana = ''%s''
    UNION ALL
      SELECT n.idcana::text,
      n.idnini, n.idnterm,
      w.all_parents || n.idcana::text,
      n.geom
      FROM %s AS n, walk_network AS w
      WHERE TRUE
      AND ST_Dwithin(st_startpoint(w.geom), st_endpoint(n.geom), 0.05)
      AND n.idcana <> ALL (w.all_parents)
    )
    SELECT ST_Union(DISTINCT r.geom) AS geom
    FROM walk_network wn
    INNER JOIN %s r
    ON wn.idcana = r.idcana
    ',
    p_cana_table, p_cana_id,
    p_cana_table,
    p_cana_table
  ) INTO parcours;

  RETURN parcours;
END;
$$;


-- upstream_by_idn(text, regclass)
DROP FUNCTION IF EXISTS raepa.upstream_by_idn(text, regclass);
CREATE OR REPLACE FUNCTION raepa.upstream_by_idn(p_id_object text)
RETURNS public.geometry
LANGUAGE plpgsql
AS $$

DECLARE
  p_cana_table regclass;
  get_cana text[];
  p_cana_id text;
  sql_text text;
  parcours public.geometry;
BEGIN

  -- Get canalisation id
  SELECT raepa.get_canalisation_id_by_object_id(p_id_object)
  INTO get_cana;
  p_cana_id = get_cana[1];
  p_cana_table = get_cana[2];
  IF p_cana_id = '' THEN
    RETURN NULL;
  END IF;
  -- RAISE NOTICE 'Canalisation d''origine = %s', p_cana_id;

  -- Build geometry
  EXECUTE format('
    WITH RECURSIVE walk_network(idcana, idnini, idnterm, all_parents) AS (
      SELECT idcana::text,
      idnini, idnterm,
      array[idcana::text] as all_parents
      FROM %s
      WHERE idcana = ''%s''
    UNION
      SELECT n.idcana::text,
      n.idnini, n.idnterm,
      w.all_parents || n.idcana::text
      FROM %s AS n, walk_network AS w
      WHERE TRUE
      AND n.idnterm = w.idnini AND n.idnterm != ''INCONNU''
      AND n.idcana <> ALL (w.all_parents)
    )
    SELECT ST_Union(DISTINCT r.geom) AS geom
    FROM walk_network wn
    INNER JOIN %s AS r
    ON wn.idcana = r.idcana
    ',
    p_cana_table, p_cana_id,
    p_cana_table,
    p_cana_table
  ) INTO parcours;

  RETURN parcours;
END;
$$;

-- Recréation des index avec GIST
DROP INDEX IF EXISTS raepa.raepa_apparaep_p_geom_idx;
DROP INDEX IF EXISTS raepa.raepa_apparass_p_geom_idx;
DROP INDEX IF EXISTS raepa.raepa_canalaep_l_geom_idx;
DROP INDEX IF EXISTS raepa.raepa_canalass_l_geom_idx;
DROP INDEX IF EXISTS raepa.raepa_ouvraep_p_geom_idx ;
DROP INDEX IF EXISTS raepa.raepa_ouvrass_p_geom_idx ;
DROP INDEX IF EXISTS raepa.raepa_reparaep_p_geom_idx;
DROP INDEX IF EXISTS raepa.raepa_reparass_p_geom_idx;
DROP INDEX IF EXISTS raepa.raepa_canalaep_l_startpoint_geom_idx;
DROP INDEX IF EXISTS raepa.raepa_canalaep_l_endpoint_geom_idx;

CREATE INDEX ON raepa.raepa_apparaep_p USING GIST (geom);
CREATE INDEX ON raepa.raepa_apparass_p USING GIST (geom);
CREATE INDEX ON raepa.raepa_canalaep_l USING GIST (geom);
CREATE INDEX ON raepa.raepa_canalass_l USING GIST (geom);
CREATE INDEX ON raepa.raepa_ouvraep_p  USING GIST (geom);
CREATE INDEX ON raepa.raepa_ouvrass_p  USING GIST (geom);
CREATE INDEX ON raepa.raepa_reparaep_p USING GIST (geom);
CREATE INDEX ON raepa.raepa_reparass_p USING GIST (geom);
CREATE INDEX ON raepa.raepa_canalaep_l USING GIST (st_startpoint(geom));
CREATE INDEX ON raepa.raepa_canalaep_l USING GIST (st_endpoint(geom));

COMMIT;


