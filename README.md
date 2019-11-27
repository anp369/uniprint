# Uniprint

sh-skript zum Drucken über den eigenen PC an den Druckern im Pool der TF an der Uni Freiburg. 

## Installation
* Skript in einen Ordner kopieren, der im PATH enthalten ist
* ```.sh``` endung entfernen
* Skript als executable markieren
* im Skript die Variable ```USERNAME``` mit dem eigenen TF Benutzernamen beschreiben
* SSH-Key erzeugen und auf den login-server laden ```login.informatik.uni-freiburg.de```

## Beutzung
* In den Ordner navigieren, in dem die zu druckende Datei liegt
* ```uniprint -f <filename> -p <printer>``` ausführen
* Bei ausreichendem Quota wird die Datei gedruckt

#### Todo
* [ ]  Dateien von allen Pfaden drucken können
* [ ]  Quota abfragen