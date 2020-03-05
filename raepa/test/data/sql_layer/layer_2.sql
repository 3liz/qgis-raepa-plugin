--name=Layer 2 with fake QML
--description=Description 2
--pk=id
--geom=geom
SELECT '1' AS id, ST_GeomFromText('POINT(0 0)') as geom;
