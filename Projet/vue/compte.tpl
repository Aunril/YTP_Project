
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

<?php 

  $form= isset($_GET['form'])?($_GET['form']):'cache';

  if($form=='cache'){ ?>

<style type"text/css">
    #formModif{
        display: none;
    }
    #formComplet{
        display: visible;
    }
</style>

<?php } else { ?>
  
<style type"text/css">
    #formModif{
        display: visible;
    }
    #formComplet{
        display: none;
    }
</style>

<?php } ?>

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
        <div id="formComplet">
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

        <div id="formModif">
            <form id="form_Modification" action="index.php?controle=utilisateur&action=modification" method="post">
            <div class="form-group">
              <label for="emailins">E-mail</label>
              <input type="email" class="form-control" id="emailins" placeholder="Entrez l'e-mail" name="emailins" value="<?php echo $_SESSION['profil']['email'] ?>">
            </div>
            <div class="form-group">
              <label for="mdpmodif">Mot de passe</label>
              <input type="text" class="form-control" id="mdpmodif" placeholder="Entrez un nouveau mot de passe si besoin" name="mdpmodif" value="">
            </div>
            <div class="form-group">
              <label for="adresse">Adresse</label>
              <input type="text" class="form-control" id="adresse" placeholder="Entrez votre adresse" name="adresse" value="<?php echo $_SESSION['profil']['adresse'] ?>">
            </div>
            <div class="form-group">
              <label for="cp">Code Postal</label>
              <input type="number" class="form-control" id="cp" placeholder="Entrez votre code postal" name="cp" value="<?php echo $_SESSION['profil']['codepostal']?>">
            </div>
            <div class="form-group">
              <label for="ville">Ville</label>
              <input type="text" class="form-control" id="ville" placeholder="Entrez votre ville" name="ville" value="<?php echo $_SESSION['profil']['ville']?>">
            </div>
              <button type="submit" class="btn btn-default btnArticle">Modifier mes informations</button>
              <a class="btn btn-default btnArticle" href="index.php?controle=menu&action=compte&form=cache" role="button"> Fermer </a>
          </form> 
        </div>
      </div>

      <br><br>

      <a class="btn btn-default btnArticle" href="index.php?controle=menu&action=compte&form=visible" role="button">MODIFIER</a>
      <a class="btn btn-default btnArticle" href="index.php?controle=utilisateur&action=deconnexion" role="button">DECONNEXION </a>
    </div>


    <div id="commandes" class="informations col-md-6">

      <h3>Mes Commandes</h3>
      <br>
      
    <?php
      if($produits==null){ ?>
        <h4 class="categorieVide">Aucune commande en cours</h4>
      <?php }else{ ?>
      <table class="table table-striped table-hover">
          <thead>
            <tr>
              <th scope="col">N°Commande</th>
              <th scope="col">Produit</th>
              <th scope="col">Quantité</th>
              <th scope="col">Prix</th>
            </tr>
          </thead>
          <tbody>
              <?php foreach($produits as $value){          
              ?>
              <tr>
                <th><?php echo $value['id_commande']?></th>
                <td><?php echo $value['nom']?></td>
                <td><?php echo $value['quantite']?></td>
                <td><?php echo $value['prix']?> €</td>
              </tr>
              <?php } ?>
          </tbody>
      </table>
      <?php } ?>
    </div>

    <div id="historique" class="informations col-md-11">

      <h3>Mon historique de commandes</h3>
      <br>

      <?php if($historique==null){ ?>
        <h4 class="categorieVide">Aucun historique de commande</h4>
      <?php }else{ ?>
      <table class="table table-striped table-hover">
          <thead>
            <tr>
              <th scope="col">N°Commande</th>
              <th scope="col">Date</th>
              <th scope="col">Produit</th>
              <th scope="col">Quantité</th>
              <th scope="col">Prix</th>
            </tr>
          </thead>
          <tbody>
          <?php
            foreach($historique as $value){          
            ?>
            <tr>
              <th><?php echo $value['id_commande']?></th>
              <th><?php echo $value['date']?></th>
              <td><?php echo $value['nom']?></td>
              <td><?php echo $value['quantite']?></td>
              <td><?php echo $value['prix']?> €</td>
            </tr>
            <?php } ?>
          </tbody>
      </table>
      <?php } ?>
    </div>
    

  </div>
  

  <?php include('vue/templates/html-footer.tpl'); ?>


  
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

<script src="vue/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>
