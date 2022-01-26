-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mar. 25 jan. 2022 à 14:48
-- Version du serveur :  8.0.27-0ubuntu0.20.04.1
-- Version de PHP : 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `user_ptut`
--
CREATE DATABASE IF NOT EXISTS `user_ptut` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `user_ptut`;

-- --------------------------------------------------------

--
-- Structure de la table `Question`
--

CREATE TABLE `Question` (
  `idQuestion` mediumint NOT NULL,
  `idEvenement` mediumint NOT NULL,
  `numero` int NOT NULL,
  `libelle` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `type` enum('slide','check','list','string','int') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `min` int DEFAULT NULL,
  `max` int DEFAULT NULL,
  `listeReps` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


--
-- Structure de la table `QuestionnaireEvenement`
--

CREATE TABLE `QuestionnaireEvenement` (
  `idEvenement` mediumint NOT NULL,
  `nom` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `dateD` date NOT NULL,
  `dateF` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- --------------------------------------------------------

--
-- Structure de la table `Repondant`
--

CREATE TABLE `Repondant` (
  `idRepondant` mediumint NOT NULL,
  `idEvenement` mediumint NOT NULL,
  `idQuestion` mediumint NOT NULL,
  `dateHeure` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- --------------------------------------------------------

--
-- Structure de la table `reponseRepondant`
--

CREATE TABLE `reponseRepondant` (
  `idResponseRepondant` mediumint NOT NULL,
  `idQuestion` mediumint NOT NULL,
  `repNum` int DEFAULT NULL,
  `repString` text,
  `idRepondant` mediumint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



-- --------------------------------------------------------

--
-- Structure de la table `Users`
--

CREATE TABLE `Users` (
  `login` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Question`
--
ALTER TABLE `Question`
  ADD PRIMARY KEY (`idQuestion`),
  ADD KEY `FK_idEvenement` (`idEvenement`);

--
-- Index pour la table `QuestionnaireEvenement`
--
ALTER TABLE `QuestionnaireEvenement`
  ADD PRIMARY KEY (`idEvenement`);

--
-- Index pour la table `Repondant`
--
ALTER TABLE `Repondant`
  ADD PRIMARY KEY (`idRepondant`),
  ADD KEY `FK_idEvenement_Bis` (`idEvenement`);

--
-- Index pour la table `reponseRepondant`
--
ALTER TABLE `reponseRepondant`
  ADD PRIMARY KEY (`idResponseRepondant`),
  ADD KEY `FK_idQuestion` (`idQuestion`),
  ADD KEY `FK_idRepondant` (`idRepondant`);

--
-- Index pour la table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`login`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `Question`
--
ALTER TABLE `Question`
  MODIFY `idQuestion` mediumint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT pour la table `QuestionnaireEvenement`
--
ALTER TABLE `QuestionnaireEvenement`
  MODIFY `idEvenement` mediumint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `Repondant`
--
ALTER TABLE `Repondant`
  MODIFY `idRepondant` mediumint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `reponseRepondant`
--
ALTER TABLE `reponseRepondant`
  MODIFY `idResponseRepondant` mediumint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Question`
--
ALTER TABLE `Question`
  ADD CONSTRAINT `FK_idEvenement` FOREIGN KEY (`idEvenement`) REFERENCES `QuestionnaireEvenement` (`idEvenement`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `Repondant`
--
ALTER TABLE `Repondant`
  ADD CONSTRAINT `FK_idEvenement_Bis` FOREIGN KEY (`idEvenement`) REFERENCES `QuestionnaireEvenement` (`idEvenement`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Contraintes pour la table `reponseRepondant`
--
ALTER TABLE `reponseRepondant`
  ADD CONSTRAINT `FK_idQuestion` FOREIGN KEY (`idQuestion`) REFERENCES `Question` (`idQuestion`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FK_idRepondant` FOREIGN KEY (`idRepondant`) REFERENCES `Repondant` (`idRepondant`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
