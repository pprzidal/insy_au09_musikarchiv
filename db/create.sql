-- Zweck: Übung Musikarchiv 2020
-- Autor: MARM + 3A/B/C/DHIT
-- Datum: 2019-03-11 V2.0 Vorbereitungsarbeiten erledigt

DROP DATABASE IF EXISTS musikarchiv2019;
CREATE DATABASE musikarchiv2019;
USE musikarchiv2019;

-- DROP TABLE IF EXISTS interpret; eig. sollte man diesen Befehl nicht benötigen wenn man schon die ganze DB verwirft
CREATE TABLE interpret (
       iname         VARCHAR(100),    -- z.B. 'Presley, Elvis'  aber: 'Pink Floyd'
       inameanz      VARCHAR(100),    -- z.B. 'Elvis Presley'         'Pink Floyd'
	   wikipedia     varchar(200),
       PRIMARY KEY (iname)
) ENGINE=INNODB;

CREATE TABLE solist (
  iname VARCHAR(100),
  gebdatum DATE,
  PRIMARY KEY (iname),
  FOREIGN KEY (iname) REFERENCES interpret (iname)
) ENGINE=INNODB;

CREATE TABLE band (
  iname VARCHAR(100),
  gruendjahr DATE,
  PRIMARY KEY (iname),
  FOREIGN KEY (iname) REFERENCES interpret (iname)
) ENGINE=INNODB;

CREATE TABLE mitglied (
  bisdatum DATE,
  vondatum DATE,
  siname VARCHAR(100),
  biname VARCHAR(100),
  PRIMARY KEY (vondatum, biname, siname),
  FOREIGN KEY (siname) REFERENCES solist (iname),
  FOREIGN KEY (biname) REFERENCES band (iname)
) ENGINE=INNODB;

CREATE TABLE genre (
  bezeichnung VARCHAR (50),
  PRIMARY KEY (bezeichnung)
) ENGINE=INNODB;

-- DROP TABLE IF EXISTS album; eig. sollte man diesen Befehl nicht benötigen wenn man schon die ganze DB verwirft
CREATE TABLE album (
       aid     SMALLINT,              -- vierstellig xyyz
									  -- x:  3AHIT-->1, 3BHIT-->2, 3CHIT--3, 3DHIT-->4, MARM-->5, 500 G.A.-->0001..0500
									  -- yy: Knr
									  -- z:  0..9
       atitel  VARCHAR(100),
	   pjahr   SMALLINT      CHECK (pjahr > 1900 AND pjahr < 2100),
	   atyp    VARCHAR(100),
       rang500 SMALLINT      UNIQUE,  -- NULL oder Rangliste aus '500 Greatest Albums'
	   discogs VARCHAR(100),
	   abem    VARCHAR(100),
       iname   VARCHAR(100),
	   vorgaenger SMALLINT,
       PRIMARY KEY (aid),
       FOREIGN KEY (iname)      REFERENCES interpret (iname) ON UPDATE CASCADE ON DELETE CASCADE,
       FOREIGN KEY (vorgaenger) REFERENCES album (aid)       ON UPDATE CASCADE ON DELETE SET NULL
) ENGINE=INNODB;
