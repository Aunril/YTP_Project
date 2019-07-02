<?php

function informationsBDD(){
	require ("modele/administrateurBD.php");
	//if(isset($_SESSION['profil'])){
		$clients=liste_clients();
		require("vue/admin/accueil_admin.tpl");
	//}
}

?>