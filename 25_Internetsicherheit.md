###Cross Site Request Forgery (XSRF)

Angriffe auf eine Webseite mit Rechten eines Authentisierten Nutzers

Authentisierung z.b. tls, Passwort (SID über Cookie)

* C ist auf ```www.server.de``` angemeldet
  - Aktion können z.b. folgt umgesetzt werden
  ```
  GET https://server.de/chpasswd?user=margraf&password=123456
  ```
* Angreifer schiebt C einen Request unter (z.b. via Link auf Seite
  ```www.attacker.de``` )

  ```
  <a href="https://server.de/chpasswd?user='username'&password=654321></a>"
  ```

**Gegenmaßnahme**

* Client: Ausloggen wenn weitere Seiten aufgerufen werden
* Server: Nutze weitere Zufallszahl (nicht nur Cookie)
  - Nach Auth erhält C von S random_number
  - Diese muss bei sensiblen transaktionen übergeben werden
  ```
  GET https://server.de/chpasswd?rn=random_number&...
  ```
  - SOP: Angreifer rn nicht ermitteln
  - Aber XSS-Angriff kann das umgehen (Wie?)
