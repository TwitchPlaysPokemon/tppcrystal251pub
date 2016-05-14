BattleTentRuins_MapScriptHeader: ; -- Required
	; trigger count
	db 0

	; callback count
	db 2

	; callbacks
	dbw 1, MapBattleTentRuinsTurnOnLights
	dbw 2, RocketHideout_TurnOnLights

; <scripts go here>
MapBattleTentRuinsTurnOnLights
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .keep_stairs
	changeblock $a, $7, $1
.keep_stairs
	checkevent EVENT_TURNED_ON_BATTLE_TENT_GENERATOR
	iffalse .keep_door
	changeblock $5, $0, $4
.keep_door:
	return

MapBattleTentRuinsDoorScript:
	dw EVENT_TURNED_ON_BATTLE_TENT_GENERATOR
	dw .script
.script
	jumptext MapBattleTentRuinsDoorText

MapBattleTentRuinsMonitorScript:
	checkevent EVENT_TURNED_ON_BATTLE_TENT_GENERATOR
	iftrue MapBattleTentRuinsMonitorScript3
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue MapBattleTentRuinsMonitorScript2
	jumptext MapBattleTentRuinsMonitorText1

MapBattleTentRuinsMonitorScript2:
	jumptext MapBattleTentRuinsMonitorText2

MapBattleTentRuinsMonitorScript3:
	jumptext MapBattleTentRuinsMonitorText3


; <text goes here>
MapBattleTentRuinsDoorText:
	text "It's locked<...>"
	done

MapBattleTentRuinsMonitorText1:
	text "SYSTEM OFFLINE<...>"

	para "REASON:"
	line "POWER OUTAGE"

	done

MapBattleTentRuinsMonitorText2:
	text "LOCKDOWN INITIATED"

	para "REASON:"
	line "GENERATOR FAILURE"

	done

MapBattleTentRuinsMonitorText3:
	text "SYSTEM STATUS:"
	line "NORMAL"
	done

BattleTentRuins_MapEventHeader: ; -- Required
	db 0, 0 ; Filler

	; warps
	db 4
	warp_def $7, $1, 10, GROUP_CELADON_CITY, MAP_CELADON_CITY
	warp_def $7, $2, 10, GROUP_CELADON_CITY, MAP_CELADON_CITY
	warp_def $7, $a, 1, GROUP_BATTLE_TENT_GENERATOR, MAP_BATTLE_TENT_GENERATOR
	warp_def $0, $5, 1, GROUP_BATTLE_TENT_BATTLE_ROOM, MAP_BATTLE_TENT_BATTLE_ROOM

	; coord events
	db 0

	; bg events
	db 2
	signpost $0, $5, $6, MapBattleTentRuinsDoorScript
	signpost $4, $4, $0, MapBattleTentRuinsMonitorScript

	; object events
	db 0

