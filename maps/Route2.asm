Route2North_MapScriptHeader: ; 0x1ac2ba
Route2South_MapScriptHeader: ; 0x1ac2ba
	; trigger count
	db 0

	; callback count
	db 0
; 0x1ac2bc

MapRoute2NorthSignpost0Script: ; 0x1ac2f8
	jumptext UnknownText_0x1ac47a
; 0x1ac2fb

MapRoute2NorthSignpost1Script: ; 0x1ac2fb
	jumptext UnknownText_0x1ac49f
; 0x1ac2fe

ItemFragment_0x1ac302: ; 0x1ac302
	db CARBOS, 1
; 0x1ac304

ItemFragment_0x1ac304: ; 0x1ac304
	db ELIXER, 1
; 0x1ac306


UnknownText_0x1ac47a: ; 0x1ac47a
	text "ROUTE 2"

	para "VIRIDIAN CITY -"
	line "PEWTER CITY"
	done
; 0x1ac49f

UnknownText_0x1ac49f: ; 0x1ac49f
	text "DIGLETT'S CAVE"
	done
; 0x1ac4af

Route2North_MapEventHeader: ; 0x1ac4af
	; filler
	db 0, 0

	; warps
	db 6
	warp_def $13, $f, 1, GROUP_ROUTE_2_NUGGET_SPEECH_HOUSE, MAP_ROUTE_2_NUGGET_SPEECH_HOUSE
	warp_def $23, $10, 1, GROUP_ROUTE_2_GATE, MAP_ROUTE_2_GATE
	warp_def $23, $11, 2, GROUP_ROUTE_2_GATE, MAP_ROUTE_2_GATE
	warp_def $9, $c, 3, GROUP_DIGLETTS_CAVE, MAP_DIGLETTS_CAVE
	warp_def $b, $3, 3, GROUP_VIRIDIAN_FOREST_GATE_NORTH, MAP_VIRIDIAN_FOREST_GATE_NORTH
	warp_def $b, $4, 3, GROUP_VIRIDIAN_FOREST_GATE_NORTH, MAP_VIRIDIAN_FOREST_GATE_NORTH

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 11, 11, $0, MapRoute2NorthSignpost1Script

	; people-events
	db 1
	person_event SPRITE_POKE_BALL, 6, 23, $1, 0, 0, -1, -1, 0, 1, 0, ItemFragment_0x1ac302, EVENT_ITEM_ROUTE_2_CARBOS
; 0x1ac554


Route2South_MapEventHeader: ; 0x1ac4af
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $3, $f, 3, GROUP_ROUTE_2_GATE, MAP_ROUTE_2_GATE
	warp_def $7, $3, 1, GROUP_VIRIDIAN_FOREST_GATE_SOUTH, MAP_VIRIDIAN_FOREST_GATE_SOUTH

	; xy triggers
	db 0

	; signposts
	db 1
	signpost 29, 5, $0, MapRoute2NorthSignpost0Script

	; people-events
	db 1
	person_event SPRITE_POKE_BALL, 26, 18, $1, 0, 0, -1, -1, 0, 1, 0, ItemFragment_0x1ac304, EVENT_ITEM_ROUTE_2_ELIXIR
; 0x1ac554

