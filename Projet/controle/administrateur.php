<?php

function informationsBDD(){
	require ("modele/administrateurBD.php");
	//if(isset($_SESSION['profil'])){
		$clients=liste_clients();
		$produits=liste_produits();
		require("vue/admin/accueil_admin.tpl");
	//}
}

?>