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

INSERT INTO albumgenre (gbez, aid) VALUES ("Rock", 21);

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
INSERT INTO song (iname, stitel) VALUES ("Berry, Chuck", "Reelin' And Rockin'");
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


-- 144, Straight Outta Compton


INSERT INTO song (iname, stitel) VALUES ("N.W.A.", "Straight Outta Compton");
INSERT INTO song (iname, stitel) VALUES ("N.W.A.", "_ _ _ _ Tha Police (Fill In The Blanks)");
INSERT INTO song (iname, stitel) VALUES ("N.W.A.", "Gangsta Gangsta");
INSERT INTO song (iname, stitel) VALUES ("N.W.A.", "If It Ain't Ruff");
INSERT INTO song (iname, stitel) VALUES ("N.W.A.", "Parental Discretion Iz Advised");
INSERT INTO song (iname, stitel) VALUES ("N.W.A.", "Express Yourself");
INSERT INTO song (iname, stitel) VALUES ("N.W.A.", "Compton's N The House (Remix)");
INSERT INTO song (iname, stitel) VALUES ("N.W.A.", "I Ain't Tha 1");
INSERT INTO song (iname, stitel) VALUES ("N.W.A.", "Dopeman (Remix)");
INSERT INTO song (iname, stitel) VALUES ("N.W.A.", "Quiet On Tha Set");


-- 248, The Shape of Jazz to Come

INSERT INTO song (iname, stitel) VALUES ("Coleman, Ornette ", "Lonely Woman");
INSERT INTO song (iname, stitel) VALUES ("Coleman, Ornette ", "Eventually");
INSERT INTO song (iname, stitel) VALUES ("Coleman, Ornette ", "Peace");
INSERT INTO song (iname, stitel) VALUES ("Coleman, Ornette ", "Focus On Sanity");
INSERT INTO song (iname, stitel) VALUES ("Coleman, Ornette ", "Congeniality");
INSERT INTO song (iname, stitel) VALUES ("Coleman, Ornette ", "Chronology");

-- 429, Another Green World

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

-- 451, Back to Black

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
