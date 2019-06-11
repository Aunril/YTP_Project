
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
    <div class="col-md-5 signIn">
      <h2>Connexion</h2>
      <p>Vous avez déjà un compte ? Connectez-vous ci-dessous.</p>

      <form action="index.php?controle=connexion&action=identification" method="post">
        <div class="form-group">
          <label for="emailco">E-mail</label>
          <input type="email" class="form-control" id="emailco" placeholder="Entrez l'e-mail" name="emailco">
        </div>
        <div class="form-group">
          <label for="pwdco">Mot de passe </label>
          <input type="password" class="form-control" id="pwdco" placeholder="Entrez le mot de passe" name="pwdco">
        </div>
        <div class="col-md-12 text-center"> 
         <button type="submit" class="btn btn-default btnArticle">Se Connecter</button>
        </div>
      </form>

      <div class="msgErreur" id="mdpOubli">
        <a>Mot de passe oublié ?</a>
        <p><?php 

        $msg= isset($msg)?($msg):'';

        echo $msg; ?></p>
      </div>
    </div>   

    <div class="col-md-1 hidden-sm" id="separateur"></div>

    <div class="col-md-5 col-md-offset-1 signUp">
      <h2>S'inscrire</h2>
        <p>Inscription rapide et gratuite.</p>
          <form action="index.php?controle=connexion&action=inscription" method="post">
          <div class="form-group">
            <label for="emailins">E-mail</label>
            <input type="email" class="form-control" id="emailins" placeholder="Entrez l'e-mail" name="emailins">
          </div>
          <div class="form-group">
            <label for="pwdins">Mot de passe</label>
            <input type="password" class="form-control" id="pwdins" placeholder="Entrez le mot de passe" name="pwdins">
          </div>
          <div class="form-group">
            <label for="prenom">Prénom</label>
            <input type="text" class="form-control" id="prenom" placeholder="Entrez votre prénom" name="prenom">
          </div>
          <div class="form-group">
            <label for="nom">Nom</label>
            <input type="text" class="form-control" id="nom" placeholder="Entrez votre nom" name="nom">
          </div>
          <div class="form-group">
            <label for="adresse">Adresse</label>
            <input type="text" class="form-control" id="adresse" placeholder="Entrez votre adresse" name="adresse">
          </div>
          <div class="form-group">
            <label for="cp">Code Postal</label>
            <input type="number" class="form-control" id="cp" placeholder="Entrez votre code postal" name="cp">
          </div>
          <div class="form-group">
            <label for="ville">Ville</label>
            <input type="text" class="form-control" id="ville" placeholder="Entrez votre ville" name="ville">
          </div>
          <div class="col-md-12 text-center">
            <button type="submit" class="btn btn-default btnArticle">Créer un compte</button>
          </div>
        </form>  

      <div class="msgErreur">
        <p><?php 

        $msgIns= isset($msgIns)?($msgIns):'';

        echo $msgIns; ?></p>
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