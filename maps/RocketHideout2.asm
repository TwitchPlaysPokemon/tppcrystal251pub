RocketHideout2_MapScriptHeader:
	; triggers
	db 0
	; callbacks
	db 1
	dbw 2, RocketHideout_TurnOnLights


RocketHideout2_MapEventHeader:
	; filler
	db 0, 0

	;warps
	db 4
	warp_def 6, 17, 3, GROUP_ROCKET_HIDEOUT_3, MAP_ROCKET_HIDEOUT_3 ;to b3 rocket maze upper stairs left
	warp_def 13, 26, 4, GROUP_ROCKET_HIDEOUT_3, MAP_ROCKET_HIDEOUT_3 ;to b3 rocket maze lower stairs right
	warp_def 6, 9, 1, GROUP_ROCKET_HIDEOUT_1, MAP_ROCKET_HIDEOUT_1 ;to b1 rocket maze stairs left
	warp_def 14, 21, 2, GROUP_ROCKET_HIDEOUT_1, MAP_ROCKET_HIDEOUT_1 ;to b1 rocket maze stairs right


	; coord events
	db 0

	; bg events
	db 0

	; object events
	db 0

