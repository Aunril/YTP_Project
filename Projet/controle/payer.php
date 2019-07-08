<?php 

/*contrôleur panier.php :
  affichage du panier
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
			
			ajouter_produit_2($numero_commande['max'],$value['produit'],$value['quantite']);
		}
		vider_le_panier($id);

		require("vue/paiement_reussi.tpl");
	}
}



?>
