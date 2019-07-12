<?php

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


function liste_produits() {

	require ("modele/connectBD.php") ; 

	try{
		$req = $bdd->prepare('SELECT id_produit, nomType, nom, categorie, prix, dimensions, fabricant, description, stock FROM produit, type WHERE produit.id_type=type.id_type');
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

function recherche_produits($recherche){
	require ("modele/connectBD.php") ; 

	try{
		$cmd="SELECT id_produit, nomType, nom, categorie, prix, dimensions, fabricant, description, stock FROM produit, type WHERE produit.id_type=type.id_type AND produit.nom LIKE '%{$recherche}%'";
	    $res = $bdd->query($cmd);
	    $donnees = $res->fetchAll(PDO::FETCH_ASSOC);
	}
	catch(Exception $e)
	{
        die('Erreur : '.$e->getMessage());
	}

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


function modification_produit($id,$nom,$type,$categorie,$prix,$dimensions,$fabricant,$description,$imagePrincipale,$image1,$image2,$image3,$image4,$image5){

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

		$req = $bdd->prepare('UPDATE images SET imagePrincipale=:imagePrincipale, image1=:image1, image2=:image2, image3=:image3, image4=:image4, image5=:image5 WHERE id_produit=:id');
		$req->execute(array(
				'imagePrincipale' => $imagePrincipale,
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


function ajout_produit($nom,$type,$categorie,$prix,$dimensions,$fabricant,$description,$imagePrincipale,$image1,$image2,$image3,$image4,$image5){

	require ("modele/connectBD.php");

	try{

		$req = $bdd->prepare('INSERT INTO produit (`id_type`, `nom`, `categorie`, `prix`, `dimensions`, `fabricant`, `description`) VALUES (:type, :nom, :categorie, :prix, :dimensions, :fabricant,:description);');
		$req->execute(array(
				'nom' => $nom,
				'type' => $type,
				'categorie' => $categorie,
				'prix' => $prix,
				'dimensions' => $dimensions,
				'fabricant' => $fabricant,
				'description' => $description
			));

		$cmd="SELECT MAX(id_produit) as nouveau_id FROM produit";
	    $res = $bdd->query($cmd);
	    $id = $res->fetch();

		$req = $bdd->prepare('INSERT INTO images (`id_produit`, `imagePrincipale`, `image1`, `image2`, `image3`, `image4`, `image5`) VALUES (:id, :imagePrincipale, :image1, :image2, :image3, :image4, :image5)');
		$req->execute(array(
				'imagePrincipale' => $imagePrincipale,
				'image1' => $image1,
				'image2' => $image2,
				'image3' => $image3,
				'image4' => $image4,
				'image5' => $image5,
				'id' => $id['nouveau_id']
			));
	}
	catch(Exception $e)
	{
        die('Erreur : '.$e->getMessage());
	}

	$req->closeCursor();	
	return $id['nouveau_id'];

}


function produits_a_envoyer() {

	require ("modele/connectBD.php") ; 

	try{
		$req = $bdd->prepare('SELECT * FROM produits_commande INNER JOIN commande ON commande.id_commande = produits_commande.id_commande INNER JOIN client ON client.id_client = commande.id_client WHERE envoie=0');
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

function historique() {

	require ("modele/connectBD.php") ; 

	try{
		$req = $bdd->prepare('SELECT * FROM commande WHERE reçu = 1');
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



function ajout_stockBD($id)
{
	 require ("modele/connectBD.php") ;
        try{
                $req = $bdd->prepare('UPDATE `produit` SET`stock`= stock + 1 WHERE id_produit = :id ');
                $req->execute(array(
                        'id' => $id
                        ));
        }
        catch(Exception $e)
        {
        die('Erreur : '.$e->getMessage());
        }

}

function enlever_stockBD($id)
{
require ("modele/connectBD.php") ;
        try{
                $req = $bdd->prepare('UPDATE `produit` SET`stock`= stock - 1 WHERE id_produit = :id ');
                $req->execute(array(
                        'id' => $id
                        ));
        }
        catch(Exception $e)
        {
        die('Erreur : '.$e->getMessage());
        }

}

function envoyerBD($id)
{
	require ("modele/connectBD.php") ;
        try{
                $req = $bdd->prepare('UPDATE `commande` SET `reçu`= 1 WHERE id_commande = :id ');
                $req->execute(array(
                        'id' => $id
                        ));
        }
        catch(Exception $e)
        {
        die('Erreur : '.$e->getMessage());
        }

}


function envoyer_un_produit($id_produit,$id_commande)
{
	require ("modele/connectBD.php") ;
        try{
                $req = $bdd->prepare('UPDATE produits_commande SET envoie = 1 WHERE id_commande = :id_cmd AND id_produit = :id_prod ');
                $req->execute(array(
			'id_prod' => $id_produit,
			'id_cmd' => $id_commande

                        ));
        }
        catch(Exception $e)
        {
        die('Erreur : '.$e->getMessage());
        }

}

function test_commande_complete($id_cmd) {

        require ("modele/connectBD.php") ;
        try{
                $req = $bdd->prepare('SELECT * FROM `produits_commande` WHERE id_commande = :id_cmd AND envoie=0');
                $req->execute(array(
                        'id_cmd' => $id_cmd
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
