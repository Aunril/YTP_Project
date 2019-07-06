<?php
/*Fonctions-modèle réalisant les requêtes de gestion des produits en base de données*/

/*PDO::FETCH_ASSOC : permet de ne pas avoir les resultats en double dans les données récupérées*/


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


function liste_Produits($type){

	require ("modele/connectBD.php") ; 

	try{
		$req = $bdd->prepare('SELECT p.id_produit, nom, categorie, prix, imagePrincipale from produit p, images i WHERE p.id_produit=i.id_produit AND p.id_type IN (select id_type from type where nomType LIKE :type)');
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