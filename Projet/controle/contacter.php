<?php 

/*contrôleur panier.php :
  affichage du panier
*/


function nous_contacter (){
	require("vue/contacter.tpl");
}

function send_form(){
	require ("modele/contacterBD.php");

	$name=$_POST['name'];
	$email=$_POST['email'];
	$message=$_POST['message'];

	ajouter_message($name,$email,$message);

	require("vue/contacter.tpl");
}

function envoyer_message()
{
	require ("modele/contacterBD.php");

	$id_contact=$_GET['id'];
	envoyerBD($id_contact);
	$contacts = afficher_messages();
	require ("vue/admin/admin_contacter.tpl");
}

?>
