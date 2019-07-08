
<!DOCTYPE html>

<html lang="fr">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">

    <link href="vue/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <link href="vue/css/main.css" rel="stylesheet">
		<link href="vue/css/paiement_reussi.css" rel="stylesheet">


    <title>Paiement - Striker Eureka</title>
</head>
  

<body>
  <?php include('vue/templates/html-header.tpl'); ?>

  <div class="container-fluid" id="paiement_reussi">
      <div class="row">
          <div class="col-md-12">
              <h1>Confirmation d'achat </h1>
          </div>
      </div>
      
      <div class="col-md-5 col-md-offset-2"> 
	      <p> Votre achat a bien été effectué ! <br> À bientôt sur Striker Eureka ! </p>
      </div> 
      <div class="col-md-3">
          <img class="img img-responsive" id="imgJoie" src="vue/images/joie.png" alt="joie">
        </div>
    </div>
  </div>
  
  <?php include('vue/templates/html-footer.tpl'); ?>
  
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

<script src="vue/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>
