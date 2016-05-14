SeafoamIslandsB1F_MapScriptHeader:
	db 0

	db 0

BoulderScript_SeafoamIslandB1F:
	jumpstd strengthboulder

SeafoamIslandsB1F_MapEventHeader:
	db 0, 0

	db 8
	warp_def 5, 5, 4, GROUP_SEAFOAM_ISLANDS_ENTRANCE, MAP_SEAFOAM_ISLANDS_ENTRANCE
	warp_def 41, 43, 5, GROUP_SEAFOAM_ISLANDS_ENTRANCE, MAP_SEAFOAM_ISLANDS_ENTRANCE
	warp_def 3, 9, 1, GROUP_SEAFOAM_ISLANDS_B2F, MAP_SEAFOAM_ISLANDS_B2F
	warp_def 15, 21, 2, GROUP_SEAFOAM_ISLANDS_B2F, MAP_SEAFOAM_ISLANDS_B2F
	warp_def 15, 17, 6, GROUP_SEAFOAM_ISLANDS_B1F, MAP_SEAFOAM_ISLANDS_B1F
	warp_def 3, 16, 5, GROUP_SEAFOAM_ISLANDS_B1F, MAP_SEAFOAM_ISLANDS_B1F
	warp_def 1, 35, 8, GROUP_SEAFOAM_ISLANDS_B1F, MAP_SEAFOAM_ISLANDS_B1F
	warp_def 23, 40, 7, GROUP_SEAFOAM_ISLANDS_B1F, MAP_SEAFOAM_ISLANDS_B1F

	db 0

	db 0

	db 4
	person_event SPRITE_BOULDER, 30, 11, $19, 0, 0, -1, -1, 0, 0, 0, BoulderScript_SeafoamIslandB1F, -1
	person_event SPRITE_BOULDER, 29, 11, $19, 0, 0, -1, -1, 0, 0, 0, BoulderScript_SeafoamIslandB1F, -1
	person_event SPRITE_BOULDER, 29, 10, $19, 0, 0, -1, -1, 0, 0, 0, BoulderScript_SeafoamIslandB1F, -1
	person_event SPRITE_BOULDER, 8, 26, $19, 0, 0, -1, -1, 0, 0, 0, BoulderScript_SeafoamIslandB1F, -1
