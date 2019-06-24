<?php 

/*contrôleur menu.php :
  premier affichage du site boutique
*/

//premier affichage de la page
function accueil(){
	require("vue/accueil.tpl");
}

function compte(){
	if(!isset($_SESSION['profil'])){
		require("vue/connexion.tpl");
	}else{
		require("vue/compte.tpl");
	}
}

function DCcomics(){
	header("Location:index.php?controle=produits&action=afficherDC");
}

function marvel(){
	header("Location:index.php?controle=produits&action=afficherMarvel");
}

function manga(){
	header("Location:index.php?controle=produits&action=afficherManga");
}

function musique(){
	header("Location:index.php?controle=produits&action=afficherMusique");
}

function films(){
	header("Location:index.php?controle=produits&action=afficherFilms");
}

function jv(){
	header("Location:index.php?controle=produits&action=afficherJeuxvideo");
}

function produit(){
	require("vue/produit.tpl");
}


?>