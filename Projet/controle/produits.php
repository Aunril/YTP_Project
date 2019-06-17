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

?>