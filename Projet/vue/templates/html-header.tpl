    <nav class="navbar navbar-inverse">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <!--<a class="navbar-brand" href="#">Striker Eureka</a>-->
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li><a href="#">Nous contacter</a></li>
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Nos produits<span class="caret"></span></a>
                <ul class="dropdown-menu">
                  <li role="separator" class="divider"></li>
                  <li class="dropdown-header">Figurines</li>
                  <li><a href="index.php?controle=menu&action=DCcomics">DC Comics</a></li>
                  <li><a href="index.php?controle=menu&action=marvel">Marvel</a></li>
                  <li><a href="index.php?controle=menu&action=manga">Manga</a></li>
                  <li><a href="index.php?controle=menu&action=jv">Jeux Vidéo</a></li>
                  <li role="separator" class="divider"></li>
                  <li class="dropdown-header">Stickers</li>
                  <li><a href="index.php?controle=menu&action=films">Films</a></li>
                  <li><a href="index.php?controle=menu&action=musique">Musique</a></li>
                </ul>
              </li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <li><a href="index.php?controle=menu&action=compte">Mon compte <span class="glyphicon glyphicon-user"></span></a></li>
            <li><a href="index.php?controle=menu&action=panier">Panier <span class="glyphicon glyphicon-shopping-cart"></span></a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>

  <div class="container">
    <div class="row">

    <a href="index.php?controle=menu&action=accueil">
      <div class="col-md-2 col-xs-2">
        <img class="img-responsive" src="vue/images/logo2.jpg" alt="Logo du site">
      </div>
      <div class="col-md-4 col-xs-4">
        <img class="img-responsive" id="nomSite" src="vue/images/Nom2.png" alt="Nom du site">
      </div>
    </a>

      <div class="col-md-3 col-md-offset-3 col-xs-3">
        <form class="form-group" role="search">
          <div class="input-group add-on" id="formRecherche">
            <input class="form-control" id="champRecherche" placeholder="Recherche" name="srch-term" id="srch-term" type="text">
            <div class="input-group-btn">
              <button class="btn btn-default" id="btnRecherche" type="submit"><i class="glyphicon glyphicon-search"></i></button>
            </div>
          </div>
        </form>
      </div>

    </div>
  </div>

  <hr>

  <nav class="navbar">
  <div class="container">
      <div id="navbar" class="collapse navbar-collapse">
        <ul class="nav navbar-nav" id="menu">
          <li id="home"><a href="index.php?controle=menu&action=accueil">Accueil</a></li>
          <li class="lienMenu"><a href="index.php?controle=menu&action=DCcomics">DC Comics</a></li>
          <li class="lienMenu"><a href="index.php?controle=menu&action=marvel">Marvel</a></li>
          <li class="lienMenu"><a href="index.php?controle=menu&action=manga">Manga</a></li>
          <li class="lienMenu"><a href="index.php?controle=menu&action=jv">Jeux Vidéo</a></li>
          <li class="lienMenu"><a href="index.php?controle=menu&action=films">Films-TV</a></li>
          <li class="lienMenu"><a href="index.php?controle=menu&action=musique">Musique</a></li>
        </ul>  
  </div> 
  </nav>