-- calcul_orientation(text, double precision)
CREATE OR REPLACE FUNCTION raepa.calcul_orientation(cana text, pos double precision) RETURNS double precision
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

-- import_gabarit_dans_tables_temporaires(text, text, text, text, text, text)
DROP FUNCTION IF EXISTS raepa.import_gabarit_dans_tables_temporaires(in_anfinpose text, in_qualglocxy text, in_qualglocz text, in_etat text, in_source_historique text, in_code_chantier text);

CREATE OR REPLACE FUNCTION raepa.import_gabarit_dans_tables_temporaires(in_anfinpose text, in_qualglocxy text, in_qualglocz text, in_etat text, in_source_historique text, in_code_chantier text, in_type text) RETURNS boolean
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

-- import_tables_temporaires_dans_raepa(text, text, boolean,text)
DROP FUNCTION IF EXISTS raepa.import_tables_temporaires_dans_raepa(in_source_historique text, in_code_chantier text, nettoyer_chantier boolean);

CREATE OR REPLACE FUNCTION raepa.import_tables_temporaires_dans_raepa(in_source_historique text, in_code_chantier text, nettoyer_chantier boolean, in_type text) RETURNS boolean
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

-- trg_avant_modification_appareil()
CREATE OR REPLACE FUNCTION raepa.trg_avant_modification_appareil() RETURNS trigger
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

-- trg_avant_modification_reparation()
CREATE OR REPLACE FUNCTION raepa.trg_avant_modification_reparation() RETURNS trigger
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

-- raepa_reparass_p raepa_avant_modification_reparation
DROP TRIGGER IF EXISTS raepa_avant_modification_reparation ON raepa.raepa_reparass_p;
CREATE TRIGGER raepa_avant_modification_reparation BEFORE INSERT OR UPDATE ON raepa.raepa_reparass_p FOR EACH ROW EXECUTE PROCEDURE raepa.trg_avant_modification_reparation();

-- raepa_reparaep_p raepa_avant_modification_reparation
DROP TRIGGER IF EXISTS raepa_avant_modification_reparation ON raepa.raepa_reparaep_p;
CREATE TRIGGER raepa_avant_modification_reparation BEFORE INSERT OR UPDATE ON raepa.raepa_reparaep_p FOR EACH ROW EXECUTE PROCEDURE raepa.trg_avant_modification_reparation();

-- Ajout des champs source historique et code chantier
ALTER TABLE raepa.raepa_reparass_p ADD COLUMN IF NOT EXISTS _source_historique text;
ALTER TABLE raepa.raepa_reparass_p ADD COLUMN IF NOT EXISTS _code_chantier text;
ALTER TABLE raepa.raepa_reparass_p ADD COLUMN IF NOT EXISTS _temp_data public.hstore;

ALTER TABLE raepa.raepa_apparaep_p ADD COLUMN IF NOT EXISTS _source_historique text;
ALTER TABLE raepa.raepa_apparaep_p ADD COLUMN IF NOT EXISTS _code_chantier text;
ALTER TABLE raepa.raepa_apparaep_p ADD COLUMN IF NOT EXISTS _date_import text;
ALTER TABLE raepa.raepa_apparaep_p ADD COLUMN IF NOT EXISTS _temp_data public.hstore;

ALTER TABLE raepa.raepa_ouvraep_p ADD COLUMN IF NOT EXISTS _source_historique text;
ALTER TABLE raepa.raepa_ouvraep_p ADD COLUMN IF NOT EXISTS _code_chantier text;
ALTER TABLE raepa.raepa_ouvraep_p ADD COLUMN IF NOT EXISTS _date_import text;
ALTER TABLE raepa.raepa_ouvraep_p ADD COLUMN IF NOT EXISTS _temp_data public.hstore;

ALTER TABLE raepa.raepa_canalaep_l ADD COLUMN IF NOT EXISTS _source_historique text;
ALTER TABLE raepa.raepa_canalaep_l ADD COLUMN IF NOT EXISTS _code_chantier text;
ALTER TABLE raepa.raepa_canalaep_l ADD COLUMN IF NOT EXISTS _date_import text;
ALTER TABLE raepa.raepa_canalaep_l ADD COLUMN IF NOT EXISTS _temp_data public.hstore;

ALTER TABLE raepa.raepa_reparaep_p ADD COLUMN IF NOT EXISTS _source_historique text;
ALTER TABLE raepa.raepa_reparaep_p ADD COLUMN IF NOT EXISTS _code_chantier text;
ALTER TABLE raepa.raepa_reparaep_p ADD COLUMN IF NOT EXISTS _date_import text;
ALTER TABLE raepa.raepa_reparaep_p ADD COLUMN IF NOT EXISTS _temp_data public.hstore;