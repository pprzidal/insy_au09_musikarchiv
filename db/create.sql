-- Zweck: Übung Musikarchiv 2020
-- Autor: MARM + 3A/B/C/DHIT
-- Datum: 2019-03-11 V2.0 Vorbereitungsarbeiten erledigt
-- Datum: 2020-04-30 Fertiggestellt von pprzidal

DROP DATABASE IF EXISTS musikarchiv2019;
CREATE DATABASE musikarchiv2019;
USE musikarchiv2019;

-- DROP TABLE IF EXISTS interpret; eig. sollte man diesen Befehl nicht benötigen wenn man schon die ganze DB verwirft
CREATE TABLE interpret (
       iname         VARCHAR(100),    -- z.B. 'Presley, Elvis'  aber: 'Pink Floyd'
       inameanz      VARCHAR(100),    -- z.B. 'Elvis Presley'         'Pink Floyd'
	     wikipedia     VARCHAR(200),
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
  gbez VARCHAR (255),
  PRIMARY KEY (gbez)
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

CREATE TABLE albumgenre (
  gbez VARCHAR (255),
  aid SMALLINT,
  PRIMARY KEY (gbez, aid),
  FOREIGN KEY (gbez) REFERENCES genre (gbez),
  FOREIGN KEY (aid) REFERENCES album (aid)
) ENGINE=INNODB;

CREATE TABLE song (
  komponist VARCHAR(255),
  stitel VARCHAR(255),
  iname VARCHAR(100),
  PRIMARY KEY (stitel, iname),
  FOREIGN KEY (interpret) REFERENCES interpret (iname)
) ENGINE=INNODB;

CREATE TABLE songv (
  sdauer TIME,
  svers TINYINT,
  gbez VARCHAR (255),
  stitel VARCHAR (255),
  iname VARCHAR (255),
  PRIMARY KEY (iname, stitel, svers),
  FOREIGN KEY (iname) REFERENCES song (iname),
  FOREIGN KEY (stitel) REFERENCES song (stitel)
) ENGINE=INNODB;

CREATE TABLE tontr (
  medium VARCHAR (255),
  seite VARCHAR (255),
  aid SMALLINT,
  PRIMARY KEY (medium, seite, aid),
  FOREIGN KEY (aid) REFERENCES album (aid)
) ENGINE=INNODB;

CREATE TABLE ttracklist (
  bonus BOOLEAN,
  tracknr TINYINT,
  aid SMALLINT,
  medium VARCHAR (255),
  seite VARCHAR (255),
  iname VARCHAR (100),
  stitel VARCHAR (255),
  svers TINYINT,
  PRIMARY KEY (aid, medium, seite, iname, stitel, svers),
  
) ENGINE=INNODB;

CREATE TABLE playl (
  pbem VARCHAR (255),
  pbez VARCHAR (255),
  PRIMARY KEY (pbez)
) ENGINE=INNODB;

CREATE TABLE ptracklist (

) ENGINE=INNODB;
