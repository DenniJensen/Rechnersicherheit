##09 Vertrauensmodelle

Problem:
* Zuordnung einen Schlüssels zu einem Schlüsselinhaber

**Beispiel 1**
Verschlüsselung: verschl. mit public key; entschl. mit secret key
A verschl. mit pk_B -> B entschl. mit sk_B
A verschl. mit pk_M -> Angreifer M entschl. mit sk_M und verschl. pk_B -> B entschl. mit sk_B

* verlust der Vertraulichkeit

**Beispiel 2**
Signieren sig sk, verifizieren pk
* verlust der Datenauthentizität

###Vertrauensmodelle
1. Direct Trust: Nutzer erhält pk von den anderen Nutzern
2. Web of Trust: Nutzer signieren pk gegenseitig
3. Hierarchical Trust: pk zentrale Instanz verwaltet

####Direct Trust (DT)
Nur für kleine Gruppen
* paarweiser Schlüsselaustausch notwendig
   - 2 Personen: 2x; 3 Persone: 3x
   - n Personen: n(n-1) / 2
   - bei weiteren Teilnehmer nx Austauschverfahren nötig

####Web of Trust
Nutzer signieren Schlüssel anderer Nutzer
(Sie garantieren die Authentizität des Schlüssels)

**Beispiel**
- Alice sig Bobs pk und Bob sig Carls pk
- Alice vertraut Carls pk (prüft mit Bobs pk Carls pk)

Nutzer haben Schlüsselbund (keyring) mit pk von anderen Nutzern
Jedem öffentlichen Schlüssel sind zugeordnet:
* Namen des Schlüsselinhabers
* Owner Trust (5 Stufig, Vertrauen in die Prüftätigkeit des Schlüsselinhabers)
* key legitimacy (3 Stufig, Vertrauen in den pk)
* Signaturen

* Owner Trust (OT):
  - Grad der Prüftiefe des Schlüsselinhabers für pk anderer Nutzer
  - unknown: keine Info vorhanden
  - not trusted: pk-Inhaber wird nicht vertraut
  - maginal: vertrauen Teilweise
  - complete: volles vertrauen
  - ultimate: üblicherweise nur für eigene Person

* key legitimacy (Grad des Vertrauens):
  - x = Anzahl der Signaturen von Personen mit OT maginal
  - X = benitigte Anzahl von Signaturen mit OT maginal (nur Schlüsel als
    authentisch)
  - y = Anzahl von Signaturen von Personen mit OT complete
  - Y = benötigte Anzahl von Signaturen mit OT complete
  - Vertrauenslevel L := x/X + y/Y
  - 3 Level:
    * L = 0 : nicht authentisch
    * 0 < L < 1: teilweise authentisch
    * l > 1 authentisch
  - üblicherweise: X = 2 und Y = 1
    * pk von einer vertrauenswürdigen Person signiert
    * von min 2 teilweie vertrauenwürdigen Personen signiert

* Nachteil:
  - Einstufung des OT erfordert Wissen über die Nutzer
  - Signaturen ist nicht juristisch bindend
  - Zurückziehen von Schlüsseln (Zertifikate) schwierig
  - Disziplin der Nutzer erforderlich
  - Datenschutz! (zb bei Schlüsselserver)

* Vorteile:
  - Gegenuber von DT eine deutlich Verbesserung
  - PGP/ GnuPG
  - Zahlreiche Schlüsselserver
  - c't bietet Certification Service für PGP und GPG Schlüssel

####Hierarchical Trust:
Public key Infrastruktur (PKI)
* pk werden von einer vertrauenswürdigen Instanzverwaltet
* Nutzer erhalten Zertifikate C_i für ihre öffentlich Schlüssel pk_i
* Vertrauensanker bildet der pk_CA der CA
* Certification Authority (CA)
* CA: pk_CA, sk_CA; Nutzer i pk_i, sk_i, C_i, pk_CA

**Inhalt Zertifikat**
C_i (INhalt, Signatur)
- Angaben zum Nutzer: Name, Organisation ...
- pk_i
- verwendeter Algo: RSA, DSA
- Gültigkeitszeitraum
- Angaben zur CA: Name, Kontaktdaten
- Schlüsselnutzung: Sig, Verschlüsselung
- URL: CRL
- Signatur CA (mit sk_CA)

**Beispiel**
Nutzer 1 sig Doc m, Nutzer 2 prüft sig
* Nutzer 1 pk_1, sk_1 C_1
* Nutzer 2 pk_CA
* N1: compute s := sig(sk_1,m)
* sendet s_1 C_1 m
* N2: verify(pk_CA, (Inhalt, sig) = C_1)
* N2: verify(pk_1, m, s)

**Registration Authority:**
  - Legt Sicherheitsrichtlinien fest
  - Prüft Zertifizierungsanfrage
  - legt Inhalt der Zertifikate est
  - Leitet Anträge an CA weiter

**Certification Authority (CA):**
  - stellt die Zertifikate aus

**Zurückziehen von Zertifikaten:**
  - Sicherheitsvorfälle
  - eine Instanz hält sich nicht an die Sicherheitsvorgaben
  - hierzu: Führen einer Certification Revokation List (CRL)
  - Zusätzlich: Prüfung ob Zertiikate in CRL enthalten ist

**Sicherheitsvorgaben:**
  - Certification Policy (CP): welche Sicherheitsvorgaben werden eingehalten
  - Certification Practice Statement (CPS): Wie werden diese umgesetzt
  - RFC 3647 Aufbau und Inhalt beider Dokumente
  (Bsp.: Zertifikate: X509 HTTPS, CVC Card verifiable Certificates: Smartcard)

Root Instanz (RA, CA) pk_CA, sk_CA
Teil Instanzen (RA, CA) pk_TCAi, sk_TCAi
