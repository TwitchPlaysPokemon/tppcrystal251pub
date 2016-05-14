CeruleanCave3_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

MewtwoText: ; 0x77260
	text "Mew!"
	done

MewtwoScript:
	faceplayer
	loadfont
	writetext MewtwoText
	cry MEWTWO
	pause 15
	closetext
	writecode VAR_BATTLETYPE, BATTLETYPE_KANTOLEGEND
	loadpokedata MEWTWO, 100
	startbattle
	writebyte MEWTWO
	special SpecialMonCheck
	iffalse DontKillMewtwo
	disappear $2
	setevent EVENT_FOUGHT_MEWTWO
DontKillMewtwo:
	returnafterbattle
	end

CeruleanCave3_BoulderScript: ; 0x7de79
	jumpstd strengthboulder

CeruleanCave3_Item1:
	db ULTRA_BALL, 1

CeruleanCave3_Item2:
	db MAX_REVIVE, 1

CeruleanCave3_Item3:
	db MAX_ELIXER, 1

CeruleanCave3_MapEventHeader:
	; filler
	db 0, 0

	db 1
	warp_def $1, $1d, 9, GROUP_CERULEANCAVE1, MAP_CERULEANCAVE1

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 6
	person_event SPRITE_RHYDON, $11, $1e, $16, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, MewtwoScript, EVENT_FOUGHT_MEWTWO
	person_event SPRITE_BOULDER, 8, 32, $19, 0, 0, -1, -1, 0, 0, 0, CeruleanCave3_BoulderScript, -1
	person_event SPRITE_BOULDER, 14, 15, $19, 0, 0, -1, -1, 0, 0, 0, CeruleanCave3_BoulderScript, -1
	person_event SPRITE_POKE_BALL, 4, 24, $1, 0, 0, -1, -1, 0, 1, 0, CeruleanCave3_Item1, EVENT_ITEM_CERULEANCAVE3_ULTRABALL
	person_event SPRITE_POKE_BALL, 4, 14, $1, 0, 0, -1, -1, 0, 1, 0, CeruleanCave3_Item2, EVENT_ITEM_CERULEANCAVE3_MAX_REVIVE
	person_event SPRITE_POKE_BALL, 13, 10, $1, 0, 0, -1, -1, 0, 1, 0, CeruleanCave3_Item3, EVENT_ITEM_CERULEANCAVE3_MAX_ELIXER

