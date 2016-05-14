RocketHideout3_MapScriptHeader:
	; triggers
	db 0

	; callbacks
	db 1
	dbw 2, RocketHideout_TurnOnLights


; <scripts go here>

; <text goes here>

RocketHideout3_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 4
	warp_def 4, 11, 4, GROUP_ROCKET_HIDEOUT_4, MAP_ROCKET_HIDEOUT_4 ;to b4 rocket maze upper stairs left
	warp_def 23, 10, 3, GROUP_ROCKET_HIDEOUT_4, MAP_ROCKET_HIDEOUT_4 ;to b4 rocket maze lower stairs left
	warp_def 4, 17, 1, GROUP_ROCKET_HIDEOUT_2, MAP_ROCKET_HIDEOUT_2 ;to b2 rocket maze upper stairs left
	warp_def 12, 25, 2, GROUP_ROCKET_HIDEOUT_2, MAP_ROCKET_HIDEOUT_2 ;to b2 rocket maze lower stairs right

	; coord events
	db 0

	; bg events
	db 0

	; object events
	db 0

