
<!DOCTYPE html>

<html lang="fr">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">

    <link href="vue/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <link href="vue/css/main.css" rel="stylesheet">
    <link href="vue/css/compte.css" rel="stylesheet">

    <title>Mon Compte - Striker Eureka</title>
</head>
  



<body>
  <?php include('vue/templates/html-header.tpl'); ?>

  <hr>

  <div class="container">

    <h3>MON COMPTE !!!!!!!!!!!!!!!!! </h3>

    <p> Je suis <?php echo $_SESSION['profil']['prenom'] . " " . $_SESSION['profil']['nom']?></p>

    <a class="btn btn-default btnArticle" href="index.php?controle=connexion&action=deconnexion" role="button">DECONNEXION </a>

  </div>
  

  <?php include('vue/templates/html-footer.tpl'); ?>


  
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

<script src="vue/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>
