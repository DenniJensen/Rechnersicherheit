##3 Symmetrische Verschlüsselungsverfahren
* Alice (A) und Bob (B) wollen sicher kommunizieren
* Oskar (O) versucht, die Schutzziele zu brechen
  - passiver Angriff: Abhören von Daten
  - aktive Angriffe: Manipulationen (z.B. Fälschung) von Daten

            Oksar
    Alice -------------> Bob

Verschlüsselung: Schutzziel Vertraulichkeit(Verhindern des pass. Angriffs)
Symm. Verfahren: Schlüssel zum Ver- und Entschlüsseln sind gleich

###Wir lernen kennen: Block- und Stromchiffren
* Einsatz für sehr große Datenmengen: Effizient in Hard-/ Software
* Nutzung einfacher Grundfunktionen: x+or, Listenauswertung

####Blockchiffren: Konstruktionsprinzip nach Shammon(1948):
Eine Blockchiffre ist eine Abb. F: {0,1}^n x{0,1}^m -> {0,1}^n (Klartext +
Schlüssel -> Geheimtext)
* Zunächst nur für kleine Nachrichten
  (z.B. x ee {0,1}^128, n = 128)
* Diese Bitlänge heißt auch Blockgröße
* für längere Nachrichten: Betriebsmodi (Modes of Operation)

Grundbausteine:
Substitution, Permutation(Umsetzungsliste)
Schlüsseladd. x+or

#####Permutation: (Blockgröße 128 Bit)
* Spezielle lineare Abbildungen P: {0,1}^128 -> {0,1}^128
* Eff. Implementierung: 128 - Tupel x = (x1,..., x128) wird mittels einer
  bijektiven Abb. Pi: {1,..., 128} -> {1,..., 128} zu (x_Pi(1), X_Pi(2), ...,
  x_pi(128)) permutiert. (Listenauswertung)

#####Substitution:
* Nichtlinerare Ab. S: {0,1}^128 -> {0,1}^128
* Implementierung als array über dem gesamten Bereich nicht möglich (2^128)
* Beschränkung auf Teilblöck der Länge 8 oder 16 Bit und parallele Ausführung
  (S = S-Box x S-Box x ... x S-Box x)
Interpretiere Bitstrings der Länge
  - 8 als Zahlen 0,1..., 2^8 - 1 = 255
  - 16 als Zahlen 0,1..., 2^16 - 1 = 65535


######Erreichen zweier Ziele:
1. Diffusion (Durchmischung): Permutation
2. Konfusion (Kompexität/Nichtlinearität): S-Box

Wiederholtes Anwenden von Diffusion und Konfusion erhöht die Sicherheit
Substitutions-Permutationsnetzwerk Bsp.: AES

#####Betriebarten:
Bisher nur Verlüsselung von Nachrichten der Länge n(128)
Für längerer Nachrichten:
  * Teilung der Nachricht in Blöcke der Länge n (Blockgröße)
  * Wenn letzter Block zu klein: Auffüllen(Padding)
**Electronic Code Book(ECB)**

#####Nachteil
Gleiche Klartextblöcke führen zu gleichen Geheimtextblöcken.

#####Also:
n-ter Gehimtextblock sollte nicht nur vom n-ten Klartextblock und Schlüssel
abhängen, sondern von einem dritten Wert

######Cipher Block Haining(CBC):
Weiterer Wert: (n-1)-ter Geheimblock

######Counter Mode (Ctr):
Weiterer Wert: Zähler

Nutzung der Blockchiffren als Pseudozufallszahlengenerator "Approximation der
Sicherheit des OTP (One time pad)"

####Stromchiffren
* Erzeuge aus Schlüssel k ee {0,1}^n pseudozufälligen Schlüsselstrom
* Schlüsselstrom wird komponentenweise mit Klartext addiert

#####Frage: Welche Bedingungen muss ein PRNG erfüllen?

