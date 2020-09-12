	; Bed Heater Definitions 
	M308 S0 P"0.temp0" Y"thermistor" T100000 B3950 A"Bed"		; Thermal Sensor mounted on edge of bed
	M950 H0 C"0.out0" T0										; Define pins for Heated Bed H = Heater 0, C is output for heater itself, T = Temperature sensor (defined above)
	M140 H0														; map heated bed to heater 0
	M143 H0 S130												; Set maximum temperature for bed to 130C
	M307 H0 A326.2 C483.0 D1.9 S1.0 V24.1 B0					; PID Tuning default for AC silicone bed heater

;	M307 H0
;Heater 0 model: gain 326.2, time constant 483.0, dead time 1.9, max PWM 1.00, calibration voltage 24.1, mode PID
;Computed PID parameters for setpoint change: P139.5, I4.613, D185.0
;Computed PID parameters for load change: P139.5, I16.170, D185.0