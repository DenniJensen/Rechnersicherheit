##Instanz Authentisierung (Teil2)

###Eigenschaft (Biometrie)
Beobachtung und Messung von Merkmalen des Menschen

Ziel: Wiedererkennung -> Identitätsnachweis

**Natürlich**

- Gesichtserkennung ist angeboren
- Tierreich (Töne)

Biometische Merkmale
* Gesicht
* Iris
* Fingerabdruck

Verhaltungsmerkmale
* Stimme
* Gang
* Tippverhalten


Für biometrische Identifikation gut geeignete Merkmale sind:
* Einmalig: keine Person ist exact gleich
* Universel: kommt bei vielen Persionen vor
* Konstant: ändert sich Zeitlich wenig
* Messbar: mit technischen Hilfsmitteln erfassbar
* Anwenderfreundlich: schnell und bequem durchführbar


**Grundsätzlich Vorgehen**

* Enrolment:
  - Aufnahme von Merkmalen
  - Verknüpfen mit Person
* Authentisierung:
  - Aufname von Merkmalen
  - Vergleichen

####Beispiel: Fingerabdruck

Grundlage: Papillarleisten
* genetisch Festgelegt
* Beeinflusst durch Umgebung (Druck, Temp)
* bleiben bis zum Tode unverändert (Größen u. Abstände ändern sich)

Häufig Bearbeitung der biometrischen Merkmale
* keine Speicherung der gesammten Informationen
* sondern Extraktion von charakeristischen Merkmalen (Template)
* Vergleich von T. effizientes und fehlertolleranter
* keine Rekonstruktion der vollen Information möglich

**Fingerabdruckmerkmale**

* Grobmerkmale:
  - "Schleife"
  - "Wirbel"
  - "Bogen"
  - "Tanne"
* Feinmerkmale "Minuzien"
  - Endpunkt
  - Insel
  - kurze Linien
  - Verzweigungen
  - Kreuz
  - Unterbrechungen
* Feinstmerkmale
  - Poren


**technische Realisierung**

* 3D Relief -> in 2D Repräsentation
* Messsystem: optisch, kapazität, Schallbasierend

Messsystem erzeugt Graustufenbild

* Vorverarbeitung
  - Normalisierung (Kotrast, Sensorfehler)
  - Bildbewertung: Qualität und Fingerfläche
  - Richtungsbestimmung von Papillarlinien
    - Extraktion der Grobmerkmale (Rotation, Skalierung)
  - Binarisierung
    - 1 Bit Farbraum (SW)
  - Skelletierung
    - Reduktion der Linienbreite auf 1 Pixel
* Extraktion der Minuzien
  - Nachbarschaftsrelation (1 -> Endlinie, 2 -> durchgehende Linie, 3 ->
    verzweigung)
* Filterung
  - Referenz (konvexe Hülle)
  - Orientierung im Vergleich zur Grobstruktur

Vergleich
* Merkmalsvektoren
  - m = <x,y, Winkel, Typ>
  - Referenzmerkmalvektor Q = {m_1, m_2, ...}
  - R ={m_1', ...}

Ähnlichkeit: Anzahl der gefundenen Paare

Finden von Paaren
* räumliche Distanz (euklidische Distanz)
  - sd(m_i, m_j) = sqrt((x_i - x_j)^2 + (y_i - y_j)^2)
* Orientierung
  - dd(m_i, m_i') = min {|Winkel_i - Winkel_i'|, 360 grad - |Winkel_i -
    Winkel_i'|} <= Winkel_0

Unterscheidbarkeit
* Distansmertriken über Paare
  - P-Nom, P = 2 => Summe euklidischer Distanzen der Paare
  - Hammingdistanz (XOR und zählen der Einsen)

Erkennungsleistung
Fehlerwahrscheinlichkeit
* Algorithmenfehler
 - False Match-Rate (FMR)
 - False-Non-Match-Rate (FNMR)
* Systemfehler
  - False Accept-Rate (FAR)
  - False Reject-Rate (FRR)
