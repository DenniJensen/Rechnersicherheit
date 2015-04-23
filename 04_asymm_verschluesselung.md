##4. Asymmetrische Versschlüsselungverfahren
* öffentlichen Schlüssel (Public Key) zum Verschlüsseln (jeder kann
  verschlüsseln)
* geheimer Schlüssel (Secret Key) zum Entschlüsseln (nur Inhaber des geheimen
  Schlüssels kann entschl.)
* Keine Berechnugn des geheimen aus dem öff. Schlüssel

###Beruhen auf der vermuteten Schwierigkeit math. Prombleme
(z.B. das Faktorisierungsproblem, diskreten Logerithmus)

Sehr ineffizient, daher nur für kleine Datenmengen eingesetzt
Bsp.: Hybride Verfahren

###RSA-Verfahren: Eintwickelt von Rivest, Shamir und Adleman
(1977 am MIT)

####Faktorisierungsproblem:
Eingabe: Zusammengesetzte natürliche Zahl n = p * q, p,g prim
Lösung: Finde die beiden Primfaktoren

####Einschub Restklassenringe(Zzn = {0,..,n-1},+,*)
* (Zzn, +) abelsche Gruppe,
* Für n prim ist (Zzn, *) eine Gruppe(Zzn, +,*) Körper
* Zzn^*: die bezgl. * invertierbaren Elemente
  (genau die zu n teilerfremden Zahlen(ggT(x, n) = 1))
* (Zzn^*, *) ist eine abelsche Gruppe(ÜA)
* fi(n):= |Zzn^*| heißt Eulerzahl
* n prim fi(n) = n - 1; n = p * q, p,q prim fi(n) = (p -1) * (q - 1)

###4.1 Satz von Euler
Für alle a ee Zzn^* gilt a^fi(n) mod n = 1

####Beweis: Sei a ee Zzn^* und die Abb. f: Zzn^* -> Zzn^*; x -> a*x
Die abb. f ist bijektiv, also gitl

Produkt * y          =     Produkt * fi(n)   =   Produkt a*y
(y ee Zzn^*)             (y ee Zzn^*)        (y ee Zzn^*)

= a^fi(n) * Produkt * y     =  1 mod n
            (y ee Zzn^*)


###Zum RSA-Verfahren:
####Schlüsselgenerierung:
* Wähle Primzahlen p,q zufällig und unabhänging voneinander
* Wähle öffent. Exponenten e ee N mit ggT(e, fi(n)) = 1
* Berechne geheimen Exponenten d ee N mit e*d = 1 mode fi(n)
  - d existiert, da e ein multiplikativeinverses in Zz_fi(n) hat
  - Erweiterte Euklidische Algorithmus liefert
    e * d - y * fi(n) = ggT(e, fi(n)) = 1 ==oder== [ e*d = 1 + y*fi(n) ]
    y*fi(n) = 0 mod fi(n)
* n = p*q heißt RSA - Modul (in Zzn wird ver- und entschlüsselt)
* (n, e) öffentliche Schlüssel; d: geheimer Schlüssel
* p, q, fi(n) müssen geheim gehalten werden
  (Damit lässt sich aus e der gehime Schlüssel d berechnen)

**Verschlüsselung:** einer nachricht m < n: c = m^e mode n
**Entschlüsseln:** eines Geheimtextes c < n: m - c^d mod n
Frage: Gilt (m^e)^d mode n=m ?

Bsp: p = 5, q = 11, n = 55, fi(n) = 40
* Kandidaten für e: 3, **7**, 9
* d = 23: 7 * 23 = 161 mod 40 = 1
* Verschlüsseln der Nachricht 3: 3^7 mod 55 = 2187 mode 55 = 42
* Entschlüsselung von c = 42: 42^23 mod 55
* Trick: Binäre Exponentation(square and multiply)
  - 23 = 1*2^4 + 0*2^3 + 1*2^2 + 1*2^1 + 1*2^0
  - 23 = ((2*2 + 1) * 2 + 1) * 2 + 1
  - Also 42^23 = ((((42^2)^2 * 42)^2 * 42)^2 * 42 (Potenzgesetze)

* 42^2 = 1764 mod 55 = 4, 4^2 = 16 mod 55
* 16 * 42 = 672 = 12 mod 55, 12^2 = 144 = 34 mod 55
* 34 * 42 = 1428 = 53 mod 55, 53^2 = 2809 = 4 mod 55
* 4 * 42 = 168 = 3 mod 55

###Satz 4.2.
Sind n,e und d wie oben gewählt, dann gilt für alle m ee Zzn: (m^e) md n = m

Beweisskizze: Es gilt e * d = 1 mod fi(n), also existiert k ee N mit e * d = 1
+ k * fi(n)
(m^e)^d = m^e*d = m ^1+k*fi(n) = m^k*fi(n) * m = m * (m^fi(n))^k

Fall 1: M und n teilerfremd. Dann gilt mit Satz von Euler m^fi(n) = 1 mod n und
damit insg. (m^e)^d = m * (1)^k = m mod n

Fall 2: m und n nicht teilerfremd: Koplizierter

###Beurteilung der Sicherheit:
Problem 1: Gegeben öffentl. Schlüssel (n, e) und Geheimtext c. Berechne m
Problem 2: Gegeben öffentl. Schlüssel (n, e) und Geheimtext. Berechne d mit e*d
= 1 mod fi(n)
Problem 3: gegeben Modul n = p * q. Berechne p und q(Faktorisierungsproblem)

Frage: Sind die drei Probleme äquivalent? d.h. gilt auch P1 => P2 => P3?

Offensichtlich gilt P3 => P2 => P1
1. P3 lösbar => P2 lösbar
  - Berechne p,q, berechne fi(n) = (p - 1) * (p - 1) und berechne dann d
2. P2 lösbar => P1 lösbar
  (mit geheimen Schlüssel lässt sich entschlüsseln)

* Bekannt: P2 und P3 sind äquivalent
* Bisher nicht bekannt, ob P1 und P2 äquivalent sind d.h: Entschlüsselung
  könnte leichter sein als d zu berechnen

Daher: Es wird nur vermutet, das RSA-Entschlüsselung so schwer ist wie
Faktorisieren.

Derzeit schnellster Faktorisierungsalg: Laufzeit 0(e^x) x = Wurzel(ln(n)*ln
ln(n))
Das bedeutet: n>=2^2048  = (selbst berechnen)
