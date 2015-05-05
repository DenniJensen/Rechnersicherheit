## 6.Datenauthentisierung
Grundidee: Detektions von Datenmanipulation
* Beweisender (Sender/Erzeuger) berechnet Prüfsumme
* Prüfer (Empfänger) prüft die Prüfsumme

###Message Authentication Codes (MAC): Symm. Verfahren
Erste Idee: basierend auf einer Hashfunktion H: {0,1}^* -> {0,1}^n
* der Beweisende(B) und Prüfer(P) vereinbaren Schlüssel k ee {0,1}^128
* B authentisiert Nachricht m ee {0,1}^* : Ber. s=H(k||m) und sendet s,m and P
* P pr¨¨ft Authentizität von m: Berechnent s'=H(k||m), prüft s'=s

Ist unsicher: Erinnerung: Konst. von H nach M-D

Angreifer kann weitere Blöcke an m anhängen und eine gültige Prüfsumme
berechnen. Schützt den ANfang der Nachricht, aber nicht das Ende.

H(m||k) auch keine gute Idee: Schützt das Ende der Nachricht aber nicht den
Anfang.

Sichere MAC-Verfahren:
1. CMAC (basiert auf Blockchiffren, C = Cipher)
2. HMAC (basiert auf Hashfunktionen)

HMAC(k,m) := H((k x+r opad) || H((k x+r ipad) || m))
opad:= 0x5C....0x5C
ipad:= 0x36....0x36
Sind Konstanten

**Übung: Beschreiben Sie CMAC**

Verschlüsselung und MAC werden häufig zusammen eingesetzt.
Secure Messaging (vertraulicher und authentischer Kanal)

Zwei Nebenbedingungen:
1. Verschiedene Schlüssel für Verschlüsselung und Authentisierung
  * Wesentliches Prinzip: Trenne wo du trennen kannst
2. Erst verschlüsseln und dann verschlüsselten Daten authentisieren
  * Vertraulichkeit ist eine anderes Schutzziel als Authentizität.
    MAC-Verfahren müssen nicht Vertraulichkeit gewährleisten
  * Weiterverarbeitung der Daten nur wenn Sender bekannt. Verhindert z.B.
    Entschlüsselung von Schadsoftware.

MAC-Verfahren erfüllen nicht das Schutzziel Nichtabstreitbarkeit
* Beide(B, P) nutzen den selben Schlüssel
* Auch P könnte die Daten authentisiert haben
* Gegenüber Dritten nicht nachweisbar, wer Daten authentisiert hat.


### Signaturverfahren(asymm. Verfahren zur Datenauthentisierung)
* B nutzt seinen geheimen Schlüssel, um Prüfsumme zu berechnen
* P prüft mit zugehörigen öffentlichen Schlüssel
* Also: Erfüllt auch das Schutzziel Nichabstreibarkeit: Nur Inhaber des
  geheimen Schlüssel kann Prüfsumme berechnen

RSA-Verfahren: Modul n, Schlüsselparr(e,d)
* B nutzt d, um Prüfsumme s=m^d mod n zu berechnen
* P nutzt e, um m' = s^e mod n
  Wegen s^e (m^d)^e = m^e*d = m mod n akzeptiert P, wenn m = m'

Problem: Es können nur Nachrichten m < n signiert werde. Für n ~ 2^2048 also
Bitlänge von m kleiner 2048

Lösung: Nachricht m wird gehasht, signiert und geprüft wird H(m).
Dazu wichtig: hashfunktionen müssen kollisionsresistent sein.
- gilt für zwei Nachrichten m, m' : H(m) = H(m) dann ist eine gültige Signatur
  für m auch eine für m'
m > n m mod n
H:{0,1}^* -> {0,1}^2048 , m -> m mod 2^2048 ist nicht Kollisionsresistänz

Allg. Signaturverfahren besteht aus
1. einer kryptographisch sicheren Hashfunktion
2. einem Signaturalgorithmus

**Übung: Welche Angriffe gegen das unmodifizierte RSA-Sinaturverf. gibt es. Wie
können diese verhindert werden. (probabilistisches Padding - Verfahren)**

