# Banco

Projekt für die Datenbanken Vorlesung an der Univeridad Nacional del Sur in Argentinien. Dieser ist der dritte Teil der Projekt, der aus drei Teilen bestand. In den ersten zwei Phasen haben wir die DB-Table erstellt und die Testdaten erzeugt. Jetzt sollten wir eine Java GUI-App ergänzen. Die GUI wurde schon von den Lehrenden entwickelt. Unsere Aufgabe war, die Daten von der Datenbank zu sammeln, damit sie in der GUI gezeigt können würden.

## Die Datenbank
In der Datei [banco.sql](/sql/banco.sql) wurde die DB erstellt, die dem folgenden Diagramm entspricht:

![Diagramm](/doc/diagramm.png)

Die DB simulierte ein Bank.

Die Testdaten finden Sie in der [Datei](/sql/datos.sql)

## Testen Sie das Projekt

Wir haben mit MySQL gearbeitet. Man kann auf jeden Fall das DB-System in der [Configuration-Datei](/cfg/conexionBD.properties) ändern.

Nach der Zugang in MySQL sollten Sie die DB erstellen:

`mysql> source /path/to/the/project/sql/banco.sql`

Dann die Testdaten:

`mysql> source /path/to/the/project/sql/datos.sql`

Wenn alles OK ist, dann können Sie das Projekt compilieren und testen. Testdaten für das Login sind:

- Numero de tarjeta: 1
- Passwort: 1