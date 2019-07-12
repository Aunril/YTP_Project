
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">

    <link href="vue/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    
    <link href="vue/css/dashboard.css" rel="stylesheet">

    <title>Dashboard Admin</title>

  </head>

  <body>

    <?php include('vue/templates/html-header-admin.tpl'); ?>

        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
          <h1 class="page-header">Liste des produits</h1>

            <div id="produits">
              <br>
              <a class="btn btn-default btn-danger" href="index.php?controle=administrateur&action=PageAjoutProduit" role="button">+ Ajouter un produit </a>
              
              <form class="rechercheForm" action="index.php?controle=administrateur&action=produitsBDD" method="post">
                  <div>
                      <input type="search" id="recherche" name="recherche">
                      <button class="btn btn-default">Rechercher un nom de produit</button>
                  </div>
              </form>
              <br>
              <br>
              <br>
              <div class="table-responsive">
              <table class="table table-bordered table-striped">
                <thead>
                    <td>ID PRODUIT</td>
                    <td>NOM</td>
                    <td>TYPE</td>
                    <td>PRIX</td>
                    <td>INFORMATIONS</td>
                    <td>AJOUT STOCK</td>
                </thead>
                <?php
                  foreach($produits as $value){          
                  ?>
                  <tr>
                    <th><?php echo $value['id_produit']?></th>
                    <td><?php echo $value['nom']?></td>
                    <td><?php echo $value['nomType']?></td>
                    <td><?php echo $value['prix']?> €</td>
                    <td><p><a class="btn btn-default btn-info" href="index.php?controle=administrateur&action=afficherProduit&id=<?php echo $value['id_produit'] ?>" role="button">Détails > </a></p></td>
                    <td> <p><a class="btn btn-default btn-info" href="index.php?controle=administrateur&action=ajout_stock&id=<?php echo $value['id_produit'] ?>" role="button">+</a>
        <a class="btn btn-default btn-info" href="index.php?controle=administrateur&action=enlever_stock&id=<?php echo $value['id_produit'] ?>" role="button">-</a>
        <?php echo $value['stock'] ?>
        </p>

                    </td>
                  </tr>
                  <?php } ?>
              </table>
              </div>
            </div>

        </div>
      </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="vue/bootstrap/js/bootstrap.min.js"></script>
  </body>
</html>
