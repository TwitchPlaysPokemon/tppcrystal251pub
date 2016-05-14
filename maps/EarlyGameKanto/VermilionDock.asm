VermilionDock_MapScriptHeader:
	db 0
	db 1
	dbw 5, .settrigger
.settrigger
	domaptrigger GROUP_VERMILION_CITY_RB, MAP_VERMILION_CITY_RB, 2
	return

VermilionDockTruckScript:
	jumptext VermilionDockTruckText

VermilionDockTruckText:
	text "A cat-like #MON"
	line "is sleeping under-"
	cont "neath the truck."

	para "Better leave it"
	line "alone."
	done

VermilionDock_MapEventHeader:
	db 0, 0
	db 2
	warp_def 0, 14, 7, GROUP_VERMILION_CITY_RB, MAP_VERMILION_CITY_RB
	warp_def 2, 14, 1, GROUP_S_S_ANNE_1, MAP_S_S_ANNE_1

	db 0

	db 2
	signpost 0, 20, $0, VermilionDockTruckScript
	signpost 0, 21, $0, VermilionDockTruckScript

	db 0
