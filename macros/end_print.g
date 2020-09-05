; Custom gcode to run at end of print

M104 S0 T0		; turn off extruder 0
M104 S0 T1		; turn off extruder 1
T-1         	; desect current tool
G91 			; relative moves
G0 Z30  		; move bed down another 30mm
G90 			; absolute moves
M140 S0 		; turn off bed
G0 X0 Y0 F30000	; return home
M84 S600		; disable motors after ten mins of inactivity