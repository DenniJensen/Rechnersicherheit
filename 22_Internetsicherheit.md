####IP Security

Zwei Mechanismen:
* Authentication Header
  - Nur Datenauthentisierung
  - Empfehlung: Nicht mehr umsetzen
* Encapsulating Security Payloads (ESP)
  - Verschlüsselung + Authentisierung

######Internet Key Exchange Protocol (IKEv2)
Schlüsselaustausch

* Mit und ohne Instanzauthentisierung (über Zertifikate oder PMK (vorab
  ausgetauscht werden))
* Generierung von Security Associations (SA)
  - Für Kommunikation A -> B und B -> A jeweils eigene
* Inhalt SA: Schlüssel für Verschl. + Auth.), IV, Alg. Identifier
* SAs sind über Identifizierbar über Security Parameter Index (SPI, 32 Bit)

**ESP: Zwei Modi**

* Transportmodus: A--IPSEC--B
  - Paket: IP-Header | ESP-Header (Seq-Nr, SPI) | TCP-Header | Payload |
    ESP-Auth
  - Verschlüsselt: TCP-Header + Payload
  - Authentisiert: ESP-Header + TCP-Header + Payload
* Tunnelmodus: {A, B} -- Security Gateway --IPSEC-- Security Gateway --
  {A',B',C'}
  - Paket: Neuer IP-Header | ESP-Header | Org-IP-Header | TCP-Header | Payload
    | ESP-Auth
  - Verschlüsselt: Org-IP-Header + TCP-Header + Payload
  - Authentisiert: Esp-Header + Org-IP-Header + TCP-Header + Payload


###Angreifertyp 2: Netzwerksicherheit

**Bsp.: rlogin**

* rlogin host-based-Auth
  - Nutzer it in einem Vertrauenswürdigen Rechner eingeloggt
  - Einloggen in einen anderen Rechner ohne Eingabe Passwort möglich
* Festlegung in /etc/hosts.equiv (root) oder rhosts (Nutzer)

* Verbindung zwischen zwei Rechner (C,S) über TCP
  - Verbindungsaufbau (TCP-Handshake)
    1) C->S: SYN, ISS_C (32 Bit Seq-Nr)
    2) S->C: SYN|ACK, ISS_S, ACK(ISS_C) := ISS_C + 1
    3) C->S: ACK, ISS_C + 1, ACK(ISS_S)
  - SYN (Synchronisation), ACK (Acknowledgement): Flags im TCP-Header
* Verbindung: TCP-Pakete mit Seq-Nr, Empfänger quitiert (ACK)
* Verbindungsabbu: C oder S schicken FIN-Flag

#####TCP-Session-Hijacking

* Senden eines Befehls über rlogin uf S mit Privilegien eines Nutzers U
* Nebenbedingung: U ist bereits auf C eingeloggt sein

**Vorgehen**

* Angreifer A beginnt Handshake mit S (mit der Adresse von C)
  - A (C) -> S + ISS_A(C)
* Problem: Antwort on S wird an C geschickt (A kennt ISS_S nicht)
* Lösung: ISS ist i.A. nicht zufällig (wird einfach hochgezählt)
  - Berkly-Unix: Jede Sekunde + 128, für jeden Versuch + 64
* Angreifer baut zunächst eine reguläre Verbindung zu S auf, erhält ISS_S
* Danach sofort: A(C)->S: ISS_A(C); S->C:ISS'_S
  - ISS'_S ist mit großer Wahrscheinlichkeit zu erraten (wegen Kenntnis ISS_S)
* Problem 2: C erhällt Antwort auf ein Paket, dass er nicht gesendet hat
  (schickt FIN)
* Lösung 2: TCP Syn Flooding (typ. Dos-Attcke)
  - A sendet SYN-Anfragen an C ohne auf Cs ACK zu antworten
  - A hält alle Verbindungsanfragen offen (bis Maximum erreicht ist)
  - ACKs von S werden nicht mehr verarbeitet
