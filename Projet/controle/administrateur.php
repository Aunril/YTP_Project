<?php

function connexionAdmin(){
	$login= isset($_POST['login'])?($_POST['login']):'';
	$password= isset($_POST['password'])?($_POST['password']):'';
	$msg='';

	if  (count($_POST)==0) {
			require ("vue/admin/connexion_admin.tpl") ;
			}
			else {
				require ("modele/administrateurBD.php") ;
				if  (!verif_ident_admin($login,$password, $profil)) {
					$msg = 'Informations de connexion erronées';
					require ("vue/admin/connexion_admin.tpl") ; 
				}
				else { 	$_SESSION['admin'] = $profil;
						connexion_admin($_SESSION['admin']['id_admin']);
						header("Location:index.php?controle=administrateur&action=informationsBDD");
				}
	}
}

function deconnexionAdmin(){
	require("modele/administrateurBD.php");	
	deconnexion_admin($_SESSION['admin']['id_admin']);
	session_destroy();
	header('Location:index.php');	
}


function informationsBDD(){
	if(isset($_SESSION['admin'])){
		require ("modele/administrateurBD.php");
		statsNbProduitsTypes($nbProduits,$types);
		statsClientsConnectes($nbClients,$nbClientsConnectes);
		statsMessages($nbMessages,$nbMessagesAttente);
		statsCommandes($nbCommandes);
		statsVentesMois($commandes,$articles);
		$totalCommandes=0;
		$totalArticles=0;

		//calcul pourcentage de clients connectes
		$pourcentageClient=($nbClientsConnectes/$nbClients)*100;

		//calcul pourcentage de messages en attente de réponse
		$pourcentageMessage=($nbMessagesAttente/$nbMessages)*100;

		//calculs pour chart des ventes
		$cpt=0;
		foreach ($commandes as $value) {
			$commandesNombre[$cpt]=$value['nbCommandes'];
			$commandesMois[$cpt]=$value['mois'];
			$totalCommandes+=$value['nbCommandes'];
			$cpt++;
		}	

		$cpt=0;
		foreach ($articles as $value) {
			$articlesNombre[$cpt]=$value['nbArticles'];
			$articlesMois[$cpt]=$value['mois'];
			$totalArticles+=$value['nbArticles'];
			$cpt++;
		}		

		//calculs pour charts donutNbProduits et barNbProduits
		$cpt=0;
		foreach ($types as $value) {
			$tabnbTypes[$cpt]= ($value['nbProduitsType']/$nbProduits)*360;
			$tabnbTypesBar[$cpt]= $value['nbProduitsType'];
			$tabnomTypes[$cpt] = $value['nomType'];
			$cpt++;
		}

		require("vue/admin/accueil_admin.tpl");
	}
}

function produitsBDD(){
	if(isset($_SESSION['admin'])){
		require ("modele/administrateurBD.php");
		$act = (isset($_POST["act"])) ? $_POST["act"] : ""; 
		$id = (isset($_POST["id"])) ? $_POST["id"] : "";

		if ($act == "S"){
			supprimer_produit($id);
		}		

		$recherche= isset($_POST['recherche'])?($_POST['recherche']):'';
		if($recherche!=null){
			$produits=recherche_produits($recherche);
		}else{
			$produits=liste_produits();
		}
		require("vue/admin/admin_produits.tpl");
	}
}

function contacterBDD(){
	if(isset($_SESSION['admin'])){
		require("modele/contacterBD.php");
		$contacts = afficher_messages();
		require("vue/admin/admin_contacter.tpl");
	}
}

function clientsBDD(){
	if(isset($_SESSION['admin'])){
		require ("modele/utilisateurBD.php");
		$usr_id_upd       = "";
		$usr_nom_upd      = "";
		$usr_prenom_upd   = "";
		$usr_email_upd    = "";
		$usr_pass_upd     = "";
		$usr_cp_upd      = "";
		$usr_ville_upd    = "";
		$usr_adr_upd      = "";

		$act = (isset($_POST["act"])) ? $_POST["act"] : ""; 
		$id = (isset($_POST["id"])) ? $_POST["id"] : "";	

		if ($act == "N"){
		    
		    $usr_id     = (isset($_POST["usr_id"]))? $_POST["usr_id"] : '';
		    $usr_nom     = (isset($_POST["usr_nom"]))? $_POST["usr_nom"] : '';
		    $usr_prenom  = (isset($_POST["usr_prenom"]))? $_POST["usr_prenom"] : '';
		    $usr_email  = (isset($_POST["usr_email"]))? $_POST["usr_email"] : '';
		    $usr_pass  = (isset($_POST["usr_pass"]))? $_POST["usr_pass"] : '';
		    $usr_cp  = (isset($_POST["usr_cp"]))? $_POST["usr_cp"] : '';
		    $usr_ville  = (isset($_POST["usr_ville"]))? $_POST["usr_ville"] : '';
		    $usr_adr     = (isset($_POST["usr_adr"]))? $_POST["usr_adr"] : '';
		    $err="";

		    $usr_pass=md5($usr_pass);
		    
		    if ($id == ""){
		    	inscription_client($usr_prenom,$usr_nom,$usr_email,$usr_pass,$usr_adr,$usr_cp,$usr_ville,$err);
		    }else{
		    	admin_modifClient($id,$usr_prenom,$usr_nom,$usr_email,$usr_pass,$usr_adr,$usr_cp,$usr_ville);
		    }
		    
		}

		if ($act == "M"){

		    $line=infosClient($id);

		    $usr_id_upd       = $line['id_client'];
		    $usr_nom_upd      = $line['nom'];
		    $usr_prenom_upd   = $line['prenom'];
		    $usr_email_upd    = $line['email'];
		    $usr_pass_upd     = $line['password'];
		    $usr_cp_upd       = $line['codepostal'];
		    $usr_ville_upd    = $line['ville'];
		    $usr_adr_upd      = $line['adresse'];   
		    
		}

		if ($act == "S"){
			supprimer_client($id);
		}

		$clients=liste_clients();

		require("vue/admin/admin_clients.tpl");
	}
}

function commandesBDD(){
	if(isset($_SESSION['admin'])){
		require ("modele/administrateurBD.php");
		$commande=produits_a_envoyer();
		require("vue/admin/admin_commandes.tpl");
	}
}

function historiqueBDD(){
	if(isset($_SESSION['admin'])){
		require ("modele/administrateurBD.php");
		$histo=historique();
		require("vue/admin/admin_historique.tpl");
	}
}

function afficherProduit(){
	if(isset($_SESSION['admin'])){
		require ("modele/produitsBD.php");
		if(isset($_GET['id'])){
			$id=$_GET['id'];
			$informations=infos_Produit($id);
			$images=images_Produit($id);
			$types=liste_types();
			$imagePrincipale=info_imagePrincipale($id);
			require("vue/admin/produit_admin.tpl");
		}
	}
}

function PageAjoutProduit(){
	if(isset($_SESSION['admin'])){
		require ("modele/produitsBD.php");
		$nouveau_id=prochain_id();
		$nouveau_id++;
		$types=liste_types();
		require("vue/admin/nouveau_produit_admin.tpl");
	}
}

function ajoutProduit(){
	if(isset($_SESSION['admin'])){
		require ("modele/administrateurBD.php");
		$nom= isset($_POST['nom'])?($_POST['nom']):'';
		$type=isset($_POST['type'])?($_POST['type']):'';
		$categorie=isset($_POST['categorie'])?($_POST['categorie']):'';
		$prix=  isset($_POST['prix'])?($_POST['prix']):'';
		$dimensions= isset($_POST['dimensions'])?($_POST['dimensions']):'';
		$fabricant= isset($_POST['fabricant'])?($_POST['fabricant']):'';
		$description= isset($_POST['description'])?($_POST['description']):'';

		$imagePrincipale= !empty($_POST['imagePrincipale'])?($_POST['imagePrincipale']):NULL;
		$image1= !empty($_POST['image1'])?($_POST['image1']):NULL;
		$image2= !empty($_POST['image2'])?($_POST['image2']):NULL;
		$image3= !empty($_POST['image3'])?($_POST['image3']):NULL;
		$image4= !empty($_POST['image4'])?($_POST['image4']):NULL;
		$image5= !empty($_POST['image5'])?($_POST['image5']):NULL;

		$id=ajout_produit($nom,$type,$categorie,$prix,$dimensions,$fabricant,$description,$imagePrincipale,$image1,$image2,$image3,$image4,$image5);

		header("Location:index.php?controle=administrateur&action=afficherProduit&id=$id");
	}
}

function supprimer_image(){
	if(isset($_SESSION['admin'])){
		require ("modele/administrateurBD.php");
		if(isset($_GET['id'])){
			$id=$_GET['id'];
			$image=$_GET['image'];
			suppression_image($id,$image);
			header("Location:index.php?controle=administrateur&action=afficherProduit&id=$id");
		}
    }
}

function modifier_produit(){
	if(isset($_SESSION['admin'])){
		require ("modele/administrateurBD.php");
		if(isset($_GET['id'])){
			$id=$_GET['id'];
			$nom= isset($_POST['nom'])?($_POST['nom']):'';
			$type=isset($_POST['type'])?($_POST['type']):'';
			$categorie=isset($_POST['categorie'])?($_POST['categorie']):'';
			$prix=  isset($_POST['prix'])?($_POST['prix']):'';
			$dimensions= isset($_POST['dimensions'])?($_POST['dimensions']):'';
			$fabricant= isset($_POST['fabricant'])?($_POST['fabricant']):'';
			$description= isset($_POST['description'])?($_POST['description']):'';

			$imagePrincipale= !empty($_POST['imagePrincipale'])?($_POST['imagePrincipale']):NULL;
			$image1= !empty($_POST['image1'])?($_POST['image1']):NULL;
			$image2= !empty($_POST['image2'])?($_POST['image2']):NULL;
			$image3= !empty($_POST['image3'])?($_POST['image3']):NULL;
			$image4= !empty($_POST['image4'])?($_POST['image4']):NULL;
			$image5= !empty($_POST['image5'])?($_POST['image5']):NULL;

			modification_produit($id,$nom,$type,$categorie,$prix,$dimensions,$fabricant,$description,$imagePrincipale,$image1,$image2,$image3,$image4,$image5);

			header("Location:index.php?controle=administrateur&action=afficherProduit&id=$id");
		}	
	}
}

function ajout_stock(){
	if(isset($_SESSION['admin'])){
		require ("modele/administrateurBD.php");

		if(isset($_GET['id'])){
			$id=$_GET['id'];
			ajout_stockBD($id);
		}
	 	$produits=liste_produits();
		require("vue/admin/admin_produits.tpl");
	}
}

function enlever_stock(){
	if(isset($_SESSION['admin'])){
		require ("modele/administrateurBD.php");

		if(isset($_GET['id'])){
			$id=$_GET['id'];
			enlever_stockBD($id);
		}
	  	$produits=liste_produits();
	 	require("vue/admin/admin_produits.tpl");
	 }
}

function envoyer_produit(){
	if(isset($_SESSION['admin'])){
		require ("modele/administrateurBD.php");
		if(isset($_GET['id'])){
			$id=$_GET['id'];
			$id_commande = $_GET['id_cmd'];
			envoyer_un_produit($id,$id_commande);
		}
		
		if(!test_commande_complete($id_commande))
		{
			
			envoyerBD($id_commande);
		}
		
		$commande=produits_a_envoyer();
	 	require("vue/admin/admin_commandes.tpl");
	}
}


function changer_stock(){
	if(isset($_SESSION['admin'])){
		require ("modele/administrateurBD.php");
		$id=$_GET['id'];
		$quantite=$_POST['stock'];
		change_stockBD($id,$quantite);
			
		$produits=liste_produits();
		require("vue/admin/admin_produits.tpl");
	}
}



?>
