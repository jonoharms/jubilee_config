; tfree0.g
; Runs at the start of a toolchange if the current tool is tool0.
; Note: tool offsets are applied at this point unless we preempt commands with G53!
; Note: Prior to this macro, XYZ have been saved to slot 2 by the firmware as though a G60 S2 were executed. 

	M208 X-11.5:311.5 Y-44:341		; Reclaim full travel region
	G91								; Set Relative Movements
	G1 Z1							; Pop the Z up slightly
	G90								; Restore Absolute Movements
	G53 G0 X150 F12000				; Rapid to the approach position with tool-0. (park_x, park_y - offset)
	G53 G0 Y150 F12000				; Rapid to the approach position with tool-0. (park_x, park_y - offset)
	M107							; Turn Off Fan
	;G53 G1 Y325 F6000				; Controlled move to the park position with tool-0. (park_x, park_y)
	G4 S5							; wait 5 seconds
	M98 P"/macros/tool_unlock.g" 	; Unlock the tool
	;G53 G1 Y255 F12000				; Retract the pin
