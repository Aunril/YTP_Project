
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

  <div class="container-fluid" id="entete">
    <h1>Mon Compte</h1>
  </div>

  <div class="container-fluid">

    <div id="infosCompte" class="informations col-md-5">
      <h3>Mes informations</h3>
      <br>

      <div id="donnees">
        <h4> Nom :</h4>
        <p> <?php echo $_SESSION['profil']['prenom'] . " " . $_SESSION['profil']['nom']?> </p>
        <br>
        <h4> Adresse :</h4>
        <p><?php echo $_SESSION['profil']['adresse'] ?></p>
        <p><?php echo $_SESSION['profil']['codepostal'] . " " . $_SESSION['profil']['ville']?></p>
        <br>
        <h4>Adresse e-mail :</h4>
        <p><?php echo $_SESSION['profil']['email'] ?></p>
      </div>

      <br><br>

      <a class="btn btn-default btnArticle" href="index.php?controle=connexion&action=modification" role="button">MODIFIER</a>
      <a class="btn btn-default btnArticle" href="index.php?controle=connexion&action=deconnexion" role="button">DECONNEXION </a>
    </div>

    <div class="informations col-md-6">

    </div>
    

  </div>
  

  <?php include('vue/templates/html-footer.tpl'); ?>


  
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

<script src="vue/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>
