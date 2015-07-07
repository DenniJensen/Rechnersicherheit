###Domain Name System (DNS)

Hauptfunktion: Namensauflösung: google.de --> 173.194.112.111

**Bsp**

* Client -> Resolver: Auflösung von google.de
* Resolver -> Rootserver: Liefert Toplevel Domain Server (TDL)
* Resolver -> TDL : Liefert authoritative DNS-Server
* Resolver -> DNS: Liefert IP-Adresse
* Resolver -> Client: Liefert IP-Adresse

Abfrage über UDP/IP: Anwort u.a. IP-Adressen (A Record(IPv4), AAAA Record
(IPv6), Time to Life (TTL))

Absicherung über 16-Bit Query-ID (wird jeweils zurückgeliefert)

####DNS Cache Poisouning Attack

Ziel: Zurückliefern einer falschen IP-Adresse
* z.B. zur Durchführung von Phishing Angriffen
  www.paypal.de -> www.attacker.de

Attacke:
* Angreifer A bringt Client C dazu, Adresse von paypal aufzurufen
  z.B. über Internetseite mit Inhalt
  ```
  <img src="http://paypal.de/a.jpg">
  ```
* A überflutet DNS-Server/Resover mit falschen IP-Adressen (mit geratener ID)
  - kommt die Anwort von A zuerst, wird die IP übernommen (+ TTL)

* Erfolgsaussichten:
  - Nur Raten von QID und Portnummer (kein Handshake wie bei TCP)
    - Wahrscheinlichkeit für QID 1/(2^16) (Verbesserung über mehr Anworten)
    - Wahrscheinlichkeit für Portnummer häufig statisch, 1
  - Erhöhung der Wahrscheinlichkeit: DoS-Attacke auf DNS-Server


* Problem: Anwortet DNS zuerst, neuer Angriff erst nach Ablauf TTL möglich

#####Don Kaminsky-Attacke

* DNS-Server können auch weitere IP-Adressen liefern (Glue Records)
* Bailiwick Checking: Akzeptanz der Antwort nur, wenn im selben
  Zuständigkeitsbereich: Liefert A Record für 123.example.com Addresse für
  example.com (wird akzeptiert)
* DNS-Server (von C) cashed glue-record (unabhängig von TTL)
* Angriff:
  - C fragt Adressen 111.paypal.de, 112.paypal.de ... ab
  - A überflutet C (DNS) mit gefälschten Antworten + Glue Record paypal.de
  - Antwort muss ankommen bevor DNS antwortet (NXDOMAIN)
  - Wiederholung in diesem Fall (Dauer 10 Sekunden bis Erfolg)

* Gegenmaßnahmen:
  - Split-Split DNS-Server
  - DNS Sec

###Schutzmaßnahmen

####Firewall-Technologien

Idee:
  - Datenverkehr zwischen Internet und lok. Netz läuft über Firewall
  - Zugriffe können kontrolliert und protokolliert werden


Wir unterscheiden: Paketfilter, Zustandsgesteuerte Filter, Proxy-Filter,
Application Filter

#####Paketfilter

* Angesiedelt auf IP- und Transportlayer
* Entscheidung anhand IP, TCP-Header: Adressen + Ports
* Sicherheitsstrategie: Festlegung über Tabellen
* Vorteil: Einfach umsetzbar (auch in Routern mit beschränkten Ressourcen)
* Nachteil: Statische Tabellen, keine Analyse der Nutzlast

#####Zustandsgesteuerte Filter

Bsp: Weiterleitung von TCP-Paketen nur, wenn der Client TCP-Handshake initiert
hat

#####Proxy-Filter (Stellvertreter)

Bsp: Client C will Server S kontaktieren
* Proxy P tritt gegenüber S als Client C auf
* und gegenüber C als S

#####Application -Filter

Angesiedelt auf Application Layer

Analyse der Nutzlast
