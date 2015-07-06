##Internetsicherheit

lokales Netz (Client) - Router --- Router - Internet Service Provider (ISP)
lokales Netz (Server) - Router --- Router - ISP

ISP - Internet Exchange Point (IEP) - ISP

IEP weltweit 135

Für unsere Untersuchung betrachten wir 3 Angreifertypen
* Typ 1: hat Zugang zu einem Zwischenknoten (ISP) und versucht:
  - passive Angriffe durchzuführen (ausspähen) - Verletzung Vertraulichkeit
  - aktive Angriffe durchzuführen (manipulationen) - Verletzung Integrität +
    Verfügbarkeit
* Typ 2: versucht ein Endknoten (lokales Netz, Client oder Server) anzugreifen
  - Eindringen in das lok. Netz: Verletzung von Vertraulichkeit, Integrität und
    Verfügbarkeit
* Typ 3: ist ein bösartiger Endknoten (Server) der versucht einen falschen
  Server vorzugaukeln


###Angreifer Typ 1: Kommunikationssicherheit

* Sicherheit spielte in der Anfangszeit des Internet keine Rolle
* Keine Mechanismen für Verschlüsselung und Authentizität vorgesehen

####TCP/IP Referenzmodell

OSI - Layer | TCP/IP Layer |
--|--||--
7 -5 | Application Layer | http, ftp, smtp, ...
4 | Transport Layer | TCP, UDP
3 | Internet Layer | IPv4, IPv6
1-2 | Link Layer | Ethernet, FDDI

**Typischer Aufbau**

MAC Adressen |IP-Header IP-Adressen | TCP-Header Ports, Sequenzenummer | Nutzlast ca 1400 Byte | Frame Check

#####Schutzmaßnahmen (Verschlüsselung + Authentisierung)

* Auf Application Layer
  - S/MIME (Secure/ Multipurpose Internet Mail Extention)
  - Open-PGP (Pretty Good Privacy)
  - ssh (Secure Shell)
* Auf Transport Layer
  - tls (transport layer Security)
* Auf Internet Layer
  - IPSec

######Transport Layer Security (TLS)

Bietet
1. Symmetrische Verschlüsselung der Nutzlast (AES, Triple-DES)
2. Datenauthentisierung der Nutzlast (HMAC)

Application Layer --- Handshake Prot. | Change Cipher Prot | Alert Prot |
Application Data Prot. --- Record Prot. (Verschlüsselung + Authen.)--- TCP

1. Client: Random r_1
2. Client -> Server: Client_hallo
   - tls-Version
   - time, r_1
   - session_id,
   - cipher-suit-Möglichkeiten
   - (Alg. für Instanz- und Datenauth, Schlüsseleinigung, Verschlüsselung)
   - Bsp1: TLS_RSA_with_AES_128_CBC_Sha256
   - Bsp2: TlS_DHE_RSA_...
3. Server: Random r_2
4. Server -> Client: Server_hallo
   - tls-Version
   - time
   - r_2
   - session_id
   - Cipher_suite (ausgewählt)
5. Server -> Client: Server-Zertifikat C_s (pk_s)
6. Server -> Client: Demand Client-Zertifikat (Optional)
7. Client: Verify Server Zertifikat
   - Root Zertifikat zum Validieren werden mit Browser mitgeliefert
8. Client -> Server: Client-Zertifikat C_c (pk_c) (Optional)
9. Server: Verify C_c (Optional)
10. Client: Signatur über alle bisherigen Daten (mit sk_c) --> Server (Optional)
11.
 * Fall 1 DHE: Client <-> Server
     - Austausch eines Geheimnisses G uber auth. Diffie-Hellman
     - Signatur über sk_s und (Optional sk_c)
     - Ableitung eines Pre Master Key aus G, r_1 und r_2
 * Fall 2 RSA: Client -> Server
     - Client generiert Pre Master Key PMK aus zufällen r_1, r_2 und weiteren
       Zufall
     - Client schickt PMK verschlüsselt (mit pk_s) an den Server
12. Client, Server: Ableitung von Verschlüsselungs-, Datenauth.-schlüssel und
IV
13. Client <-> Server:
    - Change Cipher Spec (ab jetzt wird verschlüsselt und authentisiert)
    - Hashwerte aller bisher ausgetauschten Daten (Kontrolle)

**Authentisierung Server**

* Fall RSA
  - Nur der Inhaber des Zert. C_s kann den PMK entschlüsseln (in 13 wird
    überprüft)
* Fall DHE
  - g^y ist vom Zert. Inhaber signiert

**Authentisierung Client**

* Fall DHE
  - g^x vom Client signiert
* Fall RSA
  - Client signiert in 10 u.a. r_2 (challenge-response)

* Keine Replay-Att möglich (r_1, r_2)
