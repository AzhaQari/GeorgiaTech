
//{{BLOCK(screenStates)

//======================================================================
//
//	screenStates, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 244 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 7808 + 2048 = 10368
//
//	Time-stamp: 2020-10-25, 00:39:15
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_SCREENSTATES_H
#define GRIT_SCREENSTATES_H

#define screenStatesTilesLen 7808
extern const unsigned short screenStatesTiles[3904];

#define screenStatesMapLen 2048
extern const unsigned short screenStatesMap[1024];

#define screenStatesPalLen 512
extern const unsigned short screenStatesPal[256];

#endif // GRIT_SCREENSTATES_H

//}}BLOCK(screenStates)
