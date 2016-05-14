Route2Gate_MapScriptHeader: ; 0x9b950
	; trigger count
	db 0

	; callback count
	db 0
; 0x9b952

ScientistScript_0x9b952: ; 0x9b952
	jumptextfaceplayer UnknownText_0x9b955
; 0x9b955

UnknownText_0x9b955: ; 0x9b955
	text "Are you <PLAY_G>?"

	para "I work as PROF."
	line "OAK's AIDE."

	para "I had no idea that"
	line "you were out here."

	para "PROF.OAK's LAB is"
	line "nearby in PALLET"
	cont "TOWN."
	done
; 0x9b9ca

Route2Gate_MapEventHeader: ; 0x9b9ca
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $0, $4, 2, GROUP_ROUTE_2_NORTH, MAP_ROUTE_2_NORTH
	warp_def $0, $5, 3, GROUP_ROUTE_2_NORTH, MAP_ROUTE_2_NORTH
	warp_def $7, $4, 1, GROUP_ROUTE_2_SOUTH, MAP_ROUTE_2_SOUTH
	warp_def $7, $5, 1, GROUP_ROUTE_2_SOUTH, MAP_ROUTE_2_SOUTH

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_SCIENTIST, 8, 10, $4, 2, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, ScientistScript_0x9b952, -1
; 0x9b9f1

