
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
  <?php include('vue/templates/html-header.tpl'); ?>

  <hr>

  <div class="container">

        <div class="row" id="nomProduit">
          <h2><?php echo $informations['nom'];?></h2>
        </div>

        <!-- main slider carousel -->
        <div class="row col-md-10 col-md-offset-1">
          <!--<div class="col-md-8" id="slider">-->
          <div class="col-md-10 col-md-offset-1">
            <div id="myCarousel" class="carousel slide">
              <!-- main slider carousel items -->
              <div class="carousel-inner">
                <?php 
                  $cpt=0;
                  foreach($images as $value){
                    if(isset($value)){
                      if($cpt==0){ ?>
                        <div class="active item" data-slide-number="<?php echo $cpt?>" style="width:800px; height:500px; background:url('<?php echo $value?>');">     
                        </div> 
                      <?php }else{ ?>
                        <div class="item" data-slide-number="<?php echo $cpt?>" style="width:800px; height:500px; background:url('<?php echo $value?>') no-repeat center center; background-size: cover;">
                        </div>
                      <?php
                      }
                      $cpt++;
                    }
                  }      
                ?>
              </div>
            </div>
          </div>

        <!-- thumb navigation carousel -->
        <div class="miniatures col-md-10 col-md-offset-1">
            <!-- thumb navigation carousel items -->
            <ul class="list-inline liste">
              <?php 
                $cpt=0;
                foreach($images as $value){
                  if(isset($value)){
                    if($cpt==0){ ?>
                      <li> <a id="carousel-selector-<?php echo $cpt?>" class="selected">
                      <img class="miniature img-responsive" src="<?php echo $value?>" alt="">
                      </a></li>
                    <?php }else{ ?>
                      <li> <a id="carousel-selector-<?php echo $cpt?>">
                      <img class="miniature img-responsive" src="<?php echo $value?>" alt="">
                      </a></li>
                    <?php
                    }
                    $cpt++;
                  }
                }      
              ?>
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
                          <p><?php echo $informations['nom']?></p>
                          <span class="categorie"><p>Série</p></span>
                          <p><?php echo $informations['nomType']?></p>
                          <span class="categorie"><p>Catégorie</p></span>
                          <p><?php echo $informations['categorie']?></p>
                      </div>
                      <div class="col-md-6">
                          <span class="categorie"><p>Prix</p></span>
                          <p><?php echo $informations['prix']?> €</p>
                          <span class="categorie"><p>Dimensions</p></span>
                          <p><?php echo $informations['dimensions']?> cm</p>
                          <span class="categorie"><p>Fabricant</p></span>
                          <p><?php echo $informations['fabricant']?></p>
                      </div>
                  </div>
            </div>
            <div class="col-md-4">
	    <?php

	    	if ($stock == 0)
		{
		?>
			<a class="btn btn-default btnAjoutPanier2" role="button">Ajouter au Panier</a>

		<?php
		}
		else
		{
		?>
			<a class="btn btn-default btnAjoutPanier" href="index.php?controle=panier&action=ajouter_panier&id=<?php echo $informations['id_produit'] ?>" role="button">Ajouter au Panier</a>

<?php
		}
		?>
            </div>
            <div class="col-md-12 titreDetails">
                <div class="col-md-3">
                    <h4>Description</h4>
                </div>
                <div class="col-md-12 infosDescription">
                    <p><?php echo $informations['description']?></p>
                </div>
            </div>
        </div>


  </div><!-- container -->












<div class="modal fade" id="pastock" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>







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
