ViridianForestNorth_MapScriptHeader: ; 0x1ac2ba
	; trigger count
	db 0

	; callback count
	db 0
; 0x1ac2bc

OfficerScript_ViridianNorth: ; 0x197634
	jumptextfaceplayer Office_ViridianNorth_Text
; 0x197637

Office_ViridianNorth_Text: ; 0x19763a
	text "VIRIDIAN FOREST"
	line "has many trees"
	cont "that form a maze."

	para "People get lost"
	line "easily here."
	done
; 0x197661

ViridianForestNorth_MapEventHeader: ; 0x1ac4af
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $07, $04, 3, GROUP_VIRIDIAN_FOREST, MAP_VIRIDIAN_FOREST
	warp_def $07, $05, 3, GROUP_VIRIDIAN_FOREST, MAP_VIRIDIAN_FOREST
	warp_def $00, $05, 5, GROUP_ROUTE_2_NORTH, MAP_ROUTE_2_NORTH

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_OFFICER, 7, 11, $8, 0, 1, -1, -1, 8 + PAL_OW_RED, 0, 0, OfficerScript_ViridianNorth, -1
; 0x1ac554

