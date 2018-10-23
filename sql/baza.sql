-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Czas generowania: 23 Paź 2018, 12:18
-- Wersja serwera: 10.1.19-MariaDB
-- Wersja PHP: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `matura_ustna`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `daty_matur`
--

CREATE TABLE `daty_matur` (
  `id` int(11) NOT NULL,
  `data_matury` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `grupy_matura_ustna`
--

CREATE TABLE `grupy_matura_ustna` (
  `id` int(11) NOT NULL,
  `id_matury_ustnej` int(3) NOT NULL,
  `klasa` varchar(3) NOT NULL,
  `ilosc_osob` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `klasy`
--

CREATE TABLE `klasy` (
  `id` int(11) NOT NULL,
  `klasa_cyfra` int(1) NOT NULL,
  `klasa_litera` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `matury_ustne`
--

CREATE TABLE `matury_ustne` (
  `id` int(11) NOT NULL,
  `id_daty_egzaminu` date NOT NULL,
  `godzina_rozpoczecia` time NOT NULL,
  `godzina_zakonczenia` time NOT NULL,
  `sala` varchar(4) NOT NULL,
  `egzaminator_wewnetrzny` int(11) NOT NULL,
  `egzaminator_zewnetrzny` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `nauczyciele_wewnetrzni`
--

CREATE TABLE `nauczyciele_wewnetrzni` (
  `id` int(11) NOT NULL,
  `nazwisko` varchar(20) NOT NULL,
  `imie` varchar(20) NOT NULL,
  `egzaminator_matury_ustnej` tinyint(1) NOT NULL DEFAULT '0',
  `szkola` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `nauczyciele_zewnetrzni`
--

CREATE TABLE `nauczyciele_zewnetrzni` (
  `id` int(11) NOT NULL,
  `nazwisko` varchar(20) NOT NULL,
  `imie` varchar(20) NOT NULL,
  `egzaminator_matury_ustnej` tinyint(1) NOT NULL DEFAULT '0',
  `szkola` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `przedmioty`
--

CREATE TABLE `przedmioty` (
  `id` int(11) NOT NULL,
  `przedmiot` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sale`
--

CREATE TABLE `sale` (
  `sala` varchar(5) NOT NULL,
  `maks_ilosc_osob` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indexes for table `daty_matur`
--
ALTER TABLE `daty_matur`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_matury` (`data_matury`);

--
-- Indexes for table `grupy_matura_ustna`
--
ALTER TABLE `grupy_matura_ustna`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `klasy`
--
ALTER TABLE `klasy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `matury_ustne`
--
ALTER TABLE `matury_ustne`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nauczyciele_wewnetrzni`
--
ALTER TABLE `nauczyciele_wewnetrzni`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nauczyciele_zewnetrzni`
--
ALTER TABLE `nauczyciele_zewnetrzni`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `przedmioty`
--
ALTER TABLE `przedmioty`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `przedmiot` (`przedmiot`);

--
-- Indexes for table `sale`
--
ALTER TABLE `sale`
  ADD UNIQUE KEY `sala` (`sala`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `daty_matur`
--
ALTER TABLE `daty_matur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `grupy_matura_ustna`
--
ALTER TABLE `grupy_matura_ustna`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `matury_ustne`
--
ALTER TABLE `matury_ustne`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `nauczyciele_wewnetrzni`
--
ALTER TABLE `nauczyciele_wewnetrzni`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `nauczyciele_zewnetrzni`
--
ALTER TABLE `nauczyciele_zewnetrzni`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT dla tabeli `przedmioty`
--
ALTER TABLE `przedmioty`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
