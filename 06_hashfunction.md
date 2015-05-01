#06 Hashfunktionen
* H: {0,1}^* -> {0,1}^*
* ! krypt. Primitive

###Eigenschaften
1. Einwegfunktion
  * H ist effizient berechenbar, aber die Umkehrung nicht
  * For All x element {0,1}^* H(x) effizient berechenbar
  * For All y element {0,1}^n ist es schwer m element H^-1(y) zu berechnen

2. schwache Kollisionsresistenz
  * d.h. es ist schwer eine bestimmte Kollision zu finden
  * m element{0,1}^* suche m' element {0,1}^* / {m} => H(m) = H(m')

3. starke Kollisionsresisteenz
  * d.h. allgemein Kollision
  * For All m,m' element {0,1}^* m nicht m' ist H(m) = H*(m')

* Es gibt Einwegfunktionen, die nicht schwach Kollisionsresistenz nicht
* Es gibt schwach Kollisionsresistenze, die keine Einwegfunktionen sind
* Starke Kollisionsresistenz is die Verallgemeinerung von 1. und 2.
  - d.h. Funktionen mit 3. -> Einwegfunktionen
  - d.h. Funktionen mit 3. -> Funktionen mit 2.

* unendliche Menge kann nicht injektiv auf endliche Menge abgebildet werden.
* es gibt immer Kollisionen
* 100 Bit Sicherheit => 2^100 Versuche eine Kollision bezüglich der Eigenschaften zu berechnen

### Merkle - Damga^ord - Konstruktion (Kreis über a bei Damga^ord)
* f: {0,1}^n x {0,1}^n -> {0,1}^n (Kompressionsfunktion)
* m = m_1 || m_2 || ... || m_n

* IV -> f mit m_1 -> f mit m_2 -> ... -> f mit m_n = H(m)

* Kompressionsfunktion muss alle fuer H gewuenschten Eigenschaften besitzen

####Bsp.: sichere Kompressionsfunktion: sichere Blockchiffre
Sei E: {0,1}^n x {0,1}^n -> {0,1}^n eine sichere Blockchiffre
f: {0,1}^n x {0,1}^n -> {0,1}^n, (m,k) -> E(m,k) xor m

Frage: Wann erreicht H: {0,1}^* -> {0,1}^n das Sicherheitsniveau 100 Bit bzg. 3.?
 * Betrachte Brute Force
  - k Werte m_1, ... m_k brechne h_i = H(m_i)
  - Wahrscheinlichkeit eine Kollision zu finden?
 * klar ist je kleiner der Bildraum {0,1}^n, desto größer
 * gesucht untere Schranke fuer den Bildraum n 
 * Schätzung 100 Bit {0,1}^100

####Bsp.: Geburtstagparadoxon
* Wahrscheinlichkeit dass von 23 Personen 2 am selben Tag Geburtstag haben (ohne Jahr)
* 5-10% -> 50%

1. Berechnung mit Gegenwahrscheinlichkeit
 * Wahrscheinlichkeit fuer 1 an einem Tag Geb. hat 365/365
 * fuer 2 an einem anderen Tag 364/365
 * fuer k ... 365-(k-1)/365

* Ingesammt die Wahrscheinlichkeit, das alle an anderen Tagen Geb. haben (Produkt der Kette)

Produkt (von i = 1 bis k) [365 - i + 1 ]/ 365
Gegenwahrscheinlichkeit 1 - ...
k = 10 -> 11,7% , k = 23 -> 50,7% , k = 36 -> 83,2%

2. Ziel: Kollision finden
 * Wie viele Nachrichten muessen ausprobiert werden um mit hoher Wahrscheinlichkeit eine Kollision zu finden? (2^100 Nachrichten)

h_1 = H(m_1), ... h_k = H(m_k)
1 - Produkt (i = 1 bis k) [2^n - i + 1] / 2^n = 1- Produkt (i = 1 bis k) 1 - ([i - 1] / 2^n) = 1 - Produkt (i = 2 bis k) 1 - ([i - 1] / 2^n) = 1 - Produkt (i = 1 bis k-1) 1 - i / 2^n

3. Abschaetzung: 
 * (1 - i / 2^n) 1 - x etwa e^-x etwa 1 - Produkt (i = 1 bis k-1) e^{i/2^n} = 1 - e^{Summe (i = 1 bis k-1) - i / 2^n} = 1 - e^{-(k(k - 1)) / (2 * 2^n} = p

4. Also: 
 * p Wahrscheinlichkeit dafuer, dass eine Kollision gefunden wird
 * Anzahl der Nachrichten die gezogen werden muessen interessieren uns.

 * e^{-(k(k - 1)) / (2 * 2^n)} = 1 - p
 * -(k(k -1) / (2 * 2^n) = ln(1 - p)
 * k^2 - k = 2^{n+1} * ln (1 / (1 - p) etwa k = 2^{(n+1)/2} * sqrt(ln(1/(1-p)))

* nach IND-CPA hoeher 0,5 => r = 0,5
* k etwa 2^{(n+1)/2} * sqrt( ln(2))
* also: Sicherheitsniveau 100 Bit, n >= 200
* SHA +x {x element 224, 256, ... , 512} gibt die Groesse des Bildraumes an
