
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
          <h1 class="page-header">Historique des commandes</h1>

           <div id="historique">
              <div class="table-responsive">
              <table class="table table-bordered table-striped">
                <thead>
                    <td>ID COMMANDE</td>
                    <td>PRIX</td>
                </thead>
                <?php
                  foreach($histo as $value){
                  ?>
                  <tr>
                    <th><?php echo $value['id_commande']?></th>
                    <td><?php echo $value['total']?>€</td>
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
