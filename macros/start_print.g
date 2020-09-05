; Custom gcode to run at beginning of a print

G90 				; absolute moves
T-1 				; Make sure nothing is parked on the carriage
G0 X150 Y150 F10000	; Move to the center of the print area
M558 F500  			; Set the probing speed
G30 				; Do a single probe
M558 F50 			; Set a slower probing speed
G30 				; Do a second probe
T[current_extruder]