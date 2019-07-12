    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="index.php?controle=administrateur&action=informationsBDD">Striker Eureka - Page Administrateur</a>
        </div>
      </div>
    </nav>

    <div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li class="active"><a href="index.php?controle=administrateur&action=informationsBDD">Overview</a></li>
            <li><a href="index.php?controle=administrateur&action=commandesBDD">Commandes à envoyer</a></li>
            <li><a href="index.php?controle=administrateur&action=historiqueBDD">Historique des commandes</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li class="sectionTitre">Gestion des produits</li>
            <li><a href="index.php?controle=administrateur&action=produitsBDD">Liste des produits</a></li>
            <li><a href="index.php?controle=administrateur&action=PageAjoutProduit">Ajouter un produit</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li class="sectionTitre">Gestion des clients</li>
            <li><a href="index.php?controle=administrateur&action=clientsBDD">Liste des clients</a></li>
          </ul>
        </div>