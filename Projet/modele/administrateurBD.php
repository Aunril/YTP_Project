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


function suppression_image($id,$image){

	require ("modele/connectBD.php");

	try{
		$req = $bdd->prepare('UPDATE images SET ' . $image . '=null WHERE id_produit=:id');
		$req->execute(array(
				'id' => $id
			));
	}
	catch(Exception $e)
	{
        die('Erreur : '.$e->getMessage());
	}

	$req->closeCursor();	

}


function modification_produit($id,$nom,$type,$categorie,$prix,$dimensions,$fabricant,$description,$image1,$image2,$image3,$image4,$image5){

	require ("modele/connectBD.php");

	try{

		$req = $bdd->prepare('UPDATE produit SET id_type = (select id_type from type where type.nomType=:type), nom=:nom, categorie=:categorie, prix=:prix, dimensions=:dimensions, fabricant=:fabricant, description=:description WHERE id_produit=:id');
		$req->execute(array(
				'nom' => $nom,
				'type' => $type,
				'categorie' => $categorie,
				'prix' => $prix,
				'dimensions' => $dimensions,
				'fabricant' => $fabricant,
				'description' => $description,
				'id' => $id
			));

		$req = $bdd->prepare('UPDATE images SET image1=:image1, image2=:image2, image3=:image3, image4=:image4, image5=:image5 WHERE id_produit=:id');
		$req->execute(array(
				'image1' => $image1,
				'image2' => $image2,
				'image3' => $image3,
				'image4' => $image4,
				'image5' => $image5,
				'id' => $id
			));
	}
	catch(Exception $e)
	{
        die('Erreur : '.$e->getMessage());
	}

	$req->closeCursor();	

}

?>
