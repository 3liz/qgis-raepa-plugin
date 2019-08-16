BEGIN;

-- Add fake ouvrage for import purpose, when ouvrage does not exists (fk constraints)
ALTER TABLE raepa.raepa_ouvrass_p DISABLE TRIGGER ALL;
INSERT INTO raepa.raepa_ouvrass_p (id, idouvrage, x ,y ,mouvrage ,gexploit ,typreseau ,fnouvass ,anfinpose ,idcanamont ,idcanaval ,qualglocxy, qualglocz,datemaj ,sourmaj ,geom) VALUES ( -1, 'INCONNU', 0, 0, '', '', '01', '01', 2018, 'INCONNU', 'INCONNU', '01', '01', now()::date, '', ST_SetSrid(ST_MakePoint(0, 0), 2154) ) ON CONFLICT DO NOTHING;
ALTER TABLE raepa.raepa_ouvrass_p ENABLE TRIGGER ALL;

COMMIT;
