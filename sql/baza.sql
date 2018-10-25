-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Czas generowania: 25 Paź 2018, 09:18
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
  `klasa` int(11) NOT NULL,
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
  `id_daty_egzaminu` int(11) NOT NULL,
  `godzina_rozpoczecia` time NOT NULL,
  `godzina_zakonczenia` time NOT NULL,
  `sala` varchar(5) NOT NULL,
  `egzaminator_wewnetrzny` int(11) NOT NULL,
  `egzaminator_zewnetrzny` int(11) NOT NULL,
  `id_przedmiotu` int(11) NOT NULL
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
  `nazwa` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sale`
--

CREATE TABLE `sale` (
  `sala` varchar(5) NOT NULL,
  `maks_ilosc_osob` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `szkoly`
--

CREATE TABLE `szkoly` (
  `nazwa` varchar(255) NOT NULL
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
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_klasa_grupa` (`klasa`),
  ADD KEY `fk_idMaturyUstnej_grupyMaturyUstnej` (`id_matury_ustnej`);

--
-- Indexes for table `klasy`
--
ALTER TABLE `klasy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `matury_ustne`
--
ALTER TABLE `matury_ustne`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_przedmiot_maturyUstne` (`id_przedmiotu`),
  ADD KEY `fk_sala_maturyUstne` (`sala`),
  ADD KEY `fk_nauczycielW_maturyUstne` (`egzaminator_wewnetrzny`),
  ADD KEY `fk_nauczycielZ_maturyUstne` (`egzaminator_zewnetrzny`) USING BTREE,
  ADD KEY `fk_data_maturyUstne` (`id_daty_egzaminu`);

--
-- Indexes for table `nauczyciele_wewnetrzni`
--
ALTER TABLE `nauczyciele_wewnetrzni`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nauczyciele_zewnetrzni`
--
ALTER TABLE `nauczyciele_zewnetrzni`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_szkola_nauczyciele_zewnetrzni` (`szkola`);

--
-- Indexes for table `przedmioty`
--
ALTER TABLE `przedmioty`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `przedmiot` (`nazwa`);

--
-- Indexes for table `sale`
--
ALTER TABLE `sale`
  ADD PRIMARY KEY (`sala`),
  ADD UNIQUE KEY `sala` (`sala`);

--
-- Indexes for table `szkoly`
--
ALTER TABLE `szkoly`
  ADD PRIMARY KEY (`nazwa`);

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
--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `grupy_matura_ustna`
--
ALTER TABLE `grupy_matura_ustna`
  ADD CONSTRAINT `fk_idMaturyUstnej_grupyMaturyUstnej` FOREIGN KEY (`id_matury_ustnej`) REFERENCES `matury_ustne` (`id`),
  ADD CONSTRAINT `fk_klasa_grupa` FOREIGN KEY (`klasa`) REFERENCES `klasy` (`id`);

--
-- Ograniczenia dla tabeli `matury_ustne`
--
ALTER TABLE `matury_ustne`
  ADD CONSTRAINT `fk_data_maturyUstne` FOREIGN KEY (`id_daty_egzaminu`) REFERENCES `daty_matur` (`id`),
  ADD CONSTRAINT `fk_nauczycielW_maturyUstne` FOREIGN KEY (`egzaminator_wewnetrzny`) REFERENCES `nauczyciele_wewnetrzni` (`id`),
  ADD CONSTRAINT `fk_nauczycielZ_maturyUstne` FOREIGN KEY (`egzaminator_zewnetrzny`) REFERENCES `nauczyciele_zewnetrzni` (`id`),
  ADD CONSTRAINT `fk_nauczycielZ_maturyUstne2` FOREIGN KEY (`egzaminator_zewnetrzny`) REFERENCES `nauczyciele_zewnetrzni` (`id`),
  ADD CONSTRAINT `fk_przedmiot_maturyUstne` FOREIGN KEY (`id_przedmiotu`) REFERENCES `przedmioty` (`id`),
  ADD CONSTRAINT `fk_sala_maturyUstne` FOREIGN KEY (`sala`) REFERENCES `sale` (`sala`);

--
-- Ograniczenia dla tabeli `nauczyciele_zewnetrzni`
--
ALTER TABLE `nauczyciele_zewnetrzni`
  ADD CONSTRAINT `fk_szkola_nauczyciele_zewnetrzni` FOREIGN KEY (`szkola`) REFERENCES `szkoly` (`nazwa`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
