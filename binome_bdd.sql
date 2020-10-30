-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8081
-- Generation Time: Oct 30, 2020 at 02:19 PM
-- Server version: 5.7.24
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `binome`
--
CREATE DATABASE IF NOT EXISTS `binome` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `binome`;

-- --------------------------------------------------------

--
-- Table structure for table `apprenant`
--

CREATE TABLE `apprenant` (
  `id_apprenant` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `photo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `apprenant`
--

INSERT INTO `apprenant` (`id_apprenant`, `nom`, `prenom`, `photo`) VALUES
(1, 'Bokalli', 'Luigi', ''),
(2, 'Bonneau', 'Amaury', ''),
(3, 'Chaigneau', 'Thomas', ''),
(4, 'Cloatre', 'Erwan', ''),
(5, 'Furiga', 'Julien', ''),
(6, 'Guillen', 'Celine', ''),
(7, 'Hergoualc\'h', 'Pereg', ''),
(8, 'Ibanni', 'Jamal', ''),
(9, 'Karfaoui', 'Christelle', ''),
(10, 'Le Berre', 'BaptisteLB', ''),
(11, 'Le Goff', 'BaptisteLG', ''),
(12, 'Le Joncour', 'Jérémy', ''),
(13, 'Le Moal', 'Patricia', ''),
(14, 'Maintier', 'Ludivine', ''),
(15, 'Mbarga Mvogo', 'Christian', ''),
(16, 'Moulard', 'Eva', ''),
(17, 'Pertron', 'Aude', ''),
(18, 'Rioual', 'Ronan', ''),
(19, 'Sabia', 'Paul', ''),
(20, 'Verpoest', 'Guillaume', '');

-- --------------------------------------------------------

--
-- Table structure for table `apprenant_groupe_projet`
--

CREATE TABLE `apprenant_groupe_projet` (
  `id_apprenant` int(11) NOT NULL,
  `id_grp` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `grp`
--

CREATE TABLE `grp` (
  `id_groupe` int(11) NOT NULL,
  `label` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `grp`
--

INSERT INTO `grp` (`id_groupe`, `label`) VALUES
(1, 'Groupe 1'),
(2, 'Groupe 2'),
(3, 'Groupe 3'),
(4, 'Groupe 4'),
(5, 'Groupe 5'),
(6, 'Groupe 6'),
(7, 'Groupe 7'),
(8, 'Groupe 8'),
(9, 'Groupe 9'),
(10, 'Groupe 10');

-- --------------------------------------------------------

--
-- Table structure for table `projet`
--

CREATE TABLE `projet` (
  `id_projet` int(11) NOT NULL,
  `label` varchar(50) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `projet`
--

INSERT INTO `projet` (`id_projet`, `label`, `date`) VALUES
(1, 'Binomotron', '2020-10-30');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `apprenant`
--
ALTER TABLE `apprenant`
  ADD PRIMARY KEY (`id_apprenant`);

--
-- Indexes for table `apprenant_groupe_projet`
--
ALTER TABLE `apprenant_groupe_projet`
  ADD KEY `id_apprenant` (`id_apprenant`),
  ADD KEY `id_grp` (`id_grp`);

--
-- Indexes for table `grp`
--
ALTER TABLE `grp`
  ADD PRIMARY KEY (`id_groupe`);

--
-- Indexes for table `projet`
--
ALTER TABLE `projet`
  ADD PRIMARY KEY (`id_projet`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `apprenant`
--
ALTER TABLE `apprenant`
  MODIFY `id_apprenant` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `grp`
--
ALTER TABLE `grp`
  MODIFY `id_groupe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `projet`
--
ALTER TABLE `projet`
  MODIFY `id_projet` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `apprenant_groupe_projet`
--
ALTER TABLE `apprenant_groupe_projet`
  ADD CONSTRAINT `apprenant_groupe_projet_ibfk_1` FOREIGN KEY (`id_apprenant`) REFERENCES `apprenant` (`id_apprenant`),
  ADD CONSTRAINT `apprenant_groupe_projet_ibfk_2` FOREIGN KEY (`id_grp`) REFERENCES `grp` (`id_groupe`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
