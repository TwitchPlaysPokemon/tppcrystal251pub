MewIslandB1_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 1
	dbw 1, MewIslandB1_CheckBlocks

MewIslandB1_CheckBlocks:
	checkevent MEW_ISLAND_DAMMED
	iftrue MewIslandB1_DamUp
	disappear 2
	return

MewIslandB1_DamUp:
	changemap MewIslandB1Dammed_BlockData
	return

BoulderScript_MewIslandB1:
	jumptext MewIslandB1_BoulderText

MewIslandB1_BoulderText:
	text "Moving this would"
	line "be very unwise."
	done


MewIslandB1_MapEventHeader:
	; filler
	db 0, 0

	db 5
	warp_def $3, $3, 2, GROUP_MEWISLANDF1, MAP_MEWISLANDF1
	warp_def $3, $19, 3, GROUP_MEWISLANDF1, MAP_MEWISLANDF1
	warp_def $8, $e, 1, GROUP_MEWISLANDF1, MAP_MEWISLANDF1
	warp_def 9, 27, 1, GROUP_MEWISLANDB1B, MAP_MEWISLANDB1B
	warp_def 10, 27, 2, GROUP_MEWISLANDB1B, MAP_MEWISLANDB1B

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_BOULDER, 19, 22, $19, 0, 0, -1, -1, 0, 0, 0, BoulderScript_MewIslandB1, 0

