<?php
//panierBD.php : modele relatif à la gestion du panier en base


/*
 * Fonction qui permet de récupérer les produits composant le panier de l'utilisateur 
 */
function produit_recap($id) {

	require ("modele/connectBD.php") ; 
	try{
		$req = $bdd->prepare('SELECT produit.id_produit, images.imagePrincipale, produit.nom, produit.prix, panier.quantité, produit.description, produit.stock FROM images, produit, panier WHERE panier.id_produit = produit.id_produit AND panier.id_produit = images.id_produit AND panier.id_client = :id');
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

/*
 * Fonction de calcul du prix total du panier
 */
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


/*
 * Fonction d'ajout d'une quantité de produit
 */
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


/*
 * Fonction de retrait d'une quantité de produit
 */
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


/*
 * Fonction qui récupère la quantité souhaitée pour un produit dans la panier
 */
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

/*
 * Fonction qui permet de supprimer un produit du panier
 */
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


/*
 * Fonction qui permet d'ajouter un article dans la panier
 */
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


/*
 * Fonction qui permet de récupérer un produit en particulier du panier
 */
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

/*
 * Fonction qui permet de vérifier si le panier est vide ou non
 */
function check($id)
{
	require ("modele/connectBD.php") ; 
	try{
		$req = $bdd->prepare('SELECT * FROM `panier` WHERE id_client= :id ');
		$req->execute(array(
			'id' => $id
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

/*
 * Fonction qui permet de vérifier s'il est possible d'ajouter une quantité de produit selon le stock
 */
function stop_stock($id)
{
	require ("modele/connectBD.php") ;
        try{
                $req = $bdd->prepare('SELECT * FROM produit WHERE id_produit = :id AND stock > 0');
                $req->execute(array(
                        'id' => $id
                        ));
        }
        catch(Exception $e)
        {
        die('Erreur : '.$e->getMessage());
        }


 	if ($req->fetch() == false)
        {
                return 0;
        }
        else
        {
                return 1;
        }
	
}



?>
