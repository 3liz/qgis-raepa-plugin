-- Adding fields: _ferme  and _orientation
ALTER TABLE raepa.raepa_apparaep_p
	ADD COLUMN _ferme boolean DEFAULT false NOT NULL,
	ADD COLUMN _orientation double precision;

-- Function to calculate apparaep orientation
CREATE OR REPLACE PROCEDURE raepa.calculate_apparaep_orientation(idappaep text)
RETURNS double precision AS $$
BEGIN
	UPDATE raepa.raepa_apparaep_p ap SET _orientation =
		(SELECT CASE
			 WHEN ST_LineLocatePoint(c.geom, p.geom) > 0.1 AND ST_LineLocatePoint(c.geom, p.geom) < 0.9 THEN round(CAST(degrees(ST_Azimuth(ST_StartPoint(ST_LineSubstring(c.geom, ST_LineLocatePoint(c.geom, p.geom) - 0.1, ST_LineLocatePoint(c.geom, p.geom) + 0.1)),
			     ST_EndPoint(ST_LineSubstring(c.geom, ST_LineLocatePoint(c.geom, p.geom) - 0.1, ST_LineLocatePoint(c.geom, p.geom) + 0.1)))) as numeric),1)
			 WHEN ST_LineLocatePoint(c.geom, p.geom) <= 0.1 THEN round(CAST(degrees(ST_Azimuth(ST_StartPoint(ST_LineSubstring(c.geom, ST_LineLocatePoint(c.geom, p.geom), ST_LineLocatePoint(c.geom, p.geom) + 0.1)),
			     ST_EndPoint(ST_LineSubstring(c.geom, ST_LineLocatePoint(c.geom, p.geom), ST_LineLocatePoint(c.geom, p.geom) + 0.1)))) as numeric), 2)
			 WHEN ST_LineLocatePoint(c.geom, p.geom) >= 0.9 THEN round(CAST(degrees(ST_Azimuth(ST_StartPoint(ST_LineSubstring(c.geom, ST_LineLocatePoint(c.geom, p.geom), ST_LineLocatePoint(c.geom, p.geom))),
			     ST_EndPoint(ST_LineSubstring(c.geom, ST_LineLocatePoint(c.geom, p.geom), ST_LineLocatePoint(c.geom, p.geom))))) as numeric), 2)
		   END
		FROM raepa.raepa_apparaep_p p
		JOIN raepa.raepa_canalaep_l c ON ST_DWithin(c.geom, p.geom, 0.05)
		WHERE p.idappareil = idappaep)
	WHERE ap.idappareil = idappaep;
END; $$
LANGUAGE PLPGSQL;

COMMIT;
