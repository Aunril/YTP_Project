<?php
/*Fonctions-modèle réalisant les requêtes de gestion des clients en base de données*/

// verif_ident : fonction booléenne de vérification de l'utilisateur en base de données 
function verif_ident($email,$mdp,&$profil) {

	require ("modele/connectBD.php") ; 

	try{
		$req = $bdd->prepare('SELECT * FROM client WHERE email = :email AND password = md5(:mdp)');
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


function inscription_client($prenom,$nom,$email,$mdp,$adresse,$cp,$ville,&$err) {

	require ("modele/connectBD.php");

	try{
		$req = $bdd->prepare('SELECT * FROM client WHERE prenom = :prenom AND nom = :nom');
		$req->execute(array(
				'prenom' => $prenom,
				'nom' => $nom
			));
	}
	catch(Exception $e)
	{
        die('Erreur : '.$e->getMessage());
	}	 

	$donnees=$req->fetchAll();
	if(count($donnees) > 0){
		$req->closeCursor();
		$err="Utilisateur déjà existant";
		return false;
	} 

	try{
		$req = $bdd->prepare('SELECT * FROM client WHERE email = :email');
		$req->execute(array(
				'email' => $email
			));
	}
	catch(Exception $e)
	{
        die('Erreur : '.$e->getMessage());
	}	 

	$donnees=$req->fetchAll();
	if(count($donnees) > 0){
		$req->closeCursor();
		$err="Adresse mail déjà utilisée";
		return false;
	} 

	//Ajout de l'utilisateur s'il n'existe pas déjà dans la base

	try{
		$req = $bdd->prepare('INSERT INTO `client`(`email`, `password`, `nom`, `prenom`, `adresse`, `codepostal`, `ville`) VALUES (:email,:mdp,:nom,:prenom,:adresse,:cp,:ville)');
		$req->execute(array(
				'nom' => $nom,
				'prenom' => $prenom,
				'mdp' => $mdp,
				'email' => $email,
				'adresse' => $adresse,
				'cp' => $cp,
				'ville' => $ville
			));
	}
	catch(Exception $e)
	{
        die('Erreur : '.$e->getMessage());
	}	

	return true;

}

function modification_client($id,$email,$adresse,$cp,$ville,$mdp,&$profil) {

	require ("modele/connectBD.php") ;

	try{

		if($mdp==''){
			$req = $bdd->prepare('UPDATE client SET email = :email, adresse = :adresse, codepostal = :cp, ville = :ville WHERE id_client = :id');
			$req->execute(array(
					'email' => $email,
					'adresse' => $adresse,
					'cp' => $cp,
					'ville' => $ville,
					'id' => $id
				));			
		}else{
			$req = $bdd->prepare('UPDATE client SET email = :email, adresse = :adresse, codepostal = :cp, ville = :ville, password = md5(:mdp) WHERE id_client = :id');
			$req->execute(array(
					'email' => $email,
					'adresse' => $adresse,
					'cp' => $cp,
					'ville' => $ville,
					'mdp' => $mdp,
					'id' => $id
				));
		}

	}
	catch(Exception $e)
	{
        die('Erreur : '.$e->getMessage());
	}	

	try{
		$req = $bdd->prepare('SELECT * FROM client WHERE id_client = :id');
		$req->execute(array(
				'id' => $id
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

function commandes($id){

	require ("modele/connectBD.php") ;

	try{
		$req = $bdd->prepare('SELECT pc.id_commande, p.nom, pc.quantite, p.prix  from produits_commande pc, produit p, commande c, images i where c.id_commande=pc.id_commande and pc.id_produit=p.id_produit and p.id_produit=i.id_produit and c.reçu=0 and c.id_client=:id;');
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

function historique($id){

	require ("modele/connectBD.php") ;

	try{
		$req = $bdd->prepare('SELECT pc.id_commande, c.date, p.nom, pc.quantite, p.prix  from produits_commande pc, produit p, commande c, images i where c.id_commande=pc.id_commande and pc.id_produit=p.id_produit and p.id_produit=i.id_produit and c.reçu=1 and c.id_client=:id;');
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


function liste_clients() {

	require ("modele/connectBD.php") ; 

	try{
		$req = $bdd->prepare('SELECT * FROM client WHERE del=0');
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

function supprimer_client($id){
	require ("modele/connectBD.php") ; 

	try{
		$req = $bdd->prepare('UPDATE client SET del=1 WHERE id_client = :id');
		$req->execute(array(
				'id' => $id
			));
	}
	catch(Exception $e)
	{
        die('Erreur : '.$e->getMessage());
	}

}

function infosClient($id){
	require ("modele/connectBD.php") ; 

	try{
		$req = $bdd->prepare('SELECT * FROM client WHERE id_client = :id');
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

function admin_modifClient($id,$prenom,$nom,$email,$mdp,$adresse,$cp,$ville){

	require ("modele/connectBD.php");

	try{
		$req = $bdd->prepare('UPDATE `client` SET `email`=:email,`password`=:mdp,`nom`=:nom,`prenom`=:prenom,`adresse`=:adresse,`codepostal`=:cp,`ville`=:ville WHERE id_client=:id');
		$req->execute(array(
				'id' => $id,
				'nom' => $nom,
				'prenom' => $prenom,
				'mdp' => $mdp,
				'email' => $email,
				'adresse' => $adresse,
				'cp' => $cp,
				'ville' => $ville
			));
	}
	catch(Exception $e)
	{
        die('Erreur : '.$e->getMessage());
	}	

	return true;

}

?>
