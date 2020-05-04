USE musikarchiv2020;

-- Nr.: 3 which would correspond to Adele

UPDATE interpret SET wikipedia = "https://de.wikipedia.org/wiki/Adele_(S%C3%A4ngerin)" WHERE iname = "Adele";

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

INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Adele', 'Rolling In The Deep', '', '00:03:49', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Adele', 'Rumour Has It', '', '00:03:43', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Adele', "I'll Be Waiting", '', '00:04:01', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Adele', 'Lovesong', '', '00:05:16', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Adele', 'One And Only', '', '00:05:48', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Adele', 'Someone Like You', '', '00:04:47', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Adele', "Don't You Remember", '', '00:04:03', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Adele', 'Turning Tables', '', '00:04:10', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Adele', 'Set Fire To The Rain', '', '00:04:01', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ("Adele", "He Won't Go", '', '00:04:38', null);
INSERT INTO songv (iname, stitel, svers, sdauer, gbez) VALUES ('Adele', 'Take It All', '', '00:03:48', null);
