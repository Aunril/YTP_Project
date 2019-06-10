
<!DOCTYPE html>

<html lang="fr">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">

    <link href="vue/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <link href="vue/css/main.css" rel="stylesheet">
    <link href="vue/css/produits.css" rel="stylesheet">

    <title>Produit - Striker Eureka</title>
</head>
  



<body>
  <?php include('vue/templates/html-header.tpl'); ?>

  <hr>


  <div class="container">

        <div class="row" id="nomProduit">
          <h2>Emma Frost</h2>
        </div>

        <!-- main slider carousel -->
        <div class="row col-md-10 col-md-offset-1">
          <!--<div class="col-md-8" id="slider">-->
              <div class="col-md-10 col-md-offset-1">
                <div id="myCarousel" class="carousel slide">
                  <!-- main slider carousel items -->
                  <div class="carousel-inner">
                    <div class="active item" data-slide-number="0" style="width:800px; height:500px; background:url('vue/images/produits/1/emma1.jpg');">     
                    </div>
                    <div class="item" data-slide-number="1" style="width:800px; height:500px; background:url('vue/images/produits/1/emma2.jpg') no-repeat center center; background-size: cover;">
                    </div>
                    <div class="item" data-slide-number="2" style="width:800px; height:500px; background:url('vue/images/produits/1/emma3.jpg') no-repeat center center; background-size: cover;">
                    </div>
                    <div class="item" data-slide-number="3" style="width:800px; height:500px; background:url('vue/images/produits/1/emma4.jpg') no-repeat center center; background-size: cover;">
                    </div>
                  </div>
                </div>
              </div>

        <!-- thumb navigation carousel -->
        <div class="miniatures col-md-10 col-md-offset-1">
            <!-- thumb navigation carousel items -->
            <ul class="list-inline liste">
            <li> <a id="carousel-selector-0" class="selected">
            <img class="miniature img-responsive" src="vue/images/produits/1/emma1.jpg" alt="">
            </a></li>
            <li> <a id="carousel-selector-1">
            <img class="miniature img-responsive" src="vue/images/produits/1/emma2.jpg" alt="">
            </a></li>
            <li> <a id="carousel-selector-2">
            <img class="miniature img-responsive" src="vue/images/produits/1/emma3.jpg" alt="">
            </a></li>
            <li> <a id="carousel-selector-3">
            <img class="miniature img-responsive" src="vue/images/produits/1/emma4.jpg" alt="">
            </a></li>
            </ul>
        </div>

        </div>
        <!--/main slider carousel-->

        <div class="row col-md-10 col-md-offset-1">
            <div class="">
              <h3 class="text-divider"></h3>
            </div>
        </div>

        <div class="row col-md-10 col-md-offset-1" id="Details">
            <div class="col-md-8 titreDetails">
                <div class="col-md-5">
                    <h4>Détails du produit</h4>
                </div>
                  <div class="col-md-12 infosDetails">
                      <div class="col-md-6">
                          <span class="categorie"><p>Nom du produit</p></span>
                          <p>Emma Frost</p>
                          <span class="categorie"><p>Série</p></span>
                          <p>DC comics</p>
                          <span class="categorie"><p>Catégorie</p></span>
                          <p>1/4 Scale - Format Premium</p>
                      </div>
                      <div class="col-md-6">
                          <span class="categorie"><p>Prix</p></span>
                          <p>575€</p>
                          <span class="categorie"><p>Dimensions</p></span>
                          <p>85cm</p>
                          <span class="categorie"><p>Manufacturier</p></span>
                          <p>SideShow</p>
                      </div>
                  </div>
            </div>
            <div class="col-md-4">
                <a class="btn btn-default btnAjoutPanier" href="#" role="button">Ajouter au Panier</a>
            </div>
            <div class="col-md-12 titreDetails">
                <div class="col-md-3">
                    <h4>Description</h4>
                </div>
                <div class="col-md-12 infosDescription">
                    <p>Bow before the White Queen! Sideshow is proud to present the Emma Frost Premium Format™ Figure, the next addition to the X-Men Collection. 

The Emma Frost Premium Format™ Figure measures 19.5” tall as the talented telepath takes a stand on a destroyed Cerebro room base. Cyclops’s visor, Juggernaut’s footprint, and Wolverine’s distinctive claw marks can be seen among the debris of the mutant mindwave device. 

Captured in a moment of intense telepathic focus, the Emma Frost Premium Format™ Figure looks elegant in her flowing white fabric cape, custom tailored with internal wiring to allow for posing. Emma Frost wears a sculpted white costume along with gloves and boots, all detailed with lifelike textures of stitching and lacing, subtly patterned with her diamond motif. Her blonde hair flows around her beautiful portrait as she focuses her immense mental powers on stopping the threat at hand. </p>
                </div>
            </div>
        </div>


  </div><!-- container -->

<?php include('vue/templates/html-footer.tpl'); ?>

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

<script src="vue/bootstrap/js/bootstrap.min.js"></script>


  <script>
    $('#myCarousel').carousel({
      interval: 0
    });

    // handles the carousel thumbnails
    $('[id^=carousel-selector-]').click( function(){
      var id_selector = $(this).attr("id");
      var id = id_selector.substr(id_selector.length -1);
      id = parseInt(id);
      $('#myCarousel').carousel(id);
      $('[id^=carousel-selector-]').removeClass('selected');
      $(this).addClass('selected');
    });

    // when the carousel slides, auto update
    $('#myCarousel').on('slid', function (e) {
      var id = $('.item.active').data('slide-number');
      id = parseInt(id);
      $('[id^=carousel-selector-]').removeClass('selected');
      $('[id=carousel-selector-'+id+']').addClass('selected');
    });

    //part of the DatePicker
    $(document).ready(function(){
        var date_input=$('input[name="date"]'); //our date input has the name "date"
        var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
        var options={
          format: 'mm/dd/yyyy',
          container: container,
          todayHighlight: true,
          autoclose: true,
        };
        date_input.datepicker(options);
      })
  </script>

</body>
</html>
