	; Jubilee CoreXY ToolChanging Printer - Config File
	; This file intended for Duet 3 hardware; 6HC Mainboard; 3HC Expansion Board (CAN 1); Toolboard (CAN 20); Toolboard (CAN 21)
	; As of 11 June, 2020 INCOMPLETE AND ONLY PARTIALLY TESTED.  See the discord for more info. 

	; Name and Identification
	; Printer name is now set on the R Pi. 


; Communication and general -------------------------------------------------------------------------------------------------------------------------------------
	; Networking
	;;;M552 P192.168.1.2 S1						; Use Ethernet with a static IP
	;;;M553 P255.255.255.0						; Netmask
	;;;M554 192.168.1.3							; Gateway
	;M586 P1 S1									; Enable FTP
	;M586 P2 S1									; Enable Telnet

	; Debugging
	M111 S0										; Debug
	M929 P"eventlog.txt" S1						; Start logging to file eventlog.txt

	; General Preferences
	;M550 P"Jubilee"							; Sets printer name to Jubilee
	M555 P2								        ; Set Marlin-style output
	G21									; Set dimensions to millimetres
	G90									; Send absolute coordinates...
	M83									; ...but relative extruder moves



; Axis to driver mapping -----------------------------------------------------------------------------------------------------------------------------------------
	M584 X0 Y1                                      ; X and Y for CoreXY
	M584 U5                                         ; U for toolchanger lock
	M584 Z2:3:4                                     ; Z has three drivers for kinematic bed suspension

	
	
	; Duet3 Tool Boards | CAN Bus Addresses begin at 121
	M584 E20.0                                     ; Define all Extruders on this line 

	M569 P0 S1                                      ; Drive 0 | X stepper	
	M569 P1 S1                                      ; Drive 2 | Y Stepper

	M569 P5 S0                                      ; Drive 1 | U Tool Changer Lock	

	M569 P2 S0                                      ; Drive 3 | Front Left Z
	M569 P3 S0                                      ; Drive 4 | Back Z
	M569 P4 S0					                    ; Drive 5 | Front Right Z
	
	; End of main board drivers.  Expansion boards have three each.

	; Duet3 3HC Expansion Board CAN Bus Address 1

	; Tool Boad drivers go here
	M569 P20.0 D2 S0                                ; Drive 20 | Extruder T0

; Kinematics -----------------------------------------------------------------------------------------------------------------------------------------------------
	M669 K1                                         ; CoreXY mode

	; Kinematic bed ball locations.
	; Locations are extracted from CAD model assuming lower left build plate corner is (0, 0) on a 305x305mm plate

	M671 X297.5:150:2.5 Y313.5:-16.5:313.5 S10	;Front Left: (297.5, 313.5) | Back: (150, -16.5) | Front Right: (2.5, 313.5)

; Axis and motor configuration -----------------------------------------------------------------------------------------------------------------------------------
	M350 X16 Y16 I1                                 ; Set 16x microstepping for CoreXY axes. Use interpolation.
	M350 U4 I1                                      ; Set 4x for toolchanger lock. Use interpolation.
	M350 Z16 I1                                     ; Set 16x microstepping for Z axes. Use interpolation.
	M350 E16 I1                                     ; Set 16x microstepping for Extruder axes. Use interpolation.

	M906 X1900 Y1900 Z1700 E1000 I30                ; Motor currents (mA) and Idle percentage
	M906 U1100 I60                                  ; Motor currents (mA) and Idle percentage
	
	M201 X750 Y750 Z100 E1300 U1000                 ; Accelerations (mm/s^2)
	M203 X13000 Y13000 Z1000 E8000 U10000           ; Maximum speeds (mm/min)
	M566 X400 Y400 Z8 E200 U200                     ; Maximum jerk speeds mm/minute

	M92 X200 Y200                                   ; Steps/mm for X,Y GT2 2mm pitch 16 tooth pulleys, 16x microstepping, 0.9 deg stepper   (preferred). 
	M92 Z3200                                       ; Steps/mm for Z - T8*2, 16x microstepping, 0.9 deg stepper
	M92 U11.429                                     ; Steps/mm for tool lock geared motor. 
	M92 E409                                        ; Extruder - 0.9 deg/step


; Endstops, Probes, and Axis Limits --------------------------------------------------------------------------------------------------------------------------------------------
	M574 X1 S1 P"^io0.in"                           ; Set homing switch configuration X1 = low-end, S1 = active-high (NC)
	M574 Y1 S1 P"^io1.in"                           ; Set homing switch configuration Y1 = low-end, S1 = active-high (NC)
	M574 U1 S1 P"^io3.in"                           ; Set homing switch configuration Z1 = low-end, S1 = active-high (NC)
	
	M558 P5 C"io2.in" H3 A1 T6000 S0.02             ; Z probe - Set the height of the bed when homing G28.  Combined with content of bed.g as invoked by G32, levels bed. Also used for Mesh 
												; P5 = Switch, NC
												; C  = Input Connector
												; Hn = dive height
												;   A bigger dive height prevents a situation where the bed is out of alignment by more than the dive height
												;   on any corner, which can crash the hot-end into the bed while moving the head in XY
												;   Probing speed and travel speed are similarly reduced in case the Z probe isn't connected properly (or
												;   disconnects later after moving to a point) giving the user more time to stop
												; An = Number of times to probe each point
												; Tnnn = Travel speed between probe points
												; Snnn = Tolerance when probing multiple times. Two readings inside this window and we move on

;	M950 J10 C"^io4.in"                             ; create tool lockup switch
	

	; Set axis software limits and min/max positions and triggers
	
	M208 X-13.5:311.5 Y-39:341 Z-0.2:305            ; Adjusted such that (0,0) lies at the lower left corner of a 300x300mm square in the 305mmx305mm build plate
	M208 U0:200                                     ; Set Elastic Lock (U axis) max rotation angle

	;M581 P10 T1 S0 C1                              ; Set to trigger a pause when toolplate is not locked up while printing


; Peripherals ---------------------------------------------------------------------------------------------------------------------------------------

	M98 P"/sys/bed_heater.g"
	;M98 P"/sys/pid_tuning_station.g"    
	M98 P"/sys/tool_0.g"
	;M98 P"/sys/tool_1.g"
	;M98 P"/sys/tool_2.g"
	;M98 P"/sys/tool_3.g"


; Call Scripts and restore from non-volitile memory --------------------------------------------------------------------------------------------------------------------------------

	M98  P"/sys/Toffsets.g"           ; Set tool offsets from the bed. In separate file so test macro can invoke. 

	;M98 P"config-user.g"             ; Load custom user config if one exists.

	M501                              ; Load saved parameters from non-volatile memory

	;G29 S1                           ; Activate last saved bed mesh - done in homez.g

	; Note: you will need to tune the bed heater, and both extruder cartridges before printing.
	; See the following link for more details. https://duet3d.dozuki.com/Wiki/Tuning_the_heater_temperature_control
