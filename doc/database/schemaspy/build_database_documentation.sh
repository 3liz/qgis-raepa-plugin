#!/bin/sh
#
# Create documentation based on the SchemaSpy tool
# Ex: ./build_database_documentation.sh -h localhost -p 5432 -d raepa -u postgres -w ***** -o html
# LICENCE: GPL 2
# AUTHOR: 3LIZ

while getopts h:p:d:u:w:o: option
do
case "${option}"
in
h) DBHOST=${OPTARG};;
p) DBPORT=${OPTARG};;
d) DBNAME=${OPTARG};;
u) DBUSER=${OPTARG};;
w) DBPASS=${OPTARG};;
o) OUTPUTDIR=${OPTARG};;
esac
done

# Create HTML landing page with list of exported schemas
echo "<h3>G-Obs - List of database schemas</h3>" > $OUTPUTDIR/index.html

# On boucle sur les schemas
for SCHEMANAME in raepa; do

    # Remove existing directory
    rm -rf $OUTPUTDIR/$SCHEMANAME

    # Create directory
    mkdir -p $OUTPUTDIR/$SCHEMANAME

    # Run SchemaSpy for current schema
    java -jar schemaspy-6.0.0.jar -t pgsql-mat -dp postgresql-42.2.4.jar -host $DBHOST -port $DBPORT -db $DBNAME -u $DBUSER -p $DBPASS -s $SCHEMANAME -o $OUTPUTDIR/$SCHEMANAME

    # Add schema documentation file to index.html
    echo "<li><a href=$SCHEMANAME/index.html>$SCHEMANAME</a></li>" >> $OUTPUTDIR/index.html

done
