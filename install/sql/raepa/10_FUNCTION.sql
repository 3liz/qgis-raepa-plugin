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


-- downstream(text)
CREATE FUNCTION raepa.downstream(text) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE
    AS $_$
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
    AND n.idnini = w.idnterm AND n.idnini != 'INCONNU'
  )
  SELECT ST_Union(r.geom) AS geom
  FROM walk_network wn
  INNER JOIN raepa.raepa_canalass_l r
  ON wn.id_canalisation = r.idcana
$_$;


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


-- import_gabarit_dans_tables_temporaires(text, text, text, text, text, text)
CREATE FUNCTION raepa.import_gabarit_dans_tables_temporaires(in_anfinpose text, in_qualglocxy text, in_qualglocz text, in_etat text, in_source_historique text, in_code_chantier text) RETURNS boolean
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

    -- Création du schéma d'import et des tables si nécessaire
    DROP TABLE IF EXISTS imports.appareils;
    CREATE TABLE imports.appareils AS SELECT * FROM raepa.raepa_apparass_p LIMIT 0;
    DROP TABLE IF EXISTS imports.ouvrages;
    CREATE TABLE imports.ouvrages AS SELECT * FROM raepa.raepa_ouvrass_p LIMIT 0;
    DROP TABLE IF EXISTS imports.canalisations;
    CREATE TABLE imports.canalisations AS SELECT * FROM raepa.raepa_canalass_l LIMIT 0;

    -- ouvrages
    INSERT INTO imports.ouvrages (
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
    FROM imports.gabarit_ouvrages o
    ;

    -- appareils
    INSERT INTO imports.appareils (
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
    FROM imports.gabarit_appareils a
    ;

    -- canalisations
    INSERT INTO imports.canalisations(
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
    FROM imports.gabarit_canalisations AS c
    ;

    RETURN TRUE;

END;
$_$;


-- import_tables_temporaires_dans_raepa(text, text, boolean)
CREATE FUNCTION raepa.import_tables_temporaires_dans_raepa(in_source_historique text, in_code_chantier text, nettoyer_chantier boolean) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
  sql_template text;
BEGIN

    -- Suppression des données précédemment importées
    IF nettoyer_chantier IS TRUE THEN
        DELETE FROM raepa.raepa_apparass_p WHERE _source_historique = in_source_historique AND _code_chantier = in_code_chantier;
        DELETE FROM raepa.raepa_canalass_l WHERE _source_historique = in_source_historique AND _code_chantier = in_code_chantier;
        DELETE FROM raepa.raepa_ouvrass_p WHERE _source_historique = in_source_historique AND _code_chantier = in_code_chantier;
    END IF;

    -- Mise à jour des champs dans les tables d'import
    UPDATE imports.ouvrages
    SET "_temp_data" = hstore(array['code_ouvrage', idouvrage])
    ;
    UPDATE imports.appareils
    SET "_temp_data" = hstore(ARRAY['code_appareil', idappareil, 'code_ouvrage', idouvrage])
    ;
    UPDATE imports.canalisations
    SET "_temp_data" = hstore(array['ouvrage_amont', idnini, 'ouvrage_aval', idnterm] );

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
    FROM imports.ouvrages o
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
    FROM imports.appareils a
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
    FROM imports.canalisations AS c
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

    RETURN TRUE;
END;
$$;


-- trg_apres_modification_ouvrage()
CREATE FUNCTION raepa.trg_apres_modification_ouvrage() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN

    IF ( TG_OP = 'UPDATE' AND NOT ST_Equals(NEW.geom, OLD.geom) ) OR TG_OP = 'INSERT' THEN

        -- Modification des idnini et idnterm des canalisations qui touchent aux extrémités
        -- idnini
        UPDATE raepa.raepa_canalass_l ca
        SET idnini = NEW.idouvrage
        WHERE idnini != NEW.idouvrage
        AND ST_DWithin(ST_StartPoint(ca.geom), NEW.geom, 0.05)
        ;
        -- idnterm
        UPDATE raepa.raepa_canalass_l ca
        SET idnterm = NEW.idouvrage
        WHERE idnterm != NEW.idouvrage
        AND ST_DWithin(ST_EndPoint(ca.geom), NEW.geom, 0.05)
        ;

        -- Modification des géométries des canalisations amont et aval liées par idnini et idnterm
        -- Cela permet de faire toucher les canalisations à l'ouvrage
        -- Canalisation dont l'ouvrage est à l'aval
        WITH
        aval AS (
            SELECT
            c.idcana,
            z.path[1] AS node_id, z.geom AS node_geom
            FROM raepa.raepa_canalass_l AS c, ST_DumpPoints(geom) AS z
            WHERE c.idnterm = NEW.idouvrage
        )
        UPDATE raepa.raepa_canalass_l c
        SET
            geom = foo.geom
        FROM (
            SELECT aval.idcana AS cid,
            ST_MakeLine(
                (array_agg(node_geom ORDER BY node_id))[1:count(node_id)-1] || ARRAY[NEW.geom]
            ) AS geom
            FROM aval
            GROUP BY aval.idcana
        ) AS foo
        WHERE c.idcana = foo.cid AND c.idnterm = NEW.idouvrage AND NOT ST_Intersects(ST_EndPoint(c.geom), NEW.geom)
        ;

        -- Canalisation dont l'ouvrage est à l'amont
        WITH
        amont AS (
            SELECT
            c.idcana,
            z.path[1] AS node_id, z.geom AS node_geom
            FROM raepa.raepa_canalass_l AS c, ST_DumpPoints(geom) AS z
            WHERE c.idnini = NEW.idouvrage
        )
        UPDATE raepa.raepa_canalass_l c
        SET geom = foo.geom
        FROM (
            SELECT amont.idcana AS cid,
            ST_MakeLine(
                ARRAY[NEW.geom] || (array_agg(node_geom ORDER BY node_id))[2:count(node_id)]
            ) AS geom
            FROM amont
            GROUP BY amont.idcana
        ) AS foo
        WHERE c.idcana = foo.cid AND c.idnini = NEW.idouvrage AND NOT ST_Intersects(ST_StartPoint(c.geom), NEW.geom)
        ;

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
BEGIN

    IF TG_OP = 'UPDATE' OR TG_OP = 'INSERT' THEN
        -- Récupération du noeud initial et terminal de la canalisation
        new_init := ST_StartPoint(NEW.geom);
        new_term := ST_EndPoint(NEW.geom);

        -- Ouvrage initial
        SELECT o.idouvrage
        FROM raepa.raepa_ouvrass_p o
        WHERE o.idouvrage != Coalesce(NEW.idnini, '') -- on trouve l'ouvrage à 5cm
        AND ST_DWithin(new_init, o.geom, 0.05)
        LIMIT 1
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
        SELECT o.idouvrage
        FROM raepa.raepa_ouvrass_p o
        WHERE Coalesce(NEW.idnterm, '') != o.idouvrage
        AND ST_DWithin(new_term, o.geom, 0.05) -- on trouve l'ouvrage à 5cm
        LIMIT 1
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
    IF ( TG_OP = 'UPDATE' AND ( NOT ST_Equals(NEW.geom, OLD.geom) OR OLD.zamont != NEW.zamont OR OLD.zaval != NEW.zaval ) )
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

    -- Calcul de l'identifiant si besoin
    IF NEW.idcana IS NULL OR trim(NEW.idcana) = '' THEN
        NEW.idcana := raepa.generate_oid('raepa_canalass_l')::character varying;
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
BEGIN

    -- Calcul de l'identifiant si besoin
    IF NEW.idappareil IS NULL OR trim(NEW.idappareil) = '' THEN
        NEW.idappareil := raepa.generate_oid('raepa_apparass_p')::character varying;
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
        NEW.idcanamont := (
            SELECT COALESCE(string_agg(c.idcana, ',' ORDER BY idcana), 'INCONNU')
            FROM raepa.raepa_canalass_l c
            WHERE ST_DWithin(ST_EndPoint(c.geom), NEW.geom, 0.05)
        );
        NEW.idcanaval := (
            SELECT COALESCE(string_agg(c.idcana, ',' ORDER BY idcana), 'INCONNU')
            FROM raepa.raepa_canalass_l c
            WHERE ST_DWithin(ST_StartPoint(c.geom), NEW.geom, 0.05)
        );
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
CREATE FUNCTION raepa.trg_avant_modification_ouvrage() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    organisme text;
BEGIN

    -- Calcul de l'identifiant si besoin
    IF NEW.idouvrage IS NULL OR trim(NEW.idouvrage) = '' THEN
        NEW.idouvrage := raepa.generate_oid('raepa_ouvrass_p')::character varying;
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
        NEW.idcanamont := (
            SELECT COALESCE(string_agg(c.idcana, ',' ORDER BY idcana), 'INCONNU')
            FROM raepa.raepa_canalass_l c
            WHERE ST_DWithin(ST_EndPoint(c.geom), NEW.geom, 0.05)
        );
        NEW.idcanaval := (
            SELECT COALESCE(string_agg(c.idcana, ',' ORDER BY idcana), 'INCONNU')
            FROM raepa.raepa_canalass_l c
            WHERE ST_DWithin(ST_StartPoint(c.geom), NEW.geom, 0.05)
        );
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


-- upstream(text)
CREATE FUNCTION raepa.upstream(text) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE
    AS $_$
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
    AND n.idnterm = w.idnini AND n.idnterm != 'INCONNU'
  )
  SELECT ST_Union(r.geom) AS geom
  FROM walk_network wn
  INNER JOIN raepa.raepa_canalass_l r
  ON wn.id_canalisation = r.idcana
$_$;


--
-- PostgreSQL database dump complete
--

