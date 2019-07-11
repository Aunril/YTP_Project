  <div class="container">
    <div class="row">
      <h3 class="text-divider"></h3>
    </div>

    <?php 

        $cpt=0;

        if($listeProduits==null){ ?>
          <h4 class="categorieVide">Aucun produit dans cette catégorie pour l'instant :(</h4>
        <?php }

        foreach($listeProduits as $value){
          if($cpt%4==0){ ?>
            <div class="row items">
          <?php } 

          $cpt=++$cpt; ?>

          <div class="col-lg-3 col-xs-6 text-center">
            <img class="img-responsive" src="<?php echo $value['imagePrincipale'] ?>" alt="">
            <h4><?php echo $value['nom'] ?></h4>
            <p><?php echo $value['categorie'] ?></p>
            <h4><?php echo $value['prix'] ?>€</h4>
            <p><a class="btn btn-default btnArticle" href="index.php?controle=produits&action=afficherProduit&id=<?php echo $value['id_produit'] ?>" role="button">Détails > </a></p>
          </div><!-- /.col-lg-3 -->

          <?php 

          if($cpt%4==0){ ?>
            </div><!-- /.row -->
          <?php }

        }

    ?>
    </div>