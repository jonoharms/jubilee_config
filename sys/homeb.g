	; Home Swing out Brush on B-Axis

	G91                     ; Set relative mode
	G1 B-999 F11200 H1       ; Big negative move to search for endstop
	G1 B4 F600              ; Back off the endstop
	G1 B-10 F600 H1         ; Find endstop again slowly
	G90                     ; Set absolute mode