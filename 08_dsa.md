## Digital Signature Alg. (DSA)
Sicherheit beruht auf der Schwierigkeit des DL (Diskreter Logerithmus)

###Schlüsselgenerierung
1. Wählen zwei Primzahlen p, q mit p | p - 1 (q teil p -1)
2. wählen x ee Zz*_p und berechne g = x^(p-1)/g mod p
3. Falls g = 1, gehe zu 2
4. wähle a ee {2,..., q - 1} und setze A:=g^a

(p,q,g,A): öffentlicher Schlüssel, a: geheimer Schlüssel

*Bemerkung*:
1. Wahl von g: Zz*(g):= {g^1; i ee Nn} hat genau q Elemente

**Uebung**: Beweisen sie das.
2. Aus (p,q,g,A) lässt sich a mittels DL ausrechnen(a = log_g A)

Zwei Möglichkeiten, den DL zu berechnen
  a) ln Zp* : Laufzeit 0(e^sqrt(ln p ln ln p))
  b) ln Zp*(g) : Laufzweit 0(sqrt(q))
**Uebung: Wie groß müssen p,q sein um 100 Bit Sicherheitsniveau zu


###Signaturerzeugung:
einer Nachricht m (h=H(m))
1. Wähle eine Zahl 1 < s < q
2. Berechne
  - s1 = (g^s mod p) mod q
  - s2 = s^-1(h+s1 * a) mod q
Signatur: (s1, s2)

###Signaturverifikaton
1. Prüfe, ob 0 < s1, s2 < q gitl
2. Berechne w = s^-1 mod q, u1 = h * w mod q, n2 = s1 * w mod q, v = (g^n1 *
   A^u2 mod p) mod q
3. ist v = s1, dann akzeptiere

###Satz 6.1:
Es gilt:(s1,s2) ist genau dann eine korrekte Signatur, wenn v = s1

Beweis: n=>n: ist (s1, s2) korrekt, dann gilt s2 = s^-1 (h + s1 * a)
Multiplikation mit s * w mode q ergibt s2 * s * w = h * w + s1 * a * w) mod q,
mit 2 = s2^-1 mod q also s = (h * w + s1 * a * w) mod q
Wegen n1=h * w mod q, u2 = s1 * w mod q also s = (u1 + u2 * a) mod q

Es existiert eine n ee N (n ist Element der natürlichen Zahlen) mit s + n * q =
u1 + u2 * a

Weiter gilt g^q = (x^(p-1)/q)^q = x^(p-1) = 1 mod p (Satz von Euler)

Es folgt g^s = g^s * (g^q)^n = g^(s+n*q) = g^(u1+u2*a) = g^u1 * g(g^a)^u2 =
g^u1 A^u2

Darausfolg = s1 (g^s mod p) mod q = (q^u1 * A^u2 mod p) mod q = v

Bemerkung: DSA ist ein probabilistischer Alg.
(für jede Signatur wird Zufall s benötigt)

Zwei wichtige Nebenbedingung für S:
1. s muss geheim gehalten werden, sonst lässt sich a berechnen
  (s2 * s -h(m)) * s1^-1 mod q
  h(m) + s1 * a mod q
  Entropie(Unvorhersagbarkeit) von s muss 100 Bit groß sein(Wkeit, s zu eraten <
  1/2^100)

2. Für jede Signatur muss ein anderer Wert S gewährt werden
  * Seien h, h' zwei Nachrichten unter Nutzung von s signiert, mit (s1, s2) und
    (s1', s2')
  * Dann gilt s1 = s1', s2 = s^-1 (h + s1 * a) mod q und s2'=s^-1 (h' + s1 * a)
    mod q Also s2 - s2' = s^-1 (h - h') mod q, d.h. s = (h - h') / (s2 - s2')
    Dann können wir (siehe (1.))
