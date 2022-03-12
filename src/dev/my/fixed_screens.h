// MTE MK1 (la Churrera) v5.0
// Copyleft 2010-2014, 2020 by the Mojon Twins

void game_ending (void) {
	blackout ();
	// custom salva
	/*
	#ifdef MODE_128K
		// Resource 2 = ending
		get_resource (ENDING_BIN, BASE_SUPERBUFF);
	#else
		unpack ((unsigned int) (s_ending), BASE_SUPERBUFF);
	#endif */
	cpc_ShowTileMap (1);
	
	#ifdef ENGLISH_LANG
		_x = 5; _y =  9; _gp_gen = " !                   ! "; print_str();
		_x = 5; _y = 10; _gp_gen = " !      MISSION      ! "; print_str();
		_x = 5; _y = 11; _gp_gen = " !   ACCOMPLISHED.   ! "; print_str();
		_x = 5; _y = 12; _gp_gen = " !     ITS TIME      ! "; print_str();
		_x = 5; _y = 13; _gp_gen = " !    TO GO HOME.    ! "; print_str();
		_x = 5; _y = 14; _gp_gen = " !                   ! "; print_str();
	#else
		_x = 5; _y =  9; _gp_gen = " !                   ! "; print_str();
		_x = 5; _y = 10; _gp_gen = " ! OBJETIVO CUMPLIDO ! "; print_str();
		_x = 5; _y = 11; _gp_gen = " !                   ! "; print_str();
		_x = 5; _y = 12; _gp_gen = " !    ES HORA DE     ! "; print_str();
		_x = 5; _y = 13; _gp_gen = " !  REGRESAR A CASA  ! "; print_str();
		_x = 5; _y = 14; _gp_gen = " !                   ! "; print_str();
	#endif

	cpc_UpdateNow (0);
	AY_PLAY_MUSIC (0);
	espera_activa (400);
	AY_STOP_SOUND ();
}

void game_over (void) {
	// custom salva
	_x = 9; _y = 11; _gp_gen = " !           ! "; print_str ();
	_x = 9; _y = 12; _gp_gen = " ! GAME OVER ! "; print_str ();
	_x = 9; _y = 13; _gp_gen = " !           ! "; print_str ();
	
	cpc_UpdateNow (0);
	AY_PLAY_MUSIC (3);
	espera_activa (400);
	AY_STOP_SOUND ();
}

#if defined(TIMER_ENABLE) && defined(SHOW_TIMER_OVER)
	void time_over (void) {
		_x = 10; _y = 11; _gp_gen = (unsigned char *)(spacer); print_str ();
		_x = 10; _y = 12; _gp_gen = " TIME'S UP! "; print_str ();
		_x = 10; _y = 13; _gp_gen = (unsigned char *)(spacer); print_str ();
		
		cpc_UpdateNow (0);
		espera_activa (250);
	}
#endif

#ifdef PAUSE_ABORT
/*
	void pause_screen (void) {
		_x = 10; _y = 11; _gp_gen = (unsigned char *)(spacer); print_str ();
		_x = 10; _y = 12; _gp_gen = "   PAUSED   "; print_str ();
		_x = 10; _y = 13; _gp_gen = (unsigned char *)(spacer); print_str ();
		
		cpc_UpdateNow (0);
	}*/
#endif

#ifdef COMPRESSED_LEVELS
	void zone_clear (void) {
		_x = 10; _y = 11; _gp_gen = (unsigned char *)(spacer); print_str ();
		_x = 10; _y = 12; _gp_gen = " ZONE CLEAR "; print_str ();
		_x = 10; _y = 13; _gp_gen = (unsigned char *)(spacer); print_str ();
		
		cpc_UpdateNow (0);
		espera_activa (250);			
	}
#endif
