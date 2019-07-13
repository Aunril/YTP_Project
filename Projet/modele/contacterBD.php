<?php
/*Fonctions-modèle réalisant les requêtes de gestion des produits en base de données*/

/*PDO::FETCH_ASSOC : permet de ne pas avoir les resultats en double dans les données récupérées*/



function ajouter_message($name,$email,$message) {

	require ("modele/connectBD.php") ; 
	try{
		$req = $bdd->prepare('INSERT INTO `contact`(`name`, `email`, `message`) VALUES (:name, :email, :message) ');
		$req->execute(array(
			'name' => $name,
			'email' => $email,
			'message' => $message
			));
	}
	catch(Exception $e)
	{
        die('Erreur : '.$e->getMessage());
	}


}


function afficher_messages()
{
	require ("modele/connectBD.php") ;
        try{
                $req = $bdd->prepare('SELECT * FROM `contact`');
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
