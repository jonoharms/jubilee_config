	; Toolboard 20 Tool 0
	M308 S2 P"21.temp0" Y"pt1000" A"T1"				; pt1000 for toolboard T1 extruder heater
	M950 H2 C"21.out0" T2										; Heater for extruder out toolboad tool 0
	M143 H2 S300
	;M307 H1 A587 C235 D5.5 V24.1 
    ;M307 H1 A150 C50 D5.5 V24
    M307 H2 R1.892 C175.400:142.400 D4.40 S1.00 V24.1 B0
	M570 H2 P20 T15.0 S1
	;== Fans ===============================
	M950 F3 C"21.out1+out1.tach"										; Define Hotend Fan on out1
	M106 P3 S255 T45 H2											; Setup Hotend Fan for thermal control, full on when H1 reaches 45C
    M950 F4 C"0.out8" ; Creates fan 0 on pin out2 (print cooling fan)
    M106 P4 S0 H-1 L255 C"T1_cooling"; Sets fan 0 to manual control
    
	;tool
	M563 P1 S"hemera_1" D1 H2 F4								    ; Px = Tool number, Dx = Drive Number (start at 0, after movement drives), Hx = Heater Number, Fx = Fan number print cooling fan
	G10 P1 S0 R0												; Set tool 0 operating and standby temperatures(-273 = "off")
	M572 D1 S0.01											    ; Set Pressure Advance On