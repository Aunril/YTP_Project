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
	require("vue/DCcomics.tpl");
}

function marvel(){
	require("vue/marvel.tpl");
}

function musique(){

}

function films(){

}

function panier(){

}

function produit(){
	require("vue/produit.tpl");
}


?>