<?php 

//payer.php : controleur qui permet de payer une commande

/*
 * Function qui ce lance lorsque l'utilisateur paye les produits de son panier.
 * Elle vide le panier et ajoute la commande dans les commande à envoyer
 */
function apres_achat(){
	require ("modele/payerBD.php");
	require ("modele/panierBD.php");
	if(isset($_SESSION['profil']) AND isset($_GET['total'])){
		$id=$_SESSION['profil']['id_client'];
		$total=$_GET['total'];
		ajouter_historique($id,$total);
		$numero_commande=num_commande($id);
		$commande=afficher_commande($id);
		foreach($commande as $value)
		{
			
			ajouter_produit_2($numero_commande['max'],$value['id_produit'],$value['quantité']);
		}
		vider_le_panier($id);

		require("vue/paiement_reussi.tpl");
	}
}



?>
