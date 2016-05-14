PowerplantB1_MapScriptHeader:
	; triggers
	db 0

	; callbacks
	db 0

; <scripts go here>

; <text goes here>

PowerplantB1_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 2
	warp_def 10, 7, 3, GROUP_POWER_PLANT, MAP_POWER_PLANT
	warp_def 33, 34, 1, GROUP_POWERPLANTB2, MAP_POWERPLANTB2

	; coord events
	db 0

	; bg events
	db 0

	; object events
	db 0

