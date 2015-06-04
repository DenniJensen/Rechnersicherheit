#13 Zugriffskontrolle

##Einleitung
Authentisierung (Subjekt behauptet Identität) [Subjekt] -> Authentifizierung (Identität
wird geprüft) [IT-System] -> Authorisierung (Darf Subjekt S auf ein Objekt O
zugreifen) [Reference Monitor] -> Zugriff (lesen, schreiben, löschen) [Objekt]

###Zugriffskontrolle
Wer darf im System (wann) auf welche Ressourcen zugreifen

* Subjekt: Initiator einer Handlung
  - Benutzer, Gruppen, Prozesse
  - Genauer: Prinzipals sind verschiedene Subjekte zugeordnet
* Objekte: Gegenstand der Handlung
  - Dateien, Prozess (Subjekte können auch Objekte sein)
* Zugriffsrechte (Access Rights)
  - lesen, schreiben, löschen, hinzufügen
  - ausführen (z.B. Nutzung eines Schlüssel)
  - Zeit und ereignisabhängig

####Reference Monitor
Setzt das gewählte Sicherheitsmodell um.

Umsetzungen: Anwendung, Middleware, Betriebsystem Hardware

###Zugriffsmatrix
Einfachste Form eines Sicherheitsmodells

* S: Menge von Subjekten, O: Menge von Objekten, R: Zugriffsrechte
* Zugriffsmatrix M = (m_so) s element S, o element O mit m_so Teilmenge von R

Subjekt s hat auf Objekt o hat Zugriffsrecht r element R, wenn r element m_so

| Datei 1 | Datei 2 | Datei 3 | Prozess 1
-----
Nutzer 1 | {read,write} | | {read} |
Nutzer 2 | | | |
Nutzer 3 | | | | {execute}
Nutzer 4 | {read} |||

Matrix häufig dünn besetzt

* Access Control List: Speicherung Rchter der Subjekte beim Objekt
  - Spalten der M: ACL(Datei 1) = ((Nutzer 1, {read,write}), (Nutzer 4,
    {read}))
* Capabilities: Speicherung der Rechte an Objekte beim Subjekt
  - Zeilen von M: Clist(Nutzer 3) = (Prozess 1, {execute})

**Vorteil**

Transparent, leicht zu verifizieren

**Nachteil**

Schlecht Skalierbar, Änderung schwer umsetzbar

**Mögliche Abstraktion**

* Gruppen, Zuständigkeitsbereiche, Rollen, Sicherheitslevel
* Negative Zugriffsrechte
* Protection Rings: Level von Zugriffsrechten
  - 0 OS Kernel
  - 1 OS
  - 2 Services
  - 3 User Prozesse

Unterscheiden;
* statische Zugrismatrix: M ändert sich nicht (z.B. Firewalls)
* dynamische Zugriffsmatrix: M ändert sich (Klassisches OS)

###Modelle

####Harrison-Ruzzo-Ullman (HRU)
Notwendige Verallgemeinerung: Änderung der Zugriffsmatrix bei
* neuen Subjekte und Objekte
* Änderung von Zugriffsrechten

Änderung der Matrix basieren auf 6 Basisoperatoren
* enter r element R to or delete r element R from m_so
* create or destroy subject s element S
* create or destroy object o element O

Typischer Aufbau von Kommandos
* Abhängig von erlaubten zugriffen (if r_1 element m_s1o1, ... r_n element
  m_snon then)
* werden Basisoperationen ausgeführt

**Bsp command create file (s,f)**
```
create f
enter owner into m_sf
enter reat into m_sf
enter write into m_sf
end
```

**Bsp command grant ReadWrite(s,p,f)**
```
if owner m_sf then
  enter read into m_pf
  enter write into m_pf
end if
end.
```

M -c-> M': Kommando c überfuhrt M in M'

**Frage** Welche Konzequenzen hat dies auf die Sicherheit?

**Definition 13.1**

Sei r element R ein Zugriffsrecht. Eine Matrix M ist unsicher in Bezug auf r,
wenn es ein Kommando c mit r nicht element m_so -c-> m_so' enthält r

Hinweis: Bedeutet nicht, dass das Modell dann unsicher ist.
(Inhaber der Datei das Recht hinzufügt)

**Frage** Kann das Recht r auch von einem anderen Subjekt hinzugefügt werden?

####Formalisieren: Sicherheitsmodell als Transitionssystem

* Menge von Rechten R (endlich) Subjekte S und Objekte O
* endliche Menge C von Kommandos
* Wir interpretieren Matrizen M = (m_so) s element S', o element O', S' element
  S, O' element O (endlich) als Zustände
* Kommandos c element C definieren die Übergangsfunktion

**Def.: 13.2**

Eine Zugriffsmatrix M ist Sicher in Bezug auf r element R, wenn für keine Folge
von Kommandos gilt r nicht element m^1_so -c_1-> m^1_so -c_2-> ... -c_t->
m^t_so enthält r

Harrison, Ruzzo, Ullman (1976)
**Satzt 13.3 (Safety-Problem)**

Gegeben ein Sicherheitsmodell, eine (initiale) Zugriffsmatrix M und ein
Zugriffsrecht r. Das Problem ob M sicheer in Bezug auf r ist, ist
unentscheidbar.

Dieser Satz bedeutet nicht, dass Sicherheitsmodelle grundsätzlich nicht
verifizierbar sind. Es gibt nur kein allgemeines Verfahren.

**Folgerung**

Sicherheitmodelle müssen einfach sein

**Satz 13.4**

Das Safety-Problem ist für Sicherhetismodelle entscheidbar, in denen jedes
Kommando genau eine Basisoperation ausführt. (mono-operational)
