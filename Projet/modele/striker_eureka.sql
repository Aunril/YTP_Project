-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  lun. 17 juin 2019 à 12:37
-- Version du serveur :  5.7.26
-- Version de PHP :  7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `striker_eureka`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id_client` int(11) NOT NULL AUTO_INCREMENT,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `nom` varchar(25) NOT NULL,
  `prenom` varchar(20) NOT NULL,
  `adresse` varchar(65) NOT NULL,
  `codepostal` int(11) NOT NULL,
  `ville` varchar(30) NOT NULL,
  `connecte` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_client`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id_client`, `email`, `password`, `nom`, `prenom`, `adresse`, `codepostal`, `ville`, `connecte`) VALUES
(1, 'test@gmail.com', 'test123', 'doe', 'john', '8 rue de la révolte', 75500, 'Paris', 0),
(11, 'pauline.djamaa@gmail.com', 'po123456', 'Djamaa', 'Pauline', '8 rue du chemin des dames', 95400, 'Arnouville', 0),
(12, 'thierry@gmail.com', 'bla123', 'Lei', 'Thierry', '21 avenue maximilien', 94400, 'Vitry', 0);

-- --------------------------------------------------------

--
-- Structure de la table `images`
--

DROP TABLE IF EXISTS `images`;
CREATE TABLE IF NOT EXISTS `images` (
  `id_images` int(11) NOT NULL AUTO_INCREMENT,
  `id_produit` int(11) NOT NULL,
  `imagePrincipale` text,
  `image1` text,
  `image2` text,
  `image3` text,
  `image4` text,
  `image5` text,
  PRIMARY KEY (`id_images`),
  KEY `Clé étrangère` (`id_produit`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `images`
--

INSERT INTO `images` (`id_images`, `id_produit`, `imagePrincipale`, `image1`, `image2`, `image3`, `image4`, `image5`) VALUES
(1, 1, 'vue/images/DCcomics/emmafrost.jpg', 'vue/images/produits/1/emma1.jpg', 'vue/images/produits/1/emma2.jpg', 'vue/images/produits/1/emma3.jpg', 'vue/images/produits/1/emma4.jpg', NULL),
(2, 2, 'vue/images/produits/2/kizuna.jpg', 'vue/images/produits/2/kizuna1.jpg', 'vue/images/produits/2/kizuna2.jpg', 'vue/images/produits/2/kizuna3.jpg', NULL, NULL),
(3, 3, 'vue/images/produits/3/huntress.jpg', 'vue/images/produits/3/huntress1.jpg', 'vue/images/produits/3/huntress2.jpg', 'vue/images/produits/3/huntress3.jpg', NULL, NULL),
(4, 4, 'vue/images/produits/4/wonderwoman.jpg', 'vue/images/produits/4/wonderwoman1.jpg', 'vue/images/produits/4/wonderwoman2.jpg', 'vue/images/produits/4/wonderwoman3.jpg', 'vue/images/produits/4/wonderwoman4.jpg', NULL),
(5, 5, 'vue/images/produits/5/flash.jpg', 'vue/images/produits/5/flash1.jpg', 'vue/images/produits/5/flash2.jpg', 'vue/images/produits/5/flash3.jpg', NULL, NULL),
(6, 6, 'vue/images/produits/6/nightwing.jpg', 'vue/images/produits/6/nightwing1.jpg', 'vue/images/produits/6/nightwing2.jpg', 'vue/images/produits/6/nightwing3.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `id_produit` int(11) NOT NULL AUTO_INCREMENT,
  `id_type` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `categorie` varchar(35) NOT NULL,
  `prix` decimal(10,0) NOT NULL,
  `dimensions` decimal(10,0) NOT NULL,
  `fabricant` varchar(20) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id_produit`),
  KEY `Clé étrangère type` (`id_type`),
  KEY `id_type` (`id_type`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id_produit`, `id_type`, `nom`, `categorie`, `prix`, `dimensions`, `fabricant`, `description`) VALUES
(1, 1, 'Emma Frost', '1/4 Scale - Format Premium', '575', '85', 'SideShow', 'Bow before the White Queen! Sideshow is proud to present the Emma Frost Premium Format™ Figure, the next addition to the X-Men Collection. The Emma Frost Premium Format™ Figure measures 19.5” tall as the talented telepath takes a stand on a destroyed Cerebro room base. Cyclops’s visor, Juggernaut’s footprint, and Wolverine’s distinctive claw marks can be seen among the debris of the mutant mindwave device. Captured in a moment of intense telepathic focus, the Emma Frost Premium Format™ Figure looks elegant in her flowing white fabric cape, custom tailored with internal wiring to allow for posing. Emma Frost wears a sculpted white costume along with gloves and boots, all detailed with lifelike textures of stitching and lacing, subtly patterned with her diamond motif. Her blonde hair flows around her beautiful portrait as she focuses her immense mental powers on stopping the threat at hand.'),
(2, 3, 'Kizuna AI', '1/7th Scale', '100', '30', 'Good Smile Company', 'The popular virtual YouTuber Kizuna AI has become a new scale figure based on the cover illustration of \"Kizuna AI 1st Photo Book AI\"! Her bright smile and energetic pose have been carefully recreated. The figure features a highly detailed sculpt and intricate paintwork making for a faithful recreation.\r\n\r\nHer hair\'s pink highlights and adorable heart-shaped headband have also been captured in detail. Be sure to add her to your collection!'),
(3, 1, 'Huntress', 'Format Premium - 1/4 Scale', '999', '82', 'Prime 1 Studio', 'Sideshow and Prime 1 Studio are proud to present the 1:3 scale Huntress (Fabric Cape Edition) from Batman: Hush. Batman: Hush is a 2002-2003 comic book story arc published in the Batman monthly series. The Huntress is Helena Rosa Bertinelli, a vigilante operating out of Gotham City, and a member of the Batman Family. She is also a devout Catholic and is very in touch with her Italian heritage. Her career is inspired by a personal vendetta against organized crime, responsible for killing her entire family.'),
(4, 1, 'Wonder Woman', 'Statue 65 cm', '490', '65', 'Sideshow', 'Joining her powerful allies of the Justice League, Sideshow Collectibles is proud to present the magnificent Wonder Woman Premium Format™ Figure. \r\n\r\nHandcrafted with austere beauty and fierce determination, Princess Diana of Themyscira dons her iconic costume of stars and stripes, sworn to protect the world and uphold her mantle as Wonder Woman. Granted divine superhuman powers and superior combat skills, the warrior princess is ready to gracefully accept any challenge, armed with her golden Lasso of Truth, indestructible bracelets, and tiara. The Wonder Woman collectible figure carries a long spear across her shoulders, and her iconic shield grasped firmly at her side - but above all, she carries the Amazons’ message of peace and justice. '),
(5, 1, 'The Flash', 'Statue 80cm', '980', '80', 'Prime 1 Studio', '\"It\'s really cool you guys seem ready to do battle and stuff, but I\'ve never done battle. I\'ve just pushed some people and run away!\"\r\n\r\nSideshow and Prime 1 Studio are proud to present Flash from Justice League film. Bartholomew Henry “Barry” Allen is a young man who was struck by lightning, gaining the metahuman ability to move and vibrate his molecules at incredible superhuman speeds. Using these powers, he became the vigilante hero known as the Flash.'),
(6, 1, 'Nightwing', 'Statue 50cm', '450', '50', 'Prime 1 Studio', '\" Huh, I’m just too damn good at this.\"\r\n\r\nSideshow and Prime 1 Studio are proud to present the Nightwing Red Version from Batman: Arkham Knight. Raised by his parents in a circus, Dick Grayson was trained to be incredibly acrobatic. His parents were killed after criminals had failed to extort money from the circus. Dick was soon adopted by billionaire Bruce Wayne, who shared his secret identity and extensively trained the boy to become Batman’s sidekick, the first Robin. After he aided Batman for years, Dick eventually moved on and became a hero in his own right. As Nightwing, he worked with Batman as an ally. He was the main protagonist of the GCPD Lockdown DLC in Batman: Arkham Knight.');

-- --------------------------------------------------------

--
-- Structure de la table `type`
--

DROP TABLE IF EXISTS `type`;
CREATE TABLE IF NOT EXISTS `type` (
  `id_type` int(11) NOT NULL AUTO_INCREMENT,
  `nomType` varchar(25) NOT NULL,
  PRIMARY KEY (`id_type`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `type`
--

INSERT INTO `type` (`id_type`, `nomType`) VALUES
(1, 'DC Comics'),
(2, 'Marvel'),
(3, 'Manga'),
(4, 'Jeux Vidéo'),
(5, 'Films-TV'),
(6, 'Musique');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `fk_idProduit` FOREIGN KEY (`id_produit`) REFERENCES `produit` (`id_produit`);

--
-- Contraintes pour la table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `fk_idType` FOREIGN KEY (`id_type`) REFERENCES `type` (`id_type`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
