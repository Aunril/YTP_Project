-- phpMyAdmin SQL Dump
-- version 4.5.5.1
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mar 11 Juin 2019 à 14:04
-- Version du serveur :  5.7.11
-- Version de PHP :  5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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

CREATE TABLE `client` (
  `id_client` int(11) NOT NULL,
  `email` text NOT NULL,
  `password` text NOT NULL,
  `nom` varchar(25) NOT NULL,
  `prenom` varchar(20) NOT NULL,
  `adresse` varchar(65) NOT NULL,
  `codepostal` int(11) NOT NULL,
  `ville` varchar(30) NOT NULL,
  `connecte` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `client`
--

INSERT INTO `client` (`id_client`, `email`, `password`, `nom`, `prenom`, `adresse`, `codepostal`, `ville`, `connecte`) VALUES
(1, 'test@gmail.com', 'test123', 'doe', 'john', '8 rue de la révolte', 75500, 'Paris', 0),
(11, 'pauline.djamaa@gmail.com', 'po123456', 'Djamaa', 'Pauline', '8 rue du chemin des dames', 95400, 'Arnouville', 0);

-- --------------------------------------------------------

--
-- Structure de la table `images`
--

CREATE TABLE `images` (
  `id_images` int(11) NOT NULL,
  `id_produit` int(11) NOT NULL,
  `imagePrincipale` text,
  `image1` text,
  `image2` text,
  `image3` text,
  `image4` text,
  `image5` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `images`
--

INSERT INTO `images` (`id_images`, `id_produit`, `imagePrincipale`, `image1`, `image2`, `image3`, `image4`, `image5`) VALUES
(1, 1, 'vue/images/DCcomics/emmafrost.jpg', 'vue/images/produits/1/emma1.jpg', 'vue/images/produits/1/emma2.jpg', 'vue/images/produits/1/emma3.jpg', 'vue/images/produits/1/emma4.jpg', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `produit`
--

CREATE TABLE `produit` (
  `id_produit` int(11) NOT NULL,
  `id_type` int(11) NOT NULL,
  `nom` varchar(20) NOT NULL,
  `categorie` varchar(35) NOT NULL,
  `prix` decimal(10,0) NOT NULL,
  `dimensions` decimal(10,0) NOT NULL,
  `fabricant` varchar(20) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `produit`
--

INSERT INTO `produit` (`id_produit`, `id_type`, `nom`, `categorie`, `prix`, `dimensions`, `fabricant`, `description`) VALUES
(1, 1, 'Emma Frost', '1/4 Scale - Format Premium', '575', '85', 'SideShow', 'Bow before the White Queen! Sideshow is proud to present the Emma Frost Premium Format™ Figure, the next addition to the X-Men Collection. The Emma Frost Premium Format™ Figure measures 19.5” tall as the talented telepath takes a stand on a destroyed Cerebro room base. Cyclops’s visor, Juggernaut’s footprint, and Wolverine’s distinctive claw marks can be seen among the debris of the mutant mindwave device. Captured in a moment of intense telepathic focus, the Emma Frost Premium Format™ Figure looks elegant in her flowing white fabric cape, custom tailored with internal wiring to allow for posing. Emma Frost wears a sculpted white costume along with gloves and boots, all detailed with lifelike textures of stitching and lacing, subtly patterned with her diamond motif. Her blonde hair flows around her beautiful portrait as she focuses her immense mental powers on stopping the threat at hand.');

-- --------------------------------------------------------

--
-- Structure de la table `type`
--

CREATE TABLE `type` (
  `id_type` int(11) NOT NULL,
  `nomType` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `type`
--

INSERT INTO `type` (`id_type`, `nomType`) VALUES
(1, 'DC Comics'),
(2, 'Marvel'),
(3, 'Manga'),
(4, 'Jeux Vidéo'),
(5, 'Films-TV'),
(6, 'Musique');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`);

--
-- Index pour la table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id_images`),
  ADD KEY `Clé étrangère` (`id_produit`);

--
-- Index pour la table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`id_produit`),
  ADD KEY `Clé étrangère type` (`id_type`),
  ADD KEY `id_type` (`id_type`);

--
-- Index pour la table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`id_type`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT pour la table `images`
--
ALTER TABLE `images`
  MODIFY `id_images` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `produit`
--
ALTER TABLE `produit`
  MODIFY `id_produit` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `type`
--
ALTER TABLE `type`
  MODIFY `id_type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- Contraintes pour les tables exportées
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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
