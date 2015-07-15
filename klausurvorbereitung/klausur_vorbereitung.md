##Grundlagen

###Schutzziele

* Vertraulichkeit
* Integrität (Authentizität, Nichtabstreitbarkeit)
* Verfügbarkeit

###Schutz von Daten

1. Ermittlung des Geltungsbereich (welche Daten)
2. Ermittlung des Schutzbedarf (Schutzziele)
3. Analyse der Gefährdungen
  * Gefahr: Schaden mit gewisser Wkeit (Hochwasser, Pest)
  * Bedrohung: potentielle Gefahren (Hochwasser an der Oder)
  * Gefährdung: Betrohung trifft auf Schwachstelle (niedrige Deiche)
  * Mögliche Schwachtelle (Innentäter, Fehler in Software)
4. Risikoanalyse
  * Risiko = Eintrittswahrscheinlichkeit x Schaden
  * Ermittlung der Eintrittswahrscheinlichkeit
    - Wissen um Schwachstellen, Motivation Angreifer
5. Auswahl von Schutzmaßnahmen

##Kryptologie

Kryptologie = Kryptographie (Verschüsseln, Auth ...) + Kryptoanalyse (Schwächen
ausnutzen, Beurteilen)

**Kerckoffsche Prinzipien**

1. Wenn System nicht theoretisch beweisbar sicher -> sollte praktisch sicher
   sein (nicht berechenbar)
2. Design eines Systems sollte keine Geheimhaltung erfordern (no security by
   obscurity)

###Verschlüsselung

nach kerckoff 2: Sicherheit hängt von Geheimhaltung des Schlüssels

Absolut sicher: One Time Pad -> Schlüssel so groß wie Klartext

**Satz 2.1**

Ein Chiffriersystem kann nur dann absolut sicher sein (d.h. gegenüber einem
idealisierten Angreifer, der über unbeschränkte Ressourcen verfügt), wenn
die eingesetzte Schlüssellänge genauso groß ist wie der zu verschlüsselnde
Klartext (genauer Informationsgehalt des Klartextes).

**Sicherheit**

* Sicherheitsniveau n Bit: Angreifer zum Berechnen 2^n Versuche
  - Schlüsselexhaustion (>= 2^n verschiedene Schlüssel)
  - andere kryptonlytische Mehtoden (statistische Angriffe)
* heute gefordertes Sicherheitsniveau 128 Bit
* primär abhängig von der Stärke des Algo
* Faktoren: Implementiereung, Hintergrundsysteme

(Zeit Sonne -> Nova 2^55 Sekunden, Alter der Erste 2^55 Sekunden, Alter des
Universums 2^59 Sekunden)

Bei 2.000.000.000 etwa 2^32 Versuchen pro Sekunde

2^128 / 2^31 = 2^97 Sekunden

####Symmetrische Verschlüsselung

#####Blockchiffren

* Permutatitonen
* Substitutionen
* Schlüsseladdition (xor)

**Electronic Code Book (ECB)**

Plaintext -> Block Cipher (Schlüssel) -> GT

* Für Text länger als Schlüssel, Text aufteilen
* Nachteil: gleicher KT -> gleicher GT

**Cipher Block Chaining**

* Plaintext -> xor IV/GT-1 -> Block Cipher (Key) -> Ciphertext

* Initialvector für ersten Block, sonst geheimtext des vorherigen Blocks

**Counter Mode**

Nounce || Counter -> Block Cipher (key) -> xor Plaintext -> GT

**Stromchiffren**

Schlüssel -> Pseudozufallszahlengenertor -> xor Klartext -> GT


####Asymmetrische Verschlüsselung

Public key / Secret key, sk nicht aus pk berechenbar

#####RSA-Verfahren (Rivest, Shamir, Adleman)

* Faktorisierung ganzer Zahlen (n = p * q element N, p, q prim)

**unmodifizierte RSA**

* RSA ist deterministisch, Angreifer rät KT, mit pk verschl und vergleichen

**IND-CPA sicher**

Angreifer hat bei zwei KT  nur eine Chance von 1/2 durch Raten den richtigen zu
erhalten

**OAEP, Optimal aszmmetric encription padding**

* RSA mit OAEP ist IND-CPA sicher wenn H und G Einwegfunktionen

#####Elgamal

* Sicherheit: Vermutete Schwierigkeit des diskreten Logarithmusproblm

####Hybride Verschlüsselung

* Bob nutzt RSA und Alice nicht AES

###Hashfunktionen

* Einwegfunktion, H effizient berechenbar, Umgekehrt nicht
* Schwach Kollisionsresitenz: schwer bestimmte Kollision finden
* starke Kollisionsresitenz: schwer allgemeine Kollision finden

**Hashfunktion**

* {0,1}^* -> {0,1}^n
* Sicherheitsniveau 100 Bit, n > 200


###Datenauthentisierung

####Message Authentication Coded (MAC symmetrische Verfahren)

* Kein Schutzziel Nichtabsteitbarkeit (selber Schlüssel)

Sichere MAC

* CMAC: basiert auf Blockchiffren (C=Chiffre)
* HMAC: basiert auf Hashfkt

* verschiedene Schlüssel für Verschlüsselung und Authentisierung
* erst verschlüsseln, dann verschlüsselte Daten authentisieren

####Signarturverfahren

* Prüfsumme aus geheimen Schlüssel
* prüfen mit öffentlichn Schlüssel

* RSA-Signatur
  - nur m < n können signiert werden
  - m zunächst gehasht, signiert und geprüft


##### Digital Signature Algorithm (DSA)

* basiert auf diskreten Logarithmusproblems
* probabilistitscher Algorithmus, jede Signatur ein Zufall

**Schlüsselgenerierung**

**Signaturerzeugung**

**Signaturverifikation**

#####Elliptische Kurven Kryptographie (ECC)


###Vertrauensmodelle

####Direct Trust

####Web of Trust

####Hierachical Trust

#####Public Key Infrtrukturen

**Registration Authority**

**Certification Authority**

**Zurückziehen von Zertifikation**


###Komplexitätstheorie und Kryptologie

det Alg A -> ein Berechnungsweg -> Augabe A(x)
nichtdet Alg A -> mehrere mögliche Berechnungswege -> Ausgabe abhängig vom Weg
det Alg mit rand Eingabe -> ein Berechnungsweg -> Ausgabe abhängig von rand
Eingbe

###Schlüsseleinigung, Schlüsselaustausch

Ziel: sicherer Austausch von SChlusse über unsichere Kanäle


####Diffie-Hellman

* A Parameter (g,p)
* B Parameter (g,p)
* A choose random x, X = g^x mod p, send X to B
* B choose random y, Y = g^y mod p, compute X^y = (g^x)^y = g^xy mod p, send Y
  to A
* A compute Y^x = (g^y)^x = g^xy mod p

#####Sicherheit

* x und y nur über log_y g^x oder log_x g^y bestimmbar
* Forward Securecy, immer neue x,y (z.b. tls, DHE)

#####Angriffe

* Man-in-the-Middle (Lösung Authentisieren der Schlüsselteile)

#####SPEKE (Simple Pssword Exponential Key Exchange)

* g wird aus einen gemeinsamen Password und einer Hashfunktion berechnet


####Needham-Schroeder-Protokoll

* Symmetrische Version benötigt Authentifizierungsserver

* A send Nounce to AS
* AS berechnet T_A und T_B
* As schickt T_A zu A und T_B zu B
* A dec T_A
* B Schickt T_BA zu A
* A schickt T_AB zu B
* Da Nounce von B in T_AB weiß B das es richtig ist

* Replay Attacke durch Nonce verhindert

###Deterministische Zufallszahlengeneratoren

* Entropie kann durch det. Nachbearbeitung nicht erhöht werden

* Seed -> xor -> Hashfunktion -> mehrmals zu xor -> Hashfunktion -> Zufallswert
* Sichere Blockchiffre im Counter-Mode

####Seedgenerierung

* Linux /dev/random, Nutzt verschiedene Ereignisse wie Systemzeit und
  Nutzeraktivitßt
* Windows Kommbination verschiedener Systemaufrufe
  - ReadTimeStampCounter: 2^30 verschiedene Werte pro Sek
  - KeQuerySystemTime: 2^23 verschiedene Werte pro Sek


###Instanzauthentisierung

* Wissen (Passwort)
* Besitzt (Schlüssel auf Chipkarte)
* Eigenschaft (Biometrie) Fingerabdruck, Iris

####Faktor Wissen (Benutzername/Password)

* Nachteile: Ausspähen (Phishing, Keyloggen) -> Replay-Attacken,
  Man-in-the-Middle
* Verbesserung: Einmalpasswörter

#####Passwortlisten

* TAN, Challenge-Response
* Prüfer wählt index i -> Beweisender(Liste) i-tes Passwort

#####Passwortgeneratoren

**Zeitgesteuerte**

* Google Authenticator, nur im Zeitintervall gültig

**Ereignisgesteuerte**

* Lamport-Hash, basiert au einer krypto Hashfunktion mit Zufallswert
* Problem nach N Passwörtern kommen gleiche, Lösung neuen Zufallswert

#####Challenge-Response

* A und B haben Schlüssel k
* Prüfer B choose random c, send c to Beweisender A
* A r = MAC(k,c), send r to B
* B r' = MAC(k,c), check if r' = r


**Einmal Passwörter**

* Sicher gegen Ausspähen, Verhindert Replay-Attacken


####Faktor Wissen

**Sicherheitselemente**

* Nutzung Sicherer Hardware geschützt gegen

* physikalische Angriffe (bohren, fräsen)
* elektrische Angriffe (mehr Strom, als Spez. erlaubt)
* Angrifffe mit Licht und Laser

####2 Faktor Authentisierung

* Besitz (Sicherheitselement) und Wissen (PIN)
* Challenge-Response

####Biometrie

* Angriff auf die Sensoren und Programme der Messelemente


##Zugriffskontrolle

Authentisierung (Subjekt behauptet Identität) -> Authentifizierung (Identität
wird geprüft) -> Autorisierung (darf Subjekt auf Objekt zugreifen) -> Zugriff

* Reference Moinitor: Setzt das Sicherheitsmodell um

**Zugriffsmatrix**

**Access Control List**

* Speicherung der Rechte der Subjekte beim Objekt

**Capabiities**

* Speicherung der Rechte an Objekten beim Subjekt

* Vorteile: Transparent, leicht verifizieren
* Nachteil: Schlecht skalierbar

* Abtraktionen: Gruppen, negative Zugriffsrechte, Protection Ring

**Safety Problem**

Gegeben ein Sicherheitsmodell, eine (initiale) Zugriffsmtrix M und ein
Zugriffrecht r. Die Entscheidung, ob M sicher in Bezug auf r ist, ist
unentscheidbar.

Es ist entscheidbar, wenn jedes Kommando nur eine Basisoperation ausführt (mono-operational)

###Bell LaPadula

* erweiterung der Matrixmodell um Systembestimmte Eigenschaften

####einfaches

* Sicherheitsmarken (unklassifiziert, vertraulich, geheim, streng geheim) <=
  Ordnung

**Zugriffskontrolle**

1. Kontrolle der Zugriffe über Zugriffsmatrix
2. no read-up read m => cl(o) <= cl(s)
3. no write-down write m => cl(s) <= cl(o)
4. Strong Tranquility Property: nur vertrauenswürdige Personen dürfen cl ändern

**Problem: Need-to-Know-Prinzip**

* Lösung: Festlegung von Zuständigkeitsbereichen
* Sicherheitsmarke und Zuständigkeitsbereich (SM X Z, <=) geordnet

**Problem: kein Schreiben von oben nach unten**

* Lösung: zeitlich beschränkte untere Sicherheitsklasse

**Problem: kein Integritätsschutz**

* Schreiben nach oben erlaubt (überschreiben)  *-property

**Problem: verdeckte Informationskanäle**

* Dateinamen, Antwortzeiten usw...


###Chinese Wall

* Beraterunternehmen

##Informationsfluss

###Compiler based Mechanismen

* expliziter: y =x
* impliziter: if Anweisung
* verdeckter: Laufzeit einer Schleife,z.b bei Verschlüsselung

* Kanäle durch gemeinsam genutzten Resourcen

**verhindern von Känalen**

* Isolation: VM, Sandbox
* Zufall nutzen


##Softwaresicherheit

####Heathbleed

###Benutzereingaben

**UTF-8 Decoding (MS)**

**rlogin**

**SQL Injection**

**Stack overflow**

**Race Conditions: Starbucks**

##Internetsicherheit

* Typ 1: Zugang zu Zwischenknoten
  - passiver Angriff (ausspähen)
  - aktiver Angriff (manipulation)
* Typ 2: versuch auf Endknoten (client) zuzugreifen
  - eindringen ins lokale Netz
  - Störung von Funktionsfähigkeit
* Typ 3: bösartiger Endknoten (Server)
  - Identität eines vertrauenswürdigen Server annehmen

###Kommunikationssicherheit Typ 1

####TLS

* Symmetrische Verschlüsselung der Nutzlast
* Datenauthentisierung der Nutzlast
* Handshake

####IPSec

* Authentication Header: Nur Datenauth
* Encapsulating Security Payloads (ESP): Verschl., Datenauth

#####Internet Key Exchange Protokoll

#####ESP

* Transportmodus: Direkte Verbindung von Host to Host
* Transportmodus: Verbindung zwichen Security Gateways (VPN)

###Netzwerksicherheit Typ 2

* TCP Hijacking

####Firewall

* Paketfilter: IP- und TCP Header (Port, Adresse) analysiert
* Zustandsgesteuerte Filter: Zulassen von S -http-> C wenn vorab C -http-> S
* Proxy-Filter: Proxy gegenüber S als C und gegenüber C als S
  - komplex, damit Ziel von Angriffen
* Application-Filter: Layer 7, Nutzlast analyse
  - Vorteil: bessere Analyse
  - Nachteil: Komplex, potentielle Schwachstelle
  - Lösung: Analyse in gesicherter Umgebung

####DNS

* Client -> Resolver
* Resolver -> Rootserver
* Resolver -> Toplevel Domain Server
* Resolver -> DNS
* Resolver -> Client

#####DNS Cache Poising

**Dan Kaminsky-Attacke**


###Websicherheit Typ 3

* Sicherheitsstrategie: Same Origin Policy

####DNS Rebinding

####Cross Site Scripting

####Cross Site Request Forgery
