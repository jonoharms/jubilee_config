	; Toolboard 20 Tool 0
	M308 S1 P"121.temp0" Y"thermistor" T100000 B4725 C7.06e-8 A"T0"		; Thermistor for toolboard T0 extruder heater
	M950 H1 C"121.out0" T1										; Heater for extruder out toolboad tool 0
	M143 H1 S300
	M307 H1 A587 C235 D5.5 V24.1

	;== Fans ===============================
	M950 F1 C"!121.out1+out1.tach"										; Define Hotend Fan on out1
	M106 P1 S255 T45 H1											; Setup Hotend Fan for thermal control, full on when H1 reaches 45C
    M950 F2 C"121.out2" ; Creates fan 0 on pin out2 (print cooling fan)
    M106 P2 S0 H-1 ; Sets fan 0 to manual control
    
	;tool
	M563 P0 S"Hemera" D0 H1 F2								    ; Px = Tool number, Dx = Drive Number (start at 0, after movement drives), Hx = Heater Number, Fx = Fan number print cooling fan
	G10 P0 S0 R0												; Set tool 0 operating and standby temperatures(-273 = "off")
	M572 D0 S0.05											    ; Set Pressure Advance On