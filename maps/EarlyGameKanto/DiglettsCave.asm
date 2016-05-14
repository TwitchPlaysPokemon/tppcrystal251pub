DiglettsCaveRB_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0



DiglettsCaveRB_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 6
	warp_def $21, $3, 9, GROUP_VERMILION_CITY_RB, MAP_VERMILION_CITY_RB
	warp_def $1f, $5, 5, GROUP_DIGLETTS_CAVE_RB, MAP_DIGLETTS_CAVE_RB
	warp_def $5, $f, 5, GROUP_ROUTE_2_RB, MAP_ROUTE_2_RB
	warp_def $3, $11, 6, GROUP_DIGLETTS_CAVE_RB, MAP_DIGLETTS_CAVE_RB
	warp_def $21, $11, 2, GROUP_DIGLETTS_CAVE_RB, MAP_DIGLETTS_CAVE_RB
	warp_def $3, $3, 4, GROUP_DIGLETTS_CAVE_RB, MAP_DIGLETTS_CAVE_RB

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 0
