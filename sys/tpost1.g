; runs after firmware thinks Tool1 is selected
; Note: tool offsets are applied at this point!
; Note that commands prefixed with G53 will NOT apply the tool offset.

	M116 P1						; Wait for set temperatures to be reached
	; Note that commands preempted with G53 will NOT apply the tool offset.

	G53 G0 X165 Y255 F17000		; Rapid to the approach position without any current tool.
	M302 P0						; Allow extrusion above 185 
	G1 E4 F100					; Purge the Nozzle
	G4 S1						; Slight Delay
	G1 E-1.0 F2000				; Perform a retract to remove filament pressure.
	G91							; Set Relative Movements
	G1 Z3	                    ; Pop the Z up slightly to avoid scraping carriage limit switch on pull-back for early layers.
								; Also clear any dangling debris on purge towers.
	G90							; Restore Absolute Movements
	G53 G1 Y323 F12000			; Move to the pickup position with tool1.
	G53 G1 Y326 F600			; Move to the pickup position with tool1.
	;G53 G1 Y318.5 F600			; Contact the coupler by pushing on it.
	M98 P"/macros/tool_lock.g"	; Lock the tool

	;G53 G1 Y300 F10000			; Wipe Backwards.
	;G53 G1 Y317 F10000			; Wipe Forwards.
	;G53 G1 Y210 F10000			; Wipe Backwards.
	;G53 G1 Y317 F10000			; Wipe Forwards.

	G53 G1 Y305 F6000 
	G53 G1 Y255 F12000	        ; Retract the entire tool and wipe Backwards.

	;G1 R2 X0 Y0 Z0 F12000 		; Restore prior position now accounting for new tool offset

	M106 R2		           		; restore print cooling fan speed
	
	G0 Y280						; Place tool in corner of Safe Travel Region
	
	M208 X8.774:286.774 Y-35.393:244.607			; Safe Travel Region for use while tool is in use

