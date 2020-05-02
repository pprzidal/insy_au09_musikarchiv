USE musikarchiv2020;

-- 21, 'The Great Twenty-Eight', 'Berry, Chuck '
INSERT INTO genre (gbez) VALUES ('Rock');
INSERT INTO genre (gbez) VALUES ('Electronic');
INSERT INTO genre (gbez) VALUES ('Funk / Soul');
INSERT INTO genre (gbez) VALUES ('Pop');

UPDATE interpret SET wikipedia = "https://de.wikipedia.org/wiki/Chuck_Berry" WHERE iname = "Berry, Chuck";
INSERT INTO solist (iname, gebdatum) VALUES ("Berry, Chuck", '1926-10-18');
UPDATE album SET pjahr = 1982, 
