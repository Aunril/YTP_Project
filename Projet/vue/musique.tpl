
<!DOCTYPE html>

<html lang="fr">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">

    <link href="vue/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <link href="vue/css/main.css" rel="stylesheet">
    <link href="vue/css/produits.css" rel="stylesheet">

    <title>Musique - Striker Eureka</title>
</head>

<body>
  <?php include('vue/templates/html-header.tpl'); ?>

  <div class="container-fluid enteteProduits" id="enteteMusique">
    <h1>Musique</h1>
  </div>

  <div class="container">
    <div class="row">
      <h3 class="text-divider"></h3>
    </div>

    <?php 

        $cpt=0;

        foreach($listeProduits as $value){
          if($cpt%4==0){ ?>
            <div class="row items">
          <?php } 

          $cpt=++$cpt; ?>

          <div class="col-lg-3 col-xs-6 text-center">
            <img class="img-responsive" src="<?php echo $value['imagePrincipale'] ?>" alt="">
            <h4><?php echo $value['nom'] ?></h4>
            <p><?php echo $value['categorie'] ?></p>
            <h4><?php echo $value['prix'] ?>€</h4>
            <p><a class="btn btn-default btnArticle" href="index.php?controle=produits&action=afficherProduit&id=<?php echo $value['id_produit'] ?>" role="button">Détails > </a></p>
          </div><!-- /.col-lg-3 -->

          <?php 

          if($cpt%4==0){ ?>
            </div><!-- /.row -->
          <?php }

        }

    ?>
    </div>

  </div><!-- container-fluid -->

<?php include('vue/templates/html-footer.tpl'); ?>
  
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

<script src="vue/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>
