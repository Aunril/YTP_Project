
<!DOCTYPE html>

<html lang="fr">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">

    <link href="vue/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <link href="vue/css/main.css" rel="stylesheet">
    <link href="vue/css/produits.css" rel="stylesheet">

    <title><?php echo $informations['nom'];?> - Striker Eureka</title>
</head>
  
<body>

  <div class="container">

    <form id="form_Modification" action="index.php?controle=administrateur&action=modification" method="post">

        <div class="row" id="nomProduit">
          <h2><?php echo $informations['nom'];?></h2>
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
                          <input type="text" class="form-control" id="nom" name="nom" value="<?php echo $informations['nom']?>">
                          <span class="categorie"><p>Série</p></span>
                          <input type="text" class="form-control" id="type" name="type" value="<?php echo $informations['nomType']?>">
                          <span class="categorie"><p>Catégorie</p></span>
                          <input type="text" class="form-control" id="categorie" name="categorie" value="<?php echo $informations['categorie']?>">
                      </div>
                      <div class="col-md-6 adminDetails">
                          <span class="categorie"><p>Prix</p></span>
                          <input type="text" class="form-control" id="prix" name="prix" value="<?php echo $informations['prix']?>">
                          <span class="categorie"><p>Dimensions</p></span>
                          <input type="text" class="form-control" id="dimensions" name="dimensions" value="<?php echo $informations['dimensions']?>">
                          <span class="categorie"><p>Fabricant</p></span>
                          <input type="text" class="form-control" id="fabricant" name="fabricant" value="<?php echo $informations['fabricant']?>">
                      </div>
                  </div>
            </div>
            <div class="col-md-4">
                <a class="btn btn-default btnAjoutPanier" href="index.php?controle=administrateur&action=modifier_produit&id=<?php echo $informations['id_produit'] ?>" role="button">Modifier</a><!-- valider avec le formulaire -->
            </div>
            <div class="col-md-12 titreDetailsAdmin">
                <div class="col-md-3">
                    <h4>Description</h4>
                </div>
                <div class="col-md-12 infosDescription">
                    <textarea name="description" cols="100" rows="8"><?php echo $informations['description']?></textarea>
                </div>
            </div>
        </div>

        <div class="row col-md-10 col-md-offset-1">
            <div class="">
              <h3 class="text-divider"></h3>
            </div>
        </div>

        <div class="row col-md-10 col-md-offset-1">
          <?php 
            $cpt=1;
            foreach($images as $value){
              if(isset($value)){?>
                  <img class="imageAdmin img-responsive" src="<?php echo $value?>" alt="">
          <?php    $cpt++;                
              }
            }     

            $cpt=1;
            foreach($images as $value){
              if(isset($value)){?>
                 <input type="text" class="form-control" id="image<?php echo $cpt;?>" name="image<?php echo $cpt;?>" value="<?php echo $value;?>">
          <?php    $cpt++;                
              }
            }  

            if($cpt<6){
              for ($cpt; $cpt <= 5; $cpt++) { ?>
                  <img class="imageAdmin img-responsive" src="vue/images/noimage.png" alt=""><input type="text" class="form-control" id="image<?php echo $cpt;?>" name="image<?php echo $cpt;?>" placeholder="Entrez le chemin de l'image">
          <?php }
            }
          ?>
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
