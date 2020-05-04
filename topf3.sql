USE musikarchiv2020;

-- My letter: w
-- So Waterloo

INSERT INTO interpret (iname, inameanz, wikipedia) VALUES ("Waterloo ", "Waterloo", "https://de.wikipedia.org/wiki/Waterloo_(S%C3%A4nger)");
INSERT INTO interpret (iname, inameanz, wikipedia) VALUES ("Robinson", "Robinson", "https://de.wikipedia.org/wiki/Sepp_Krassnitzer");
INSERT INTO interpret (iname, inameanz, wikipedia) VALUES ("Waterloo & Robinson", "Waterloo & Robinson", "https://de.wikipedia.org/wiki/Waterloo_%26_Robinson");
INSERT INTO solist (iname, gebdatum) VALUES ("Waterloo", '1945-11-27');
INSERT INTO solist (iname, gebdatum) VALUES ("Robinson", '1947-04-15');
INSERT INTO band (iname, gruendjahr) VALUES ("Waterloo & Robinson", 1970);
INSERT INTO mitglied (siname, biname, vondatum, bisdatum) VALUES ("Waterloo", "Waterloo & Robinson", '1970-01-01', '2006-01-01');
INSERT INTO mitglied (siname, biname, vondatum, bisdatum) VALUES ("Robinson", "Waterloo & Robinson", '1970-01-01', '2006-01-01');
INSERT INTO album (aid, atitel, iname, discogs) VALUES (2171, "Weihnachten Mit Waterloo & Robinson", "Waterloo & Robinson", "https://www.discogs.com/de/Waterloo-Robinson-Weihnachten-Mit-Waterloo-Robinson/release/9509663");
INSERT INTO genre (gbez) VALUES ("Schlager");
INSERT INTO albumgenre (gbez, aid) VALUES ("Schlager", 2171);

INSERT INTO song (iname, stitel) VALUES ("Waterloo & Robinson", "Bethlehem");
INSERT INTO song (iname, stitel) VALUES ("Waterloo & Robinson", "Leise Rieselt Der Schnee");
INSERT INTO song (iname, stitel) VALUES ("Waterloo & Robinson", "Stille Nacht");
INSERT INTO song (iname, stitel) VALUES ("Waterloo & Robinson", "Es Wird Schon Glei Dumpa");

-- INSERTs INTO Table: songv
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Waterloo & Robinson', 'Bethlehem', '', '00:03:00', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Waterloo & Robinson', 'Leise Rieselt Der Schnee', '', '00:02:42', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Waterloo & Robinson', 'Stille Nacht', '', '00:03:30', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Waterloo & Robinson', 'Es Wird Schon Glei Dumpa', '', '00:02:40', null);

INSERT INTO tontr (aid, medium, seite) VALUES (2171, "Vinyl", "A");
INSERT INTO tontr (aid, medium, seite) VALUES (2171, "Vinyl", "B");
-- INSERTs INTO Table: ttracklist
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (2171, 'Vinyl', 'A', 'Waterloo & Robinson', 'Bethlehem', '', 1, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (2171, 'Vinyl', 'A', 'Waterloo & Robinson', 'Leise Rieselt Der Schnee', '', 2, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (2171, 'Vinyl', 'B', 'Waterloo & Robinson', 'Stille Nacht', '', 1, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (2171, 'Vinyl', 'B', 'Waterloo & Robinson', 'Es Wird Schon Glei Dumpa', '', 2, false);

-- Walter Carlos
INSERT INTO interpret (iname, inameanz, wikipedia) VALUES ("Carlos, Walter ", "Walter Carlos", "https://de.wikipedia.org/wiki/Wendy_Carlos");
INSERT INTO solist (iname, gebdatum) VALUES ("Carlos, Walter ", '1939-11-14');
INSERT INTO album (aid, atitel, iname, discogs) VALUES (2172, "Walter Carlos' Clockwork Orange", "Carlos, Walter", "https://www.discogs.com/de/Walter-Carlos-Walter-Carlos-Clockwork-Orange/release/180334");
INSERT INTO albumgenre (gbez, aid) VALUES ("Electronic", 2172);

INSERT INTO song (iname, stitel) VALUES ("Carlos, Walter ", "Timesteps");
INSERT INTO song (iname, stitel) VALUES ("Carlos, Walter ", "March From A Clockwork Orange (Beethoven: Ninth Symphony: Fourth Movement, Abridged)");
INSERT INTO song (iname, stitel) VALUES ("Carlos, Walter ", "Title Music From A Clockwork Orange (From Purcell's &#34;Music For The Funeral Of Queen Mary&#34;)");
INSERT INTO song (iname, stitel) VALUES ("Carlos, Walter ", "La Gazza Ladra (The Thieving Magpie, Abridged)");
INSERT INTO song (iname, stitel) VALUES ("Carlos, Walter ", "Theme From A Clockwork Orange (Beethoviana)");
INSERT INTO song (iname, stitel) VALUES ("Carlos, Walter ", "Ninth Symphony: Second Movement (Scherzo)");
INSERT INTO song (iname, stitel) VALUES ("Carlos, Walter ", "William Tell Overture (Abridged)");
INSERT INTO song (iname, stitel) VALUES ("Carlos, Walter ", "Country Lane");

-- INSERTs INTO Table: songv
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Carlos, Walter ', 'Timesteps', '', '00:13:50', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Carlos, Walter ', 'March From A Clockwork Orange (Beethoven: Ninth Symphony: Fourth Movement, Abridged)', '', '00:07:00', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Carlos, Walter ', 'Title Music From A Clockwork Orange (From Purcell\'s ("Music For The Funeral Of Queen Mary")', '', '00:02:21', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Carlos, Walter ', 'La Gazza Ladra (The Thieving Magpie, Abridged)', '', '00:05:50', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Carlos, Walter ', 'Theme From A Clockwork Orange (Beethoviana)', '', '00:01:44', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Carlos, Walter ', 'Ninth Symphony: Second Movement (Scherzo)', '', '00:04:52', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Carlos, Walter ', 'William Tell Overture (Abridged)', '', '00:01:17', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Carlos, Walter ', 'Country Lane', '', '00:04:43', null);

INSERT INTO tontr (aid, medium, seite) VALUES (2172, "Vinyl", "A");
INSERT INTO tontr (aid, medium, seite) VALUES (2172, "Vinyl", "B");
-- INSERTs INTO Table: ttracklist
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (2172, 'Vinyl', 'A', 'Carlos, Walter ', 'Timesteps', '', 1, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (2172, 'Vinyl', 'A', 'Carlos, Walter ', 'March From A Clockwork Orange (Beethoven: Ninth Symphony: Fourth Movement, Abridged)', '', 2, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (2172, 'Vinyl', 'B', 'Carlos, Walter ', 'Title Music From A Clockwork Orange (From Purcell\'s ("Music For The Funeral Of Queen Mary")', '', 1, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (2172, 'Vinyl', 'B', 'Carlos, Walter ', 'La Gazza Ladra (The Thieving Magpie, Abridged)', '', 2, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (2172, 'Vinyl', 'B', 'Carlos, Walter ', 'Theme From A Clockwork Orange (Beethoviana)', '', 3, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (2172, 'Vinyl', 'B', 'Carlos, Walter ', 'Ninth Symphony: Second Movement (Scherzo)', '', 4, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (2172, 'Vinyl', 'B', 'Carlos, Walter ', 'William Tell Overture (Abridged)', '', 5, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (2172, 'Vinyl', 'B', 'Carlos, Walter ', 'Country Lane', '', 6, false);

-- Wham!
INSERT INTO interpret (iname, inameanz, wikipedia) VALUES ("Wham", "Wham", "https://en.wikipedia.org/wiki/Wham!");
INSERT INTO interpret (iname, inameanz, wikipedia) VALUES ("Ridgeley, Andrew ", "Andrew Ridgeley", "https://en.wikipedia.org/wiki/Wham!");
INSERT INTO band (iname, gruendjahr) VALUES ("Wham", 1981);
INSERT INTO solist (iname, gebdatum) VALUES ("Ridgeley, Andrew ", '1963-01-26');
INSERT INTO solist (iname, gebdatum) VALUES ("Michael, George ", '1963-06-25');
INSERT INTO mitglied (siname, biname, vondatum, bisdatum) VALUES ("Ridgeley, Andrew ", "Wham", '1981-01-01');
INSERT INTO mitglied (siname, biname, vondatum, bisdatum) VALUES ("Michael, George ", "Wham", '1981-01-01');
INSERT INTO album (aid, atitel, iname, discogs) VALUES (2173, "Make It Big", "Wham", "https://www.discogs.com/Wham-Make-It-Big/release/3439549");

INSERT INTO albumgenre (gbez) VALUES ("Pop");

INSERT INTO song (iname, stitel) VALUES ("Wham", "Wake Me Up Before You Go-Go");
INSERT INTO song (iname, stitel) VALUES ("Wham", "Everything She Wants");
INSERT INTO song (iname, stitel) VALUES ("Wham", "Heartbeat");
INSERT INTO song (iname, stitel) VALUES ("Wham", "Like A Baby");
INSERT INTO song (iname, stitel) VALUES ("Wham", "Freedom");
INSERT INTO song (iname, stitel) VALUES ("Wham", "If You Were There");
INSERT INTO song (iname, stitel) VALUES ("Wham", "Credit Card Baby");
INSERT INTO song (iname, stitel) VALUES ("Wham", "Careless Whisper");

-- INSERTs INTO Table: songv
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Wham', 'Wake Me Up Before You Go-Go', '', '00:03:50', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Wham', 'Everything She Wants', '', '00:05:01', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Wham', 'Heartbeat', '', '00:04:42', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Wham', 'Like A Baby', '', '00:04:12', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Wham', 'Freedom', '', '00:05:01', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Wham', 'If You Were There', '', '00:03:38', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Wham', 'Credit Card Baby', '', '00:05:08', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Wham', 'Careless Whisper', '', '00:06:30', null);

INSERT INTO tontr (aid, medium, seite) VALUES (2173, "CD", "1");
-- INSERTs INTO Table: ttracklist
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (2173, 'CD', '1', 'Wham', 'Wake Me Up Before You Go-Go', '', 1, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (2173, 'CD', '1', 'Wham', 'Everything She Wants', '', 2, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (2173, 'CD', '1', 'Wham', 'Heartbeat', '', 3, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (2173, 'CD', '1', 'Wham', 'Like A Baby', '', 4, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (2173, 'CD', '1', 'Wham', 'Freedom', '', 5, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (2173, 'CD', '1', 'Wham', 'If You Were There', '', 6, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (2173, 'CD', '1', 'Wham', 'Credit Card Baby', '', 7, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (2173, 'CD', '1', 'Wham', 'Careless Whisper', '', 8, false);
