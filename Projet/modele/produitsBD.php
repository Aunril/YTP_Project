<?php
//produitsBD.php : modele relatif à la gestion des produits en base


/*
 * Fonction qui permet de récupérer les informations d'un produit 
 */
function infos_Produit($id) {

	require ("modele/connectBD.php") ; 

	try{
		$req = $bdd->prepare('SELECT * FROM produit, type WHERE produit.id_type=type.id_type AND id_produit = :id');
		$req->execute(array(
				'id' => $id
			));
	}
	catch(Exception $e)
	{
        die('Erreur : '.$e->getMessage());
	}

	$donnees=$req->fetchAll(PDO::FETCH_ASSOC);
	$req->closeCursor();
	return $donnees[0];

}

/*
 * Fonction qui permet de récupérer les images d'un produit
 */
function images_Produit($id) {

	require ("modele/connectBD.php") ; 

	try{
		$req = $bdd->prepare('SELECT image1,image2,image3,image4,image5 FROM images WHERE id_produit = :id');
		$req->execute(array(
				'id' => $id
			));
	}
	catch(Exception $e)
	{
        die('Erreur : '.$e->getMessage());
	}

	$donnees=$req->fetchAll(PDO::FETCH_ASSOC);
	$req->closeCursor();
	return $donnees[0];

}

/*
 * Fonction qui permet de récupérer l'image principale d'un produit (vignette des pages produits)
 */
function info_imagePrincipale($id){

	require ("modele/connectBD.php") ; 

	try{
		$req = $bdd->prepare('SELECT imagePrincipale FROM images WHERE id_produit = :id');
		$req->execute(array(
				'id' => $id
			));
	}
	catch(Exception $e)
	{
        die('Erreur : '.$e->getMessage());
	}

	$donnees=$req->fetchAll(PDO::FETCH_ASSOC);
	$req->closeCursor();
	return $donnees[0]['imagePrincipale'];

}

/*
 * Fonction qui permet de connaître l'id du dernier produit en base
 */
function prochain_id(){

	require ("modele/connectBD.php") ; 

	try{
		$cmd="SELECT MAX(id_produit) as id FROM produit";
	    $res = $bdd->query($cmd);
	    $id = $res->fetch();
	}
	catch(Exception $e)
	{
        die('Erreur : '.$e->getMessage());
	}

	$res->closeCursor();
	return $id['id'];

}

/*
 * Fonction qui permet de récupérer les produits d'une catégorie 
 */
function liste_Produits($type){

	require ("modele/connectBD.php") ; 

	try{
		$req = $bdd->prepare('SELECT p.id_produit, nom, categorie, prix, imagePrincipale from produit p, images i WHERE p.id_produit=i.id_produit AND del=0 AND p.id_type IN (select id_type from type where nomType LIKE :type)');
		$req->execute(array(
				'type' => $type
			));
	}
	catch(Exception $e)
	{
        die('Erreur : '.$e->getMessage());
	}	

	$donnees=$req->fetchAll(PDO::FETCH_ASSOC);
	$req->closeCursor();
	return $donnees;
}

/*
 * Fonction qui permet de récupérer les catégories de produit 
 */
function liste_types() {

	require ("modele/connectBD.php") ; 

	try{
		$req = $bdd->prepare('SELECT * FROM type');
		$req->execute();
	}
	catch(Exception $e)
	{
        die('Erreur : '.$e->getMessage());
	}

	$donnees=$req->fetchAll(PDO::FETCH_ASSOC);
	$req->closeCursor();
	return $donnees;

}

?>