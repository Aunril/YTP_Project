<?php 

session_start ();


if (isset($_GET['controle']) && isset ($_GET['action'])) {
	$controle = $_GET['controle'];   //cas d'un appel à index.php 
	$action = $_GET['action'];	//avec les 2 paramètres controle et action
}else{	
	$controle="menu";
	$action="accueil";
}

require ('./controle/' . $controle . '.php');
$action ();


?>

