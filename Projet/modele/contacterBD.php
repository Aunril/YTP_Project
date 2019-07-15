<?php
//contacterBD.php : modele relatif à la gestion des messages au sein de la base

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
                $req = $bdd->prepare('SELECT * FROM `contact` WHERE repondu = 0');
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


/*
 * Fonction qui permet d'indiquer que l'administrateur a repondu au message
 */
function envoyerBD($id_contact) {

	require ("modele/connectBD.php") ; 
	try{
		$req = $bdd->prepare('UPDATE `contact` SET `repondu`=1 WHERE id_contact=:id');
		$req->execute(array(
			'id' => $id_contact
			));
	}
	catch(Exception $e)
	{
        die('Erreur : '.$e->getMessage());
	}


}





?>
