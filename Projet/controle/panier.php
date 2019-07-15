<?php 

//panier.php : controleur qui permet de gérer les interactions liées au panier

/*
 * Fonction qui est lancée quand on ouvre le panier.
 * Elle récupère l'id de l'utilisateur et retourne la liste des produits dans le panier
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


/*
 * Fonction qui permet de récupérer le prix total des produits dans le panier
 */
function payer(){
	require ("modele/panierBD.php");
	if(isset($_SESSION['profil'])){
		$id=$_SESSION['profil']['id_client'];
		$prix_total=prix_total($id);
		require("vue/payer.tpl");
	}
}


/*
 * Fonction qui permet d'ajouter une occurence d'un produit dans le panier.
 * Elle décrémente automatiquement le stock
 */
function plus(){
	require ("modele/panierBD.php");
	require ("modele/administrateurBD.php");
	if(isset($_SESSION['profil']) AND isset($_GET['id'])){
		$id=$_SESSION['profil']['id_client'];
		$id_produit=$_GET['id'];
		plusBD($id,$id_produit);
		test($id,$id_produit);
		enlever_stockBD($id_produit);
		afficherPanier2();
	}
}


/*
 * Fonction qui permet d'enlever une occurence d'un produit dans le panier.
 * Elle augmente automatiquement le stock de 1
 */
function moins(){
	require ("modele/panierBD.php");
	require ("modele/administrateurBD.php");
	if(isset($_SESSION['profil']) AND isset($_GET['id'])){
		$id=$_SESSION['profil']['id_client'];
		$id_produit=$_GET['id'];
		moinsBD($id,$id_produit);
		test($id,$id_produit);
		ajout_stockBD($id_produit);
		afficherPanier2();
	}
}


/*
 * Autre fonction qui d'afficher le panier sans require le fichier de base de donné du panier.
 * Il y avait des conflits lors de l'appel de afficherPanier() du coup j'ai implémenté cette fonction
 */ 
function afficherPanier2(){
	if(isset($_SESSION['profil'])){
		$id=$_SESSION['profil']['id_client'];
		$produits=produit_recap($id);
		$prix_total=prix_total($id);
		require("vue/panier.tpl");
	}
}


/*
 * Fonction qui teste si la quantité d'un produit dans le panier est egale à zero.
 * Si c'est le cas elle supprime ce produit du panier
 */
function test($id,$id_produit)
{
	$quantité=quantite($id,$id_produit);
	if ($quantité['quantité'] < 1)
	{
			supp_produit($id,$id_produit);
	}


}


/*
 * Fonction qui ce lance lorsqu'on ajoute un produit au panier.
 * Elle decrément le stock automatiquement
 * Elle redirige vers la page de connexion si l'utilisateur n'est pas connecté
 */
function ajouter_panier()
{
	require ("modele/panierBD.php");
	require ("modele/administrateurBD.php");
	if(isset($_SESSION['profil']) AND isset($_GET['id'])){
			$id= $_SESSION['profil']['id_client'];
			$id_produit= $_GET['id'];
			if (TRUE)
			{
				if(search($id,$id_produit))
				{
					plusBD($id,$id_produit);
	
				}
				else
				{
					ajouter_produit($id,$id_produit);
				}
				enlever_stockBD($id_produit);
				header("Location: index.php?controle=produits&action=afficherProduit&id=$id_produit");

			}
			else
			{
				header("Location: index.php?controle=produits&action=afficherProduit&id=$id_produit");

			}
	}
	else
	{
		require("vue/connexion.tpl");
	}
}


?>
