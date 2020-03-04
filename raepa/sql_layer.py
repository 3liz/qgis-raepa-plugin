import os

from qgis.core import QgsVectorLayer

from processing.tools.postgis import uri_from_name

from .qgis_plugin_tools.tools.resources import resources_path

FOLDER = 'sql_layer'


class SqlLayer:

    @classmethod
    def scan_folder(cls, folder=FOLDER):
        sql_files = []
        for root, directories, files in os.walk(resources_path(folder)):
            for f in files:
                if f.lower().endswith('.sql'):
                    sql_files.append(os.path.join(resources_path(folder), f))
        return sql_files

    @classmethod
    def available_files(cls, connection_name, folder=FOLDER):
        sql_files = SqlLayer.scan_folder(folder)
        files = []
        for f in sql_files:
            files.append(SqlLayer(f, connection_name))
        return files

    def __init__(self, sql_path, connection_name):
        self.sql_path = sql_path
        self.connection = connection_name

        if not os.path.exists(self.sql_path):
            raise Exception('Path does not exist "{}"'.format(self.sql_path))

        self.name = None
        self.description = None
        self.pk = None
        self.sql = ''

        def clean_line(a):
            a = a.strip()
            a = a.replace('\n', '')
            a = a.replace('\t', '')
            return a

        with open(self.sql_path) as fp:
            lines = fp.readlines()
            for line in lines:
                if line.startswith('--name='):
                    name = line.split('--name=')[1]
                    self.name = clean_line(name)

                if line.startswith('--description='):
                    description = line.split('--description=')[1]
                    self.description = clean_line(description)

                if line.startswith('--geom='):
                    geom = line.split('--geom=')[1]
                    self.geom = clean_line(geom)

                if line.startswith('--pk='):
                    pk = line.split('--pk=')[1]
                    self.pk = clean_line(pk)

                if not line.startswith('--') and line != '':
                    # ugly hack
                    self.sql += line

        self.sql = self.sql.strip()
        if self.sql[-1] == ';':
            self.sql = self.sql[:-1]

        self.sql = '({})'.format(self.sql)

    def vector_layer(self):
        uri = uri_from_name(self.connection)
        uri.setDataSource('', self.sql, self.geom, '')
        uri.setKeyColumn(self.pk)
        layer = QgsVectorLayer(uri.uri(), self.name, 'postgres')
        return layer
