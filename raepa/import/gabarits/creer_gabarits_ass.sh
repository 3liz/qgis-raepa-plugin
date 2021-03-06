#!/bin/bash

if [ $# -eq 0 ]
then
  PROJECTION=2154
else
  PROJECTION=$1
fi

# appareils
ogr2ogr -overwrite -f "ESRI Shapefile" -a_srs "EPSG:${PROJECTION}" gabarit_appareils_ass.shp PG:"service=raepa" -sql "SELECT 'ABCDEF' AS idappareil, '' AS typreseau, '' AS fnappass, 0 AS diametre, 'ABCDEF' AS idouvrage, 0 AS z_appareil, ST_Setsrid(ST_MakePoint(0,0),2154) AS geom FROM raepa.raepa_apparass_p LIMIT 0"

# canalisations
ogr2ogr -overwrite -f "ESRI Shapefile" -a_srs "EPSG:${PROJECTION}" gabarit_canalisations_ass.shp PG:"service=raepa" -sql "SELECT 'N' AS branchemnt, '' AS typreseau, '' AS materiau, '' AS forme, 0 AS dim_v, 0 AS dim_h, '' AS mode_circ, '' AS fonccanass, '' AS id_nd_aval, '' AS id_nd_amon, 0 AS fe_amont, 0 AS fe_aval, 0 AS nbranche,  ST_Setsrid(ST_MakeLine(ST_MakePoint(0,0),ST_MakePoint(1,1)),2154) AS geom FROM raepa.raepa_canalass_l LIMIT 0"

# ouvrages
ogr2ogr -overwrite -f "ESRI Shapefile" -a_srs "EPSG:${PROJECTION}" gabarit_ouvrages_ass.shp PG:"service=raepa" -sql "SELECT 'ABCDEF' AS idouvrage, '' AS typreseau, '' AS fnouvass, 0 AS z_radier, 0 AS z_tampon, 0 AS angle_tamp, ST_Setsrid(ST_MakePoint(0,0),2154) AS geom FROM raepa.raepa_ouvrass_p LIMIT 0"

zip "gabarits_ass_${PROJECTION}.zip" gabarit_appareils_ass.* gabarit_ouvrages_ass.* gabarit_canalisations_ass.*
