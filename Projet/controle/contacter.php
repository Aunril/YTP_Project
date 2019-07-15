<?php 

//contacter.php : controleur permettant d'envoyer un message

/*
 * Permet d'ouvrir la page de contact pour contacter les administrateurs
 */
function nous_contacter (){
	require("vue/contacter.tpl");
}


/*
 * Fonction qui permet d'enregistrer les champs remplis par la personne qui souhaite contacter
 */
function send_form(){
	require ("modele/contacterBD.php");

	$name=$_POST['name'];
	$email=$_POST['email'];
	$message=$_POST['message'];

	ajouter_message($name,$email,$message);

	require("vue/contacter.tpl");
}


/*
 * Fonction qui permet de donner un status "repondu" a un message de contact
 */
function envoyer_message()
{
	require ("modele/contacterBD.php");

	$id_contact=$_GET['id'];
	envoyerBD($id_contact);
	$contacts = afficher_messages();
	require ("vue/admin/admin_contacter.tpl");
}

?>
