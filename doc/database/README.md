## Introduction

Database structure is documented with SchemaSpy: http://schemaspy.org/.

This tool generates HTML files with information on schemas, tables, functions, constraints and provide graphical representation of the table relations.

## Documentation SchemaSpy

We created a small bash script to generate the documentation

```
~/.local/share/QGIS/QGIS3/profiles/default/python/plugins/raepa
mkdir -p doc/database/schemaspy/
cd doc/database/schemaspy/
chmod +x build_database_documentation.sh

# Run command with correct PostgreSQL service name
./build_database_documentation.sh -h localhost -p 5432 -d raepa -u postgres -w ***** -o html

```

Cela va créer un fichier `index.html` dans le répertoire `html/` avec un lien pour chacun des schémas vers la documentation.

NB: les binaires java peuvent être téléchargés ici:

* SchemaSpy: https://github.com/schemaspy/schemaspy/releases Par exemple `schemaspy-6.0.0.jar`
* Driver PostgreSQL: https://jdbc.postgresql.org/download.html Par exemple `postgresql-42.2.5.jar`
