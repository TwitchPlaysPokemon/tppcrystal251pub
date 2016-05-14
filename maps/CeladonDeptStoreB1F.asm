CeladonDeptStoreB1F_MapScriptHeader:
	db 0

	db 0

ClerkScript_Depot1:
	faceplayer
	loadfont
	pokemart $0, $0022
	closetext
	end

ClerkScript_Depot2:
	faceplayer
	loadfont
	pokemart $0, $0023
	closetext
	end

ClerkScript_Depot3:
	faceplayer
	loadfont
	pokemart $0, $0024
	closetext
	end

ClerkScript_Depot4:
	faceplayer
	loadfont
	pokemart $0, $0025
	closetext
	end

ClerkScript_Depot5:
	faceplayer
	loadfont
	pokemart $0, $0026
	closetext
	end

ClerkScript_Depot6:
	faceplayer
	loadfont
	pokemart $0, $0027
	closetext
	end

MapCeladonDeptStoreB1FSignpost0Script:
	jumptext MapCeladonDeptStoreB1FSignpost0Text

MapCeladonDeptStoreB1FSignpost1Script:
	jumpstd elevatorbutton

MapCeladonDeptStoreB1FSignpost0Text:
	text "Teach your #MON"
	line "new moves!"

	para "B1F: TM DEPOT"
	done

CeladonDeptStoreB1F_MapEventHeader:
	db 0, 0
	db 2
	warp_def 0, 2, 1, GROUP_CELADON_DEPT_STORE_ELEVATOR, MAP_CELADON_DEPT_STORE_ELEVATOR
	warp_def 0, 7, 5, GROUP_CELADON_DEPT_STORE_1F, MAP_CELADON_DEPT_STORE_1F

	db 0

	db 2
	signpost 0, 6, 0, MapCeladonDeptStoreB1FSignpost0Script
	signpost 0, 3, 0, MapCeladonDeptStoreB1FSignpost1Script

	db 6
	person_event SPRITE_CLERK, 5, 16, $6, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, ClerkScript_Depot1, -1
	person_event SPRITE_CLERK, 5, 17, $6, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, ClerkScript_Depot2, -1
	person_event SPRITE_CLERK, 11, 9, $7, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 0, 0, ClerkScript_Depot3, -1
	person_event SPRITE_CLERK, 11, 10, $7, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 0, 0, ClerkScript_Depot4, -1
	person_event SPRITE_CLERK, 11, 17, $7, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, ClerkScript_Depot5, -1
	person_event SPRITE_CLERK, 11, 18, $7, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, ClerkScript_Depot6, -1
