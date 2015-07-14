Computer im lokalen Netz verbunden mit Router - Internet

Wie Computer schützen? (Daten die verarbeitet werden schützen)

Schutz von innerhalb des Netzwerkes, nur Authorisierte Personen dürfen zugreifen

Schutz von innen durch Zugriffskontrolle, Informationsfluss, verdeckte Kanäle,
Softwaresicherheit

Schutz von außen Internetsicherheit, Firewalls

* Schutzziele
  - Vertraulichkeit
  - Integrität
  - Verfügbarkeit

##Basistechnologie Kryptographie

* Sicherheitsniveau, One Time Pad OTP
* Symmetrische Verfahren (Block und Stromchiffren, Hashfunktionen, MAC)
* Asymmetrische Verfahren (Verschlüsselung (RSA, Elgamal), Signaturverfahren
  (RSA, DSA)), Schlüsseleinigungsverfahren (Diffie-Hellman, Needham-Schröder)
  - Attacken
* Infrastrukturen (PKI, Web of Trust, Direkt Trust N*(N-1) /2)
* Secret Sharing, Zufallszahlengeneratoren

##Verwenden der Basistechnologien

* Instanzauthentisierung (Wissen (Passwörter), Besitz (Chipkarten), Eigenschaften(Biometrie {gesunden Menschenverstand}))
  - Challenge-Response (Passwörter, Besitz)
* Zugriffskontrolle: Setz Sicherheitspolitik durch (wer darf was)
  - Matrix Access Control (Subjekt darf auf Objekt ...)
    - Access Control List (Zeilen (an Objekten))
    - Capability List (Spalten (an Subjekte))
    - Gruppen
    - Unterschied zwischen Benutzerbestimmbare und Systembestimmbare Rechtevergabe
      - Bell LaPadula, Chinese Wall, Biba (Systembestimmbare)
  - Umsetzung von Zugriffskontrolle im Programm
    - direkter und indirekter Informationsfluss
    - verdeckte Kanäle
* Softwaresicherheit: Interpretationen, Injektions (Eingabe prüfen),
  Stackoverflow, Bufferoverflow
* Internetsicherheit
  - Angreifer Typ 1: TLS, IPSec (welche Verfahren werden verwenden, nicht genauen ablauf)
  - Angreifer Typ 2: TCP Hijacking, DNS, Firewalls
  - Angreifer Typ 3: Same Origin Policy (SOP) aushebeln
    - XSC

##Bewertungskriterien (nicht behandelt)

Sicherheit von Produkten (Wie kann ich sicher sein, dass z.b Router tut was er sagt)

* Common Criteria
- Sicherheitsfunktionalität : Qualität der Umsetzung
  - Protection Profile (Sicherheitsbetrachtung für das Produkt)

IT-Sicherheitsmanagement: Beurteilung der Gesammt-Infrastruktur

**IT-Sicherheitskonzept**

1. IT-Strukturanalyse (Daten -> Anwendungen -> IT-Komponenten, Netze ->
  Räumlichkeiten der Komponenten)
2. Schutzbedarfanalyse (was passiert bei Brechen eines Schutzzieles)
3. Gefährdungsanalyse
4. Risikoanalyse (Rsiko = Schadenhöhe x Eintrittswkeit)
5. Auswahl von Schutzmaßnahmen

* Umsetzen des Sicherheitskonzept und Kontrollieren dauerhaft

**Kategorien von Schadenshöhen und Eintritswkeit**

* mittel (1)
* hoch (2)
* sehr hoch (3)

Risiko 1 ... 3
