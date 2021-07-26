#Actions

##__1. Mise en place__

Pour pouvoir utiliser les actions disponibles via le plugin, il faut que vous les chargiez sur les différentes couches avec l'outil [Charger les styles](../Config/#22-charger-les-styles).
Il suffit d'y cocher la case `action` ou `tout` dans le choix des styles.

##__2. Utilisation__

Une fois que vous avez chargé les styles, avec l'outil `identifier des entitées` ![identifier des entités](../media/Icone_id_data.png) de Qgis vous pourrez
utiliser des fonctionnalités du plugin directement en cliquant sur les objets présents sur la carte.
<br/>- En effectuant un clique droit, vous avez directement accès aux actions disponibles :
![Actions via clique droit](../media/Action_CD.png)
<br/>- En effectuant un clique gauche vous y avez accès via le panneau [résultat de l'identification](https://docs.qgis.org/3.10/fr/docs/user_manual/introduction/general_tools.html#feature-information) :
![Actions via clique gauche](../media/Action_CG.png)

##__3. Les différentes actions__

###__3.1 annuler la dernière modification__

*(N'est disponible que pour les ouvrages)*<br/>
Cette action fonctionne de la même manière que l'outil [`annuler la dernière modification`](../Outils/#3-annuler-la-derniere-modification) 
Elle permet d'annuler la dernière modification de l'objet sur lequel vous avez cliqué. 

###__3.2 couper la canalisation sous cet ouvrage__

*(N'est disponible que pour les ouvrages)*<br/>
Permet, depuis un ouvrage se trouvant sur une canalisation unique, de découper cette canalisation en
deux tronçons de canalisation séparés par l'ouvrage. Dans l'exemple ci-dessous, la canalisation qui faisait à l'origine 
66m s'est coupée en deux canalisations d'une trentaine de mètre :<br/>
![ouvrage sur une canalisation](../media/ouv_sur_cana.png) ![canalisation découpée](../media/decoup_cana.png)

###__3.3 inverser la canalisation__

*(N'est disponible que pour les canalisations)*<br/>
Assurez-vous, avant d'utiliser cette action, de passer la couche souhaitée en mode édition,
sinon l'action ne fonctionnera pas et vous enverra un message d'erreur.<br/>
Cette action change le sens de la canalisation, elle permet de corriger des erreurs ou de mettre à jour les données après
une modification du réseau.<br/>
![canalisation droite](../media/cana_droite.png)
=>
![canalisation gauche](../media/cana_gauche.png)

###__3.4 parcourir le réseau depuis cet objet__

*(Disponible partout)*<br/>
Cette action execute les outils [`Récupération du réseau amont`](../Outils/#51-recuperation-du-reseau-amont)
et [`Récupération de réseau aval`](../Outils/#52-recuperation-de-reseau-aval) à partir de l'objet sélectionné :
![résultat](../media/action_parcour_reseau.png)

###__3.5 calcul de l'orientation de l'appareil__

*(N'est disponible que pour les appareils)*<br/>
De la même manière que l'outil [`Orientation d'un appareil`](../Outils/#2-orientation-dun-appareil) cette action permet de 
calculer l'orientation de la canalisation se trouvant sous l'appareil.

###__3.6 Parcourir le sous réseau jusqu'à une vanne__

*(N'est disponible que pour les canalisations)*<br/>
Fonctionne de la même manière que [`Réseau vers une vanne`](../Outils/#43-reseau-vers-une-vanne), détermine la plus petite 
partie du réseau pouvant être isolée par des vannes et contenant la canalisation initiale. Ignore les vannes présentes
sur la canalisation initiale.