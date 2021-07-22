---
hide:
  - navigation
---

# Processing

## Outils


### Ajouter des vues SQL

Ajouter des requêtes SQL dans le canevas.

Ces requêtes sont des fichiers dans le plugin.

![algo_id](./raepa-add_sql_layers.png)

#### Parameters

| ID | Description | Type | Info | Required | Advanced | Option |
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
FILES|Requêtes|Enum||✓||Values: Culs de sac <br>|


#### Outputs

| ID | Description | Type | Info |
|:-:|:-:|:-:|:-:|
OUTPUT|Sortie|MultipleLayers||


***


### Annuler la dernière modification

Annule la dernière modification sur la base de données.

![algo_id](./raepa-cancel_last_modification.png)

#### Parameters

| ID | Description | Type | Info | Required | Advanced | Option |
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
SOURCE_LAYER|Source layer|VectorLayer||✓||Type:  <br>|
SOURCE_ID|Unique ID (id)|String||✓||Default: -1 <br> |


#### Outputs

| ID | Description | Type | Info |
|:-:|:-:|:-:|:-:|
OUTPUT_STATUS|Statut de sortie|Number||
OUTPUT_STRING|Message de sortie|String||


***


### Execute SQL

Exécuter du SQL dans la base de données.

![algo_id](./raepa-execute_sql.png)

#### Parameters

| ID | Description | Type | Info | Required | Advanced | Option |
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
INPUT_SQL|INPUT_SQL|String|||||


#### Outputs

| ID | Description | Type | Info |
|:-:|:-:|:-:|:-:|
OUTPUT_STATUS|Statut de sortie|Number||
OUTPUT_STRING|Message de sortie|String||


***


### Obtenir les gabarits AEP/ASS

Obtenir un zip des gabarits AEP/ASS

![algo_id](./raepa-gabarits.png)

#### Parameters

| ID | Description | Type | Info | Required | Advanced | Option |
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
TYPE|Type de gabarits|Enum||✓||Values: ASS, AEP <br>|
CRS|Projection|Enum||✓||Values: EPSG:2154, EPSG:32620 <br>|
DESTINATION|Fichier ZIP|FileDestination||✓|||


#### Outputs

| ID | Description | Type | Info |
|:-:|:-:|:-:|:-:|
DESTINATION|Fichier ZIP|File||


***


### Récupération réseau aval

Obtenir le réseau en aval d'un ouvrage

![algo_id](./raepa-get_downstream_route.png)

#### Parameters

| ID | Description | Type | Info | Required | Advanced | Option |
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
OUTPUT_LAYER_NAME|Nom de la couche de sortie|String|||||
SOURCE_ID|Unique ID (idouvrage)|String||✓||Default: -1 <br> |
METHOD|Méthode|Enum||✓||Values: geom, attribute <br>|


#### Outputs

| ID | Description | Type | Info |
|:-:|:-:|:-:|:-:|
OUTPUT_STATUS|Statut de sortie|Number||
OUTPUT_STRING|Message de sortie|String||
OUTPUT_LAYER|Couche de sortie|VectorLayer||
OUTPUT_LAYER_RESULT_NAME|Nom de la couche de sortie|String||


***


### Réseau vers une vanne

Charger une couche vecteur

![algo_id](./raepa-get_network_to_vanne.png)

#### Parameters

| ID | Description | Type | Info | Required | Advanced | Option |
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
OUTPUT_LAYER_NAME|Nom de la couche de sortie|String|||||
SOURCE_ID|Unique ID (idcana)|String||✓||Default: -1 <br> |


#### Outputs

| ID | Description | Type | Info |
|:-:|:-:|:-:|:-:|
OUTPUT_STATUS|Statut de sortie|Number||
OUTPUT_STRING|Message de sortie|String||
OUTPUT_LAYER|Couche de sortie|VectorLayer||
OUTPUT_LAYER_RESULT_NAME|Nom de la couche de sortie|String||


***


### Parcours réseau jusqu'aux vannes fermées depuis un point

Charger une couche vecteur

![algo_id](./raepa-get_network_to_vanne_ferme_from_point.png)

#### Parameters

| ID | Description | Type | Info | Required | Advanced | Option |
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
OUTPUT_LAYER_NAME|Nom de la couche de sortie|String|||||
POINT|Point de départ|Point||✓|||


#### Outputs

| ID | Description | Type | Info |
|:-:|:-:|:-:|:-:|
OUTPUT_STATUS|Statut de sortie|Number||
OUTPUT_STRING|Message de sortie|String||
OUTPUT_LAYER|Couche de sortie|VectorLayer||
OUTPUT_LAYER_RESULT_NAME|Nom de la couche de sortie|String||


***


### Parcours réseau jusqu'aux vannes depuis un point

Charger une couche vecteur

![algo_id](./raepa-get_network_to_vanne_from_point.png)

#### Parameters

| ID | Description | Type | Info | Required | Advanced | Option |
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
OUTPUT_LAYER_NAME|Nom de la couche de sortie|String|||||
POINT|Point de départ|Point||✓|||


#### Outputs

| ID | Description | Type | Info |
|:-:|:-:|:-:|:-:|
OUTPUT_STATUS|Statut de sortie|Number||
OUTPUT_STRING|Message de sortie|String||
OUTPUT_LAYER|Couche de sortie|VectorLayer||
OUTPUT_LAYER_RESULT_NAME|Nom de la couche de sortie|String||


***


### Orientation appareil

Obtenir l'orientation d'un appareil.

![algo_id](./raepa-get_orientation_appareil.png)

#### Parameters

| ID | Description | Type | Info | Required | Advanced | Option |
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
SOURCE_ID|Unique ID (idappareil)|String||✓||Default: -1 <br> |


#### Outputs

| ID | Description | Type | Info |
|:-:|:-:|:-:|:-:|
OUTPUT_STATUS|Statut de sortie|Number||
OUTPUT_STRING|Message de sortie|String||


***


### Récupération réseau amont

Obtenir le réseau en amont d'un ouvrage

![algo_id](./raepa-get_upstream_route.png)

#### Parameters

| ID | Description | Type | Info | Required | Advanced | Option |
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
OUTPUT_LAYER_NAME|Nom de la couche de sortie|String|||||
SOURCE_ID|Unique ID (idouvrage)|String||✓||Default: -1 <br> |
METHOD|Méthode|Enum||✓||Values: geom, attribute <br>|


#### Outputs

| ID | Description | Type | Info |
|:-:|:-:|:-:|:-:|
OUTPUT_STATUS|Statut de sortie|Number||
OUTPUT_STRING|Message de sortie|String||
OUTPUT_LAYER|Couche de sortie|VectorLayer||
OUTPUT_LAYER_RESULT_NAME|Nom de la couche de sortie|String||


***


## Configuration


### Charger les styles des couches

Ajoute les styles et/ou les actions par défaut pour chacune des couches.

![algo_id](./raepa-add_styles.png)

#### Parameters

| ID | Description | Type | Info | Required | Advanced | Option |
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
APPARAEP|Couche Appareil AEP|VectorLayer||||Type: TypeVectorPoint <br>|
APPARASS|Couche Appareil ASS|VectorLayer||||Type: TypeVectorPoint <br>|
OUVRAEP|Couche Ouvrage AEP|VectorLayer||||Type: TypeVectorPoint <br>|
OUVRASS|Couche Ouvrage ASS|VectorLayer||||Type: TypeVectorPoint <br>|
CANALAEP|Couche Canalisation AEP|VectorLayer||||Type: TypeVectorLine <br>|
CANALASS|Couche Canalisation ASS|VectorLayer||||Type: TypeVectorLine <br>|
STYLETYPE|Importer uniquement les actions|Enum||✓||Default: [1, 2] <br> Values: Tout, Actions, Forms <br>|


#### Outputs

| ID | Description | Type | Info |
|:-:|:-:|:-:|:-:|
No output

***


### Configurer le plugin RAEPA

Ajoute la variable "raepa_connection_name" à QGIS.

![algo_id](./raepa-configure_plugin.png)

#### Parameters

| ID | Description | Type | Info | Required | Advanced | Option |
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
CONNECTION_NAME|Connection PostgreSQL à la base à RAEPA|String||✓|||


#### Outputs

| ID | Description | Type | Info |
|:-:|:-:|:-:|:-:|
OUTPUT_STATUS|Statut de sortie|Number||
OUTPUT_STRING|Message de sortie|String||


***


### Charger le projet après génération de la base de données

Charger les couches de la base de données.

![algo_id](./raepa-load_project.png)

#### Parameters

| ID | Description | Type | Info | Required | Advanced | Option |
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
RIEN|Champ qui ne sert à rien|String|||||


#### Outputs

| ID | Description | Type | Info |
|:-:|:-:|:-:|:-:|
OUTPUT_STRING|Message de sortie|String||
OUTPUT_LAYERS|Couches de sortie|MultipleLayers||


***


## Import


### 02 Conversion données importées dans le modèle RAEPA



![algo_id](./raepa-convert_imported_data.png)

#### Parameters

| ID | Description | Type | Info | Required | Advanced | Option |
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
ANNEE_FIN_POSE|Année de fin de pose|String||✓||Default: 2018 <br> |
QUALITE_XY|Qualité XY|String||✓||Default: A <br> |
QUALITE_Z|Qualité Z|String||✓||Default: A <br> |
ETAT|État|String||✓||Default: 00 <br> |
SOURCE_HISTORIQUE|Source historique|String||✓||Default: test <br> |
CODE_CHANTIER|Code Chantier|String||✓||Default: test <br> |


#### Outputs

| ID | Description | Type | Info |
|:-:|:-:|:-:|:-:|
OUTPUT_STATUS|Statut de sortie|Number||
OUTPUT_STRING|Message de sortie|String||


***


### 01 Import des SHP dans les tables temporaires

Import des données vecteurs dans la base de données PostGIS.

![algo_id](./raepa-import_shapefile.png)

#### Parameters

| ID | Description | Type | Info | Required | Advanced | Option |
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
APPAREILS|Appareils|VectorLayer||✓||Type:  <br>|
CANALISATIONS|Canalisations|VectorLayer||✓||Type:  <br>|
OUVRAGES|Ouvrages|VectorLayer||✓||Type:  <br>|


#### Outputs

| ID | Description | Type | Info |
|:-:|:-:|:-:|:-:|
OUTPUT_STATUS|Statut de sortie|Number||
OUTPUT_STRING|Message de sortie|String||


***


### 03 Insertion données converties



![algo_id](./raepa-insert_converted_data.png)

#### Parameters

| ID | Description | Type | Info | Required | Advanced | Option |
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
SOURCE_HISTORIQUE|Source historique|String||✓||Default: test <br> |
CODE_CHANTIER|Code Chantier|String||✓||Default: test <br> |
NETTOYER_AVANT_INSERTION|Nettoyer avant insertion|Boolean||✓||Default: True <br> |


#### Outputs

| ID | Description | Type | Info |
|:-:|:-:|:-:|:-:|
OUTPUT_STATUS|Statut de sortie|Number||
OUTPUT_STRING|Message de sortie|String||


***


## Structure


### Création de la structure BDD

Crée la base de données avec les schémas et les tables.

![algo_id](./raepa-create_database_structure.png)

#### Parameters

| ID | Description | Type | Info | Required | Advanced | Option |
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
OVERRIDE|Écraser les schémas raepa,audit et import et toutes les données ? ** ATTENTION **|Boolean||✓|||
ADD_AUDIT|Ajouter un audit de suivi des modifications sur les tables ?|Boolean||✓||Default: True <br> |
SRID|Projection des géométries|Crs||✓||Default: EPSG:2154 <br> |
NOM|Nom du gestionnaire|String||✓||Default: Communauté d'Agglomération de Test <br> |
SIREN|SIREN|String||✓||Default: 123456789 <br> |
CODE|Nom abbrégé en 3 caractères|String||✓||Default: cat <br> |


#### Outputs

| ID | Description | Type | Info |
|:-:|:-:|:-:|:-:|
OUTPUT_STATUS|Statut de sortie|Number||
OUTPUT_STRING|Message de sortie|String||


***


### Mise à jour de la structure de la BDD

Applique les migrations SQL nécéssaires sur la base de données. Cela est à faire lors d'une mise à jour du plugin.

![algo_id](./raepa-upgrade_database_structure.png)

#### Parameters

| ID | Description | Type | Info | Required | Advanced | Option |
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
RUN_MIGRATIONS|Cocher cette case pour faire la mise à jour. Autrement, aucune action ne se passera.|Boolean||✓|||
SRID|Projection des géométries|Crs||✓||Default: EPSG:2154 <br> |


#### Outputs

| ID | Description | Type | Info |
|:-:|:-:|:-:|:-:|
OUTPUT_STATUS|Statut de sortie|Number||
OUTPUT_STRING|Message de sortie|String||


***


## Export


### Exporter les données en geopackage

Exporte toutes les couches du canvas qui appartiennent au service PostgreSQL dans un fichier SQLite. Un CRS peut-être spécifié.

![algo_id](./raepa-export_package.png)

#### Parameters

| ID | Description | Type | Info | Required | Advanced | Option |
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
PGSERVICE|PostgreSQL Service|String||✓||Default: raepa <br> |
SRID|Projection|Crs||✓||Default: EPSG:32620 <br> |
DESTINATION|Fichier SQLite|FileDestination||✓|||


#### Outputs

| ID | Description | Type | Info |
|:-:|:-:|:-:|:-:|
DESTINATION|Fichier SQLite|File||


***

