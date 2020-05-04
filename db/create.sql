-- Zweck: Übung Musikarchiv 2020
-- Autor: MARM + 3A/B/C/DHIT
-- Datum: 2019-03-11 V2.0 Vorbereitungsarbeiten erledigt
-- Datum: 2020-04-30 Fertiggestellt von pprzidal

DROP DATABASE IF EXISTS musikarchiv2020;
CREATE DATABASE musikarchiv2020;
USE musikarchiv2020;

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
  gruendjahr SMALLINT,
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
       aid     SMALLINT,
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
  FOREIGN KEY (iname) REFERENCES interpret (iname)
) ENGINE=INNODB;

CREATE TABLE songv (
  sdauer TIME,
  svers VARCHAR(100),
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
  svers VARCHAR(100),
  PRIMARY KEY (aid, medium, seite, iname, stitel, svers),
  FOREIGN KEY (aid, medium, seite) REFERENCES tontr (aid, medium, seite),
  FOREIGN KEY (iname, stitel, svers) REFERENCES songv (iname, stitel, svers)
) ENGINE=INNODB;

CREATE TABLE playl (
  pbem VARCHAR (255),
  pbez VARCHAR (255),
  PRIMARY KEY (pbez)
) ENGINE=INNODB;

CREATE TABLE ptracklist (
  tracknr TINYINT,
  pbez VARCHAR(255),
  stitel VARCHAR(255),
  svers TINYINT,
  iname VARCHAR(100),
  PRIMARY KEY (pbez, iname, stitel, svers),
  FOREIGN KEY (pbez) REFERENCES playl (pbez),
  FOREIGN KEY (iname, stitel, svers) REFERENCES songv (iname, stitel, svers)
) ENGINE=INNODB;

-- 285 Interpreten aus '500 Greatest Albums'
INSERT INTO interpret (iname, inameanz) VALUES ('A Tribe Called Quest', 'A Tribe Called Quest');
INSERT INTO interpret (iname, inameanz) VALUES ('ABBA', 'ABBA');
INSERT INTO interpret (iname, inameanz) VALUES ('AC/DC', 'AC/DC');
INSERT INTO interpret (iname, inameanz) VALUES ('Aerosmith', 'Aerosmith');
INSERT INTO interpret (iname, inameanz) VALUES ('Allman Brothers Band, The ', 'The Allman Brothers Band');
INSERT INTO interpret (iname, inameanz) VALUES ('Arcade', 'Arcade');
INSERT INTO interpret (iname, inameanz) VALUES ('Arctic', 'Arctic');
INSERT INTO interpret (iname, inameanz) VALUES ('B. & Rakim, Eric ', 'Eric B. & Rakim');
INSERT INTO interpret (iname, inameanz) VALUES ('B-52\'s, The ', 'The B-52\'s');
INSERT INTO interpret (iname, inameanz) VALUES ('Band, The ', 'The Band');
INSERT INTO interpret (iname, inameanz) VALUES ('Beach Boys, The ', 'The Beach Boys');
INSERT INTO interpret (iname, inameanz) VALUES ('Beastie Boys', 'Beastie Boys');
INSERT INTO interpret (iname, inameanz) VALUES ('Beatles, The ', 'The Beatles');
INSERT INTO interpret (iname, inameanz) VALUES ('Beck', 'Beck');
INSERT INTO interpret (iname, inameanz) VALUES ('Berry, Chuck ', 'Chuck Berry');
INSERT INTO interpret (iname, inameanz) VALUES ('Big Brother & the Holding Company', 'Big Brother & the Holding Company');
INSERT INTO interpret (iname, inameanz) VALUES ('Big Star', 'Big Star');
INSERT INTO interpret (iname, inameanz) VALUES ('Björk', 'Björk');
INSERT INTO interpret (iname, inameanz) VALUES ('Black Flag', 'Black Flag');
INSERT INTO interpret (iname, inameanz) VALUES ('Black Sabbath', 'Black Sabbath');
INSERT INTO interpret (iname, inameanz) VALUES ('Bland, Bobby ', 'Bobby Bland');
INSERT INTO interpret (iname, inameanz) VALUES ('Blige, Mary J. ', 'Mary J. Blige');
INSERT INTO interpret (iname, inameanz) VALUES ('Blondie', 'Blondie');
INSERT INTO interpret (iname, inameanz) VALUES ('Blood, Sweat and Tears', 'Blood, Sweat and Tears');
INSERT INTO interpret (iname, inameanz) VALUES ('Bowie, David ', 'David Bowie');
INSERT INTO interpret (iname, inameanz) VALUES ('Brown, James ', 'James Brown');
INSERT INTO interpret (iname, inameanz) VALUES ('Browne, Jackson ', 'Jackson Browne');
INSERT INTO interpret (iname, inameanz) VALUES ('Buckley, Jeff ', 'Jeff Buckley');
INSERT INTO interpret (iname, inameanz) VALUES ('Buddy Holly & the Crickets', 'Buddy Holly & the Crickets');
INSERT INTO interpret (iname, inameanz) VALUES ('Buffalo Springfield', 'Buffalo Springfield');
INSERT INTO interpret (iname, inameanz) VALUES ('Buzzcocks', 'Buzzcocks');
INSERT INTO interpret (iname, inameanz) VALUES ('Byrds, The ', 'The Byrds');
INSERT INTO interpret (iname, inameanz) VALUES ('Captain Beefheart & His Magic Band', 'Captain Beefheart & His Magic Band');
INSERT INTO interpret (iname, inameanz) VALUES ('Carpenters', 'Carpenters');
INSERT INTO interpret (iname, inameanz) VALUES ('Cars, The ', 'The Cars');
INSERT INTO interpret (iname, inameanz) VALUES ('Cash, Johnny ', 'Johnny Cash');
INSERT INTO interpret (iname, inameanz) VALUES ('Chao, Manu ', 'Manu Chao');
INSERT INTO interpret (iname, inameanz) VALUES ('Chapman, Tracy ', 'Tracy Chapman');
INSERT INTO interpret (iname, inameanz) VALUES ('Charles, Ray ', 'Ray Charles');
INSERT INTO interpret (iname, inameanz) VALUES ('Cheap Trick', 'Cheap Trick');
INSERT INTO interpret (iname, inameanz) VALUES ('Clapton, Eric ', 'Eric Clapton');
INSERT INTO interpret (iname, inameanz) VALUES ('Clash, The ', 'The Clash');
INSERT INTO interpret (iname, inameanz) VALUES ('Cline, Patsy ', 'Patsy Cline');
INSERT INTO interpret (iname, inameanz) VALUES ('Cohen, Leonard ', 'Leonard Cohen');
INSERT INTO interpret (iname, inameanz) VALUES ('Coldplay', 'Coldplay');
INSERT INTO interpret (iname, inameanz) VALUES ('Coleman, Ornette ', 'Ornette Coleman');
INSERT INTO interpret (iname, inameanz) VALUES ('Coltrane, John ', 'John Coltrane');
INSERT INTO interpret (iname, inameanz) VALUES ('Cooke, Sam ', 'Sam Cooke');
INSERT INTO interpret (iname, inameanz) VALUES ('Cooper, Alice ', 'Alice Cooper');
INSERT INTO interpret (iname, inameanz) VALUES ('Costello & the Attractions, Elvis ', 'Elvis Costello & the Attractions');
INSERT INTO interpret (iname, inameanz) VALUES ('Costello, Elvis ', 'Elvis Costello');
INSERT INTO interpret (iname, inameanz) VALUES ('Cream', 'Cream');
INSERT INTO interpret (iname, inameanz) VALUES ('Creedence Clearwater Revival', 'Creedence Clearwater Revival');
INSERT INTO interpret (iname, inameanz) VALUES ('Crosby, Stills & Nash', 'Crosby, Stills & Nash');
INSERT INTO interpret (iname, inameanz) VALUES ('Crosby, Stills, Nash & Young', 'Crosby, Stills, Nash & Young');
INSERT INTO interpret (iname, inameanz) VALUES ('Cure, The ', 'The Cure');
INSERT INTO interpret (iname, inameanz) VALUES ('D\'Angelo', 'D\'Angelo');
INSERT INTO interpret (iname, inameanz) VALUES ('Davis, Miles ', 'Miles Davis');
INSERT INTO interpret (iname, inameanz) VALUES ('De La Soul', 'De La Soul');
INSERT INTO interpret (iname, inameanz) VALUES ('Def Leppard', 'Def Leppard');
INSERT INTO interpret (iname, inameanz) VALUES ('Depeche Mode', 'Depeche Mode');
INSERT INTO interpret (iname, inameanz) VALUES ('Derek & the Dominos', 'Derek & the Dominos');
INSERT INTO interpret (iname, inameanz) VALUES ('Devo', 'Devo');
INSERT INTO interpret (iname, inameanz) VALUES ('Diamond, Neil ', 'Neil Diamond');
INSERT INTO interpret (iname, inameanz) VALUES ('Diana Ross & the Supremes', 'Diana Ross & the Supremes');
INSERT INTO interpret (iname, inameanz) VALUES ('Diddley, Bo ', 'Bo Diddley');
INSERT INTO interpret (iname, inameanz) VALUES ('Dire Straits', 'Dire Straits');
INSERT INTO interpret (iname, inameanz) VALUES ('Doors, The ', 'The Doors');
INSERT INTO interpret (iname, inameanz) VALUES ('Drake, Nick ', 'Nick Drake');
INSERT INTO interpret (iname, inameanz) VALUES ('Dre, Dr. ', 'Dr. Dre');
INSERT INTO interpret (iname, inameanz) VALUES ('Drifters, The ', 'The Drifters');
INSERT INTO interpret (iname, inameanz) VALUES ('Dylan & the Band, Bob ', 'Bob Dylan & the Band');
INSERT INTO interpret (iname, inameanz) VALUES ('Dylan, Bob ', 'Bob Dylan');
INSERT INTO interpret (iname, inameanz) VALUES ('Eagles', 'Eagles');
INSERT INTO interpret (iname, inameanz) VALUES ('Earle, Steve ', 'Steve Earle');
INSERT INTO interpret (iname, inameanz) VALUES ('Earth, Wind & Fire', 'Earth, Wind & Fire');
INSERT INTO interpret (iname, inameanz) VALUES ('Echo', 'Echo');
INSERT INTO interpret (iname, inameanz) VALUES ('Eminem', 'Eminem');
INSERT INTO interpret (iname, inameanz) VALUES ('Eno', 'Eno');
INSERT INTO interpret (iname, inameanz) VALUES ('EPMD', 'EPMD');
INSERT INTO interpret (iname, inameanz) VALUES ('Eurythmics', 'Eurythmics');
INSERT INTO interpret (iname, inameanz) VALUES ('Fleetwood Mac', 'Fleetwood Mac');
INSERT INTO interpret (iname, inameanz) VALUES ('Flying Burrito Bros, The ', 'The Flying Burrito Bros');
INSERT INTO interpret (iname, inameanz) VALUES ('Franklin, Aretha ', 'Aretha Franklin');
INSERT INTO interpret (iname, inameanz) VALUES ('Fugees', 'Fugees');
INSERT INTO interpret (iname, inameanz) VALUES ('Funkadelic', 'Funkadelic');
INSERT INTO interpret (iname, inameanz) VALUES ('Gabriel, Peter ', 'Peter Gabriel');
INSERT INTO interpret (iname, inameanz) VALUES ('Gang of Four', 'Gang of Four');
INSERT INTO interpret (iname, inameanz) VALUES ('Gaye, Marvin ', 'Marvin Gaye');
INSERT INTO interpret (iname, inameanz) VALUES ('Getz / João Gilberto Featuring Antonio Carlos Jobim, Stan ', 'Stan Getz / João Gilberto Featuring Antonio Carlos Jobim');
INSERT INTO interpret (iname, inameanz) VALUES ('Go-Go\'s', 'Go-Go\'s');
INSERT INTO interpret (iname, inameanz) VALUES ('Graham Parker & the Rumour', 'Graham Parker & the Rumour');
INSERT INTO interpret (iname, inameanz) VALUES ('Grateful Dead, The ', 'The Grateful Dead');
INSERT INTO interpret (iname, inameanz) VALUES ('Green Day', 'Green Day');
INSERT INTO interpret (iname, inameanz) VALUES ('Green, Al ', 'Al Green');
INSERT INTO interpret (iname, inameanz) VALUES ('Guns N\' Roses', 'Guns N\' Roses');
INSERT INTO interpret (iname, inameanz) VALUES ('Haggard, Merle ', 'Merle Haggard');
INSERT INTO interpret (iname, inameanz) VALUES ('Harrison, George ', 'George Harrison');
INSERT INTO interpret (iname, inameanz) VALUES ('Harvey, P J ', 'P J Harvey');
INSERT INTO interpret (iname, inameanz) VALUES ('Hendrix Experience, The Jimi ', 'The Jimi Hendrix Experience');
INSERT INTO interpret (iname, inameanz) VALUES ('Henley, Don ', 'Don Henley');
INSERT INTO interpret (iname, inameanz) VALUES ('Hill, Lauryn ', 'Lauryn Hill');
INSERT INTO interpret (iname, inameanz) VALUES ('Hole', 'Hole');
INSERT INTO interpret (iname, inameanz) VALUES ('Hooker, John Lee ', 'John Lee Hooker');
INSERT INTO interpret (iname, inameanz) VALUES ('Houston, Whitney ', 'Whitney Houston');
INSERT INTO interpret (iname, inameanz) VALUES ('Howlin\' Wolf', 'Howlin\' Wolf');
INSERT INTO interpret (iname, inameanz) VALUES ('Hüsker Dü', 'Hüsker Dü');
INSERT INTO interpret (iname, inameanz) VALUES ('Iggy & the Stooges', 'Iggy & the Stooges');
INSERT INTO interpret (iname, inameanz) VALUES ('Ike & Tina Turner', 'Ike & Tina Turner');
INSERT INTO interpret (iname, inameanz) VALUES ('J, LL Cool ', 'LL Cool J');
INSERT INTO interpret (iname, inameanz) VALUES ('Jackson, Janet ', 'Janet Jackson');
INSERT INTO interpret (iname, inameanz) VALUES ('Jackson, Michael ', 'Michael Jackson');
INSERT INTO interpret (iname, inameanz) VALUES ('James, Etta ', 'Etta James');
INSERT INTO interpret (iname, inameanz) VALUES ('Jane\'s Addiction', 'Jane\'s Addiction');
INSERT INTO interpret (iname, inameanz) VALUES ('Jay-Z', 'Jay-Z');
INSERT INTO interpret (iname, inameanz) VALUES ('Jefferson Airplane', 'Jefferson Airplane');
INSERT INTO interpret (iname, inameanz) VALUES ('Jesus and Mary Chain, The ', 'The Jesus and Mary Chain');
INSERT INTO interpret (iname, inameanz) VALUES ('Jethro Tull', 'Jethro Tull');
INSERT INTO interpret (iname, inameanz) VALUES ('Joel, Billy ', 'Billy Joel');
INSERT INTO interpret (iname, inameanz) VALUES ('John, Dr. ', 'Dr. John');
INSERT INTO interpret (iname, inameanz) VALUES ('John, Elton ', 'Elton John');
INSERT INTO interpret (iname, inameanz) VALUES ('Johnson, Robert ', 'Robert Johnson');
INSERT INTO interpret (iname, inameanz) VALUES ('Joplin, Janis ', 'Janis Joplin');
INSERT INTO interpret (iname, inameanz) VALUES ('Joy Division', 'Joy Division');
INSERT INTO interpret (iname, inameanz) VALUES ('King, Albert ', 'Albert King');
INSERT INTO interpret (iname, inameanz) VALUES ('King, B.B. ', 'B.B. King');
INSERT INTO interpret (iname, inameanz) VALUES ('King, Carole ', 'Carole King');
INSERT INTO interpret (iname, inameanz) VALUES ('Kinks, The ', 'The Kinks');
INSERT INTO interpret (iname, inameanz) VALUES ('Kiss', 'Kiss');
INSERT INTO interpret (iname, inameanz) VALUES ('Kraftwerk', 'Kraftwerk');
INSERT INTO interpret (iname, inameanz) VALUES ('LaBelle', 'LaBelle');
INSERT INTO interpret (iname, inameanz) VALUES ('Lauper, Cyndi ', 'Cyndi Lauper');
INSERT INTO interpret (iname, inameanz) VALUES ('LCD Soundsystem', 'LCD Soundsystem');
INSERT INTO interpret (iname, inameanz) VALUES ('Led Zeppelin', 'Led Zeppelin');
INSERT INTO interpret (iname, inameanz) VALUES ('Lennon / Plastic Ono Band, John ', 'John Lennon / Plastic Ono Band');
INSERT INTO interpret (iname, inameanz) VALUES ('Lennon, John ', 'John Lennon');
INSERT INTO interpret (iname, inameanz) VALUES ('Lewis, Jerry Lee ', 'Jerry Lee Lewis');
INSERT INTO interpret (iname, inameanz) VALUES ('Loaf, Meat ', 'Meat Loaf');
INSERT INTO interpret (iname, inameanz) VALUES ('Longhair, Professor ', 'Professor Longhair');
INSERT INTO interpret (iname, inameanz) VALUES ('Los Lobos', 'Los Lobos');
INSERT INTO interpret (iname, inameanz) VALUES ('Love', 'Love');
INSERT INTO interpret (iname, inameanz) VALUES ('Lynn, Loretta ', 'Loretta Lynn');
INSERT INTO interpret (iname, inameanz) VALUES ('Lynyrd Skynyrd', 'Lynyrd Skynyrd');
INSERT INTO interpret (iname, inameanz) VALUES ('M.I.A.', 'M.I.A.');
INSERT INTO interpret (iname, inameanz) VALUES ('Madonna', 'Madonna');
INSERT INTO interpret (iname, inameanz) VALUES ('Magnetic Fields, The ', 'The Magnetic Fields');
INSERT INTO interpret (iname, inameanz) VALUES ('Mamas and the Papas, The ', 'The Mamas and the Papas');
INSERT INTO interpret (iname, inameanz) VALUES ('Marley & the Wailers, Bob ', 'Bob Marley & the Wailers');
INSERT INTO interpret (iname, inameanz) VALUES ('Massive Attack', 'Massive Attack');
INSERT INTO interpret (iname, inameanz) VALUES ('Mayall with Eric Clapton, John ', 'John Mayall with Eric Clapton');
INSERT INTO interpret (iname, inameanz) VALUES ('Mayfield & the Impressions, Curtis ', 'Curtis Mayfield & the Impressions');
INSERT INTO interpret (iname, inameanz) VALUES ('Mayfield, Curtis ', 'Curtis Mayfield');
INSERT INTO interpret (iname, inameanz) VALUES ('MC5', 'MC5');
INSERT INTO interpret (iname, inameanz) VALUES ('McCartney & Wings, Paul ', 'Paul McCartney & Wings');
INSERT INTO interpret (iname, inameanz) VALUES ('Metallica', 'Metallica');
INSERT INTO interpret (iname, inameanz) VALUES ('Meters, The ', 'The Meters');
INSERT INTO interpret (iname, inameanz) VALUES ('MGMT', 'MGMT');
INSERT INTO interpret (iname, inameanz) VALUES ('Michael, George ', 'George Michael');
INSERT INTO interpret (iname, inameanz) VALUES ('Minutemen', 'Minutemen');
INSERT INTO interpret (iname, inameanz) VALUES ('Mitchell, Joni ', 'Joni Mitchell');
INSERT INTO interpret (iname, inameanz) VALUES ('Moby Grape', 'Moby Grape');
INSERT INTO interpret (iname, inameanz) VALUES ('Moby', 'Moby');
INSERT INTO interpret (iname, inameanz) VALUES ('Modern Lovers, The ', 'The Modern Lovers');
INSERT INTO interpret (iname, inameanz) VALUES ('Morrison, Van ', 'Van Morrison');
INSERT INTO interpret (iname, inameanz) VALUES ('Mothers of Invention, The ', 'The Mothers of Invention');
INSERT INTO interpret (iname, inameanz) VALUES ('Mott the Hoople', 'Mott the Hoople');
INSERT INTO interpret (iname, inameanz) VALUES ('My Bloody Valentine', 'My Bloody Valentine');
INSERT INTO interpret (iname, inameanz) VALUES ('My Morning Jacket', 'My Morning Jacket');
INSERT INTO interpret (iname, inameanz) VALUES ('N.W.A', 'N.W.A');
INSERT INTO interpret (iname, inameanz) VALUES ('Nas', 'Nas');
INSERT INTO interpret (iname, inameanz) VALUES ('Nelson, Willie ', 'Willie Nelson');
INSERT INTO interpret (iname, inameanz) VALUES ('New Order', 'New Order');
INSERT INTO interpret (iname, inameanz) VALUES ('New York Dolls', 'New York Dolls');
INSERT INTO interpret (iname, inameanz) VALUES ('Newman, Randy ', 'Randy Newman');
INSERT INTO interpret (iname, inameanz) VALUES ('Nine Inch Nails', 'Nine Inch Nails');
INSERT INTO interpret (iname, inameanz) VALUES ('Nirvana', 'Nirvana');
INSERT INTO interpret (iname, inameanz) VALUES ('Notorious B.I.G, The ', 'The Notorious B.I.G');
INSERT INTO interpret (iname, inameanz) VALUES ('Oasis', 'Oasis');
INSERT INTO interpret (iname, inameanz) VALUES ('O\'Connor, Sinéad ', 'Sinéad O\'Connor');
INSERT INTO interpret (iname, inameanz) VALUES ('O\'Jays', 'O\'Jays');
INSERT INTO interpret (iname, inameanz) VALUES ('OutKast', 'OutKast');
INSERT INTO interpret (iname, inameanz) VALUES ('Parliament', 'Parliament');
INSERT INTO interpret (iname, inameanz) VALUES ('Parsons, Gram ', 'Gram Parsons');
INSERT INTO interpret (iname, inameanz) VALUES ('Parton, Dolly ', 'Dolly Parton');
INSERT INTO interpret (iname, inameanz) VALUES ('Paul Butterfield, The ', 'The Paul Butterfield');
INSERT INTO interpret (iname, inameanz) VALUES ('Pavement', 'Pavement');
INSERT INTO interpret (iname, inameanz) VALUES ('Pearl Jam', 'Pearl Jam');
INSERT INTO interpret (iname, inameanz) VALUES ('Petty & the Heartbreakers, Tom ', 'Tom Petty & the Heartbreakers');
INSERT INTO interpret (iname, inameanz) VALUES ('Phair, Liz ', 'Liz Phair');
INSERT INTO interpret (iname, inameanz) VALUES ('Pink Floyd', 'Pink Floyd');
INSERT INTO interpret (iname, inameanz) VALUES ('Pixies', 'Pixies');
INSERT INTO interpret (iname, inameanz) VALUES ('Pogues, The ', 'The Pogues');
INSERT INTO interpret (iname, inameanz) VALUES ('Police, The ', 'The Police');
INSERT INTO interpret (iname, inameanz) VALUES ('Portishead', 'Portishead');
INSERT INTO interpret (iname, inameanz) VALUES ('Presley, Elvis ', 'Elvis Presley');
INSERT INTO interpret (iname, inameanz) VALUES ('Pretenders', 'Pretenders');
INSERT INTO interpret (iname, inameanz) VALUES ('Prince and The Revolution', 'Prince and The Revolution');
INSERT INTO interpret (iname, inameanz) VALUES ('Prince', 'Prince');
INSERT INTO interpret (iname, inameanz) VALUES ('Prine, John ', 'John Prine');
INSERT INTO interpret (iname, inameanz) VALUES ('Public Enemy', 'Public Enemy');
INSERT INTO interpret (iname, inameanz) VALUES ('Public Image Ltd.', 'Public Image Ltd.');
INSERT INTO interpret (iname, inameanz) VALUES ('Queen', 'Queen');
INSERT INTO interpret (iname, inameanz) VALUES ('Quicksilver Messenger Service', 'Quicksilver Messenger Service');
INSERT INTO interpret (iname, inameanz) VALUES ('R.E.M.', 'R.E.M.');
INSERT INTO interpret (iname, inameanz) VALUES ('Radiohead', 'Radiohead');
INSERT INTO interpret (iname, inameanz) VALUES ('Raekwon, Chef ', 'Chef Raekwon');
INSERT INTO interpret (iname, inameanz) VALUES ('Rage Against the Machine', 'Rage Against the Machine');
INSERT INTO interpret (iname, inameanz) VALUES ('Raitt, Bonnie ', 'Bonnie Raitt');
INSERT INTO interpret (iname, inameanz) VALUES ('Ramones', 'Ramones');
INSERT INTO interpret (iname, inameanz) VALUES ('Red Hot Chili Peppers', 'Red Hot Chili Peppers');
INSERT INTO interpret (iname, inameanz) VALUES ('Redding, Otis ', 'Otis Redding');
INSERT INTO interpret (iname, inameanz) VALUES ('Reed, Lou ', 'Lou Reed');
INSERT INTO interpret (iname, inameanz) VALUES ('Replacements, The ', 'The Replacements');
INSERT INTO interpret (iname, inameanz) VALUES ('Richard & Linda Thompson', 'Richard & Linda Thompson');
INSERT INTO interpret (iname, inameanz) VALUES ('Richard, Little ', 'Little Richard');
INSERT INTO interpret (iname, inameanz) VALUES ('Rolling Stones, The ', 'The Rolling Stones');
INSERT INTO interpret (iname, inameanz) VALUES ('Ronettes featuring Veronica, The ', 'The Ronettes featuring Veronica');
INSERT INTO interpret (iname, inameanz) VALUES ('Ronstadt, Linda ', 'Linda Ronstadt');
INSERT INTO interpret (iname, inameanz) VALUES ('Roxy Music', 'Roxy Music');
INSERT INTO interpret (iname, inameanz) VALUES ('Run-D.M.C.', 'Run-D.M.C.');
INSERT INTO interpret (iname, inameanz) VALUES ('Rundgren, Todd ', 'Todd Rundgren');
INSERT INTO interpret (iname, inameanz) VALUES ('Santana', 'Santana');
INSERT INTO interpret (iname, inameanz) VALUES ('Scaggs, Boz ', 'Boz Scaggs');
INSERT INTO interpret (iname, inameanz) VALUES ('Sex Pistols', 'Sex Pistols');
INSERT INTO interpret (iname, inameanz) VALUES ('Simon & Garfunkel', 'Simon & Garfunkel');
INSERT INTO interpret (iname, inameanz) VALUES ('Simon, Paul ', 'Paul Simon');
INSERT INTO interpret (iname, inameanz) VALUES ('Sinatra, Frank ', 'Frank Sinatra');
INSERT INTO interpret (iname, inameanz) VALUES ('Sleater-Kinney', 'Sleater-Kinney');
INSERT INTO interpret (iname, inameanz) VALUES ('Sly & the Family Stone', 'Sly & the Family Stone');
INSERT INTO interpret (iname, inameanz) VALUES ('Smashing Pumpkins', 'Smashing Pumpkins');
INSERT INTO interpret (iname, inameanz) VALUES ('Smith, Patti ', 'Patti Smith');
INSERT INTO interpret (iname, inameanz) VALUES ('Smiths, The ', 'The Smiths');
INSERT INTO interpret (iname, inameanz) VALUES ('Smokey Robinson & the Miracles', 'Smokey Robinson & the Miracles');
INSERT INTO interpret (iname, inameanz) VALUES ('Sonic Youth', 'Sonic Youth');
INSERT INTO interpret (iname, inameanz) VALUES ('Soundgarden', 'Soundgarden');
INSERT INTO interpret (iname, inameanz) VALUES ('Spector, Phil ', 'Phil Spector');
INSERT INTO interpret (iname, inameanz) VALUES ('Springfield, Dusty ', 'Dusty Springfield');
INSERT INTO interpret (iname, inameanz) VALUES ('Springsteen, Bruce ', 'Bruce Springsteen');
INSERT INTO interpret (iname, inameanz) VALUES ('Steely Dan', 'Steely Dan');
INSERT INTO interpret (iname, inameanz) VALUES ('Steve Miller Band', 'Steve Miller Band');
INSERT INTO interpret (iname, inameanz) VALUES ('Stevens, Cat ', 'Cat Stevens');
INSERT INTO interpret (iname, inameanz) VALUES ('Stewart, Rod ', 'Rod Stewart');
INSERT INTO interpret (iname, inameanz) VALUES ('Stone Roses, The ', 'The Stone Roses');
INSERT INTO interpret (iname, inameanz) VALUES ('Stooges, The ', 'The Stooges');
INSERT INTO interpret (iname, inameanz) VALUES ('Strokes, The ', 'The Strokes');
INSERT INTO interpret (iname, inameanz) VALUES ('Suicide', 'Suicide');
INSERT INTO interpret (iname, inameanz) VALUES ('T. Rex', 'T. Rex');
INSERT INTO interpret (iname, inameanz) VALUES ('Talking Heads', 'Talking Heads');
INSERT INTO interpret (iname, inameanz) VALUES ('Taylor, James ', 'James Taylor');
INSERT INTO interpret (iname, inameanz) VALUES ('Television', 'Television');
INSERT INTO interpret (iname, inameanz) VALUES ('Temptations, The ', 'The Temptations');
INSERT INTO interpret (iname, inameanz) VALUES ('TLC', 'TLC');
INSERT INTO interpret (iname, inameanz) VALUES ('Toots & the Maytals', 'Toots & the Maytals');
INSERT INTO interpret (iname, inameanz) VALUES ('U2', 'U2');
INSERT INTO interpret (iname, inameanz) VALUES ('Vampire Weekend', 'Vampire Weekend');
INSERT INTO interpret (iname, inameanz) VALUES ('Van Halen', 'Van Halen');
INSERT INTO interpret (iname, inameanz) VALUES ('Various Artists', 'Various Artists');
INSERT INTO interpret (iname, inameanz) VALUES ('Velvet Underground & Nico, The ', 'The Velvet Underground & Nico');
INSERT INTO interpret (iname, inameanz) VALUES ('Velvet Underground, The ', 'The Velvet Underground');
INSERT INTO interpret (iname, inameanz) VALUES ('Wailers, The ', 'The Wailers');
INSERT INTO interpret (iname, inameanz) VALUES ('Waits, Tom ', 'Tom Waits');
INSERT INTO interpret (iname, inameanz) VALUES ('Walter, Little ', 'Little Walter');
INSERT INTO interpret (iname, inameanz) VALUES ('War', 'War');
INSERT INTO interpret (iname, inameanz) VALUES ('Waters, Muddy ', 'Muddy Waters');
INSERT INTO interpret (iname, inameanz) VALUES ('Wayne, Lil’ ', 'Lil’ Wayne');
INSERT INTO interpret (iname, inameanz) VALUES ('Weezer', 'Weezer');
INSERT INTO interpret (iname, inameanz) VALUES ('West, Kanye ', 'Kanye West');
INSERT INTO interpret (iname, inameanz) VALUES ('White Stripes, The ', 'The White Stripes');
INSERT INTO interpret (iname, inameanz) VALUES ('White, Barry ', 'Barry White');
INSERT INTO interpret (iname, inameanz) VALUES ('Who, The ', 'The Who');
INSERT INTO interpret (iname, inameanz) VALUES ('Wilco', 'Wilco');
INSERT INTO interpret (iname, inameanz) VALUES ('Williams, Hank ', 'Hank Williams');
INSERT INTO interpret (iname, inameanz) VALUES ('Williams, Lucinda ', 'Lucinda Williams');
INSERT INTO interpret (iname, inameanz) VALUES ('Wilson, Jackie ', 'Jackie Wilson');
INSERT INTO interpret (iname, inameanz) VALUES ('Winehouse, Amy ', 'Amy Winehouse');
INSERT INTO interpret (iname, inameanz) VALUES ('Wire', 'Wire');
INSERT INTO interpret (iname, inameanz) VALUES ('Wolf, Peter ', 'Peter Wolf');
INSERT INTO interpret (iname, inameanz) VALUES ('Wonder, Stevie ', 'Stevie Wonder');
INSERT INTO interpret (iname, inameanz) VALUES ('Wu-Tang Clan', 'Wu-Tang Clan');
INSERT INTO interpret (iname, inameanz) VALUES ('X', 'X');
INSERT INTO interpret (iname, inameanz) VALUES ('Yardbirds, The ', 'The Yardbirds');
INSERT INTO interpret (iname, inameanz) VALUES ('Young & Crazy Horse, Neil ', 'Neil Young & Crazy Horse');
INSERT INTO interpret (iname, inameanz) VALUES ('Young, Neil ', 'Neil Young');
INSERT INTO interpret (iname, inameanz) VALUES ('Zombies, The ', 'The Zombies');
INSERT INTO interpret (iname, inameanz) VALUES ('ZZ Top', 'ZZ Top');

-- 100 Interpreten von MARM
INSERT INTO interpret (iname, inameanz) VALUES ('10cc', '10cc');
INSERT INTO interpret (iname, inameanz) VALUES ('Adams, Bryan', 'Bryan Adams');
INSERT INTO interpret (iname, inameanz) VALUES ('Adele', 'Adele');
INSERT INTO interpret (iname, inameanz) VALUES ('a-ha', 'a-ha');
INSERT INTO interpret (iname, inameanz) VALUES ('Alan Parsons Project, The', 'The Alan Parsons Project');
INSERT INTO interpret (iname, inameanz) VALUES ('Ambros, Wolfgang', 'Wolfgang Ambros');
INSERT INTO interpret (iname, inameanz) VALUES ('Anastacia', 'Anastacia');
INSERT INTO interpret (iname, inameanz) VALUES ('Andersson, Benny', 'Benny Andersson');
INSERT INTO interpret (iname, inameanz) VALUES ('Baez, Joan', 'Joan Baez');
INSERT INTO interpret (iname, inameanz) VALUES ('Bee Gees', 'Bee Gees');
INSERT INTO interpret (iname, inameanz) VALUES ('Bon Jovi', 'Bon Jovi');
INSERT INTO interpret (iname, inameanz) VALUES ('Boney M.', 'Boney M.');
INSERT INTO interpret (iname, inameanz) VALUES ('Boston', 'Boston');
INSERT INTO interpret (iname, inameanz) VALUES ('Bronsky Beat', 'Bronsky Beat');
INSERT INTO interpret (iname, inameanz) VALUES ('Bush, Kate', 'Kate Bush');
INSERT INTO interpret (iname, inameanz) VALUES ('Carey, Mariah', 'Mariah Carey');
INSERT INTO interpret (iname, inameanz) VALUES ('Cave, Nick', 'Nick Cave');
INSERT INTO interpret (iname, inameanz) VALUES ('Cher', 'Cher');
INSERT INTO interpret (iname, inameanz) VALUES ('Chic', 'Chic');
INSERT INTO interpret (iname, inameanz) VALUES ('Chicago', 'Chicago');
INSERT INTO interpret (iname, inameanz) VALUES ('Cocker, Joe', 'Joe Cocker');
INSERT INTO interpret (iname, inameanz) VALUES ('Danzer, Georg', 'Georg Danzer');
INSERT INTO interpret (iname, inameanz) VALUES ('D\'Arby, Terence Trent', 'Terence Trent D\'Arby');
INSERT INTO interpret (iname, inameanz) VALUES ('ELO', 'ELO');
INSERT INTO interpret (iname, inameanz) VALUES ('Falco', 'Falco');
INSERT INTO interpret (iname, inameanz) VALUES ('Faltskog, Agnetha', 'Agnetha Faltskog');
INSERT INTO interpret (iname, inameanz) VALUES ('Fendrich, Rainhard', 'Rainhard Fendrich');
INSERT INTO interpret (iname, inameanz) VALUES ('Ferry, Bryan', 'Bryan Ferry');
INSERT INTO interpret (iname, inameanz) VALUES ('Flash & the Pan', 'Flash & the Pan');
INSERT INTO interpret (iname, inameanz) VALUES ('Frankie Goes To Hollywood', 'Frankie Goes To Hollywood');
INSERT INTO interpret (iname, inameanz) VALUES ('Frida', 'Frida');
INSERT INTO interpret (iname, inameanz) VALUES ('Furtado, Nelly', 'Nelly Furtado');
INSERT INTO interpret (iname, inameanz) VALUES ('Gaga, Lady', 'Lady Gaga');
INSERT INTO interpret (iname, inameanz) VALUES ('Garrett, David', 'David Garrett');
INSERT INTO interpret (iname, inameanz) VALUES ('Gaynor, Gloria', 'Gloria Gaynor');
INSERT INTO interpret (iname, inameanz) VALUES ('Genesis', 'Genesis');
INSERT INTO interpret (iname, inameanz) VALUES ('Grönemeyer, Herbert', 'Herbert Grönemeyer');
INSERT INTO interpret (iname, inameanz) VALUES ('Hayes, Isaac', 'Isaac Hayes');
INSERT INTO interpret (iname, inameanz) VALUES ('Hot Chocolate', 'Hot Chocolate');
INSERT INTO interpret (iname, inameanz) VALUES ('Idol, Billy', 'Billy Idol');
INSERT INTO interpret (iname, inameanz) VALUES ('Jarre, Jean-Michel', 'Jean-Michel Jarre');
INSERT INTO interpret (iname, inameanz) VALUES ('Jones, Quincy', 'Quincy Jones');
INSERT INTO interpret (iname, inameanz) VALUES ('Jackson, Millie', 'Millie Jackson');
INSERT INTO interpret (iname, inameanz) VALUES ('KC & the Sunshine Band', 'KC & the Sunshine Band');
INSERT INTO interpret (iname, inameanz) VALUES ('King Crimson', 'King Crimson');
INSERT INTO interpret (iname, inameanz) VALUES ('Knight, Gladys & the Pips', 'Gladys & the Pips Knight');
INSERT INTO interpret (iname, inameanz) VALUES ('Lafee', 'Lafee');
INSERT INTO interpret (iname, inameanz) VALUES ('Lavigne, Avril', 'Avril Lavigne');
INSERT INTO interpret (iname, inameanz) VALUES ('Lear, Amanda', 'Amanda Lear');
INSERT INTO interpret (iname, inameanz) VALUES ('Linkin Park', 'Linkin Park');
INSERT INTO interpret (iname, inameanz) VALUES ('Love Unlimited', 'Love Unlimited');
INSERT INTO interpret (iname, inameanz) VALUES ('Manfred Mann\'s Earth Band', 'Manfred Mann\'s Earth Band');
INSERT INTO interpret (iname, inameanz) VALUES ('Matt Bianco', 'Matt Bianco');
INSERT INTO interpret (iname, inameanz) VALUES ('McCoy, Van', 'Van McCoy');
INSERT INTO interpret (iname, inameanz) VALUES ('Nannini, Gianna', 'Gianna Nannini');
INSERT INTO interpret (iname, inameanz) VALUES ('Newton-John, Olivia', 'Olivia Newton-John');
INSERT INTO interpret (iname, inameanz) VALUES ('Oldfield, Mike', 'Mike Oldfield');
INSERT INTO interpret (iname, inameanz) VALUES ('Pet Shop Boys', 'Pet Shop Boys');
INSERT INTO interpret (iname, inameanz) VALUES ('Quatro, Suzi', 'Suzi Quatro');
INSERT INTO interpret (iname, inameanz) VALUES ('Ross, Diana', 'Diana Ross');
INSERT INTO interpret (iname, inameanz) VALUES ('Rubettes, The', 'The Rubettes');
INSERT INTO interpret (iname, inameanz) VALUES ('Sade', 'Sade');
INSERT INTO interpret (iname, inameanz) VALUES ('Silver Convention', 'Silver Convention');
INSERT INTO interpret (iname, inameanz) VALUES ('Simple Minds', 'Simple Minds');
INSERT INTO interpret (iname, inameanz) VALUES ('Simply Red', 'Simply Red');
INSERT INTO interpret (iname, inameanz) VALUES ('Sinatra, Nancy', 'Nancy Sinatra');
INSERT INTO interpret (iname, inameanz) VALUES ('Sister Sledge', 'Sister Sledge');
INSERT INTO interpret (iname, inameanz) VALUES ('Smokie', 'Smokie');
INSERT INTO interpret (iname, inameanz) VALUES ('Stansfield, Lisa', 'Lisa Stansfield');
INSERT INTO interpret (iname, inameanz) VALUES ('Starr, Ringo', 'Ringo Starr');
INSERT INTO interpret (iname, inameanz) VALUES ('Sting', 'Sting');
INSERT INTO interpret (iname, inameanz) VALUES ('Streisand, Barbra', 'Barbra Streisand');
INSERT INTO interpret (iname, inameanz) VALUES ('Summer, Donna', 'Donna Summer');
INSERT INTO interpret (iname, inameanz) VALUES ('Supermax', 'Supermax');
INSERT INTO interpret (iname, inameanz) VALUES ('Supertramp', 'Supertramp');
INSERT INTO interpret (iname, inameanz) VALUES ('Supremes, The', 'The Supremes');
INSERT INTO interpret (iname, inameanz) VALUES ('Sweet, The', 'The Sweet');
INSERT INTO interpret (iname, inameanz) VALUES ('Talk Talk', 'Talk Talk');
INSERT INTO interpret (iname, inameanz) VALUES ('Tears For Fears', 'Tears For Fears');
INSERT INTO interpret (iname, inameanz) VALUES ('Three Degrees, The', 'The Three Degrees');
INSERT INTO interpret (iname, inameanz) VALUES ('Tikaram, Tanita', 'Tanita Tikaram');
INSERT INTO interpret (iname, inameanz) VALUES ('Tomita', 'Tomita');
INSERT INTO interpret (iname, inameanz) VALUES ('Turner, Tina', 'Tina Turner');
INSERT INTO interpret (iname, inameanz) VALUES ('Vangelis', 'Vangelis');
INSERT INTO interpret (iname, inameanz) VALUES ('Various Artists - Hair - Original Soundtrack Recording', 'Various Artists - Hair - Original Soundtrack Recording');
INSERT INTO interpret (iname, inameanz) VALUES ('Various Artists - Star Wars - A New Hope - The Original Motion Picture Soundtrack', 'Various Artists - Star Wars - A New Hope - The Original Motion Picture Soundtrack');
INSERT INTO interpret (iname, inameanz) VALUES ('Various Artists - Star Trek - The Motion Picture - Original Soundtrack', 'Various Artists - Star Trek - The Motion Picture - Original Soundtrack');
INSERT INTO interpret (iname, inameanz) VALUES ('Various Artists - The Pink Panther - Henry Manchini and His Orchestra', 'Various Artists - The Pink Panther - Henry Manchini and His Orchestra');
INSERT INTO interpret (iname, inameanz) VALUES ('Various Artists - Miami Vice - Music from the Television Series', 'Various Artists - Miami Vice - Music from the Television Series');
INSERT INTO interpret (iname, inameanz) VALUES ('Various Artists - Raiders of the Lost Ark - Original Motion Picture Soundtrack', 'Various Artists - Raiders of the Lost Ark - Original Motion Picture Soundtrack');
INSERT INTO interpret (iname, inameanz) VALUES ('Various Artists - Best of Bond… James Bond - 50 Years / 50 Tracks', 'Various Artists - Best of Bond… James Bond - 50 Years / 50 Tracks');
INSERT INTO interpret (iname, inameanz) VALUES ('Various Artists - The Danny Elfman Batman Collection', 'Various Artists - The Danny Elfman Batman Collection');
INSERT INTO interpret (iname, inameanz) VALUES ('Various Artists - Casino Royale - Original MGM Motion Picture Soundtrack', 'Various Artists - Casino Royale - Original MGM Motion Picture Soundtrack');
INSERT INTO interpret (iname, inameanz) VALUES ('Various Artists - The Disco Years - Turn The Beat Around', 'Various Artists - The Disco Years - Turn The Beat Around');
INSERT INTO interpret (iname, inameanz) VALUES ('Various Artists - The Disco Years - On The Beat', 'Various Artists - The Disco Years - On The Beat');
INSERT INTO interpret (iname, inameanz) VALUES ('Various Artists - The Disco Years - Boogie Fever', 'Various Artists - The Disco Years - Boogie Fever');
INSERT INTO interpret (iname, inameanz) VALUES ('Warwick, Dionne', 'Dionne Warwick');
INSERT INTO interpret (iname, inameanz) VALUES ('Waters, Roger', 'Roger Waters');
INSERT INTO interpret (iname, inameanz) VALUES ('Williams, Robbie', 'Robbie Williams');
INSERT INTO interpret (iname, inameanz) VALUES ('Wir sind Helden', 'Wir sind Helden');

-- Die 500 Alben
INSERT INTO album (aid, atitel, iname, rang500) VALUES (1, 'Sgt. Pepper\'s Lonely Hearts Club Band', 'Beatles, The ', 1);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (2, 'Pet Sounds', 'Beach Boys, The ', 2);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (3, 'Revolver', 'Beatles, The ', 3);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (4, 'Highway 61 Revisited', 'Dylan, Bob ', 4);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (5, 'Rubber Soul', 'Beatles, The ', 5);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (6, 'What\'s Going On', 'Gaye, Marvin ', 6);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (7, 'Exile on Main St.', 'Rolling Stones, The ', 7);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (8, 'London Calling', 'Clash, The ', 8);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (9, 'Blonde on Blonde', 'Dylan, Bob ', 9);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (10, 'The Beatles', 'Beatles, The ', 10);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (11, 'The Sun Sessions', 'Presley, Elvis ', 11);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (12, 'Kind of Blue', 'Davis, Miles ', 12);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (13, 'The Velvet Underground & Nico', 'Velvet Underground & Nico, The ', 13);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (14, 'Abbey Road', 'Beatles, The ', 14);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (15, 'Are You Experienced', 'Hendrix Experience, The Jimi ', 15);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (16, 'Blood on The Tracks', 'Dylan, Bob ', 16);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (17, 'Nevermind', 'Nirvana', 17);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (18, 'Born To Run', 'Springsteen, Bruce ', 18);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (19, 'Astral Weeks', 'Morrison, Van ', 19);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (20, 'Thriller', 'Jackson, Michael ', 20);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (21, 'The Great Twenty-Eight', 'Berry, Chuck ', 21);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (22, 'The Complete Recordings', 'Johnson, Robert ', 22);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (23, 'John Lennon / Plastic Ono Band', 'Lennon / Plastic Ono Band, John ', 23);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (24, 'Innervisions', 'Wonder, Stevie ', 24);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (25, 'James Brown Live at the Apollo', 'Brown, James ', 25);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (26, 'Rumours', 'Fleetwood Mac', 26);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (27, 'The Joshua Tree', 'U2', 27);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (28, 'Who\'s Next', 'Who, The ', 28);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (29, 'Led Zeppelin', 'Led Zeppelin', 29);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (30, 'Blue', 'Mitchell, Joni ', 30);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (31, 'Bringing It All Back Home', 'Dylan, Bob ', 31);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (32, 'Let It Bleed', 'Rolling Stones, The ', 32);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (33, 'Ramones', 'Ramones', 33);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (34, 'Music From Big Pink', 'Band, The ', 34);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (35, 'The Rise And Fall Of Ziggy Stardust And The Spiders From Mars', 'Bowie, David ', 35);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (36, 'Tapestry', 'King, Carole ', 36);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (37, 'Hotel California', 'Eagles', 37);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (38, 'The Anthology (1947-1972)', 'Waters, Muddy ', 38);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (39, 'Please Please Me', 'Beatles, The ', 39);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (40, 'Forever Changes', 'Love', 40);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (41, 'Never Mind the Bollocks Here\'s the Sex Pistols', 'Sex Pistols', 41);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (42, 'The Doors', 'Doors, The ', 42);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (43, 'The Dark Side Of The Moon', 'Pink Floyd', 43);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (44, 'Horses', 'Smith, Patti ', 44);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (45, 'The Band', 'Band, The ', 45);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (46, 'Legend - The Best Of Bob Marley And The Wailers', 'Marley & the Wailers, Bob ', 46);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (47, 'A Love Supreme', 'Coltrane, John ', 47);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (48, 'It Takes a Nation of Millions To Hold Us Back', 'Public Enemy', 48);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (49, 'The Allman Brothers Band At Fillmore East', 'Allman Brothers Band, The ', 49);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (50, 'Here\'s Little Richard', 'Richard, Little ', 50);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (51, 'Bridge Over Troubled Water', 'Simon & Garfunkel', 51);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (52, 'Greatest Hits', 'Green, Al ', 52);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (53, 'Meet The Beatles!', 'Beatles, The ', 53);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (54, 'The Birth of Soul: The Complete Atlantic Rhythm & Blues Recordings 1952-1959', 'Charles, Ray ', 54);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (55, 'Electric Ladyland', 'Hendrix Experience, The Jimi ', 55);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (56, 'Elvis Presley', 'Presley, Elvis ', 56);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (57, 'Songs in The Key Of Life', 'Wonder, Stevie ', 57);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (58, 'Beggars Banquet', 'Rolling Stones, The ', 58);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (59, 'Chronicle - The 20 Greatest Hits', 'Creedence Clearwater Revival', 59);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (60, 'Trout Mask Replica', 'Captain Beefheart & His Magic Band', 60);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (61, 'Greatest Hits', 'Sly & the Family Stone', 61);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (62, 'Appetite For Destruction', 'Guns N\' Roses', 62);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (63, 'Achtung Baby', 'U2', 63);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (64, 'Sticky Fingers', 'Rolling Stones, The ', 64);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (65, 'Back To Mono (1958-1969)', 'Spector, Phil ', 65);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (66, 'Moondance', 'Morrison, Van ', 66);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (67, 'Kid A', 'Radiohead', 67);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (68, 'Off The Wall', 'Jackson, Michael ', 68);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (69, 'Led Zeppelin IV', 'Led Zeppelin', 69);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (70, 'The Stranger', 'Joel, Billy ', 70);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (71, 'Graceland', 'Simon, Paul ', 71);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (72, 'Super Fly', 'Mayfield, Curtis ', 72);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (73, 'Physical Graffiti', 'Led Zeppelin', 73);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (74, 'After the Gold Rush', 'Young, Neil ', 74);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (75, 'Star Time', 'Brown, James ', 75);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (76, 'Purple Rain', 'Prince and The Revolution', 76);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (77, 'Back In Black', 'AC/DC', 77);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (78, 'Otis Blue / Otis Redding Sings Soul', 'Redding, Otis ', 78);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (79, 'Led Zeppelin II', 'Led Zeppelin', 79);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (80, 'Imagine', 'Lennon, John ', 80);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (81, 'The Clash', 'Clash, The ', 81);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (82, 'Harvest', 'Young, Neil ', 82);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (83, 'Axis: Bold As Love', 'Hendrix Experience, The Jimi ', 83);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (84, 'I Never Loved A Man The Way I Loved You', 'Franklin, Aretha ', 84);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (85, 'Lady Soul', 'Franklin, Aretha ', 85);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (86, 'Born in the U.S.A.', 'Springsteen, Bruce ', 86);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (87, 'The Wall', 'Pink Floyd', 87);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (88, 'At Folsom Prison', 'Cash, Johnny ', 88);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (89, 'Dusty In Memphis', 'Springfield, Dusty ', 89);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (90, 'Talking Book', 'Wonder, Stevie ', 90);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (91, 'Goodbye Yellow Brick Road', 'John, Elton ', 91);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (92, '20 Golden Greats', 'Buddy Holly & the Crickets', 92);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (93, 'Sign "O" The Times', 'Prince', 93);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (94, 'Hank Williams - 40 Greatest Hits', 'Williams, Hank ', 94);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (95, 'B***es Brew', 'Davis, Miles ', 95);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (96, 'Tommy', 'Who, The ', 96);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (97, 'The Freewheelin\' Bob Dylan', 'Dylan, Bob ', 97);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (98, 'This Year\'s Model', 'Costello, Elvis ', 98);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (99, 'There\'s a Riot Goin\' On', 'Sly & the Family Stone', 99);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (100, 'Odyssey And Oracle', 'Zombies, The ', 100);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (101, 'In the Wee Small Hours', 'Sinatra, Frank ', 101);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (102, 'Fresh Cream', 'Cream', 102);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (103, 'Giant Steps', 'Coltrane, John ', 103);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (104, 'Sweet Baby James', 'Taylor, James ', 104);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (105, 'Modern Sounds in Country And Western Music', 'Charles, Ray ', 105);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (106, 'Rocket to Russia', 'Ramones', 106);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (107, 'Portrait Of A Legend 1951-1964', 'Cooke, Sam ', 107);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (108, 'Hunky Dory', 'Bowie, David ', 108);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (109, 'Aftermath', 'Rolling Stones, The ', 109);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (110, 'Loaded', 'Velvet Underground, The ', 110);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (111, 'The Bends', 'Radiohead', 111);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (112, 'If You Can Believe Your Eyes And Ears', 'Mamas and the Papas, The ', 112);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (113, 'Court and Spark', 'Mitchell, Joni ', 113);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (114, 'Disraeli Gears', 'Cream', 114);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (115, 'The Who Sell Out', 'Who, The ', 115);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (116, 'Out Of Our Heads', 'Rolling Stones, The ', 116);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (117, 'Layla And Other Assorted Love Songs', 'Derek & the Dominos', 117);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (118, 'Late Registration', 'West, Kanye ', 118);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (119, 'At Last!', 'James, Etta ', 119);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (120, 'Sweetheart of the Rodeo', 'Byrds, The ', 120);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (121, 'Stand!', 'Sly & the Family Stone', 121);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (122, 'The Harder They Come (Original Soundtrack Recording)', 'Various Artists', 122);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (123, 'Raising Hell', 'Run-D.M.C.', 123);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (124, 'Moby Grape', 'Moby Grape', 124);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (125, 'Pearl', 'Joplin, Janis ', 125);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (126, 'Catch a Fire', 'Wailers, The ', 126);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (127, 'Younger than Yesterday', 'Byrds, The ', 127);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (128, 'Raw Power', 'Iggy & the Stooges', 128);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (129, 'Remain In Light', 'Talking Heads', 129);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (130, 'Marquee Moon', 'Television', 130);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (131, 'Paranoid', 'Black Sabbath', 131);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (132, 'Saturday Night Fever (The Original Movie Sound Track)', 'Various Artists', 132);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (133, 'The Wild, the Innocent & the E Street Shuffle', 'Springsteen, Bruce ', 133);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (134, 'Ready to Die', 'Notorious B.I.G, The ', 134);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (135, 'Slanted and Enchanted', 'Pavement', 135);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (136, 'Greatest Hits', 'John, Elton ', 136);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (137, 'Tim', 'Replacements, The ', 137);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (138, 'The Chronic', 'Dre, Dr. ', 138);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (139, 'Rejuvenation', 'Meters, The ', 139);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (140, 'Parallel Lines', 'Blondie', 140);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (141, 'Live at the Regal', 'King, B.B. ', 141);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (142, 'Phil Spector\'s Christmas Album', 'Spector, Phil ', 142);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (143, 'Gris-Gris', 'John, Dr. ', 143);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (144, 'Straight Outta Compton', 'N.W.A', 144);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (145, 'Aja', 'Steely Dan', 145);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (146, 'Surrealistic Pillow', 'Jefferson Airplane', 146);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (147, 'Déjà Vu', 'Crosby, Stills, Nash & Young', 147);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (148, 'Houses Of The Holy', 'Led Zeppelin', 148);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (149, 'Santana', 'Santana', 149);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (150, 'Darkness on the Edge of Town', 'Springsteen, Bruce ', 150);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (151, 'Fire Funeral', 'Arcade', 151);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (152, 'The B-52\'s', 'B-52\'s, The ', 152);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (153, 'The Low End Theory', 'A Tribe Called Quest', 153);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (154, 'Moanin\' in the Moonlight', 'Howlin\' Wolf', 154);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (155, 'Pretenders', 'Pretenders', 155);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (156, 'Paul\'s Boutique', 'Beastie Boys', 156);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (157, 'Closer', 'Joy Division', 157);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (158, 'Captain Fantastic and the Brown Dirt Cowboy', 'John, Elton ', 158);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (159, 'Alive!', 'Kiss', 159);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (160, 'Electric Warrior', 'T. Rex', 160);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (161, 'The Dock of the Bay', 'Redding, Otis ', 161);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (162, 'OK Computer', 'Radiohead', 162);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (163, '1999', 'Prince', 163);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (164, 'The Very Best of Linda Ronstadt', 'Ronstadt, Linda ', 164);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (165, 'Let\'s Get It On', 'Gaye, Marvin ', 165);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (166, 'Imperial Bedroom', 'Costello & the Attractions, Elvis ', 166);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (167, 'Master of Puppets', 'Metallica', 167);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (168, 'My Aim Is True', 'Costello, Elvis ', 168);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (169, 'Exodus', 'Marley & the Wailers, Bob ', 169);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (170, 'Live at Leeds', 'Who, The ', 170);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (171, 'The Notorious Byrd Brothers', 'Byrds, The ', 171);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (172, 'Every Picture Tells A Story', 'Stewart, Rod ', 172);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (173, 'Something / Anything?', 'Rundgren, Todd ', 173);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (174, 'Desire', 'Dylan, Bob ', 174);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (175, 'Close to You', 'Carpenters', 175);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (176, 'Rocks', 'Aerosmith', 176);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (177, 'One Nation under a Groove', 'Funkadelic', 177);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (178, 'The Anthology 1961-1977', 'Mayfield & the Impressions, Curtis ', 178);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (179, 'The Definitive Collection', 'ABBA', 179);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (180, 'The Rolling Stones, Now!', 'Rolling Stones, The ', 180);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (181, 'Natty Dread', 'Marley & the Wailers, Bob ', 181);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (182, 'Fleetwood Mac', 'Fleetwood Mac', 182);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (183, 'Red Headed Stranger', 'Nelson, Willie ', 183);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (184, 'The Immaculate Collection', 'Madonna', 184);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (185, 'The Stooges', 'Stooges, The ', 185);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (186, 'Fresh', 'Sly & the Family Stone', 186);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (187, 'So', 'Gabriel, Peter ', 187);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (188, 'Buffalo Springfield Again', 'Buffalo Springfield', 188);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (189, 'Happy Trails', 'Quicksilver Messenger Service', 189);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (190, 'From Elvis in Memphis', 'Presley, Elvis ', 190);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (191, 'Fun House', 'Stooges, The ', 191);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (192, 'The Gilded Palace of Sin', 'Flying Burrito Bros, The ', 192);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (193, 'Dookie', 'Green Day', 193);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (194, 'Transformer', 'Reed, Lou ', 194);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (195, 'Blues Breakers', 'Mayall with Eric Clapton, John ', 195);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (196, 'Nuggets: Original Artyfacts from the First Psychedelic Era 1965-1968', 'Various Artists', 196);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (197, 'Murmur', 'R.E.M.', 197);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (198, 'The Best of Little Walter', 'Walter, Little ', 198);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (199, 'Is This It', 'Strokes, The ', 199);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (200, 'Highway to Hell', 'AC/DC', 200);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (201, 'The Downward Spiral', 'Nine Inch Nails', 201);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (202, 'Parsley, Sage, Rosemary and Thyme', 'Simon & Garfunkel', 202);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (203, 'Bad', 'Jackson, Michael ', 203);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (204, 'Modern Times', 'Dylan, Bob ', 204);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (205, 'Wheels of Fire', 'Cream', 205);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (206, 'Dirty Mind', 'Prince', 206);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (207, 'Abraxas', 'Santana', 207);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (208, 'Tea for the Tillerman', 'Stevens, Cat ', 208);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (209, 'Ten', 'Pearl Jam', 209);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (210, 'Everybody Knows This is Nowhere', 'Young & Crazy Horse, Neil ', 210);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (211, 'Wish You Were Here', 'Pink Floyd', 211);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (212, 'Crooked Rain, Crooked Rain', 'Pavement', 212);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (213, 'Tattoo You', 'Rolling Stones, The ', 213);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (214, 'Proud Mary: The Best Of Ike And Tina Turner', 'Ike & Tina Turner', 214);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (215, 'New York Dolls', 'New York Dolls', 215);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (216, 'Go Bo Diddley', 'Diddley, Bo ', 216);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (217, 'Two Steps from the Blues', 'Bland, Bobby ', 217);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (218, 'The Queen is Dead', 'Smiths, The ', 218);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (219, 'Licensed to Ill', 'Beastie Boys', 219);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (220, 'Look-Ka Py Py', 'Meters, The ', 220);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (221, 'Loveless', 'My Bloody Valentine', 221);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (222, 'New Orleans Piano', 'Longhair, Professor ', 222);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (223, 'War', 'U2', 223);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (224, 'The Neil Diamond Collection', 'Diamond, Neil ', 224);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (225, 'American Idiot', 'Green Day', 225);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (226, 'Nebraska', 'Springsteen, Bruce ', 226);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (227, 'Doolittle', 'Pixies', 227);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (228, 'Paid in Full', 'B. & Rakim, Eric ', 228);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (229, 'Toys in the Attic', 'Aerosmith', 229);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (230, 'Nick of Time', 'Raitt, Bonnie ', 230);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (231, 'A Night at the Opera', 'Queen', 231);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (232, 'The Kink Kronikles', 'Kinks, The ', 232);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (233, 'Mr. Tambourine Man', 'Byrds, The ', 233);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (234, 'Bookends', 'Simon & Garfunkel', 234);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (235, 'The Ultimate Collection', 'Cline, Patsy ', 235);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (236, 'The Classic Jackie Wilson', 'Wilson, Jackie ', 236);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (237, 'My Generation', 'Who, The ', 237);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (238, 'Howlin\' Wolf', 'Howlin\' Wolf', 238);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (239, 'Like a Prayer', 'Madonna', 239);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (240, 'Can\'t Buy a Thrill', 'Steely Dan', 240);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (241, 'Let It Be', 'Replacements, The ', 241);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (242, 'Run-D.M.C.', 'Run-D.M.C.', 242);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (243, 'Black Sabbath', 'Black Sabbath', 243);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (244, 'The Marshall Mathers LP', 'Eminem', 244);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (245, 'The Jerry Lee Lewis Anthology-All Killer No Filler!', 'Lewis, Jerry Lee ', 245);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (246, 'Freak Out!', 'Mothers of Invention, The ', 246);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (247, 'Live/Dead', 'Grateful Dead, The ', 247);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (248, 'The Shape of Jazz to Come', 'Coleman, Ornette ', 248);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (249, 'Automatic for the People', 'R.E.M.', 249);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (250, 'Reasonable Doubt', 'Jay-Z', 250);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (251, 'Low', 'Bowie, David ', 251);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (252, 'The Blueprint', 'Jay-Z', 252);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (253, 'The River', 'Springsteen, Bruce ', 253);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (254, 'The Otis Redding Dictionary Of Soul- Complete & Unbelievable', 'Redding, Otis ', 254);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (255, 'Metallica', 'Metallica', 255);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (256, 'Trans Europa Express', 'Kraftwerk', 256);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (257, 'Whitney Houston', 'Houston, Whitney ', 257);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (258, 'The Kinks are the Village Green Preservation Society', 'Kinks, The ', 258);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (259, 'The Velvet Rope', 'Jackson, Janet ', 259);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (260, 'Stardust', 'Nelson, Willie ', 260);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (261, 'American Beauty', 'Grateful Dead, The ', 261);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (262, 'Crosby, Stills & Nash', 'Crosby, Stills & Nash', 262);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (263, 'Tracy Chapman', 'Chapman, Tracy ', 263);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (264, 'Workingman\'s Dead', 'Grateful Dead, The ', 264);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (265, 'The Genius of Ray Charles', 'Charles, Ray ', 265);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (266, 'Child Is Father to the Man', 'Blood, Sweat and Tears', 266);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (267, 'Quadrophenia', 'Who, The ', 267);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (268, 'Paul Simon', 'Simon, Paul ', 268);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (269, 'Psychocandy', 'Jesus and Mary Chain, The ', 269);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (270, 'Some Girls', 'Rolling Stones, The ', 270);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (271, 'The Beach Boys Today!', 'Beach Boys, The ', 271);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (272, 'Dig Me Out', 'Sleater-Kinney', 272);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (273, 'Going To A Go-Go', 'Smokey Robinson & the Miracles', 273);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (274, 'Nightbirds', 'LaBelle', 274);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (275, 'The Slim Shady LP', 'Eminem', 275);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (276, 'Mothership Connection', 'Parliament', 276);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (277, 'Rhythm Nation 1814', 'Jackson, Janet ', 277);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (278, 'Anthology of American Folk Music', 'Various Artists', 278);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (279, 'Aladdin Sane', 'Bowie, David ', 279);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (280, 'All That You Can\'t Leave Behind', 'U2', 280);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (281, 'My Life', 'Blige, Mary J. ', 281);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (282, 'Folk Singer', 'Waters, Muddy ', 282);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (283, 'Can\'t Get Enough', 'White, Barry ', 283);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (284, 'The Cars', 'Cars, The ', 284);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (285, 'Music of My Mind', 'Wonder, Stevie ', 285);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (286, 'I\'m Still in Love with You', 'Green, Al ', 286);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (287, 'Los Angeles', 'X', 287);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (288, 'Anthem of the Sun', 'Grateful Dead, The ', 288);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (289, 'Something Else by The Kinks', 'Kinks, The ', 289);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (290, 'Call Me', 'Green, Al ', 290);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (291, 'Talking Heads: 77', 'Talking Heads', 291);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (292, 'The Basement Tapes', 'Dylan & the Band, Bob ', 292);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (293, 'White Light/White Heat', 'Velvet Underground, The ', 293);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (294, 'Kick Out the Jams', 'MC5', 294);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (295, 'Songs of Love and Hate', 'Cohen, Leonard ', 295);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (296, 'Meat is Murder', 'Smiths, The ', 296);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (297, 'We\'re Only in it for the Money', 'Mothers of Invention, The ', 297);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (298, 'The College Dropout', 'West, Kanye ', 298);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (299, 'Weezer', 'Weezer', 299);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (300, 'Master of Reality', 'Black Sabbath', 300);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (301, 'Coat of Many Colors', 'Parton, Dolly ', 301);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (302, 'Fear of a Black Planet', 'Public Enemy', 302);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (303, 'John Wesley Harding', 'Dylan, Bob ', 303);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (304, 'Grace', 'Buckley, Jeff ', 304);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (305, 'Car Wheels on a Gravel Road', 'Williams, Lucinda ', 305);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (306, 'Odelay', 'Beck', 306);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (307, 'A Hard Day\'s Night', 'Beatles, The ', 307);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (308, 'Songs for Swingin\' Lovers', 'Sinatra, Frank ', 308);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (309, 'Willy and the Poor Boys', 'Creedence Clearwater Revival', 309);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (310, 'Blood Sugar Sex Magik', 'Red Hot Chili Peppers', 310);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (311, 'The Sun Records Collection', 'Various Artists', 311);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (312, 'Nothing\'s Shocking', 'Jane\'s Addiction', 312);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (313, 'MTV Unplugged in New York', 'Nirvana', 313);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (314, 'The Miseducation of Lauryn Hill', 'Hill, Lauryn ', 314);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (315, 'Damn the Torpedoes', 'Petty & the Heartbreakers, Tom ', 315);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (316, 'The Velvet Underground', 'Velvet Underground, The ', 316);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (317, 'Surfer Rosa', 'Pixies', 317);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (318, 'Back Stabbers', 'O\'Jays', 318);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (319, 'Burnin\'', 'Marley & the Wailers, Bob ', 319);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (320, 'Amnesiac', 'Radiohead', 320);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (321, 'Pink Moon', 'Drake, Nick ', 321);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (322, 'Sail Away', 'Newman, Randy ', 322);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (323, 'Ghost in the Machine', 'Police, The ', 323);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (324, 'Station to Station', 'Bowie, David ', 324);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (325, 'Slowhand', 'Clapton, Eric ', 325);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (326, 'Disintegration', 'Cure, The ', 326);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (327, 'Exile in Guyville', 'Phair, Liz ', 327);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (328, 'Daydream Nation', 'Sonic Youth', 328);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (329, 'In the Jungle Groove', 'Brown, James ', 329);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (330, 'Tonight\'s the Night', 'Young, Neil ', 330);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (331, 'Help!', 'Beatles, The ', 331);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (332, 'Shoot Out the Lights', 'Richard & Linda Thompson', 332);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (333, 'Wild Gift', 'X', 333);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (334, 'Squeezing Out Sparks', 'Graham Parker & the Rumour', 334);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (335, 'Superunknown', 'Soundgarden', 335);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (336, 'In Rainbows', 'Radiohead', 336);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (337, 'Aqualung', 'Jethro Tull', 337);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (338, 'Cheap Thrills', 'Big Brother & the Holding Company', 338);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (339, 'The Heart of Saturday Night', 'Waits, Tom ', 339);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (340, 'Damaged', 'Black Flag', 340);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (341, 'Play', 'Moby', 341);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (342, 'Violator', 'Depeche Mode', 342);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (343, 'Bat out of Hell', 'Loaf, Meat ', 343);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (344, 'Berlin', 'Reed, Lou ', 344);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (345, 'Stop Making Sense', 'Talking Heads', 345);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (346, '3 Feet High and Rising', 'De La Soul', 346);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (347, 'The Piper at the Gates of Dawn', 'Pink Floyd', 347);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (348, 'Muddy Waters at Newport 1960', 'Waters, Muddy ', 348);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (349, 'The Black Album', 'Jay-Z', 349);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (350, 'The Yardbirds', 'Yardbirds, The ', 350);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (351, 'Rust Never Sleeps', 'Young & Crazy Horse, Neil ', 351);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (352, 'Brothers in Arms', 'Dire Straits', 352);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (353, 'My Beautiful Dark Twisted Fantasy', 'West, Kanye ', 353);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (354, '52nd Street', 'Joel, Billy ', 354);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (355, 'Having a Rave Up with the Yardbirds', 'Yardbirds, The ', 355);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (356, '12 Songs', 'Newman, Randy ', 356);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (357, 'Between the Buttons', 'Rolling Stones, The ', 357);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (358, 'Sketches of Spain', 'Davis, Miles ', 358);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (359, 'Honky Château', 'John, Elton ', 359);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (360, 'Singles Going Steady', 'Buzzcocks', 360);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (361, 'Stankonia', 'OutKast', 361);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (362, 'Siamese Dream', 'Smashing Pumpkins', 362);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (363, 'Substance', 'New Order', 363);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (364, 'L.A. Woman', 'Doors, The ', 364);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (365, 'Rage Against the Machine', 'Rage Against the Machine', 365);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (366, 'American Recordings', 'Cash, Johnny ', 366);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (367, 'Ray of Light', 'Madonna', 367);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (368, 'Eagles', 'Eagles', 368);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (369, 'Louder than Bombs', 'Smiths, The ', 369);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (370, 'Mott', 'Mott the Hoople', 370);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (371, 'Monkeys Whatever People Say I Am, That\'s What I\'m Not', 'Arctic', 371);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (372, 'Reggatta De Blanc', 'Police, The ', 372);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (373, 'Volunteers', 'Jefferson Airplane', 373);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (374, 'Siren', 'Roxy Music', 374);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (375, 'Late for the Sky', 'Browne, Jackson ', 375);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (376, 'Post', 'Björk', 376);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (377, 'The Ultimate Collection: 1948-1990', 'Hooker, John Lee ', 377);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (378, '(What\'s The Story) Morning Glory?', 'Oasis', 378);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (379, 'CrazySexyCool', 'TLC', 379);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (380, 'Funky Kingston', 'Toots & the Maytals', 380);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (381, 'Smile', 'Beach Boys, The ', 381);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (382, 'The Modern Lovers', 'Modern Lovers, The ', 382);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (383, 'More Songs about Buildings and Food', 'Talking Heads', 383);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (384, 'A Quick One', 'Who, The ', 384);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (385, 'Love and Theft', 'Dylan, Bob ', 385);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (386, 'Pretzel Logic', 'Steely Dan', 386);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (387, 'Enter the Wu-Tang (36 Chambers)', 'Wu-Tang Clan', 387);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (388, 'The Indestructible Beat Of Soweto', 'Various Artists', 388);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (389, 'The End of the Innocence', 'Henley, Don ', 389);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (390, 'Elephant', 'White Stripes, The ', 390);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (391, 'The Pretender', 'Browne, Jackson ', 391);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (392, 'Let It Be', 'Beatles, The ', 392);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (393, 'Kala', 'M.I.A.', 393);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (394, 'Good Old Boys', 'Newman, Randy ', 394);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (395, 'Sound Of Silver', 'LCD Soundsystem', 395);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (396, 'For Your Pleasure', 'Roxy Music', 396);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (397, 'Blue Lines', 'Massive Attack', 397);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (398, 'Eliminator', 'ZZ Top', 398);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (399, 'Rain Dogs', 'Waits, Tom ', 399);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (400, 'Anthology', 'Temptations, The ', 400);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (401, 'Californication', 'Red Hot Chili Peppers', 401);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (402, 'Illmatic', 'Nas', 402);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (403, '(Pronounced \'Lĕh-\'nérd \'Skin-\'nérd)', 'Lynyrd Skynyrd', 403);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (404, 'Dr. John\'s Gumbo', 'John, Dr. ', 404);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (405, 'Radio City', 'Big Star', 405);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (406, 'Rid of Me', 'Harvey, P J ', 406);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (407, 'Sandinista!', 'Clash, The ', 407);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (408, 'I Do Not Want What I Haven\'t Got', 'O\'Connor, Sinéad ', 408);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (409, 'Strange Days', 'Doors, The ', 409);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (410, 'Time out of Mind', 'Dylan, Bob ', 410);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (411, '461 Ocean Boulevard', 'Clapton, Eric ', 411);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (412, 'Pink Flag', 'Wire', 412);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (413, 'Double Nickels on the Dime', 'Minutemen', 413);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (414, 'Beauty and the Beat', 'Go-Go\'s', 414);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (415, 'Van Halen', 'Van Halen', 415);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (416, 'Mule Variations', 'Waits, Tom ', 416);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (417, 'Boy', 'U2', 417);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (418, 'Band on the Run', 'McCartney & Wings, Paul ', 418);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (419, 'Dummy', 'Portishead', 419);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (420, 'Buddy Holly and the Crickets', 'Buddy Holly & the Crickets', 420);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (421, 'The Best of The Girl Groups, Volume 1', 'Various Artists', 421);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (422, 'Presenting The Fabulous Ronettes', 'Ronettes featuring Veronica, The ', 422);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (423, 'Anthology', 'Diana Ross & the Supremes', 423);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (424, 'The Rising', 'Springsteen, Bruce ', 424);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (425, 'Grievous Angel', 'Parsons, Gram ', 425);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (426, 'Cheap Trick at Budokan', 'Cheap Trick', 426);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (427, 'Sleepless', 'Wolf, Peter ', 427);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (428, 'Outlandos D\'Amour', 'Police, The ', 428);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (429, 'Another Green World', 'Eno', 429);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (430, 'Vampire Weekend', 'Vampire Weekend', 430);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (431, 'Stories from the City, Stories from the Sea', 'Harvey, P J ', 431);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (432, 'Here Come the Warm Jets', 'Eno', 432);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (433, 'All Things Must Pass', 'Harrison, George ', 433);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (434, '1 Record', 'Big Star', 434);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (435, 'In Utero', 'Nirvana', 435);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (436, 'Sea Change', 'Beck', 436);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (437, 'Tha Carter III', 'Wayne, Lil’ ', 437);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (438, 'Boys Don\'t Cry', 'Cure, The ', 438);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (439, 'Live at the Harlem Square Club 1963', 'Cooke, Sam ', 439);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (440, 'Rum Sodomy & The Lash', 'Pogues, The ', 440);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (441, 'Suicide', 'Suicide', 441);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (442, 'Q: Are We Not Men? A: We Are Devo!', 'Devo', 442);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (443, 'In Color', 'Cheap Trick', 443);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (444, 'The World is a Ghetto', 'War', 444);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (445, 'Fly Like an Eagle', 'Steve Miller Band', 445);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (446, 'Back in the USA', 'MC5', 446);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (447, 'Getz / Gilberto', 'Getz / João Gilberto Featuring Antonio Carlos Jobim, Stan ', 447);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (448, 'Synchronicity', 'Police, The ', 448);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (449, '3rd', 'Big Star', 449);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (450, 'For Everyman', 'Browne, Jackson ', 450);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (451, 'Back to Black', 'Winehouse, Amy ', 451);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (452, 'John Prine', 'Prine, John ', 452);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (453, 'Strictly Business', 'EPMD', 453);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (454, 'Love It to Death', 'Cooper, Alice ', 454);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (455, 'How Will the Wolf Survive?', 'Los Lobos', 455);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (456, 'Here, My Dear', 'Gaye, Marvin ', 456);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (457, 'Z', 'My Morning Jacket', 457);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (458, 'Tumbleweed Connection', 'John, Elton ', 458);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (459, 'The Drifters\' Golden Hits', 'Drifters, The ', 459);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (460, 'Live Through This', 'Hole', 460);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (461, 'Metal Box', 'Public Image Ltd.', 461);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (462, 'Document', 'R.E.M.', 462);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (463, 'And The Bunnymen Heaven Up Here', 'Echo', 463);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (464, 'Hysteria', 'Def Leppard', 464);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (465, '69 Love Songs', 'Magnetic Fields, The ', 465);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (466, 'A Rush of Blood to the Head', 'Coldplay', 466);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (467, 'Tunnel Of Love', 'Springsteen, Bruce ', 467);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (468, 'Blues Band The Paul Butterfield Blues Band', 'Paul Butterfield, The ', 468);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (469, 'The Score', 'Fugees', 469);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (470, 'Radio', 'J, LL Cool ', 470);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (471, 'Faith', 'Michael, George ', 471);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (472, 'Want to See the Bright Lights Tonight', 'Richard & Linda Thompson', 472);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (473, 'The Smiths', 'Smiths, The ', 473);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (474, 'Próxima Estación... Esperanza', 'Chao, Manu ', 474);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (475, 'Armed Forces', 'Costello & the Attractions, Elvis ', 475);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (476, 'Life After Death', 'Notorious B.I.G, The ', 476);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (477, 'Down Every Road (1962-1994)', 'Haggard, Merle ', 477);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (478, 'All Time Greatest Hits', 'Lynn, Loretta ', 478);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (479, 'Maggot Brain', 'Funkadelic', 479);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (480, 'Only Built 4 Cuban Linx ...', 'Raekwon, Chef ', 480);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (481, 'Voodoo', 'D\'Angelo', 481);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (482, 'Guitar Town', 'Earle, Steve ', 482);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (483, 'Entertainment!', 'Gang of Four', 483);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (484, 'All the Young Dudes', 'Mott the Hoople', 484);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (485, 'Vitalogy', 'Pearl Jam', 485);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (486, 'That\'s the Way of the World', 'Earth, Wind & Fire', 486);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (487, 'She\'s So Unusual', 'Lauper, Cyndi ', 487);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (488, 'New Day Rising', 'Hüsker Dü', 488);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (489, 'Destroyer', 'Kiss', 489);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (490, 'Tres Hombres', 'ZZ Top', 490);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (491, 'Born Under A Bad Sign', 'King, Albert ', 491);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (492, 'Touch', 'Eurythmics', 492);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (493, 'Yankee Hotel Foxtrot', 'Wilco', 493);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (494, 'Oracular Spectacular', 'MGMT', 494);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (495, 'Give It Up', 'Raitt, Bonnie ', 495);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (496, 'Boz Scaggs', 'Scaggs, Boz ', 496);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (497, 'White Blood Cells', 'White Stripes, The ', 497);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (498, 'The Stone Roses', 'Stone Roses, The ', 498);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (499, 'Live in Cook County Jail', 'King, B.B. ', 499);
INSERT INTO album (aid, atitel, iname, rang500) VALUES (500, 'Aquemini', 'OutKast', 500);
