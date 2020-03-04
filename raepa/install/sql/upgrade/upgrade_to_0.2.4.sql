BEGIN;

-- trg_apres_modification_ouvrage()
CREATE OR REPLACE FUNCTION raepa.trg_apres_modification_ouvrage() RETURNS trigger
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
    IF ( TG_TABLE_NAME = 'raepa_canalass_l' AND TG_OP = 'UPDATE' AND ( NOT ST_Equals(NEW.geom, OLD.geom) OR OLD.zamont != NEW.zamont OR OLD.zaval != NEW.zaval ) )
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



COMMIT;