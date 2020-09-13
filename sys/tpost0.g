	; tpost0.g
	; called after firmware thinks Tool0 is selected
	; Note: tool offsets are applied at this point!
    G53 G0 Z50
    G53 G0 X150 Y150 F12000  ; Rapid to the approach position without any current tool.
	G4 S5					; wait for manual tool change
	M98 P"/macros/tool_lock.g" ; Lock the tool

	M116 P0                  ; Wait for set temperatures to be reached

	; Note that commands preempted with G53 will NOT apply the tool offset.


	M302 P0  				 ; Do not allow cold extrusion
	;G1 E4 F100               ; Purge the Nozzle
	G4 S1                    ; Slight Delay
	;G1 E-1.0 F2000           ; Perform a retract to remove filament pressure.
	G91                      ; Set Relative Movements
	G1 Z3                    ; Pop the Z up slightly to avoid scraping carriage limit switch on pull-back for early layers.
							 ; Also clear any dangling debris on purge towers.
	G90                      ; Restore Absolute Movements

	;G53 G1 Y318.5 F600        ; Contact the coupler by pushing on it.
	

	;G53 G1 Y300 F10000       ; Wipe Backwards.
	;G53 G1 Y317 F10000       ; Wipe Forwards.
	;G53 G1 Y210 F10000       ; Wipe Backwards.
	;G53 G1 Y317 F10000       ; Wipe Forwards.

	;G53 G1 Y305 F6000 
	;G53 G1 Y250 F12000		; Retract the entire tool and wipe Backwards.

	;G1 R2 X0 Y0 Z0 F12000	; DANGER - WILL SLAM BED INTO Z-SWITCH IF TOOL IS TOO CLOSE TO BED - Restore prior position now accounting for new tool offset

	M106 R2					; restore print cooling fan speed
	
	G0 X300 Y280			; Place tool in corner of Safe Travel Region

	M208 X8.348:286.348 Y-35.322:244.678		; Safe Travel Region for use while tool is in use