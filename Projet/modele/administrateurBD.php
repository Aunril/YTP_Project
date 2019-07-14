<?php


// verif_ident : fonction booléenne de vérification de l'administrateur en base de données 
function verif_ident_admin($login,$mdp,&$profil) {

	require ("modele/connectBD.php") ; 

	try{
		$req = $bdd->prepare('SELECT * FROM administrateur WHERE login_admin = :login AND pass_admin = md5(:mdp)');
		$req->execute(array(
				'login' => $login,
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


function connexion_admin($id){

	require ("modele/connectBD.php") ; 

	try{
		$req = $bdd->prepare('UPDATE administrateur SET connecte = 1 WHERE id_admin = :id');
		$req->execute(array('id' => $id));
	}
	catch(Exception $e)
	{
        die('Erreur : '.$e->getMessage());
	}	
}

function deconnexion_admin($id){

	require ("modele/connectBD.php") ; 

	try{
		$req = $bdd->prepare('UPDATE administrateur SET connecte = 0 WHERE id_admin = :id');
		$req->execute(array('id' => $id));
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


function liste_produits() {

	require ("modele/connectBD.php") ; 

	try{
		$req = $bdd->prepare('SELECT id_produit, nomType, nom, categorie, prix, dimensions, fabricant, description, stock FROM produit, type WHERE produit.id_type=type.id_type and del=0');
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
		$cmd="SELECT id_produit, nomType, nom, categorie, prix, dimensions, fabricant, description, stock FROM produit, type WHERE produit.id_type=type.id_type AND produit.nom LIKE '%{$recherche}%' and del=0";
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

function supprimer_produit($id){
	require ("modele/connectBD.php") ; 

	try{
		$req = $bdd->prepare('UPDATE produit SET del=1 WHERE id_produit = :id');
		$req->execute(array(
				'id' => $id
			));
	}
	catch(Exception $e)
	{
        die('Erreur : '.$e->getMessage());
	}

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
		$req = $bdd->prepare('SELECT * FROM commande INNER JOIN client ON client.id_client = commande.id_client WHERE reçu = 1');
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

function change_stockBD($id,$quantite)
{
	 require ("modele/connectBD.php") ;
        try{
                $req = $bdd->prepare('UPDATE `produit` SET `stock`= :quantite WHERE id_produit = :id ');
                $req->execute(array(
			'id' => $id,
			'quantite' => $quantite
                        ));
        }
        catch(Exception $e)
        {
        die('Erreur : '.$e->getMessage());
        }
}

function statsNbProduitsTypes(&$nbProduits, &$types){

	require ("modele/connectBD.php") ;

    try{
	    $cmd = "select count(*) as nbProduits from produit; ";
		$res = $bdd->query($cmd);
		$resultat = $res->fetchAll(PDO::FETCH_ASSOC);
		$nbProduits=$resultat[0]['nbProduits'];

	    $cmd = "select count(*) as nbProduitsType, t.nomType from produit p, type t WHERE p.id_type=t.id_type group by t.nomType; ";
		$res = $bdd->query($cmd);
		$types = $res->fetchAll(PDO::FETCH_ASSOC);

		$res->closeCursor();
    }catch(Exception $e){
    die('Erreur : '.$e->getMessage());
    }

}

function statsClientsConnectes(&$nbClients,&$nbClientsConnectes){
	require ("modele/connectBD.php") ;

    try{
	    $cmd = "SELECT count(*) as nbClients FROM `client`";
		$res = $bdd->query($cmd);
		$resultat = $res->fetchAll(PDO::FETCH_ASSOC);
		$nbClients=$resultat[0]['nbClients'];

	    $cmd = "SELECT count(*) as nbConnectes FROM `client` WHERE connecte=1";
		$res = $bdd->query($cmd);
		$resultat = $res->fetchAll(PDO::FETCH_ASSOC);
		$nbClientsConnectes=$resultat[0]['nbConnectes'];

		$res->closeCursor();
    }catch(Exception $e){
    die('Erreur : '.$e->getMessage());
    }	
}

function statsMessages(&$nbMessages,&$nbMessagesAttente){
	require ("modele/connectBD.php") ;

    try{
	    $cmd = "SELECT count(*) as nbMessages FROM `contact`";
		$res = $bdd->query($cmd);
		$resultat = $res->fetchAll(PDO::FETCH_ASSOC);
		$nbMessages=$resultat[0]['nbMessages'];

	    $cmd = "SELECT count(*) as nbnonRepondu FROM `contact` WHERE repondu=0";
		$res = $bdd->query($cmd);
		$resultat = $res->fetchAll(PDO::FETCH_ASSOC);
		$nbMessagesAttente=$resultat[0]['nbnonRepondu'];

		$res->closeCursor();
    }catch(Exception $e){
    die('Erreur : '.$e->getMessage());
    }	
}

function statsCommandes(&$nbCommandes){
	require ("modele/connectBD.php") ;

    try{
	    $cmd = "SELECT count(*) as nbCom FROM `commande` WHERE reçu=0;";
		$res = $bdd->query($cmd);
		$resultat = $res->fetchAll(PDO::FETCH_ASSOC);
		$nbCommandes=$resultat[0]['nbCom'];

		$res->closeCursor();
    }catch(Exception $e){
    die('Erreur : '.$e->getMessage());
    }	
}

function statsVentesMois(&$commandes,&$articles){
	require ("modele/connectBD.php") ;

    try{
	    $cmd = "select count(*) as nbCommandes, monthname(date) as mois from commande group by mois order by date;";
		$res = $bdd->query($cmd);
		$commandes = $res->fetchAll(PDO::FETCH_ASSOC);

	    $cmd = "select count(*) as nbArticles, monthname(c.date) as mois from produits_commande p, commande c where c.id_commande=p.id_commande group by mois order by c.date;";
		$res = $bdd->query($cmd);
		$articles = $res->fetchAll(PDO::FETCH_ASSOC);

		$res->closeCursor();
    }catch(Exception $e){
    die('Erreur : '.$e->getMessage());
    }		
}

?>
