<?php
/*Fonctions-modèle réalisant les requêtes de gestion des produits en base de données*/

/*PDO::FETCH_ASSOC : permet de ne pas avoir les resultats en double dans les données récupérées*/


function produit_recap($id) {

	require ("modele/connectBD.php") ; 
	try{
		$req = $bdd->prepare('SELECT images.imagePrincipale, produit.nom, produit.prix, panier.quantité FROM images, produit, panier WHERE panier.id_produit = produit.id_produit AND panier.id_produit = images.id_produit AND panier.id_client = :id');
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
	return $donnees;

}

function prix_total($id) {

	require ("modele/connectBD.php") ; 
	try{
		$req = $bdd->prepare('SELECT SUM(produit.prix*panier.quantité) FROM panier JOIN produit ON panier.id_produit = produit.id_produit WHERE panier.id_client = :id');
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

?>
