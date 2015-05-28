##9 Schlüsseleinigung/ -austausch
**Ziel**
Sicherer Schlüsselaustasch über unsichere Kanäle
A -> Oscar -> B

* initiale Schlüsseleinigung für erste Kommunikation
* Schlüsselerneuerung für weitere Kommunikation
  Forward Secrecy (Brechen eines alten Schlüssels soll die folgenden
  Kommunikationen nicht auch kompromitieren)

###Hybride Verfahren
A will B eine vertrauliche Nachricht m schicken
* B besitzt Schlüsselpaar (pk, sk) (z.B. für RSA)
* A vertraut pk (weiß das dieser B gehört)

A öffl. Schlüssel pk = (e,n) | |         B geheimer Schlüssel sk = d
------------------------------|-|---------------------------------------
Wähle Zufallsschlüssel k  |            | Berechne k = (k')^d mod n
Berechne k' = k^e mod n    |  -- k',c ->   | und m =dec(c,k)
und c = enc(m,k)           |   

####Eigenschaften
* Für jede Kommunikation wird ein neuer symme. Schlüssel
* Keine Forward Secrecy: Berechne von sk führt zur Kompromitirung aller symm
  Schlüssel.

###Diffie - Hellman - Schlüsseleinigungsverfahren (1976)
Sicherheit beruht auf Diskrete Logarithmusproblem, also
* Wir rechnen in Z^*_p, p sehr große Promzahl
* Wir brauchen einen Erzeuger g element Z^*_p (um kleine Untergruppen
  auszuschließen)

A Parameter (p,g)  |           |  B Parameter (p,g)
-------------------|------------|-----------------------
Wähle Zufall x      |        | Wähle Zufall y
Berechne X = g^x mod p |  -- X -> | Berechnet Y = g^y mod p
||
Berechne Y^x mod p  |          |Berechne Y = X^y mod p
               ||
(g^y )^x mod p    |             | (g^x )^y mod p
g^yx mod p       |             | g^xy mod p


Aus g^xy mod p lassen sich dann Schlüssel für z.B. Secure Messaging:
* Verschlüsselung k_c = Hash (g^xy mod p || 0x00)
* Authentisierung k_a = Hash (g^xy mod p || 0x01)

**Sicherheit**
Angreifer: kennt Parameter(p,g) und sieht X = g^x mod p und Y = g^y mod p
Ziel: Bestimme g^xy mod p. Einzige derzeit bekannte Methode. Bestimme x oder
y (d.h berechne log_g X oder log_g Y)
-> D.L. ist schwer

**Forward Secrecy**
Wenn immer neue Zufallszahlen x,y gewählt werde
* umgesetzt im tls (siehe Kap. Internetsicherheit)
* Kürzel DHE (E steht für ephemeral (flüchtig))

Aber folgender (aktiver) Angriff (Man in the Middle)
A: X = g^x mod p --X--> O: Z = g^z mod p --Z--> B: Y = g^y mod p
Z^x = g^xz mod p <--Z-- X^z = g^zx mod p <--Y-- Z^y = g^yz mod p
                        Y^z = g^zy mod p

Lösung:
Authentisierung der Schlüsselanteile g^x, g^y (über MAC, Signatur, Password)

Übung: Geben sie ein sicheren Schlüsseleinigungsverfahren auf Basis DH und
Signaturen an.
Signieren X mit geheimen Schlüssel

**SPEKE**
Simple Password Exponentail Key Exchange
Bsp.: für ein Password-Authenticated Key Agreement Protocol

* Parameter q prim mit p = 2 * q + 1 prim und Hashfunktion H
* A und B haben ein gemeinsames Passwort pi

A Paramter (p,H, pi) |             |  B Parameter (p,H, pi)
---------------------|-------------|---------------------------
Berechne g = H(pi)^2 mod p |       |  Berechne g = H(pi)^2 mod p
Wähle Zufall x        |          |  Wähle Zufall y
Berechne X = g^x mod p |    -- X --> |  Berechne Y = g^y mod p
Y^X = g^xY mod p       |    <-  Y --  |  X^Y = g^Xy mod p
                          

Die Wahl von p = 2 * q + 1 prim : Z^*_p = {1, ..., p-1}
Jede Untergruppe U von Z^*_p : |U| / |Z^*_p| = p - 1 = 2 * q
D.h. Z^*_p hat genau 2 Untergruppen U_1 und U_2 eine mit Ordnung 2 und eine mit
Ordnung q.
g = H(pi)^2 mod p => g liegt in der Großen Untergruppe und erzeugt, da q prim
keine kleine Untergruppe in dieser.

###Needham - Schroeder - Protokoll
* Datenaustausch in unsicheren dezentralen Netzen
* Schlüsselaustausch und Authentisierung
* symm. und asymm. Versionen, eingesetzt in Kerberos

####Symm. Version
Es wird in Authentifizierungsserver (AS) benötigt
* A und B (kommunikation Partner) haben jeweils symm. Schlüssel K_A und K_B
  (die auch dem AS bekannt sind)

 A K_A     |          AS K_A K_B         |      B K_B
----------------|----------------------------|--------------------
Wähle Nonce N_A  ||      Wähle Schlüssel K   

T = enc_K_A (A ||B||N_A) | -- T -->   T_B = enc_K_B(K||A) |   dec_K_B(T_B)
 T_A = enc_K_A       Nonce N_B
dec_K_A (T_A)           <-- T_A --   (N_A||B||K||T_B)      T_BA =  enc_K (N_B)
Schickt T_B zu B                                       schickt T_BA zu A
N_B = dec_K (T_BA) 
T_AB = enc_K(N_B - 1) 
Schickt T_AB zu B                                    Prüft T_AB

**Ziel**

Authentischer Schlüsselaustausch zwischen A und B

**Nonce**

Number only used once (jedes mal neu zu wählen)
Nonce verhindert Replay-Attacke

####Replay-Attacke
Wiedereinspielung zuvor belauschter Kommunikation

**Ziel**

Vortäuschen einer Identität
