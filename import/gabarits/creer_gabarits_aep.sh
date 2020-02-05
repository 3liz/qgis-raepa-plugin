#!/bin/bash


# appareils
# psql service=raepa -c "SELECT column_name FROM information_schema.columns WHERE table_schema = 'raepa' AND table_name = 'raepa_apparass_p' AND column_name NOT LIKE '\_%'"
ogr2ogr -overwrite -f "ESRI Shapefile" gabarit_appareils_aep.shp PG:"service=raepa" -sql "SELECT idappareil, x, y, mouvrage, gexploit, typreseau, fnappass, andebpose, anfinpose, diametre, idcanamont, idcanaval, idcanppale, idouvrage, z, qualglocxy, qualglocz, datemaj, sourmaj, qualannee, dategeoloc, sourgeoloc, sourattrib, geom FROM raepa.raepa_apparass_p LIMIT 0"

# canalisations
# psql service=raepa -c "SELECT column_name FROM information_schema.columns WHERE table_schema = 'raepa' AND table_name   = 'raepa_canalaep_l' AND column_name NOT LIKE '\_%'"
ogr2ogr -overwrite -f "ESRI Shapefile" gabarit_canalisations_aep.shp PG:"service=raepa" -sql "SELECT idcana, mouvrage, gexploit, enservice, branchemnt, materiau, diametre, anfinpose, modecirc, contcanaep, fonccanaep, idnini, idnterm, idcanppale, profgen, andebpose, longcana, nbranche, qualglocxy, qualglocz, datemaj, sourmaj, qualannee, dategeoloc, sourgeoloc, sourattrib, geom
 FROM raepa.raepa_canalaep_l LIMIT 0"

# ouvrages
# psql service=raepa -c "SELECT column_name FROM information_schema.columns WHERE table_schema = 'raepa'AND table_name   = 'raepa_ouvraep_p' AND column_name NOT LIKE '\_%'"
ogr2ogr -overwrite -f "ESRI Shapefile" gabarit_ouvrages_aep.shp PG:"service=raepa" -sql "SELECT idouvrage, x, y, mouvrage, gexploit, fnouvaep, anfinpose, idcanamont, idcanaval, idcanppale, z, andebpose, qualglocxy, qualglocz, datemaj, sourmaj, qualannee, dategeoloc, sourgeoloc, sourattrib, geom FROM raepa.raepa_ouvraep_p LIMIT 0"
