-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 17 Gru 2024, 10:32
-- Wersja serwera: 10.4.24-MariaDB
-- Wersja PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `musicapp`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `albumdetails`
--

CREATE TABLE `albumdetails` (
  `DetailID` int(11) NOT NULL,
  `AlbumID` int(11) DEFAULT NULL,
  `DownloadsCount` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `albumdetails`
--

INSERT INTO `albumdetails` (`DetailID`, `AlbumID`, `DownloadsCount`) VALUES
(1, 1, 11000102),
(2, 2, 304666444),
(3, 3, 4000230),
(4, 4, 300120222),
(5, 5, 22000000),
(6, 6, 400345042),
(7, 7, 253453),
(8, 8, 1506404300),
(9, 9, 243085),
(10, 10, 4586200),
(11, 11, 130000560),
(12, 12, 24332190),
(13, 13, 24300453),
(14, 14, 55384200);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `albums`
--

CREATE TABLE `albums` (
  `AlbumID` int(11) NOT NULL,
  `BandID` int(11) DEFAULT NULL,
  `AlbumTitle` text NOT NULL,
  `ReleaseYear` int(11) DEFAULT NULL,
  `Track` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `albums`
--

INSERT INTO `albums` (`AlbumID`, `BandID`, `AlbumTitle`, `ReleaseYear`, `Track`) VALUES
(1, 1, 'The Now Now', 2018, 11),
(2, 2, 'The Black Parade', 2006, 14),
(3, 3, 'wilki', 1992, 16),
(4, 4, 'A Beautiful Lie', 2009, 13),
(5, 4, 'This Is War', 2009, 15),
(6, 5, 'Cry Baby', 2015, 16),
(7, 6, 'Dead Letters', 2003, 10),
(8, 7, 'Metallica', 1991, 12),
(9, 8, 'Meskie Granie 2022', 2022, 30),
(10, 9, 'Zloto', 2016, 11),
(11, 10, 'Disintegration', 1989, 11),
(12, 11, 'The Division Bell', 1994, 11),
(13, 12, 'Spirit', 2017, 17),
(14, 13, 'Angel Dust', 1992, 14);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `bands`
--

CREATE TABLE `bands` (
  `BandID` int(11) NOT NULL,
  `BandName` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `bands`
--

INSERT INTO `bands` (`BandID`, `BandName`) VALUES
(1, 'Gorillaz'),
(2, 'My Chemical Romance'),
(3, 'Wilki'),
(4, '30 Seconds To Mars'),
(5, 'Melanie Martinez'),
(6, 'The Rasmus'),
(7, 'Metallica'),
(8, 'Meskie Granie Orkiestra 2022'),
(9, 'Krzysztof Zalewski'),
(10, 'The Cure'),
(11, 'Pink Floyd'),
(12, 'Depeche Mode'),
(13, 'Faith No More');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `playlist`
--

CREATE TABLE `playlist` (
  `id` int(11) NOT NULL,
  `wykonawca` varchar(100) NOT NULL,
  `album` varchar(50) NOT NULL,
  `liczba_utworow` int(11) NOT NULL,
  `rok_wydania` int(11) NOT NULL,
  `liczba_pobran` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `playlist`
--

INSERT INTO `playlist` (`id`, `wykonawca`, `album`, `liczba_utworow`, `rok_wydania`, `liczba_pobran`) VALUES
(1, 'Gorillaz', 'The Now Now', 11, 2018, 11000102),
(2, 'My Chemical Romance', 'The Black Parade', 14, 2006, 304666444),
(3, 'Wilki', 'wilki', 16, 1992, 4000230),
(4, '30 Seconds To Mars', 'A Beautiful Lie', 13, 2009, 300120222),
(5, '30 Seconds To Mars', 'This Is War', 15, 2009, 22000000),
(6, 'Melanie Martinez', 'Cry Baby', 16, 2015, 400345042),
(7, 'The Rasmus', 'Dead Letters', 10, 2003, 253453),
(8, 'Metallica', 'Metallica', 12, 1991, 1506404300),
(9, 'Meskie Granie Orkiestra 2022', 'Meskie Granie 2022', 30, 2022, 243085),
(10, 'Krzysztof Zalewski', 'Zloto', 11, 2016, 4586200),
(11, 'The Cure', 'Disintegration', 11, 1989, 130000560),
(12, 'Pink Floyd', 'The Division Bell', 11, 1994, 24332190),
(13, 'Depeche Mode', 'Spirit', 17, 2017, 24300453),
(14, 'Faith No More', 'Angel Dust', 14, 1992, 55384200);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `albumdetails`
--
ALTER TABLE `albumdetails`
  ADD PRIMARY KEY (`DetailID`),
  ADD KEY `AlbumID` (`AlbumID`);

--
-- Indeksy dla tabeli `albums`
--
ALTER TABLE `albums`
  ADD PRIMARY KEY (`AlbumID`),
  ADD KEY `BandID` (`BandID`);

--
-- Indeksy dla tabeli `bands`
--
ALTER TABLE `bands`
  ADD PRIMARY KEY (`BandID`);

--
-- Indeksy dla tabeli `playlist`
--
ALTER TABLE `playlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `albumdetails`
--
ALTER TABLE `albumdetails`
  MODIFY `DetailID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT dla tabeli `albums`
--
ALTER TABLE `albums`
  MODIFY `AlbumID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT dla tabeli `bands`
--
ALTER TABLE `bands`
  MODIFY `BandID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT dla tabeli `playlist`
--
ALTER TABLE `playlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `albumdetails`
--
ALTER TABLE `albumdetails`
  ADD CONSTRAINT `albumdetails_ibfk_1` FOREIGN KEY (`AlbumID`) REFERENCES `albums` (`AlbumID`);

--
-- Ograniczenia dla tabeli `albums`
--
ALTER TABLE `albums`
  ADD CONSTRAINT `albums_ibfk_1` FOREIGN KEY (`BandID`) REFERENCES `bands` (`BandID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
