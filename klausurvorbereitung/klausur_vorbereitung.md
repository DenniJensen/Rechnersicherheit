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
