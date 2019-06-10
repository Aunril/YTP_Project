Structure du site en MVC (modèle - vue - contrôleur)

Le site se lance à l'aide de index.php

Des templates pour le header & footer des pages ont été créés pour ne pas dupliquer le code

Pour tester une page en particulier : modifier la redirection du index.php (qui va chercher une fonction dans le contrôleur "menu.php", le require permet alors d'ouvrir la page)

***** Pour la BDD *****

le connexion à la bdd se trouve dans le script modele/connectBD.php

nom de la base : striker_eureka

connexion à phpmyadmin avec login : root (pas de mot de passe)
