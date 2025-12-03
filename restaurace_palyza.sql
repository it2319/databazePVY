-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Počítač: 127.0.0.1
-- Vytvořeno: Stř 03. pro 2025, 22:56
-- Verze serveru: 10.4.32-MariaDB
-- Verze PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databáze: `restaurace_palyza`
--

-- --------------------------------------------------------

--
-- Struktura tabulky `adresa`
--

CREATE TABLE `adresa` (
  `id_adresa` int(11) NOT NULL,
  `id_mesto` int(11) DEFAULT NULL,
  `ulice` varchar(100) DEFAULT NULL,
  `psc` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `adresa`
--

INSERT INTO `adresa` (`id_adresa`, `id_mesto`, `ulice`, `psc`) VALUES
(1, 1, 'Medlovská', '201 29'),
(2, 13, 'Spolupráce', '435 76'),
(3, 9, 'Štěchovická', '559 43'),
(4, 19, 'Rožmberská', '437 48'),
(5, 18, 'Pražská', '685 60'),
(6, 15, 'Nad Košinkou', '306 25'),
(7, 13, 'Nábřeží Kapitána Jaroše', '382 13'),
(8, 16, 'Na Poustkách', '280 92'),
(9, 12, 'Březanova', '683 19'),
(10, 1, 'Pod Lochkovem', '693 12'),
(11, 14, 'Moravanů', '230 19'),
(12, 8, 'Pod Kostelem', '311 78'),
(13, 8, 'Kulhavého', '388 70'),
(14, 12, 'Smolenská', '690 76'),
(15, 7, 'Opletalova', '412 53'),
(16, 20, 'Kotrčová', '136 02'),
(17, 7, 'Nouzov', '673 44'),
(18, 1, 'Kováříkova', '146 03'),
(19, 6, 'Zapských', '585 64'),
(20, 7, 'Kulhavého', '748 53'),
(21, 1, 'Konžská', '372 63'),
(22, 10, 'Na Staré Vinici', '473 58'),
(23, 5, 'Rokytnická', '403 40'),
(24, 8, 'Pod Lochkovem', '386 42'),
(25, 7, 'Náměstí I. P. Pavlova', '605 81'),
(26, 6, 'Adélčina', '570 70'),
(27, 5, 'Na Spojce', '198 77'),
(28, 12, 'Pohnertova', '562 50'),
(29, 1, 'Komenského Nám.', '612 02'),
(30, 7, 'Oderská', '302 87'),
(31, 19, 'Jirčanská', '700 09'),
(32, 14, 'Jižní', '639 72'),
(33, 4, 'Na Svahu', '714 29'),
(34, 2, 'Doubravická', '277 17'),
(35, 15, 'Kotrčová', '305 45'),
(36, 2, 'Stroupežnického', '131 93'),
(37, 14, 'Na Náspu', '565 63'),
(38, 7, 'Hostýnská', '640 87'),
(39, 17, 'Kremnická', '587 90'),
(40, 9, 'Ostrovského', '497 02'),
(41, 1, 'Spinozova', '716 32'),
(42, 9, 'Svojsíkova', '773 78'),
(43, 20, 'Okrová', '662 68'),
(44, 20, 'Kostková', '265 30'),
(45, 3, 'Vratislavova', '661 16'),
(46, 6, 'Novodvorská', '323 85'),
(47, 9, 'Kojetická', '666 49'),
(48, 8, 'K Nádrži', '602 81'),
(49, 7, 'Čuprova', '317 79'),
(50, 14, 'Výravská', '760 21');

-- --------------------------------------------------------

--
-- Struktura tabulky `mesto`
--

CREATE TABLE `mesto` (
  `id_mesto` int(11) NOT NULL,
  `id_stat` int(11) DEFAULT NULL,
  `mesto_nazev` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `mesto`
--

INSERT INTO `mesto` (`id_mesto`, `id_stat`, `mesto_nazev`) VALUES
(1, 5, 'Jablonec nad Jizerou'),
(2, 3, 'Králův Dvůr'),
(3, 4, 'Velvary'),
(4, 5, 'Praha'),
(5, 1, 'Terezín'),
(6, 5, 'Horní Planá'),
(7, 4, 'Košťany'),
(8, 5, 'Červená Řečice'),
(9, 5, 'Smiřice'),
(10, 4, 'Liberec'),
(11, 3, 'Odolena Voda'),
(12, 1, 'Luhačovice'),
(13, 4, 'Mohelnice'),
(14, 5, 'Olešnice'),
(15, 2, 'Město Touškov'),
(16, 1, 'Zlín'),
(17, 5, 'Nýřany'),
(18, 4, 'Měčín'),
(19, 3, 'Rabí'),
(20, 2, 'Bělá nad Radbuzou');

-- --------------------------------------------------------

--
-- Struktura tabulky `oteviraci_doba`
--

CREATE TABLE `oteviraci_doba` (
  `id_oteviraci_doba` int(11) NOT NULL,
  `id_restaurace` int(11) DEFAULT NULL,
  `den_v_tydnu` varchar(20) DEFAULT NULL,
  `otevreno_od` time DEFAULT NULL,
  `otevreno_do` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `oteviraci_doba`
--

INSERT INTO `oteviraci_doba` (`id_oteviraci_doba`, `id_restaurace`, `den_v_tydnu`, `otevreno_od`, `otevreno_do`) VALUES
(1, 1, 'pondělí', '11:00:00', '23:00:00'),
(2, 1, 'úterý', '11:00:00', '23:00:00'),
(3, 1, 'středa', '11:00:00', '23:00:00'),
(4, 1, 'čtvrtek', '11:00:00', '23:00:00'),
(5, 1, 'pátek', '11:00:00', '23:00:00'),
(6, 1, 'sobota', '10:00:00', '22:00:00'),
(7, 1, 'neděle', '10:00:00', '22:00:00'),
(8, 2, 'pondělí', '11:00:00', '23:00:00'),
(9, 2, 'úterý', '11:00:00', '23:00:00'),
(10, 2, 'středa', '11:00:00', '23:00:00'),
(11, 2, 'čtvrtek', '11:00:00', '23:00:00'),
(12, 2, 'pátek', '11:00:00', '23:00:00'),
(13, 2, 'sobota', '10:00:00', '22:00:00'),
(14, 2, 'neděle', '10:00:00', '22:00:00'),
(15, 3, 'pondělí', '11:00:00', '23:00:00'),
(16, 3, 'úterý', '11:00:00', '23:00:00'),
(17, 3, 'středa', '11:00:00', '23:00:00'),
(18, 3, 'čtvrtek', '11:00:00', '23:00:00'),
(19, 3, 'pátek', '11:00:00', '23:00:00'),
(20, 3, 'sobota', '10:00:00', '22:00:00'),
(21, 3, 'neděle', NULL, NULL),
(22, 4, 'pondělí', '11:00:00', '23:00:00'),
(23, 4, 'úterý', '11:00:00', '23:00:00'),
(24, 4, 'středa', '11:00:00', '23:00:00'),
(25, 4, 'čtvrtek', '11:00:00', '23:00:00'),
(26, 4, 'pátek', '11:00:00', '23:00:00'),
(27, 4, 'sobota', NULL, NULL),
(28, 4, 'neděle', NULL, NULL),
(29, 5, 'pondělí', '11:00:00', '23:00:00'),
(30, 5, 'úterý', '11:00:00', '23:00:00'),
(31, 5, 'středa', '11:00:00', '23:00:00'),
(32, 5, 'čtvrtek', '11:00:00', '23:00:00'),
(33, 5, 'pátek', '11:00:00', '23:00:00'),
(34, 5, 'sobota', '10:00:00', '22:00:00'),
(35, 5, 'neděle', NULL, NULL),
(36, 6, 'pondělí', '11:00:00', '23:00:00'),
(37, 6, 'úterý', '11:00:00', '23:00:00'),
(38, 6, 'středa', '11:00:00', '23:00:00'),
(39, 6, 'čtvrtek', '11:00:00', '23:00:00'),
(40, 6, 'pátek', '11:00:00', '23:00:00'),
(41, 6, 'sobota', NULL, NULL),
(42, 6, 'neděle', '10:00:00', '22:00:00'),
(43, 7, 'pondělí', '11:00:00', '23:00:00'),
(44, 7, 'úterý', '11:00:00', '23:00:00'),
(45, 7, 'středa', '11:00:00', '23:00:00'),
(46, 7, 'čtvrtek', '11:00:00', '23:00:00'),
(47, 7, 'pátek', '11:00:00', '23:00:00'),
(48, 7, 'sobota', '10:00:00', '22:00:00'),
(49, 7, 'neděle', '10:00:00', '22:00:00'),
(50, 8, 'pondělí', '11:00:00', '23:00:00'),
(51, 8, 'úterý', '11:00:00', '23:00:00'),
(52, 8, 'středa', '11:00:00', '23:00:00'),
(53, 8, 'čtvrtek', '11:00:00', '23:00:00'),
(54, 8, 'pátek', '11:00:00', '23:00:00'),
(55, 8, 'sobota', '10:00:00', '22:00:00'),
(56, 8, 'neděle', '10:00:00', '22:00:00'),
(57, 9, 'pondělí', '11:00:00', '23:00:00'),
(58, 9, 'úterý', '11:00:00', '23:00:00'),
(59, 9, 'středa', '11:00:00', '23:00:00'),
(60, 9, 'čtvrtek', '11:00:00', '23:00:00'),
(61, 9, 'pátek', '11:00:00', '23:00:00'),
(62, 9, 'sobota', '10:00:00', '22:00:00'),
(63, 9, 'neděle', '10:00:00', '22:00:00'),
(64, 10, 'pondělí', '11:00:00', '23:00:00'),
(65, 10, 'úterý', '11:00:00', '23:00:00'),
(66, 10, 'středa', '11:00:00', '23:00:00'),
(67, 10, 'čtvrtek', '11:00:00', '23:00:00'),
(68, 10, 'pátek', '11:00:00', '23:00:00'),
(69, 10, 'sobota', NULL, NULL),
(70, 10, 'neděle', '10:00:00', '22:00:00');

-- --------------------------------------------------------

--
-- Struktura tabulky `restaurace`
--

CREATE TABLE `restaurace` (
  `id_restaurace` int(11) NOT NULL,
  `nazev` varchar(100) DEFAULT NULL,
  `id_adresa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `restaurace`
--

INSERT INTO `restaurace` (`id_restaurace`, `nazev`, `id_adresa`) VALUES
(1, 'Žáková s.r.o. Restaurace', 4),
(2, 'Beránková v.o.s. Restaurace', 3),
(3, 'Blažek Kašpar o.s. Restaurace', 1),
(4, 'Bláhová Restaurace', 4),
(5, 'Tichá o.s. Restaurace', 44),
(6, 'Tichý Restaurace', 37),
(7, 'Pešková Švec k.s. Restaurace', 19),
(8, 'Štěpánek Restaurace', 9),
(9, 'Nováková Musil k.s. Restaurace', 20),
(10, 'Dostál a.s. Restaurace', 25);

-- --------------------------------------------------------

--
-- Struktura tabulky `rezervace_stolu`
--

CREATE TABLE `rezervace_stolu` (
  `id_rezervace` int(11) NOT NULL,
  `id_stul` int(11) DEFAULT NULL,
  `id_zakaznik` int(11) DEFAULT NULL,
  `datum_a_cas` datetime DEFAULT NULL,
  `delka_rezervace` time DEFAULT NULL,
  `pocet_osob` int(11) DEFAULT NULL,
  `poznamka` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `rezervace_stolu`
--

INSERT INTO `rezervace_stolu` (`id_rezervace`, `id_stul`, `id_zakaznik`, `datum_a_cas`, `delka_rezervace`, `pocet_osob`, `poznamka`) VALUES
(1, 73, 39, '2025-12-08 16:00:00', '01:00:00', 4, NULL),
(2, 99, 6, '2025-12-21 03:30:00', '02:00:00', 7, NULL),
(3, 85, 39, '2026-01-09 00:30:00', '02:00:00', 5, 'Jedna židle navic'),
(4, 94, 30, '2026-02-05 19:00:00', '03:00:00', 10, NULL),
(5, 52, 45, '2025-12-26 23:30:00', '02:00:00', 4, ''),
(6, 131, 39, '2025-12-16 14:00:00', '03:00:00', 8, NULL),
(7, 124, 16, '2026-01-18 10:30:00', '01:00:00', 8, NULL),
(8, 124, 37, '2025-12-25 17:00:00', '02:00:00', 8, NULL),
(9, 114, 41, '2026-02-07 14:00:00', '01:00:00', 5, NULL),
(10, 127, 69, '2026-01-28 05:30:00', '01:00:00', 5, NULL),
(11, 139, 18, '2026-02-23 14:00:00', '03:00:00', 3, NULL),
(12, 148, 98, '2025-12-18 20:30:00', '01:00:00', 5, NULL),
(13, 107, 36, '2025-12-14 20:30:00', '03:00:00', 7, NULL),
(14, 88, 48, '2026-01-15 20:30:00', '03:00:00', 2, NULL),
(15, 96, 20, '2026-02-13 09:00:00', '02:00:00', 4, ''),
(16, 114, 36, '2026-01-05 09:00:00', '01:00:00', 4, NULL),
(17, 10, 35, '2025-12-30 14:30:00', '01:00:00', 6, NULL),
(18, 39, 46, '2026-02-06 18:30:00', '03:00:00', 4, NULL),
(19, 65, 30, '2026-01-20 22:00:00', '03:00:00', 7, NULL),
(20, 59, 7, '2025-12-16 19:00:00', '02:00:00', 7, NULL),
(21, 95, 98, '2026-01-07 08:30:00', '02:00:00', 5, ''),
(22, 116, 56, '2026-01-21 06:00:00', '01:00:00', 4, NULL),
(23, 55, 31, '2026-02-24 15:30:00', '03:00:00', 3, NULL),
(24, 28, 12, '2026-01-22 07:00:00', '01:00:00', 5, NULL),
(25, 4, 25, '2026-01-07 07:30:00', '02:00:00', 8, NULL),
(26, 101, 36, '2026-01-24 05:30:00', '03:00:00', 3, NULL),
(27, 90, 47, '2025-12-24 15:00:00', '03:00:00', 2, 'Záchranný dočkat čerpat agresivní kapitál vydání.'),
(28, 62, 62, '2025-12-09 01:30:00', '03:00:00', 5, NULL),
(29, 145, 31, '2026-02-15 18:30:00', '01:00:00', 2, NULL),
(30, 97, 11, '2026-02-24 19:30:00', '01:00:00', 9, 'Památka ulice podnikání strop obnova šestnáct.'),
(31, 51, 14, '2026-01-09 16:00:00', '02:00:00', 10, NULL),
(32, 127, 57, '2026-01-26 19:30:00', '01:00:00', 4, NULL),
(33, 54, 34, '2026-02-08 14:00:00', '02:00:00', 9, NULL),
(34, 108, 76, '2026-02-07 15:00:00', '02:00:00', 10, NULL),
(35, 109, 93, '2026-01-29 05:00:00', '02:00:00', 4, NULL),
(36, 134, 38, '2026-01-02 18:30:00', '01:00:00', 10, 'Odhadnout posluchač proměnit celkový zato koncentrace akademický otcův.'),
(37, 138, 80, '2026-02-03 11:30:00', '01:00:00', 6, NULL),
(38, 17, 44, '2025-12-28 08:00:00', '02:00:00', 2, NULL),
(39, 55, 64, '2026-01-28 20:00:00', '03:00:00', 2, NULL),
(40, 17, 17, '2025-12-12 07:00:00', '03:00:00', 9, NULL),
(41, 107, 59, '2026-01-20 12:30:00', '02:00:00', 5, NULL),
(42, 39, 57, '2026-02-23 06:30:00', '03:00:00', 9, NULL),
(43, 33, 87, '2026-01-23 03:00:00', '02:00:00', 4, NULL),
(44, 54, 46, '2026-02-01 17:00:00', '01:00:00', 2, 'Práh nemoc zadržet veřejný.'),
(45, 31, 71, '2025-12-17 17:30:00', '02:00:00', 9, NULL),
(46, 48, 71, '2026-01-31 12:30:00', '02:00:00', 2, 'Rozhodující spadnout mimořádně asociace.'),
(47, 13, 25, '2025-12-10 04:30:00', '02:00:00', 2, 'Projekt setkávat cestovní ostrý náznak Němec.'),
(48, 118, 93, '2025-12-16 14:30:00', '02:00:00', 9, NULL),
(49, 42, 11, '2026-02-19 07:00:00', '02:00:00', 7, 'Syn zkratka uvidět předvést Vary přidávat.'),
(50, 56, 98, '2026-02-26 17:00:00', '02:00:00', 7, NULL),
(51, 34, 13, '2026-01-01 17:00:00', '01:00:00', 9, NULL),
(52, 97, 57, '2025-12-26 02:00:00', '03:00:00', 9, 'Tlustý posloužit nastavení foto televizor až srovnat.'),
(53, 15, 74, '2026-01-11 15:00:00', '01:00:00', 5, NULL),
(54, 136, 33, '2026-02-17 14:30:00', '01:00:00', 8, 'Politický požadovaný zázemí turistický kilometr vyšetření salát.'),
(55, 64, 76, '2026-03-03 18:00:00', '01:00:00', 10, 'Výhled lehký zastoupení sv.'),
(56, 120, 35, '2025-12-12 12:00:00', '03:00:00', 8, NULL),
(57, 98, 71, '2026-02-19 10:30:00', '03:00:00', 5, NULL),
(58, 120, 46, '2026-01-23 21:30:00', '02:00:00', 10, 'Oslavit mávnout vyšetřovatel hlavička trend.'),
(59, 63, 97, '2026-01-20 05:30:00', '03:00:00', 5, NULL),
(60, 88, 13, '2026-03-05 00:00:00', '03:00:00', 7, NULL),
(61, 93, 38, '2025-12-07 07:00:00', '01:00:00', 9, NULL),
(62, 32, 63, '2026-02-26 08:30:00', '01:00:00', 8, 'Hubený pouto to těžký dálnice omlouvat.'),
(63, 39, 92, '2026-01-25 02:30:00', '03:00:00', 4, 'Ocenit zjištění stolek zjištění projekt výpočet.'),
(64, 37, 43, '2025-12-23 00:30:00', '03:00:00', 4, 'Moc zaujmout přehled tmavý.'),
(65, 54, 19, '2025-12-06 11:00:00', '02:00:00', 10, NULL),
(66, 65, 39, '2026-02-20 02:00:00', '03:00:00', 5, 'Svetr ranní odvětit vina skromný.'),
(67, 47, 58, '2025-12-23 02:00:00', '01:00:00', 8, NULL),
(68, 29, 53, '2026-01-16 00:00:00', '03:00:00', 6, NULL),
(69, 146, 32, '2026-01-09 20:30:00', '03:00:00', 2, NULL),
(70, 63, 25, '2026-02-05 12:00:00', '01:00:00', 6, NULL),
(71, 41, 27, '2025-12-08 18:00:00', '02:00:00', 6, NULL),
(72, 70, 44, '2025-12-11 18:00:00', '02:00:00', 8, NULL),
(73, 129, 17, '2026-01-31 22:30:00', '01:00:00', 8, NULL),
(74, 145, 5, '2026-02-28 14:00:00', '01:00:00', 7, NULL),
(75, 142, 34, '2026-02-20 22:30:00', '01:00:00', 9, NULL),
(76, 135, 59, '2026-01-24 06:30:00', '01:00:00', 8, NULL),
(77, 103, 6, '2026-02-05 10:00:00', '03:00:00', 8, NULL),
(78, 87, 15, '2026-02-22 12:00:00', '02:00:00', 5, 'Zabalit odložit ideální modernizace únor.'),
(79, 78, 90, '2025-12-18 12:00:00', '01:00:00', 4, 'Výchova činit obrat výkonný pozemek trefit.'),
(80, 20, 12, '2026-01-05 13:30:00', '01:00:00', 9, NULL),
(81, 125, 68, '2026-02-27 04:00:00', '01:00:00', 4, NULL),
(82, 25, 81, '2025-12-29 01:30:00', '02:00:00', 10, NULL),
(83, 27, 40, '2026-01-16 13:30:00', '01:00:00', 6, 'Google poznatek vítat investovat.'),
(84, 150, 32, '2026-02-23 21:00:00', '03:00:00', 3, 'Holka kopec týž škola zkoumat litovat svět vystřelit.'),
(85, 124, 9, '2026-01-26 14:00:00', '01:00:00', 4, NULL),
(86, 119, 60, '2026-02-04 03:00:00', '02:00:00', 5, 'Navazovat právě další.'),
(87, 118, 46, '2026-02-11 15:30:00', '01:00:00', 6, NULL),
(88, 147, 40, '2026-02-03 03:00:00', '02:00:00', 10, 'Mizet nahoře rozdíl indický noha samec.'),
(89, 69, 29, '2025-12-16 03:30:00', '01:00:00', 8, NULL),
(90, 97, 19, '2025-12-20 02:00:00', '02:00:00', 9, 'Kuře výzva přední subjekt grafický pohár kterýkoli.'),
(91, 3, 13, '2025-12-30 14:00:00', '02:00:00', 8, NULL),
(92, 11, 34, '2026-02-18 20:00:00', '01:00:00', 4, NULL),
(93, 46, 99, '2026-02-05 20:30:00', '02:00:00', 7, 'Druh předvádět dramatický popis stanovený talent.'),
(94, 122, 90, '2026-02-08 12:00:00', '01:00:00', 6, NULL),
(95, 62, 85, '2026-01-04 11:30:00', '01:00:00', 9, NULL),
(96, 17, 62, '2025-12-13 18:00:00', '02:00:00', 7, 'K chléb takovýto absurdní.'),
(97, 88, 27, '2026-02-27 00:30:00', '03:00:00', 3, NULL),
(98, 35, 11, '2026-01-27 07:00:00', '01:00:00', 8, NULL),
(99, 150, 58, '2026-01-16 15:30:00', '03:00:00', 2, NULL),
(100, 118, 15, '2026-02-06 23:00:00', '01:00:00', 10, 'Západ policie mírný organizovat duch znát.'),
(101, 11, 55, '2026-02-13 11:30:00', '01:00:00', 7, NULL),
(102, 86, 58, '2026-02-24 14:00:00', '03:00:00', 9, NULL),
(103, 39, 9, '2025-12-18 09:00:00', '03:00:00', 9, NULL),
(104, 85, 48, '2026-02-03 08:30:00', '03:00:00', 2, NULL),
(105, 8, 70, '2026-01-04 17:30:00', '01:00:00', 5, NULL),
(106, 80, 44, '2026-01-16 03:00:00', '02:00:00', 6, NULL),
(107, 149, 49, '2025-12-17 09:00:00', '02:00:00', 5, NULL),
(108, 90, 75, '2026-01-25 16:00:00', '02:00:00', 5, NULL),
(109, 112, 24, '2026-01-16 11:30:00', '03:00:00', 5, 'Rychlý přecházet Havel falešný odebrat devátý míjet.'),
(110, 54, 21, '2025-12-06 13:30:00', '02:00:00', 9, NULL),
(111, 35, 13, '2026-02-26 14:00:00', '02:00:00', 6, NULL),
(112, 43, 48, '2025-12-09 22:00:00', '02:00:00', 10, 'Manželka pořadí ret založit absurdní.'),
(113, 105, 64, '2025-12-04 02:00:00', '02:00:00', 6, NULL),
(114, 111, 86, '2026-02-15 21:30:00', '02:00:00', 3, NULL),
(115, 24, 68, '2026-03-03 13:00:00', '03:00:00', 4, NULL),
(116, 3, 66, '2026-03-05 00:00:00', '01:00:00', 3, NULL),
(117, 33, 54, '2026-02-19 19:30:00', '01:00:00', 8, NULL),
(118, 43, 59, '2025-12-21 22:30:00', '02:00:00', 3, NULL),
(119, 72, 50, '2025-12-14 02:00:00', '01:00:00', 6, NULL),
(120, 31, 2, '2025-12-26 23:00:00', '02:00:00', 10, 'Záviset klidně vážný odhadovat krása komplex mladík.'),
(121, 25, 81, '2026-02-25 10:00:00', '03:00:00', 4, NULL),
(122, 87, 84, '2026-02-15 11:00:00', '03:00:00', 2, NULL),
(123, 71, 80, '2026-01-14 11:00:00', '03:00:00', 9, NULL),
(124, 82, 14, '2026-01-05 23:00:00', '02:00:00', 3, NULL),
(125, 74, 54, '2026-02-05 05:00:00', '03:00:00', 10, NULL),
(126, 87, 39, '2026-02-25 04:30:00', '03:00:00', 10, NULL),
(127, 79, 5, '2026-01-04 18:30:00', '03:00:00', 8, NULL),
(128, 60, 22, '2026-01-28 19:30:00', '02:00:00', 9, 'Egypt vyřešit EU milý letošní cm povaha jakýsi.'),
(129, 91, 30, '2026-02-24 13:30:00', '02:00:00', 8, NULL),
(130, 77, 47, '2026-02-28 00:00:00', '02:00:00', 4, 'Pilot klient nálada hoch.'),
(131, 124, 48, '2025-12-06 00:30:00', '01:00:00', 4, NULL),
(132, 78, 1, '2026-01-28 10:30:00', '03:00:00', 2, 'Branka vyslovit povrchový vědomí plán přenášet.'),
(133, 117, 68, '2025-12-26 09:00:00', '01:00:00', 6, 'Nevinný čerstvě budova ozvat.'),
(134, 39, 13, '2025-12-10 20:30:00', '02:00:00', 4, 'Odebrat ruční pokračování.'),
(135, 55, 97, '2026-01-16 18:30:00', '02:00:00', 7, 'Televizor had vítr vystupovat kafe galerie.'),
(136, 52, 70, '2026-03-04 16:30:00', '01:00:00', 10, 'Četný čelo napůl.'),
(137, 133, 6, '2025-12-06 07:30:00', '01:00:00', 7, NULL),
(138, 103, 73, '2026-01-23 02:00:00', '02:00:00', 6, 'Hloupý běhat škoda.'),
(139, 32, 53, '2026-01-07 22:30:00', '02:00:00', 5, NULL),
(140, 55, 91, '2025-12-07 19:30:00', '01:00:00', 6, 'Proměna chemický toužit kvalitní uplatnění.'),
(141, 23, 15, '2026-02-21 09:30:00', '02:00:00', 7, 'Brát předchůdce náhoda horní přístupný.'),
(142, 142, 91, '2026-02-27 03:00:00', '01:00:00', 9, 'Zařadit oddíl mlha vybírat obecně rozbitý soustředit.'),
(143, 23, 72, '2026-01-13 22:00:00', '03:00:00', 5, 'Vnitro pokládat pověst bakterie solární muzika.'),
(144, 121, 20, '2026-01-19 19:00:00', '02:00:00', 8, NULL),
(145, 120, 33, '2026-01-31 00:00:00', '01:00:00', 9, NULL),
(146, 21, 76, '2026-02-11 06:00:00', '02:00:00', 9, NULL),
(147, 90, 34, '2026-01-24 13:30:00', '03:00:00', 9, 'Mlčení šéf nabídka populace.'),
(148, 146, 76, '2026-03-03 07:00:00', '03:00:00', 8, 'Odstranění váhat charakter zahynout v kopat.'),
(149, 97, 86, '2026-02-10 10:00:00', '01:00:00', 8, NULL),
(150, 64, 45, '2026-02-09 18:00:00', '02:00:00', 2, NULL);

-- --------------------------------------------------------

--
-- Struktura tabulky `stat`
--

CREATE TABLE `stat` (
  `id_stat` int(11) NOT NULL,
  `stat_nazev` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `stat`
--

INSERT INTO `stat` (`id_stat`, `stat_nazev`) VALUES
(1, 'Sierra Leone'),
(2, 'Sýrie'),
(3, 'Japonsko'),
(4, 'Gabon'),
(5, 'Peru');

-- --------------------------------------------------------

--
-- Struktura tabulky `stoly`
--

CREATE TABLE `stoly` (
  `id_stul` int(11) NOT NULL,
  `id_restaurace` int(11) DEFAULT NULL,
  `cislo_stolu` int(11) DEFAULT NULL,
  `pocet_mist` int(11) DEFAULT NULL,
  `stav` enum('volny','rezervovany','obsazeny') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `stoly`
--

INSERT INTO `stoly` (`id_stul`, `id_restaurace`, `cislo_stolu`, `pocet_mist`, `stav`) VALUES
(1, 1, 1, 4, 'obsazeny'),
(2, 1, 2, 8, 'obsazeny'),
(3, 1, 3, 4, 'volny'),
(4, 1, 4, 10, 'rezervovany'),
(5, 1, 5, 8, 'rezervovany'),
(6, 1, 6, 4, 'rezervovany'),
(7, 1, 7, 2, 'obsazeny'),
(8, 1, 8, 4, 'volny'),
(9, 1, 9, 10, 'volny'),
(10, 1, 10, 10, 'obsazeny'),
(11, 1, 11, 6, 'obsazeny'),
(12, 1, 12, 2, 'rezervovany'),
(13, 1, 13, 6, 'obsazeny'),
(14, 1, 14, 4, 'volny'),
(15, 1, 15, 2, 'volny'),
(16, 2, 1, 2, 'rezervovany'),
(17, 2, 2, 4, 'volny'),
(18, 2, 3, 2, 'volny'),
(19, 2, 4, 10, 'obsazeny'),
(20, 2, 5, 6, 'rezervovany'),
(21, 2, 6, 10, 'volny'),
(22, 2, 7, 6, 'rezervovany'),
(23, 2, 8, 4, 'obsazeny'),
(24, 2, 9, 4, 'volny'),
(25, 2, 10, 6, 'rezervovany'),
(26, 2, 11, 2, 'obsazeny'),
(27, 2, 12, 4, 'rezervovany'),
(28, 2, 13, 8, 'obsazeny'),
(29, 2, 14, 4, 'obsazeny'),
(30, 2, 15, 2, 'volny'),
(31, 3, 1, 2, 'rezervovany'),
(32, 3, 2, 10, 'obsazeny'),
(33, 3, 3, 6, 'rezervovany'),
(34, 3, 4, 8, 'rezervovany'),
(35, 3, 5, 10, 'rezervovany'),
(36, 3, 6, 6, 'volny'),
(37, 3, 7, 8, 'volny'),
(38, 3, 8, 4, 'obsazeny'),
(39, 3, 9, 4, 'rezervovany'),
(40, 3, 10, 6, 'volny'),
(41, 3, 11, 8, 'rezervovany'),
(42, 3, 12, 8, 'obsazeny'),
(43, 3, 13, 4, 'obsazeny'),
(44, 3, 14, 10, 'volny'),
(45, 3, 15, 8, 'obsazeny'),
(46, 4, 1, 10, 'rezervovany'),
(47, 4, 2, 6, 'obsazeny'),
(48, 4, 3, 4, 'rezervovany'),
(49, 4, 4, 8, 'volny'),
(50, 4, 5, 10, 'volny'),
(51, 4, 6, 8, 'rezervovany'),
(52, 4, 7, 6, 'obsazeny'),
(53, 4, 8, 6, 'obsazeny'),
(54, 4, 9, 6, 'rezervovany'),
(55, 4, 10, 10, 'rezervovany'),
(56, 4, 11, 10, 'obsazeny'),
(57, 4, 12, 8, 'rezervovany'),
(58, 4, 13, 10, 'volny'),
(59, 4, 14, 10, 'obsazeny'),
(60, 4, 15, 4, 'rezervovany'),
(61, 5, 1, 10, 'volny'),
(62, 5, 2, 8, 'obsazeny'),
(63, 5, 3, 10, 'obsazeny'),
(64, 5, 4, 4, 'volny'),
(65, 5, 5, 10, 'obsazeny'),
(66, 5, 6, 6, 'volny'),
(67, 5, 7, 10, 'rezervovany'),
(68, 5, 8, 10, 'volny'),
(69, 5, 9, 10, 'obsazeny'),
(70, 5, 10, 8, 'rezervovany'),
(71, 5, 11, 8, 'rezervovany'),
(72, 5, 12, 4, 'rezervovany'),
(73, 5, 13, 2, 'volny'),
(74, 5, 14, 6, 'obsazeny'),
(75, 5, 15, 6, 'rezervovany'),
(76, 6, 1, 6, 'rezervovany'),
(77, 6, 2, 8, 'obsazeny'),
(78, 6, 3, 8, 'obsazeny'),
(79, 6, 4, 4, 'rezervovany'),
(80, 6, 5, 8, 'volny'),
(81, 6, 6, 8, 'obsazeny'),
(82, 6, 7, 4, 'obsazeny'),
(83, 6, 8, 8, 'rezervovany'),
(84, 6, 9, 2, 'rezervovany'),
(85, 6, 10, 8, 'rezervovany'),
(86, 6, 11, 6, 'obsazeny'),
(87, 6, 12, 4, 'rezervovany'),
(88, 6, 13, 8, 'volny'),
(89, 6, 14, 2, 'volny'),
(90, 6, 15, 10, 'volny'),
(91, 7, 1, 6, 'obsazeny'),
(92, 7, 2, 4, 'volny'),
(93, 7, 3, 4, 'obsazeny'),
(94, 7, 4, 4, 'volny'),
(95, 7, 5, 8, 'obsazeny'),
(96, 7, 6, 4, 'rezervovany'),
(97, 7, 7, 4, 'obsazeny'),
(98, 7, 8, 2, 'rezervovany'),
(99, 7, 9, 8, 'obsazeny'),
(100, 7, 10, 8, 'volny'),
(101, 7, 11, 6, 'rezervovany'),
(102, 7, 12, 2, 'obsazeny'),
(103, 7, 13, 2, 'volny'),
(104, 7, 14, 8, 'obsazeny'),
(105, 7, 15, 4, 'obsazeny'),
(106, 8, 1, 4, 'volny'),
(107, 8, 2, 4, 'obsazeny'),
(108, 8, 3, 10, 'obsazeny'),
(109, 8, 4, 4, 'volny'),
(110, 8, 5, 10, 'obsazeny'),
(111, 8, 6, 4, 'obsazeny'),
(112, 8, 7, 4, 'obsazeny'),
(113, 8, 8, 6, 'rezervovany'),
(114, 8, 9, 6, 'rezervovany'),
(115, 8, 10, 8, 'obsazeny'),
(116, 8, 11, 6, 'volny'),
(117, 8, 12, 2, 'obsazeny'),
(118, 8, 13, 10, 'rezervovany'),
(119, 8, 14, 8, 'rezervovany'),
(120, 8, 15, 10, 'obsazeny'),
(121, 9, 1, 2, 'rezervovany'),
(122, 9, 2, 4, 'volny'),
(123, 9, 3, 10, 'rezervovany'),
(124, 9, 4, 8, 'volny'),
(125, 9, 5, 6, 'rezervovany'),
(126, 9, 6, 10, 'rezervovany'),
(127, 9, 7, 10, 'rezervovany'),
(128, 9, 8, 8, 'volny'),
(129, 9, 9, 10, 'volny'),
(130, 9, 10, 4, 'volny'),
(131, 9, 11, 2, 'volny'),
(132, 9, 12, 10, 'obsazeny'),
(133, 9, 13, 10, 'obsazeny'),
(134, 9, 14, 10, 'volny'),
(135, 9, 15, 10, 'rezervovany'),
(136, 10, 1, 2, 'rezervovany'),
(137, 10, 2, 6, 'volny'),
(138, 10, 3, 8, 'obsazeny'),
(139, 10, 4, 10, 'obsazeny'),
(140, 10, 5, 2, 'obsazeny'),
(141, 10, 6, 2, 'rezervovany'),
(142, 10, 7, 4, 'rezervovany'),
(143, 10, 8, 6, 'obsazeny'),
(144, 10, 9, 4, 'volny'),
(145, 10, 10, 10, 'volny'),
(146, 10, 11, 2, 'volny'),
(147, 10, 12, 6, 'obsazeny'),
(148, 10, 13, 6, 'obsazeny'),
(149, 10, 14, 4, 'obsazeny'),
(150, 10, 15, 8, 'volny');

-- --------------------------------------------------------

--
-- Struktura tabulky `telefon`
--

CREATE TABLE `telefon` (
  `id_telefon` int(11) NOT NULL,
  `cislo` varchar(20) DEFAULT NULL,
  `id_zakaznik` int(11) DEFAULT NULL,
  `id_restaurace` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `telefon`
--

INSERT INTO `telefon` (`id_telefon`, `cislo`, `id_zakaznik`, `id_restaurace`) VALUES
(1, '+420704741310', 1, NULL),
(2, '00420607199073', 3, NULL),
(3, '+420601471020', 4, NULL),
(4, '00420603706892', 5, NULL),
(5, '+420793525010', 6, NULL),
(6, '+420601567583', 8, NULL),
(7, '00420605041586', 9, NULL),
(8, '00420608380702', 9, NULL),
(9, '00420703933220', 10, NULL),
(10, '00420605502448', 11, NULL),
(11, '00420725984343', 11, NULL),
(12, '+420736325113', 12, NULL),
(13, '00420607932835', 13, NULL),
(14, '+420607254205', 14, NULL),
(15, '00420702392896', 14, NULL),
(16, '+420605098138', 16, NULL),
(17, '00420605466891', 16, NULL),
(18, '+420703143342', 17, NULL),
(19, '+420601415590', 18, NULL),
(20, '00420605055093', 19, NULL),
(21, '+420608533284', 19, NULL),
(22, '+420601085875', 20, NULL),
(23, '00420607447908', 20, NULL),
(24, '+420705629866', 23, NULL),
(25, '00420702203661', 23, NULL),
(26, '+420604092932', 24, NULL),
(27, '+420607970545', 26, NULL),
(28, '+420601285791', 26, NULL),
(29, '00420777417595', 27, NULL),
(30, '+420603692058', 27, NULL),
(31, '00420704464854', 28, NULL),
(32, '00420702581859', 28, NULL),
(33, '00420702989488', 29, NULL),
(34, '00420604929964', 30, NULL),
(35, '+420607648945', 31, NULL),
(36, '00420702068996', 31, NULL),
(37, '+420607567377', 33, NULL),
(38, '00420608338034', 34, NULL),
(39, '+420606730726', 35, NULL),
(40, '00420608148388', 41, NULL),
(41, '+420738598234', 42, NULL),
(42, '00420602309856', 42, NULL),
(43, '00420703426882', 43, NULL),
(44, '00420604413865', 43, NULL),
(45, '00420602034646', 45, NULL),
(46, '00420722513090', 46, NULL),
(47, '+420799694051', 46, NULL),
(48, '+420603500475', 47, NULL),
(49, '+420601144646', 47, NULL),
(50, '00420791858977', 48, NULL),
(51, '+420704630311', 48, NULL),
(52, '+420727351357', 51, NULL),
(53, '+420607653054', 51, NULL),
(54, '00420723476123', 52, NULL),
(55, '00420602756256', 52, NULL),
(56, '00420607745348', 53, NULL),
(57, '+420608648600', 54, NULL),
(58, '00420777580730', 57, NULL),
(59, '+420605503562', 57, NULL),
(60, '+420603590124', 58, NULL),
(61, '+420704318653', 58, NULL),
(62, '+420601507312', 59, NULL),
(63, '+420606455549', 60, NULL),
(64, '00420720461991', 60, NULL),
(65, '+420602438470', 62, NULL),
(66, '00420605766869', 62, NULL),
(67, '00420703467236', 63, NULL),
(68, '00420739185285', 63, NULL),
(69, '00420602484073', 65, NULL),
(70, '+420704631589', 65, NULL),
(71, '+420603228713', 68, NULL),
(72, '+420734571134', 70, NULL),
(73, '+420703882696', 71, NULL),
(74, '00420608122281', 71, NULL),
(75, '00420608679222', 73, NULL),
(76, '00420604876892', 75, NULL),
(77, '00420605058706', 75, NULL),
(78, '+420776749146', 76, NULL),
(79, '00420608825985', 78, NULL),
(80, '00420798892038', 78, NULL),
(81, '+420602421307', 80, NULL),
(82, '+420605755945', 81, NULL),
(83, '+420601699131', 86, NULL),
(84, '+420603780257', 89, NULL),
(85, '00420607691928', 90, NULL),
(86, '00420721452137', 91, NULL),
(87, '+420603105306', 91, NULL),
(88, '00420607392322', 93, NULL),
(89, '+420727972709', 94, NULL),
(90, '+420607188607', 94, NULL),
(91, '00420702805956', 97, NULL),
(92, '+420704615463', 97, NULL),
(93, '+420724297516', 99, NULL),
(94, '+420604747571', 99, NULL),
(95, '+420737683087', NULL, 1),
(96, '00420705953787', NULL, 2),
(97, '+420608733521', NULL, 3),
(98, '00420705944838', NULL, 4),
(99, '+420605035812', NULL, 5),
(100, '+420779199281', NULL, 6),
(101, '00420730442842', NULL, 7),
(102, '+420737236678', NULL, 8),
(103, '+420608646076', NULL, 9),
(104, '00420729030503', NULL, 10);

-- --------------------------------------------------------

--
-- Struktura tabulky `zakaznik`
--

CREATE TABLE `zakaznik` (
  `id_zakaznik` int(11) NOT NULL,
  `jmeno` varchar(100) DEFAULT NULL,
  `prijmeni` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `id_adresa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Vypisuji data pro tabulku `zakaznik`
--

INSERT INTO `zakaznik` (`id_zakaznik`, `jmeno`, `prijmeni`, `email`, `id_adresa`) VALUES
(1, 'Stanislava', 'Lišková', 'cechdaniel@example.net', 50),
(2, 'Svatopluk', 'Havlíček', 'jelinkovamiluse@example.org', 8),
(3, 'Marcela', 'Ševčík', 'vladislavprokop@example.net', 49),
(4, 'Daniel', 'Šťastný', 'samuelsvec@example.com', 43),
(5, 'Radoslav', 'Bureš', 'robertmarek@example.com', 17),
(6, 'Soňa', 'Kratochvíl', 'beranovanina@example.com', 48),
(7, 'Pavel', 'Procházka', 'pavlikovalucie@example.org', 1),
(8, 'Dorota', 'Macháčková', 'mvitek@example.net', 21),
(9, 'Vlasta', 'Blažek', 'horakalbert@example.org', 11),
(10, 'Vít', 'Král', 'ljelinek@example.net', 42),
(11, 'Svatoslav', 'Vlček', 'ivo27@example.org', 31),
(12, 'Stanislav', 'Prokop', 'nprochazkova@example.net', 46),
(13, 'Karolína', 'Marešová', 'nsedlacek@example.org', 12),
(14, 'Jaromír', 'Lišková', 'sykoraludek@example.org', 17),
(15, 'Albert', 'Marešová', 'zuzanaurbanova@example.com', 10),
(16, 'Adam', 'Fišer', 'zkral@example.org', 23),
(17, 'Dorota', 'Matějková', 'jonaskubicek@example.com', 45),
(18, 'Jiří', 'Štěpánek', 'jana89@example.com', 6),
(19, 'Bohumila', 'Matoušková', 'maresartur@example.org', 4),
(20, 'Alexandr', 'Horáková', 'monikasmidova@example.com', 39),
(21, 'Jan', 'Matějka', 'krizovamarie@example.net', 14),
(22, 'Adéla', 'Růžička', 'kucerakamil@example.org', 12),
(23, 'Oldřich', 'Žáková', 'jhruska@example.org', 34),
(24, 'Vlasta', 'Polák', 'kfialova@example.com', 13),
(25, 'Lubomír', 'Král', 'ksykorova@example.org', 11),
(26, 'Radim', 'Křížová', 'vitkovadenisa@example.com', 14),
(27, 'Agáta', 'Šmíd', 'svecovaaneta@example.net', 6),
(28, 'Františka', 'Ježková', 'otyliefialova@example.com', 1),
(29, 'Břetislav', 'Kubíčková', 'dkriz@example.com', 17),
(30, 'Ladislav', 'Ševčíková', 'fruzicka@example.org', 46),
(31, 'Bohuslav', 'Matějková', 'gfiserova@example.net', 22),
(32, 'Vladimír', 'Horáková', 'nkovarova@example.org', 15),
(33, 'Jozef', 'Fišer', 'prochazkovagabriela@example.org', 44),
(34, 'Jaroslava', 'Doležalová', 'jindrichhoracek@example.com', 14),
(35, 'Rudolf', 'Šimek', 'zemanovablazena@example.net', 27),
(36, 'Alois', 'Pavlík', 'pavlaholubova@example.com', 5),
(37, 'Ivo', 'Blažek', 'benesovasvetlana@example.com', 50),
(38, 'Lubomír', 'Tesař', 'hrubaivana@example.org', 48),
(39, 'Evelína', 'Beránková', 'kadlecovamarta@example.net', 25),
(40, 'Kamil', 'Bartoš', 'fhorvathova@example.org', 41),
(41, 'Vladislav', 'Horáčková', 'dkralova@example.net', 40),
(42, 'Lýdie', 'Kopecký', 'xsoukup@example.com', 20),
(43, 'Zuzana', 'Havlíček', 'pavlicekmatous@example.org', 20),
(44, 'Ondřej', 'Lišková', 'estankova@example.net', 2),
(45, 'Felix', 'Burešová', 'novotnaanastazie@example.com', 21),
(46, 'Ctibor', 'Dvořáková', 'ovitek@example.com', 11),
(47, 'Zdeňka', 'Horváthová', 'evakratochvilova@example.net', 26),
(48, 'Otakar', 'Dostálová', 'havelstefan@example.net', 10),
(49, 'Ilona', 'Mašková', 'mmoravec@example.net', 40),
(50, 'Zdislava', 'Kopecký', 'gabrielapospisilova@example.org', 26),
(51, 'Julie', 'Vávrová', 'svecovasarka@example.net', 33),
(52, 'Michaela', 'Kolář', 'lukastuma@example.com', 3),
(53, 'Vladislav', 'Bláha', 'dvorakovazofie@example.net', 16),
(54, 'Kateřina', 'Marek', 'danuse86@example.com', 2),
(55, 'David', 'Šmíd', 'jitka79@example.com', 50),
(56, 'Eduard', 'Horváth', 'driha@example.com', 43),
(57, 'Vítězslav', 'Moravec', 'drahoslavasedlakova@example.org', 25),
(58, 'Štefan', 'Fiala', 'markovamichaela@example.net', 29),
(59, 'Aneta', 'Beránková', 'stanekhynek@example.com', 10),
(60, 'Radomír', 'Růžičková', 'jolana03@example.org', 27),
(61, 'Slavěna', 'Bureš', 'wmarek@example.net', 19),
(62, 'Vítězslav', 'Bárta', 'gmaly@example.org', 48),
(63, 'Ivona', 'Soukup', 'prokopladislav@example.com', 42),
(64, 'Václav', 'Říha', 'milossykora@example.net', 41),
(65, 'Petra', 'Šťastná', 'dbarta@example.org', 25),
(66, 'Světlana', 'Kolář', 'nikol61@example.com', 6),
(67, 'Simona', 'Toman', 'robert60@example.com', 33),
(68, 'Martin', 'Nováková', 'simekjaroslav@example.com', 41),
(69, 'Gabriela', 'Dvořák', 'xsevcikova@example.org', 39),
(70, 'Jiří', 'Šimek', 'horakales@example.org', 18),
(71, 'Simona', 'Kašparová', 'wduskova@example.net', 46),
(72, 'Miroslav', 'Burešová', 'qstepankova@example.com', 26),
(73, 'Žofie', 'Hruška', 'kratochvilrobin@example.net', 46),
(74, 'Tereza', 'Fiala', 'mbures@example.com', 30),
(75, 'Eva', 'Bílková', 'vavrovasarka@example.org', 13),
(76, 'Luboš', 'Svobodová', 'zuzana79@example.com', 9),
(77, 'Tadeáš', 'Šimková', 'lslavik@example.net', 44),
(78, 'Filip', 'Horák', 'horvathzikmund@example.org', 36),
(79, 'Vratislav', 'Musil', 'klementbednar@example.org', 9),
(80, 'Jaroslav', 'Pavlíková', 'novotnyigor@example.org', 36),
(81, 'Hana', 'Jandová', 'wsvecova@example.com', 26),
(82, 'Martin', 'Horák', 'andelabartosova@example.com', 41),
(83, 'Simona', 'Strnad', 'lbartosova@example.net', 11),
(84, 'Ivan', 'Pokorná', 'janvanek@example.com', 17),
(85, 'Blahoslav', 'Jarošová', 'machovaerika@example.com', 17),
(86, 'Petra', 'Kovář', 'leonavalentova@example.org', 8),
(87, 'Jonáš', 'Dvořáková', 'wvavrova@example.com', 1),
(88, 'Šimon', 'Ježek', 'kucerabretislav@example.com', 22),
(89, 'Dobroslav', 'Dostál', 'radka10@example.org', 19),
(90, 'Matouš', 'Macháček', 'markovajolana@example.org', 13),
(91, 'Anděla', 'Novák', 'ignac58@example.org', 36),
(92, 'Jindřich', 'Růžičková', 'knovotna@example.net', 43),
(93, 'Šárka', 'Staňková', 'xsvecova@example.com', 35),
(94, 'Dorota', 'Němcová', 'krausovaagata@example.com', 47),
(95, 'Otakar', 'Krejčová', 'gabrielapetrova@example.org', 37),
(96, 'Patrik', 'Bednář', 'mullerovaema@example.com', 33),
(97, 'Miloslava', 'Růžička', 'tomanovamarcela@example.com', 18),
(98, 'Václav', 'Havlíčková', 'jandaondrej@example.com', 5),
(99, 'Simona', 'Malá', 'felixberanek@example.org', 23),
(100, 'Vladislav', 'Tomanová', 'maresovamagdalena@example.com', 1);

--
-- Indexy pro exportované tabulky
--

--
-- Indexy pro tabulku `adresa`
--
ALTER TABLE `adresa`
  ADD PRIMARY KEY (`id_adresa`),
  ADD KEY `id_mesto` (`id_mesto`);

--
-- Indexy pro tabulku `mesto`
--
ALTER TABLE `mesto`
  ADD PRIMARY KEY (`id_mesto`),
  ADD KEY `id_stat` (`id_stat`);

--
-- Indexy pro tabulku `oteviraci_doba`
--
ALTER TABLE `oteviraci_doba`
  ADD PRIMARY KEY (`id_oteviraci_doba`),
  ADD KEY `id_restaurace` (`id_restaurace`);

--
-- Indexy pro tabulku `restaurace`
--
ALTER TABLE `restaurace`
  ADD PRIMARY KEY (`id_restaurace`),
  ADD UNIQUE KEY `nazev` (`nazev`),
  ADD KEY `id_adresa` (`id_adresa`);

--
-- Indexy pro tabulku `rezervace_stolu`
--
ALTER TABLE `rezervace_stolu`
  ADD PRIMARY KEY (`id_rezervace`),
  ADD KEY `id_stul` (`id_stul`),
  ADD KEY `id_zakaznik` (`id_zakaznik`);

--
-- Indexy pro tabulku `stat`
--
ALTER TABLE `stat`
  ADD PRIMARY KEY (`id_stat`);

--
-- Indexy pro tabulku `stoly`
--
ALTER TABLE `stoly`
  ADD PRIMARY KEY (`id_stul`),
  ADD KEY `id_restaurace` (`id_restaurace`);

--
-- Indexy pro tabulku `telefon`
--
ALTER TABLE `telefon`
  ADD PRIMARY KEY (`id_telefon`),
  ADD UNIQUE KEY `cislo` (`cislo`),
  ADD KEY `id_zakaznik` (`id_zakaznik`),
  ADD KEY `id_restaurace` (`id_restaurace`);

--
-- Indexy pro tabulku `zakaznik`
--
ALTER TABLE `zakaznik`
  ADD PRIMARY KEY (`id_zakaznik`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `id_adresa` (`id_adresa`);

--
-- AUTO_INCREMENT pro tabulky
--

--
-- AUTO_INCREMENT pro tabulku `adresa`
--
ALTER TABLE `adresa`
  MODIFY `id_adresa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT pro tabulku `mesto`
--
ALTER TABLE `mesto`
  MODIFY `id_mesto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT pro tabulku `oteviraci_doba`
--
ALTER TABLE `oteviraci_doba`
  MODIFY `id_oteviraci_doba` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT pro tabulku `restaurace`
--
ALTER TABLE `restaurace`
  MODIFY `id_restaurace` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pro tabulku `rezervace_stolu`
--
ALTER TABLE `rezervace_stolu`
  MODIFY `id_rezervace` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT pro tabulku `stat`
--
ALTER TABLE `stat`
  MODIFY `id_stat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pro tabulku `stoly`
--
ALTER TABLE `stoly`
  MODIFY `id_stul` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT pro tabulku `telefon`
--
ALTER TABLE `telefon`
  MODIFY `id_telefon` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT pro tabulku `zakaznik`
--
ALTER TABLE `zakaznik`
  MODIFY `id_zakaznik` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- Omezení pro exportované tabulky
--

--
-- Omezení pro tabulku `adresa`
--
ALTER TABLE `adresa`
  ADD CONSTRAINT `adresa_ibfk_1` FOREIGN KEY (`id_mesto`) REFERENCES `mesto` (`id_mesto`);

--
-- Omezení pro tabulku `mesto`
--
ALTER TABLE `mesto`
  ADD CONSTRAINT `mesto_ibfk_1` FOREIGN KEY (`id_stat`) REFERENCES `stat` (`id_stat`);

--
-- Omezení pro tabulku `oteviraci_doba`
--
ALTER TABLE `oteviraci_doba`
  ADD CONSTRAINT `oteviraci_doba_ibfk_1` FOREIGN KEY (`id_restaurace`) REFERENCES `restaurace` (`id_restaurace`);

--
-- Omezení pro tabulku `restaurace`
--
ALTER TABLE `restaurace`
  ADD CONSTRAINT `restaurace_ibfk_1` FOREIGN KEY (`id_adresa`) REFERENCES `adresa` (`id_adresa`);

--
-- Omezení pro tabulku `rezervace_stolu`
--
ALTER TABLE `rezervace_stolu`
  ADD CONSTRAINT `rezervace_stolu_ibfk_1` FOREIGN KEY (`id_stul`) REFERENCES `stoly` (`id_stul`),
  ADD CONSTRAINT `rezervace_stolu_ibfk_2` FOREIGN KEY (`id_zakaznik`) REFERENCES `zakaznik` (`id_zakaznik`);

--
-- Omezení pro tabulku `stoly`
--
ALTER TABLE `stoly`
  ADD CONSTRAINT `stoly_ibfk_1` FOREIGN KEY (`id_restaurace`) REFERENCES `restaurace` (`id_restaurace`);

--
-- Omezení pro tabulku `telefon`
--
ALTER TABLE `telefon`
  ADD CONSTRAINT `telefon_ibfk_1` FOREIGN KEY (`id_zakaznik`) REFERENCES `zakaznik` (`id_zakaznik`),
  ADD CONSTRAINT `telefon_ibfk_2` FOREIGN KEY (`id_restaurace`) REFERENCES `restaurace` (`id_restaurace`);

--
-- Omezení pro tabulku `zakaznik`
--
ALTER TABLE `zakaznik`
  ADD CONSTRAINT `zakaznik_ibfk_1` FOREIGN KEY (`id_adresa`) REFERENCES `adresa` (`id_adresa`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
