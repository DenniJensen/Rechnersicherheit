#2. Einführung in die Kryptology

Kryprotology = Kryprographie + Kryptoanalyse
- Kryptos (altgr. gehein) + graphein(Schreiben)

WSpr. Verschlüsselung, heute Design kr. Verfahren für Verschlüsselung,
Datenleisungen, Signatur, Schlüsseleinigung

Kryptoanalyse: analysein (altg. untersuchen)
Ziel: Ausnutzung von Schwächen oder Beurteilung

Kerkhoffsche Prinzipien (niederländischer Linguis und Krypolot, 1883)
1. Wenn ein System nicht theoretisch beweisbar Sicher ist, so sollte es
   praktisch sicher sein
2. Das Design sollte keiner Geheimhaltung erfordern (no security by obscurity)


###Verschlüsselung
Klartext -> Verschlüsselungsverfahren(mit Schlüssel) -> Geheimtext ->
Entschlüsselung(mit Schlüssel) -> Klartext

####Bsp.: CEACAR-Verfahren
Sei E(Sigma) = {A,B...., Z} = {0,1,...,25} = Z26
Verschlüsselung: Für Schlüssel k <- Z26; x -> (x+k) mod 26
Entschlüsselung: Für Schlüssel k <- Z26; x -> (x-k) mod 26

F: E* x Z26 -> E*; ((x1,...,xn)k) -> (f(x1)),...,f(xn)
F(CAECAR, 3) = F((2,0,4,2,0,17), 3) = (5,3,7,5,3,20) = FDHFDU

Nach Kerchoff II: Gegner kennt das Verfahren vollständig
* Zuordnung(Kodierung) A <-> 0, B <-> 1, ...
* die Funktion F
Sicherheit hängt allein von der Geheimhaltung des Schlüssels ab.
Exhaustion des Schlüsselraums: Durchprobieren von 26 Schlüssln

####Verallgemeinerung: Bsp. E = Z26
Ersetze Buchstaben beliebig (A auf B, B auf A, C auf Q...)

Also F(CAECAR, k) => QDSQDZ

####Anzahl Schlüssel:
A kann durch 26 Buchstaben ersetzt werden, B durch 25, C durch 24...
26! ~ 2^88 verschiedene Schlüssel = Schlüsselexhanstion nicht möglich

Anderer Angriff: Relativen Häufigkeiten von Bst in sinnvollen deutschen Texten.
E: 17.4%, N: 9,78%, I: 7,55%, .., Q: 0,02%
Die raltiven Häufigkeiten werden übernommen. Im Bsp. E -> S

###Ein absolut sicheres Verschlüsselungsverfahren.  Bsp. (One time pad)
* Klartext sind Bitstrings (x1,.., xn) ee {0,1} ^ n
  z.B. Kodierung uuber ACII-Code A = 01000001, B = 0100010,...
* Schlüssel k ee {0,1} ^ n
* Verschl: F: {0,1}^n x {0,1}^n; (x,k) -> (x o+r k)
  (o+r: Komonentenreis Addition mod 2)
* Entschl: Wegen k o+r k = (0,...,0) gilt (x o+r k) o+r k = x
* Siherheit: Angreifer kennt Geheimtext y=(y1,..yn) = (x1 o+r k1,.., xn o+r kn)
* Ziel: Rekonstruktion des Klartext ohne Kenntnis des Schlüssels

Schlüssel k = (k1,..., kn) zufällig gewählt, d.h. für alle i<=n
  Pr(k_i = 0) = Pr(k_i = 1) 1/2 (Münzwurf)

####Im inforationstheoretischem Sinne:
Absout sicheres Verschl.-verf. gegenüber Angreifern mit unbeschränktem
Resourcen.
- Nachteil: Schlüssellänge = Textlänge(eigentlich Informationsgehalt)
  **Nicht praktikabel**
- Idee: Nutze Schlüssel k ee {0,1}^n mehrmals für text x1, x2, .. ee {0,1}^n

y1 o+r y2 = (x1 o+r k) o+r (x2 o+r k) = (x1 o+r x2)
y2 o+r y3 = x2 o+r x3
==
1. Rate einen Text für x1
2. Berechne x1 o+r (y1 o+r y2) = x2
3. Ist x2 ein sinnvoller Text, dann ist mit großer Wkeit x1 richtig gerade, x2
   richtig berechnet

###Ergebnis von Shannon 1948
Satz 2.1: Ein Verschlüsselungssystem kann nur dann absolut sicher sein, wenn
die eingesetzte Schlüssellänge genauso groß ist wie der zu verschlüsselnde
Text(Informationsgehalt)

Kerckhoff I: Wenn nicht beweisbar dann praktisch sicher.
Wie messen wir Sicherheit?
* Sicherheitsniveau n-Bit: Angreifer benötigt zum Brechen 2^n Versuche.
  - Schlüsselexhaustion (>= 2^n verschiedene Schlüssel)
  - Andere kryptoanalytische Methoden (z.B. statistische Angriffe)
* Heute gefordertes Sicherheitniveau 100Bit (128 Bit)
