<?php

function liste_clients() {

	require ("modele/connectBD.php") ; 

	try{
		$req = $bdd->prepare('SELECT id_client, prenom, nom, email, adresse, codepostal, ville FROM client');
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


function liste_produits() {

	require ("modele/connectBD.php") ; 

	try{
		$req = $bdd->prepare('SELECT id_produit, nomType, nom, categorie, prix, dimensions, fabricant, description FROM produit, type WHERE produit.id_type=type.id_type');
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
