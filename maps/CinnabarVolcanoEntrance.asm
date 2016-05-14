CinnabarVolcanoEntrance_MapScriptHeader:
	; map trigger count
	db 0
	; callback count
	db 0

CinnabarVolcanoEntrance_MapEventHeader:
	; filler
	db 0, 0
	; warp count
	db 2
	warp_def 5, 5, 2, GROUP_CINNABAR_ISLAND, MAP_CINNABAR_ISLAND
	warp_def 3, 5, 1, GROUP_CINNABAR_VOLCANO_B1F, MAP_CINNABAR_VOLCANO_B1F
	; xy-trigger count
	db 0
	; signpost count
	db 0
	; person-event count
	db 0
