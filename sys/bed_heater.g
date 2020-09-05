	; Bed Heater Definitions 
	M308 S0 P"0.temp0" Y"thermistor" T100000 B3950 A"Bed"		; Thermal Sensor mounted on edge of bed
	M950 H0 C"0.out0" T0										; Define pins for Heated Bed H = Heater 0, C is output for heater itself, T = Temperature sensor (defined above)
	M140 H0														; map heated bed to heater 0
	M143 H0 S130												; Set maximum temperature for bed to 130C
	M307 H0 A413.7 C1010.6 D24.2 S1.0 V24.0 B0					; PID Tuning default for AC silicone bed heater