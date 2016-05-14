ViridianForestSouthRB_MapScriptHeader: ; 0x1ac2ba
	; trigger count
	db 0

	; callback count
	db 0
; 0x1ac2bc

ViridianForestSouthRB_LassScript:
	jumptextfaceplayer _ViridianForestEntranceText1

ViridianForestSouthRB_TwinScript:
	jumptextfaceplayer _ViridianForestEntranceText2

_ViridianForestEntranceText1: ; 8a868 (22:6868)
	text "Are you going to"
	line "VIRIDIAN FOREST?"

	para "Be careful, it's"
	line "a natural maze!"
	done

_ViridianForestEntranceText2: ; 8a8ab (22:68ab)
	text "RATTATA may be"
	line "small, but its"

	para "bite is wicked!"
	line "Did you get one?"
	done


ViridianForestSouthRB_MapEventHeader: ; 0x1ac4af
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $07, $04, 8, GROUP_ROUTE_2_RB, MAP_ROUTE_2_RB
	warp_def $07, $05, 8, GROUP_ROUTE_2_RB, MAP_ROUTE_2_RB
	warp_def $00, $05, 1, GROUP_VIRIDIAN_FOREST_RB, MAP_VIRIDIAN_FOREST_RB

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 2
	person_event SPRITE_LASS, 8, 12, $8, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, ViridianForestSouthRB_LassScript, -1
	person_event SPRITE_TWIN, 8, 6, $4, 2, 0, -1, -1, 0, 0, 0, ViridianForestSouthRB_TwinScript, -1
; 0x1ac554

