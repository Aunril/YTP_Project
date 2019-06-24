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

function plus(){
	require ("modele/panierBD.php");
	if(isset($_SESSION['profil']) AND isset($_GET['id'])){
		$id=$_SESSION['profil']['id_client'];
		$id_produit=$_GET['id'];
		plusBD($id,$id_produit);
		test($id,$id_produit);
		afficherPanier2();
	}
}

function moins(){
	require ("modele/panierBD.php");
	if(isset($_SESSION['profil']) AND isset($_GET['id'])){
		$id=$_SESSION['profil']['id_client'];
		$id_produit=$_GET['id'];
		moinsBD($id,$id_produit);
		test($id,$id_produit);
		afficherPanier2();
	}
}

function afficherPanier2(){
	if(isset($_SESSION['profil'])){
		$id=$_SESSION['profil']['id_client'];
		$produits=produit_recap($id);
		$prix_total=prix_total($id);
		require("vue/panier.tpl");
	}
}

function test($id,$id_produit)
{
	$quantité=quantite($id,$id_produit);
	if ($quantité['quantité'] < 1)
	{
			supp_produit($id,$id_produit);
	}


}

function ajouter_panier()
{
	require ("modele/panierBD.php");
	if(isset($_SESSION['profil']) AND isset($_GET['id'])){
			$id= $_SESSION['profil']['id_client'];
			$id_produit= $_GET['id'];
			if(search($id,$id_produit))
			{
				plusBD($id,$id_produit);

			}
			else
			{
				ajouter_produit($id,$id_produit);
			}
			header("Location: index.php?controle=produits&action=afficherProduit&id=$id_produit");

	}
	else
	{
		require("vue/connexion.tpl");
	}
}

?>
