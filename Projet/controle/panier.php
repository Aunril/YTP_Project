<?php 

/*contrôleur panier.php :
  affichage du panier
*/

function afficherPanier(){
	require ("modele/panierBD.php");
	if(isset($_SESSION['profil'])){
		$id=$_SESSION['profil']['id_client'];
		$produits=produit_recap($id);
		$prix_total=prix_total($id);
		require("vue/panier.tpl");
	}
}

function payer(){
	require ("modele/panierBD.php");
	if(isset($_SESSION['profil'])){
		$id=$_SESSION['profil']['id_client'];
		$prix_total=prix_total($id);
		require("vue/payer.tpl");
	}
}


?>
