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
