	; Toolboard 20 Tool 0
	M308 S1 P"121.temp0" Y"thermistor" T100000 B3950 A"T0"		; Thermistor for toolboard T0 extruder heater
	M950 H1 C"121.out0" T0										; Heater for extruder out toolboad tool 0
	M143 H1 S300												; Set maximum temperature for hotend to 300C
	M950 F1 C"!121.out1"											; Define Hotend Fan on out1
	M106 P1 S255 T45 H1											; Setup Hotend Fan for thermal control, full on when H1 reaches 45C
;	M950 F5 C"20.out2"											; Define Part Cooling fan on out2
;	M106 P5 C"Part Cooling T0"									; Setup Part Cooling Fan as Part Cooling T0
	M563 P0 S"Tool 0" D0 H1 								; Px = Tool number, Dx = Drive Number (start at 0, after movement drives), Hx = Heater Number, Fx = Fan number print cooling fan
	G10 P0 S0 R0												; Set tool 0 operating and standby temperatures(-273 = "off")
	M572 D0 S0.05											    ; Set Pressure Advance On