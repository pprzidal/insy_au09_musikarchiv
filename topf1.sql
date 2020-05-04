USE musikarchiv2020;
-- My numbers are: [21, 144, 248, 429, 451]

-- 21, 'The Great Twenty-Eight', 'Berry, Chuck '
INSERT INTO genre (gbez) VALUES ('Rock');
INSERT INTO genre (gbez) VALUES ('Electronic');
INSERT INTO genre (gbez) VALUES ('Funk / Soul');
INSERT INTO genre (gbez) VALUES ('Pop');

UPDATE interpret SET wikipedia = "https://de.wikipedia.org/wiki/Chuck_Berry" WHERE iname = "Berry, Chuck ";
INSERT INTO solist (iname, gebdatum) VALUES ("Berry, Chuck ", '1926-10-18');
UPDATE album SET pjahr = 1982, discogs = "https://www.discogs.com/Chuck-Berry-The-Great-Twenty-Eight/master/163706", atyp = "Compilation" WHERE aid = 21;

INSERT INTO albumgenre (gbez, aid) VALUES ("Rock", 21);

-- siehe Java Programm
INSERT INTO song (iname, stitel) VALUES ("Berry, Chuck ", "Maybellene");
INSERT INTO song (iname, stitel) VALUES ("Berry, Chuck ", "Thirty Days");
INSERT INTO song (iname, stitel) VALUES ("Berry, Chuck ", "You Can't Catch Me");
INSERT INTO song (iname, stitel) VALUES ("Berry, Chuck ", "Too Much Monkey Business");
INSERT INTO song (iname, stitel) VALUES ("Berry, Chuck ", "Brown-Eyed Handsome Man");
INSERT INTO song (iname, stitel) VALUES ("Berry, Chuck ", "Roll Over Beethoven");
INSERT INTO song (iname, stitel) VALUES ("Berry, Chuck ", "Havana Moon");
INSERT INTO song (iname, stitel) VALUES ("Berry, Chuck ", "School Days");
INSERT INTO song (iname, stitel) VALUES ("Berry, Chuck ", "Rock And Roll Music");
INSERT INTO song (iname, stitel) VALUES ("Berry, Chuck ", "Oh Baby Doll");
INSERT INTO song (iname, stitel) VALUES ("Berry, Chuck ", "Reelin' And Rockin'");
INSERT INTO song (iname, stitel) VALUES ("Berry, Chuck ", "Sweet Little Sixteen");
INSERT INTO song (iname, stitel) VALUES ("Berry, Chuck ", "Johnny B. Goode");
INSERT INTO song (iname, stitel) VALUES ("Berry, Chuck ", "Around And Around");
INSERT INTO song (iname, stitel) VALUES ("Berry, Chuck ", "Carol");
INSERT INTO song (iname, stitel) VALUES ("Berry, Chuck ", "Beautiful Delilah");
INSERT INTO song (iname, stitel) VALUES ("Berry, Chuck ", "Memphis");
INSERT INTO song (iname, stitel) VALUES ("Berry, Chuck ", "Sweet Little Rock And Roller");
INSERT INTO song (iname, stitel) VALUES ("Berry, Chuck ", "Little Queenie");
INSERT INTO song (iname, stitel) VALUES ("Berry, Chuck ", "Almost Grown");
INSERT INTO song (iname, stitel) VALUES ("Berry, Chuck ", "Back In The USA");
INSERT INTO song (iname, stitel) VALUES ("Berry, Chuck ", "Let It Rock");
INSERT INTO song (iname, stitel) VALUES ("Berry, Chuck ", "Bye Bye Johnny");
INSERT INTO song (iname, stitel) VALUES ("Berry, Chuck ", "I'm Talking About You");
INSERT INTO song (iname, stitel) VALUES ("Berry, Chuck ", "Come On");
INSERT INTO song (iname, stitel) VALUES ("Berry, Chuck ", "Nadine");
INSERT INTO song (iname, stitel) VALUES ("Berry, Chuck ", "No Particular Place To Go");
INSERT INTO song (iname, stitel) VALUES ("Berry, Chuck ", "I Want To Be Your Driver");

-- INSERTs INTO Table: songv
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Berry, Chuck ', 'Maybellene', '', '00:02:18', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Berry, Chuck ', 'Thirty Days', '', '00:02:24', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Berry, Chuck ', "You Can't Catch Me", '', '00:02:42', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Berry, Chuck ', 'Too Much Monkey Business', '', '00:02:53', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Berry, Chuck ', 'Brown-Eyed Handsome Man', '', '00:02:17', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Berry, Chuck ', 'Roll Over Beethoven', '', '00:02:23', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Berry, Chuck ', 'Havana Moon', '', '00:03:05', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Berry, Chuck ', 'School Days', '', '00:02:40', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Berry, Chuck ', 'Rock And Roll Music', '', '00:02:30', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Berry, Chuck ', 'Oh Baby Doll', '', '00:02:33', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Berry, Chuck ', "Reelin' And Rockin'", '', '00:03:14', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Berry, Chuck ', 'Sweet Little Sixteen', '', '00:02:55', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Berry, Chuck ', 'Johnny B. Goode', '', '00:02:38', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Berry, Chuck ', 'Around And Around', '', '00:02:35', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Berry, Chuck ', 'Carol', '', '00:02:46', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Berry, Chuck ', 'Beautiful Delilah', '', '00:02:08', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Berry, Chuck ', 'Memphis', '', '00:02:12', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Berry, Chuck ', 'Sweet Little Rock And Roller', '', '00:02:20', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Berry, Chuck ', 'Little Queenie', '', '00:02:38', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Berry, Chuck ', 'Almost Grown', '', '00:02:19', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Berry, Chuck ', 'Back In The USA', '', '00:02:25', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Berry, Chuck ', 'Let It Rock', '', '00:01:50', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Berry, Chuck ', 'Bye Bye Johnny', '', '00:02:03', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Berry, Chuck ', "I'm Talking About You", '', '00:01:48', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Berry, Chuck ', 'Come On', '', '00:01:50', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Berry, Chuck ', 'Nadine', '', '00:02:30', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Berry, Chuck ', 'No Particular Place To Go', '', '00:02:44', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Berry, Chuck ', 'I Want To Be Your Driver', '', '00:02:15', null);

INSERT INTO tontr (aid, medium, seite) VALUES (21, "Vinyl", "A");
INSERT INTO tontr (aid, medium, seite) VALUES (21, "Vinyl", "B");
INSERT INTO tontr (aid, medium, seite) VALUES (21, "Vinyl", "C");
INSERT INTO tontr (aid, medium, seite) VALUES (21, "Vinyl", "D");

-- INSERTs INTO Table: ttracklist
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (21, 'Vinyl', 'A', 'Berry, Chuck ', 'Maybellene', '', 1, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (21, 'Vinyl', 'A', 'Berry, Chuck ', 'Thirty Days', '', 2, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (21, 'Vinyl', 'A', 'Berry, Chuck ', "You Can't Catch Me", '', 3, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (21, 'Vinyl', 'A', 'Berry, Chuck ', 'Too Much Monkey Business', '', 4, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (21, 'Vinyl', 'A', 'Berry, Chuck ', 'Brown-Eyed Handsome Man', '', 5, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (21, 'Vinyl', 'A', 'Berry, Chuck ', 'Roll Over Beethoven', '', 6, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (21, 'Vinyl', 'A', 'Berry, Chuck ', 'Havana Moon', '', 7, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (21, 'Vinyl', 'B', 'Berry, Chuck ', 'School Days', '', 1, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (21, 'Vinyl', 'B', 'Berry, Chuck ', 'Rock And Roll Music', '', 2, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (21, 'Vinyl', 'B', 'Berry, Chuck ', 'Oh Baby Doll', '', 3, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (21, 'Vinyl', 'B', 'Berry, Chuck ', "Reelin' And Rockin'", '', 4, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (21, 'Vinyl', 'B', 'Berry, Chuck ', 'Sweet Little Sixteen', '', 5, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (21, 'Vinyl', 'B', 'Berry, Chuck ', 'Johnny B. Goode', '', 6, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (21, 'Vinyl', 'B', 'Berry, Chuck ', 'Around And Around', '', 7, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (21, 'Vinyl', 'C', 'Berry, Chuck ', 'Carol', '', 1, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (21, 'Vinyl', 'C', 'Berry, Chuck ', 'Beautiful Delilah', '', 2, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (21, 'Vinyl', 'C', 'Berry, Chuck ', 'Memphis', '', 3, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (21, 'Vinyl', 'C', 'Berry, Chuck ', 'Sweet Little Rock And Roller', '', 4, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (21, 'Vinyl', 'C', 'Berry, Chuck ', 'Little Queenie', '', 5, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (21, 'Vinyl', 'C', 'Berry, Chuck ', 'Almost Grown', '', 6, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (21, 'Vinyl', 'C', 'Berry, Chuck ', 'Back In The USA', '', 7, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (21, 'Vinyl', 'D', 'Berry, Chuck ', 'Let It Rock', '', 1, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (21, 'Vinyl', 'D', 'Berry, Chuck ', 'Bye Bye Johnny', '', 2, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (21, 'Vinyl', 'D', 'Berry, Chuck ', "I'm Talking About You", '', 3, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (21, 'Vinyl', 'D', 'Berry, Chuck ', 'Come On', '', 4, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (21, 'Vinyl', 'D', 'Berry, Chuck ', 'Nadine', '', 5, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (21, 'Vinyl', 'D', 'Berry, Chuck ', 'No Particular Place To Go', '', 6, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (21, 'Vinyl', 'D', 'Berry, Chuck ', 'I Want To Be Your Driver', '', 7, false);

-- 144, Straight Outta Compton
UPDATE interpret SET wikipedia = "https://de.wikipedia.org/wiki/N.W.A" WHERE iname = "N.W.A";
INSERT INTO genre (gbez) VALUES ("Hip Hop");
INSERT INTO albumgenre (gbez, aid) VALUES ("Hip Hop", 144);
UPDATE interpret SET wikipedia = "https://de.wikipedia.org/wiki/Dr._Dre" WHERE iname = "Dre, Dr. ";
INSERT INTO interpret (iname, inameanz, wikipedia) VALUES ("Prince, Arabian ", "Arabian Prince", "https://de.wikipedia.org/wiki/Arabian_Prince");
INSERT INTO interpret (iname, inameanz, wikipedia) VALUES ("E, Eazy ", "Eazy-E", "https://de.wikipedia.org/wiki/Eazy-E");
INSERT INTO interpret (iname, inameanz, wikipedia) VALUES ("Cube, Ice ", "Ice Cube", "https://de.wikipedia.org/wiki/Ice_Cube");
INSERT INTO interpret (iname, inameanz, wikipedia) VALUES ("Ren, Mc ", "Mc Ren", "https://de.wikipedia.org/wiki/MC_Ren");
INSERT INTO interpret (iname, inameanz, wikipedia) VALUES ("Yella ", "Yella", "https://de.wikipedia.org/wiki/Yella_(Rapper)");
INSERT INTO solist (iname, gebdatum) VALUES ("Prince, Arabian ", '1965-06-17');
INSERT INTO solist (iname, gebdatum) VALUES ("E, Eazy ", '1964-09-06');
INSERT INTO solist (iname, gebdatum) VALUES ("Cube, Ice ", '1969-06-15');
INSERT INTO solist (iname, gebdatum) VALUES ("Ren, Mc ", '1969-06-14');
INSERT INTO solist (iname, gebdatum) VALUES ("Yella ", '1967-12-11');
INSERT INTO solist (iname, gebdatum) VALUES ("Dre, Dr. ", '1965-02-18');
INSERT INTO band (iname, gruendjahr) VALUES ("N.W.A", 1986);
INSERT INTO mitglied (biname, siname, vondatum, bisdatum) VALUES ("N.W.A", "Dre, Dr. ", '1986-01-01', '1991-01-01');
INSERT INTO mitglied (biname, siname, vondatum, bisdatum) VALUES ("N.W.A", "E, Eazy ", '1987-01-01', '1991-01-01');
INSERT INTO mitglied (biname, siname, vondatum, bisdatum) VALUES ("N.W.A", "Cube, Ice ", '1987-01-01', '1989-01-01');
INSERT INTO mitglied (biname, siname, vondatum, bisdatum) VALUES ("N.W.A", "Prince, Arabian ", '1987-01-01', '1988-01-01');
INSERT INTO mitglied (biname, siname, vondatum, bisdatum) VALUES ("N.W.A", "Ren, Mc ", '1987-01-01', '1991-01-01');
INSERT INTO mitglied (biname, siname, vondatum, bisdatum) VALUES ("N.W.A", "Yella ", '1987-01-01', '1991-01-01');

INSERT INTO song (iname, stitel) VALUES ("N.W.A", "Straight Outta Compton");
INSERT INTO song (iname, stitel) VALUES ("N.W.A", "_ _ _ _ Tha Police (Fill In The Blanks)");
INSERT INTO song (iname, stitel) VALUES ("N.W.A", "Gangsta Gangsta");
INSERT INTO song (iname, stitel) VALUES ("N.W.A", "If It Ain't Ruff");
INSERT INTO song (iname, stitel) VALUES ("N.W.A", "Parental Discretion Iz Advised");
INSERT INTO song (iname, stitel) VALUES ("N.W.A", "Express Yourself");
INSERT INTO song (iname, stitel) VALUES ("N.W.A", "Compton's N The House (Remix)");
INSERT INTO song (iname, stitel) VALUES ("N.W.A", "I Ain't Tha 1");
INSERT INTO song (iname, stitel) VALUES ("N.W.A", "Dopeman (Remix)");
INSERT INTO song (iname, stitel) VALUES ("N.W.A", "Quiet On Tha Set");

-- INSERTs INTO Table: songv
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('N.W.A', 'Straight Outta Compton', '', '00:04:18', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('N.W.A', '_ _ _ _ Tha Police (Fill In The Blanks)', '', '00:05:46', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('N.W.A', 'Gangsta Gangsta', '', '00:05:36', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('N.W.A', "If It Ain't Ruff", '', '00:03:34', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('N.W.A', 'Parental Discretion Iz Advised', '', '00:05:15', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('N.W.A', 'Express Yourself', '', '00:04:25', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('N.W.A', "Compton's N The House (Remix)", '', '00:05:20', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('N.W.A', "I Ain't Tha 1", '', '00:04:54', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('N.W.A', 'Dopeman (Remix)', '', '00:05:20', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('N.W.A', 'Quiet On Tha Set', '', '00:03:59', null);

INSERT INTO tontr (aid, medium, seite) VALUES (144, "Vinyl", "A");
INSERT INTO tontr (aid, medium, seite) VALUES (144, "Vinyl", "B");
-- INSERTs INTO Table: ttracklist
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (144, 'Vinyl', 'A', 'N.W.A', 'Straight Outta Compton', '', 1, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (144, 'Vinyl', 'A', 'N.W.A', '_ _ _ _ Tha Police (Fill In The Blanks)', '', 2, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (144, 'Vinyl', 'A', 'N.W.A', 'Gangsta Gangsta', '', 3, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (144, 'Vinyl', 'A', 'N.W.A', "If It Ain't Ruff", '', 4, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (144, 'Vinyl', 'A', 'N.W.A', 'Parental Discretion Iz Advised', '', 5, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (144, 'Vinyl', 'B', 'N.W.A', 'Express Yourself', '', 1, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (144, 'Vinyl', 'B', 'N.W.A', "Compton's N The House (Remix)", '', 2, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (144, 'Vinyl', 'B', 'N.W.A', "I Ain't Tha 1", '', 3, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (144, 'Vinyl', 'B', 'N.W.A', 'Dopeman (Remix)', '', 4, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (144, 'Vinyl', 'B', 'N.W.A', 'Quiet On Tha Set', '', 5, false);

-- 248, The Shape of Jazz to Come
UPDATE interpret SET wikipedia = "https://de.wikipedia.org/wiki/Ornette_Coleman" WHERE iname = "Coleman, Ornette ";
INSERT INTO solist (iname, gebdatum) VALUES ("Coleman, Ornette ", '1930-03-09');
UPDATE album SET pjahr = 1959, discogs = "https://www.discogs.com/de/Ornette-Coleman-The-Shape-Of-Jazz-To-Come/release/488973", atyp = "Studio" WHERE aid = 248;
INSERT INTO genre (gbez) VALUES ("Jazz");
INSERT INTO albumgenre (gbez, aid) VALUES ("Jazz", 248);

INSERT INTO song (iname, stitel) VALUES ("Coleman, Ornette ", "Lonely Woman");
INSERT INTO song (iname, stitel) VALUES ("Coleman, Ornette ", "Eventually");
INSERT INTO song (iname, stitel) VALUES ("Coleman, Ornette ", "Peace");
INSERT INTO song (iname, stitel) VALUES ("Coleman, Ornette ", "Focus On Sanity");
INSERT INTO song (iname, stitel) VALUES ("Coleman, Ornette ", "Congeniality");
INSERT INTO song (iname, stitel) VALUES ("Coleman, Ornette ", "Chronology");

-- INSERTs INTO Table: songv
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Coleman, Ornette ', 'Lonely Woman', '', '00:04:59', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Coleman, Ornette ', 'Eventually', '', '00:04:20', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Coleman, Ornette ', 'Peace', '', '00:09:04', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Coleman, Ornette ', 'Focus On Sanity', '', '00:06:50', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Coleman, Ornette ', 'Congeniality', '', '00:06:41', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Coleman, Ornette ', 'Chronology', '', '00:06:05', null);

INSERT INTO tontr (aid, medium, seite) VALUES (248, "Vinyl", "A");
INSERT INTO tontr (aid, medium, seite) VALUES (248, "Vinyl", "B");
-- INSERTs INTO Table: ttracklist
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (248, 'Vinyl', 'A', 'Coleman, Ornette ', 'Lonely Woman', '', 1, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (248, 'Vinyl', 'A', 'Coleman, Ornette ', 'Eventually', '', 2, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (248, 'Vinyl', 'A', 'Coleman, Ornette ', 'Peace', '', 3, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (248, 'Vinyl', 'B', 'Coleman, Ornette ', 'Focus On Sanity', '', 1, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (248, 'Vinyl', 'B', 'Coleman, Ornette ', 'Congeniality', '', 2, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (248, 'Vinyl', 'B', 'Coleman, Ornette ', 'Chronology', '', 3, false);


-- 429, Another Green World
UPDATE interpret SET wikipedia = "https://en.wikipedia.org/wiki/Brian_Eno" WHERE iname = "Eno";
INSERT INTO solist (iname, gebdatum) VALUES ("Eno", '1948-05-15');
UPDATE album SET pjahr = 1975, discogs = "https://www.discogs.com/Eno-Another-Green-World/release/116525", atyp = "Studio" WHERE aid = 429;
INSERT INTO genre (gbez) VALUES ("Electronic");
INSERT INTO albumgenre (gbez, aid) VALUES ("Electronic", 429);

INSERT INTO song (iname, stitel) VALUES ("Eno", "Sky Saw");
INSERT INTO song (iname, stitel) VALUES ("Eno", "Over Fire Island");
INSERT INTO song (iname, stitel) VALUES ("Eno", "St. Elmo's Fire");
INSERT INTO song (iname, stitel) VALUES ("Eno", "In Dark Trees");
INSERT INTO song (iname, stitel) VALUES ("Eno", "The Big Ship");
INSERT INTO song (iname, stitel) VALUES ("Eno", "I'll Come Running");
INSERT INTO song (iname, stitel) VALUES ("Eno", "Another Green World");
INSERT INTO song (iname, stitel) VALUES ("Eno", "Sombre Reptiles");
INSERT INTO song (iname, stitel) VALUES ("Eno", "Little Fishes");
INSERT INTO song (iname, stitel) VALUES ("Eno", "Golden Hours");
INSERT INTO song (iname, stitel) VALUES ("Eno", "Becalmed");
INSERT INTO song (iname, stitel) VALUES ("Eno", "Zawinul/Lava");
INSERT INTO song (iname, stitel) VALUES ("Eno", "Everything Merges With The Night");
INSERT INTO song (iname, stitel) VALUES ("Eno", "Spirits Drifting");

-- INSERTs INTO Table: songv
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Eno', 'Sky Saw', '', '00:03:27', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Eno', 'Over Fire Island', '', '00:01:51', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Eno', "St. Elmo's Fire", '', '00:03:01', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Eno', 'In Dark Trees', '', '00:02:32', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Eno', 'The Big Ship', '', '00:02:37', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Eno', "I'll Come Running", '', '00:03:50', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Eno', 'Another Green World', '', '00:01:42', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Eno', 'Sombre Reptiles', '', '00:02:23', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Eno', 'Little Fishes', '', '00:01:32', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Eno', 'Golden Hours', '', '00:04:00', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Eno', 'Becalmed', '', '00:03:55', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Eno', 'Zawinul/Lava', '', '00:02:56', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Eno', 'Everything Merges With The Night', '', '00:04:03', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Eno', 'Spirits Drifting', '', '00:02:47', null);

INSERT INTO tontr (aid, medium, seite) VALUES (429, 'Vinyl', 'A');
INSERT INTO tontr (aid, medium, seite) VALUES (429, 'Vinyl', 'B');
-- INSERTs INTO Table: ttracklist
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (429, 'Vinyl', 'A', 'Eno', 'Sky Saw', '', 1, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (429, 'Vinyl', 'A', 'Eno', 'Over Fire Island', '', 2, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (429, 'Vinyl', 'A', 'Eno', "St. Elmo's Fire", '', 3, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (429, 'Vinyl', 'A', 'Eno', "In Dark Trees", '', 4, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (429, 'Vinyl', 'A', 'Eno', 'The Big Ship', '', 5, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (429, 'Vinyl', 'A', 'Eno', "I'll Come Running", '', 6, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (429, 'Vinyl', 'A', 'Eno', 'Another Green World', '', 7, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (429, 'Vinyl', 'B', 'Eno', 'Sombre Reptiles', '', 1, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (429, 'Vinyl', 'B', 'Eno', 'Little Fishes', '', 2, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (429, 'Vinyl', 'B', 'Eno', 'Golden Hours', '', 3, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (429, 'Vinyl', 'B', 'Eno', 'Becalmed', '', 4, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (429, 'Vinyl', 'B', 'Eno', 'Zawinul/Lava', '', 5, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (429, 'Vinyl', 'B', 'Eno', 'Everything Merges With The Night', '', 6, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (429, 'Vinyl', 'B', 'Eno', 'Spirits Drifting', '', 7, false);

-- 451, Back to Black
UPDATE interpret SET wikipedia = "https://en.wikipedia.org/wiki/Amy_Winehouse" WHERE iname = "Winehouse, Amy ";
INSERT INTO solist (iname, gebdatum) VALUES ("Winehouse, Amy ", '1983-09-14');
UPDATE album SET pjahr = 2006, discogs = "https://www.discogs.com/Amy-Winehouse-Back-To-Black/release/825438", atyp = "Studio" WHERE aid = 451;
INSERT INTO albumgenre (gbez, aid) VALUES ("Pop", 451);

INSERT INTO song (iname, stitel) VALUES ("Winehouse, Amy ", "Rehab");
INSERT INTO song (iname, stitel) VALUES ("Winehouse, Amy ", "You Know I'm No Good");
INSERT INTO song (iname, stitel) VALUES ("Winehouse, Amy ", "Me And Mr Jones");
INSERT INTO song (iname, stitel) VALUES ("Winehouse, Amy ", "Just Friends");
INSERT INTO song (iname, stitel) VALUES ("Winehouse, Amy ", "Back To Black");
INSERT INTO song (iname, stitel) VALUES ("Winehouse, Amy ", "Love Is A Losing Game");
INSERT INTO song (iname, stitel) VALUES ("Winehouse, Amy ", "Tears Dry On Their Own");
INSERT INTO song (iname, stitel) VALUES ("Winehouse, Amy ", "Wake Up Alone");
INSERT INTO song (iname, stitel) VALUES ("Winehouse, Amy ", "Some Unholy War");
INSERT INTO song (iname, stitel) VALUES ("Winehouse, Amy ", "He Can Only Hold Her");
INSERT INTO song (iname, stitel) VALUES ("Winehouse, Amy ", "Addicted");

-- INSERTs INTO Table: songv
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Winehouse, Amy ', 'Rehab', '', '00:03:34', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Winehouse, Amy ', "You Know I'm No Good", '', '00:04:17', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Winehouse, Amy ', 'Me And Mr Jones', '', '00:02:33', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Winehouse, Amy ', 'Just Friends', '', '00:03:13', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Winehouse, Amy ', 'Back To Black', '', '00:04:01', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Winehouse, Amy ', 'Love Is A Losing Game', '', '00:02:35', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Winehouse, Amy ', 'Tears Dry On Their Own', '', '00:03:06', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Winehouse, Amy ', 'Wake Up Alone', '', '00:03:42', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Winehouse, Amy ', 'Some Unholy War', '', '00:02:22', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Winehouse, Amy ', 'He Can Only Hold Her', '', '00:02:46', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Winehouse, Amy ', 'Addicted', '', '00:02:45', null);

INSERT INTO tontr (aid, medium, seite) VALUES (451, "CD", "1");

-- INSERTs INTO Table: ttracklist
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (451, 'CD', '1', 'Winehouse, Amy ', 'Rehab', '', 1, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (451, 'CD', '1', 'Winehouse, Amy ', "You Know I'm No Good", '', 2, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (451, 'CD', '1', 'Winehouse, Amy ', 'Me And Mr Jones', '', 3, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (451, 'CD', '1', 'Winehouse, Amy ', 'Just Friends', '', 4, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (451, 'CD', '1', 'Winehouse, Amy ', 'Back To Black', '', 5, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (451, 'CD', '1', 'Winehouse, Amy ', 'Love Is A Losing Game', '', 6, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (451, 'CD', '1', 'Winehouse, Amy ', 'Tears Dry On Their Own', '', 7, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (451, 'CD', '1', 'Winehouse, Amy ', 'Wake Up Alone', '', 8, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (451, 'CD', '1', 'Winehouse, Amy ', 'Some Unholy War', '', 9, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (451, 'CD', '1', 'Winehouse, Amy ', 'He Can Only Hold Her', '', 10, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (451, 'CD', '1', 'Winehouse, Amy ', 'Addicted', '', 11, false);
