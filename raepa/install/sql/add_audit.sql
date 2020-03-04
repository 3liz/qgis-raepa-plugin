BEGIN;

TRUNCATE TABLE audit.logged_relations RESTART IDENTITY;
DROP TRIGGER IF EXISTS audit_trigger_row ON raepa.raepa_canalaep_l;
DROP TRIGGER IF EXISTS audit_trigger_row ON raepa.raepa_apparaep_p;
DROP TRIGGER IF EXISTS audit_trigger_row ON raepa.raepa_ouvraep_p;
DROP TRIGGER IF EXISTS audit_trigger_row ON raepa.raepa_reparaep_p;
DROP TRIGGER IF EXISTS audit_trigger_row ON raepa.raepa_canalass_l;
DROP TRIGGER IF EXISTS audit_trigger_row ON raepa.raepa_apparass_p;
DROP TRIGGER IF EXISTS audit_trigger_row ON raepa.raepa_ouvrass_p;
DROP TRIGGER IF EXISTS audit_trigger_row ON raepa.raepa_reparass_p;
DROP TRIGGER IF EXISTS audit_trigger_stm ON raepa.raepa_canalaep_l;
DROP TRIGGER IF EXISTS audit_trigger_stm ON raepa.raepa_apparaep_p;
DROP TRIGGER IF EXISTS audit_trigger_stm ON raepa.raepa_ouvraep_p;
DROP TRIGGER IF EXISTS audit_trigger_stm ON raepa.raepa_reparaep_p;
DROP TRIGGER IF EXISTS audit_trigger_stm ON raepa.raepa_canalass_l;
DROP TRIGGER IF EXISTS audit_trigger_stm ON raepa.raepa_apparass_p;
DROP TRIGGER IF EXISTS audit_trigger_stm ON raepa.raepa_ouvrass_p;
DROP TRIGGER IF EXISTS audit_trigger_stm ON raepa.raepa_reparass_p;

SELECT audit.audit_table((quote_ident(table_schema) || '.' || quote_ident(table_name))::text)
FROM information_schema.tables
WHERE TRUE
AND table_schema IN ( 'raepa' )
AND table_name IN (
    'raepa_canalaep_l',
    'raepa_apparaep_p',
    'raepa_ouvraep_p',
    'raepa_reparaep_p',
    'raepa_canalass_l',
    'raepa_apparass_p',
    'raepa_ouvrass_p',
    'raepa_reparass_p'
)
AND table_type = 'BASE TABLE'
AND table_name NOT IN (
    SELECT event_object_table
    FROM information_schema.triggers
    WHERE TRUE
    AND action_statement LIKE '% audit.%'
)
;

COMMIT;
