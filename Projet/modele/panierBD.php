<?php
/*Fonctions-modèle réalisant les requêtes de gestion des produits en base de données*/

/*PDO::FETCH_ASSOC : permet de ne pas avoir les resultats en double dans les données récupérées*/


function produit_recap($id) {

	require ("modele/connectBD.php") ; 
	try{
		$req = $bdd->prepare('SELECT produit.id_produit, images.imagePrincipale, produit.nom, produit.prix, panier.quantité FROM images, produit, panier WHERE panier.id_produit = produit.id_produit AND panier.id_produit = images.id_produit AND panier.id_client = :id');
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


function plusBD($id,$id_produit) {

	require ("modele/connectBD.php") ; 
	try{
		$req = $bdd->prepare('UPDATE `panier` SET`quantité`= quantité + 1 WHERE id_client = :id AND id_produit = :id_produit ');
		$req->execute(array(
			'id' => $id,
			'id_produit' => $id_produit
			));
	}
	catch(Exception $e)
	{
        die('Erreur : '.$e->getMessage());
	}


}

function moinsBD($id,$id_produit) {

	require ("modele/connectBD.php") ; 
	try{
		$req = $bdd->prepare('UPDATE `panier` SET`quantité`= quantité - 1 WHERE id_client = :id AND id_produit = :id_produit ');
		$req->execute(array(
			'id' => $id,
			'id_produit' => $id_produit
			));
	}
	catch(Exception $e)
	{
        die('Erreur : '.$e->getMessage());
	}

}


function quantite($id,$id_produit) {

	require ("modele/connectBD.php") ; 
	try{
		$req = $bdd->prepare('SELECT quantité FROM `panier` WHERE id_client= :id AND id_produit= :id_produit');
		$req->execute(array(
			'id' => $id,
			'id_produit' => $id_produit
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

function supp_produit($id,$id_produit) {

	require ("modele/connectBD.php") ; 
	try{
		$req = $bdd->prepare('DELETE FROM `panier` WHERE id_client= :id AND id_produit= :id_produit');
		$req->execute(array(
			'id' => $id,
			'id_produit' => $id_produit
			));
	}
	catch(Exception $e)
	{
        die('Erreur : '.$e->getMessage());
	}

}


function ajouter_produit($id,$id_produit) {

	require ("modele/connectBD.php") ; 
	try{
		$req = $bdd->prepare('INSERT INTO `panier`(`id_client`, `id_produit`, `quantité`) VALUES ( :id, :id_produit ,1)');
		$req->execute(array(
			'id' => $id,
			'id_produit' => $id_produit
			));
	}
	catch(Exception $e)
	{
        die('Erreur : '.$e->getMessage());
	}

}

function search($id,$id_produit) {

	require ("modele/connectBD.php") ; 
	try{
		$req = $bdd->prepare('SELECT * FROM `panier` WHERE id_client= :id AND id_produit= :id_produit');
		$req->execute(array(
			'id' => $id,
			'id_produit' => $id_produit
			));
	}
	catch(Exception $e)
	{
        die('Erreur : '.$e->getMessage());
	}

	if ($req->fetch() == false)
	{
		return FALSE;
	}
	else
	{
		return TRUE;
	}
}

?>
