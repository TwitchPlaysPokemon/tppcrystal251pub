MewIslandEntranceDock_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

MewIslandDockSailorWalk: ; 0x74ef8
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end

SailorScript_MewIslandPort:
	faceplayer
	loadfont
	writetext MewSailorReturnText
	yesorno
	iffalse SailorScript_MewIslandChoseNo
	closetext
	follow $2, $0
	applymovement $2, MewIslandDockSailorWalk
	playsound SFX_EXIT_BUILDING
	special Function8c084
	pause 15
	warp GROUP_VERMILION_PORT, MAP_VERMILION_PORT, $F, $D
	end

SailorScript_MewIslandChoseNo:
	writetext MewSailorReturnNoText
	waitbutton
	closetext
	end

MewSailorReturnNoText:
	text "OK then."
	done

MewSailorReturnText:
	text "Want to return"
	line "to VERMILION?"
	done

MewIslandEntranceDock_MapEventHeader:
	; filler
	db 0, 0

	db 1
	warp_def $7, $b, 5, GROUP_MEWISLANDUNDERGROUND, MAP_MEWISLANDUNDERGROUND

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_SAILOR, 20, 11, $7, 0, 0, -1, -1, 0, 0, 0, SailorScript_MewIslandPort, -1

