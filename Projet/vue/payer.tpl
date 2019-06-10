
<!DOCTYPE html>

<html lang="fr">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">

    <link href="vue/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <link href="vue/css/main.css" rel="stylesheet">
		<link href="vue/css/payer.css" rel="stylesheet">


    <title>Paiement - Striker Eureka</title>
</head>
  

<body>
  <?php include('vue/templates/html-header.tpl'); ?>

	 <div class="container-fluid" id="paiement_reussi">
      <div class="col-md-5 col-md-offset-2">
              <p> PASSER LA COMMANDE </p>
      </div>
      <div class="col-md-3">
          <img class="img img-responsive" id="imgJoie" src="vue/images/transaction.png" alt="joie">
      </div>
  </div>	


  <!-- Set up a container element for the button -->
  <div id="paypal-button-container"></div>

  <!-- Include the PayPal JavaScript SDK -->
  <script src="https://www.paypal.com/sdk/js?client-id=sb&currency=EUR"></script>

  <script>
		// Render the PayPal button into #paypal-button-container
  	paypal.Buttons({
            // Set up the transaction
            createOrder: function(data, actions) {
                return actions.order.create({
                    purchase_units: [{
                        amount: {
                            value: '0.01'
                        }
                    }]
                });
            },

            // Finalize the transaction
            onApprove: function(data, actions) {
                return actions.order.capture().then(function(details) {
                    // Show a success message to the buyer
                    alert('Transaction completed by ' + details.payer.name.given_name + '!');
                });
            }


        }).render('#paypal-button-container');
	</script>

  <?php include('vue/templates/html-footer.tpl'); ?>
  
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

<script src="vue/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>
