BEGIN;

SET search_path TO raepa,public;

------------
-- OUVRAGES
------------

-- Modification des valeures de l'ouvrage
CREATE OR REPLACE FUNCTION raepa.trg_avant_modification_ouvrage()
RETURNS trigger AS
$BODY$
DECLARE
    organisme text;
BEGIN

    -- Calcul de l'identifiant si besoin
    IF NEW.idouvrage IS NULL OR trim(NEW.idouvrage) = '' OR NEW.idouvrage NOT LIKE 'cas%' THEN
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
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

DROP TRIGGER IF EXISTS raepa_avant_modification_ouvrage ON raepa.raepa_ouvrass_p;
CREATE TRIGGER raepa_avant_modification_ouvrage
BEFORE INSERT OR UPDATE
ON raepa.raepa_ouvrass_p
FOR EACH ROW
EXECUTE PROCEDURE raepa.trg_avant_modification_ouvrage();





-- Modification des canalisations après modification de l'ouvrage
CREATE OR REPLACE FUNCTION raepa.trg_apres_modification_ouvrage()
RETURNS trigger AS
$BODY$
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
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

DROP TRIGGER IF EXISTS raepa_apres_modification_ouvrage ON raepa.raepa_ouvrass_p;
CREATE TRIGGER raepa_apres_modification_ouvrage
AFTER INSERT OR UPDATE
ON raepa.raepa_ouvrass_p
FOR EACH ROW
EXECUTE PROCEDURE raepa.trg_apres_modification_ouvrage();


----------------
-- APPAREILS
-----------------
-- Modification des valeures de l'appareil
CREATE OR REPLACE FUNCTION raepa.trg_avant_modification_appareil()
RETURNS trigger AS
$BODY$
DECLARE
    organisme text;
BEGIN

    -- Calcul de l'identifiant si besoin
    IF NEW.idappareil IS NULL OR trim(NEW.idappareil) = '' OR NEW.idappareil NOT LIKE 'cas%' THEN
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
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

DROP TRIGGER IF EXISTS raepa_avant_modification_appareil ON raepa.raepa_apparass_p;
CREATE TRIGGER raepa_avant_modification_appareil
BEFORE INSERT OR UPDATE
ON raepa.raepa_apparass_p
FOR EACH ROW
EXECUTE PROCEDURE raepa.trg_avant_modification_appareil();



----------------
-- CANALISATIONS
----------------


-- Avant ajout ou modification d'une canalisation :
-- valeurs par défaut, métadonnées, champs calculé et récupération idnini et idnterm
CREATE OR REPLACE FUNCTION raepa.trg_avant_ajout_ou_modification_canalisation()
RETURNS trigger AS
$BODY$
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
    IF NEW.idcana NOT LIKE 'cas%' THEN
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
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

DROP TRIGGER IF EXISTS raepa_avant_ajout_ou_modification_canalisation ON raepa.raepa_canalass_l;
CREATE TRIGGER raepa_avant_ajout_ou_modification_canalisation
BEFORE INSERT OR UPDATE
ON raepa.raepa_canalass_l
FOR EACH ROW
EXECUTE PROCEDURE raepa.trg_avant_ajout_ou_modification_canalisation();


COMMIT;
