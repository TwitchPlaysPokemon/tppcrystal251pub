PowerplantB2_MapScriptHeader:
	; triggers
	db 0

	; callbacks
	db 1

	dbw 1, PowerplantB2SetBlocksScript

; <scripts go here>

;puzzle order is RIGHT, LEFT, TOP, BOTTOM

PowerplantB2SetBlocksScript
	checkevent EVENT_ZAPDOS_DOOR_UNLOCKED
	iffalse PowerplantB2SetBlocksFalseScript
	;change all blocks to be on if we already did the puzzle
	;switches
	;right
	changeblock 36, 14, $56
	changeblock 38, 14, $55
	;top
	changeblock 18, 0, $57
	changeblock 20, 0, $56
	;left
	changeblock 0, 14, $57
	changeblock 2, 14, $56
	;bottom
	changeblock 20, 32, $56
	changeblock 22, 32, $55
	;center area
	;right side
	changeblock 24, 16, $56
	changeblock 24, 18, $56
	changeblock 24, 20, $56
	changeblock 24, 22, $56
	;left side
	changeblock 14, 16, $56
	changeblock 14, 18, $56
	changeblock 14, 20, $56
	changeblock 14, 22, $56
	;top
	changeblock 16, 14, $56
	changeblock 18, 14, $56
	changeblock 20, 14, $56
	changeblock 22, 14, $56
	;bottom
	changeblock 16, 24, $56
	changeblock 20, 24, $56
	changeblock 22, 24, $56
	;gate
	changeblock 18, 24, $4d
	return

PowerplantB2SetBlocksFalseScript
;only change blocks based on if we have generators active, only need to check in order and check 3 as 4 sets other flag
	checkevent EVENT_ZAPDOS_GENERATOR_1_ON
	iftrue PowerPlantB2Generator1BlockScript
	return

PowerPlantB2Generator1BlockScript
	changeblock 36, 14, $56
	changeblock 38, 14, $55
	changeblock 24, 16, $56
	changeblock 24, 18, $56
	changeblock 24, 20, $56
	changeblock 24, 22, $56
	checkevent EVENT_ZAPDOS_GENERATOR_2_ON
	iftrue PowerPlantB2Generator2BlockScript
	return

PowerPlantB2Generator2BlockScript
	changeblock 0, 14, $57
	changeblock 2, 14, $56
	changeblock 14, 16, $56
	changeblock 14, 18, $56
	changeblock 14, 20, $56
	changeblock 14, 22, $56
	checkevent EVENT_ZAPDOS_GENERATOR_3_ON
	iftrue PowerPlantB2Generator3BlockScript
	return

PowerPlantB2Generator3BlockScript
	changeblock 18, 0, $57
	changeblock 20, 0, $56
	changeblock 16, 14, $56
	changeblock 18, 14, $56
	changeblock 20, 14, $56
	changeblock 22, 14, $56
	return

ZapdosScript1:
	faceplayer
	loadfont
	writetext ZapdosText1
	cry ZAPDOS
	waitbutton
	closetext
	loadpokedata ZAPDOS, 95
	writecode VAR_BATTLETYPE, BATTLETYPE_KANTOLEGEND
	startbattle
	writebyte ZAPDOS
	special SpecialMonCheck
	iffalse DontKillZapdos
	disappear $2
	setevent EVENT_FOUGHT_ZAPDOS
DontKillZapdos:
	returnafterbattle
	end

ZapdosText1:
	text "ZAPDOS: Bizaaah!"
	done

GeneratorTextOnline:
	text "The generator"
	line "hums loudly."

	para "Better not touch"
	line "anything<...>"
	done

GeneratorTextSuccess:
	text "The generator"
	line "roared to life."

	para "START-UP SEQUENCE:"
	line "CONTINUING"
	done

GeneratorTextFail:
	text "The generator"
	line "failed to start."

	para "START-UP SEQUENCE:"
	line "FAILURE"

	para "POWER ORDER BROKEN"

	para "ALL GENERATORS"
	line "SHUTTING DOWN<...>"
	done

GeneratorTextCompleted:
	text "SECURITY OVERRIDE"
	line "ACTIVATED."

	para "ACCESS GRANTED."
	done

GeneratorOnScript:
	jumptext GeneratorTextOnline
	end

;generator right
ZapdosCaveGenerator1Script:
	checkevent EVENT_ZAPDOS_GENERATOR_1_ON
	iftrue GeneratorOnScript
	waitsfx
	playsound SFX_PUSH_BUTTON
	waitsfx
	playsound SFX_UNKNOWN_60
	earthquake 90
	waitsfx
	playsound SFX_THUNDER
	refreshscreen 0
	changeblock 36, 14, $56
	changeblock 38, 14, $55
	;center area
	;right side
	changeblock 24, 16, $56
	changeblock 24, 18, $56
	changeblock 24, 20, $56
	changeblock 24, 22, $56
	reloadmappart
	waitsfx
	setevent EVENT_ZAPDOS_GENERATOR_1_ON
	jumptext GeneratorTextSuccess
	end

;generator top
ZapdosCaveGenerator3Script:
	checkevent EVENT_ZAPDOS_GENERATOR_3_ON
	iftrue GeneratorOnScript
	waitsfx
	playsound SFX_PUSH_BUTTON
	waitsfx
	playsound SFX_UNKNOWN_60
	earthquake 90
	waitsfx
	playsound SFX_THUNDER
	refreshscreen 0
	changeblock 18, 0, $57
	changeblock 20, 0, $56
	;center area
	;top
	changeblock 16, 14, $56
	changeblock 18, 14, $56
	changeblock 20, 14, $56
	changeblock 22, 14, $56
	reloadmappart
	waitsfx
	checkevent EVENT_ZAPDOS_GENERATOR_2_ON
	iffalse ResetAllGeneratorsScript
	setevent EVENT_ZAPDOS_GENERATOR_3_ON
	jumptext GeneratorTextSuccess
	end

;generator left
ZapdosCaveGenerator2Script:
	checkevent EVENT_ZAPDOS_GENERATOR_2_ON
	iftrue GeneratorOnScript
	waitsfx
	playsound SFX_PUSH_BUTTON
	waitsfx
	playsound SFX_UNKNOWN_60
	earthquake 90
	waitsfx
	playsound SFX_THUNDER
	refreshscreen 0
	changeblock 0, 14, $57
	changeblock 2, 14, $56
	;center area
	;left side
	changeblock 14, 16, $56
	changeblock 14, 18, $56
	changeblock 14, 20, $56
	changeblock 14, 22, $56
	reloadmappart
	waitsfx
	checkevent EVENT_ZAPDOS_GENERATOR_1_ON
	iffalse ResetAllGeneratorsScript
	setevent EVENT_ZAPDOS_GENERATOR_2_ON
	jumptext GeneratorTextSuccess
	end

;generator bottom
ZapdosCaveGenerator4Script:
	checkevent EVENT_ZAPDOS_GENERATOR_4_ON
	iftrue GeneratorOnScript
	waitsfx
	playsound SFX_PUSH_BUTTON
	waitsfx
	playsound SFX_UNKNOWN_60
	earthquake 90
	waitsfx
	playsound SFX_THUNDER
	refreshscreen 0
	changeblock 20, 32, $56
	changeblock 22, 32, $55
	;center area
	;bottom
	changeblock 16, 24, $56
	changeblock 20, 24, $56
	changeblock 22, 24, $56
	reloadmappart
	waitsfx
	checkevent EVENT_ZAPDOS_GENERATOR_3_ON
	iffalse ResetAllGeneratorsScript
	setevent EVENT_ZAPDOS_GENERATOR_4_ON
	setevent EVENT_ZAPDOS_DOOR_UNLOCKED
	loadfont
	writetext GeneratorTextSuccess
	waitbutton
	closetext
	playsound SFX_STRENGTH
	earthquake 90
	waitsfx
	refreshscreen 0
	changeblock 18, 24, $4d
	reloadmappart
	jumptext GeneratorTextCompleted
	end

ResetAllGeneratorsScript:
	playsound SFX_COMET_PUNCH
	earthquake 90
	waitsfx
	refreshscreen 0
	;change all blocks
	;switches
	;right
	changeblock 36, 14, $4b
	changeblock 38, 14, $4a
	;top
	changeblock 18, 0, $4c
	changeblock 20, 0, $4b
	;left
	changeblock 0, 14, $4c
	changeblock 2, 14, $4b
	;bottom
	changeblock 20, 32, $4b
	changeblock 22, 32, $4a
	;center area
	;right side
	changeblock 24, 16, $4b
	changeblock 24, 18, $4b
	changeblock 24, 20, $4b
	changeblock 24, 22, $4b
	;left side
	changeblock 14, 16, $4b
	changeblock 14, 18, $4b
	changeblock 14, 20, $4b
	changeblock 14, 22, $4b
	;top
	changeblock 16, 14, $4b
	changeblock 18, 14, $4b
	changeblock 20, 14, $4b
	changeblock 22, 14, $4b
	;bottom
	changeblock 16, 24, $4b
	changeblock 20, 24, $4b
	changeblock 22, 24, $4b
	;gate
	changeblock 18, 24, $48
	reloadmappart
	clearevent EVENT_ZAPDOS_GENERATOR_1_ON
	clearevent EVENT_ZAPDOS_GENERATOR_2_ON
	clearevent EVENT_ZAPDOS_GENERATOR_3_ON
	clearevent EVENT_ZAPDOS_GENERATOR_4_ON
	clearevent EVENT_ZAPDOS_DOOR_UNLOCKED
	jumptext GeneratorTextFail
	end

PowerplantB2_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 2
	warp_def 31, 35, 2, GROUP_POWERPLANTB1, MAP_POWERPLANTB1
	warp_def 31, 5, 3, GROUP_ROUTE_10_NORTH, MAP_ROUTE_10_NORTH

	; coord events
	db 0

	; bg events
	db 4
	signpost 15, 39, $0, ZapdosCaveGenerator1Script
	signpost 15, 0, $0, ZapdosCaveGenerator2Script
	signpost 1, 18, $0, ZapdosCaveGenerator3Script
	signpost 33, 23, $0, ZapdosCaveGenerator4Script

	; object events
	db 1
	person_event SPRITE_ZAPDOS, 23, 23, $16, 0, 0, -1, -1, 8 + PAL_OW_YELLOW, 0, 0, ZapdosScript1, EVENT_FOUGHT_ZAPDOS
