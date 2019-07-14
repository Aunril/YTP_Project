Les comptes admins du site :

	- login : Admin1 et mdp : adm1
	- login : Admin2 et mdp : adm2



/!\ AJOUT TABLES /!\

La table panier est vidée une fois que l'on clique sur le bouton payer de la deuxième page paypal. (fonctionnalité à réaliser)
La table panier est une table temporaire. Elle sert à remplir la table commande (contient l'id du client et le total à payer) ainsi que la table produits_commande (contient l'id de la commande pour indiquer les produits et leur quantité)


Structure du site en MVC (modèle - vue - contrôleur)

Le site se lance à l'aide de index.php

Des templates pour le header & footer des pages ont été créés pour ne pas dupliquer le code

Pour tester une page en particulier : modifier la redirection du index.php (qui va chercher une fonction dans le contrôleur "menu.php", le require permet alors d'ouvrir la page)

***** Pour la BDD *****

le connexion à la bdd se trouve dans le script modele/connectBD.php

nom de la base : striker_eureka

connexion à phpmyadmin avec login : root (pas de mot de passe)
