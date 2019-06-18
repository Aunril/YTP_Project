<?php 

/*contrôleur produits.php :
  affichage des produits
*/

function afficherProduit(){
	require ("modele/produitsBD.php");

	if(isset($_GET['id'])){
		$id=$_GET['id'];
		$informations=infos_Produit($id);
		$images=images_Produit($id);
		require("vue/produit.tpl");
	}
}

function afficherDC(){
	require ("modele/produitsBD.php");

	$listeProduits=liste_Produits("DC comics");
	require("vue/DCcomics.tpl");
}

function afficherMarvel(){
	require ("modele/produitsBD.php");

	$listeProduits=liste_Produits("marvel");
	require("vue/marvel.tpl");
}

?>