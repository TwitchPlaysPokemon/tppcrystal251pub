UndergroundRB_MapScriptHeader: ; 0x74391
	; trigger count
	db 0

	; callback count
	db 0
; 0x74393

MapUndergroundRBSignpostItem0: ; 0x74393
	dw EVENT_SIGNPOST_ITEM_IN_UNDERGROUND_1
	db FULL_RESTORE

; 0x74396

MapUndergroundRBSignpostItem1: ; 0x74396
	dw EVENT_SIGNPOST_ITEM_IN_UNDERGROUND_2
	db X_SPECIAL

; 0x74399

UndergroundRB_MapEventHeader: ; 0x74399
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $2, $3, 3, GROUP_ROUTE_5_UNDERGROUND_ENTRANCE_RB, MAP_ROUTE_5_UNDERGROUND_ENTRANCE_RB
	warp_def $18, $3, 3, GROUP_ROUTE_6_UNDERGROUND_ENTRANCE_RB, MAP_ROUTE_6_UNDERGROUND_ENTRANCE_RB

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 9, 3, $7, MapUndergroundRBSignpostItem0
	signpost 19, 1, $7, MapUndergroundRBSignpostItem1

	; people-events
	db 0
; 0x743b3

