# insy_au09_musikarchiv
Repo for the INSY Assignment "AU09 Abgabe DML "Musikarchiv 2019"

# Task
Das auf Moodle bereitgestellte DDL-Script soll um die restlichen Tabellen-Definitionen passend zum RM ergänzt
werden. Anschließend sollen die zu den drei Verlosungen passenden Daten recherchiert und ergänzt werden.

# „Topf 1“
Verlosung der 500 Alben aus „500 Greatest Albums“ (5 je SuS).
Zu den jeweils 5 gezogenen Alben sollen die bestehenden Daten in den Tabellen album und interpret
ergänzt werden d.h. die bestehenden Datensätze sollen mittels:
UPDATE interpret SET sp1 = wert1, sp2 = wert2… WHERE iname = zzzz;
UPDATE album SET sp1 = wert1, sp2 = wert2… WHERE aid = ccc;
geändert werden. Weiters sollen die Daten in den Tabellen song, songv, tontr, ttracklist
sowie ev. in den Tabellen genre, albumgenre, play, ptracklist um zusätzliche Daten mittels:
INSERT INTO tab (sp1, sp2…) VALUES (wert1, wert2…);
ergänzt werden.
# „Topf 2“
Verlosung von weiteren 100 von MARM vorgegebenen Interpreten (1 je SuS). Vorgehensweise ähnlich wie bei
„Topf 1“, aber hier kann (mindestens ein!) beliebiges Album zum gezogenen Interpreten eingefügt werden.
# „Topf 3“
Verlosung eines Anfangsbuchstabens bzw. weiterer Merkmale von Interpreten (1 je SuS). Vorgehensweise ähnlich
wie bei „Topf 1/2“, aber bitte Überschneidungen mit bereits bestehenden Interpreten vermeiden (d.h. nur noch
nicht in der DB vorhandene eigene Lieblings-Interpreten mit deren Songs/Alben einbringen!!!):
26 Buchstaben „männlicher Solist (international)“
26 Buchstaben „weiblicher Solist (international)“
26 Buchstaben „Band (international)“
26 Buchstaben „Interpret (aus Österreich)“
