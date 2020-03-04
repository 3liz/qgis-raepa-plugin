BEGIN;

-- Adding fields: _ferme  and _orientation
ALTER TABLE raepa.raepa_apparaep_p
ADD COLUMN IF NOT EXISTS _ferme boolean DEFAULT false NOT NULL,
ADD COLUMN IF NOT EXISTS _orientation double precision;

COMMENT ON COLUMN raepa.raepa_apparaep_p._ferme IS 'Décrit si l''appareil est fermé ou non. True si l''appareil est fermé.';
COMMENT ON COLUMN raepa.raepa_apparaep_p._orientation IS 'Orientation de l''appareil en degrés.';

-- Function to calculate apparaep orientation
CREATE OR REPLACE FUNCTION raepa.calculate_apparaep_orientation(idappaep text)
RETURNS double precision AS $$
BEGIN
    UPDATE raepa.raepa_apparaep_p ap SET _orientation =
    (
        SELECT
        CASE
            WHEN ST_LineLocatePoint(c.geom, p.geom) > 0.1 AND ST_LineLocatePoint(c.geom, p.geom) < 0.9
                THEN round(CAST(degrees(ST_Azimuth(ST_StartPoint(ST_LineSubstring(c.geom, ST_LineLocatePoint(c.geom, p.geom) - 0.1, ST_LineLocatePoint(c.geom, p.geom) + 0.1)),
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

ALTER TABLE raepa.raepa_apparaep_p ADD COLUMN IF NOT EXISTS _observation text;
ALTER TABLE raepa.raepa_apparass_p ADD COLUMN IF NOT EXISTS _observation text;
ALTER TABLE raepa.raepa_canalaep_l ADD COLUMN IF NOT EXISTS _observation text;
ALTER TABLE raepa.raepa_canalass_l ADD COLUMN IF NOT EXISTS _observation text;
ALTER TABLE raepa.raepa_ouvraep_p  ADD COLUMN IF NOT EXISTS _observation text;
ALTER TABLE raepa.raepa_ouvrass_p  ADD COLUMN IF NOT EXISTS _observation text;

COMMENT ON COLUMN raepa.raepa_apparaep_p._observation IS 'Observations diverses sur l''objet. Texte libre.';
COMMENT ON COLUMN raepa.raepa_apparass_p._observation IS 'Observations diverses sur l''objet. Texte libre.';
COMMENT ON COLUMN raepa.raepa_canalaep_l._observation IS 'Observations diverses sur l''objet. Texte libre.';
COMMENT ON COLUMN raepa.raepa_canalass_l._observation IS 'Observations diverses sur l''objet. Texte libre.';
COMMENT ON COLUMN raepa.raepa_ouvraep_p._observation  IS 'Observations diverses sur l''objet. Texte libre.';
COMMENT ON COLUMN raepa.raepa_ouvrass_p._observation  IS 'Observations diverses sur l''objet. Texte libre.';

COMMIT;
