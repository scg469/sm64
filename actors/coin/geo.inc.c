/********************************************************************************
	RCP_HmsItemCoin
														[ June 16, 1995 ]
 ********************************************************************************/

extern Gfx  RCP_coin1[];
extern Gfx  RCP_coin2[];
extern Gfx  RCP_coin3[];
extern Gfx  RCP_coin4[];


/********************************************************************************/
/*	Hierarchy map data.															*/
/********************************************************************************/
Hierarchy yellow_coin_geo[] = { 
	hmsShadow(80, 200, 1)
	hmsBegin()
		hmsSelect(8, ControlShapeAnime)
		hmsBegin()
			hmsGfx(RM_SPRITE, RCP_coin1)
			hmsGfx(RM_SPRITE, RCP_coin1)
			hmsGfx(RM_SPRITE, RCP_coin2)
			hmsGfx(RM_SPRITE, RCP_coin2)
			hmsGfx(RM_SPRITE, RCP_coin3)
			hmsGfx(RM_SPRITE, RCP_coin3)
			hmsGfx(RM_SPRITE, RCP_coin4)
			hmsGfx(RM_SPRITE, RCP_coin4)
		hmsEnd()
	hmsEnd()
  	hmsExit()
};

Hierarchy yellow_coin_no_shadow_geo[] = { 
	hmsShadow(80, 200, 1)
	hmsBegin()
		hmsSelect(8, ControlShapeAnime)
		hmsBegin()
			hmsGfx(RM_SPRITE, RCP_coin1)
			hmsGfx(RM_SPRITE, RCP_coin1)
			hmsGfx(RM_SPRITE, RCP_coin2)
			hmsGfx(RM_SPRITE, RCP_coin2)
			hmsGfx(RM_SPRITE, RCP_coin3)
			hmsGfx(RM_SPRITE, RCP_coin3)
			hmsGfx(RM_SPRITE, RCP_coin4)
			hmsGfx(RM_SPRITE, RCP_coin4)
		hmsEnd()
	hmsEnd()
  	hmsExit()
};

Hierarchy blue_coin_geo[] = { 
	hmsShadow(80, 200, 1)
	hmsBegin()
		hmsSelect(8, ControlShapeAnime)
		hmsBegin()
			hmsGfx(RM_SPRITE, RCP_coin1)
			hmsGfx(RM_SPRITE, RCP_coin1)
			hmsGfx(RM_SPRITE, RCP_coin2)
			hmsGfx(RM_SPRITE, RCP_coin2)
			hmsGfx(RM_SPRITE, RCP_coin3)
			hmsGfx(RM_SPRITE, RCP_coin3)
			hmsGfx(RM_SPRITE, RCP_coin4)
			hmsGfx(RM_SPRITE, RCP_coin4)
		hmsEnd()
	hmsEnd()
  	hmsExit()
};

Hierarchy blue_coin_no_shadow_geo[] = { 
	hmsShadow(80, 200, 1)
	hmsBegin()
		hmsSelect(8, ControlShapeAnime)
		hmsBegin()
			hmsGfx(RM_SPRITE, RCP_coin1)
			hmsGfx(RM_SPRITE, RCP_coin1)
			hmsGfx(RM_SPRITE, RCP_coin2)
			hmsGfx(RM_SPRITE, RCP_coin2)
			hmsGfx(RM_SPRITE, RCP_coin3)
			hmsGfx(RM_SPRITE, RCP_coin3)
			hmsGfx(RM_SPRITE, RCP_coin4)
			hmsGfx(RM_SPRITE, RCP_coin4)
		hmsEnd()
	hmsEnd()
  	hmsExit()
};

Hierarchy red_coin_geo[] = { 
	hmsShadow(80, 200, 1)
	hmsBegin()
		hmsSelect(8, ControlShapeAnime)
		hmsBegin()
			hmsGfx(RM_SPRITE, RCP_coin1)
			hmsGfx(RM_SPRITE, RCP_coin1)
			hmsGfx(RM_SPRITE, RCP_coin2)
			hmsGfx(RM_SPRITE, RCP_coin2)
			hmsGfx(RM_SPRITE, RCP_coin3)
			hmsGfx(RM_SPRITE, RCP_coin3)
			hmsGfx(RM_SPRITE, RCP_coin4)
			hmsGfx(RM_SPRITE, RCP_coin4)
		hmsEnd()
	hmsEnd()
  	hmsExit()
};

Hierarchy red_coin_no_shadow_geo[] = { 
	hmsShadow(80, 200, 1)
	hmsBegin()
		hmsSelect(8, ControlShapeAnime)
		hmsBegin()
			hmsGfx(RM_SPRITE, RCP_coin1)
			hmsGfx(RM_SPRITE, RCP_coin1)
			hmsGfx(RM_SPRITE, RCP_coin2)
			hmsGfx(RM_SPRITE, RCP_coin2)
			hmsGfx(RM_SPRITE, RCP_coin3)
			hmsGfx(RM_SPRITE, RCP_coin3)
			hmsGfx(RM_SPRITE, RCP_coin4)
			hmsGfx(RM_SPRITE, RCP_coin4)
		hmsEnd()
	hmsEnd()
  	hmsExit()
};
