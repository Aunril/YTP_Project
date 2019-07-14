
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

              <div class="table-responsive">
              <table class="table table-bordered table-striped">
                <thead>
                    <td>ID MESSAGE</td>
                    <td>NOM</td>
                  	<td>EMAIL</td>
                    <td>MESSAGE</td>
										<td>REPONDRE</td>
                </thead>
                <?php
                  foreach($contacts as $value){          
                  ?>
                  <tr>
                 		<th><?php echo $value['id_contact']?></th>
                    <td><?php echo $value['name']?></td>
                    <td><?php echo $value['email']?></td>
                    <td><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#Modal<?php echo  $value['id_contact'] ?>">
 											 Afficher message
										</button></td>

										<td>
											<a class="btn btn-primary" id="envoyer" href="index.php?controle=contacter&action=envoyer_message&id=<?php echo $value['id_contact'] ?>" role="button">Répondu</a>

											
										</td>
							

										<div class="modal fade" id="Modal<?php echo  $value['id_contact'] ?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  										<div class="modal-dialog" role="document">
    										<div class="modal-content">
      										<div class="modal-header">
        										<h5 class="modal-title" id="exampleModalLabel">Message</h5>
        										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          										<span aria-hidden="true">&times;</span>
        										</button>
      									</div>
      									<div class="modal-body">
													<p id="message_contact" ><?php echo $value['message']?></p>
      									</div>
      									<div class="modal-footer">
        									<button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>
      									</div>
    									</div>
  									</div>
										</div>

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
