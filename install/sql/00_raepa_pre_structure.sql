BEGIN;

CREATE EXTENSION IF NOT EXISTS postgis;
CREATE EXTENSION IF NOT EXISTS hstore;
CREATE SCHEMA IF NOT EXISTS "raepa" ;
SET search_path TO raepa,public;

CREATE OR REPLACE FUNCTION raepa.generate_oid(table_name text)
  RETURNS text AS
$BODY$
DECLARE
  myrec_prefix record;
  myrec_shortcut record;
  myrec_seq record;
BEGIN

  -- first we have to get the OID prefix
  BEGIN
    SELECT concat(code, siren) AS prefix INTO myrec_prefix FROM raepa.sys_organisme_gestionnaire WHERE actif = TRUE;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
           RAISE EXCEPTION 'no active record found in table raepa.sys_organisme_gestionnaire';
        WHEN TOO_MANY_ROWS THEN
       RAISE EXCEPTION 'more than one active records found in table raepa.sys_organisme_gestionnaire';
  END;
  -- test if prefix is of correct length
  IF char_length(myrec_prefix.prefix) != 12 THEN
    RAISE EXCEPTION 'character length of prefix must be 12';
  END IF;

  --get table 6 char shortcut
  BEGIN
    SELECT concat(code, typereseau) AS shortcut INTO STRICT myrec_shortcut FROM raepa.sys_liste_table WHERE nom = table_name;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE EXCEPTION 'dictionary entry for table % not found', table_name;
        WHEN TOO_MANY_ROWS THEN
            RAISE EXCEPTION 'dictonary entry for table % not unique', table_name;
  END;

  --get sequence for table
  SELECT lastval() AS seqval INTO myrec_seq;
  IF NOT FOUND THEN
    RAISE EXCEPTION 'sequence for table % not found', table_name;
  END IF;

  -- return concatenated value
  RETURN myrec_prefix.prefix || myrec_shortcut.shortcut || to_char(myrec_seq.seqval,'FM000000');
END;
$BODY$
  LANGUAGE plpgsql STABLE
  COST 100;


COMMIT;
