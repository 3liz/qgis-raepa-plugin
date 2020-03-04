## Automatic generation of structure SQL files

### Schema audit

The files inside the `audit` folder are taken from https://github.com/Oslandia/audit_trigger/blob/master/audit.sql

### Schema raepa

Generation of the `raepa` schema SQL files is made via

```bash
# Go to SQL folder
cd install/sql

# Run the export tool for service raepa and schema raepa
./export_database_structure_to_SQL.sh raepa raepa

# Optionnal - Replace SRID 32620 by 2154
find raepa/ -type f -name "*.sql" | xargs sed -i "s/32620/2154/g"
```

This script will remove and regenerate the SQL files based on the `pg_dump` tool, by connecting to the database referenced by the PostgreSQL service `raepa`. You need to pass 1st parameters `raepa` which is the name of the PostgreSQL service pointing to your database, and the 2nd parameter `raepa`, which is the name of the schema which will be used as the name of the target folder (relative to `install/sql`)

It splits the content of the SQL dump into one file per database object type:

* functions
* tables (and sequences, default values)
* views
* indexes
* triggers
* constraints (pk, unique, fk, etc.)
* comments


### Schema imports

This schema is created manually via the file [00_initialize_database](install/sql/00_initialize_database.sql)

### Installation from an existing dump

* `createdb raepa`
* Create the PostgreSQL service
* In QGIS, you must create a connexion to your PostGIS database.
* Then use the `Configure Raepa plugin` to set the connexion name.
* `psql service=raepa < ~/Téléchargements/bdd_raepa_capex.sql`
