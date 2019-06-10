<?php 

/*contrôleur connexion.php :
  gérer les connexions clientes du site
*/


//premier affichage de la page
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

// verifS : vérification syntaxique des saisies 
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

function deconnexion(){
	require("modele/utilisateurBD.php");	
	deconnexion_client($_SESSION['profil']['id_client']);

	session_destroy();
	header('Location:index.php');	
}


?>