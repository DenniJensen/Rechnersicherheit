##Das unmodifizierte RSA-Verfahren hat mehrere Schnwächen
Einsatz probabilistischer(zufällig) Verfahren notwendig

###Beispiel: Schäche 1:
RSA ist deterministisch
* Angreifer kann den Klartext raten
* mit dem öffentlichen Schlüssel verschlüsseln und dann eben vergleichen
  (Angriff funktionert nicht bei symmetr. Verfahren)

####4.3 Indistingunishability under chosen plaintext attacks (IND-CPA)
* Angreifer wählt zwei Klartexte m1 und m2
* Einer der Klartexte wird ausgewählt (mit Wkeit 1/2) und verschlüsselt
* Angreifer muss raten, welcher Klartext verschlüsselt wurde

Verfahren ist IND-CPA sicher IND-CPA sicher, wenn Erfolg des Angreifers sehr
nah bei 1/2 liegt

Einige Bemerkungen:
1. RSA ist nicht IND-CPA sicher
2. heir nur informelle Definition (-> Kryptologie)
  - Angreifer: randomisierte polynomielle Algorithmen
  - sehr nahe 1/2: Wkeit in I 1/2 - ee, 1/2 + ee [für sehr kleine ee (ee <
    1/p(n) für jedes Plolynom p und Sicherheitsniveau n)]


###Beispiel 2:(zweite Schwäche):
Die RSA-Entschlüsselungsfunktionen Zz_n -> Zz_ni c->c^d mod n ist multiplikativ

Angriff: Angreifer möchte eine Nachricht c=m^e mod n entschl.
* Wähle Wert r ee Zz_n und berechnet r^e mod n (e ist öffentlich)
* Bilde c'=c * r^e mod n = m^e * r^e mod n und überredet den Schlüsselinhaber
  c' zu entschlüsseln (z.B. für eine Probeverschlüsselung)
* Angreifer erhähl c'^d = (m^e * r^e)^d = (m^e)^d * (r^e)^d = m * r mod n
* Multiplikation mit r^-1 liefert m

###Beispiel 3: (dritte Schwäche)
Kleine Verschlüsselungsexponenten: Sei e=3
* Angreifer kennt Geheimtexte c1 = m^e mod n, c2 = (m+1)^e mod n
* Berechnung von m ohne Kenntnis von d

(c2 + 2c1 - 1) / (c2 - c1 + 2) = ((m+1)^3 + 2m^3 - 1) / ((m+1)^3 - m^3 + 2)
= ((m^3 + 3m + 3m^2 + 1) + 2m^3 - 1) / ((m^3 + 3m + 3m^2 + 1) - m^3 + 2)
= (3m^3 + 3m^2 + 3m) / 3m + 3m^2 + 3 = m  (m ausgeklapper und rest dann weg)

Verallgemeinerung: Für m2 = alpga m1 + beta und beliebige Exponenten e:
Laufzeit von 0(e^2): also nur für kleine e praktikabel

###Lösung(für alle drei Schwächen): Setze probabilistische Verfahren ein
(Klartext | Zufallswert) -> Vermischung -> RSA -> Geheimtext

Vorteile:
* Klartextraum wird vergrößert
* Annährung an die Gleichverteilung (erschwert statistische Angriffe)
* Alle drei Angriffe nicht mehr möglich

###Beispiel: Optimal asymmetric encryption padding OAEP
(hier kommt noch ne Skizze!!!)
* Auffüllen von m mit k1 Nullen
* r: Zufall der Länge k0 >= 100 Bit
* G erweitert r auf k - k0 Bits
* H reduziert auf k0 Bits
* x = (m||0...0) x+r G(r)
* y = H(x) x+r r

m_r:= x || y wird verschlüsselt

Empfänger entschlüsselt, erhählt m_r = x || y
* Berechne r = y x+r H(x)
* m || 00..0 = x x+r G(r)

Übung RSA-OAEP ist IND-CPA sicher wenn G und H Einwegfunktionen sind.

##Elgamal: Entwickelt von Taher Elgermal 1984
Sicherheit beruht auf dem Problem des diskreten Logarithmus

###Problem DL: (Gruppe G)
Eingabe: Zwei Elemente g,h ee G
Ausgabe: log_g h, d.h. x ee N mit g^x = h

G heißt kryptographisch stark, wenn das DL-Problem in G praktisch nicht lösbar
ist

Bsp: Zz*_p = {1,..,p-1}, p sehr große Primzahl
* Diese Gruppen sind zyklisch, d.h. es gibt g ee Zz*_p mit {g^n; n ee N} = Zz*p
  g heißt auch Erzeuger der Gruppe
* Ist g ee Zz*p ein Erzeuger, dann ex. für alle h ee Zz*p ein x ee N mit g^x=h
  D.h. log_g h = x existiert

####Schlüsselerzeugung:
* Wähle eine endl. zyklische Gruppe G und einen Erzeuger g ee G
* Wähle j <= |G| - 1 und setze h = g0
* Geheime Schlüssel: j i öff. Schlüssel: (h,g,G)

####Verschlüsselung: einer Nachricht m ee g
* Wählen k<= |G| - 1, setzen f = g^k
* Verschl.: (f, c=h^k * m)

####Entschlüsselung:
Berechne fv * c = g^(k*j) * h ^ k * m = g^(-k*j) * g^(h*j) * m = m
