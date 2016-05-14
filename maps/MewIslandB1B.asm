MewIslandB1B_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

MewIslandB1B_MapEventHeader:
	; filler
	db 0, 0

	db 6
	warp_def $4, $2, 4, GROUP_MEWISLANDB1, MAP_MEWISLANDB1
	warp_def $5, $2, 5, GROUP_MEWISLANDB1, MAP_MEWISLANDB1
	warp_def $3, $7, 4, GROUP_MEWISLANDB1B, MAP_MEWISLANDB1B
	warp_def 3, 21, 3, GROUP_MEWISLANDB1B, MAP_MEWISLANDB1B
	warp_def 8, 16, 31, GROUP_MEWISLANDF1, MAP_MEWISLANDF1
	warp_def 9, 16, 32, GROUP_MEWISLANDF1, MAP_MEWISLANDF1

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 0

