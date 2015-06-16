**Problem 1**

Need-to-know-Prinzip aufwendig umsetzbar. Nur mittels Zugriffsmatrix

**Lösung** Festlegung von Zuständigkeitsbereich

###Sicherheitsklassen
SK = SM x Potenzmenge (Z) (Z Zuständigkeitsbereiche) mit partieller Ordnung <=
: (A,B) <= (A',B') <=> A <= A' und B <= B'

Darstellung: (A,B) -> (A',B') heißt (A,B) <= (A',B')
Wir schreiben nur die unmittelbaren Nachfolger hin.

* Ereiterung der Funktionen cl (cl:S -> SM, cl:O -> SM)
  - sc: S -> SK = SM x Potenzmenge (Z). Bedeutung von sc(s) = (A,B)
    - Subjekt S hat die Ermächtigung A
    - S ist Subjekt im Zuständigkeitsbereich b für alle b element B
  - sc: O -> SK


**Formal:** SK zusammen mit <= bildet ein Verband

1) (SK,<=) ist eine partielle Ordnungsrelation
     (transitiv, reflexiv, antisymmetrisch)
2) Für je zwei Elemente A,B element SK gilt:
   a) es gibt ein eindeutiges Infimum glb(A,B) element SK (great lower
       bound) d.h. glb(A,B) <= und für alle L <= A,B gilt L <= glb(A,B)
   b) es gibt ein eindeutiges Supremum lub(A,B) (least upper bound)


* Information nur über die vom Verband festgelegte Halbordung (liefert
    Sicherheitsmodell: Verbandmodelle)

* Bell-LaPadula: Erweiterung ist ein Bsp hierfür


**Problem 2**

Kein Schreiben von oben nach unten.
Vorgesetzer mit hoher Ermächtigung kann keine Anweisung an Untergebene mit
kleiner Ermächtigung schreiben

**Lösung**

Zeitlich beschränkte niedrigere Sicherheitsklassen.

Genauer: Es gibt für Subjekte zwei Funktionen
* sc_s(s): Sicherheitsklasse von s
* sc_c(s): aktuelle Sicherheitsklasse von s
* Es gilt stehts: sc_c(s) <= sc_s(s) für alle s element S

**Problem 3**

kein Integritätschutz
* star-Property erlaubt schreiben nach oben und damit eventuell Änderung
  eingestufter Informationen
* Übung: Biba-Modell liefert Integritätsschutz

**Problem 4**

Keine Erfassung verdeckter Informationskanäle


## Zugriffsmodelle

Access Controll
* Discretionary AC
  - Zugriffsmatrix
  - Zugriffslisten (AC-List)
  - Cabability List
* Role-based AC
* Mandatory AC (Systembasierte)
  - Multi-Level AC
    - Bell LaPadula
    - Biba Modell
  - Clark Wilson Modell
  - Multilateral AC
    - Verbandsmodelle
    - Chinese Wall modell

###Chinese Wall

Ziel: keine (bewusste oder unbewusste) Weitergabe von Insiderwissen
* Entwicklung von Brewer/Nash 1989

* R: Zugriffsrechte read, write-only
* S: Subjekte (Berater)
* O: Objekte (Dateien), F Firmen
* y: O -> F Jedem Objekt ist Firma zugeordnet
* Konfliktklassen K_1, ..., K_n enhalten Firmen (disjunkt)
* Ziel: kein Informationsfluss zwischen Firmen einer Konfliktklasse

* x: O -> {K_1, ..., K_n, leere Menge} Objekt o wird Konfliktklasse x(o)
  zugeordnet
  - Sonderfall x(o) = leere Menge: O darf immer gelesen werden
* (x(o), y(o)) heißt Sicherheitslabel von o
* Matrix N_t (m^t_so) s element S, o element O: Zugriffshistorie zum Zeitpunkt
  t.
  n^t_so element R: Alle Rechte, mit denen s bisher auf o zugegriffen hat.
* Zwei Regeln:
  - Kein direkter Informationsfluss
  - Kein indirekter Informationsfluss
