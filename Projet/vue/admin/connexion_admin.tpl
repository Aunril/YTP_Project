
<!DOCTYPE html>

<html lang="fr">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">

    <link href="vue/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <link href="vue/css/main.css" rel="stylesheet">
    <link href="vue/css/connexion.css" rel="stylesheet">

    <title>Connexion - Striker Eureka</title>
</head>

<body>
  <div class="container-fluid" id="bandeau">
    <div class="row">
      <div class="col-md-3 col-md-offset-1 col-xs-3">
        <a href="index.php?controle=menu&action=accueil"><img class="img-responsive" id="nomSite" src="vue/images/Nom2.png" alt="Nom du site"></a>
      </div>
    </div>
  </div>

<div class="container-fluid" id="infosConnexion">
  <div class="container">
    <div class="col-md-6 col-md-offset-3 signIn">
      <h2>Accès Administrateur</h2>
      <p>Cette page est réservée aux administrateurs du site Striker Eureka.</p>

      <form action="index.php?controle=administrateur&action=connexionAdmin" method="post">
        <div class="form-group">
          <label for="login">Login</label>
          <input type="login" class="form-control" id="login" name="login">
        </div>
        <div class="form-group">
          <label for="password">Password</label>
          <input type="password" class="form-control" id="password" name="password">
        </div>
        <div class="col-md-12 text-center"> 
         <button type="submit" class="btn btn-default btnArticle">Se Connecter</button>
        </div>
      </form>

      <div class="msgErreur">
        <p><?php 

        $msg= isset($msg)?($msg):'';

        echo $msg; ?></p>
      </div>
    </div>   
 
  </div>
</div>

<?php include('vue/templates/html-footer.tpl'); ?>
  
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

<script src="vue/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>