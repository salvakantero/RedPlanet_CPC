// MTE MK1 (la Churrera) v5.0
// Copyleft 2010-2014, 2020 by the Mojon Twins

#asm
	;0 Iniciar
	;1 Golpear tile rompible
	;2 Romper tile rompible
	;8 Modo un sólo objeto, recoger
	;9 Modo un sólo objeto, ya tengo
	.EFECTO0
	.EFECTO1
	.EFECTO2
	.EFECTO8
	.EFECTO9	DB $FF	

	// SFX_PUSH_BOX / SFX_OPEN_LOCK
	.EFECTO3 
		defb 0xA6, 0x0F, 0x00
		defb 0x00, 0x00, 0x00
		defb 0x80, 0x0F, 0x00
		defb 0xE8, 0x1B, 0x00
		defb 0x5F, 0x0F, 0x00
		defb 0xA6, 0x0F, 0x00
		defb 0xFF

	// SFX_SHOOT  - USAR ESTE POR FAVOR, funciona y el que estaba se roba demasiado tiempo de los DRUMS. Gracias querido!!!
	.EFECTO4 
		DB	183,143,31,2,15,31,22,11,2,52,13,6,71,14,9,100,14,13,153,13,15,192,11,19,233,8,21,109,22,26,171,36,31,255


	; 5 Coger objeto
	;10 Coger una llave 
	;11 Coger cualquier tipo de refill
	.EFECTO5
	.EFECTO10
	.EFECTO11	defb 0x25, 0x1C, 0x00
				defb 0x3A, 0x0F, 0x00
				defb 0x2D, 0x0F, 0x00
				defb 0x96, 0x0D, 0x00
				defb 0x4B, 0x0D, 0x00
				defb 0x2D, 0x0C, 0x00
				defb 0xBC, 0x0C, 0x00
				defb 0x96, 0x0B, 0x00
				defb 0x32, 0x0B, 0x00
				defb 0x4B, 0x0A, 0x00
				defb 0x3A, 0x0A, 0x00
				defb 0x2D, 0x09, 0x00
				defb 0xE2, 0x09, 0x00
				defb 0xBC, 0x08, 0x00
				defb 0x4B, 0x08, 0x00
				defb 0x32, 0x07, 0x00
				defb 0x3A, 0x07, 0x00
				defb 0x2D, 0x06, 0x00
				defb 0xBC, 0x06, 0x00
				defb 0x96, 0x05, 0x00
				defb 0x32, 0x05, 0x00
				defb 0x3A, 0x04, 0x00
				defb 0x2D, 0x04, 0x00
				defb 0xE2, 0x03, 0x00
				defb 0x4B, 0x03, 0x00
				defb 0x32, 0x02, 0x00
				defb 0x3A, 0x01, 0x00
				defb 0x2D, 0x01, 0x00
				defb 0xFF


	// SFX_KILL_ENEMY_STEP / SFX_KILL_ENEMY_SHOOT ?
	.EFECTO6 
		DB $00, $FF, $1F
		DB $FF

	// SFX_HIT_ENEMY 
	.EFECTO7 
		DB	181,15,0,211,10,0,248,15,0,91,31,0,159,31,0,224,30,0,205,45,0,222,60,0,207,74,0,234,90,0,255,108,0,255,138,0,255

	// SFX_JUMP - USAR ESTE POR FAVOR, la mezcla de volumen y la entonación es correcta para este sfx
	.EFECTO12 
		DB	137,27,0,103,26,0,78,25,0,50,24,0,30,23,0,15,22,0,0,21,0,255

	// SFX_SPIKES  - el mismo que el de abajo
	.EFECTO13 
		DB	113,15,0,118,15,0,122,15,0,129,15,0,53,30,0,5,30,0,205,14,0,54,30,0,21,30,0,37,30,0,7,28,0,0,26,0,255

	// SFX_ENEMY_HIT - Funciona bien
	.EFECTO14 
		DB	113,15,0,118,15,0,122,15,0,129,15,0,53,30,0,5,30,0,205,14,0,54,30,0,21,30,0,37,30,0,7,28,0,0,26,0,255
#endasm

