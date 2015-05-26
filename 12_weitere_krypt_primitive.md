##10 Weitere kryptografische Primitive
* Secret Sharing: Durchsetzten eines Mehr-Augen-Prinzips
* Aufteilen eines Geheimnisses K in n Teilgeheimnisse so, dass
 - t <= n Teilgeheimnisse benötigt werden, um K zu rekonstruieren
 - t-1 Teile aber keine Informatotion über K liefern

(t,n)-SchwellwertSchema

**Einsatz**

Sicherer Schlüsselspeicher, Zugriffskontrolle

**Bsp. 1: Einfach aber unsicher**

* K = (K_1, ... K_128)
* TK_1 = {K_1, ..., K_32}, TK_2 = {K_33, ..., K_64}, TK_4 = {K_97, ..., K_128}
* Kenntnis über 3 Teilgeheimnisse liefert 96 Bit des Geheimnisses

**Bsp. 2: Einfach und sicher**

* Wähle zufällig n-1 Werte Teilgeheimnisse TK_1, ..., TK_n-1 element {0,1}^128
* Setze TK_n := TK_1 xor ... xor TK_n-1 xor K.
  TK_1, ..., TK_n wird auf n Leute verteilt

Es gilt:
TK_1 xor ... xor TK_n = TK_1 xor ... xor TK_n-1 xor TK_1 xor ... TK_n-1 xor K =K

Kennt man weniger als n Teilgeheimnisse, erhält man keine Information über K
(vlg. OTP)

Aber wir haben nur ein (n,n)-Schwellwertschema (Verfügbarkeitproblem)

###Shamir Secret Sharing
Verstecke K in einem Polynom

* Betrachte K element {0,1}^128 als natürliche Zahl K = Summe von i = 1 bis 128
  2^i-1
* Wähle t-1 Werte a_1, ..., a_t-1
* Betrachte Polynom f(x) = K + a_1 x^1 + a_2 X^2 + ... + a_t-1 X^t-1
  Dann gilt f(0) = K

* Erzeugen der Geheimnisse:
  - Person 1 <- (1,f(1)), Person 2 <- (2,f(2)), ..., Pers n <- (n,f(n))
* Rekonstruktion des Polynoms f (des Geheimnisses K = f(0))
  - Fundamentalsatz der Algebra: Polynom (t-1)-Grades wird druch t Punkte (x_i,
    f(x_i)) eindeutig Festgelegt
  - Langrange-Formel: f(x) = Summe i = 1 bis t f(x_i) Produkt j = 1 bis t j
    ungleich i x-x_j / x_i - x_j

**Sicherheit**

Angreifer kennt t-1 Werte (1,f(1), ..., (t-1,f(t-1)))
K = f(0) = Summe i = 1 bis t f(i) I_i
I_i = Produkt j = 1 bis t (j ungleich i) 0 - j / i - j
K = Summe i = 1 bis t-1 f(i) * I_i + f(t) * I_t
K = ax + b, a und b bekannt, x = f(t) unbekannt

##Zufallszahlengeneratoren
Einsatz: Schlüsselgenerierung, Zufall für kr. Verfahren(DSA, DH)

**Wichtig**

Güte des Zufalls, Entropie/ Unvorhersagbarkeit
n-Bit Entropie bedeutet: Angreifer kann Zufall mit Wahrscheinlichkeit von 1/2^n
erraten

###Physikalische Zufallszahlengeneratoren
* Zufall aus physikalischen Rauschquellen, z.B.
  - Impulsschwankungen elektromagnetischer Schaltungen
  - radioaktiver Zerfall
  - Atmosphähren rauschen

**Probleme**

* Nicht immer verfügbar
* häufig langsam
* häufig Schiefen, also keine Gleichverteilung (deterministische Nachbearbeitung)

**Bsp**

Erzeugt wird eine Zufallsfolge (x_1, ..., x_n) element {0,1}
* Entropie pro Bit: Im Idealfall 1, dh. Pr(x_i = 1) = 1/2
* Häufig Schiefen: Bsp.: Pr(x_i = 0) = 0,2 , also Pr(x_i = 1) = 0,8
* Entropie von x_i?
  - Wkeit x_i zu erraten ist 0,8
  - Ausgedrückt in Entropie: Finde t mit 1/2^t = 0,8
  - Also 2^t = 1,25, d.h. t = 0,322 etwa 1/3

* Deterministische Nachbearbeitung
  - Aus 300 Bit mit Entropie 100 machen 100 Bit mit Entropie 100

###Deterministische Zufallszahlengenertoren
Berechnen aus einem Zufallswert fester Länge, dem Seed eine pseudozufällige
Bitfolge beliebiger Länge

Seed -> Hashfunktion H_1 -> xor Seed und nochmal H_1 -> Hashfunktion H_2 -> Zufallswert
(Entropie kann durch determistische Nachbearbeitung nicht erhöht werden)

**Weiteres Bsp.: Blockchiffre im Counter Mode**

* Sicherheitsanforderungen
  1. Entropieerhaltung
  2. Aus einem Teil der Zufallsfolge dürfen nicht berechnet werden
    - Vorgänger und Nachfolger
