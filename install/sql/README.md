## Automatic generation of structure SQL files

### Schema audit

The files inside the `audit` folder are taken from https://github.com/Oslandia/audit_trigger/blob/master/audit.sql

### Schema raepa

Generation of the `raepa` schema SQL files is made via

```bash

cd install/sql
./export_database_structure_to_SQL.sh raepa
```

This script will remove and regenerate the SQL files based on the `pg_dump` tool, by connecting to the database referenced by the PostgreSQL service `raepa`. You need to pass the parameter `raepa`, which is the name of the schema, and the name of the target folder (relative to `install/sql`)

It splits the content of the SQL dump into one file per database object type:

* functions
* tables (and comments, sequences, default values)
* views
* indexes
* triggers
* constraints (pk, unique, fk, etc.)

TODO 
NB: if you have a SRID different from 2154, use this kind of sed command to replace your SRID by 2154

```bash
sed -i "s/32620/2154/g" raepa/10_FUNCTION.sql 
sed -i "s/32620/2154/g" raepa/20_TABLE_COMMENT_SEQUENCE_DEFAULT.sql 
sed -i "s/32620/2154/g" raepa/30_VIEW.sql 
sed -i "s/32620/2154/g" raepa/40_INDEX.sql 
sed -i "s/32620/2154/g" raepa/50_TRIGGER.sql 
sed -i "s/32620/2154/g" raepa/60_CONSTRAINT.sql 
sed -i "s/32620/2154/g" raepa/90_GLOSSARY.sql 
```

### Schema imports

This schema is created manually via the file [00_initialize_database](install/sql/00_initialize_database.sql)

### Installation from an existing dump

* `createdb raepa`
* Create the PostgreSQL service
* In QGIS, you must create a connexion to your PostGIS database.
* Then use the `Configure Raepa plugin` to set the connexion name.
* `psql service=raepa < ~/Téléchargements/bdd_raepa_capex.sql`
