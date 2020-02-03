BEGIN;

-- calcul_orientation(text, double)
CREATE OR REPLACE FUNCTION raepa.calcul_orientation (cana text, pos double precision)
RETURNS double precision
    LANGUAGE 'plpgsql'
AS $BODY$
DECLARE
    cgeom geometry;
    res double precision;
BEGIN
    SELECT geom into cgeom from raepa.raepa_canalaep_l where idcana = cana;
    SELECT
    CASE
        WHEN pos > 0.1 AND pos < 0.9
            THEN round(CAST(degrees(ST_Azimuth(ST_StartPoint(ST_LineSubstring(cgeom, pos - 0.1, pos + 0.1)),
        ST_EndPoint(ST_LineSubstring(cgeom, pos - 0.1, pos + 0.1)))) as numeric),1)
        WHEN pos <= 0.1
            THEN round(CAST(degrees(ST_Azimuth(ST_StartPoint(ST_LineSubstring(cgeom, pos, pos + 0.1)),
        ST_EndPoint(ST_LineSubstring(cgeom, pos, pos + 0.1)))) as numeric), 2)
        WHEN pos >= 0.9
            THEN round(CAST(degrees(ST_Azimuth(ST_StartPoint(ST_LineSubstring(cgeom, pos, pos)),
        ST_EndPoint(ST_LineSubstring(cgeom, pos, pos)))) as numeric), 2)
    END into res
    FROM raepa.raepa_apparaep_p p
    JOIN raepa.raepa_canalaep_l c ON ST_DWithin(c.geom, p.geom, 0.05);

    return res;
END; $BODY$;

-- calculate_apparaep_orientation(text)
CREATE OR REPLACE FUNCTION raepa.calculate_apparaep_orientation(idappaep text)
  RETURNS double precision
    LANGUAGE 'plpgsql'
AS $BODY$
DECLARE
  res double precision;
BEGIN

    SELECT r.res into res FROM (
        SELECT raepa.calcul_orientation(c.idcana, ST_LineLocatePoint(c.geom, p.geom)) as res, ST_LineLocatePoint(c.geom, p.geom) as pos
        FROM raepa.raepa_apparaep_p p
            JOIN raepa.raepa_canalaep_l c ON ST_DWithin(c.geom, p.geom, 0.05)
        WHERE p.idappareil = idappaep
        ORDER BY pos
        LIMIT 1) r;

    UPDATE raepa.raepa_apparaep_p ap SET _orientation = res WHERE ap.idappareil = idappaep;

    RETURN res;
END; $BODY$;

-- get_canalisation_ids_by_object_id(text, text)
CREATE OR REPLACE FUNCTION raepa.get_canalisation_ids_by_object_id(
    IN p_id_object text,
    IN p_direction text)
  RETURNS TABLE(idcana text, tablecana text)
    LANGUAGE 'plpgsql'
AS $BODY$
DECLARE
  p_cana_id text;
  p_cana_table regclass;
  p_object_table regclass;
  p_object_id_column text;
  p_node_col text;
  p_function text;
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

    -- Some parameters depend on given direction
    IF p_direction = 'up' THEN
      p_node_col = 'idnterm';
      p_function = 'st_endpoint';
    ELSE
      p_node_col = 'idnini';
      p_function = 'st_startpoint';
    END IF;


    -- Get canalisation id
    RETURN QUERY EXECUTE format('
      SELECT idcana::text, ''%s'' AS tablecana
      FROM %s AS c
      WHERE %s = ''%s''
      OR ST_Dwithin(
        %s(c.geom),
        (SELECT geom FROM %s WHERE "%s" = ''%s''),
        0.05
      )
    ',
      p_cana_table, p_cana_table,
      p_node_col, p_id_object,
      p_function,
      p_object_table, p_object_id_column, p_id_object
    );
  END IF;

  -- canalisation
  IF p_id_object similar to '%(canass|canaep)%' THEN
    p_cana_id:= p_id_object;
    RETURN QUERY EXECUTE format('SELECT ''%s''AS idcana, ''%s'' AS tablecana', p_cana_id, p_cana_table);
  END IF;

END; $BODY$;

-- downstream_by_geom(text)
CREATE OR REPLACE FUNCTION raepa.downstream_by_geom(p_id_object text) RETURNS public.geometry
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
  SELECT raepa.get_canalisation_id_by_object_id(p_id_object, 'down')
  INTO get_cana;
  p_cana_id = get_cana[1];
  p_cana_table = get_cana[2];
  IF p_cana_id = '' THEN
    RETURN NULL;
  END IF;
  -- RAISE NOTICE 'Canalisation d''origine = %s', p_cana_id;

  EXECUTE format('
    WITH RECURSIVE walk_network(idcana, idnini, idnterm, all_parents, geom) AS (
      SELECT c.idcana::text,
      c.idnini, c.idnterm,
      array[c.idcana::text] as all_parents,
      c.geom
      FROM %s AS c
      JOIN raepa.get_canalisations_by_object_id(''%s'', ''down'') AS s
          ON c.idcana = s.idcana
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
    p_cana_table, p_id_object,
    p_cana_table,
    p_cana_table
  ) INTO parcours;

  RETURN parcours;
END;
$$;

-- downstream_by_idn(text)
CREATE OR REPLACE FUNCTION raepa.downstream_by_idn(p_id_object text) RETURNS public.geometry
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
  SELECT raepa.get_canalisation_id_by_object_id(p_id_object, 'down')
  INTO get_cana;
  p_cana_id = get_cana[1];
  p_cana_table = get_cana[2];
  IF p_cana_id = '' THEN
    RETURN NULL;
  END IF;
  -- RAISE NOTICE 'Canalisation d''origine = %s', p_cana_id;

  EXECUTE format('
    WITH RECURSIVE walk_network(idcana, idnini, idnterm, all_parents) AS (
      SELECT c.idcana::text,
      c.idnini, c.idnterm,
      array[c.idcana::text] as all_parents
      FROM %s AS c
      JOIN raepa.get_canalisations_by_object_id(''%s'', ''down'') AS s
          ON c.idcana = s.idcana
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
    p_cana_table, p_id_object,
    p_cana_table,
    p_cana_table
  ) INTO parcours;

  RETURN parcours;
END;
$$;

-- upstream_by_geom(text)
CREATE OR REPLACE FUNCTION raepa.upstream_by_geom(p_id_object text) RETURNS public.geometry
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
  SELECT raepa.get_canalisation_id_by_object_id(p_id_object, 'up')
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
      SELECT c.idcana::text,
      c.idnini, c.idnterm,
      array[c.idcana::text] as all_parents,
      c.geom
      FROM %s AS c
      JOIN raepa.get_canalisations_by_object_id(''%s'', ''up'') AS s
          ON c.idcana = s.idcana
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
    p_cana_table, p_id_object,
    p_cana_table,
    p_cana_table
  ) INTO parcours;

  RETURN parcours;
END;
$$;

-- upstream_by_idn(text)
CREATE OR REPLACE FUNCTION raepa.upstream_by_idn(p_id_object text) RETURNS public.geometry
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
  SELECT raepa.get_canalisation_id_by_object_id(p_id_object, 'up')
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
      SELECT c.idcana::text,
      c.idnini, c.idnterm,
      array[c.idcana::text] as all_parents
      FROM %s AS c
      JOIN raepa.get_canalisations_by_object_id(''%s'', ''up'') AS s
          ON c.idcana = s.idcana
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
    p_cana_table, p_id_object,
    p_cana_table,
    p_cana_table
  ) INTO parcours;

  RETURN parcours;
END;
$$;


COMMIT;