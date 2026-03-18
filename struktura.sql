-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 16, 2026 at 09:48 AM
-- Wersja serwera: 8.4.7
-- Wersja PHP: 8.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `zgk`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `deklaracje`
--

DROP TABLE IF EXISTS `deklaracje`;
CREATE TABLE IF NOT EXISTS `deklaracje` (
  `Deklaracja_id` int NOT NULL AUTO_INCREMENT,
  `Data_złożenia` datetime DEFAULT NULL,
  `Typ_odpadów` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Częstotliwość_odbioru` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Stawka` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`Deklaracja_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `faktury`
--

DROP TABLE IF EXISTS `faktury`;
CREATE TABLE IF NOT EXISTS `faktury` (
  `Faktura_id` int NOT NULL AUTO_INCREMENT,
  `Numer` int DEFAULT NULL,
  `Data_wystawienia` datetime DEFAULT NULL,
  `Kwota` decimal(10,2) DEFAULT NULL,
  `Status_faktury` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Klient_id` int DEFAULT NULL,
  PRIMARY KEY (`Faktura_id`),
  KEY `fk_faktury_klienci` (`Klient_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `harmonogram_wywozu`
--

DROP TABLE IF EXISTS `harmonogram_wywozu`;
CREATE TABLE IF NOT EXISTS `harmonogram_wywozu` (
  `Harmonogram_id` int NOT NULL AUTO_INCREMENT,
  `Data_wywozu` datetime DEFAULT NULL,
  `Typ_odpadów` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Nieruchomość_id` int DEFAULT NULL,
  PRIMARY KEY (`Harmonogram_id`),
  KEY `fk_harmonogram_wywozu_nieruchomości` (`Nieruchomość_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klienci`
--

DROP TABLE IF EXISTS `klienci`;
CREATE TABLE IF NOT EXISTS `klienci` (
  `Klient_id` int NOT NULL AUTO_INCREMENT,
  `Imię` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Nazwisko` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Pesel` int DEFAULT NULL,
  `Adres_korespondencyjny` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Telefon` int DEFAULT NULL,
  `Email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Klient_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `nieruchomości`
--

DROP TABLE IF EXISTS `nieruchomości`;
CREATE TABLE IF NOT EXISTS `nieruchomości` (
  `Nieruchomość_id` int NOT NULL AUTO_INCREMENT,
  `Adres` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Typ_nieruchomości` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Liczba_mieszkańców` int DEFAULT NULL,
  `Klient_id` int DEFAULT NULL,
  `Deklaracja_id` int DEFAULT NULL,
  PRIMARY KEY (`Nieruchomość_id`),
  KEY `fk_nieruchomości_klienci` (`Klient_id`),
  KEY `fk_nieruchomości_deklaracje` (`Deklaracja_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
