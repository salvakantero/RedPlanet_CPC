
; Tabla de instrumentos
TABLA_PAUTAS: DW PAUTA_0,PAUTA_1,PAUTA_2,PAUTA_3,PAUTA_4,PAUTA_5,PAUTA_6,PAUTA_7,PAUTA_8,PAUTA_9,PAUTA_10

; Tabla de efectos
TABLA_SONIDOS: DW SONIDO0,SONIDO1,SONIDO2,SONIDO3

;Pautas (instrumentos)
;Instrumento 'BASS'
PAUTA_0:	DB	74,0,42,0,8,0,8,0,7,0,7,0,7,0,7,0,7,0,7,0,6,4,129
;Instrumento 'FX1'
PAUTA_2:	DB	40,0,8,0,129
;Instrumento 'FX2'
PAUTA_1:	DB	40,6,8,0,129
;Instrumento 'FX3'
PAUTA_3:	DB	40,-6,8,0,129
;Instrumento 'BASS'
PAUTA_4:	DB	15,-31,9,31,8,31,8,31,8,31,8,31,8,31,0,129
;Instrumento 'AD_01'
PAUTA_5:	DB	12,0,10,0,10,0,8,0,8,0,129
;Instrumento 'LEAD_01'
PAUTA_6:	DB	73,-18,8,6,8,6,7,6,7,0,7,0,7,0,6,-1,6,-1,6,0,6,0,6,0,6,1,6,1,6,0,6,0,6,0,138
;Instrumento 'Nuevo'
PAUTA_7:	DB	42,0,74,0,41,0,73,0,40,0,72,0,0,129
;Instrumento 'SYNTH2'
PAUTA_8:	DB	74,0,42,0,66,0,34,0,71,0,39,0,70,0,38,0,130
;Instrumento 'SYNTH3'
PAUTA_9:	DB	73,0,41,0,72,0,40,0,68,0,0,129
;Instrumento 'SYNTH4'
PAUTA_10:	DB	71,0,39,0,0,129

;Efectos
;Efecto 'KICK'
SONIDO0:	DB	190,45,24,184,59,1,255,73,0,255
;Efecto 'SNARE'
SONIDO1:	DB	46,45,13,179,26,5,110,40,13,141,37,21,184,52,25,185,51,27,255
;Efecto 'SNARE '
SONIDO2:	DB	91,29,14,184,26,1,0,0,0,53,45,15,184,26,2,106,56,18,255
;Efecto 'H'
SONIDO3:	DB	17,13,23,16,11,9,14,10,6,0,7,3,0,6,2,0,6,1,0,5,1,0,4,3,7,4,2,7,4,1,3,4,2,0,0,0,255

;Frecuencias para las notas
DATOS_NOTAS: DW 0,0
DW 1711,1614,1524,1438,1358,1281,1210,1142,1078,1017
DW 960,906,855,807,762,719,679,641,605,571
DW 539,509,480,453,428,404,381,360,339,320
DW 302,285,269,254,240,227,214,202,190,180
DW 170,160,151,143,135,127,120,113,107,101
DW 95,90,85,80,76,71,67,64,60,57