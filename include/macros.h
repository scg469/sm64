#ifndef MACROS_H
#define MACROS_H

#include "platform_info.h"

#ifndef __sgi
#define GLOBAL_ASM(...)
#endif

#if !defined(__sgi) && (!defined(NON_MATCHING) || !defined(AVOID_UB))
// asm-process isn't supported outside of IDO, and undefined behavior causes
// crashes.
#error Matching build is only possible on IDO; please build with NON_MATCHING=1.
#endif

#define ARRAY_COUNT(arr) (s32)(sizeof(arr) / sizeof(arr[0]))

#define GLUE(a, b) a ## b
#define GLUE2(a, b) GLUE(a, b)

// Avoid compiler warnings for unused variables
#ifdef __GNUC__
#define UNUSED __attribute__((unused))
#else
#define UNUSED
#endif

#ifdef VERSION_CN
#define UNUSED_CN UNUSED
#else
#define UNUSED_CN
#endif

// Avoid undefined behaviour for non-returning functions
#ifdef __GNUC__
#define NORETURN __attribute__((noreturn))
#else
#define NORETURN
#endif

// Static assertions
#ifdef __GNUC__
#define STATIC_ASSERT(cond, msg) _Static_assert(cond, msg)
#else
#define STATIC_ASSERT(cond, msg) typedef char GLUE2(static_assertion_failed, __LINE__)[(cond) ? 1 : -1]
#endif

// Align to 8-byte boundary for DMA requirements
#ifdef __GNUC__
#define ALIGNED8 __attribute__((aligned(8)))
#else
#define ALIGNED8
#endif

// Align to 16-byte boundary for audio lib requirements
#ifdef __GNUC__
#define ALIGNED16 __attribute__((aligned(16)))
#else
#define ALIGNED16
#endif

#ifndef NO_SEGMENTED_MEMORY
// convert a virtual address to physical.
#define VIRTUAL_TO_PHYSICAL(addr)   ((uintptr_t)(addr) & 0x1FFFFFFF)

// convert a physical address to virtual.
#define PHYSICAL_TO_VIRTUAL(addr)   ((uintptr_t)(addr) | 0x80000000)

// another way of converting virtual to physical
#define VIRTUAL_TO_PHYSICAL2(addr)  ((u8 *)(addr) - 0x80000000U)
#else
// no conversion needed other than cast
#define VIRTUAL_TO_PHYSICAL(addr)   ((uintptr_t)(addr))
#define PHYSICAL_TO_VIRTUAL(addr)   ((uintptr_t)(addr))
#define VIRTUAL_TO_PHYSICAL2(addr)  ((void *)(addr))
#endif

// Stubbed CN debug prints
#ifdef VERSION_CN
#define CN_DEBUG_PRINTF(args) osSyncPrintf args
#else
#define CN_DEBUG_PRINTF(args)
#endif

#ifdef VERSION_CN
#define FORCE_BSS __attribute__((nocommon)) __attribute__((section (".bss_cn")))
#else
#define FORCE_BSS
#endif
/********************************************************************************
	gex.h: Ultra 64 MARIO Brothers include file
	Copyright (c) 1995 Nintendo co., ltd.  All rights reserved
	Sept 25  1995
 ********************************************************************************/

#ifndef GEX_H
#define	GEX_H
#pragma GCC diagnostic ignored "-Wmissing-braces"

#define ConvertVtx(A,B,C,D,E,F,G,H,I,J) {{{A,B,C},D,{E,F},{G,H,I,J}}}
#define SCALE 4
#define ShapeColor(r,g,b) gdSPDefLights1(r/SCALE,g/SCALE,b/SCALE,r,g,b,0x28,0x28,0x28)


/********************************************************************************/
/*	gsDPLoadTextureBlock() without gsDPSetTextureImage()						*/
/********************************************************************************/

#define	gsxDPLoadTextureImage(fmt, siz, width, height,		\
		pal, cms, cmt, masks, maskt, shifts, shiftt)		\
									\
	gsDPSetTile(fmt, siz, 0, 0, G_TX_LOADTILE, 0 , cmt, maskt,	\
		shiftt, cms, masks, shifts),				\
	gsDPLoadSync(),							\
	gsDPLoadBlock(G_TX_LOADTILE, 0, 0, (width)*(height)-1,		\
				 	CALC_DXT(width, siz##_BYTES)),					\
	gsDPSetTile(fmt, siz, ((((width) * siz##_LINE_BYTES)+7)>>3), 0,	\
		G_TX_RENDERTILE, pal, cmt, maskt, shiftt, cms, masks,	\
		shifts),						\
	gsDPSetTileSize(G_TX_RENDERTILE, 0, 0,				\
		((width)-1) << G_TEXTURE_IMAGE_FRAC,			\
		((height)-1) << G_TEXTURE_IMAGE_FRAC)


/********************************************************************************/
/*	Static display-list to load texture image made by Tanimoto.					*/
/********************************************************************************/

#define	g_Tani_LoadTextureImage(gfxptr, timg, fmt, siz, width, height,	tmem, ttdn)		\
																						\
	gDPSetTextureImage(gfxptr, fmt, siz, 1, timg);										\
	gDPTileSync(gfxptr);																\
	gDPSetTile(gfxptr, fmt, siz, 0, tmem, ttdn, 0,  0,0,0, 0,0,0);						\
	gDPLoadSync(gfxptr);																\
	gDPLoadBlock(gfxptr, ttdn, 0, 0, ((width)*(height)-1),								\
				  CALC_DXT(width, siz##_BYTES) )


#define	gs_Tani_LoadTextureImage(timg, fmt, siz, width, height,	tmem, ttdn)			\
																					\
	gsDPSetTextureImage(fmt, siz, 1, timg),											\
	gsDPTileSync(),																	\
	gsDPSetTile(fmt, siz, 0, tmem, ttdn, 0,  0,0,0, 0,0,0),							\
	gsDPLoadSync(),																	\
	gsDPLoadBlock(ttdn, 0, 0, ((width)*(height)-1),									\
				  CALC_DXT(width, siz##_BYTES) )

/********************************************************************************/
/*	Static display-list to load texture image Ver.2 made by Tanimoto.			*/
/********************************************************************************/

#define	g_Tani_LoadTextureImage2(gfxptr, timg, fmt, siz, width, height,	tmem, ttdn)		\
																						\
	gDPSetTextureImage(gfxptr, fmt, siz, 1, timg);										\
	gDPLoadSync(gfxptr);																\
	gDPLoadBlock(gfxptr, ttdn, 0, 0, ((width)*(height)-1),								\
				  CALC_DXT(width, siz##_BYTES) )


#define	gs_Tani_LoadTextureImage2(timg, fmt, siz, width, height, tmem, ttdn)		\
																					\
	gsDPSetTextureImage(fmt, siz, 1, timg),											\
	gsDPLoadSync(),																	\
	gsDPLoadBlock(ttdn, 0, 0, ((width)*(height)-1),									\
				  CALC_DXT(width, siz##_BYTES) )


/********************************************************************************/
/*	Static display-list to set up Texture Tile Descriptor made by Tanimoto.		*/
/********************************************************************************/

#define	g_Tani_SetUpTileDescrip(gfxptr, fmt, siz, width, height, tmem, ttdn, 		\
							 cms, masks, shifts, cmt, maskt, shiftt)				\
																					\
	gDPTileSync(gfxptr);															\
	gDPSetTile(gfxptr, fmt, siz, ((((width)*siz##_LINE_BYTES)+7)>>3), tmem,			\
				ttdn, 0, (cmt), (maskt), (shiftt), (cms), (masks), (shifts));		\
	gDPSetTileSize(gfxptr, ttdn, 0, 0,												\
					(((width) -1) << G_TEXTURE_IMAGE_FRAC),							\
					(((height)-1) << G_TEXTURE_IMAGE_FRAC) )


#define	gs_Tani_SetUpTileDescrip(fmt, siz, width, height, tmem, ttdn, 				\
							 	 cms, masks, shifts, cmt, maskt, shiftt)			\
																					\
	gsDPTileSync(),																	\
	gsDPSetTile(fmt, siz, ((((width)*siz##_LINE_BYTES)+7)>>3), tmem,				\
				ttdn, 0, (cmt), (maskt), (shiftt), (cms), (masks), (shifts)),		\
	gsDPSetTileSize(ttdn, 0, 0,														\
					(((width) -1) << G_TEXTURE_IMAGE_FRAC),							\
					(((height)-1) << G_TEXTURE_IMAGE_FRAC) )


#endif

#endif // MACROS_H
