; Engage the toolchanger lock

G91                 ; Set relative mode
G1 U10 F5000 H0     ; Back off the limit switch with a small move
G1 U220 F5000 H1    ; Perform up to one rotation looking for the torque limit switch

; TODO: read sensors
G90                 ; Set absolute mode
