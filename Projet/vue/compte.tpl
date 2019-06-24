
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

    <h3>Mon Compte</h3>
    <br>
    <h4> <?php echo $_SESSION['profil']['prenom'] . " " . $_SESSION['profil']['nom']?> </h4>
    <br>
    <h4> Adresse :</h4>
    <h4><?php echo $_SESSION['profil']['adresse'] ?></h4>
    <h4><?php echo $_SESSION['profil']['codepostal'] . " " . $_SESSION['profil']['ville']?></h4>
    <br>
    <h4>Adresse e-mail :</h4>
    <h4><?php echo $_SESSION['profil']['email'] ?></h4>

    <br><br>

    <a class="btn btn-default btnArticle" href="index.php?controle=connexion&action=deconnexion" role="button">DECONNEXION </a>

  </div>
  

  <?php include('vue/templates/html-footer.tpl'); ?>


  
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

<script src="vue/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>
