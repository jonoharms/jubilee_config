    ; PID Tuning Station
	;M308 S6 P"0.temp3" Y"pt1000" A"PID Tuning"					; Temp Autotune | Define Sensor for PID Tuning Station
	;M950 H6 C"0.out3" T6										; Temp Autotune | Define Heater and map to Temp Sensor for PID Tuning Station
	;M143 H6 S300												; Temp Autotune	| Set Max temp for PID Tuning Station
	;M950 F12 C"0.out7"											; Temp Autotune | Define hotend fan on 0.out7
	;M106 P12 S255 H6 T45										; Temp Autotune | Setup hotend fan for thermal control, full when H6 reaches 45