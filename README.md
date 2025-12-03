# Databáze PVY — detailní popis struktury

Tento README je zaměřený na datový model: tabulky, sloupce, primární a cizí klíče a vztahy mezi entitami. Repozitář obsahuje dva SQL soubory (`betterUkol.sql` a `restaurace_palyza.sql`) a skript `faker_data_restaurace.py` pro generování testovacích dat.

Zjednodušený přehled entit:
- `stat` — státy
- `mesto` — města (odkaz na `stat`)
- `adresa` — adresy (odkaz na `mesto`)
- `restaurace` — restaurace (odkaz na `adresa`)
- `stoly` — jednotlivé stoly v restauraci (odkaz na `restaurace`)
- `zakaznik` — zákazníci (odkaz na `adresa`)
- `telefon` — telefonní čísla (může patřit zákazníkovi nebo restauraci)
- `rezervace_stolu` — rezervace stolů (odkazy na `stoly` a `zakaznik`)
- `oteviraci_doba` — otevírací doba restaurací (odkaz na `restaurace`)

Struktura tabulek (sloupce a klíče)

- `stat`
  - `id_stat` INT PRIMARY KEY AUTO_INCREMENT
  - `stat_nazev` VARCHAR(100)

- `mesto`
  - `id_mesto` INT PRIMARY KEY AUTO_INCREMENT
  - `id_stat` INT  -- FK -> `stat(id_stat)`
  - `mesto_nazev` VARCHAR(100)

- `adresa`
  - `id_adresa` INT PRIMARY KEY AUTO_INCREMENT
  - `id_mesto` INT  -- FK -> `mesto(id_mesto)`
  - `ulice` VARCHAR(100)
  - `psc` VARCHAR(10)

- `restaurace`
  - `id_restaurace` INT PRIMARY KEY AUTO_INCREMENT
  - `nazev` VARCHAR(100) UNIQUE
  - `id_adresa` INT  -- FK -> `adresa(id_adresa)`

- `stoly`
  - `id_stul` INT PRIMARY KEY AUTO_INCREMENT
  - `id_restaurace` INT  -- FK -> `restaurace(id_restaurace)`
  - `cislo_stolu` INT
  - `pocet_mist` INT
  - `stav` ENUM('volny','rezervovany','obsazeny')

- `zakaznik`
  - `id_zakaznik` INT PRIMARY KEY AUTO_INCREMENT
  - `jmeno` VARCHAR(100)
  - `prijmeni` VARCHAR(100)
  - `email` VARCHAR(100) UNIQUE
  - `id_adresa` INT  -- FK -> `adresa(id_adresa)`

- `telefon`
  - `id_telefon` INT PRIMARY KEY AUTO_INCREMENT
  - `cislo` VARCHAR(20) UNIQUE
  - `id_zakaznik` INT  -- FK -> `zakaznik(id_zakaznik)` (může být NULL)
  - `id_restaurace` INT -- FK -> `restaurace(id_restaurace)` (může být NULL)

- `rezervace_stolu`
  - `id_rezervace` INT PRIMARY KEY AUTO_INCREMENT
  - `id_stul` INT  -- FK -> `stoly(id_stul)`
  - `id_zakaznik` INT -- FK -> `zakaznik(id_zakaznik)`
  - `datum_a_cas` DATETIME
  - `delka_rezervace` TIME
  - `pocet_osob` INT
  - `poznamka` TEXT

- `oteviraci_doba`
  - `id_oteviraci_doba` INT PRIMARY KEY AUTO_INCREMENT
  - `id_restaurace` INT -- FK -> `restaurace(id_restaurace)`
  - `den_v_tydnu` VARCHAR(20)
  - `otevreno_od` TIME
  - `otevreno_do` TIME

Cizí klíče / vztahy (shrnutí)
- `mesto.id_stat` -> `stat.id_stat` (1:N)
- `adresa.id_mesto` -> `mesto.id_mesto` (1:N)
- `restaurace.id_adresa` -> `adresa.id_adresa` (1:N)
- `stoly.id_restaurace` -> `restaurace.id_restaurace` (1:N)
- `rezervace_stolu.id_stul` -> `stoly.id_stul` (1:N)
- `rezervace_stolu.id_zakaznik` -> `zakaznik.id_zakaznik` (1:N)
- `zakaznik.id_adresa` -> `adresa.id_adresa` (1:N)
- `telefon.id_zakaznik` -> `zakaznik.id_zakaznik` (0..N)
- `telefon.id_restaurace` -> `restaurace.id_restaurace` (0..N)
- `oteviraci_doba.id_restaurace` -> `restaurace.id_restaurace` (1:N)

Textový ER diagram (jednoduchý):

  stat (1) <-< mesto (N) <-< adresa (N) ->> restaurace (N) ->< stoly (N) ->< rezervace_stolu (N)
                                              \-> telefon (N)
                                   restaurace (1) ->< oteviraci_doba (N)
                      zakaznik (1) ->< rezervace_stolu (N)
                      zakaznik (1) ->< telefon (N)

Poznámky k návrhu a datovým typům
- Schéma je navržené pro MySQL/MariaDB (ENUM, AUTO_INCREMENT, ENGINE apod.). Při migraci do PostgreSQL je potřeba upravit ENUM (např. pomocí typu nebo CHECK constraint) a AUTO_INCREMENT změnit na SEQUENCE / SERIAL nebo IDENTITY.
- Sloupce typu `VARCHAR(100)` pro jméno, název a `TEXT` pro poznámky jsou velmi generické — pokud plánujete mezinárodní data, zvažte kódování UTF8/utf8mb4.
- Indexy: dump obsahuje unikátní indexy na `restaurace.nazev`, `telefon.cislo`, `zakaznik.email`, a běžné indexy na FK. To zrychlí JOINy a vyhledávání.

Integritní pravidla a doporučení
- Důrazně doporučuji nastavit ON DELETE/ON UPDATE pravidla pro FK (např. `ON DELETE SET NULL` pro `telefon.id_restaurace` pokud chcete zachovat čísla i po smazání restaurace). Aktuální dump používá implicitní chování InnoDB (RESTRICT), tedy odstranění rodiče které má děti selže.
- Validace e-mailu a telefonních čísel by měla probíhat na aplikační vrstvě; do DB lze přidat CONSTRAINTy (CHECK) nebo použít trigger pro komplexní pravidla.

Ukázkové dotazy orientované na strukturu
- Seznam restaurací s městem a státem:
  - SELECT r.id_restaurace, r.nazev, a.ulice, a.psc, m.mesto_nazev, s.stat_nazev
    FROM restaurace r
    JOIN adresa a ON r.id_adresa = a.id_adresa
    JOIN mesto m ON a.id_mesto = m.id_mesto
    JOIN stat s ON m.id_stat = s.id_stat;

- Kolik stolů má každá restaurace podle stavu:
  - SELECT id_restaurace, stav, COUNT(*) AS pocet FROM stoly GROUP BY id_restaurace, stav;

- Volné stoly a jejich kapacita v dané restauraci:
  - SELECT cislo_stolu, pocet_mist FROM stoly WHERE id_restaurace = 1 AND stav = 'volny';

- Rezervace zákazníka (jménem nebo emailem):
  - SELECT rs.*, r.nazev FROM rezervace_stolu rs
    JOIN zakaznik z ON rs.id_zakaznik = z.id_zakaznik
    JOIN stoly s ON rs.id_stul = s.id_stul
    JOIN restaurace r ON s.id_restaurace = r.id_restaurace
    WHERE z.email = 'priklad@example.com' ORDER BY rs.datum_a_cas;

Import a provoz
- `restaurace_palyza.sql` je phpMyAdmin export (MySQL). Importujte do MySQL/MariaDB:
  - `mysql -u <user> -p <database> < restaurace_palyza.sql`
- `betterUkol.sql` obsahuje čistou DDL definici — lze jej importovat do MySQL nebo upravit pro PostgreSQL.

Faker skript
- `faker_data_restaurace.py` slouží pro doplnění testovacích dat. Před spuštěním:
  - upravte připojení v hlavičce skriptu nebo použijte proměnné prostředí
  - spusťte v izolovaném virtuálním prostředí: `python3 -m venv venv && source venv/bin/activate && pip install Faker`