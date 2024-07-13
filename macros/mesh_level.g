	M561						;Unapply any existing mesh
	M558 H1.5					;Tram is done dont need to me so high
	M557 X20:280 Y20:270 P10	;Define Grid
	G29							;Execute Probing
	M558 H3						;Put Probe back to normal