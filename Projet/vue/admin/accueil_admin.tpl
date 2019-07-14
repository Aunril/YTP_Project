
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

      <div class="row" style="margin-top: 20px; margin-bottom: 40px;">
        <div id="commandesRestantes" class="col-md-2 col-md-offset-1">
          <h1><?php echo $nbCommandes; ?></h1>
          <h4>commandes à traiter</h4>
          <br>
          <hr>
          <br>
          <h1><?php echo $totalArticles; ?></h1>
          <h4> articles vendus toutes catégories confondues</h4> 
          <h1><?php echo $totalCommandes; ?></h1>
          <h4>commandes traitées à ce jour</h4>      
          <br>  
          <br>
        </div>

        <div id="commandesRestantes" class="col-md-8 col-md-offset-1">
          <canvas id="lineChart"></canvas>
        </div>
      </div>


    <div class="row">
      <div class="col-md-6 charts">
        <h3> Répartition des articles vendus par catégorie </h3>
        <canvas id="donutNbVendus"></canvas>
        
      </div>

      <div class="col-md-6 charts">
        <h3> Nombre d'articles vendus par catégorie </h3>
        <canvas id="barNbVendus"></canvas>
      </div>
    </div>

    <br>
    <br>

    <div class="row">
      <div class="col-md-6 charts">
        <h3> Répartition des produits disponibles par catégorie </h3>
        <canvas id="donutNbProduits"></canvas>
        
			</div>

      <div class="col-md-6 charts">
        <h3> Nombre de produits disponibles par catégorie </h3>
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
      var ctxD = document.getElementById("donutNbProduits").getContext('2d');
      var myLineChart = new Chart(ctxD, {
        type: 'doughnut',
        data: {
          labels: <?php echo json_encode($tabnomTypes); ?>,
          datasets: [{
            data: <?php echo json_encode($tabnbTypes); ?>,
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

      //barNbProduits : nombre de produits par catégorie
      var ctxB = document.getElementById("barNbProduits").getContext('2d');
      var myBarChart = new Chart(ctxB, {
        type: 'bar',
        data: {
          labels: <?php echo json_encode($tabnomTypes); ?>,
          datasets: [{
            label: 'nombre de produits',
            data: <?php echo json_encode($tabnbTypesBar); ?>,
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

      //lineChart : nombres de commandes / articles vendus par mois
      var ctxL = document.getElementById("lineChart").getContext('2d');
      var myLineChart = new Chart(ctxL, {
        type: 'line',
        data: {
          labels: <?php echo json_encode($commandesMois); ?>,
          datasets: [{
              label: "Articles vendus par mois",
              data: <?php echo json_encode($articlesNombre); ?>,
              backgroundColor: [
                'rgba(255, 206, 86, 0.2)',
              ],
              borderColor: [
                'rgba(255, 206, 86, 1)',
              ],
              borderWidth: 2
            },
            {
              label: "Commandes effectuées par mois",
              data: <?php echo json_encode($commandesNombre); ?>,
              backgroundColor: [
                'rgba(153, 102, 255, 0.2)',
              ],
              borderColor: [
                'rgba(153, 102, 255, 1)',
              ],
              borderWidth: 2
            }
          ]
        },
        options: {
          responsive: true,
          scales: {
            yAxes: [{
              ticks: {
                beginAtZero: true
              }
            }]
          }
        }
      });


      //donutNbVendus : nombre de produits vendus par catégories
      var ctxD = document.getElementById("donutNbVendus").getContext('2d');
      var myLineChart = new Chart(ctxD, {
        type: 'doughnut',
        data: {
          labels: <?php echo json_encode($tabnomTypeVendus); ?>,
          datasets: [{
            data: <?php echo json_encode($tabnbVendus); ?>,
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

      //barNbVendus : nombre de produits vendus par catégories
      var ctxB = document.getElementById("barNbVendus").getContext('2d');
      var myBarChart = new Chart(ctxB, {
        type: 'bar',
        data: {
          labels: <?php echo json_encode($tabnomTypeVendus); ?>,
          datasets: [{
            label: "nombre d'articles vendus",
            data: <?php echo json_encode($tabnbVendusBar); ?>,
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
