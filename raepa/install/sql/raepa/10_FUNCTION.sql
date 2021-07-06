--
-- PostgreSQL database dump
--

-- Dumped from database version 10.15 (Debian 10.15-1.pgdg100+1)
-- Dumped by pg_dump version 10.15 (Debian 10.15-1.pgdg100+1)

SET statement_timeout = 0;
SET lock_timeout = 0;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

-- calcul_orientation(text, double precision)
CREATE FUNCTION raepa.calcul_orientation(cana text, pos double precision) RETURNS double precision
    LANGUAGE plpgsql
    AS $$
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
            THEN round(CAST(degrees(ST_Azimuth(ST_StartPoint(ST_LineSubstring(cgeom, pos - 0.1, pos)),
        ST_EndPoint(ST_LineSubstring(cgeom, pos - 0.1, pos)))) as numeric), 2)
    END into res
    FROM raepa.raepa_apparaep_p p
    JOIN raepa.raepa_canalaep_l c ON ST_DWithin(c.geom, p.geom, 0.05);

    return res;
END; $$;


-- calculate_apparaep_orientation(text)
CREATE FUNCTION raepa.calculate_apparaep_orientation(idappaep text) RETURNS double precision
    LANGUAGE plpgsql
    AS $$
DECLARE
  res double precision;
BEGIN

    SELECT r.res into res FROM (
        SELECT raepa.calcul_orientation(c.idcana, ST_LineLocatePoint(c.geom, p.geom)) as res, ST_Distance(c.geom, p.geom) as dist, ST_LineLocatePoint(c.geom, p.geom) as pos
        FROM raepa.raepa_apparaep_p p
            JOIN raepa.raepa_canalaep_l c ON ST_DWithin(c.geom, p.geom, 0.05)
        WHERE p.idappareil = idappaep
        ORDER BY dist, pos
        LIMIT 1) r;

    UPDATE raepa.raepa_apparaep_p ap SET _orientation = res WHERE ap.idappareil = idappaep;

    RETURN res;
END; $$;


-- decoupage_canalisation_par_ouvrage(text)
CREATE FUNCTION raepa.decoupage_canalisation_par_ouvrage(ouvrage_id text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
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
$$;


-- downstream_by_geom(text)
CREATE FUNCTION raepa.downstream_by_geom(p_id_object text) RETURNS public.geometry
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
      JOIN raepa.get_canalisation_ids_by_object_id(''%s'', ''down'') AS s
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
CREATE FUNCTION raepa.downstream_by_idn(p_id_object text) RETURNS public.geometry
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
      JOIN raepa.get_canalisation_ids_by_object_id(''%s'', ''down'') AS s
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


-- generate_oid(text)
CREATE FUNCTION raepa.generate_oid(table_name text) RETURNS text
    LANGUAGE plpgsql STABLE
    AS $$
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
$$;


-- get_canalisation_id_by_object_id(text, text)
CREATE FUNCTION raepa.get_canalisation_id_by_object_id(p_id_object text, p_direction text) RETURNS text[]
    LANGUAGE plpgsql
    AS $$
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
    EXECUTE format('
      SELECT idcana::text
      FROM %s AS c
      WHERE %s = ''%s''
      OR ST_Dwithin(
        %s(c.geom),
        (SELECT geom FROM %s WHERE "%s" = ''%s''),
        0.05
      )
    ',
      p_cana_table,
      p_node_col, p_id_object,
      p_function,
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


-- get_canalisation_ids_by_object_id(text, text)
CREATE FUNCTION raepa.get_canalisation_ids_by_object_id(p_id_object text, p_direction text) RETURNS TABLE(idcana text, tablecana text)
    LANGUAGE plpgsql
    AS $$
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

END; $$;


-- get_network_to_vanne_ferme_from_point(text, double precision)
CREATE FUNCTION raepa.get_network_to_vanne_ferme_from_point(cana_id text, locate_point double precision) RETURNS public.geometry
    LANGUAGE plpgsql
    AS $$
DECLARE
    locate_before_point double precision = 0;
    locate_after_point double precision = 1;
    parcours public.geometry;
BEGIN
    SELECT raepa.get_vanne_before_point(cana_id, locate_point, false) into locate_before_point;
    SELECT raepa.get_vanne_after_point(cana_id, locate_point, false) into locate_after_point;

    IF locate_before_point IS NOT NULL AND locate_after_point IS NOT NULL THEN
        SELECT ST_LineSubstring(c.geom, locate_before_point, locate_after_point) into parcours AS geom FROM raepa.raepa_canalaep_l AS c WHERE c.idcana = cana_id;
        RETURN parcours;
    END IF;

    WITH RECURSIVE walk_network(idcana, all_parents, geom, stop, step) AS (
    SELECT idcana::text,
          array[idcana::text] as all_parents,
          ST_LineSubstring(geom,
        CASE WHEN raepa.get_vanne_before_point(cana_id, locate_point, false) IS NULL THEN 0 ELSE raepa.get_vanne_before_point(cana_id, locate_point, false) END,
        CASE WHEN raepa.get_vanne_after_point(cana_id, locate_point, false) IS NULL THEN 1 ELSE raepa.get_vanne_after_point(cana_id, locate_point, false) END) as geom,
          False as stop,
          0 as step
     FROM raepa.raepa_canalaep_l
     WHERE idcana = cana_id
      UNION ALL
        SELECT n.idcana::text AS idcana,
         w.all_parents || n.idcana::text AS all_parents,
         CASE
        WHEN  a.idappareil IS NOT NULL AND ST_Dwithin(st_startpoint(n.geom), st_endpoint(w.geom), 0.05) THEN ST_LineSubstring( n.geom, 0, raepa.get_vanne_after_point(n.idcana, 0, false) )::geometry(LineString,2154)
        WHEN  a.idappareil IS NOT NULL AND ST_Dwithin(st_startpoint(n.geom), st_startpoint(w.geom), 0.05) THEN ST_LineSubstring( n.geom, 0, raepa.get_vanne_after_point(n.idcana, 0, false) )::geometry(LineString,2154)
        WHEN  a.idappareil IS NOT NULL AND ST_Dwithin(st_endpoint(n.geom), st_startpoint(w.geom), 0.05) THEN ST_LineSubstring( n.geom, raepa.get_vanne_before_point(n.idcana, 1, false), 1 )::geometry(LineString,2154)
        WHEN  a.idappareil IS NOT NULL AND ST_Dwithin(st_endpoint(n.geom), st_endpoint(w.geom), 0.05) THEN ST_LineSubstring( n.geom, raepa.get_vanne_before_point(n.idcana, 1, false), 1 )::geometry(LineString,2154)
        ELSE n.geom::geometry(LineString,2154) END AS geom,
        a.idappareil IS NOT NULL OR o.idouvrage IS NOT NULL as stop,
        w.step + 1 as step
          FROM raepa.raepa_canalaep_l AS n
          LEFT OUTER JOIN raepa.raepa_apparaep_p a ON ( fnappaep = '03' AND _ferme AND ST_Dwithin(n.geom, a.geom, 0.05) )
          LEFT OUTER JOIN raepa.raepa_ouvraep_p o ON (
                (fnouvaep = '03' OR fnouvaep = '05' OR fnouvaep = '01')
                AND
                ST_Dwithin(n.geom, o.geom, 0.05)
            ),
             walk_network AS w
          WHERE TRUE AND (
               ST_Dwithin(st_startpoint(n.geom), st_endpoint(w.geom), 0.05) OR
               ST_Dwithin(st_startpoint(n.geom), st_startpoint(w.geom), 0.05) OR
               ST_Dwithin(st_endpoint(n.geom), st_startpoint(w.geom), 0.05) OR
               ST_Dwithin(st_endpoint(n.geom), st_endpoint(w.geom), 0.05))
          AND w.idcana <> n.idcana AND n.idcana <> ALL (w.all_parents)
          AND NOT w.stop
          AND w.step < 15
    )
    SELECT ST_Union(DISTINCT geom) into parcours AS geom FROM walk_network;
    RETURN parcours;
END;
$$;


-- get_network_to_vanne_from_point(text, double precision)
CREATE FUNCTION raepa.get_network_to_vanne_from_point(cana_id text, locate_point double precision) RETURNS public.geometry
    LANGUAGE plpgsql
    AS $$
DECLARE
    locate_before_point double precision = 0;
    locate_after_point double precision = 1;
    parcours public.geometry;
BEGIN
    SELECT raepa.get_vanne_before_point(cana_id, locate_point, true) into locate_before_point;
    SELECT raepa.get_vanne_after_point(cana_id, locate_point, true) into locate_after_point;

    IF locate_before_point IS NOT NULL AND locate_after_point IS NOT NULL THEN
        SELECT ST_LineSubstring(c.geom, locate_before_point, locate_after_point) into parcours AS geom FROM raepa.raepa_canalaep_l AS c WHERE c.idcana = cana_id;
        RETURN parcours;
    END IF;

    WITH RECURSIVE walk_network(idcana, all_parents, geom, stop) AS (
    SELECT idcana::text,
          array[idcana::text] as all_parents,
          ST_LineSubstring(geom,
        CASE WHEN raepa.get_vanne_before_point(cana_id, locate_point, true) IS NULL THEN 0 ELSE raepa.get_vanne_before_point(cana_id, locate_point, true) END,
        CASE WHEN raepa.get_vanne_after_point(cana_id, locate_point, true) IS NULL THEN 1 ELSE raepa.get_vanne_after_point(cana_id, locate_point, true) END) as geom,
          False as stop
     FROM raepa.raepa_canalaep_l
     WHERE idcana = cana_id
      UNION ALL
        SELECT n.idcana::text AS idcana,
         w.all_parents || n.idcana::text AS all_parents,
         CASE
        WHEN  a.idappareil IS NOT NULL AND ST_Dwithin(st_startpoint(n.geom), st_endpoint(w.geom), 0.05) THEN ST_LineSubstring( n.geom, 0, raepa.get_vanne_after_point(n.idcana, 0, true) )::geometry(LineString,2154)
        WHEN  a.idappareil IS NOT NULL AND ST_Dwithin(st_startpoint(n.geom), st_startpoint(w.geom), 0.05) THEN ST_LineSubstring( n.geom, 0, raepa.get_vanne_after_point(n.idcana, 0, true) )::geometry(LineString,2154)
        WHEN  a.idappareil IS NOT NULL AND ST_Dwithin(st_endpoint(n.geom), st_startpoint(w.geom), 0.05) THEN ST_LineSubstring( n.geom, raepa.get_vanne_before_point(n.idcana, 1, true), 1 )::geometry(LineString,2154)
        WHEN  a.idappareil IS NOT NULL AND ST_Dwithin(st_endpoint(n.geom), st_endpoint(w.geom), 0.05) THEN ST_LineSubstring( n.geom, raepa.get_vanne_before_point(n.idcana, 1, true), 1 )::geometry(LineString,2154)
        ELSE n.geom::geometry(LineString,2154) END AS geom,
        a.idappareil IS NOT NULL as stop
          FROM raepa.raepa_canalaep_l AS n
          LEFT OUTER JOIN raepa.raepa_apparaep_p a ON ( fnappaep = '03' AND ST_Dwithin(n.geom, a.geom, 0.05) ),
             walk_network AS w
          WHERE TRUE AND (
               ST_Dwithin(st_startpoint(n.geom), st_endpoint(w.geom), 0.05) OR
               ST_Dwithin(st_startpoint(n.geom), st_startpoint(w.geom), 0.05) OR
               ST_Dwithin(st_endpoint(n.geom), st_startpoint(w.geom), 0.05) OR
               ST_Dwithin(st_endpoint(n.geom), st_endpoint(w.geom), 0.05))
          AND w.idcana <> n.idcana AND n.idcana <> ALL (w.all_parents)
          AND NOT w.stop
    )
    SELECT ST_Union(DISTINCT geom) into parcours AS geom FROM walk_network;
    RETURN parcours;
END;
$$;


-- get_vanne_after_point(text, double precision, boolean)
CREATE FUNCTION raepa.get_vanne_after_point(cana_id text, locate_point double precision, all_v boolean) RETURNS double precision
    LANGUAGE plpgsql
    AS $$
DECLARE
    locate double precision = 1;
BEGIN
    WITH apploc as (
        SELECT DISTINCT ON(c.idcana) c.idcana,  ST_LineLocatePoint(c.geom, a.geom)- locate_point As dist_to_point, ST_LineLocatePoint(c.geom, a.geom) as loc
        FROM raepa.raepa_apparaep_p a INNER JOIN raepa.raepa_canalaep_l c
        ON ST_DWithin(c.geom, a.geom, 0.05)
        WHERE idcana = cana_id AND fnappaep = '03' AND (all_v or _ferme) AND ST_LineLocatePoint(c.geom, a.geom) - locate_point >= 0
        ORDER BY c.idcana, dist_to_point
    )
    SELECT loc into locate FROM apploc;

    return locate;
END;
$$;


-- get_vanne_before_point(text, double precision, boolean)
CREATE FUNCTION raepa.get_vanne_before_point(cana_id text, locate_point double precision, all_v boolean) RETURNS double precision
    LANGUAGE plpgsql
    AS $$
DECLARE
    locate double precision = 1;
BEGIN
    WITH apploc as (
        SELECT DISTINCT ON(c.idcana) c.idcana,  locate_point - ST_LineLocatePoint(c.geom, a.geom) As dist_to_point, ST_LineLocatePoint(c.geom, a.geom) as loc
        FROM raepa.raepa_apparaep_p a INNER JOIN raepa.raepa_canalaep_l c
        ON ST_DWithin(c.geom, a.geom, 0.05)
        WHERE idcana = cana_id AND fnappaep = '03' AND (all_v or _ferme) AND locate_point - ST_LineLocatePoint(c.geom, a.geom) >= 0
        ORDER BY c.idcana, dist_to_point
    )
    SELECT loc into locate FROM apploc;

    return locate;
END;
$$;


-- get_vanne_cana(text, boolean)
CREATE FUNCTION raepa.get_vanne_cana(myid text, starter boolean) RETURNS double precision
    LANGUAGE plpgsql
    AS $$DECLARE
    locate double precision = 0;
BEGIN
    IF starter THEN
        WITH apploc as (
            SELECT DISTINCT ON(c.idcana) c.idcana, ST_LineLocatePoint(c.geom, a.geom) As dist_to_start, ST_LineLocatePoint(c.geom, a.geom) as loc
            FROM raepa.raepa_apparaep_p a INNER JOIN raepa.raepa_canalaep_l c
            ON ST_DWithin(c.geom, a.geom, 0.05)
            WHERE idcana = myid AND fnappaep = '03'
            ORDER BY c.idcana, dist_to_start
        )
        SELECT loc into locate FROM apploc;

    ELSE
        WITH apploc as (
            SELECT DISTINCT ON(c.idcana) c.idcana, 1 - ST_LineLocatePoint(c.geom, a.geom) As dist_to_start, ST_LineLocatePoint(c.geom, a.geom) as loc
            FROM raepa.raepa_apparaep_p a INNER JOIN raepa.raepa_canalaep_l c
            ON ST_DWithin(c.geom, a.geom, 0.05)
            WHERE idcana = myid AND fnappaep = '03'
            ORDER BY c.idcana, dist_to_start
        )
        SELECT loc into locate FROM apploc;
    END IF;
    IF locate = 0 THEN
        locate = 0.05;
    ELSIF locate = 1 THEN
        locate = 0.95;
    END IF;

    return locate;
END;$$;


-- FUNCTION get_vanne_cana(myid text, starter boolean)
COMMENT ON FUNCTION raepa.get_vanne_cana(myid text, starter boolean) IS 'Calcul de la position de la vanne la plus proche sur une canalisation selon un point de départ (fin ou debut de canalisation)';


-- import_gabarit_dans_tables_temporaires(text, text, text, text, text, text, text)
CREATE FUNCTION raepa.import_gabarit_dans_tables_temporaires(in_anfinpose text, in_qualglocxy text, in_qualglocz text, in_etat text, in_source_historique text, in_code_chantier text, in_type text) RETURNS boolean
    LANGUAGE plpgsql
    AS $_$
DECLARE
  sql_template text;
BEGIN

    -- Tests des variables d'entrée
    IF NOT in_anfinpose ~ '^\d{4}$' THEN
        RAISE EXCEPTION '[raepa] L''année de fin de pose n''est pas correcte';
        RETURN 0;
    END IF;
    IF in_qualglocxy NOT IN ('A', 'B', 'C') OR in_qualglocz NOT IN ('A', 'B', 'C') THEN
        RAISE EXCEPTION '[raepa] Les qualités de géolocalisation ne sont pas correctes: % et %', in_qualglocxy, in_qualglocz;
        RETURN 0;
    END IF;
    IF in_etat NOT IN ('00', '01', '02', '03', '04') THEN
        RAISE EXCEPTION '[raepa] Le paramètre état n''est pas correct';
        RETURN 0;
    END IF;

    -- Transformation des variables
    in_qualglocxy := CASE
        WHEN in_qualglocxy = 'A' THEN '01'
        WHEN in_qualglocxy = 'B' THEN '02'
        ELSE '03'
    END;
    in_qualglocz := CASE
        WHEN in_qualglocz = 'A' THEN '01'
        WHEN in_qualglocz = 'B' THEN '02'
        ELSE '03'
    END;

    IF (in_type = 'ass') THEN
   	    -- Création du schéma d'import et des tables si nécessaire
        DROP TABLE IF EXISTS imports.appareils_ass;
        CREATE TABLE imports.appareils_ass AS SELECT * FROM raepa.raepa_apparass_p LIMIT 0;
        DROP TABLE IF EXISTS imports.ouvrages_ass;
        CREATE TABLE imports.ouvrages_ass AS SELECT * FROM raepa.raepa_ouvrass_p LIMIT 0;
        DROP TABLE IF EXISTS imports.canalisations_ass;
        CREATE TABLE imports.canalisations_ass AS SELECT * FROM raepa.raepa_canalass_l LIMIT 0;
        DROP TABLE IF EXISTS imports.reparation_ass;
        CREATE TABLE imports.reparation_ass AS SELECT * FROM raepa.raepa_reparass_p LIMIT 0;

        -- ouvrages
        INSERT INTO imports.ouvrages_ass (
            idouvrage,
            typreseau, fnouvass,
            z, _ztampon, _angletampon,
            qualglocxy, qualglocz, anfinpose,
            _source_historique, _code_chantier, _date_import,
            geom
        )
        SELECT
            o.idouvrage,
            o.typreseau, o.fnouvass,
            o.z_radier, o.z_tampon, o.angle_tamp,
            -- degrees(o.ang_ouv) * -1 AS _angletampon,
            in_qualglocxy, in_qualglocz, in_anfinpose,
            in_source_historique, in_code_chantier, now()::date,
            ST_Transform(o.geom, 2154)
        FROM imports.gabarit_ouvrages_ass o
        ;

	    -- reparation
        INSERT INTO imports.reparation_ass (
            idrepar,
            supprepare, defreparee,
            idsuprepar, daterepar, mouvrage, _typeintervention,
            _source_historique, _code_chantier,
            geom
        )
        SELECT
            r.idrepar,
            r.supprepare, r.defreparee,
            r.idsuprepar, r.daterepar, r.mouvrage, r._typeinter,
            in_source_historique, in_code_chantier,
            ST_Transform(r.geom, 2154)
        FROM imports.gabarit_reparation_ass r
        ;

        -- appareils
        INSERT INTO imports.appareils_ass (
            idappareil,
            typreseau, fnappass,
            diametre, z,
            idouvrage,
            qualglocxy, qualglocz, anfinpose,
            _source_historique, _code_chantier, _date_import,
            geom
        )
        SELECT
            a.idappareil,
            a.typreseau, a.fnappass,
            a.diametre, a.z_appareil,
            a.idouvrage,
            in_qualglocxy, in_qualglocz, in_anfinpose,
            in_source_historique, in_code_chantier, now()::date,
            ST_Transform(a.geom, 2154)
        FROM imports.gabarit_appareils_ass a
        ;

        -- canalisations
        INSERT INTO imports.canalisations_ass(
            branchemnt, typreseau, materiau,
            _forme, diametre, _dimensionhorizontale,
            modecirc, nbranche,
            qualglocxy, qualglocz, anfinpose, _etat,
            _source_historique, _code_chantier, _date_import,
            _precisionannee,
            zamont, zaval, idnini, idnterm,
            geom
        )
        SELECT
            c.branchemnt, c.typreseau, c.materiau,
            c.forme, c.dim_v, c.dim_h,
            c.mode_circ, c.nbranche,
            in_qualglocxy, in_qualglocz, in_anfinpose, in_etat,
            in_source_historique, in_code_chantier, now()::date,
            '00' AS _precisionannee,
            c.fe_amont, c.fe_aval, c.id_nd_amon, c.id_nd_aval,
            ST_Transform((st_dump(c.geom)).geom, 2154)
        FROM imports.gabarit_canalisations_ass AS c
        ;

    ELSE

		-- Création du schéma d'import et des tables si nécessaire
        DROP TABLE IF EXISTS imports.appareils_aep;
        CREATE TABLE imports.appareils_aep AS SELECT * FROM raepa.raepa_apparaep_p LIMIT 0;
        DROP TABLE IF EXISTS imports.ouvrages_aep;
        CREATE TABLE imports.ouvrages_aep AS SELECT * FROM raepa.raepa_ouvraep_p LIMIT 0;
        DROP TABLE IF EXISTS imports.canalisations_aep;
        CREATE TABLE imports.canalisations_aep AS SELECT * FROM raepa.raepa_canalaep_l LIMIT 0;
        DROP TABLE IF EXISTS imports.reparation_aep;
        CREATE TABLE imports.reparation_aep AS SELECT * FROM raepa.raepa_reparaep_p LIMIT 0;

        -- ouvrages
        INSERT INTO imports.ouvrages_aep (
            idouvrage,
            mouvrage, gexploit,
			fnouvaep, z,
			anfinpose, qualglocxy, qualglocz,
			_source_historique, _code_chantier, _date_import,
			geom
        )
        SELECT
            o.idouvrage,
            o.mouvrage, o.gexploit,
			o.fnouvaep, o.z,
			in_anfinpose, in_qualglocxy, in_qualglocz,
			in_source_historique, in_code_chantier, now()::date,
			ST_Transform(o.geom, 2154)
        FROM imports.gabarit_ouvrages_aep o
        ;

	    -- reparation
        INSERT INTO imports.reparation_aep (
            idrepar,
			supprepare, defreparee, idsuprepar,
			daterepar, mouvrage,
			_source_historique, _code_chantier, _date_import,
			geom
        )
        SELECT
            r.idrepar,
			r.supprepare, r.defreparee, r.idsuprepar,
			r.daterepar, r.mouvrage,
			in_source_historique, in_code_chantier, now()::date,
			ST_Transform(r.geom, 2154)
        FROM imports.gabarit_reparation_aep r
        ;

        -- appareils
        INSERT INTO imports.appareils_aep (
            idappareil,
            mouvrage, gexploit,
			diametre,
			fnappaep, z,
			idouvrage,
			anfinpose, qualglocxy, qualglocz,
			_source_historique, _code_chantier, _date_import,
			geom
        )
        SELECT
		    a.idappareil,
            a.mouvrage, a.gexploit,
			a.diametre,
			a.fnappaep, a.z,
			a.idouvrage,
			in_anfinpose, in_qualglocxy, in_qualglocz,
			in_source_historique, in_code_chantier, now()::date,
            ST_Transform(a.geom, 2154)
        FROM imports.gabarit_appareils_aep a
        ;

        -- canalisations
        INSERT INTO imports.canalisations_aep(
            idcana,
			mouvrage, gexploit,
			enservice, branchemnt, materiau,
			diametre, anfinpose, modecirc, contcanaep, fonccanaep,
			idnini, idnterm,
			qualglocxy, qualglocz,
			_source_historique, _code_chantier, _date_import,
			geom
        )
        SELECT
            c.idcana,
			c.mouvrage, c.gexploit,
			c.enservice, c.branchemnt, c.materiau,
			c.diametre, in_anfinpose, c.modecirc, c.contcanaep, c.fonccanaep,
			c.idnini, c.idnterm,
			in_qualglocxy, in_qualglocz,
			in_source_historique, in_code_chantier, now()::date,
			ST_Transform((st_dump(c.geom)).geom, 2154)
        FROM imports.gabarit_canalisations_aep AS c
        ;


    END IF;

    RETURN TRUE;

END;
$_$;


-- import_tables_temporaires_dans_raepa(text, text, boolean, text)
CREATE FUNCTION raepa.import_tables_temporaires_dans_raepa(in_source_historique text, in_code_chantier text, nettoyer_chantier boolean, in_type text) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
  sql_template text;
BEGIN

	IF (in_type = 'ass') THEN

		-- Suppression des données précédemment importées
    	IF nettoyer_chantier IS TRUE THEN
        	DELETE FROM raepa.raepa_apparass_p WHERE _source_historique = in_source_historique AND _code_chantier = in_code_chantier;
        	DELETE FROM raepa.raepa_canalass_l WHERE _source_historique = in_source_historique AND _code_chantier = in_code_chantier;
        	DELETE FROM raepa.raepa_ouvrass_p WHERE _source_historique = in_source_historique AND _code_chantier = in_code_chantier;
        	DELETE FROM raepa.raepa_reparass_p WHERE _source_historique = in_source_historique AND _code_chantier = in_code_chantier;
    	END IF;

        -- Mise à jour des champs dans les tables d'import
        UPDATE imports.ouvrages_ass
        SET "_temp_data" = hstore(array['code_ouvrage', idouvrage])
        ;
        UPDATE imports.appareils_ass
        SET "_temp_data" = hstore(ARRAY['code_appareil', idappareil, 'code_ouvrage', idouvrage])
        ;
        UPDATE imports.canalisations_ass
        SET "_temp_data" = hstore(array['code_canalisation',idcana,'ouvrage_amont', idnini, 'ouvrage_aval', idnterm] )
		;
		UPDATE imports.reparation_ass
        SET "_temp_data" = hstore(array['code_reparation', idrepar, 'code_support', idsuprepar] );

        -- Insertion des données dans raepa
        -- ouvrages
        INSERT INTO raepa.raepa_ouvrass_p (
            typreseau, fnouvass,
            z, _ztampon, _angletampon,
            qualglocxy, qualglocz, anfinpose,
            _source_historique, _code_chantier, _date_import,
            _temp_data,
            geom
        )
        SELECT DISTINCT
            o.typreseau, o.fnouvass,
            o.z, o._ztampon, o._angletampon,
            -- degrees(o.ang_ouv) * -1 AS _angletampon,
            qualglocxy, qualglocz, anfinpose,
            _source_historique, _code_chantier, _date_import,
            _temp_data,
            o.geom
        FROM imports.ouvrages_ass o
        ;

        -- appareils
        INSERT INTO raepa.raepa_apparass_p (
            typreseau, fnappass,
            diametre, z,
            idouvrage,
            qualglocxy, qualglocz, anfinpose,
            _source_historique, _code_chantier, _date_import,
            _temp_data,
            geom
        )
        SELECT DISTINCT
            a.typreseau, a.fnappass,
            a.diametre, a.z,
            (SELECT o.idouvrage FROM raepa.raepa_ouvrass_p o WHERE o."_temp_data"->'code_ouvrage' = a."_temp_data"->'code_ouvrage' LIMIT 1) AS idouvrage,
            qualglocxy, qualglocz, anfinpose,
            _source_historique, _code_chantier, _date_import,
            _temp_data,
            a.geom
        FROM imports.appareils_ass a
        ;

        -- canalisations
        INSERT INTO raepa.raepa_canalass_l(
            branchemnt, typreseau, contcanass, fonccanass, materiau,
            _forme, diametre, _dimensionhorizontale,
            modecirc, nbranche,
            qualglocxy, qualglocz, anfinpose, _etat,
            _source_historique, _code_chantier, _date_import,
            _precisionannee,
			zamont, zaval,
            idnini, idnterm,
            _temp_data,
            geom
        )
        SELECT DISTINCT
            c.branchemnt, c.typreseau, c.typreseau AS contcanass, '02', c.materiau,
            c._forme, c.diametre, c._dimensionhorizontale,
            c.modecirc, c.nbranche,
            c.qualglocxy, c.qualglocz, c.anfinpose, c._etat,
            c._source_historique, c._code_chantier, c._date_import,
            c._precisionannee,
			c.zamont, c.zaval,
            o1.idouvrage AS idnini,
            o2.idouvrage AS idterm,
            c._temp_data,

            -- On retourne les canalisations dans le mauvais sens
            CASE
                WHEN
                    ST_Dwithin(ST_EndPoint(c.geom), o1.geom, 0.05)
                    OR ST_Dwithin(ST_StartPoint(c.geom), o2.geom, 0.05)
                THEN ST_Reverse(c.geom)
                ELSE c.geom
            END AS geom
        FROM imports.canalisations_ass AS c
        LEFT JOIN raepa.raepa_ouvrass_p o1
            ON TRUE
                AND o1._source_historique = in_source_historique
                AND o1._code_chantier = in_code_chantier
                AND o1."_temp_data"->'code_ouvrage' = c."_temp_data"->'ouvrage_amont'
        LEFT JOIN raepa.raepa_ouvrass_p o2
            ON TRUE
                AND o2._source_historique = in_source_historique
                AND o2._code_chantier = in_code_chantier
                AND o2."_temp_data"->'code_ouvrage' = c."_temp_data"->'ouvrage_aval'
        WHERE TRUE
        ;

        -- Modification des ouvrages pour modifier les cana amont et aval
        WITH a AS (
            SELECT
                oo.idouvrage,
                COALESCE(string_agg(c.idcana, ',' ORDER BY idcana), 'INCONNU') AS idcanamont
            FROM raepa.raepa_ouvrass_p AS oo
            LEFT JOIN raepa.raepa_canalass_l AS c
            ON ST_DWithin(ST_EndPoint(c.geom), oo.geom, 0.05)
            WHERE TRUE
            AND idcanamont = 'INCONNU'
            AND oo._source_historique = in_source_historique AND oo._code_chantier = in_code_chantier
            GROUP BY idouvrage
        )
        UPDATE raepa.raepa_ouvrass_p AS o
        SET idcanamont = a.idcanamont
        FROM a
        WHERE TRUE
        AND a.idouvrage = o.idouvrage
        AND o.idcanamont = 'INCONNU'
        ;

        WITH a AS (
            SELECT
                oo.idouvrage,
                COALESCE(string_agg(c.idcana, ',' ORDER BY idcana), 'INCONNU') AS idcanaval
            FROM raepa.raepa_ouvrass_p AS oo
            LEFT JOIN raepa.raepa_canalass_l AS c
            ON ST_DWithin(ST_StartPoint(c.geom), oo.geom, 0.05)
            WHERE TRUE
            AND idcanaval = 'INCONNU'
            AND oo._source_historique = in_source_historique AND oo._code_chantier = in_code_chantier
            GROUP BY idouvrage
        )
        UPDATE raepa.raepa_ouvrass_p AS o
        SET idcanaval = a.idcanaval
        FROM a
        WHERE TRUE
        AND a.idouvrage = o.idouvrage
        AND o.idcanaval = 'INCONNU'
        ;

    		-- reparation
        INSERT INTO raepa.raepa_reparass_p (
            supprepare, defreparee,
            idsuprepar,
			daterepar, mouvrage, _typeintervention,
            _source_historique, _code_chantier, _temp_data,
            geom
        )
        SELECT DISTINCT
            r.supprepare, r.defreparee,
            CASE
                WHEN r.supprepare = '01'
					THEN (SELECT c.idcana FROM raepa.raepa_canalass_l c WHERE c."_temp_data"->'code_canalisation' = r."_temp_data"->'code_support' LIMIT 1)
				WHEN r.supprepare = '02'
					THEN (SELECT c.idappareil FROM raepa.raepa_apparass_p c WHERE c."_temp_data"->'code_appareil' = r."_temp_data"->'code_support' LIMIT 1)
				WHEN r.supprepare = '03'
					THEN (SELECT c.idouvrage FROM raepa.raepa_ouvrass_p c WHERE c."_temp_data"->'code_ouvrage' = r."_temp_data"->'code_support' LIMIT 1)
				ELSE 'INCONNU' END AS idsuprepar,
			r.daterepar, r.mouvrage, r._typeintervention,
            _source_historique, _code_chantier, r._temp_data,
            r.geom
        FROM imports.reparation_ass r
        ;

	ELSE

		-- Suppression des données précédemment importées
		IF nettoyer_chantier IS TRUE THEN
		DELETE FROM raepa.raepa_apparaep_p WHERE _source_historique = in_source_historique AND _code_chantier = in_code_chantier;
        DELETE FROM raepa.raepa_canalaep_l WHERE _source_historique = in_source_historique AND _code_chantier = in_code_chantier;
        DELETE FROM raepa.raepa_ouvraep_p WHERE _source_historique = in_source_historique AND _code_chantier = in_code_chantier;
        DELETE FROM raepa.raepa_reparaep_p WHERE _source_historique = in_source_historique AND _code_chantier = in_code_chantier;
		END IF;

		-- Mise à jour des champs dans les tables d'import
        UPDATE imports.ouvrages_aep
        SET "_temp_data" = hstore(array['code_ouvrage', idouvrage])
        ;
        UPDATE imports.appareils_aep
        SET "_temp_data" = hstore(ARRAY['code_appareil', idappareil, 'code_ouvrage', idouvrage])
        ;
        UPDATE imports.canalisations_aep
        SET "_temp_data" = hstore(array['ouvrage_amont', idnini, 'ouvrage_aval', idnterm] )
		;
		UPDATE imports.reparation_aep
        SET "_temp_data" = hstore(array['code_reparation', idrepar, 'code_support', idsuprepar] );

		-- Insertion des données dans raepa
        -- ouvrages
        INSERT INTO raepa.raepa_ouvraep_p (
            fnouvaep,
            z,
            qualglocxy, qualglocz, anfinpose,
            _source_historique, _code_chantier, _date_import,
            _temp_data,
            geom
        )
        SELECT DISTINCT
            o.fnouvaep,
            o.z,
            -- degrees(o.ang_ouv) * -1 AS _angletampon,
            qualglocxy, qualglocz, anfinpose,
            _source_historique, _code_chantier, _date_import,
            _temp_data,
            o.geom
        FROM imports.ouvrages_aep o
        ;

		-- appareils
        INSERT INTO raepa.raepa_apparaep_p (
            fnappaep,
            diametre, z,
            idouvrage,
            qualglocxy, qualglocz, anfinpose,
            _source_historique, _code_chantier, _date_import,
            _temp_data,
            geom
        )
        SELECT DISTINCT
            a.fnappaep,
            a.diametre, a.z,
            (SELECT o.idouvrage FROM raepa.raepa_ouvraep_p o WHERE o."_temp_data"->'code_ouvrage' = a."_temp_data"->'code_ouvrage' LIMIT 1) AS idouvrage,
            qualglocxy, qualglocz, anfinpose,
            _source_historique, _code_chantier, _date_import,
            _temp_data,
            a.geom
        FROM imports.appareils_aep a
        ;

		-- canalisations
        INSERT INTO raepa.raepa_canalaep_l(
            branchemnt, contcanaep, fonccanaep, materiau,
            diametre,
            modecirc, nbranche,
            qualglocxy, qualglocz, anfinpose,
            _source_historique, _code_chantier, _date_import,
            idnini, idnterm,
            _temp_data,
            geom
        )
        SELECT DISTINCT
            c.branchemnt, c.contcanaep, c.fonccanaep, c.materiau,
            c.diametre,
            c.modecirc, c.nbranche,
            c.qualglocxy, c.qualglocz, c.anfinpose,
            c._source_historique, c._code_chantier, c._date_import,
            /*o1.idouvrage AS idnini,
            o2.idouvrage AS idterm,*/
			'INCONNU','INCONNU',
            c._temp_data,

            -- On retourne les canalisations dans le mauvais sens
            CASE
                WHEN
                    ST_Dwithin(ST_EndPoint(c.geom), o1.geom, 0.05)
                    OR ST_Dwithin(ST_StartPoint(c.geom), o2.geom, 0.05)
                THEN ST_Reverse(c.geom)
                ELSE c.geom
            END AS geom
        FROM imports.canalisations_aep AS c
        LEFT JOIN raepa.raepa_ouvraep_p o1
            ON TRUE
                AND o1._source_historique = in_source_historique
                AND o1._code_chantier = in_code_chantier
                AND o1."_temp_data"->'code_ouvrage' = c."_temp_data"->'ouvrage_amont'
        LEFT JOIN raepa.raepa_ouvraep_p o2
            ON TRUE
                AND o2._source_historique = in_source_historique
                AND o2._code_chantier = in_code_chantier
                AND o2."_temp_data"->'code_ouvrage' = c."_temp_data"->'ouvrage_aval'
        WHERE TRUE
        ;

        -- Modification des ouvrages pour modifier les cana amont et aval
        WITH a AS (
            SELECT
                oo.idouvrage,
                COALESCE(string_agg(c.idcana, ',' ORDER BY idcana), 'INCONNU') AS idcanamont
            FROM raepa.raepa_ouvraep_p AS oo
            LEFT JOIN raepa.raepa_canalaep_l AS c
            ON ST_DWithin(ST_EndPoint(c.geom), oo.geom, 0.05)
            WHERE TRUE
            AND idcanamont = 'INCONNU'
            AND oo._source_historique = in_source_historique AND oo._code_chantier = in_code_chantier
            GROUP BY idouvrage
        )
        UPDATE raepa.raepa_ouvraep_p AS o
        SET idcanamont = a.idcanamont
        FROM a
        WHERE TRUE
        AND a.idouvrage = o.idouvrage
        AND o.idcanamont = 'INCONNU'
        ;

        WITH a AS (
            SELECT
                oo.idouvrage,
                COALESCE(string_agg(c.idcana, ',' ORDER BY idcana), 'INCONNU') AS idcanaval
            FROM raepa.raepa_ouvraep_p AS oo
            LEFT JOIN raepa.raepa_canalaep_l AS c
            ON ST_DWithin(ST_StartPoint(c.geom), oo.geom, 0.05)
            WHERE TRUE
            AND idcanaval = 'INCONNU'
            AND oo._source_historique = in_source_historique AND oo._code_chantier = in_code_chantier
            GROUP BY idouvrage
        )
        UPDATE raepa.raepa_ouvraep_p AS o
        SET idcanaval = a.idcanaval
        FROM a
        WHERE TRUE
        AND a.idouvrage = o.idouvrage
        AND o.idcanaval = 'INCONNU'
        ;

		-- reparation
        INSERT INTO raepa.raepa_reparaep_p (
            supprepare, defreparee,
            idsuprepar,
			daterepar, mouvrage,
            _source_historique, _code_chantier, _temp_data,
            geom
        )
        SELECT DISTINCT
            r.supprepare, r.defreparee,
            CASE
                WHEN r.supprepare = '01'
					THEN (SELECT c.idcana FROM raepa.raepa_canalaep_l c WHERE c."_temp_data"->'code_canalisation' = r."_temp_data"->'code_support' LIMIT 1)
				WHEN r.supprepare = '02'
					THEN (SELECT c.idappareil FROM raepa.raepa_apparaep_p c WHERE c."_temp_data"->'code_appareil' = r."_temp_data"->'code_support' LIMIT 1)
				WHEN r.supprepare = '03'
					THEN (SELECT c.idouvrage FROM raepa.raepa_ouvraep_p c WHERE c."_temp_data"->'code_ouvrage' = r."_temp_data"->'code_support' LIMIT 1)
				ELSE 'INCONNU' END AS idsuprepar,
			r.daterepar, r.mouvrage,
            _source_historique, _code_chantier, r._temp_data,
            r.geom
        FROM imports.reparation_aep r
        ;

	END IF;

    RETURN TRUE;
END;
$$;


-- network_to_vanne(text)
CREATE FUNCTION raepa.network_to_vanne(cana text) RETURNS public.geometry
    LANGUAGE plpgsql
    AS $$
DECLARE
  parcours public.geometry;
BEGIN

WITH RECURSIVE walk_network(idcana, all_parents, geom) AS (
      SELECT idcana::text,
      array[idcana::text] as all_parents,
      geom
      FROM raepa.raepa_canalaep_l
      WHERE idcana = cana --sans vanne
    UNION ALL
      SELECT
         n.idcana::text AS idcana,
    w.all_parents || n.idcana::text AS all_parents,
    CASE
      WHEN  a.idappareil IS NOT NULL AND ST_Dwithin(st_startpoint(w.geom), st_endpoint(n.geom), 0.05) THEN ST_Line_Substring( n.geom, raepa.get_vanne_cana(n.idcana, false), 1 )::geometry(LineString,2154)
      WHEN  a.idappareil IS NOT NULL AND ST_Dwithin(st_startpoint(n.geom), st_endpoint(w.geom), 0.05) THEN ST_Line_Substring( n.geom, 0, raepa.get_vanne_cana(n.idcana, true) )::geometry(LineString,2154)
      ELSE n.geom::geometry(LineString,2154) END AS geom
      FROM raepa.raepa_canalaep_l AS n
        LEFT OUTER JOIN raepa.raepa_apparaep_p a ON ( fnappaep = '03' AND ST_Dwithin(n.geom, a.geom, 0.05) ),
        walk_network AS w
      WHERE TRUE
      AND (ST_Dwithin(st_startpoint(w.geom), st_endpoint(n.geom), 0.05) OR ST_Dwithin(st_startpoint(n.geom), st_endpoint(w.geom), 0.05))
      AND n.idcana <> ALL (w.all_parents)
)
SELECT ST_Union(DISTINCT geom)  INTO parcours AS geom FROM walk_network;

  RETURN parcours;
END;
$$;


-- FUNCTION network_to_vanne(cana text)
COMMENT ON FUNCTION raepa.network_to_vanne(cana text) IS 'Parcours du réseau de canalisation d''eau potable à partir d''une canalisation jusqu''aux vannes les plus proches';


-- trg_apres_modification_ouvrage()
CREATE FUNCTION raepa.trg_apres_modification_ouvrage() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    table_canalisation text;
BEGIN

    IF ( TG_OP = 'UPDATE' AND NOT ST_Equals(NEW.geom, OLD.geom) ) OR TG_OP = 'INSERT' THEN

        -- Modification des idnini et idnterm des canalisations qui touchent aux extrémités
        table_canalisation = 'raepa.raepa_canalass_l';
        IF TG_TABLE_NAME = 'raepa_ouvraep_p' THEN
            table_canalisation = 'raepa.raepa_canalaep_l';
        END IF;

        -- idnini
        EXECUTE format('
        UPDATE %s AS ca
        SET idnini = ''%s''
        WHERE idnini != ''%s''
        AND ST_DWithin(ST_StartPoint(ca.geom), ''%s''::geometry, 0.05)
        ', table_canalisation,
        NEW.idouvrage, NEW.idouvrage,
        NEW.geom
        )
        ;
        -- idnterm
        EXECUTE format('
        UPDATE %s ca
        SET idnterm = ''%s''
        WHERE idnterm != ''%s''
        AND ST_DWithin(ST_EndPoint(ca.geom), ''%s''::geometry, 0.05)
        ', table_canalisation,
        NEW.idouvrage, NEW.idouvrage,
        NEW.geom
        )
        ;

        -- Modification des géométries des canalisations amont et aval liées par idnini et idnterm
        -- Cela permet de faire toucher les canalisations à l'ouvrage
        -- Canalisation dont l'ouvrage est à l'aval
        EXECUTE format('
        WITH
        aval AS (
            SELECT
            c.idcana,
            z.path[1] AS node_id, z.geom AS node_geom
            FROM %s AS c, ST_DumpPoints(geom) AS z
            WHERE c.idnterm = ''%s''
        )
        UPDATE %s c
        SET
            geom = foo.geom
        FROM (
            SELECT aval.idcana AS cid,
            ST_MakeLine(
                (array_agg(node_geom ORDER BY node_id))[1:count(node_id)-1] || ARRAY[''%s''::geometry]
            ) AS geom
            FROM aval
            GROUP BY aval.idcana
        ) AS foo
        WHERE c.idcana = foo.cid AND c.idnterm = ''%s'' AND NOT ST_Intersects(ST_EndPoint(c.geom), ''%s''::geometry)
        ',
        table_canalisation, NEW.idouvrage,
        table_canalisation, NEW.geom,
        NEW.idouvrage, NEW.geom
        );

        -- Canalisation dont l'ouvrage est à l'amont
        EXECUTE format('
        WITH
        amont AS (
            SELECT
            c.idcana,
            z.path[1] AS node_id, z.geom AS node_geom
            FROM %s AS c, ST_DumpPoints(geom) AS z
            WHERE c.idnini = ''%s''
        )
        UPDATE %s c
        SET geom = foo.geom
        FROM (
            SELECT amont.idcana AS cid,
            ST_MakeLine(
                ARRAY[''%s''::geometry] || (array_agg(node_geom ORDER BY node_id))[2:count(node_id)]
            ) AS geom
            FROM amont
            GROUP BY amont.idcana
        ) AS foo
        WHERE c.idcana = foo.cid AND c.idnini = ''%s'' AND NOT ST_Intersects(ST_StartPoint(c.geom), ''%s''::geometry)
        ',
        table_canalisation, NEW.idouvrage,
        table_canalisation, NEW.geom,
        NEW.idouvrage, NEW.geom
        );

    END IF;

    RETURN NEW;
END;
$$;


-- trg_avant_ajout_ou_modification_canalisation()
CREATE FUNCTION raepa.trg_avant_ajout_ou_modification_canalisation() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    new_init geometry(POINT,2154);
    new_term geometry(POINT,2154);
    ouvrage_initial text;
    ouvrage_terminal text;
    cid integer;
    organisme text;
    table_ouvrage text;
BEGIN

    IF TG_OP = 'UPDATE' OR TG_OP = 'INSERT' THEN
        -- Récupération du noeud initial et terminal de la canalisation
        new_init := ST_StartPoint(NEW.geom);
        new_term := ST_EndPoint(NEW.geom);

        table_ouvrage = 'raepa.raepa_ouvrass_p';
        IF TG_TABLE_NAME = 'raepa_canalaep_l' THEN
            table_ouvrage = 'raepa.raepa_ouvraep_p';
        END IF;

        -- Ouvrage initial
        EXECUTE format('
        SELECT o.idouvrage
        FROM %s AS o
        WHERE o.idouvrage != Coalesce(''%s'', ''%s'' )
        AND ST_DWithin(''%s''::geometry, o.geom, 0.05)
        LIMIT 1
        ',
        table_ouvrage, NEW.idnini,
        '', new_init
        )
        INTO ouvrage_initial;

        IF (ouvrage_initial IS NOT NULL ) THEN
            -- on déclare le noeud initial
            RAISE NOTICE 'canalisation % - ouvrage initial changé : %' , NEW.idcana, ouvrage_initial;
            NEW.idnini := ouvrage_initial;
        END IF;

        IF NEW.idnini IS NULL OR NEW.idnini = '' THEN
            NEW.idnini := 'INCONNU';
        END IF;

        -- Ouvrage aval
        EXECUTE format('
        SELECT o.idouvrage
        FROM %s AS o
        WHERE Coalesce(''%s'', ''%s'') != o.idouvrage
        AND ST_DWithin(''%s''::geometry, o.geom, 0.05)
        LIMIT 1
        ',
        table_ouvrage,
        NEW.idnterm, '',
        new_term
        )
        INTO ouvrage_terminal;

        IF ouvrage_terminal IS NOT NULL THEN
            -- on déclare le noeud final
            RAISE NOTICE 'canalisation % - ouvrage terminal changé : %' , NEW.idcana, ouvrage_terminal;
            NEW.idnterm := ouvrage_terminal;
        END IF;
        IF NEW.idnterm IS NULL OR NEW.idnterm = '' THEN
            NEW.idnterm := 'INCONNU';
        END IF;

    END IF;

    -- Longueur projetée (entier et numérique)
    IF ( TG_OP = 'UPDATE' AND NOT ST_Equals(NEW.geom, OLD.geom) ) OR TG_OP = 'INSERT' THEN
        -- Calculs fonctions de la géométrie
        NEW.longcana := ST_Length(NEW.geom)::integer;
        NEW._longcana_cm := ST_Length(NEW.geom)::numeric(7,2);
    END IF;

    -- Longueur réelle et Pente
    -- Seulement pour ASS car sinon par de zamont ou zaval
    IF  TG_TABLE_NAME = 'raepa_canalass_l' THEN
        IF (TG_OP = 'UPDATE' AND ( NOT ST_Equals(NEW.geom, OLD.geom) OR OLD.zamont != NEW.zamont OR OLD.zaval != NEW.zaval ) )
            OR TG_OP = 'INSERT' THEN
        NEW._longcana_reelle :=
            CASE
                WHEN NEW.zamont > 0 AND NEW.zaval > 0
                    THEN sqrt( power(ST_Length(NEW.geom), 2) + power(NEW.zamont-NEW.zaval, 2) )::numeric(7,2)
                ELSE ST_Length(NEW.geom)::numeric(7,2)
            END
            ;
        NEW._pente :=
            CASE
                WHEN NEW.zamont > 0 AND NEW.zaval > 0
                    THEN 100 * (NEW.zamont - NEW.zaval) / ST_Length(NEW.geom)
                ELSE 0
            END
            ;
        END IF;
    END IF;

    -- Calcul de l'identifiant si besoin
    IF NEW.idcana IS NULL OR trim(NEW.idcana) = '' OR trim(NEW.idcana) = 'INCONNU' THEN
        NEW.idcana := raepa.generate_oid(TG_TABLE_NAME::text)::character varying;
    END IF;

    -- Champs requis
    IF NEW.enservice IS NULL OR NEW.enservice NOT IN ('O', 'N') THEN
        NEW.enservice := 'O';
    END IF;
    IF NEW.branchemnt IS NULL OR NEW.branchemnt NOT IN ('O', 'N') THEN
        NEW.branchemnt := 'N';
    END IF;

    -- Récupération du gestionnaire
    IF (NEW.mouvrage IS NULL) OR (NEW.gexploit IS NULL) OR (NEW.sourmaj IS NULL) THEN
        -- Récupération du gestionnaire
        SELECT INTO organisme
        s.nom
        FROM raepa.sys_organisme_gestionnaire s
        WHERE actif IS TRUE
        ORDER BY id DESC
        LIMIT 1;
    END IF;

    -- Métadonnées
    IF NEW.mouvrage IS NULL THEN
        NEW.mouvrage := organisme;
    END IF;
    IF NEW.gexploit IS NULL THEN
        NEW.gexploit := organisme;
    END IF;

    NEW.datemaj := now();
    IF NEW.sourmaj IS NULL THEN
        NEW.sourmaj := organisme;
    END IF;

    -- Return updated feature
    RETURN NEW;
END;
$$;


-- trg_avant_modification_appareil()
CREATE FUNCTION raepa.trg_avant_modification_appareil() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    organisme text;
    table_canalisation text;
	table_ouvrage text;
BEGIN

    -- Calcul de l'identifiant si besoin
    IF NEW.idappareil IS NULL OR trim(NEW.idappareil) = '' OR trim(NEW.idappareil) = 'INCONNU' THEN
        NEW.idappareil := raepa.generate_oid(TG_TABLE_NAME::text)::character varying;
    END IF;

    -- Calcul de la géométrie à partir de X et Y
    IF ( TG_OP = 'UPDATE' AND NEW.x IS NOT NULL AND NEW.y IS NOT NULL AND ( NEW.x != OLD.x OR NEW.y != OLD.y ) )
    OR ( TG_OP = 'INSERT' AND NEW.x IS NOT NULL AND NEW.y IS NOT NULL ) THEN
        NEW.geom := ST_SetSRID(ST_Makepoint(NEW.x, NEW.y), 2154);
        RAISE NOTICE 'appareil % - X ou Y changé -> changement geom vers POINT(% %)', NEW.idappareil, NEW.x, NEW.y;
    END IF;

    IF ( TG_OP = 'UPDATE' AND NOT ST_Equals(NEW.geom, OLD.geom) ) OR TG_OP = 'INSERT' THEN

        -- Calcul des X et Y si besoin
        NEW.x := ST_X(NEW.geom)::numeric(10,3);
        NEW.y := ST_Y(NEW.geom)::numeric(10,3);


        -- Calcul des canalisation amont et aval
        table_canalisation = 'raepa.raepa_canalass_l';
        IF TG_TABLE_NAME = 'raepa_apparaep_p' THEN
            table_canalisation = 'raepa.raepa_canalaep_l';
        END IF;

        -- idcanamont
        EXECUTE format(
            '
            SELECT COALESCE(string_agg(c.idcana, '','' ORDER BY idcana), ''INCONNU'')
            FROM %s AS c
            WHERE ST_DWithin(ST_EndPoint(c.geom), ''%s''::geometry, 0.05)
            ',
            table_canalisation,
            NEW.geom
        )
        INTO NEW.idcanamont;

        -- idcanaval
        EXECUTE format(
            '
            SELECT COALESCE(string_agg(c.idcana, '','' ORDER BY idcana), ''INCONNU'')
            FROM %s AS c
            WHERE ST_DWithin(ST_StartPoint(c.geom), ''%s''::geometry, 0.05)
            ',
            table_canalisation,
            NEW.geom
        )
        INTO NEW.idcanaval;
        RAISE NOTICE 'appareil % - idcanamont changé à %', NEW.idappareil, NEW.idcanamont;
        RAISE NOTICE 'appareil % - idcanaval changé à %', NEW.idappareil, NEW.idcanaval;


    END IF;

	--Ouvrage acceuil
	table_ouvrage = 'raepa.raepa_ouvrass_p';
    IF TG_TABLE_NAME = 'raepa_reparaep_p' THEN
        table_canalisation = 'raepa.raepa_ouvraep_p';
    END IF;

	IF (NEW.idouvrage IS NOT NULL) AND (trim(NEW.idouvrage) != 'INCONNU') THEN
		EXECUTE format(
            '
            SELECT COALESCE(string_agg(o.idouvrage, '','' ORDER BY idouvrage), ''INCONNU'')
            FROM %s AS o
            WHERE ST_DWithin(o.geom, ''%s''::geometry, 0.05)
            ',
            table_ouvrage,
            NEW.geom
        )
        INTO NEW.idouvrage;
	END IF;


    -- Métadonnées
    IF (NEW.mouvrage IS NULL) OR (NEW.gexploit IS NULL) OR (NEW.sourmaj IS NULL) THEN
        -- Récupération du gestionnaire
        SELECT INTO organisme
        s.nom
        FROM raepa.sys_organisme_gestionnaire s
        WHERE actif IS TRUE
        ORDER BY id DESC
        LIMIT 1;
    END IF;

    IF NEW.mouvrage IS NULL THEN
        NEW.mouvrage := organisme;
    END IF;
    IF NEW.gexploit IS NULL THEN
        NEW.gexploit := organisme;
    END IF;

    NEW.datemaj := now();
    IF NEW.sourmaj IS NULL THEN
        NEW.sourmaj := organisme;
    END IF;

    RETURN NEW;

END;
$$;


-- trg_avant_modification_ouvrage()
CREATE FUNCTION raepa.trg_avant_modification_ouvrage() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    organisme text;
    table_canalisation text;
BEGIN

    -- Calcul de l'identifiant si besoin
    IF NEW.idouvrage IS NULL OR trim(NEW.idouvrage) = '' OR trim(NEW.idouvrage) = 'INCONNU' THEN
        NEW.idouvrage := raepa.generate_oid(TG_TABLE_NAME::text)::character varying;
    END IF;

    -- Calcul de la géométrie à partir de X et Y
    IF ( TG_OP = 'UPDATE' AND NEW.x IS NOT NULL AND NEW.y IS NOT NULL AND ( NEW.x != OLD.x OR NEW.y != OLD.y ) )
    OR ( TG_OP = 'INSERT' AND NEW.x IS NOT NULL AND NEW.y IS NOT NULL ) THEN
        NEW.geom := ST_SetSRID(ST_Makepoint(NEW.x, NEW.y), 2154);
        RAISE NOTICE 'ouvrage % - X ou Y changé -> changement geom vers POINT(% %)', NEW.idouvrage, NEW.x, NEW.y;
    END IF;

    IF ( TG_OP = 'UPDATE' AND NOT ST_Equals(NEW.geom, OLD.geom) ) OR TG_OP = 'INSERT' THEN

        -- Calcul des X et Y si besoin
        NEW.x := ST_X(NEW.geom)::numeric(10,3);
        NEW.y := ST_Y(NEW.geom)::numeric(10,3);

        -- Calcul des canalisation amont et aval
        table_canalisation = 'raepa.raepa_canalass_l';
        IF TG_TABLE_NAME = 'raepa_ouvraep_p' THEN
            table_canalisation = 'raepa.raepa_canalaep_l';
        END IF;

        -- idcanamont
        EXECUTE format(
            '
            SELECT COALESCE(string_agg(c.idcana, '','' ORDER BY idcana), ''INCONNU'')
            FROM %s AS c
            WHERE ST_DWithin(ST_EndPoint(c.geom), ''%s''::geometry, 0.05)
            ',
            table_canalisation,
            NEW.geom
        )
        INTO NEW.idcanamont;

        -- idcanaval
        EXECUTE format(
            '
            SELECT COALESCE(string_agg(c.idcana, '','' ORDER BY idcana), ''INCONNU'')
            FROM %s AS c
            WHERE ST_DWithin(ST_StartPoint(c.geom), ''%s''::geometry, 0.05)

            ',
            table_canalisation,
            NEW.geom
        )
        INTO NEW.idcanaval;
        RAISE NOTICE 'ouvrage % - idcanamont changé à %', NEW.idouvrage, NEW.idcanamont;
        RAISE NOTICE 'ouvrage % - idcanaval changé à %', NEW.idouvrage, NEW.idcanaval;

    END IF;


    -- Métadonnées
    IF (NEW.mouvrage IS NULL) OR (NEW.gexploit IS NULL) OR (NEW.sourmaj IS NULL) THEN
        -- Récupération du gestionnaire
        SELECT INTO organisme
        s.nom
        FROM raepa.sys_organisme_gestionnaire s
        WHERE actif IS TRUE
        ORDER BY id DESC
        LIMIT 1;
    END IF;

    IF NEW.mouvrage IS NULL THEN
        NEW.mouvrage := organisme;
    END IF;
    IF NEW.gexploit IS NULL THEN
        NEW.gexploit := organisme;
    END IF;

    NEW.datemaj := now();
    IF NEW.sourmaj IS NULL THEN
        NEW.sourmaj := organisme;
    END IF;

    RETURN NEW;

END;
$$;


-- trg_avant_modification_reparation()
CREATE FUNCTION raepa.trg_avant_modification_reparation() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    organisme text;
	table_canalisation text;
	table_ouvrage text;
	table_appareil text;
BEGIN

    -- Calcul de l'identifiant si besoin
    IF NEW.idrepar IS NULL OR trim(NEW.idrepar) = '' OR trim(NEW.idrepar) = 'INCONNU' THEN
        NEW.idrepar := raepa.generate_oid(TG_TABLE_NAME::text)::character varying;
    END IF;

    -- Calcul de la géométrie à partir de X et Y
    IF ( TG_OP = 'UPDATE' AND NEW.x IS NOT NULL AND NEW.y IS NOT NULL AND ( NEW.x != OLD.x OR NEW.y != OLD.y ) )
    OR ( TG_OP = 'INSERT' AND NEW.x IS NOT NULL AND NEW.y IS NOT NULL ) THEN
        NEW.geom := ST_SetSRID(ST_Makepoint(NEW.x, NEW.y), 2154);
        RAISE NOTICE 'appareil % - X ou Y changé -> changement geom vers POINT(% %)', NEW.idrepar, NEW.x, NEW.y;
    END IF;

    IF ( TG_OP = 'UPDATE' AND NOT ST_Equals(NEW.geom, OLD.geom) ) OR TG_OP = 'INSERT' THEN

        -- Calcul des X et Y si besoin
        NEW.x := ST_X(NEW.geom)::numeric(10,3);
        NEW.y := ST_Y(NEW.geom)::numeric(10,3);
	END IF;


        -- idsuprepar
	table_canalisation = 'raepa.raepa_canalass_l';
    IF TG_TABLE_NAME = 'raepa_reparaep_p' THEN
        table_canalisation = 'raepa.raepa_canalaep_l';
    END IF;

    table_ouvrage = 'raepa.raepa_ouvrass_p';
    IF TG_TABLE_NAME = 'raepa_reparaep_p' THEN
        table_ouvrage = 'raepa.raepa_ouvraep_p';
    END IF;

    table_appareil = 'raepa.raepa_apparass_p';
    IF TG_TABLE_NAME = 'raepa_reparaep_p' THEN
        table_appareil = 'raepa.raepa_apparaep_p';
    END IF;

    IF NEW.idsuprepar IS NULL OR trim(NEW.idsuprepar) = '' OR trim(NEW.idsuprepar) = 'INCONNU' THEN
	IF (trim(NEW.supprepare) = '01') THEN
        EXECUTE format(
            '
            SELECT COALESCE(string_agg(c.idcana, '','' ORDER BY idcana), ''INCONNU'')
            FROM %s AS c
            WHERE ST_DWithin(c.geom, ''%s''::geometry, 0.05)
            ',
            table_canalisation,
            NEW.geom
        )
        INTO NEW.idsuprepar;


	ELSIF (trim(NEW.supprepare) = '02') THEN
        EXECUTE format(
            '
            SELECT COALESCE(string_agg(a.idappareil, '','' ORDER BY idappareil), ''INCONNU'')
            FROM %s AS a
            WHERE ST_DWithin(a.geom, ''%s''::geometry, 0.05)
            ',
            table_appareil,
            NEW.geom
        )
        INTO NEW.idsuprepar;

	ELSIF (trim(NEW.supprepare) = '03') THEN
        EXECUTE format(
            '
            SELECT COALESCE(string_agg(o.idouvrage, '','' ORDER BY idouvrage), ''INCONNU'')
            FROM %s AS o
            WHERE ST_DWithin(o.geom, ''%s''::geometry, 0.05)
            ',
            table_ouvrage,
            NEW.geom
        )
        INTO NEW.idsuprepar;

	ELSE NEW.idsuprepar:='INCONNU';
	END IF;
	END IF;


    -- Métadonnées
    IF (NEW.mouvrage IS NULL) THEN
        -- Récupération du gestionnaire
        SELECT INTO organisme
        s.nom
        FROM raepa.sys_organisme_gestionnaire s
        WHERE actif IS TRUE
        ORDER BY id DESC
        LIMIT 1;
    END IF;

    IF NEW.mouvrage IS NULL THEN
        NEW.mouvrage := organisme;
    END IF;

    RETURN NEW;

END;
$$;


-- upstream_by_geom(text)
CREATE FUNCTION raepa.upstream_by_geom(p_id_object text) RETURNS public.geometry
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
      JOIN raepa.get_canalisation_ids_by_object_id(''%s'', ''up'') AS s
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
CREATE FUNCTION raepa.upstream_by_idn(p_id_object text) RETURNS public.geometry
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
      JOIN raepa.get_canalisation_ids_by_object_id(''%s'', ''up'') AS s
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


--
-- PostgreSQL database dump complete
--

