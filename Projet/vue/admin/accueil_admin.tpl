
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">

    <link href="vue/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- framework mdb pour déployer les graphiques -->
    <link href="vue/mdb/css/mdb.min.css" rel="stylesheet">

    <link href="vue/css/admin.css" rel="stylesheet">
    <link href="vue/css/dashboard.css" rel="stylesheet">
    

    <title>Dashboard Admin</title>


  </head>

  <body>

      <?php include('vue/templates/html-header-admin.tpl'); ?>

      <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
        <h1 class="page-header">Bienvenue <?php echo $_SESSION['admin']['login_admin'];?></h1>			
			

      <div class="row">
        <h4>Nombre de clients connectés</h4>
        <div class="progress">
          <div class="progress-bar progress-bar-striped bg-danger" role="progressbar" style="width: <?php echo $pourcentageClient; ?>%" aria-valuenow="<?php echo $pourcentageClient; ?>" aria-valuemin="0" aria-valuemax="100"><?php echo $nbClientsConnectes; ?> client(s) sur <?php echo $nbClients; ?></div>
        </div>
        <h4>Nombre de messages en attente de réponse</h4>
        <div class="progress">
          <div class="progress-bar progress-bar-striped bg-warning" role="progressbar" style="width: <?php echo $pourcentageMessage; ?>%" aria-valuenow="<?php echo $pourcentageMessage; ?>" aria-valuemin="0" aria-valuemax="100"><?php echo $nbMessagesAttente; ?> message(s) sur <?php echo $nbMessages; ?></div>
        </div>
      </div>


    <div class="row">
      <div class="col-md-6 charts">
        <h3> Répartition des produits par catégorie </h3>
        <canvas id="donutNbProduits"></canvas>
        
			</div>

      <div class="col-md-6 charts">
        <h3> Nombre de produits par catégorie </h3>
        <canvas id="barNbProduits"></canvas>
      </div>
    </div>

      <br>
      <br>

	   </div>



    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="vue/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="vue/mdb/js/mdb.min.js"></script>
    <script type="text/javascript">
      //donutNbProduits : nombre de produits par catégories
    var labels = <?php echo json_encode($tabnomTypes); ?>;
    var data = <?php echo json_encode($tabnbTypes); ?>;

 /*   for(var i=0; i<jArray.length; i++){
        alert(jArray[i]);
    }*/

      var ctxD = document.getElementById("donutNbProduits").getContext('2d');
      var myLineChart = new Chart(ctxD, {
        type: 'doughnut',
        data: {
          labels,
          datasets: [{
            data,
            backgroundColor: ["#F7464A", "#46BFBD", "#FDB45C", "#949FB1", "#4D5360"],
            hoverBackgroundColor: ["#FF5A5E", "#5AD3D1", "#FFC870", "#A8B3C5", "#616774"]
          }]
        },
        options: {
          responsive: true,
          legend: {
            position: 'bottom'
          }
        }
      });

      //bar
      var data = <?php echo json_encode($tabnbTypesBar); ?>;
      var ctxB = document.getElementById("barNbProduits").getContext('2d');
      var myBarChart = new Chart(ctxB, {
        type: 'bar',
        data: {
          labels,
          datasets: [{
            label: 'nombre de produits',
            data,
            backgroundColor: [
              'rgba(255, 99, 132, 0.2)',
              'rgba(54, 162, 235, 0.2)',
              'rgba(255, 206, 86, 0.2)',
              'rgba(75, 192, 192, 0.2)',
              'rgba(153, 102, 255, 0.2)',
              'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
              'rgba(255,99,132,1)',
              'rgba(54, 162, 235, 1)',
              'rgba(255, 206, 86, 1)',
              'rgba(75, 192, 192, 1)',
              'rgba(153, 102, 255, 1)',
              'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
          }]
        },
        options: {
          scales: {
            yAxes: [{
              ticks: {
                beginAtZero: true
              }
            }]
          }
        }
      });

    </script>
  </body>
</html>
