
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
                  <td>MOT DE PASSE</td>
                  <td>ADRESSE</td>
                  <td>CODE POSTAL</td>
                  <td>VILLE</td>
                  <td></td>
                  <td></td>
              </thead>



              <thead>
                <form action="index.php?controle=administrateur&action=clientsBDD" method="post">
                  <input type="hidden" name="act" value="N"> 
                  <input type="hidden" name="id" value="<?php echo $usr_id_upd ; ?>">
                      
                  <td><input type="text" name="usr_id" value="<?php echo $usr_id_upd ; ?>" placeholder="ID" disabled></td>
                  <td><input type="text" name="usr_nom" value="<?php echo $usr_nom_upd ; ?>" placeholder="Nom"></td>
                  <td><input type="text" name="usr_prenom" value="<?php echo $usr_prenom_upd ; ?>"  placeholder="Prénom"></td>
                  <td><input type="text" name="usr_email" value="<?php echo $usr_email_upd ; ?>"  placeholder="Email"></td>
                  <td><input type="text" name="usr_pass" value="<?php echo $usr_pass_upd ; ?>"  placeholder="Mot de passe"></td>
                  <td><input type="text" name="usr_adr" value="<?php echo $usr_adr_upd ; ?>"  placeholder="Adresse"></td>
                  <td><input type="text" name="usr_cp" value="<?php echo $usr_cp_upd ; ?>"  placeholder="Département"></td>
                  <td><input type="text" name="usr_ville" value="<?php echo $usr_ville_upd ; ?>"  placeholder="Ville"></td>
                  <td><input type="submit" value="Ok "></td>
                  <td></td> 
                </form>
              </thead>

              <?php
                foreach($clients as $value){          
                ?>
                <tr>
                  <th><?php echo $value['id_client']?></th>
                  <td><?php echo $value['nom']?></td>
                  <td><?php echo $value['prenom']?></td>
                  <td><?php echo $value['email']?></td>
                  <td><?php echo $value['password']?></td>
                  <td><?php echo $value['adresse'] ?></td>
                  <td><?php echo $value['codepostal'] ?></td>
                  <td><?php echo $value['ville']?></td>
                  <td> 
                      <form action="index.php?controle=administrateur&action=clientsBDD" method="post">
                        <input type="hidden" name="id" value="<?php echo $value['id_client']?>">
                        <input type="hidden" name="act" value="M"> 
                        <input type="submit" value=" M ">
                      </form>
                  </td> 
                  <td> 
                      <form action="index.php?controle=administrateur&action=clientsBDD" method="post">
                        <input type="hidden" name="act" value="S"> 
                        <input type="hidden" name="id" value="<?php echo $value['id_client']?>">
                        <input type="submit" value=" S ">
                      </form>
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
