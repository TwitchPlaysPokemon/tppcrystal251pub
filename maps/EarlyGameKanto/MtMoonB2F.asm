MtMoonB2FRB_MapScriptHeader: ; 0x1ac2ba
	; trigger count
	db 0

	; callback count
	db 0

MtMoonB2FRB_MapEventHeader: ; 0x1ac4af
	; filler
	db 0, 0

	; warps
	db 8
	warp_def $05, $05, 3, GROUP_MT_MOON_B1F_RB, MAP_MT_MOON_B1F_RB
	warp_def $0b, $11, 1, GROUP_MT_MOON_B3F_RB, MAP_MT_MOON_B3F_RB
	warp_def $09, $19, 4, GROUP_MT_MOON_B1F_RB, MAP_MT_MOON_B1F_RB
	warp_def $0f, $19, 5, GROUP_MT_MOON_B1F_RB, MAP_MT_MOON_B1F_RB
	warp_def $11, $15, 2, GROUP_MT_MOON_B3F_RB, MAP_MT_MOON_B3F_RB
	warp_def $1b, $0d, 3, GROUP_MT_MOON_B3F_RB, MAP_MT_MOON_B3F_RB
	warp_def $03, $17, 4, GROUP_MT_MOON_B3F_RB, MAP_MT_MOON_B3F_RB
	warp_def $03, $1b, 1, GROUP_ROUTE_4_RB, MAP_ROUTE_4_RB

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 0


