-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  lun. 15 juil. 2019 à 12:13
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
-- Structure de la table `administrateur`
--

DROP TABLE IF EXISTS `administrateur`;
CREATE TABLE IF NOT EXISTS `administrateur` (
  `id_admin` int(11) NOT NULL AUTO_INCREMENT,
  `login_admin` varchar(30) NOT NULL,
  `pass_admin` varchar(150) NOT NULL,
  `connecte` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_admin`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `administrateur`
--

INSERT INTO `administrateur` (`id_admin`, `login_admin`, `pass_admin`, `connecte`) VALUES
(1, 'Admin1', 'd0572253c0e7cdb85b13988712cb152e', 0),
(2, 'Admin2', 'ae5a9733104904f8ece1abf0e3a9227b', 0);

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id_client` int(11) NOT NULL AUTO_INCREMENT,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `adresse` varchar(100) NOT NULL,
  `codepostal` int(11) NOT NULL,
  `ville` varchar(100) NOT NULL,
  `connecte` int(11) NOT NULL DEFAULT '0',
  `del` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_client`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id_client`, `email`, `password`, `nom`, `prenom`, `adresse`, `codepostal`, `ville`, `connecte`, `del`) VALUES
(1, 'test@gmail.com', 'cc03e747a6afbbcbf8be7668acfebee5', 'doe', 'john', '12 ohohohohoh', 84500, 'Hanon', 1, 0),
(11, 'pauline.djamaa@gmail.com', '52bc5ce0b496c6d44e804abf5f032e52', 'Djamaa', 'Pauline', '8 rue du chemin des dames', 95400, 'Arnouville', 0, 0),
(12, 'thierry@gmail.com', '4f351e69c91975f5532533db26492bd7', 'Lei', 'Thierry', '21 avenue maximilien', 94400, 'Vitry', 0, 0),
(14, 'chinebla@gmail.com', '2643ba9f12a0786eb2e0b045f884ef6c', 'Chan', 'Jacky', '7 rue chan kim', 67554, 'Nantes', 0, 1),
(18, 'samantha@hotmail.fr', '1c80dd8fa724b6c66ac5f7ee065349f9', 'Winchester', 'Sam', '12 haha', 54333, 'Marseille', 0, 0),
(19, 'judge.dread@gmail.com', 'f8ed7e2ef2d8d4ab655cbbb53da04795', 'Dread', 'Judge', '7 rue de la jstc', 55000, 'Nice', 0, 0);

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `id_commande` int(11) NOT NULL AUTO_INCREMENT,
  `id_client` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `reçu` int(11) NOT NULL DEFAULT '0',
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_commande`),
  KEY `id_client_commande` (`id_client`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id_commande`, `id_client`, `total`, `reçu`, `date`) VALUES
(1, 1, 1493, 1, '2019-06-12 16:11:09'),
(2, 1, 554, 1, '2019-07-03 16:11:09'),
(3, 19, 1433, 0, '2019-07-13 18:21:52'),
(4, 19, 1433, 0, '2019-08-06 18:32:44');

-- --------------------------------------------------------

--
-- Structure de la table `contact`
--

DROP TABLE IF EXISTS `contact`;
CREATE TABLE IF NOT EXISTS `contact` (
  `id_contact` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `repondu` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_contact`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `contact`
--

INSERT INTO `contact` (`id_contact`, `name`, `email`, `message`, `repondu`) VALUES
(1, 'lala', 'lala@gamil.com', 'problème', 0),
(2, 'Yoann', 'yoann@gmail.com', 'j\'ai un problème', 0),
(3, 'yOANN', 'lld@jkfj', 'qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq', 1),
(4, 'yao', 'dnf', 'dlmnfkjndsf', 1),
(5, 'Pauline', 'pauline.djamaa@gmail.com', 'Ceci est un message pour l\'administrateur', 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `images`
--

INSERT INTO `images` (`id_images`, `id_produit`, `imagePrincipale`, `image1`, `image2`, `image3`, `image4`, `image5`) VALUES
(1, 1, 'vue/images/produits/1/emmafrost.jpg', 'vue/images/produits/1/emma1.jpg', 'vue/images/produits/1/emma2.jpg', 'vue/images/produits/1/emma3.jpg', 'vue/images/produits/1/emma4.jpg', NULL),
(2, 2, 'vue/images/produits/2/kizuna.jpg', 'vue/images/produits/2/kizuna1.jpg', 'vue/images/produits/2/kizuna2.jpg', 'vue/images/produits/2/kizuna3.jpg', NULL, NULL),
(3, 3, 'vue/images/produits/3/huntress.jpg', 'vue/images/produits/3/huntress1.jpg', 'vue/images/produits/3/huntress2.jpg', 'vue/images/produits/3/huntress3.jpg', NULL, NULL),
(4, 4, 'vue/images/produits/4/wonderwoman.jpg', 'vue/images/produits/4/wonderwoman1.jpg', 'vue/images/produits/4/wonderwoman2.jpg', 'vue/images/produits/4/wonderwoman3.jpg', 'vue/images/produits/4/wonderwoman4.jpg', NULL),
(5, 5, 'vue/images/produits/5/flash.jpg', 'vue/images/produits/5/flash1.jpg', 'vue/images/produits/5/flash2.jpg', 'vue/images/produits/5/flash3.jpg', NULL, NULL),
(6, 6, 'vue/images/produits/6/nightwing.jpg', 'vue/images/produits/6/nightwing1.jpg', 'vue/images/produits/6/nightwing2.jpg', 'vue/images/produits/6/nightwing3.jpg', NULL, NULL),
(7, 7, 'vue/images/produits/7/joker.jpg', 'vue/images/produits/7/joker1.jpg', 'vue/images/produits/7/joker2.jpg', 'vue/images/produits/7/joker3.jpg', NULL, NULL),
(8, 8, 'vue/images/produits/8/batman.jpg', 'vue/images/produits/8/batman1.jpg', 'vue/images/produits/8/batman2.jpg', 'vue/images/produits/8/batman3.jpg', NULL, NULL),
(9, 9, 'vue/images/produits/9/mera.jpg', 'vue/images/produits/9/mera1.jpg', 'vue/images/produits/9/mera2.jpg', 'vue/images/produits/9/mera3.jpg', 'vue/images/produits/9/mera4.jpg', NULL),
(10, 14, 'vue/images/produits/10/domino.jpg', 'vue/images/produits/10/domino1.jpg', 'vue/images/produits/10/domino2.jpg', 'vue/images/produits/10/domino3.jpg', NULL, NULL),
(11, 13, 'vue/images/produits/11/deadpool.jpg', 'vue/images/produits/11/deadpool1.jpg', 'vue/images/produits/11/deadpool2.jpg', 'vue/images/produits/11/deadpool3.jpg', 'vue/images/produits/11/deadpool4.jpg', 'vue/images/produits/11/deadpool5.jpg'),
(12, 10, 'vue/images/produits/12/angela.jpg', 'vue/images/produits/12/angela1.jpg', 'vue/images/produits/12/angela2.jpg', 'vue/images/produits/12/angela3.jpg', 'vue/images/produits/12/angela4.jpg', NULL),
(13, 12, 'vue/images/produits/13/spiderman.jpg', 'vue/images/produits/13/spiderman1.jpg', 'vue/images/produits/13/spiderman2.jpg', 'vue/images/produits/13/spiderman3.jpg', NULL, NULL),
(14, 15, 'vue/images/produits/14/groot.jpg', 'vue/images/produits/14/groot1.jpg', 'vue/images/produits/14/groot2.jpg', 'vue/images/produits/14/groot3.jpg', NULL, NULL),
(15, 16, 'vue/images/produits/15/spidergwen.jpg', 'vue/images/produits/15/spidergwen1.jpg', 'vue/images/produits/15/spidergwen2.jpg', 'vue/images/produits/15/spidergwen3.jpg', 'vue/images/produits/15/spidergwen4.jpg', NULL),
(16, 17, 'vue/images/produits/16/wasp.jpg', 'vue/images/produits/16/wasp1.jpg', 'vue/images/produits/16/wasp2.jpg', 'vue/images/produits/16/wasp3.jpg', NULL, NULL),
(17, 11, 'vue/images/produits/17/captain.jpg', 'vue/images/produits/17/captain1.jpg', 'vue/images/produits/17/captain2.jpg', NULL, NULL, NULL),
(21, 18, 'vue/images/produits/18/peakyPrincipale.jpg', 'vue/images/produits/18/peaky2.jpg', 'vue/images/produits/18/peaky3.jpg', 'vue/images/produits/18/peaky1.jpg', NULL, NULL),
(23, 19, ' vue/images/produits/19/greatgatsby-principale.png', ' vue/images/produits/19/pulpf.png', ' vue/images/produits/19/scarface.jpg', ' vue/images/produits/19/taxidriver.jpg', ' vue/images/produits/19/thearrival.png', ' vue/images/produits/19/greatgatsby.png'),
(24, 20, 'vue/images/produits/20/saber.jpg', 'vue/images/produits/20/saber1.jpg', 'vue/images/produits/20/saber2.jpg', 'vue/images/produits/20/saber3.jpg', 'vue/images/produits/20/saber4.jpg', NULL),
(25, 21, 'vue/images/produits/21/miku.jpg', 'vue/images/produits/21/miku1.jpg', 'vue/images/produits/21/miku2.jpg', 'vue/images/produits/21/miku3.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `panier`
--

DROP TABLE IF EXISTS `panier`;
CREATE TABLE IF NOT EXISTS `panier` (
  `id_panier` int(11) NOT NULL AUTO_INCREMENT,
  `id_client` int(11) NOT NULL,
  `id_produit` int(11) NOT NULL,
  `quantité` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_panier`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `panier`
--

INSERT INTO `panier` (`id_panier`, `id_client`, `id_produit`, `quantité`) VALUES
(1, 11, 2, 15),
(9, 1, 11, 1),
(8, 1, 5, 1),
(18, 1, 19, 1),
(11, 14, 11, 1),
(12, 18, 11, 1),
(17, 19, 3, 1);

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `id_produit` int(11) NOT NULL AUTO_INCREMENT,
  `id_type` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `categorie` varchar(100) NOT NULL,
  `prix` decimal(10,0) NOT NULL,
  `dimensions` decimal(10,0) NOT NULL,
  `fabricant` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `stock` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `del` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_produit`),
  KEY `Clé étrangère type` (`id_type`),
  KEY `id_type` (`id_type`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `produit`
--

INSERT INTO `produit` (`id_produit`, `id_type`, `nom`, `categorie`, `prix`, `dimensions`, `fabricant`, `description`, `stock`, `del`) VALUES
(1, 1, 'Emma Frost', 'Format Premium - 1/4 Scale', '570', '85', 'SideShow', 'Bow before the White Queen! Sideshow is proud to present the Emma Frost Premium Format™ Figure, the next addition to the X-Men Collection. The Emma Frost Premium Format™ Figure measures 19.5” tall as the talented telepath takes a stand on a destroyed Cerebro room base. Cyclops’s visor, Juggernaut’s footprint, and Wolverine’s distinctive claw marks can be seen among the debris of the mutant mindwave device. Captured in a moment of intense telepathic focus, the Emma Frost Premium Format™ Figure looks elegant in her flowing white fabric cape, custom tailored with internal wiring to allow for posing. Emma Frost wears a sculpted white costume along with gloves and boots, all detailed with lifelike textures of stitching and lacing, subtly patterned with her diamond motif. Her blonde hair flows around her beautiful portrait as she focuses her immense mental powers on stopping the threat at hand.', 194, 0),
(2, 3, 'Kizuna AI', '1/7th Scale', '100', '30', 'Good Smile Company', 'The popular virtual YouTuber Kizuna AI has become a new scale figure based on the cover illustration of \"Kizuna AI 1st Photo Book AI\"! Her bright smile and energetic pose have been carefully recreated. The figure features a highly detailed sculpt and intricate paintwork making for a faithful recreation.\r\n\r\nHer hair\'s pink highlights and adorable heart-shaped headband have also been captured in detail. Be sure to add her to your collection!', 2, 0),
(3, 1, 'Huntress', 'Format Premium - 1/4 Scale', '999', '82', 'Prime 1 Studio', 'Sideshow and Prime 1 Studio are proud to present the 1:3 scale Huntress (Fabric Cape Edition) from Batman: Hush. Batman: Hush is a 2002-2003 comic book story arc published in the Batman monthly series. The Huntress is Helena Rosa Bertinelli, a vigilante operating out of Gotham City, and a member of the Batman Family. She is also a devout Catholic and is very in touch with her Italian heritage. Her career is inspired by a personal vendetta against organized crime, responsible for killing her entire family.', 9, 0),
(4, 1, 'Wonder Woman', 'Statue 65 cm', '490', '65', 'Sideshow', 'Joining her powerful allies of the Justice League, Sideshow Collectibles is proud to present the magnificent Wonder Woman Premium Format™ Figure. \r\n\r\nHandcrafted with austere beauty and fierce determination, Princess Diana of Themyscira dons her iconic costume of stars and stripes, sworn to protect the world and uphold her mantle as Wonder Woman. Granted divine superhuman powers and superior combat skills, the warrior princess is ready to gracefully accept any challenge, armed with her golden Lasso of Truth, indestructible bracelets, and tiara. The Wonder Woman collectible figure carries a long spear across her shoulders, and her iconic shield grasped firmly at her side - but above all, she carries the Amazons’ message of peace and justice. ', 22, 0),
(5, 1, 'The Flash', 'Statue 80cm', '980', '80', 'Prime 1 Studio', '\"It\'s really cool you guys seem ready to do battle and stuff, but I\'ve never done battle. I\'ve just pushed some people and run away!\"\r\n\r\nSideshow and Prime 1 Studio are proud to present Flash from Justice League film. Bartholomew Henry “Barry” Allen is a young man who was struck by lightning, gaining the metahuman ability to move and vibrate his molecules at incredible superhuman speeds. Using these powers, he became the vigilante hero known as the Flash.', 5, 0),
(6, 1, 'Nightwing', 'Statue 50cm', '450', '50', 'Prime 1 Studio', '\" Huh, I’m just too damn good at this.\"\r\n\r\nSideshow and Prime 1 Studio are proud to present the Nightwing Red Version from Batman: Arkham Knight. Raised by his parents in a circus, Dick Grayson was trained to be incredibly acrobatic. His parents were killed after criminals had failed to extort money from the circus. Dick was soon adopted by billionaire Bruce Wayne, who shared his secret identity and extensively trained the boy to become Batman’s sidekick, the first Robin. After he aided Batman for years, Dick eventually moved on and became a hero in his own right. As Nightwing, he worked with Batman as an ally. He was the main protagonist of the GCPD Lockdown DLC in Batman: Arkham Knight.', 2, 0),
(7, 1, 'The Joker', 'Statue 40cm', '235', '40', 'Sideshow', '“I don’t hate you because I’m crazy… I’m crazy because I hate you!”\r\n \r\nMake way for the Clown Prince of Crime!  Sideshow is proud to present The Joker Sixth Scale Figure, joining the universe of Sideshow’s DC Comics collectibles.\r\n \r\nThe Joker Sixth Scale Figure features an intricately-tailored fabric costume that includes a purple suit jacket and pants, an orange vest, a black dress shirt, and a green bow tie.  He has a sculpted lapel flower, shoes with sculpted spats, and ten different gloved hands including a pair of grip hands, a pair of fists, a pair of card-holding hands, and additional hands for pointing, holding his cane and gun, and a hand with a gag buzzer.\r\n \r\nThe Joker Sixth Scale Figure has an articulated body, perfect for crafting any number of clownish or cruel poses in your collection. His portrait is inspired by his DC Comics appearance, complete with his signature makeup, coiffed green hair, and a sinister red-lipped smile.  The figure comes with a number of detailed accessories for executing The Joker’s most devious schemes, including The Joker card, a cane, a crowbar, a knife, and a toy pistol with “Bang” and “CLICK CLICK CLICK” flags.', 0, 0),
(8, 1, 'Batman', 'Format Premium - 1/4 Scale', '999', '84', 'Prime 1 Studio', '“A hero can be anyone, even a man doing something as simple and reassuring as putting a coat on a young boy\'s shoulders to let him know that the world hadn\'t ended.” \r\n\r\nSideshow and Prime 1 Studio are proud to present the 1:3 scale Batman from The Dark Knight Rises (Film). Bruce Wayne was the main protagonist of The Dark Knight Trilogy, described as a billionaire environment and military defense developer who witnessed his parent\'s murder at age 8 and later traveled the world for seven years to seek the means to fight injustice, fear, and chaos before returning to Gotham City. Becoming Batman, a bat-masked vigilante hailed as the city\'s \"Dark Knight\", who dedicated himself to protecting it from its criminal underworld at night as a means to uphold justice, hope, and order.\r\n\r\nBatman from The Dark Knights Rises (Film) is precisely sculpted with screen accurate detail, capturing Christian Bale as the silent guardian of Gotham City and stands approximately 33 inches tall on a base environment based on the final battle scene.\r\n\r\nThis is a must-have statue for all fans of Batman from The Dark Knight Rises! ', 0, 0),
(9, 1, 'Mera', 'Statue 70 cm', '225', '75', 'Prime 1 Studio', 'The absence of water is not my weakness. It is yours.”\r\n\r\nSideshow and Prime 1 Studio present Mera, Queen of the Sea and wife of Aquaman. She has the ability to adjust underwater environments, create hard water objects as well as possessing superhuman physical strength. She received extensive training in Xebel, and as a result she is a master superheroine.\r\n\r\nThis Museum Masterline statue comes with an iconic designed base of flying fish attached to a wave. The Queen of the Sea measures approximately 29 inches tall while holding her Trident.\r\n\r\nAquaman fans, this beauty is a must-have for your Atlantis collection!', 0, 0),
(10, 2, 'Angela', 'Format Premium - 1/4 Scale', '499', '50', 'Sideshow', 'A storied character to be sure.\r\n\r\nAngela is making her triumphant Sideshow debut as a Premium Format™ Figure, having graced the pages of various comics and born of one of the greatest literary minds alive today.\r\n\r\nPoised for battle, and with fabric ribbons swirling around her, Angela is in the midst of battle in this dynamic statue. With weapons clenched in each hand, there is little doubt that this angel is able to hang with the fearsome creatures that call Asgard home. The Angela Premium Format™ Figure is made of polyresin and fabric and comes with her sword and axe.  \r\n\r\nThis exceptionally detailed Guardian of the Galaxy is standing astride a base made to pair up with the other Premium Format™ Figures that Sideshow offers from the popular property.', 0, 0),
(11, 2, 'Captain America', 'Statue 58 cm', '700', '58', 'Iron Studios', 'Following the worldwide success of the Avengers: Endgame movie, Sideshow and Iron Studios are proud to announce the latest from the Legacy Replica 1:4 Scale line - Captain America! Based on the likeness of Chris Evans from the film, this statue is hand-painted and limited edition.\r\n\r\nEndgame fans, don\'t miss your chance to add Captain America to your collection!', 2, 0),
(12, 2, 'Spider-Man', 'Statue 65 cm', '450', '65', 'Iron Studios', '“Hey kids, don’t try this at home!” \r\n\r\nJoining our immensely popular Marvel Premium Format™ Figure collection, Sideshow Collectibles is proud to present the Amazing Spider-Man! \r\n\r\nThere’s never a dull moment for Peter Parker when he puts on his iconic red and blue costume to become the Amazing Spider-Man! Everyone’s favorite high-flying, wise-cracking web-head is at it again – out to save the day in this fantastically sculpted gravity-defying composition. Captured just moments away from certain doom, the acrobatic hero effortlessly launches himself above Green Goblin’s explosive pumpkin bombs and out of harm’s way. A stunning tribute to his action-packed comic book legacy, this is the ultimate must-have for fans of Spider-Man!', 0, 0),
(13, 2, 'Deadpool', 'Format Premium - 1/4 Scale', '999', '68', 'Sideshow', 'What fourth wall?\r\n \r\nHe does it, so why can’t we?  Hey folks, Sideshow\'s copywriter here!  What you’re setting your peepers on right now is something we showed off at SDCC ’16 and we’re happy to get onto the site – the Deadpool Heat-Seeker Premium Format™ Figure.\r\n \r\nI don’t have this guy sitting on my desk right now because I’m not allowed to touch prototypes.  Sad, right?  Here’s what we can tell you about our friend in red – He’s jumping out of an explosion while dodging a rocket, while firing a machine gun behind his back, WHILE SLICING A GRENADE IN HALF WITH A SWORD!  If I had a mic this is where it would be dropped – but I’m not allowed to touch those either.\r\n \r\nI’m to the point of assuming that our artists have just gone round the bend and started making whatever amazing little physics denying thing has come to mind and I’m totally fine with it.  The Deadpool Heat-Seeker Premium Format™ Figure is made up of polyresin, high-quality PVC, metal, and an almost uncomfortable amount of sex appeal.\r\n \r\nOh, my favorite part?  Kind of you to ask!  Check out the tiny bullet at the end of the explosion coming out of the barrel of the gun.  Sweeeeeeet!', 0, 0),
(14, 2, 'Domino', 'Statue 35 cm', '230', '35', 'Sideshow', '“Like I was saying.  It isn’t all just luck.”\r\n\r\nLucky you!  Sideshow presents the Domino Premium Format™ Figure, joining up with the X-Men Collection.\r\n\r\nThe deadly Domino measures 20” tall on top of an X-Men themed Days of Future Cash slot machine riddled with bullet holes.  The one-armed bandit is no match for this mutant mercenary- with her foot on the handle, Neena Thurman cashes out on her latest casino victory.  Gold coins and shell casings surround the base, featuring Deadpool logos and dollar signs as a part of Domino’s big payout.\r\n\r\nThe polyresin Domino Premium Format™ Figure features an entirely sculpted sleek black costume with textured blue panels designed to mimic the appearance of a real catsuit.  Her outfit is detailed with sculpted zippers, stitching, textured blue panels, and tactical gear including several holsters for her weapons and a red X symbol on her utility belt.  ', 2, 0),
(15, 2, 'Groot', 'Statue 25 cm', '175', '25', 'Hot Toys', '“I am Groot!”\r\n\r\nBeing one of the most adorable superheroes among Marvel Studios’ productions, Baby Groot from Guardians of the Galaxy Vol.2 has drawn tremendous attention across continents after the world premiere. The tiniest Guardian is a vulnerable one with quite a lot to learn from his oddball cosmic family, and he has emotions as well as moments of failure.\r\n\r\nSideshow and Hot Toys are delighted to present the Groot life-size collectible figure. The extraordinarily movie-accurate Groot life-size collectible figure stands approximately 26cm tall with a newly developed body and expert paint applications to reflect Baby Groot’s unique appearance and a beautifully designed packaging to recreate the scene with Groot dancing along with music in the very beginning of the movie.\r\n\r\nGuardians of the Galaxy Vol.2 fanatics surely can’t pass up on the opportunity to have this wonderful collectible figure in your display!', 0, 0),
(16, 2, 'Spider-gwen', 'Format Premium - 1/4 Scale', '805', '75', 'Sideshow', '“Where’ve I been? Oh, just fighting in a war for the fate of all reality. Y’know, like you do.” \r\n\r\nAre you ready to rock? Sideshow is proud to present the first collectible in the Mark Brooks Spider-Verse Collection, the Spider-Gwen Statue. \r\n\r\nIn an alternate universe, Gwen Stacy was the person bit by the infamous irradiated spider, which gave her spectacular abilities to sling webs and scale walls. As a part of the artist series by the talented Mark Brooks, this interpretation of Spider-Gwen is equal parts radioactive power and rock and roll style. \r\n\r\nThe Spider-Gwen Statue measures 16” tall as the heroine balances lightly atop a New York street sign with a webbed base. Her iconic black and white costume has striking pink and blue web accents, and her unmasked portrait bears the familiar blond locks and black headband Gwen Stacy is known for. \r\n\r\nAs the drummer in the band The Mary Janes, Spider-Gwen stylishly maintains the balance between her heroic and civilian lives. She has a pair of earbuds for listening to the perfect playlist while saving the world, and her backpack holds a pair of drumsticks in case she needs to make a quick detour to music practice. \r\n\r\nThe Spider-Gwen Statue makes a sensational addition to any Marvel universe of collectibles. Be sure she swings into your collection today!', 0, 0),
(17, 2, 'The Wasp', 'Statue 35 cm', '225', '35', 'Iron Studios', 'Sideshow and Iron Studios are proud to announce the latest from the Battle Diorama Series Art Scale 1:10 line - the Wasp! Based on the likeness of Evangeline Lilly in Ant-Man & the Wasp, Wasp comes with a fully detailed base that can be connected to the Ant-Man Battle Diorama Series Art Scale 1:10 Statue. \r\n\r\nMarvel fans, don\'t miss your chance to add the Wasp to your collection.', 0, 0),
(18, 5, 'Stickers Peaky Blinders', 'Stickers Ordinateur', '15', '20', 'StickersSTD', 'Stickers Peaky Blinders à coller sur votre ordinateur !', 0, 0),
(19, 5, 'Multiples Stickers', 'Stickers de tailles variables', '30', '30', 'StickersSTD', 'Stickers provenant de différentes franchises à des tailles variables ! ', 0, 0),
(20, 3, 'Saber Lily ~Distant Avalon~', 'Fate/stay night 1/7th Scale', '115', '45', 'Good Smile Company', 'The pure white, royal knight - back again!\r\nThe long-awaited rerelease of the 1/7th scale figure of Saber\'s alternate form, Saber Lily! Posed as if preforming her ultimate move \"\"Distant Avalon\"\" slashing through the air with her sword, Caliburn. Her other noble phantasm, the sword Excalibur has also been included and can be switched out for a difference appearance whenever you wish!\r\n\r\nThe sculpting work was done by Takayuki Kawahara, who has given the figure a dynamic feeling that places Saber in the center of the action. Everything from her beautiful flowing dress to her finely detailed hair all come together to bring a wonderful figure that any fan is bound to fall in love with.', 0, 0),
(21, 3, 'Racing Miku 2018', '1/7th Scale', '112', '40', 'AQUAMARINE', 'The Songstress of the Circuit racing to the top!\r\nFrom the \"Hatsune Miku GT Project\" comes Racing Miku 2018: Challenging to the TOP! Illustrator Kanzaki Hiro\'s Racing Miku design has been brought to life. Her fluttering twintails feature vivid gradation while the details of her costume such as the fur and gold decorations have been carefully captured. Be sure to add her to your collection!', 5, 0);

-- --------------------------------------------------------

--
-- Structure de la table `produits_commande`
--

DROP TABLE IF EXISTS `produits_commande`;
CREATE TABLE IF NOT EXISTS `produits_commande` (
  `id_produit_commande` int(11) NOT NULL AUTO_INCREMENT,
  `id_commande` int(11) NOT NULL,
  `id_produit` int(11) NOT NULL,
  `quantite` int(11) NOT NULL,
  `envoie` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_produit_commande`),
  KEY `id_commande_listeprod` (`id_commande`),
  KEY `id_produit_listeprod` (`id_produit`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `produits_commande`
--

INSERT INTO `produits_commande` (`id_produit_commande`, `id_commande`, `id_produit`, `quantite`, `envoie`) VALUES
(1, 1, 4, 1, 1),
(2, 1, 8, 1, 1),
(3, 2, 2, 1, 1),
(4, 2, 12, 1, 1),
(5, 3, 10, 1, 0),
(6, 3, 11, 1, 0),
(7, 3, 14, 1, 0),
(8, 4, 6, 1, 0);

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
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `FK_idclient_commande` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`);

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

--
-- Contraintes pour la table `produits_commande`
--
ALTER TABLE `produits_commande`
  ADD CONSTRAINT `FK_idCommande_listeprod` FOREIGN KEY (`id_commande`) REFERENCES `commande` (`id_commande`),
  ADD CONSTRAINT `FK_idProduit_listeprod` FOREIGN KEY (`id_produit`) REFERENCES `produit` (`id_produit`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
