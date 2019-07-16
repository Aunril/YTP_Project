<?php

//connectBD.php : modele relatif à la connexion à la base de données


try{

	$bdd = new PDO('mysql:host=localhost;dbname=striker_eureka;charset=utf8', 'root', '');

} catch (Exception $e)
{
   die('Erreur : ' . $e->getMessage());
}

?>