
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
          <h1 class="page-header">Liste des clients</h1>

          <div id="clients">
            <h3></h3>
            
            <div class="table-responsive">
            <table class="table table-bordered">
              <thead>
                  <td>ID CLIENT</td>
                  <td>NOM</td>
                  <td>PRENOM</td>
                  <td>E-MAIL</td>
                  <td>ADRESSE</td>
              </thead>
              <?php
                foreach($clients as $value){          
                ?>
                <tr>
                  <th><?php echo $value['id_client']?></th>
                  <td><?php echo $value['nom']?></td>
                  <td><?php echo $value['prenom']?></td>
                  <td><?php echo $value['email']?></td>
                  <td><?php echo $value['adresse'] ?>  <?php echo $value['codepostal'] ?>  <?php echo $value['ville']?></td>
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
