<?php 

//utilisateur.php : controleur qui permet de gérer les connexions clientes du site

/*
 * Fonction d'identification d'un utilisateur
 */
function identification(){
	$email= isset($_POST['emailco'])?($_POST['emailco']):'';
	$mdp= isset($_POST['pwdco'])?($_POST['pwdco']):'';
	$msg='';
	
	if  (count($_POST)==0) {
			require ("vue/connexion.tpl") ;
			}
			else {
				require ("modele/utilisateurBD.php") ;
				if  (! (verifS($email, $mdp, $err) && verif_ident($email,$mdp, $profil))) {
					$msg = $err;
					if($msg == ''){
						$msg = 'Utilisateur inconnu';}
					require ("vue/connexion.tpl") ; 
				}
				else { 	$_SESSION['profil'] = $profil;
						connexion($_SESSION['profil']['id_client']);
						header("Location:index.php?controle=menu&action=compte");
				}
	}		
}


/*
 * Fonction d'inscription d'un utilisateur
 */
function inscription(){

	$nom= isset($_POST['nom'])?($_POST['nom']):'';
	$prenom=isset($_POST['prenom'])?($_POST['prenom']):'';
	$mdp=isset($_POST['pwdins'])?($_POST['pwdins']):'';
	$email=  isset($_POST['emailins'])?($_POST['emailins']):'';
	$adresse= isset($_POST['adresse'])?($_POST['adresse']):'';
	$cp= isset($_POST['cp'])?($_POST['cp']):'';
	$ville= isset($_POST['ville'])?($_POST['ville']):'';
	$msgIns='';


	$mdp_md5=md5($mdp);
	
	if  (count($_POST)==0) {
				require ("vue/connexion.tpl") ;
			}
			else {
				require ("modele/utilisateurBD.php") ;
				if  (!(verifS($email, $mdp, $err))) {
					$msgIns = $err;
					require ("vue/connexion.tpl") ;
				}
				else { 					
					if(!inscription_client($prenom,$nom,$email,$mdp_md5,$adresse,$cp,$ville,$err)){
						$msgIns = $err;
						require ("vue/connexion.tpl") ;
					}else{
						verif_ident($email,$mdp,$profil);
						$_SESSION['profil'] = $profil;
						connexion($_SESSION['profil']['id_client']);
						header("Location:index.php?controle=menu&action=compte");}	
					}
				}	
}


/*
 * Fonction qui permet à un utilisateur de modifier ses informations sur son compte
 */
function modification(){

	$id= $_SESSION['profil']['id_client'];
	$email=  isset($_POST['emailins'])?($_POST['emailins']):'';
	$adresse= isset($_POST['adresse'])?($_POST['adresse']):'';
	$cp= isset($_POST['cp'])?($_POST['cp']):'';
	$ville= isset($_POST['ville'])?($_POST['ville']):'';
	$mdp=isset($_POST['mdpmodif'])?($_POST['mdpmodif']):'';

	require ("modele/utilisateurBD.php");

	modification_client($id,$email,$adresse,$cp,$ville,$mdp,$profil);
	
	$_SESSION['profil'] = $profil;
	print_r($profil);
	header("Location:index.php?controle=menu&action=compte");
		
}

/*
 * Fonction de vérification syntaxique des informations fournies
 */
function verifS($email, $mdp, &$err) {
	if (strlen($mdp)<6) {			
		$err = 'Le mot de passe a au moins 6 caractères.';
		return false;
	}

	if($email != null){
		$email = htmlspecialchars($email);
		if (!preg_match("#^[a-z0-9._-]+@[a-z0-9._-]{2,}\.[a-z]{2,4}$#", $email)) {   
			$err = 'adresse mail non valide';
			return false;
			}		
	}

	return true;
} 


/*
 * Fonction de deconnexion d'un utilisateur
 */
function deconnexion(){
	require("modele/utilisateurBD.php");	
	deconnexion_client($_SESSION['profil']['id_client']);

	session_destroy();
	header('Location:index.php');	
}


?>