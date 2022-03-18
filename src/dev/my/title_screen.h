// MTE MK1 (la Churrera) v5.0
// Copyleft 2010-2014, 2020 by the Mojon Twins

// You can change this function as fit

void title_screen (void) {
	// custom salva
	unsigned int ctr = 9000;
	unsigned char turn = 0;

	blackout ();
	
	#ifdef MODE_128K
		get_resource (TITLE_BIN, BASE_SUPERBUFF);
	#else		
		unpack ((unsigned int) (s_title), BASE_SUPERBUFF);
	#endif
			
	cpc_ShowTileMap (1);

	// Do a simple 0 start/1 redefine menu
	AY_PLAY_MUSIC (0);
	while (1) {
		if (cpc_TestKey (KEY_AUX3)) { _gp_gen = def_keys; break; }
		if (cpc_TestKey (KEY_AUX4)) { _gp_gen = def_keys_joy; break; }

		// custom salva
		if (ctr++ == 10000)
		{
			_x = 4;
			_y = 5;

			switch (turn)
			{
				#ifdef ENGLISH_LANG

				case 0:
					_gp_gen = "  GAME BY SALVAKANTERO "; break; 
				case 1:
					_gp_gen = "     MUSIC BY TACHA   "; break;
				case 2:
					_gp_gen = "BETATESTING BY BLACKMORES"; break;
				case 3:
					_gp_gen = "  PRESS 1 OR 2 TO START  ";
				
				#else

				case 0:
					_gp_gen = " PROGRAMA: SALVAKANTERO"; break; 
				case 1:
					_gp_gen = "      MUSICA: TACHA    "; break;
				case 2:
					_gp_gen = " BETATESTING: BLACKMORES"; break;
				case 3:
					_gp_gen = " PULSA 1/2 PARA EMPEZAR ";

				#endif
			}

			print_str ();
			cpc_UpdateNow (0);
			ctr = 0;
			if (turn++ == 3) turn = 0;
		}
	}	
	AY_STOP_SOUND ();

	// Copy keys to extern 
	#asm
		._copy_keys_to_extern
			ld  hl, (__gp_gen)
			ld  de, cpc_KeysData + 12
			ld  bc, 24
			ldir
	#endasm
}
