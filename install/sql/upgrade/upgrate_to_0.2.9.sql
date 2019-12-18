BEGIN;

-- Function to calculate apparaep orientation
DROP FUNCTION raepa.calculate_apparaep_orientation(idappaep text);
CREATE OR REPLACE PROCEDURE raepa.calculate_apparaep_orientation(idappaep text)
 AS $$
BEGIN
    UPDATE raepa.raepa_apparaep_p ap SET _orientation =
    (
        SELECT
        CASE
            WHEN ST_LineLocatePoint(c.geom, p.geom) > 0.1 AND ST_LineLocatePoint(c.geom, p.geom) < 0.9
                THEN round(CAST(degrees(ST_Azimuth(ST_StartPoint(ST_LineSubstring(c.geom, ST_LineLocatePoint(c.geom, p.geom) - 0.1;
                1, ST_LineLocatePoint(c.geom, p.geom) + 0.1)),
            ST_EndPoint(ST_LineSubstring(c.geom, ST_LineLocatePoint(c.geom, p.geom) - 0.1, ST_LineLocatePoint(c.geom, p.geom) + 0.1)))) as numeric),1)
            WHEN ST_LineLocatePoint(c.geom, p.geom) <= 0.1
                THEN round(CAST(degrees(ST_Azimuth(ST_StartPoint(ST_LineSubstring(c.geom, ST_LineLocatePoint(c.geom, p.geom), ST_LineLocatePoint(c.geom, p.geom) + 0.1)),
            ST_EndPoint(ST_LineSubstring(c.geom, ST_LineLocatePoint(c.geom, p.geom), ST_LineLocatePoint(c.geom, p.geom) + 0.1)))) as numeric), 2)
            WHEN ST_LineLocatePoint(c.geom, p.geom) >= 0.9
                THEN round(CAST(degrees(ST_Azimuth(ST_StartPoint(ST_LineSubstring(c.geom, ST_LineLocatePoint(c.geom, p.geom), ST_LineLocatePoint(c.geom, p.geom))),
            ST_EndPoint(ST_LineSubstring(c.geom, ST_LineLocatePoint(c.geom, p.geom), ST_LineLocatePoint(c.geom, p.geom))))) as numeric), 2)
        END
        FROM raepa.raepa_apparaep_p p
        JOIN raepa.raepa_canalaep_l c ON ST_DWithin(c.geom, p.geom, 0.05)
        WHERE p.idappareil = idappaep
    )
    WHERE ap.idappareil = idappaep;
END; $$
LANGUAGE PLPGSQL;

-- FUNCTION: raepa.network_to_end(text)
-- Permet de parcourir le réseau d'une canalisation aux vanne les plus proche.
-- DROP FUNCTION raepa.network_to_end(text);

CREATE OR REPLACE FUNCTION raepa.network_to_vanne(
	cana text)
    RETURNS geometry
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE
AS $BODY$
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
      WHEN  a.idappareil IS NOT NULL AND ST_Dwithin(st_startpoint(w.geom), st_endpoint(n.geom), 0.05) THEN ST_Line_Substring( n.geom, raepa.get_vanne_cana(n.idcana, false), 1 )::geometry(LineString,32620)
      WHEN  a.idappareil IS NOT NULL AND ST_Dwithin(st_startpoint(n.geom), st_endpoint(w.geom), 0.05) THEN ST_Line_Substring( n.geom, 0, raepa.get_vanne_cana(n.idcana, true) )::geometry(LineString,32620)
      ELSE n.geom::geometry(LineString,32620) END AS geom
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
$BODY$;

COMMENT ON FUNCTION raepa.nectwork_to_vanne (geometry) IS 'Parcours du réseau de canalisation d''eau potable à partir d''une canalisation jusqu''aux vannes les plus proches';
-- FUNCTION: raepa.get_vanne_cana(text, boolean)

-- DROP FUNCTION raepa.get_vanne_cana(text, boolean);

CREATE OR REPLACE FUNCTION raepa.get_vanne_cana(
	myid text,
	starter boolean)
    RETURNS double precision
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE
AS $BODY$DECLARE
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
END;$BODY$;

COMMENT ON FUNCTION raepa.get_vanne_cana (double precision) IS 'Calcul de la position de la vanne la plus proche sur une canalisation selon un point de départ (fin ou debut de canalisation)';

COMMIT;
