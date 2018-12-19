BEGIN;

-- * Vider le schema imports ? non, on écrase les tables imports.gabarit_*
-- * Ajouter les 3 couches dans QGIS
-- * Vérifier la projection des 3 couches dans QGIS
-- * Importer via QGIS dans 3 tables ouvrages, appareils, canalisations : cf import par batch
DROP FUNCTION IF EXISTS raepa.import_gabarit_dans_raepa(TEXT, TEXT, TEXT, TEXT, TEXT, TEXT);
CREATE OR REPLACE FUNCTION raepa.import_gabarit_dans_tables_temporaires(
    in_anfinpose text, in_qualglocxy text, in_qualglocz text, in_etat text,
    in_source_historique text, in_code_chantier text
)
RETURNS BOOLEAN AS
$BODY$
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
        ST_Transform(geom, 2154)
    FROM imports.gabarit_canalisations AS c
    ;

    RETURN TRUE;

END;
$BODY$
LANGUAGE plpgsql
COST 100;

DROP FUNCTION IF EXISTS raepa.import_tables_temporaires_dans_raepa();
DROP FUNCTION IF EXISTS raepa.import_tables_temporaires_dans_raepa(TEXT, TEXT);
CREATE OR REPLACE FUNCTION raepa.import_tables_temporaires_dans_raepa(
    in_source_historique text, in_code_chantier TEXT, nettoyer_chantier BOOLEAN
)
RETURNS BOOLEAN AS
$BODY$
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
$BODY$
LANGUAGE plpgsql
COST 100;


COMMIT;
