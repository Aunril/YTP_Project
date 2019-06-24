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

function afficherManga(){
	require ("modele/produitsBD.php");

	$listeProduits=liste_Produits("manga");
	require("vue/manga.tpl");
}

function afficherJeuxvideo(){
	require ("modele/produitsBD.php");

	$listeProduits=liste_Produits("Jeux vidéo");
	require("vue/jeuxvideo.tpl");
}

function afficherFilms(){
	require ("modele/produitsBD.php");

	$listeProduits=liste_Produits("Films-TV");
	require("vue/films.tpl");
}

function afficherMusique(){
	require ("modele/produitsBD.php");

	$listeProduits=liste_Produits("musique");
	require("vue/musique.tpl");
}

?>