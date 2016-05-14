Route5UndergroundEntranceRB_MapScriptHeader: ; 0x18b553
	; trigger count
	db 0

	; callback count
	db 0
; 0x18b555

Route5RBTradeScript: ; 0x18b555
	faceplayer
	loadfont
	trade $9
	waitbutton
	closetext
	end
; 0x18b558


Route5UndergroundEntranceRB_MapEventHeader: ; 0x18b595
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $7, $3, 1, GROUP_ROUTE_5_RB, MAP_ROUTE_5_RB
	warp_def $7, $4, 1, GROUP_ROUTE_5_RB, MAP_ROUTE_5_RB
	warp_def $3, $4, 1, GROUP_UNDERGROUND_RB, MAP_UNDERGROUND_RB

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_TEACHER, 6, 6, $2, 1, 1, -1, -1, 8 + PAL_OW_GREEN, 0, 0, Route5RBTradeScript, -1
; 0x18b5b7

