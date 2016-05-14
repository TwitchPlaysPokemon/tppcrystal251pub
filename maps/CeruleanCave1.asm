CeruleanCave1_MapScriptHeader: ; 0x1ac2ba
	; trigger count
	db 0

	; callback count
	db 0

CeruleanCave1_Item1:
	db FULL_RESTORE, 1

CeruleanCave1_Item2:
	db SCOPE_LENS, 1

CeruleanCave1_Item3:
	db NUGGET, 1

CeruleanCave1_BoulderScript: ; 0x7de79
	jumpstd strengthboulder

CeruleanCave1_MapEventHeader: ; 0x1ac4af
	; filler
	db 0, 0

	db 9
	warp_def $11, $18, 7, GROUP_CERULEAN_CITY, MAP_CERULEAN_CITY
	warp_def $11, $19, 7, GROUP_CERULEAN_CITY, MAP_CERULEAN_CITY
	warp_def $b, $f, 1, GROUP_CERULEANCAVE2, MAP_CERULEANCAVE2
	warp_def $1, $13, 2, GROUP_CERULEANCAVE2, MAP_CERULEANCAVE2
	warp_def $6, $9, 3, GROUP_CERULEANCAVE2, MAP_CERULEANCAVE2
	warp_def $1, $3, 4, GROUP_CERULEANCAVE2, MAP_CERULEANCAVE2
	warp_def $f, $b, 5, GROUP_CERULEANCAVE2, MAP_CERULEANCAVE2
	warp_def $1, $19, 6, GROUP_CERULEANCAVE2, MAP_CERULEANCAVE2
	warp_def $0, $1c, 1, GROUP_CERULEANCAVE3, MAP_CERULEANCAVE3

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 5
	person_event SPRITE_BOULDER, 18, 28, $19, 0, 0, -1, -1, 0, 0, 0, CeruleanCave1_BoulderScript, -1
	person_event SPRITE_BOULDER, 18, 6, $19, 0, 0, -1, -1, 0, 0, 0, CeruleanCave1_BoulderScript, -1
	person_event SPRITE_POKE_BALL, 17, 28, $1, 0, 0, -1, -1, 0, 1, 0, CeruleanCave1_Item1, EVENT_ITEM_CERULEANCAVE1_FULLRESTORE
	person_event SPRITE_POKE_BALL, 18, 11, $1, 0, 0, -1, -1, 0, 1, 0, CeruleanCave1_Item2, EVENT_ITEM_CERULEANCAVE1_SCOPE_LENS
	person_event SPRITE_POKE_BALL, 18, $5, $1, 0, 0, -1, -1, 0, 1, 0, CeruleanCave1_Item3, EVENT_ITEM_CERULEANCAVE1_NUGGET
