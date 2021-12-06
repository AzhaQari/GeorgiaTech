
//{{BLOCK(log)

//======================================================================
//
//	log, 64x32@4, 
//	+ palette 256 entries, not compressed
//	+ 32 tiles not compressed
//	Total size: 512 + 1024 = 1536
//
//	Time-stamp: 2020-10-26, 14:25:59
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_LOG_H
#define GRIT_LOG_H

#define logTilesLen 1024
extern const unsigned short logTiles[512];

#define logPalLen 512
extern const unsigned short logPal[256];

#endif // GRIT_LOG_H

//}}BLOCK(log)
