-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  sam. 13 jan. 2018 à 14:40
-- Version du serveur :  5.7.19
-- Version de PHP :  5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `miniprojet`
--

-- --------------------------------------------------------

--
-- Structure de la table `a_commande`
--

DROP TABLE IF EXISTS `a_commande`;
CREATE TABLE IF NOT EXISTS `a_commande` (
  `id_commande` int(11) NOT NULL AUTO_INCREMENT,
  `id_membre` int(11) NOT NULL,
  `date_commande` date NOT NULL,
  `prix_commande` float NOT NULL,
  PRIMARY KEY (`id_commande`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `a_commande`
--

INSERT INTO `a_commande` (`id_commande`, `id_membre`, `date_commande`, `prix_commande`) VALUES
(1, 1, '2018-01-13', 0),
(2, 1, '2018-01-13', 0),
(3, 1, '2018-01-13', 0),
(4, 1, '2018-01-13', 0),
(5, 1, '2018-01-13', 0),
(6, 1, '2018-01-13', 0),
(7, 1, '2018-01-13', 0);

-- --------------------------------------------------------

--
-- Structure de la table `a_pour_definition`
--

DROP TABLE IF EXISTS `a_pour_definition`;
CREATE TABLE IF NOT EXISTS `a_pour_definition` (
  `def` text,
  `id_mot_chy` int(11) NOT NULL,
  `id_mot_fr` int(11) NOT NULL,
  `id_type_mot` int(11) NOT NULL,
  PRIMARY KEY (`id_mot_chy`,`id_mot_fr`,`id_type_mot`),
  KEY `FK_a_pour_definition_id_mot_chy` (`id_mot_chy`),
  KEY `FK_a_pour_definition_id_mot_fr` (`id_mot_fr`),
  KEY `FK_a_pour_definition_id_type_mot` (`id_type_mot`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `boutique`
--

DROP TABLE IF EXISTS `boutique`;
CREATE TABLE IF NOT EXISTS `boutique` (
  `id_item` int(11) NOT NULL AUTO_INCREMENT,
  `nom_item` varchar(50) NOT NULL,
  `description_item` text NOT NULL,
  `stock` int(11) NOT NULL,
  `prix_unitaire` float NOT NULL,
  PRIMARY KEY (`id_item`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `boutique`
--

INSERT INTO `boutique` (`id_item`, `nom_item`, `description_item`, `stock`, `prix_unitaire`) VALUES
(1, 'Le Grand Dictionnaire', 'Le grand dictionnaire du chaucyrio signé par le Grand Klap ! De sa célèbre main-moignon ! Oui oui oui ! c\'est gagné !', 10, 15.04),
(2, 'Chaussure gauche du Klap', 'La fameuse chaussure gauche du Klap !', 0, 14),
(3, 'Chaussure droite du Klap', 'La fameuse chaussure droite du Klap !', 6, 4),
(4, 'Yoko Ono', 'La grande Yoko Ono de Suzuki, modèle de 2013 avec un jeune V12', 12, 2),
(5, 'Serviette jaune', 'La serviette jaune utilisée par le Grand Klap le 18 décembre 2017 !', 1, 7);

-- --------------------------------------------------------

--
-- Structure de la table `commandes`
--

DROP TABLE IF EXISTS `commandes`;
CREATE TABLE IF NOT EXISTS `commandes` (
  `id_commande` int(11) NOT NULL,
  `id_item` int(11) NOT NULL,
  `quantite` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `commandes`
--

INSERT INTO `commandes` (`id_commande`, `id_item`, `quantite`) VALUES
(1, 3, 1),
(1, 5, 1),
(2, 3, 1),
(2, 1, 1),
(2, 5, 1),
(3, 1, 1),
(4, 1, 1),
(5, 3, 1),
(6, 1, 1),
(6, 3, 3),
(7, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `contact`
--

DROP TABLE IF EXISTS `contact`;
CREATE TABLE IF NOT EXISTS `contact` (
  `id_message` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `email_contact` varchar(100) NOT NULL,
  `sujet` varchar(40) NOT NULL,
  `texte` varchar(400) NOT NULL,
  `date_contact` date NOT NULL,
  `horaire_contact` time NOT NULL,
  PRIMARY KEY (`id_message`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `contact`
--

INSERT INTO `contact` (`id_message`, `nom`, `email_contact`, `sujet`, `texte`, `date_contact`, `horaire_contact`) VALUES
(5, 'Valentin Magnan', 'toutoucaloux@gmail.com', 'Pour l\'envoi d\'un formulaire', 'Test d\'un peu tout @ gmail . com sql test\r\n\r\nazqzaz\r\n\\r\r\n\\t\r\n\\n', '2017-11-25', '13:42:19'),
(6, 'Test', 'pote@gmail.com', 'Oui', 'test', '2017-11-25', '22:26:52'),
(7, 'Test', 'pote@gmail.com', 'Oui', 'test', '2017-11-25', '22:27:01');

-- --------------------------------------------------------

--
-- Structure de la table `dico_chy`
--

DROP TABLE IF EXISTS `dico_chy`;
CREATE TABLE IF NOT EXISTS `dico_chy` (
  `id_mot_chy` int(11) NOT NULL AUTO_INCREMENT,
  `mot_chy` varchar(50) NOT NULL,
  PRIMARY KEY (`id_mot_chy`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `dico_fr`
--

DROP TABLE IF EXISTS `dico_fr`;
CREATE TABLE IF NOT EXISTS `dico_fr` (
  `id_mot_fr` int(11) NOT NULL AUTO_INCREMENT,
  `mot_fr` varchar(50) NOT NULL,
  PRIMARY KEY (`id_mot_fr`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `membres`
--

DROP TABLE IF EXISTS `membres`;
CREATE TABLE IF NOT EXISTS `membres` (
  `id_membre` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `mot_de_passe` varchar(255) NOT NULL,
  `role` int(11) DEFAULT '-1',
  `date_inscription` date DEFAULT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `pays` varchar(30) NOT NULL,
  `ville` varchar(40) DEFAULT NULL,
  `date_naissance` date DEFAULT NULL,
  `numero_telephone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_membre`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `membres`
--

INSERT INTO `membres` (`id_membre`, `email`, `mot_de_passe`, `role`, `date_inscription`, `nom`, `prenom`, `pays`, `ville`, `date_naissance`, `numero_telephone`) VALUES
(1, 'bruce@wayne.corp', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 1, NULL, 'Wayne', 'Bruce', 'France', 'Gotham', NULL, NULL),
(2, 'gainsbarre@serge.fr', '49897ee5656aba3cf72f2a5f2b11b4d6406e9920', -1, '2017-11-25', 'Gainsbourg', 'Serge', 'France', 'Cimeterre', '1970-01-01', ''),
(3, 'serge@serge.fr', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 0, NULL, 'Gainsbourg', 'Serge', 'France', '', '1970-01-01', ''),
(4, 'mayou.pote@test.fr', 'pote', NULL, NULL, 'Mayou', 'Marsot', 'France', 'Aix', NULL, NULL),
(5, 'pote@mayou.fr', '25ec6a59aba347031747d6724cf1a5706d0cddf6', NULL, NULL, 'Mayeul', 'Marsaut', 'France', 'Aix-en-Provence', '2017-12-21', '08 45 11 22 51 ');

-- --------------------------------------------------------

--
-- Structure de la table `tchat`
--

DROP TABLE IF EXISTS `tchat`;
CREATE TABLE IF NOT EXISTS `tchat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pseudo` varchar(50) NOT NULL,
  `message` varchar(140) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=82 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `tchat`
--

INSERT INTO `tchat` (`id`, `pseudo`, `message`) VALUES
(79, 'Antoine', 'Bonsoir les chaussures'),
(80, 'Klap', 'Chaussure !'),
(81, 'Maloeil', 'Lapin !');

-- --------------------------------------------------------

--
-- Structure de la table `type_mot`
--

DROP TABLE IF EXISTS `type_mot`;
CREATE TABLE IF NOT EXISTS `type_mot` (
  `id_type_mot` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) NOT NULL,
  PRIMARY KEY (`id_type_mot`),
  UNIQUE KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
