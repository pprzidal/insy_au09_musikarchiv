USE musikarchiv2020;
-- My numbers are: [21, 144, 248, 429, 451]

-- 21, 'The Great Twenty-Eight', 'Berry, Chuck '
INSERT INTO genre (gbez) VALUES ('Rock');
INSERT INTO genre (gbez) VALUES ('Electronic');
INSERT INTO genre (gbez) VALUES ('Funk / Soul');
INSERT INTO genre (gbez) VALUES ('Pop');

UPDATE interpret SET wikipedia = "https://de.wikipedia.org/wiki/Chuck_Berry" WHERE iname = "Berry, Chuck";
INSERT INTO solist (iname, gebdatum) VALUES ("Berry, Chuck", '1926-10-18');
UPDATE album SET pjahr = 1982, discogs = "https://www.discogs.com/Chuck-Berry-The-Great-Twenty-Eight/master/163706", atyp = "Studio" WHERE aid = 21;

INSERT INTO albumgenre (gbez, aid) VALUES ("Rock & Roll", 21);

-- siehe Java Programm
INSERT INTO song (iname, stitel) VALUES ("Berry, Chuck", "Maybellene");
INSERT INTO song (iname, stitel) VALUES ("Berry, Chuck", "Thirty Days");
INSERT INTO song (iname, stitel) VALUES ("Berry, Chuck", "You Can't Catch Me");
INSERT INTO song (iname, stitel) VALUES ("Berry, Chuck", "Too Much Monkey Business");
INSERT INTO song (iname, stitel) VALUES ("Berry, Chuck", "Brown-Eyed Handsome Man");
INSERT INTO song (iname, stitel) VALUES ("Berry, Chuck", "Roll Over Beethoven");
INSERT INTO song (iname, stitel) VALUES ("Berry, Chuck", "Havana Moon");
INSERT INTO song (iname, stitel) VALUES ("Berry, Chuck", "School Days");
INSERT INTO song (iname, stitel) VALUES ("Berry, Chuck", "Rock And Roll Music");
INSERT INTO song (iname, stitel) VALUES ("Berry, Chuck", "Oh Baby Doll");
INSERT INTO song (iname, stitel) VALUES ("Berry, Chuck", "Reelin' And Rockin&#39;");
INSERT INTO song (iname, stitel) VALUES ("Berry, Chuck", "Sweet Little Sixteen");
INSERT INTO song (iname, stitel) VALUES ("Berry, Chuck", "Johnny B. Goode");
INSERT INTO song (iname, stitel) VALUES ("Berry, Chuck", "Around And Around");
INSERT INTO song (iname, stitel) VALUES ("Berry, Chuck", "Carol");
INSERT INTO song (iname, stitel) VALUES ("Berry, Chuck", "Beautiful Delilah");
INSERT INTO song (iname, stitel) VALUES ("Berry, Chuck", "Memphis");
INSERT INTO song (iname, stitel) VALUES ("Berry, Chuck", "Sweet Little Rock And Roller");
INSERT INTO song (iname, stitel) VALUES ("Berry, Chuck", "Little Queenie");
INSERT INTO song (iname, stitel) VALUES ("Berry, Chuck", "Almost Grown");
INSERT INTO song (iname, stitel) VALUES ("Berry, Chuck", "Back In The USA");
INSERT INTO song (iname, stitel) VALUES ("Berry, Chuck", "Let It Rock");
INSERT INTO song (iname, stitel) VALUES ("Berry, Chuck", "Bye Bye Johnny");
INSERT INTO song (iname, stitel) VALUES ("Berry, Chuck", "I'm Talking About You");
INSERT INTO song (iname, stitel) VALUES ("Berry, Chuck", "Come On");
INSERT INTO song (iname, stitel) VALUES ("Berry, Chuck", "Nadine");
INSERT INTO song (iname, stitel) VALUES ("Berry, Chuck", "No Particular Place To Go");
INSERT INTO song (iname, stitel) VALUES ("Berry, Chuck", "I Want To Be Your Driver");
