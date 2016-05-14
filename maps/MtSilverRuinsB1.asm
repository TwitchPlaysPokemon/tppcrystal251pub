MtSilverRuinsB1_MapScriptHeader:
	; triggers
	db 0

	; callbacks
	db 0

; <scripts go here>


; <text goes here>


MtSilverRuinsB1_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 14
	warp_def 26, 27, 3, GROUP_MT_SILVER_RUINS, MAP_MT_SILVER_RUINS
	warp_def 26, 28, 4, GROUP_MT_SILVER_RUINS, MAP_MT_SILVER_RUINS
	warp_def 29, 17, 5, GROUP_MT_SILVER_RUINS, MAP_MT_SILVER_RUINS
	warp_def 24, 19, 6, GROUP_MT_SILVER_RUINS, MAP_MT_SILVER_RUINS
	warp_def 19, 3, 7, GROUP_MT_SILVER_RUINS, MAP_MT_SILVER_RUINS
	warp_def 13, 3, 8, GROUP_MT_SILVER_RUINS, MAP_MT_SILVER_RUINS
	warp_def 11, 17, 9, GROUP_MT_SILVER_RUINS, MAP_MT_SILVER_RUINS
	warp_def 17, 21, 10, GROUP_MT_SILVER_RUINS, MAP_MT_SILVER_RUINS
	warp_def 13, 23, 11, GROUP_MT_SILVER_RUINS, MAP_MT_SILVER_RUINS
	warp_def 14, 28, 12, GROUP_MT_SILVER_RUINS, MAP_MT_SILVER_RUINS
	warp_def 3, 29, 13, GROUP_MT_SILVER_RUINS, MAP_MT_SILVER_RUINS
	warp_def 5, 11, 14, GROUP_MT_SILVER_RUINS, MAP_MT_SILVER_RUINS
	warp_def 2, 10, 15, GROUP_MT_SILVER_RUINS, MAP_MT_SILVER_RUINS
	warp_def 2, 11, 16, GROUP_MT_SILVER_RUINS, MAP_MT_SILVER_RUINS

	; coord events
	db 0

	; bg events
	db 0

	; object events
	db 0