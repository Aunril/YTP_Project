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
    <li><a data-toggle="pill" href="#menu2">Liste des commandes</a></li>
    <li><a data-toggle="pill" href="#menu3">Liste des produits</a></li>
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

    </div>
    <div id="menu3" class="tab-pane fade">
      <br>
      <div class="table-responsive">
      <table class="table table-bordered">
        <thead>
            <td>ID PRODUIT</td>
            <td>TYPE</td>
            <td>NOM</td>
            <td>PRIX</td>
            <td>INFORMATIONS</td>
        </thead>
        <?php
          foreach($produits as $value){          
          ?>
          <tr>
            <th><?php echo $value['id_produit']?></th>
            <td><?php echo $value['nomType']?></td>
            <td><?php echo $value['nom']?></td>
            <td><?php echo $value['prix']?></td>
            <td>bla</td>
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