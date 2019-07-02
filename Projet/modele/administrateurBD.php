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

?>