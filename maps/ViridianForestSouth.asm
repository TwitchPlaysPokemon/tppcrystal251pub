ViridianForestSouth_MapScriptHeader: ; 0x1ac2ba
	; trigger count
	db 0

	; callback count
	db 0
; 0x1ac2bc

OfficerScript_ViridianSouth: ; 0x197634
	jumptextfaceplayer Office_ViridianSouth_Text
; 0x197637

Office_ViridianSouth_Text: ; 0x19763a
	text "VIRIDIAN FOREST is"
	line "like a maze."
	cont "Be careful, don't"
	cont "get lost in there!"
	done
; 0x197661

ViridianForestSouth_MapEventHeader: ; 0x1ac4af
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $07, $04, 2, GROUP_ROUTE_2_SOUTH, MAP_ROUTE_2_SOUTH
	warp_def $07, $05, 2, GROUP_ROUTE_2_SOUTH, MAP_ROUTE_2_SOUTH
	warp_def $00, $05, 1, GROUP_VIRIDIAN_FOREST, MAP_VIRIDIAN_FOREST

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_OFFICER, 7, 11, $8, 0, 1, -1, -1, 8 + PAL_OW_RED, 0, 0, OfficerScript_ViridianSouth, -1
; 0x1ac554

