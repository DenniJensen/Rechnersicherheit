##11 Instanzauthentisierung
B (Prüfer) kann die Identität von A (Beweisender) zweifelsfrei feststellen

Angreifer O versucht die Identität von A zu übernehmen (aktiver Angriff)

**Faktoren für Authentisierung**

* Wissen (Password, PIN)
* Besitz (z.B. kr. Schlüssel sicher gespeichert)
* Eigenschaften (biometrische Merkmale)
* Zeit, Ort ...

n-Faktor-Authentisierung:
* 1-Faktor-Auth: Nutzt nur ein Faktor, z.B Benutzername/ Password
* 2-Faktor-Auth: Nutzt zwei (verschiedene) Faktoren (Bankkarte/PIN)

###Faktor Wissen
typisches Beispiel Benutzername/ Password

**Nachteile**

Anfällig gegen Ausspähen (z.B. Phishing, Keylogging, Abhörn der Verbindung,
Replay-Attacken, MitM)

**Verbesserung**

Einmal-Passwörter
Beide Seiten müssen die Passwörter kennen.
Wir unterscheiden: Passwortlisten, Passwortgeneratoren

####Passwortlisten
Transaktionsnummern (TAN) im Online-Banking.
Beide Partner haben eine Liste mit Passwörtern

**Indizierte Auswahl des Passworten**

B gibt Nummer aus der Liste an.

B: Prüfer (Liste L)  |             |  A: Beweisender (Liste L)
----------------------| --------------|--------------------------
Wähle Index i        | ---i-->    | Sende i-tes Passwort P_i
(chalenge)           | <--P_i--   | (response)
Prüfe P_i|

Klassisches Challenge-Response-Protokoll

####Passwortgeneratoren
Ableitung von Passwörtern aus einem gemeinsamen Geheimnis (von A und B)

Kategorien
* zeitgesteuerte
* ereignisgesteuerte
* Challenge-Response Verfahren

**Zeitgesteuerte Generatoren**

z.B.: Google Authenticater
* key = g (vorab usgetauschtes Geheimnis)
* t = time (in Sekunden, Zeitpunkt der Authentisierung)
* message = t / 30 (Toleranzbereich, Zeitintervall 30 Sekunden)
* p = MAC(key, message) (Einmalpasswort für Zeitpunkt t)

**Ereignisgesteuert Generatoren**

im Skript, siehe mitschrift

**Challenge-Respnse Verfahren**

Vorab ausgetauschte Geheimnis ein symmetrischer Schlüssel k

B: Prüfer (k) | |                           A: Beweisende (k)
--------------|-|---------------------------------------------
Wähle Zufall c  |    -----c---->  |  Berechne r = MAC(k,c)
(Challenge)     |    <----r-----   | (Einmalpasswort, response)
Berechne r' = MAC (k,r) |
Prüfe r' = r |

Alternative: Nutze ein (asymm.) Signaturverfahren
Schlüsselpaar (pk,sk)

###Faktor Besitz
A besitzt einen geheimen Schlüssel
* Ziel: Sichere Speicherung des Schlüssels
  - Schlüssel soll von keinem Unbefugten gelesen werden
  - Schlüssel soll von keinem Unbefugten genutzt werden

####Sicherheitselemente
Nutzung sicherer Hardware (Sicherheitschips)
Microprozessoren, die gegen Angriffe geschützt sind
* physikalische Attacken (bohren, fräsen), Detektoren erkennen Angriffe und
  lösschen den Schlüsselspeicher
* elektische, Angriffe mit Licht und Laser
* Seitenkanalangriffe (wie Lange brauch die Berechnung, Stromverbrauch)

####2-Faktor Authentisierung
basiert auf Beitzt(Sicherheitselement) und Wissen (PIN)

**Umsetzung**

* Speicherung von Schlüssel und PIN im Sicherheitselement
* Authentisierung über ein Challenge-Response Verfahren
  - Nutzung des Schlüssels wird über PIN freigegeben
