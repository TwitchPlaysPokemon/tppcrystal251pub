CinnabarVolcanoHallway_MapScriptHeader:
	; triggers
	db 0

	; callbacks
	db 0

; <scripts go here>

; <text goes here>

CinnabarVolcanoHallway_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 2
	warp_def   5, 17,  4, GROUP_CINNABAR_VOLCANO_B3F, MAP_CINNABAR_VOLCANO_B3F ; volcano b3 upper
	warp_def   5, 3,  1, GROUP_CINNABAR_VOLCANO_LAB, MAP_CINNABAR_VOLCANO_LAB ; lab
	
	; coord events
	db 0

	; bg events
	db 0

	; object events
	db 0

