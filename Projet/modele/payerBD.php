<?php
//payerBD.php : modele relatif à la gestion du paiement en base

/*
 * Fonction qui permet de vider le panier d'un client
 */
function vider_le_panier($id) {

	require ("modele/connectBD.php") ; 
	try{
		$req = $bdd->prepare('DELETE FROM `panier` WHERE id_client= :id');
		$req->execute(array(
			'id' => $id,
			));
	}
	catch(Exception $e)
	{
        die('Erreur : '.$e->getMessage());
	}

}

/*
 * Fonction qui permet d'indiquer qu'une commande est traitée
 */
function ajouter_historique($id,$total) {

	require ("modele/connectBD.php") ; 
	try{
		$req = $bdd->prepare('INSERT INTO `commande`(`id_client`, `total`) VALUES ( :id, :total)');
		$req->execute(array(
			'id' => $id,
			'total' => $total
			));
	}
	catch(Exception $e)
	{
        die('Erreur : '.$e->getMessage());
	}

}

/*
 * Fonction qui permet d'ajouter le produit d'une commande dans la table produits_commande
 */
function ajouter_produit_2($numero_commande,$produit, $quantite) {

	require ("modele/connectBD.php") ; 
	try{
		$req = $bdd->prepare('INSERT INTO `produits_commande`(`id_commande`, `id_produit`, `quantite`) VALUES ( :numero_commande, :produit, :quantite )');
		$req->execute(array(
			'numero_commande' => $numero_commande,
			'produit' => $produit,
			'quantite' => $quantite 
			));
	}
	catch(Exception $e)
	{
        die('Erreur : '.$e->getMessage());
	}

}

/*
 * Fonction qui permet de récupérer la dernière commande d'un client
 */
function num_commande($id)
{
 require ("modele/connectBD.php") ;
        try{
                $req = $bdd->prepare('SELECT MAX(id_commande) as max FROM `commande` WHERE id_client= :id');
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
 * Fonction qui permet de récupérer tous les éléments du panier d'un client
 */
function afficher_commande($id)
{
 require ("modele/connectBD.php") ;
        try{
                $req = $bdd->prepare('SELECT * FROM `panier` WHERE id_client= :id');
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
?>
