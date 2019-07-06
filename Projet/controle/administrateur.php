<?php

function informationsBDD(){
	require ("modele/administrateurBD.php");
	//if(isset($_SESSION['profil'])){
		$clients=liste_clients();
		$produits=liste_produits();
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
		require("vue/admin/produit_admin.tpl");
	}
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

		$image1= !empty($_POST['image1'])?($_POST['image1']):NULL;
		$image2= !empty($_POST['image2'])?($_POST['image2']):NULL;
		$image3= !empty($_POST['image3'])?($_POST['image3']):NULL;
		$image4= !empty($_POST['image4'])?($_POST['image4']):NULL;
		$image5= !empty($_POST['image5'])?($_POST['image5']):NULL;

		modification_produit($id,$nom,$type,$categorie,$prix,$dimensions,$fabricant,$description,$image1,$image2,$image3,$image4,$image5);

		header("Location:index.php?controle=administrateur&action=afficherProduit&id=$id");
	}	
}

?>