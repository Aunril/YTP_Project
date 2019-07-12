
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">

    <link href="vue/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    
    <link href="vue/css/admin.css" rel="stylesheet">
    <link href="vue/css/dashboard.css" rel="stylesheet">

    <title>Dashboard Admin</title>

  </head>

  <body>

    <?php include('vue/templates/html-header-admin.tpl'); ?>

        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h1 class="page-header">Liste des commandes à envoyer</h1>

        <div id="commandes">
        
          <?php if($commande==null){ ?>

            <h3>Aucune commande à envoyer n'est enregistrée.</h3>

        <?php }else{ ?>

            <div class="table-responsive">
            <table class="table table-bordered">
              <thead>
                  <td>ID COMMANDE</td>
                  <td>ID PRODUIT</td>
                  <td>QUANTITE</td> 
                  <td>NOM CLIENT</td>
                  <td>PRENOM CLIENT</td>
                  <td>ADRESSE CLIENT</td>
                  <td>ENVOYER</td>
              </thead>
              <?php
                foreach($commande as $value){          
                ?>
                <tr>
        <th><?php echo $value['id_commande']?></th>

                  <td><?php echo $value['id_produit']?></td>
                      <td><?php echo $value['quantite']?></td>
                  <td><?php echo $value['nom']?></td>
                  <td><?php echo $value['prenom']?></td>
                  <td><?php echo $value['adresse'] ?>  <?php echo $value['codepostal'] ?>  <?php echo $value['ville']?></td>
                  <td>
                  <a class="btn btn-default btnArticle" id="bouton_envoyer" href="index.php?controle=administrateur&action=envoyer_produit&id=<?php echo $value['id_produit'] ?>&id_cmd=<?php echo $value['id_commande']?>" role="button">Send</a>
                  </td>
                </tr>
                <?php } ?>
            </table>
            </div>


          </div>

        <?php } ?>

        </div>
      </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="vue/bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>
