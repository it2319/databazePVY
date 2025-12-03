CREATE TABLE `rezervace_stolu` (
  `id_rezervace` int PRIMARY KEY AUTO_INCREMENT,
  `id_stul` int,
  `id_zakaznik` int,
  `datum_a_cas` datetime,
  `delka_rezervace` time,
  `pocet_osob` int,
  `poznamka` text
);

CREATE TABLE `zakaznik` (
  `id_zakaznik` int PRIMARY KEY AUTO_INCREMENT,
  `jmeno` varchar(100),
  `prijmeni` varchar(100),
  `email` varchar(100) UNIQUE,
  `id_adresa` int
);

CREATE TABLE `telefon` (
  `id_telefon` int PRIMARY KEY AUTO_INCREMENT,
  `cislo` varchar(20) UNIQUE,
  `id_zakaznik` int,
  `id_restaurace` int
);

CREATE TABLE `restaurace` (
  `id_restaurace` int PRIMARY KEY AUTO_INCREMENT,
  `nazev` varchar(100) UNIQUE,
  `id_adresa` int
);

CREATE TABLE `stoly` (
  `id_stul` int PRIMARY KEY AUTO_INCREMENT,
  `id_restaurace` int,
  `cislo_stolu` int,
  `pocet_mist` int,
  `stav` ENUM('volny', 'rezervovany', 'obsazeny')
);

CREATE TABLE `oteviraci_doba` (
  `id_oteviraci_doba` int PRIMARY KEY AUTO_INCREMENT,
  `id_restaurace` int,
  `den_v_tydnu` varchar(20),
  `otevreno_od` time,
  `otevreno_do` time
);

CREATE TABLE `adresa` (
  `id_adresa` int PRIMARY KEY AUTO_INCREMENT,
  `id_mesto` int,
  `ulice` varchar(100),
  `psc` varchar(10)
);

CREATE TABLE `mesto` (
  `id_mesto` int PRIMARY KEY AUTO_INCREMENT,
  `id_stat` int,
  `mesto_nazev` varchar(100)
);

CREATE TABLE `stat` (
  `id_stat` int PRIMARY KEY AUTO_INCREMENT,
  `stat_nazev` varchar(100)
);

ALTER TABLE `rezervace_stolu` ADD FOREIGN KEY (`id_stul`) REFERENCES `stoly` (`id_stul`);

ALTER TABLE `rezervace_stolu` ADD FOREIGN KEY (`id_zakaznik`) REFERENCES `zakaznik` (`id_zakaznik`);

ALTER TABLE `zakaznik` ADD FOREIGN KEY (`id_adresa`) REFERENCES `adresa` (`id_adresa`);

ALTER TABLE `telefon` ADD FOREIGN KEY (`id_zakaznik`) REFERENCES `zakaznik` (`id_zakaznik`);

ALTER TABLE `telefon` ADD FOREIGN KEY (`id_restaurace`) REFERENCES `restaurace` (`id_restaurace`);

ALTER TABLE `restaurace` ADD FOREIGN KEY (`id_adresa`) REFERENCES `adresa` (`id_adresa`);

ALTER TABLE `stoly` ADD FOREIGN KEY (`id_restaurace`) REFERENCES `restaurace` (`id_restaurace`);

ALTER TABLE `oteviraci_doba` ADD FOREIGN KEY (`id_restaurace`) REFERENCES `restaurace` (`id_restaurace`);

ALTER TABLE `adresa` ADD FOREIGN KEY (`id_mesto`) REFERENCES `mesto` (`id_mesto`);

ALTER TABLE `mesto` ADD FOREIGN KEY (`id_stat`) REFERENCES `stat` (`id_stat`);
