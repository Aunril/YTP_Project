<!DOCTYPE html>

<html lang="fr">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">

    <link href="vue/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <link href="vue/css/main.css" rel="stylesheet">
    <link href="vue/css/admin.css" rel="stylesheet">

    <title>Administrateur - Striker Eureka</title>
</head>

<?php

  print_r($clients);

?>

<body>


  <div class="container-fluid">
    <h1>Page Administrateur : nom prénom</h1>
  </div>

  <div class="container-fluid">
    
    <table class="table table-bordered">
      <tr>
          <td>ID CLIENT</td>
          <td>NOM</td>
          <td>PRENOM</td>
          <td>E-MAIL</td>
          <td>ADRESSE</td>
      </tr>
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

  
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

<script src="vue/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>