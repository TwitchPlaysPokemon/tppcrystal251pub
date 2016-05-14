Route2RB_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

Route2RBCarbos: ; 0x1ac302
	db CARBOS, 1
; 0x1ac304

Route2RBElixer: ; 0x1ac304
	db ELIXER, 1
; 0x1ac306

Route2RBSignpost0Script:
	jumptext _Route2Text4

Route2RBSignpost1Script:
	jumptext _Route2Text3

_Route2Text3: ; 8d745 (23:5745)
	text "ROUTE 2"
	line "VIRIDIAN CITY -"
	cont "PEWTER CITY"
	done

_Route2Text4: ; 8d76a (23:576a)
	text "DIGLETT's CAVE"
	done

Route2RB_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 8
	warp_def 19, 15, 1, GROUP_ROUTE_2_NUGGET_SPEECH_HOUSE_RB, MAP_ROUTE_2_NUGGET_SPEECH_HOUSE_RB
	warp_def 39, 15, 3, GROUP_ROUTE_2_GATE_RB, MAP_ROUTE_2_GATE_RB
	warp_def 35, 16, 1, GROUP_ROUTE_2_GATE_RB, MAP_ROUTE_2_GATE_RB
	warp_def 35, 17, 2, GROUP_ROUTE_2_GATE_RB, MAP_ROUTE_2_GATE_RB
	warp_def  9, 12, 3, GROUP_DIGLETTS_CAVE_RB, MAP_DIGLETTS_CAVE_RB
	warp_def 11,  3, 3, GROUP_VIRIDIAN_FOREST_NORTH_RB, MAP_VIRIDIAN_FOREST_NORTH_RB
	warp_def 11,  4, 3, GROUP_VIRIDIAN_FOREST_NORTH_RB, MAP_VIRIDIAN_FOREST_NORTH_RB
	warp_def 43,  3, 2, GROUP_VIRIDIAN_FOREST_SOUTH_RB, MAP_VIRIDIAN_FOREST_SOUTH_RB

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 11, 11, $0, Route2RBSignpost0Script
	signpost 65,  5, $0, Route2RBSignpost1Script

	; people-events
	db 2
	person_event SPRITE_POKE_BALL, 49, 17, $1, 0, 0, -1, -1, 0, 1, 0, Route2RBCarbos, EVENT_ITEM_ROUTE_2_CARBOS
	person_event SPRITE_POKE_BALL, 58, 17, $1, 0, 0, -1, -1, 0, 1, 0, Route2RBElixer, EVENT_ITEM_ROUTE_2_ELIXIR
