
<!DOCTYPE html>

<html lang="fr">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">

    <link href="vue/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <link href="vue/css/main.css" rel="stylesheet">
		<link href="vue/css/erreur_paiement.css" rel="stylesheet">


    <title>Erreur - Striker Eureka</title>
</head>
  

<body>
  <?php include('vue/templates/html-header.tpl'); ?>

  <div class="container-fluid" id="erreur_paiement">
      <div class="row">
          <div class="col-md-12">
              <h1> LE PAIEMENT A ECHOUÉ </h1>
          </div>
      </div>
      
      <div class="col-md-5 col-md-offset-2"> 
        <p> Une erreur est survenue durant le paiement. Veuillez vérifier vos informations banquaires. Si le problème persiste, contactez contact@striker_eureka.com </p>
      </div> 
      <div class="col-md-3">
          <img class="img img-responsive" id="imgTristesse" src="vue/images/tristesse.png" alt="tristesse">
        </div>
    </div>
  </div>
	
  <?php include('vue/templates/html-footer.tpl'); ?>
  
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

<script src="vue/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>
