USE musikarchiv2020;

-- Nr.: 3 which would correspond to Adele
-- 3BHIT => 2, k.Nr.: 17 => 2170 - 2179

UPDATE interpret SET wikipedia = "https://de.wikipedia.org/wiki/Adele_(S%C3%A4ngerin)" WHERE iname = "Adele";
INSERT INTO solist (iname, gebdatum) VALUES ("Adele", '1988-05-05');
INSERT INTO album (aid, discogs, atitel, atyp, pjahr) VALUES (2170, "https://www.discogs.com/Adele-21/release/2664589?ev=rr",  "21", "Studio", 2011);
INSERT INTO albumgenre (gbez, aid) VALUES ("Pop", 2170);

INSERT INTO song (iname, stitel) VALUES ("Adele", "Rolling In The Deep");
INSERT INTO song (iname, stitel) VALUES ("Adele", "Rumour Has It");
INSERT INTO song (iname, stitel) VALUES ("Adele", "Turning Tables");
INSERT INTO song (iname, stitel) VALUES ("Adele", "Don't You Remember");
INSERT INTO song (iname, stitel) VALUES ("Adele", "Set Fire To The Rain");
INSERT INTO song (iname, stitel) VALUES ("Adele", "He Won't Go");
INSERT INTO song (iname, stitel) VALUES ("Adele", "Take It All");
INSERT INTO song (iname, stitel) VALUES ("Adele", "I'll Be Waiting");
INSERT INTO song (iname, stitel) VALUES ("Adele", "One And Only");
INSERT INTO song (iname, stitel) VALUES ("Adele", "Lovesong");
INSERT INTO song (iname, stitel) VALUES ("Adele", "Someone Like You");

-- INSERTs INTO Table: songv
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Adele', 'Rolling In The Deep', '', '00:0', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Adele', 'Rumour Has It', '', '00:0', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Adele', 'Turning Tables', '', '00:0', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Adele', "Don't You Remember", '', '00:0', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Adele', 'Set Fire To The Rain', '', '00:0', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Adele', "He Won't Go", '', '00:0', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Adele', 'Take It All', '', '00:0', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Adele', "I'll Be Waiting", '', '00:0', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Adele', 'One And Only', '', '00:0', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Adele', 'Lovesong', '', '00:0', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Adele', 'Someone Like You', '', '00:0', null);

INSERT INTO tontr (aid, medium, seite) VALUES (2170, "Vinyl", "A");
INSERT INTO tontr (aid, medium, seite) VALUES (2170, "Vinyl", "B");

-- INSERTs INTO Table: ttracklist
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (501, 'Vinyl', 'A', 'Adele', 'Rolling In The Deep', '', 1, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (501, 'Vinyl', 'A', 'Adele', 'Rumour Has It', '', 2, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (501, 'Vinyl', 'A', 'Adele', 'Turning Tables', '', 3, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (501, 'Vinyl', 'A', 'Adele', "Don't You Remember", '', 4, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (501, 'Vinyl', 'A', 'Adele', 'Set Fire To The Rain', '', 5, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (501, 'Vinyl', 'A', 'Adele', "He Won't Go", '', 6, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (501, 'Vinyl', 'B', 'Adele', 'Take It All', '', 1, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (501, 'Vinyl', 'B', 'Adele', "I'll Be Waiting", '', 2, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (501, 'Vinyl', 'B', 'Adele', 'One And Only', '', 3, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (501, 'Vinyl', 'B', 'Adele', 'Lovesong', '', 4, false);
INSERT INTO ttracklist (aid, medium, seite, iname, stitel, svers, tracknr, bonus) VALUES (501, 'Vinyl', 'B', 'Adele', 'Someone Like You', '', 5, false);
