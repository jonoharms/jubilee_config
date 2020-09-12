	G30 P0 X150 Y5 Z-99999		; probe near back leadscrew
	G30 P1 X285 Y285 Z-99999	; probe near front right leadscrew
	G30 P2 X15 Y285 Z-99999 S3	; probe near front left leadscrew and calibrate 3 motors
	;G28 Z
	;G1 X0 Y0 F10000