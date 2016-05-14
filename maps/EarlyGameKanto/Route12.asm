Route12RB_MapScriptHeader: ; 0x68000
	; trigger count
	db 0

	; callback count
	db 0
; 0x68002
Route12RBSnorlaxScript:
	jumptext Route12RBSnorlaxText

Route12RBSnorlaxText:
	text "A large #MON"
	line "sleeps soundly."

	para "When will it wake"
	line "up?"
	done

Route12RB_MapEventHeader: ; 0x68242
	; filler
	db 0, 0

	; warps
	db 2
	warp_def 8, 0, 3, GROUP_ROUTE_11_GATE_RB, MAP_ROUTE_11_GATE_RB
	warp_def 9, 0, 4, GROUP_ROUTE_11_GATE_RB, MAP_ROUTE_11_GATE_RB

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_BIG_SNORLAX, 12, 14, $15, 0, 0, -1, -1, 0, 0, 0, Route12RBSnorlaxScript, -1
; 0x68293

