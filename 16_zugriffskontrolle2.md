##Zugriffskontrolle: Einleitung (Weitergeführt)
**Satz 14.1 (Safety-Problem)**

Gegeben ein Sicherheitsmodell, eine (initiale) Zugriffsmatrix M und ein Zugriffsrecht r.
Die Entscheidung, ob Sicher in Bezug auf r ist, ist unentscheidbar.

**Beweis**
Wir benutzten das Halteproblem fir TM (unentscheidbar)

- TM A = (Q, Sigma, Gamma, q_0, delta, F = {q_f})
  Übergangsfunktion delta : Q x Gamma -> Q x Gamma x {r,l}
- O.B.d.A. linksseitig beschränktes Band
- Halteproblem: Hält A bei Eingabe mit leerem Band (nur Blanksymbole B in den
  Zellen des Bandes)
- Start: A ist im Zustand q_0 und der Kopf steht auf der ersten Zelle (ganz
  links)

**Idee**
Sicherheitsmodell soll A simmulieren

* Zugriffsrechte R = Q vereinigt Gamma vereinigt {own, end}
* Subjekte und Objekte: S = O = {c_1, ...} (Zellen der TM)
* Zugriffsmatrix wird durch delta modifiziert
* Ziel: Recht q_f wird hinzugefugt g,d,w, A hält (in q_f)

Anfangskonfigration des Sicherheitsmodells M1:
| c_1
--
C_1 | {q_0,B, end}

Bedeutet: A ist Zustand q_0 ließt B und hat nur Zelle 1 besucht

**Beispiel** A hat die Zellen 1 - 4 mit wxyz beschrieben und steht im Zustand p
au Zelle 2

| c_1 | c_2 | c_3 | c_4
------
c_1 | {w} | {own} | |
c_2 | | {x,p} | {own} |
c_3 | | | {y} | {own}
c_4 | | | | {z, end}

Beschreibung der Matrixoperation über Übergangsfunktion
* Für delta(q,x) = (p,y,links)
```
command c_qx (c,c')
  if own element m_cc' , q,x element m_cc then
    delete q,x from m_c'c'
    enter y into m_c'c'
    enter p into m_cc
  end
```
* Für delta(q,x) = (p,y,rechts)
  (schon besuchte Zelle wird erneut besucht)
```
command c_qx (c,c')
  if own element m_cc', q,x element m_cc then
    delete q,x from m_cc
    enter y into m_cc
    enter p into m_c'c'
  end
```

* Für delta(q,x) = (p,y,rechts)
  (neue Zelle wird besucht)
```

```

Also:
Recht q_f wird zu M hinzugefügt gdw A den Zustand q_f erreicht, gdw A enthält
q_f.
Alg. für Safety-Problem würde auch Alg für Halteproblem liefern.

##Sicherheitsmodelle
Zwei große Kategorien von Sicherheitsmodellen
* Benutzerbestimmt (Discretionary Access Control (DAC))
* Systembestimmte (Mandatory Access Control (MAC))

###Bell-LaPadula-Sicherheitsmodell: (1973)
* Sicherheitsziel: Vertraulichkeit (Informationsfluss)
* Erstes verifiziertes Sicherheitsmodell
* Erweiterug des Matrixmodells um Systembestimmte Eigenschaften

####Einfaches Sicherheitsmodell
* Zugriffsrechte R = {read, write, execute, control} (control - Änderung der
  Zugriffsrechte)
* Sicherheitsmarken SM = {unklassifiziert, vertraulich, geheim, streng geheim}
  mit der entsprechenden Ordnung <=
  Man spricht auch von Multi-Level Sicherheitsmodell (MLS)
* Menge von Subjekten S und Objekten O mit
  - Funktion cl: S -> SM (Subjekte erhalten eine Ermächtigung)
  - Funktion cl: O -> SM (Objekte erhalten eine Einstufung)
* Zugriffsrechte Matrix M = (m_so) s element S, o element O

####Zugriffskontrolle
1) Kontrolle von Zugriffen über Zugriffsmatrix
2) systembestimmt I: Simple Security Property, no read up
   - read element m_so => cl(o) <= cl(s) (lesen nur mit entsprecheder
     Ermächtigung)
3) systembestimmt II: * - Property, no write down
   - write element m_so => cl(s) <= cl(o) (kein Informationsfluss nach unten)
4) strong Tranquility Property - Nur vertrauswürtdige Personen können M und cl
ändern (z.B. Sicherheitsbeautragte)

**Problem 1**

Need-to-know-Prinzip aufwändig umsetzbar (Nur in Zugriffsmatrix)

**Lösung**

Festlegung von Zuständigkeitsbereichen
* Menge von Bereichen Z
* Sicherheitsklassen SK = SM x Potenzmenge von Z mit partieller Ordnung <=
  (A,B) <= (A',B') <-> A <= A' und B Teilmenge B'

**Bsp**

SM = {geheim g, streng geheim sg}, Z = {LT, RT}
SM x Potenzmenge Z = (g,leere Menge), (g,{LT}), (g, {RT}), (g,{LT,RT}), (sg,
leere Menge), (sg,{LT}), (st, {RT}), (st, {LT,RT})
