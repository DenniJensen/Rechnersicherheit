##8 Komplitätstheorie und Krypographie
* Verschlüsselung, Authentisierung ... müssen schnell berechenbar sein
  Formal: polynomiell zeitbeschränkte Funktionen/Algo
* Angreifer hat beschränkte Ressourcen: polynomiell Zeitbeschränkt

**Ziel:**
Wenn P = NP, dann gibt es keine sichere Kryptographie

**Erinnerung**

1.
Eingabe x element {0,1}^n
deterministische Alg. A (genau ein Berechnungsweg)
Ausgabe A(x)

2.
Eingabe x element {0,1}^n
nicht deterministische Alg. A (mehrere Berechnungswege)
Ausgabe nicht eindeutig

3.
deterministische Eingabe x element{0,1}^n
randomisierte Eingabe r element {0,1}^S(n)
deterministischer Alg. A (ein Berechnungsweg)
A(x,r)

* 2. und 3. sind nur verschiedene Interpretationen des selben Modells

**Polynomielle Laufzeit**

A benötigt für eine Eingabe x element {0,1}^n höchstens p(n) Schritte (p ein Ploynom)
(unabhängig vom gewählten Berechnungsweg oder der randomisierten Eingabe)

###Eintscheidungsprobleme:
* Probleme die nur Ja/Nein zulassen.

**Beispiel 1.: Clique**

Eingabe: Graph G = (V,E)  und k element N
Frage: Hat G ein Clique >= k?

**Bsp 2.: Wortproblem**

geg.: Sprache L aus {0,1}*
Eingabe: w element {0,1}*
Frage: Gilt w element L?

####P
Probleme für die es eine polynomiellen deterministischen Alg. A mit:
* x element L => A(x) = Ja
* x not element L => A(x) = Nein

####NP
Probleme, für die es ein poly. randomisierten (nicht deterministischen) Alg.
A gibt mit:
* x element L => Es existiert ein r element {0,1}^S(n) mit A(x,r) = Ja
* x nicht Element L => für alle r element {0,1}^S(n) gilt A(x,r) = Nein

Ungelöste Frage: Gilt P = NP

###Pseudozufallszahlengenerator(PRNG)
z.B für Stromchiffren

**Def.8.1**
* R :{0,1}^n -> {0,1}^l(n) (l(n) > n) ist sicherer PRNG, wenn:
  - R ist in pol. Zeit berechenbar
  - Angreifer A stellt kein unterschied fest zwischen
    y element {0,1}^l(n) (gewählt bzg. Gleichverteilung) und
    R(x) element {0,1}^l(n) (x bzg. Gleichverteilung aus {0,1}^n).

Praktisch nicht möglich: nicht lösbar in poly. Zeit
* Schlüssel k element {0,1}^n, Nachricht m element {0,1}^l(n)
* (OTP): m xor R(k)
* Für pol. beschränkten Angreifer:
  - R(k) ist gleichverteilter Zufall
  - genauso sicher wie OTP

Etwas formaler:
* Angreifer ist pol. det. Alg.
* Angreifer muss für y element {0,1}^l(n) entscheiden, ob y element L =
  R({0,1}^n)
* Frage: Ist die Sprache L element P? (Dann existiert ein pol. det. Alg., der
  entscheidet, ob y element L.)

**Satz 8.2**
Unter der Vorraussetzung P = NP existieren keine sicheren PRNG
Beweis:
* Zu zeigen: L element P
* Erster Schritt: L element NP

Betrachte folgenden randomisierten Alg. A:
* Eingabe: y element {0,1}^l(n) (det. Eingabe), x element {0,1}^n (rand.
  Eingabe)
  1. Berechne R(x) (Pol Laufzeit)
  2. Prüfe R(x) = y (pol. Laufzeiy, da l(n) pol beshränkt, da R pol. beschränkt)
  3. Wenn ja, gib ja aus, wenn nein nein

* A hat pol Laufzeit, weiter gilt:
  - y element L, dann existiert ein x mit R(x) = y, d.h A(y,x) = Ja
  - y nicht element L, dann gilt für alle x: R(x) ungleich y, d.h. A(y,x) =
    Nein
* Also gilt L element NP und wegen P = NP gilt auch L element P.

**Def. 8.3**
f: {0,1}^* -> {0,1}^* heißt sichere Einwegfunktion, wenn f in pol Zeit
berechenbar ist, es aber praktisch nicht möglich ist Urbider zu berechnen

Bsp.: Hashfunktionen, DSA: x -> g^x, RSA (p,g) -> p * q

**Satz 8.4**
Gilt P = NP, dann gibt es keine sicheren Einwegfunktionen
Für f : {0,1}^* -> {0,1}^* schreiben wir auch f : {0,1}^n -> {0,1}^S(n), wenn
länge f(x) für alle x element {0,1}^n durch S(n) beschränkt ist.
Da f pol beschränkt ist, gilt dies auch für S(n)

Beweis: Sei f: {0,1}^n -> {0,1}^S(n) in pol. Zeit berechenbar.
Gesucht: Ein Alg, der zu y element {0,1}^S(n) ein x element {0,1}^n mit f(x) =
y konstruiert.

Dazu: L = {(y,x_1, ..., x_k) element {0,1}^S(n) x {0,1}^k; Es existiert x_k+1,
... x_n element {0,1} mit f(x_1, ..., x_n) = y}
Alle x_1, ..., x_k die sich zu einem Urbild von y erweitern lassen.

Alg. Urbild für f: Eingabe y element {0,1}^S(n)
1. Prüfe, ob y ein Urbild hat
2. for i = 1 to n
3. if (y, x_1, ... x_i-1, 0) element L
4. x_i = 0
5. else x_i = 1
6. return x_1, ..., x_n

Wenn L element P, können wir dies in pol. Zeit beantworten.

Zeige: L element NP
Alg. Eingabe: (y, x_1, ..., x_k) det. Eingabe, (x_k+1, ..., x_n) rand. Eingabe
1. Berechne f (x_1, ..., x_k, x_k+1, ..., x_n) = y'
2. Prüfe y = y'

Der Alg. ist pol, da f pol. ist. Wegen P = NP existiert also ein det. pol. Alg.
B für L
