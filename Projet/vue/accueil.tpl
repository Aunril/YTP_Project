
<!DOCTYPE html>

<html lang="fr">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">

    <link href="vue/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <link href="vue/css/main.css" rel="stylesheet">

    <title>Accueil - Striker Eureka</title>
</head>
  

<body>
  <?php include('vue/templates/html-header.tpl'); ?>

  <div class="container-fluid">
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img class="first-slide" src="vue/images/guardians.jpg" alt="First slide">
        <div class="container">
          <div class="carousel-caption">
            <h1>Nouvel Arrivage Marvel</h1>
            <p><a class="btn btn-lg" href="#" role="button">Voir les produits</a></p>
          </div>
        </div>
      </div>
      <div class="item">
        <img class="second-slide" src="vue/images/spiderman.jpg" alt="Second slide">
        <div class="container">
          <div class="carousel-caption">
            <h1>Spider-Man</h1>
            <p><a class="btn btn-lg" href="#" role="button">Voir le produit</a></p>
          </div>
        </div>
      </div>
      <div class="item">
        <img class="third-slide" src="vue/images/huntress2.jpg" alt="Third slide">
        <div class="container">
          <div class="carousel-caption">
            <h1>Huntress</h1>
            <p><a class="btn btn-lg" href="#" role="button">Voir le produit</a></p>
          </div>
        </div>
      </div>
      <div class="item">
        <img class="fourth-slide" src="vue/images/sab.jpg" alt="Third slide">
        <div class="container">
          <div class="carousel-caption">
            <h1>Saber Fate Apocrypha</h1>
            <p>Retrouvez toute la série Fate dans notre catégorie Manga</p>
            <p><a class="btn btn-lg btn-primary" href="#" role="button">Voir le produit</a></p>
          </div>
        </div>
      </div>
    </div>
  </div><!-- /.carousel -->
</div>

<div class="container">
  <div class="row">
    <h3 class="text-divider"><span>Maintenant Disponibles</span></h3>
  </div>

  <div class="row itemsAccueil">
    <div class="col-lg-4 col-xs-4 text-center">
      <img class="img-responsive" src="vue/images/kizuna.jpg" alt="">
      <h3>Kizuna Al</h3>
      <p><a class="btn btn-default btnArticle" href="index.php?controle=produits&action=afficherProduit&id=2" role="button">Détails > </a></p>
    </div><!-- /.col-lg-4 -->
    <div class="col-lg-4 col-xs-4 text-center">
      <img class="img-responsive" src="vue/images/DCcomics/emmafrost.jpg" alt="">
      <h3>Emma Frost</h3>
      <p><a class="btn btn-default btnArticle" href="index.php?controle=produits&action=afficherProduit&id=1" role="button">Détails > </a></p>
    </div><!-- /.col-lg-4 -->
    <div class="col-lg-4 col-xs-4 text-center">
      <img class="img-responsive" src="vue/images/DCcomics/huntress.jpg" alt="">
      <h3>Huntress</h3>
      <p><a class="btn btn-default btnArticle" href="index.php?controle=produits&action=afficherProduit&id=3" role="button">Détails > </a></p>
    </div><!-- /.col-lg-4 -->
  </div><!-- /.row -->
</div>

<div class="container">
  <div class="row">
    <h3 class="text-divider"><span>Meilleures ventes</span></h3>
  </div>

  <div class="row itemsAccueil">
    <div class="col-lg-4 col-xs-4 text-center">
      <img class="img-responsive" src="vue/images/wonderwoman.jpg" alt="">
      <h3>Wonder Woman</h3>
      <p><a class="btn btn-default btnArticle" href="index.php?controle=produits&action=afficherProduit&id=4" role="button">Détails > </a></p>
    </div><!-- /.col-lg-4 -->
    <div class="col-lg-4 col-xs-4 text-center">
      <img class="img-responsive" src="vue/images/DCcomics/flash.jpg" alt="">
      <h3>The Flash</h3> 
      <p><a class="btn btn-default btnArticle" href="index.php?controle=produits&action=afficherProduit&id=5" role="button">Détails > </a></p>
    </div><!-- /.col-lg-4 -->
    <div class="col-lg-4 col-xs-4 text-center">
      <img class="img-responsive" src="vue/images/DCcomics/nightwing.jpg" alt="">
      <h3>Nightwing</h3>
      <p><a class="btn btn-default btnArticle" href="index.php?controle=produits&action=afficherProduit&id=6" role="button">Détails > </a></p>
    </div><!-- /.col-lg-4 -->
  </div><!-- /.row -->
</div>


<?php include('vue/templates/html-footer.tpl'); ?>
  
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

<script src="vue/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>
