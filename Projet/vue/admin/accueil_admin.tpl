<!DOCTYPE html>

<html lang="fr">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">

    <link href="vue/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    
    <link href="vue/css/admin.css" rel="stylesheet">

    <title>Administrateur - Striker Eureka</title>
</head>

<body>

  <div class="container-fluid">
    <h1>Page Administrateur : nom prénom</h1>
  </div>

  <div class="container-fluid">


  <ul class="nav nav-pills">
    <li class="active"><a data-toggle="pill" href="#home">Home</a></li>
    <li><a data-toggle="pill" href="#menu1">Liste des clients</a></li>
    <li><a data-toggle="pill" href="#menu2">Commandes à envoyer</a></li>
    <li><a data-toggle="pill" href="#menu3">Liste des produits</a></li>
		<li><a data-toggle="pill" href="#menu4">Historique commande</a></li>
  </ul>
  
  <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
      <h3>Accueil</h3>
      <p>Là où il faut mettre les statistiques</p>
    </div>
    <div id="menu1" class="tab-pane fade">
      <h3></h3>
      
      <div class="table-responsive">
      <table class="table table-bordered">
        <thead>
            <td>ID CLIENT</td>
            <td>NOM</td>
            <td>PRENOM</td>
            <td>E-MAIL</td>
            <td>ADRESSE</td>
        </thead>
        <?php
          foreach($clients as $value){          
          ?>
          <tr>
            <th><?php echo $value['id_client']?></th>
            <td><?php echo $value['nom']?></td>
            <td><?php echo $value['prenom']?></td>
            <td><?php echo $value['email']?></td>
            <td><?php echo $value['adresse'] ?>  <?php echo $value['codepostal'] ?>  <?php echo $value['ville']?></td>
          </tr>
          <?php } ?>
      </table>
      </div>

    </div>
    <div id="menu2" class="tab-pane fade">
	<h3></h3>
      <div class="table-responsive">
      <table class="table table-bordered">
        <thead>
        <td>ID COMMANDE</td>

	<td>ID PRODUIT</td>
		<td>QUANTITE</td>	
            <td>NOM CLIENT</td>
            <td>PRENOM CLIENT</td>
            <td>ADRESSE CLIENT</td>
						<td>ENVOYER</td>
        </thead>
        <?php
          foreach($commande as $value){          
          ?>
          <tr>
	<th><?php echo $value['id_commande']?></th>

            <td><?php echo $value['id_produit']?></td>
            		<td><?php echo $value['quantite']?></td>
            <td><?php echo $value['nom']?></td>
            <td><?php echo $value['prenom']?></td>
            <td><?php echo $value['adresse'] ?>  <?php echo $value['codepostal'] ?>  <?php echo $value['ville']?></td>
						<td>
						<a class="btn btn-default btnArticle" id="bouton_envoyer" href="index.php?controle=administrateur&action=envoyer_produit&id=<?php echo $value['id_produit'] ?>&id_cmd=<?php echo $value['id_commande']?>" role="button">Send</a>
						</td>
          </tr>
          <?php } ?>
      </table>
      </div>


    </div>
    <div id="menu3" class="tab-pane fade">
      <br>
      <br>
      <a class="btn btn-default btn-danger" href="index.php?controle=administrateur&action=PageAjoutProduit" role="button">+ Ajouter un produit </a>
      <br>
      <br>
      <br>
      <div class="table-responsive">
      <table class="table table-bordered table-striped">
        <thead>
            <td>ID PRODUIT</td>
            <td>TYPE</td>
            <td>NOM</td>
            <td>PRIX</td>
            <td>INFORMATIONS</td>
						<td>AJOUT STOCK</td>
        </thead>
        <?php
          foreach($produits as $value){          
          ?>
          <tr>
            <th><?php echo $value['id_produit']?></th>
            <td><?php echo $value['nomType']?></td>
            <td><?php echo $value['nom']?></td>
            <td><?php echo $value['prix']?></td>
            <td><p><a class="btn btn-default btn-info" href="index.php?controle=administrateur&action=afficherProduit&id=<?php echo $value['id_produit'] ?>" role="button">Détails > </a></p></td>
						<td> <p><a class="btn btn-default btn-info" href="index.php?controle=administrateur&action=ajout_stock&id=<?php echo $value['id_produit'] ?>" role="button">+</a>
<a class="btn btn-default btn-info" href="index.php?controle=administrateur&action=enlever_stock&id=<?php echo $value['id_produit'] ?>" role="button">-</a>
<?php echo $value['stock'] ?>
</p>

						</td>
          </tr>
          <?php } ?>
      </table>
      </div>
    </div>
    

	 <div id="menu4" class="tab-pane fade">
	 		<br>
			<br>
			<br>
			<br>
      <div class="table-responsive">
      <table class="table table-bordered table-striped">
        <thead>
            <td>ID COMMANDE</td>
            <td>PRIX</td>
        </thead>
        <?php
          foreach($histo as $value){
          ?>
          <tr>
            <th><?php echo $value['id_commande']?></th>
            <td><?php echo $value['total']?>€</td>
	    </tr>
          <?php } ?>
      </table>
      </div>
    </div>




  </div>
</div>
    

  
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

<script src="vue/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>
