
<!DOCTYPE html>

<html lang="fr">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">

    <link href="vue/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <link href="vue/css/main.css" rel="stylesheet">
    <link href="vue/css/produits.css" rel="stylesheet">

    <title>Ajout Produit - Striker Eureka</title>
</head>

<body>

  <div class="container">

    <form id="form_Modification" action="index.php?controle=administrateur&action=ajoutProduit" method="post">

        <div class="row" id="nomProduit">
          <a class="btn btn-default btn-info" id="btnRetour" href="index.php?controle=menu&action=administration" role="button">< Retour</a>
          <h2>Ajout Produit</h2>
        </div>

        <div class="row col-md-10 col-md-offset-1">
            <div class="">
              <h3 class="text-divider"></h3>
            </div>
        </div>

        <div class="row col-md-10 col-md-offset-1" id="Details">
            <div class="col-md-8 titreDetailsAdmin">
                <div class="col-md-5">
                    <h4>Détails du produit</h4>
                </div>
                  <div class="col-md-12 adminDetails">
                      <div class="col-md-6">
                          <span class="categorie"><p>Nom du produit</p></span>
                          <input type="text" class="form-control" id="nom" name="nom">
                          <span class="categorie"><p>Série</p></span>
                          <select class="form-control" id="type" name="type">
                            <?php foreach ($types as $value){ ?>
                              <option value="<?php echo $value['id_type']; ?>"><?php echo $value['nomType']; ?></option>
                            <?php } ?>
                          </select>
                          <span class="categorie"><p>Catégorie</p></span>
                          <input type="text" class="form-control" id="categorie" name="categorie">
                      </div>
                      <div class="col-md-6 adminDetails">
                          <span class="categorie"><p>Prix</p></span>
                          <input type="text" class="form-control" id="prix" name="prix">
                          <span class="categorie"><p>Dimensions</p></span>
                          <input type="text" class="form-control" id="dimensions" name="dimensions">
                          <span class="categorie"><p>Fabricant</p></span>
                          <input type="text" class="form-control" id="fabricant" name="fabricant">
                      </div>
                  </div>
            </div>
            <div class="col-md-4">
                <button class="btn btn-default btnAjoutPanier" type="submit">Modifier</button>
            </div>
            <div class="col-md-12 titreDetailsAdmin">
                <div class="col-md-3">
                    <h4>Description</h4>
                </div>
                <div class="col-md-12 infosDescription">
                    <textarea name="description" cols="100" rows="8"></textarea>
                </div>
            </div>
        </div>

        <div class="row col-md-10 col-md-offset-1">
            <div class="">
              <h3 class="text-divider"></h3>
            </div>
        </div>

        <div class="col-md-11 col-md-offset-1" id="gestionImages">

          <h4>Image Principale</h4>

          <div class="row">
             <div class="row">
                <img class="imageAdmin img-responsive" src="vue/images/noimage.png" alt="">
             </div>
             <div class="row">
                <input type="text" class="form-control" id="imagePrincipale" name="imagePrincipale" placeholder="Chemin de l'image Principale">                     
             </div> 
          </div>

          <h4>Images annexes</h4>

          <div class="row">

          <?php 
              for($i=1; $i<=5; $i++){ ?>
                  <img class="imageAdmin img-responsive" src="vue/images/noimage.png" alt="">
           <?php } ?>

         </div>
          <div class="row">

          <?php
              for($i=1; $i<=5; $i++){ ?>
                  <input type="text" class="form-control" id="image<?php echo $i;?>" name="image<?php echo $i;?>" placeholder="Entrez le chemin de l'image">
          <?php } ?> 

          </div>
        </div>

    </form>

  </div><!-- container -->


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
