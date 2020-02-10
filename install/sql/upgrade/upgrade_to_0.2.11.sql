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
        SELECT raepa.calcul_orientation(c.idcana, ST_LineLocatePoint(c.geom, p.geom)) as res, ST_Distance(c.geom, p.geom) as dist, ST_LineLocatePoint(c.geom, p.geom) as pos
        FROM raepa.raepa_apparaep_p p
            JOIN raepa.raepa_canalaep_l c ON ST_DWithin(c.geom, p.geom, 0.05)
        WHERE p.idappareil = idappaep
        ORDER BY dist, pos
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

-- COLUMNS datemaj default value
ALTER TABLE raepa.raepa_apparaep_p ALTER COLUMN datemaj SET DEFAULT NOW();
ALTER TABLE raepa.raepa_apparass_p ALTER COLUMN datemaj SET DEFAULT NOW();
ALTER TABLE raepa.raepa_canalaep_l ALTER COLUMN datemaj SET DEFAULT NOW();
ALTER TABLE raepa.raepa_canalass_l ALTER COLUMN datemaj SET DEFAULT NOW();
ALTER TABLE raepa.raepa_ouvraep_p ALTER COLUMN datemaj SET DEFAULT NOW();
ALTER TABLE raepa.raepa_ouvrass_p ALTER COLUMN datemaj SET DEFAULT NOW();

-- trg_avant_ajout_ou_modification_canalisation()
CREATE OR REPLACE FUNCTION raepa.trg_avant_ajout_ou_modification_canalisation() RETURNS trigger
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
CREATE OR REPLACE FUNCTION raepa.trg_avant_modification_appareil() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    organisme text;
    table_canalisation text;
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
CREATE OR REPLACE FUNCTION raepa.trg_avant_modification_ouvrage() RETURNS trigger
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


CREATE OR REPLACE FUNCTION raepa.get_vanne_before_point(cana_id text, locate_point double precision)
  RETURNS double precision
    LANGUAGE 'plpgsql'
AS $BODY$
DECLARE
    locate double precision = 1;
BEGIN
    WITH apploc as (
        SELECT DISTINCT ON(c.idcana) c.idcana,  locate_point - ST_LineLocatePoint(c.geom, a.geom) As dist_to_point, ST_LineLocatePoint(c.geom, a.geom) as loc
        FROM raepa.raepa_apparaep_p a INNER JOIN raepa.raepa_canalaep_l c
        ON ST_DWithin(c.geom, a.geom, 0.05)
        WHERE idcana = cana_id AND fnappaep = '03' and locate_point - ST_LineLocatePoint(c.geom, a.geom) >= 0
        ORDER BY c.idcana, dist_to_point
    )
    SELECT loc into locate FROM apploc;

    return locate;
END;
$BODY$;

CREATE OR REPLACE FUNCTION raepa.get_vanne_after_point(cana_id text, locate_point double precision)
  RETURNS double precision
    LANGUAGE 'plpgsql'
AS $BODY$
DECLARE
    locate double precision = 1;
BEGIN
    WITH apploc as (
        SELECT DISTINCT ON(c.idcana) c.idcana,  ST_LineLocatePoint(c.geom, a.geom)- locate_point As dist_to_point, ST_LineLocatePoint(c.geom, a.geom) as loc
        FROM raepa.raepa_apparaep_p a INNER JOIN raepa.raepa_canalaep_l c
        ON ST_DWithin(c.geom, a.geom, 0.05)
        WHERE idcana = cana_id AND fnappaep = '03' and ST_LineLocatePoint(c.geom, a.geom) - locate_point >= 0
        ORDER BY c.idcana, dist_to_point
    )
    SELECT loc into locate FROM apploc;

    return locate;
END;
$BODY$;

CREATE OR REPLACE FUNCTION raepa.get_network_to_vanne_from_point(
    cana_id text,
    locate_point double precision)
  RETURNS geometry
    LANGUAGE 'plpgsql'
AS $BODY$
DECLARE
    locate_before_point double precision = 0;
    locate_after_point double precision = 1;
    parcours public.geometry;
BEGIN
    SELECT raepa.get_vanne_before_point(cana_id, locate_point) into locate_before_point;
    SELECT raepa.get_vanne_after_point(cana_id, locate_point) into locate_after_point;

    IF locate_before_point IS NOT NULL AND locate_after_point IS NOT NULL THEN
        SELECT ST_Line_Substring(c.geom, locate_before_point, locate_after_point) into parcours AS geom FROM raepa.raepa_canalaep_l AS c WHERE c.idcana = cana_id;
        RETURN parcours;
    END IF;

    WITH RECURSIVE walk_network(idcana, all_parents, geom, stop) AS (
    SELECT idcana::text,
          array[idcana::text] as all_parents,
          ST_Line_Substring(geom,
        CASE WHEN raepa.get_vanne_before_point(cana_id, locate_point) IS NULL THEN 0 ELSE raepa.get_vanne_before_point(cana_id, locate_point) END,
        CASE WHEN raepa.get_vanne_after_point(cana_id, locate_point) IS NULL THEN 1 ELSE raepa.get_vanne_after_point(cana_id, locate_point) END) as geom,
          False as stop
     FROM raepa.raepa_canalaep_l
     WHERE idcana = cana_id
      UNION ALL
        SELECT n.idcana::text AS idcana,
         w.all_parents || n.idcana::text AS all_parents,
         CASE
        WHEN  a.idappareil IS NOT NULL AND ST_Dwithin(st_startpoint(w.geom), st_endpoint(n.geom), 0.05) THEN ST_Line_Substring( n.geom, raepa.get_vanne_before_point(n.idcana, 1), 1 )::geometry(LineString,2154)
        WHEN  a.idappareil IS NOT NULL AND ST_Dwithin(st_startpoint(n.geom), st_endpoint(w.geom), 0.05) THEN ST_Line_Substring( n.geom, 0, raepa.get_vanne_after_point(n.idcana, 0) )::geometry(LineString,2154)
        WHEN  a.idappareil IS NOT NULL AND ST_Dwithin(st_startpoint(w.geom), st_startpoint(n.geom), 0.05) THEN ST_Line_Substring( n.geom, raepa.get_vanne_after_point(n.idcana, 1), 1 )::geometry(LineString,2154)
        WHEN  a.idappareil IS NOT NULL AND ST_Dwithin(st_endpoint(w.geom), st_endpoint(n.geom), 0.05) THEN ST_Line_Substring( n.geom, raepa.get_vanne_before_point(n.idcana, 1), 1 )::geometry(LineString,2154)
        ELSE n.geom::geometry(LineString,2154) END AS geom,
        a.idappareil IS NOT NULL as stop
          FROM raepa.raepa_canalaep_l AS n
          LEFT OUTER JOIN raepa.raepa_apparaep_p a ON ( fnappaep = '03' AND ST_Dwithin(n.geom, a.geom, 0.05) ),
             walk_network AS w
          WHERE TRUE
            AND (ST_Dwithin(st_startpoint(w.geom), st_endpoint(n.geom), 0.05) OR
               ST_Dwithin(st_startpoint(n.geom), st_endpoint(w.geom), 0.05) OR
               ST_Dwithin(st_startpoint(n.geom), st_startpoint(w.geom), 0.05) OR
               ST_Dwithin(st_endpoint(n.geom), st_endpoint(w.geom), 0.05))
          AND n.idcana <> ALL (w.all_parents)
          AND NOT w.stop
    )
    SELECT ST_Union(DISTINCT geom) into parcours AS geom FROM walk_network;
    RETURN parcours;
END;
$BODY$;




COMMIT;