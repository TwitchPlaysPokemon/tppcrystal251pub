Route2GateRB_MapScriptHeader: ; 0x9b950
	; trigger count
	db 0

	; callback count
	db 0
; 0x9b952

Route2GateRBScientistScript:
	jumptextfaceplayer Route2GateRBScientistText

Route2GateRBScientistText:
	text "Hi, I'm an unused"
	line "object."

	para "The devs put me in"
	line "here assuming you"
	cont "would be unable to"
	cont "reach me."

	para "And yet, here you"
	line "are! Well done!"

	para "Don't forget to"
	line "turn off your"
	cont "cheat codes on"
	cont "your way out!"
	done

Route2GateRB_MapEventHeader: ; 0x9b9ca
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $0, $4, 3, GROUP_ROUTE_2_RB, MAP_ROUTE_2_RB
	warp_def $0, $5, 4, GROUP_ROUTE_2_RB, MAP_ROUTE_2_RB
	warp_def $7, $4, 2, GROUP_ROUTE_2_RB, MAP_ROUTE_2_RB
	warp_def $7, $5, 2, GROUP_ROUTE_2_RB, MAP_ROUTE_2_RB

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_SCIENTIST, 8, 10, $4, 2, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, Route2GateRBScientistScript, -1
; 0x9b9f1

