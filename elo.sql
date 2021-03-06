-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Gegenereerd op: 10 sep 2021 om 09:21
-- Serverversie: 5.7.31
-- PHP-versie: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `elo`
--
CREATE DATABASE IF NOT EXISTS `elo` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `elo`;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `cijfer`
--

DROP TABLE IF EXISTS `cijfer`;
CREATE TABLE IF NOT EXISTS `cijfer` (
  `CijferId` int(11) NOT NULL AUTO_INCREMENT,
  `Cijfer` int(11) NOT NULL,
  `StudentId` int(11) NOT NULL,
  `HuiswerkId` int(11) NOT NULL,
  PRIMARY KEY (`CijferId`),
  UNIQUE KEY `CijferId_UNIQUE` (`CijferId`),
  KEY `fk_cijfer_huiswerk1_idx` (`HuiswerkId`),
  KEY `fk_cijfer_student1_idx` (`StudentId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `cijfer`
--

INSERT INTO `cijfer` (`CijferId`, `Cijfer`, `StudentId`, `HuiswerkId`) VALUES
(1, 0, 1, 1),
(2, 0, 1, 2),
(3, 7, 1, 3),
(4, 0, 2, 1),
(5, 7, 2, 4);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `huiswerk`
--

DROP TABLE IF EXISTS `huiswerk`;
CREATE TABLE IF NOT EXISTS `huiswerk` (
  `HuiswerkId` int(11) NOT NULL AUTO_INCREMENT,
  `HuiswerkBeschrijving` varchar(45) NOT NULL,
  `HuiswerkDatum` date DEFAULT NULL,
  `HuiswerktIsToets` tinyint(1) NOT NULL,
  `VakId` int(11) NOT NULL,
  `KlasId` int(11) NOT NULL,
  PRIMARY KEY (`HuiswerkId`),
  UNIQUE KEY `HuiswerkId_UNIQUE` (`HuiswerkId`),
  KEY `fk_huiswerk_vak1_idx` (`VakId`),
  KEY `fk_huiswerk_klas1_idx` (`KlasId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `huiswerk`
--

INSERT INTO `huiswerk` (`HuiswerkId`, `HuiswerkBeschrijving`, `HuiswerkDatum`, `HuiswerktIsToets`, `VakId`, `KlasId`) VALUES
(1, 'Maak de rekenoefeningen', '2021-11-08', 0, 1, 1),
(2, 'Maak de oefening', '2021-09-08', 0, 2, 1),
(3, 'Maak een website', '2021-09-09', 1, 3, 1),
(4, 'Maak een website', '2021-09-17', 1, 3, 2);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `klas`
--

DROP TABLE IF EXISTS `klas`;
CREATE TABLE IF NOT EXISTS `klas` (
  `KlasId` int(11) NOT NULL AUTO_INCREMENT,
  `KlasNaam` varchar(45) NOT NULL,
  PRIMARY KEY (`KlasId`),
  UNIQUE KEY `naam_UNIQUE` (`KlasNaam`),
  UNIQUE KEY `KlasId_UNIQUE` (`KlasId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `klas`
--

INSERT INTO `klas` (`KlasId`, `KlasNaam`) VALUES
(2, 'SD2B'),
(1, 'SD2C');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `StudentId` int(11) NOT NULL AUTO_INCREMENT,
  `Voornaam` varchar(45) NOT NULL,
  `Achternaam` varchar(45) NOT NULL,
  `Geboortedatum` date NOT NULL,
  `Telefoonnummer` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Adres` varchar(45) NOT NULL,
  `Postcode` varchar(45) NOT NULL,
  `Woonplaats` varchar(45) NOT NULL,
  `Wachtwoord` varchar(45) NOT NULL,
  `KlasId` int(11) NOT NULL,
  PRIMARY KEY (`StudentId`),
  UNIQUE KEY `id_UNIQUE` (`StudentId`),
  UNIQUE KEY `Email` (`Email`),
  KEY `fk_student_klas_idx` (`KlasId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `student`
--

INSERT INTO `student` (`StudentId`, `Voornaam`, `Achternaam`, `Geboortedatum`, `Telefoonnummer`, `Email`, `Adres`, `Postcode`, `Woonplaats`, `Wachtwoord`, `KlasId`) VALUES
(1, 'Voornaam', 'Achternaam', '2021-09-08', '0612345678', 'email@domeinnaam.nl', 'Straatnaam 1', '1111AB', 'Eindhoven', 'password', 1),
(2, 'Teststudent', 'Achternaam', '2021-09-01', '0612345678', 'email@domein.nl', 'Straatnaam 1', '1111AB', 'Eindhoven', 'wachtwoord', 2);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `vak`
--

DROP TABLE IF EXISTS `vak`;
CREATE TABLE IF NOT EXISTS `vak` (
  `VakId` int(11) NOT NULL AUTO_INCREMENT,
  `VakNaam` varchar(45) NOT NULL,
  PRIMARY KEY (`VakId`),
  UNIQUE KEY `vakken_UNIQUE` (`VakNaam`),
  UNIQUE KEY `VakId_UNIQUE` (`VakId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Gegevens worden geëxporteerd voor tabel `vak`
--

INSERT INTO `vak` (`VakId`, `VakNaam`) VALUES
(2, 'Desktop Development'),
(3, 'Laravel'),
(1, 'Rekenen');

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `cijfer`
--
ALTER TABLE `cijfer`
  ADD CONSTRAINT `fk_cijfer_huiswerk1` FOREIGN KEY (`HuiswerkId`) REFERENCES `huiswerk` (`HuiswerkId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cijfer_student1` FOREIGN KEY (`StudentId`) REFERENCES `student` (`StudentId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Beperkingen voor tabel `huiswerk`
--
ALTER TABLE `huiswerk`
  ADD CONSTRAINT `fk_huiswerk_klas1` FOREIGN KEY (`KlasId`) REFERENCES `klas` (`KlasId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_huiswerk_vak1` FOREIGN KEY (`VakId`) REFERENCES `vak` (`VakId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Beperkingen voor tabel `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `fk_student_klas` FOREIGN KEY (`KlasId`) REFERENCES `klas` (`KlasId`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
