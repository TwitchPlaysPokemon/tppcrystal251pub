Route11GateRB_MapScriptHeader: ; 0x19a4b3
	; trigger count
	db 0

	; callback count
	db 0
; 0x19a4b5

Route11GateRB_OfficerScript: ; 0x19a4b5
	jumptextfaceplayer Route11GateRB_OfficerText
; 0x19a4b8

Route11GateRB_OfficerText: ; 0x19a4b8
	text "When you catch"
	line "lots of #MON,"

	para "isn't it hard to"
	line "think up names?"

	para "In LAVENDER TOWN,"
	line "there's a man who"

	para "rates #MON"
	line "nicknames."

	para "He'll help you"
	line "rename them too!"
	done

; 0x19a4fe

Route11GateRB_MapEventHeader: ; 0x19a4fe
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $4, $0, 1, GROUP_ROUTE_11_RB, MAP_ROUTE_11_RB
	warp_def $5, $0, 2, GROUP_ROUTE_11_RB, MAP_ROUTE_11_RB
	warp_def $4, $9, 1, GROUP_ROUTE_12_RB, MAP_ROUTE_12_RB
	warp_def $5, $9, 2, GROUP_ROUTE_12_RB, MAP_ROUTE_12_RB

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_OFFICER, 6, 9, $6, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, Route11GateRB_OfficerScript, -1
; 0x19a525

