--name=Culs de sac
--description=Recherche des culs de sac sur le réseau
--pk=idcana
--geom=geom
SELECT c.idcana, ST_Length(c.geom) as longueur,
    CASE WHEN s.idcana IS NULL THEN st_startpoint(c.geom) WHEN e.idcana IS NULL THEN st_endpoint(c.geom) END AS geom
  FROM raepa.raepa_canalaep_l as c
    LEFT OUTER JOIN raepa.raepa_canalaep_l as s ON (s.idcana <> c.idcana AND
           (ST_Dwithin(st_startpoint(c.geom), st_endpoint(s.geom), 0.05) OR
                ST_Dwithin(st_startpoint(c.geom), st_startpoint(s.geom), 0.05)))
    LEFT OUTER JOIN raepa.raepa_canalaep_l as e ON (e.idcana <> c.idcana AND
           (ST_Dwithin(st_endpoint(c.geom), st_endpoint(e.geom), 0.05) OR
                ST_Dwithin(st_endpoint(c.geom), st_startpoint(e.geom), 0.05)))
  WHERE (s.idcana IS NULL OR e.idcana IS NULL) AND NOT (s.idcana IS NULL AND e.idcana IS NULL)
  ORDER BY longueur
