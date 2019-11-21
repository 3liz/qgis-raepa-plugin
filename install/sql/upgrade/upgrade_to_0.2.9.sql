-- FUNCTION: raepa.network_to_end(text)

-- DROP FUNCTION raepa.network_to_end(text);

CREATE OR REPLACE FUNCTION raepa.network_to_end(
	cana text)
    RETURNS geometry
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$DECLARE
  parcours public.geometry;
BEGIN
WITH RECURSIVE walk_network(idcana, all_parents, geom, stop) AS (
        SELECT c.idcana::text,
        array[c.idcana::text] as all_parents,
        c.geom as geom,
		false as stop
        FROM raepa.raepa_canalaep_l c
        WHERE idcana = cana
    UNION ALL
        SELECT
		n.idcana,
        -- Ajout de la canalisation dans le tableau pour éviter les requêtes infinies
        w.all_parents || n.idcana::text AS all_parents,
        
        -- Découpe de la canalisation si on rencontre un appareil
        -- sinon on renvoit la géométrie
        CASE
            WHEN  a.idappareil IS NOT NULL AND ST_Dwithin(st_startpoint(w.geom), st_endpoint(n.geom), 0.05)
                THEN ST_Line_Substring( n.geom, ST_Line_Locate_Point( n.geom, a.geom ), 1 )::geometry(LineString,32620)
            WHEN  a.idappareil IS NOT NULL AND ST_Dwithin(st_startpoint(n.geom), st_endpoint(w.geom), 0.05)
                THEN ST_Line_Substring( n.geom, 0, ST_Line_Locate_Point( n.geom, a.geom ) )::geometry(LineString,32620)
            ELSE n.geom::geometry(LineString,32620)
        END AS geom,
        -- Ajout d'un champ pour savoir s'il faut stopper le parcours
        CASE
            WHEN o.idouvrage IS NOT NULL THEN True
            WHEN a.idappareil IS NOT NULL THEN True
            ELSE False
        END AS stop
        FROM raepa.raepa_canalaep_l AS n
        LEFT OUTER JOIN raepa.raepa_apparaep_p a
            ON ( fnappaep = '03' AND ST_Dwithin(n.geom, a.geom, 0.05) AND _ferme = true)
        LEFT OUTER JOIN raepa.raepa_ouvraep_p o
            ON (
                (fnouvaep = '03' OR fnouvaep = '05' OR fnouvaep = '01')
                AND
                ST_Dwithin(n.geom, o.geom, 0.05)
            ),
        walk_network AS w
        WHERE TRUE
        AND (
            ST_Dwithin(st_startpoint(w.geom), st_endpoint(n.geom), 0.5)
            OR ST_Dwithin(st_startpoint(n.geom), st_endpoint(w.geom), 0.5)
        )
        AND n.idcana <> ALL (w.all_parents)
)
SELECT ST_Union(DISTINCT wn.geom) AS geom
INTO parcours
FROM walk_network wn
WHERE stop IS NOT True;

  RETURN parcours;
END;
$BODY$;

ALTER FUNCTION raepa.network_to_end(text)
    OWNER TO pdrillin;

COMMIT;
