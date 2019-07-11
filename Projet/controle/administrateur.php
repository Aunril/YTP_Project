<?php

function informationsBDD(){
	require ("modele/administrateurBD.php");
	//if(isset($_SESSION['profil'])){
		$clients=liste_clients();
		$produits=liste_produits();
		$commande=produits_a_envoyer();
		$histo=historique();
		require("vue/admin/accueil_admin.tpl");
	//}
}

function afficherProduit(){
	require ("modele/produitsBD.php");
	if(isset($_GET['id'])){
		$id=$_GET['id'];
		$informations=infos_Produit($id);
		$images=images_Produit($id);
		$types=liste_types();
		$imagePrincipale=info_imagePrincipale($id);
		require("vue/admin/produit_admin.tpl");
	}
}

function PageAjoutProduit(){
	require ("modele/produitsBD.php");
	$nouveau_id=prochain_id();
	$nouveau_id++;
	$types=liste_types();
	require("vue/admin/nouveau_produit_admin.tpl");
}

function ajoutProduit(){
	require ("modele/administrateurBD.php");

	//if(isset($_GET['nom'])){
		$nom= isset($_POST['nom'])?($_POST['nom']):'';
		$type=isset($_POST['type'])?($_POST['type']):'';
		$categorie=isset($_POST['categorie'])?($_POST['categorie']):'';
		$prix=  isset($_POST['prix'])?($_POST['prix']):'';
		$dimensions= isset($_POST['dimensions'])?($_POST['dimensions']):'';
		$fabricant= isset($_POST['fabricant'])?($_POST['fabricant']):'';
		$description= isset($_POST['description'])?($_POST['description']):'';

		$imagePrincipale= !empty($_POST['imagePrincipale'])?($_POST['imagePrincipale']):NULL;
		$image1= !empty($_POST['image1'])?($_POST['image1']):NULL;
		$image2= !empty($_POST['image2'])?($_POST['image2']):NULL;
		$image3= !empty($_POST['image3'])?($_POST['image3']):NULL;
		$image4= !empty($_POST['image4'])?($_POST['image4']):NULL;
		$image5= !empty($_POST['image5'])?($_POST['image5']):NULL;

		$id=ajout_produit($nom,$type,$categorie,$prix,$dimensions,$fabricant,$description,$imagePrincipale,$image1,$image2,$image3,$image4,$image5);

		header("Location:index.php?controle=administrateur&action=afficherProduit&id=$id");
	//}
}

function supprimer_image(){
	require ("modele/administrateurBD.php");
	if(isset($_GET['id'])){
		$id=$_GET['id'];
		$image=$_GET['image'];
		suppression_image($id,$image);
		header("Location:index.php?controle=administrateur&action=afficherProduit&id=$id");
	}
}

function modifier_produit(){
	require ("modele/administrateurBD.php");
	if(isset($_GET['id'])){
		$id=$_GET['id'];
		$nom= isset($_POST['nom'])?($_POST['nom']):'';
		$type=isset($_POST['type'])?($_POST['type']):'';
		$categorie=isset($_POST['categorie'])?($_POST['categorie']):'';
		$prix=  isset($_POST['prix'])?($_POST['prix']):'';
		$dimensions= isset($_POST['dimensions'])?($_POST['dimensions']):'';
		$fabricant= isset($_POST['fabricant'])?($_POST['fabricant']):'';
		$description= isset($_POST['description'])?($_POST['description']):'';

		$imagePrincipale= !empty($_POST['imagePrincipale'])?($_POST['imagePrincipale']):NULL;
		$image1= !empty($_POST['image1'])?($_POST['image1']):NULL;
		$image2= !empty($_POST['image2'])?($_POST['image2']):NULL;
		$image3= !empty($_POST['image3'])?($_POST['image3']):NULL;
		$image4= !empty($_POST['image4'])?($_POST['image4']):NULL;
		$image5= !empty($_POST['image5'])?($_POST['image5']):NULL;

		modification_produit($id,$nom,$type,$categorie,$prix,$dimensions,$fabricant,$description,$imagePrincipale,$image1,$image2,$image3,$image4,$image5);

		header("Location:index.php?controle=administrateur&action=afficherProduit&id=$id");
	}	
}

function ajout_stock()
{
	require ("modele/administrateurBD.php");

	if(isset($_GET['id'])){
					$id=$_GET['id'];
					ajout_stockBD($id);
	}
	$clients=liste_clients();
  $produits=liste_produits();
	$commande=produits_a_envoyer();
	$histo=historique();
	require("vue/admin/accueil_admin.tpl");

}

function enlever_stock()
{
	require ("modele/administrateurBD.php");

	if(isset($_GET['id'])){
		$id=$_GET['id'];
		enlever_stockBD($id);
	}
	$clients=liste_clients();
  $produits=liste_produits();
	$commande=produits_a_envoyer();
	$histo=historique();
  require("vue/admin/accueil_admin.tpl");

}

function envoyer_produit()
{
	require ("modele/administrateurBD.php");
	if(isset($_GET['id'])){
		$id=$_GET['id'];
		$id_commande = $_GET['id_cmd'];
		envoyer_un_produit($id,$id_commande);
		enlever_stockBD($id);
	}
	
	if(!test($id_commande))
	{
		
		envoyerBD($id_commande);
	}
	
	$clients=liste_clients();
	$produits=liste_produits();
	$commande=produits_a_envoyer();
	$histo=historique();
 	require("vue/admin/accueil_admin.tpl");

}




?>
