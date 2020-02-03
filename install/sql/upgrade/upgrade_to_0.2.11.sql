BEGIN;

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

COMMIT;