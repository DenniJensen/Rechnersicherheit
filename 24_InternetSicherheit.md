##Angreifertyp 3: Websicherheit

Angreifer nutzt Schwachstellen im Browserkonzept

Sicherheitsrelevante Funktionen des Browsers:
* Session Menagement (Session ID z.B. über Cookies)
* Zugriffskontrolle für Skripte der Webseite

###Sicherheitsstrategie: Same Origin Policy (SOP)

* Skripte haben Zugriff auf Kommunikation zwischen Browser und Server
  - Auslesen, Manipulieren, Senden, Empfangen von Daten
* Realisiert über Document Object Model (DOM)
* SOP: Zugriff nur innerhalb eines Kontext erlaubt
  - Kontext: Internetdomain, Port, Protokoll (http, https)

**Bsp: Zugriff eines Skripts in ```http://www.server.de/page1.html```**

* ```http://www.server.de/page2.html``` erlaubt
* ```https://www.server.de/page3.html``` nicht erlaubt
* ```http://www.attacker.de/index.html``` nicht erlaubt

Unser Ziel: Umgehen der SOP über verschiedene Angriffe Elevation of Privileg

**Angriffe:**

* Cookie Poisoning: Lesen, Manipulieren, Mißbrauch von SID
* Mitlesen der Verbindung: Benutzername, Passwort


####DNS Rebinding

Idee: www.attacker.de erhält einer vertrauenswürdige IP-Adresse

Vorbereitung:
- Anmeldung der IP-Adresse ```www.attacker.de``` im DNS
- Anmeldung des autoritativen Name Servers (AN) im NDS (unter Kontrolle des
    Angreifers)

(A: Angreifer, C: Client, S:Server)

#####Angriff 1:

* Client C ruft ```www.attacker.de``` auf (mit bösartigen Skript)
* C fragt IP-Adresse im DNS ab (u.a. AN-Server)
* A sendet zwei Adressen zurück: seine und die des Clients
* Skript hat jetzt alle Zugriffsrechte des Clients
* Gegenmaßnahme: SOP nicht über Domain, sondern über IP-Adresse (frühere
  Netscape-Versionen waren betroffen)

#####Angriff 2:

* A gibt zunächst seine IP-Adresse zurück (mit sehr kurzer TTL)
* Skript stellt nach dieser Zeit erneute Anfrage an ```attacker.de```
* C fragt DNS ab, A liefert IP-Adresse von C
* Gegenmaßnahme: Browser realisiert eigenes Pimming (keine DNS abfrage)

#####Angriff 3:

* A beantwortet Pimming nicht


####Cross Site Scripting (XSS)

Ausführen eines bösartigen Skripts in einem vertrauenswürdigen Kontext
* reflected XSS: Skript wird über C an S geschickt
  - S hat ein Suchfeld (erreichbar unter ```www.server.de?search=...```)
  - S zeigt Sucheingabe an (Sie haben nach ... gesucht)
  - A platziert auf einer Seite folgenden Link:
    ```<a href="http://www.server.de?search=SCRIPT">Click</a>```
  - Skript wird im Kontext von S ausgeführt
* stored XSS: Skript wird direkt auf S platziert (Gästebuch)
* DOM-based XSS: Ohne Beteiligung von S
  - Skript ließt einen Argumentwert aus URL
    ```http://www.server.de/index.html?arg=Argumentwert```
    Und stellt diesen im html-Dokument dar
  - A hat fogenden Link: ```...arg=SCRIPT```
  - Skript wird im Kontext von S ausgeführt

**Gegenmaßnahmen**

XSS ist ein typischer Code Injection-Angriff
* Eingaben prüfen
* Ersetzen von Metazeichen
