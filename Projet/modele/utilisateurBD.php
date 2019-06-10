<?php
/*Fonctions-modèle réalisant les requêtes de gestion des clients en base de données*/

// verif_ident : fonction booléenne de vérification de l'utilisateur en base de données 
function verif_ident($email,$mdp,&$profil) {

	require ("modele/connectBD.php") ; 

	try{
		$req = $bdd->prepare('SELECT * FROM client WHERE email = :email AND password = :mdp');
		$req->execute(array(
				'email' => $email,
				'mdp' => $mdp
			));
	}
	catch(Exception $e)
	{
        die('Erreur : '.$e->getMessage());
	}

	$donnees=$req->fetchAll();
	if(count($donnees) > 0){
		$profil = $donnees[0];  //prendre le premier enregistrement seulement
		$req->closeCursor();
		return true;
	} 

	$profil = null;
	return false;

}

function connexion($id){

	require ("modele/connectBD.php") ; 

	try{
		$req = $bdd->prepare('UPDATE client SET connecte = 1 WHERE id_client = :id');
		$req->execute(array(
				'id' => $id
			));
	}
	catch(Exception $e)
	{
        die('Erreur : '.$e->getMessage());
	}	
}


function deconnexion_client($id){

	require ("modele/connectBD.php") ; 

	try{
		$req = $bdd->prepare('UPDATE client SET connecte = 0 WHERE id_client = :id');
		$req->execute(array(
				'id' => $id
			));
	}
	catch(Exception $e)
	{
        die('Erreur : '.$e->getMessage());
	}	

}

?>