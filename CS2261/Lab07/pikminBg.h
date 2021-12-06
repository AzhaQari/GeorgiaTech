
//{{BLOCK(pikminBg)

//======================================================================
//
//	pikminBg, 512x512@4, 
//	+ palette 256 entries, not compressed
//	+ 153 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x64 
//	Total size: 512 + 4896 + 8192 = 13600
//
//	Time-stamp: 2020-10-11, 20:58:18
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_PIKMINBG_H
#define GRIT_PIKMINBG_H

#define pikminBgTilesLen 4896
extern const unsigned short pikminBgTiles[2448];

#define pikminBgMapLen 8192
extern const unsigned short pikminBgMap[4096];

#define pikminBgPalLen 512
extern const unsigned short pikminBgPal[256];

#endif // GRIT_PIKMINBG_H

//}}BLOCK(pikminBg)
