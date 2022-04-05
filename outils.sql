-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 05 avr. 2022 à 11:52
-- Version du serveur : 5.7.36
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `outils`
--

-- --------------------------------------------------------

--
-- Structure de la table `boite`
--

DROP TABLE IF EXISTS `boite`;
CREATE TABLE IF NOT EXISTS `boite` (
  `numero` int(11) NOT NULL,
  PRIMARY KEY (`numero`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `boite`
--

INSERT INTO `boite` (`numero`) VALUES
(1);

-- --------------------------------------------------------

--
-- Structure de la table `executer`
--

DROP TABLE IF EXISTS `executer`;
CREATE TABLE IF NOT EXISTS `executer` (
  `id_test` int(11) NOT NULL,
  `id_utilisateur` int(11) NOT NULL,
  UNIQUE KEY `RelationExecuterUtilisateur` (`id_utilisateur`),
  KEY `RelationExecuterTest` (`id_test`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `executer`
--

INSERT INTO `executer` (`id_test`, `id_utilisateur`) VALUES
(1, 2);

-- --------------------------------------------------------

--
-- Structure de la table `outils`
--

DROP TABLE IF EXISTS `outils`;
CREATE TABLE IF NOT EXISTS `outils` (
  `id_outils` int(11) NOT NULL AUTO_INCREMENT,
  `fonction` varchar(50) NOT NULL,
  `marque` varchar(25) NOT NULL,
  `type_outils` varchar(50) NOT NULL,
  `garantie` int(11) NOT NULL,
  `date_achat` date NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `etat` varchar(25) NOT NULL,
  `numero` int(11) NOT NULL,
  PRIMARY KEY (`id_outils`),
  KEY `RelationBoiteOutils` (`numero`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `outils`
--

INSERT INTO `outils` (`id_outils`, `fonction`, `marque`, `type_outils`, `garantie`, `date_achat`, `description`, `etat`, `numero`) VALUES
(1, 'décapeur', 'bosh', 'electrique', 2, '2022-04-04', 'magnifique', 'neuf', 1);

-- --------------------------------------------------------

--
-- Structure de la table `test`
--

DROP TABLE IF EXISTS `test`;
CREATE TABLE IF NOT EXISTS `test` (
  `id_test` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  PRIMARY KEY (`id_test`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `test`
--

INSERT INTO `test` (`id_test`, `date`) VALUES
(1, '2022-04-05');

-- --------------------------------------------------------

--
-- Structure de la table `tester`
--

DROP TABLE IF EXISTS `tester`;
CREATE TABLE IF NOT EXISTS `tester` (
  `id_outils` int(11) NOT NULL,
  `id_test` int(11) NOT NULL,
  PRIMARY KEY (`id_outils`,`id_test`) USING BTREE,
  KEY `RelationTesterOutils` (`id_outils`) USING BTREE,
  KEY `RelationTesterTest` (`id_test`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `tester`
--

INSERT INTO `tester` (`id_outils`, `id_test`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id_utilisateur` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(25) NOT NULL,
  `prenom` varchar(25) NOT NULL,
  `poste` varchar(50) NOT NULL,
  `mdp` varchar(250) NOT NULL,
  PRIMARY KEY (`id_utilisateur`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id_utilisateur`, `nom`, `prenom`, `poste`, `mdp`) VALUES
(1, 'D\'Hertog', 'Arthur', 'ouvrier', 'arthur'),
(2, 'Dache', 'Alexandra', 'PDG', 'alexandra');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `executer`
--
ALTER TABLE `executer`
  ADD CONSTRAINT `RealtionExecuterTest` FOREIGN KEY (`id_test`) REFERENCES `test` (`id_test`),
  ADD CONSTRAINT `RelationExecuterUtilisateur` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`);

--
-- Contraintes pour la table `outils`
--
ALTER TABLE `outils`
  ADD CONSTRAINT `RelationOutilsBoite` FOREIGN KEY (`numero`) REFERENCES `boite` (`numero`);

--
-- Contraintes pour la table `tester`
--
ALTER TABLE `tester`
  ADD CONSTRAINT `RelationTesterOutils` FOREIGN KEY (`id_outils`) REFERENCES `outils` (`id_outils`),
  ADD CONSTRAINT `RelationTesterTest` FOREIGN KEY (`id_test`) REFERENCES `test` (`id_test`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
