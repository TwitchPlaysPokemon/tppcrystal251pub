Route1112Gate_MapScriptHeader: ; 0x9cbd5
	; trigger count
	db 0

	; callback count
	db 0
; 0x9cbd7

Route1112GateOfficerScript: ; 0x9cbd7
	jumptextfaceplayer Route1112GateOfficerText
; 0x9cbda

Route1112GateOfficerText: ; 0x9cbda
	text "Did you see the"
	line "SNORLAX blocking"
	cont "the roads?"

	para "They've been cau-"
	line "sing problems for"
	cont "the locals lately."
	done
; 0x9cc4d

Route1112Gate_MapEventHeader: ; 0x9cc4d
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $4, $0, 1, GROUP_ROUTE_11, MAP_ROUTE_11
	warp_def $5, $0, 2, GROUP_ROUTE_11, MAP_ROUTE_11
	warp_def $4, $9, 2, GROUP_ROUTE_12, MAP_ROUTE_12
	warp_def $5, $9, 3, GROUP_ROUTE_12, MAP_ROUTE_12

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_OFFICER, 6, 9, $6, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, Route1112GateOfficerScript, -1
; 0x9cc74

