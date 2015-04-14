#1. Einführung und Grundbegriffe

###Informationen sind Schützenswerte Güter, z.B
* Velust des informationellen Selbstbestimungsrechts, Informationen über
  Krankheiten, Einkommen
* finanzielle Verluste: Geschätsgeheimnisse, Verträge, Zugangsdaten zum
  Online-Banking
* persönliche Unversehrtheit: Fehlfunktionen medizinischer ÜBerwachnugsgerate,
  Verkehsheitsysteme

Informationen haben untersheidliche Formen: gedacht, gesprochen, geschrieben.
Daten repäsentieren Informationen, z.b.
  * Bytefolge gespeichert auf Festplatte, Netzwerkpaket bei Übertragung über
    das Internet
Beurteilung der Sicherheit ausgehend von den Schütensorten Daten


###Sicherheit: Schutz vor negativen Konsequenzen aus
* berechtigten Handlungen( Funktionssicherheit(Safety) ) - Ist Funktionalität
  stimmt mit der spez. Soll-Funktionalität überein
* vorsätzliche Handlungen (Datensicherheit(Security)) - Resistenz gegenüber
  Angriffen(keine unautorisierte Gewinnung, Veränderung, Verbindung)

###Unser Ziel: Schutz von Daten hinsichtlich der Schutzziele
1. Vertraulichkeit: Daten sind nur autorisierten Personen zugänglich
2.1. Integrität: Daten sind vollständing und unverfälscht
2.2. Authentizität: + Erzeuger bekannt
2.3. Nichtabstreitbarkeit: + Erzeuger auch gegenüber Dritten nachweisbar
3. Verfügbarkeit: Daten sind (für autorisierte) Person jederziet zugänglich

Klassische CIA-Model (Confidentiality, Integrity, Availibility)

###Vorgehen zum Schutz der Daten
1. Ermittlung des Geltungsbereiches
  * Welche Daten müssen geschütz werden
  * Wo werden diese Daten verarbeitet, gespeichert, übertragen
    - Komponenten(Computer, Router, ...), Netze(Intranet, internet)

2. Ermittlung des Schutzbedarfs
  Welcher Schaden entsteht, wenn Schutzzile nciht erfüllt wird?
  * Wahrung von Geschäftsgeheimnissen (Vertraulichkeit)
  * Verbindlichkeit von Verträgen (Nichtabstreitbarkeit)
  Daten -> Komponenten -> Netze

3. Gefährdungsanalyse
  * Gefahr: Bei ungehinderten Verlauf Eintritt eines Schadens mit gewisser
    Warhscheinlichkeit (ohne räumlichen, personellen oder zeitlichen Bezug)
    - Hochwasser: Gewahr für Leib und Leben
    - Pest: Gewahr für Leib und Leben
  * Bedrohungen: sind potentielle Gefahren
    - Hochwasser ist eine Bedrohung an der Oder (nicht in Berlin)
    - Pest ist keine Bedrohung (Erreger ist ausgestorben)
  * Gefährdung: wenn eine Bedrohung auf eine Schwachstelle trifft
    - Bei zu niedrigen Deichen ist Hochwasser an der Oder eine Gefährdung
  * Mögliche Schwachstellen
    - Innentäter (Verringerung durch Need-to-Know Prinzip)
    - Fehler in Software: Heutige Betriebsysteme haben 100.000.000 Zeilen Code,
      Fehlerquote liegt bei 0.25%, Also ca. 250.000 potentiell ausnutzbare
      Fehler

4. Risikoanalyse:
  * Risiko = Eintrittswahrscheinlichkeit * Schadenshöhe
  * Ermittlung der Eintrittswkeit:
    - Wissen um Schwachstellen
    - Wissen um Motivation der Angreifer, Angreifertypen
  * White hacker: Aufdecken von Sicherheitslücken
  * Geheimdienste:
  * Unternehmen: Wirtschaftsspionage(teilw. unterstützt von Geheimd.)
  * Whistleblower
  * Cracker: stark professionalisierte Schattenwirtschaft
    - Fälschung von Pay TV-Karten

5. Auswahl von Schutzmaßnahmen
  Sicherheit ist in erster Linie Präfention, z.B.
  * Sicherheitsmerkmale auf Geldscheinen oder Pässen
  * Härtung von Computersystemen durch Penetrationstests
  * Verschlüsselung von Dokumenten, E-Mails
