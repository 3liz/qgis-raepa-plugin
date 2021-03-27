BEGIN;

-- Add fake ouvrage for import purpose, when ouvrage does not exists (fk constraints)
ALTER TABLE raepa.raepa_ouvrass_p DISABLE TRIGGER ALL;
INSERT INTO raepa.raepa_ouvrass_p (id, idouvrage, x ,y ,mouvrage ,gexploit ,typreseau ,fnouvass ,anfinpose ,idcanamont ,idcanaval ,qualglocxy, qualglocz,datemaj ,sourmaj ,geom) VALUES ( -1, 'INCONNU', 0, 0, '', '', '01', '01', 2018, 'INCONNU', 'INCONNU', '01', '01', now()::date, '', ST_SetSrid(ST_MakePoint(0, 0), 2154) ) ON CONFLICT DO NOTHING;
ALTER TABLE raepa.raepa_ouvrass_p ENABLE TRIGGER ALL;

-- Add fake canalisation for import purpose, when ouvrage does not exists (fk constraints)
ALTER TABLE raepa.raepa_canalass_l DISABLE TRIGGER ALL;
INSERT INTO raepa.raepa_canalass_l (id, idcana, mouvrage, gexploit, enservice, branchemnt, typreseau, materiau, diametre, anfinpose, modecirc, contcanass, fonccanass, idnini, idnterm, qualglocxy, qualglocz, datemaj, sourmaj, geom) VALUES ( -1, 'INCONNU', '', '', 'N', 'N', '01', '00', 0, 2018, '00', '00', '00', 'INCONNU', 'INCONNU', '01', '01', now()::date, '', ST_SetSrid(ST_MakeLine(ST_MakePoint(0, 0), ST_MakePoint(0, 0)), 2154) ) ON CONFLICT DO NOTHING;
ALTER TABLE raepa.raepa_canalass_l ENABLE TRIGGER ALL;

-- Add audit
SELECT audit.audit_table('raepa.raepa_ouvrass_p');
SELECT audit.audit_table('raepa.raepa_apparass_p');
SELECT audit.audit_table('raepa.raepa_canalass_l');

COMMIT;
