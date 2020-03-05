#!/bin/bash

echo 'Start docker-compose'
docker-compose up -d --force-recreate

echo 'Wait 10 seconds'
sleep 10

echo 'Installation of the plugin'
# docker exec -it qgis rm -f /root/.local/share/QGIS/QGIS3/profiles/default/python/plugins/raepa
# docker exec -it qgis ln -s /raepa /root/.local/share/QGIS/QGIS3/profiles/default/python/plugins/raepa
docker exec -it qgis sh -c "qgis_setup.sh raepa"
docker cp postgis_connections.ini qgis:/tmp
docker exec qgis bash -c "cat /tmp/postgis_connections.ini >> /root/.local/share/QGIS/QGIS3/profiles/default/QGIS/QGIS3.ini"

# echo 'Running tests'
# docker exec -it qgis sh -c "cd /tests_directory/raepa && qgis_testrunner.sh qgis_plugin_tools.infrastructure.test_runner.test_package"
# docker exec qgis qgis
# docker-compose kill
# docker-compose rm

echo 'DB is still running, QGIS is ready.'
