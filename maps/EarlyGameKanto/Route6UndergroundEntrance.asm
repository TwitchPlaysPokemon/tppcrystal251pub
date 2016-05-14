Route6UndergroundEntranceRB_MapScriptHeader: ; 0x19282e
	; trigger count
	db 0

	; callback count
	db 0
; 0x192830

Route6UndergroundEntranceRBLassScript:
	jumptextfaceplayer Route6UndergroundEntranceRBLassText

Route6UndergroundEntranceRBLassText:
	text "People often lose"
	line "things in that"
	cont "UNDERGROUND PATH."
	done

Route6UndergroundEntranceRB_MapEventHeader: ; 0x192830
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $7, $3, 1, GROUP_ROUTE_6_RB, MAP_ROUTE_6_RB
	warp_def $7, $4, 1, GROUP_ROUTE_6_RB, MAP_ROUTE_6_RB
	warp_def $3, $4, 2, GROUP_UNDERGROUND_RB, MAP_UNDERGROUND_RB

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_LASS, 6, 6, $3, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, Route6UndergroundEntranceRBLassScript, -1
; 0x192845

