
<!DOCTYPE html>

<html lang="fr">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">

    <link href="vue/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <link href="vue/css/main.css" rel="stylesheet">
	<link href="vue/css/panier.css" rel="stylesheet">


    <title>Paiement - Striker Eureka</title>
</head>
  

<body>
  <?php include('vue/templates/html-header.tpl'); ?>

	<div class=container" id="panier">
		<div class="row">
			<div class="col-md-8 col-md-offset-1">
				<h1 style="text-align: center;">VOTRE PANIER</h1>
			</div>
			<div class="col-md-2">
				<h2>RÉCAPITULATIF</h2>
			</div>
		</div>
		<div class="row">
		<br>
		</div>
		<div class="row">
			<div class="col-md-8 col-md-offset-1">
			<div class="">
				<div class="table table-bordered table-striped" id="tableau_produit" style="text-align: center;">
					<br>
					<div class="row">
						<div class="col-md-5" style="font-weight: bold;">
							INFOS PRODUIT
						</div>
						<div class="col-md-2" style="font-weight: bold;">
							PRIX UNITAIRE
						</div>
						<div class="col-md-3" style="font-weight: bold;">
							QUANTITE
          	</div>
						<div class="col-md-2" style="font-weight: bold;">
							PRIX TOTAL
          	</div>

					</div>
					<hr>

		    	<?php

						foreach($produits as $value){
         				?>
         						<br>
								<div class="row">
									<div class="col-md-3">
            				<img class="img-responsive" src="<?php echo $value['imagePrincipale'] ?>" alt="">
									</div>
									<div class="col-md-2">
          	  			<h4><?php echo $value['nom'] ?></h4>
									</div>
									<div class="col-md-2">
            				<h4><?php echo $value['prix'] ?>€</h4>
          				</div>

									<div class="col-md-3">
										<h4><?php echo $value['quantité'] ?>
										<?php
										 	if ($value['stock'] == 0)
                			{
                				?>
 													<a class="btn btn-default btnArticle2" id="bouton_plus" role="button">+</a>
				                <?php
      			          }
            			    else
                			{
                				?>
													<a class="btn btn-default btnArticle" id="bouton_plus" href="index.php?controle=panier&action=plus&id=<?php echo $value['id_produit'] ?>" role="button">+</a>
												<?php
    			            }
          				      ?>
											<a class="btn btn-default btnArticle" id="bouton_moins" href="index.php?controle=panier&action=moins&id=<?php echo $value['id_produit'] ?>" role="button">-</a>
										</h4>
									</div>
									<div class="col-md-2">
										<h4><?php echo $value['prix'] * $value['quantité'] ?>€<h4>
									</div>
								</div>
								<hr>
          	<?php

          	}

        		
    			?>
					</div>
				</div>
			</div>
			<div class="col-md-2">
				<h4>Panier: <?php echo $prix_total['SUM(produit.prix*panier.quantité)'] ?>€</h4>
				<h4>Frais de livraison: 4€</h4>
				<h4>TOTAL <?php echo $prix_total['SUM(produit.prix*panier.quantité)'] + 4 ?>€</h4>
				<p><a class="btn btn-default btnArticle" id="bouton_payer" href="index.php?controle=panier&action=payer" role="button">Valider mon panier </a></p>
				<img class="img-responsive" src="vue/images/Paiement-paypal.png" alt="">
	
			</div>
				
		</div>
	</div>
	
		


  <?php include('vue/templates/html-footer.tpl'); ?>
  
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

<script src="vue/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>
