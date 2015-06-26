##Softwaresicherheit

'Software soll keine Sicherheitslücken haben'

April 2014: Heartbleed
* TLS Heartbleed
  - hält Verbindung offen
  - Definition RFC 6520
  - kann von TLS Server oder CLient gesendet werden
  - auch für MTU path recovery, NAT refresh

###Open SSL
* Nachricht wird in den Speicher geschrieben
* Nachricht soll zurückgesendet werden mit gleichem Inhalt
  - memcpy(...), länge in Heartbleed Nachricht angegeben
* Speicherinhalt wird übertragen, mit ein wenig Glück enthält dieser den
  privaten Schlüssel

**Schlimm?**

* klappt mit Wahrschienlichkeit -> 1
* geheimer Schlüssel nicht mehr geheim
* zukünftige Kommunikation kann abgehört werden
* vergangene Kommunikation kann, sofern aufgezeichnet, entschlüsselt werden
  (außer PFS)
* andere TLS nicht betroffen

**Ursachen/Maßnahmen**

* Benutzereingaben nicht ordentlich geprüft

####Benutzereingaben

Benutzerverzeichnis C:\user\username
Eingabe: den rel Pfad der Datei, die gelöscht werden soll
Prüfung der Eingabe: "..\" darf nicht vorkommen
  - angekommen sicher

**Exkurs UTF-8:**

* ASCII: 7-bit Code, um engl Alphabt zu enkodieren
  - $ = 0100100
* Unicode ist ASCII-kompatibel
* Unicode enthält 1 Mio Zeichen
* Eine Bitfolge xxx wird je nach Platzbedarf in einem oder mehreren Byte
  kodiert
  - 0xxxxxxx
  - 110xxxxx 10xxxxxx
  - 1110xxxx 10xxxxxx 10xxxxxx
  - copyrightzeichen U00A9 = 10101001
* Unicode nur kürzeste Byte folge zulässig

* Problem: Benutzereingaben nicht korrekt geprüft

###rlogin / login: (GNU/Linux)
* login loggt einen Benutzer ein
  - login -f <user>
* rlogin -l <user> <machine>

* $rlogin -l "-f root" fu-berlin.de
  => login -f root
* Problem: Benutzereingbe nicht ausreichend geprüft

###SQL injection
* Typisch für PHP Webanwendungen
* Parametrisierte SQL-Anfragen
  - $sql = "SELECT id FROM users WHERE name = '$name' AND password =
    MD5('$password')";
  - kennwort: foo') or 1=1;--
- Problem: Benutzereingaben nicht ordentlich geprüft

###Stack Overflow

* Stack verwaltet: Variablen, Rücksprungadresses des Programms

```
int login(void) {
  char username[10]; password[10];
  gets(&username);
  gets(&password);
  return check_login(&username, &password);
}
void main (void) {
  if (login()) {
    do_something_cool();
  }
}
```

###Starbucks

* Geld kann von einer Geschenkkarte auf andere Karte überwiesen werden
  - POST /transfer?from=...&to=...&amount=99
* Was passiert?
  1. Betrag der Absenderkarte lesen
  2. Neuer Betrag auf Absenderkarte schreiben
  3. Betrag der Empfängerkarte lesen
  4. Neuer Betrag auf Empfängerkarte schreiben
* Zweimal gleichzeitig gleiche Transaktionen durchführen
  - A,B
