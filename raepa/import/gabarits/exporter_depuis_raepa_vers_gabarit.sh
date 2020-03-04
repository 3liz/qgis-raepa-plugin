# exporte les données d'une base vers des fichiers SHP au bon gabarit
# appareils
ogr2ogr -overwrite -f "ESRI Shapefile" export_appareils.shp PG:"service=raepa" -sql "SELECT idappareil, typreseau, fnappass, diametre, idouvrage, z AS z_appareil, geom FROM raepa.raepa_apparass_p"

# canalisations
ogr2ogr -overwrite -f "ESRI Shapefile" export_canalisations.shp PG:"service=raepa" -sql "SELECT branchemnt, typreseau, materiau, _forme, diametre AS dim_v, _dimensionhorizontale AS dim_h, modecirc, fonccanass, idnterm AS id_nd_aval, idnini AS id_nd_amon, zamont AS fe_amont, zaval AS fe_aval, nbranche, geom FROM raepa.raepa_canalass_l"

# ouvrages
ogr2ogr -overwrite -f "ESRI Shapefile" export_ouvrages.shp PG:"service=raepa" -sql "SELECT idouvrage, typreseau, fnouvass, z AS z_radier, _ztampon AS z_tampon, _angletampon AS angle_tamp, geom FROM raepa.raepa_ouvrass_p"

