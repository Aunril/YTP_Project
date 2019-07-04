<?php

function informationsBDD(){
	require ("modele/administrateurBD.php");
	//if(isset($_SESSION['profil'])){
		$clients=liste_clients();
		$produits=liste_produits();
		require("vue/admin/accueil_admin.tpl");
	//}
}

function afficherProduit(){
	require ("modele/produitsBD.php");
	if(isset($_GET['id'])){
		$id=$_GET['id'];
		$informations=infos_Produit($id);
		$images=images_Produit($id);
		require("vue/admin/produit_admin.tpl");
	}
}

?>