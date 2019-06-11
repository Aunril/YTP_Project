<?php 

/*contrôleur produits.php :
  affichage des produits
*/

function afficherProduit(){
	require ("modele/produitsBD.php");
	$informations=infos_Produit(1);
	$images=images_Produit(1);
	require("vue/produit.tpl");
}

?>