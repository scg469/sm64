/********************************************************************************
		Hms tree data.
														[ Jan 25, 1996 ]
*********************************************************************************/

extern Gfx  RCP_main_tree[];
extern Gfx 	RCP_tree02[];
extern Gfx 	RCP_tree03[];
extern Gfx 	RCP_tree04[];
extern Gfx 	RCP_tree05[];


/********************************************************************************/
/*	Hierarchy map data of MainTree.												*/
/********************************************************************************/
Hierarchy RCP_HmsMainTree[] = {
	hmsHeader(800)
	hmsBegin()
		hmsGfx(RM_SPRITE, RCP_main_tree)
	hmsEnd()
  	hmsExit()
};

/********************************************************************************/
/*	Hierarchy map data of Tree02.												*/
/********************************************************************************/
Hierarchy RCP_HmsTree02[] = {
	hmsHeader(800)
	hmsBegin()
		hmsGfx(RM_SPRITE, RCP_tree02)
	hmsEnd()
  	hmsExit()
};

/********************************************************************************/
/*	Hierarchy map data of Tree03.												*/
/********************************************************************************/
Hierarchy RCP_HmsTree03[] = {
	hmsHeader(800)
	hmsBegin()
		hmsGfx(RM_SPRITE, RCP_tree03)
	hmsEnd()
  	hmsExit()
};

/********************************************************************************/
/*	Hierarchy map data of Tree04.												*/
/********************************************************************************/
Hierarchy RCP_HmsTree04[] = {
	hmsHeader(800)
	hmsBegin()
		hmsGfx(RM_SPRITE, RCP_tree04)
	hmsEnd()
  	hmsExit()
};

/********************************************************************************/
/*	Hierarchy map data of Tree05.												*/
/********************************************************************************/
Hierarchy RCP_HmsTree05[] = {
	hmsHeader(800)
	hmsBegin()
		hmsGfx(RM_SPRITE, RCP_tree05)
	hmsEnd()
  	hmsExit()
};
