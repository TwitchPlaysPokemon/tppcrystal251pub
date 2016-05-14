MewIslandEntranceUnderground_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

MewIslandEntranceSign: ; 0x1aa9fd
	jumptext MewIslandEntranceSign_Text

MewIslandEntranceSign_Text: ; 0x1aaa6f
	text "This sign is"
	line "illegible."
	done

MewIslandEntranceUnderground_MapEventHeader:
	; filler
	db 0, 0

	db 5
	warp_def 0, 15, 1, GROUP_MEWISLANDENTRANCE, MAP_MEWISLANDENTRANCE
	warp_def 0, 16, 2, GROUP_MEWISLANDENTRANCE, MAP_MEWISLANDENTRANCE
	warp_def 4, 15, 4, GROUP_MEWISLANDUNDERGROUND, MAP_MEWISLANDUNDERGROUND
	warp_def 2, 3, 3, GROUP_MEWISLANDUNDERGROUND, MAP_MEWISLANDUNDERGROUND
	warp_def 14, 3, 1, GROUP_MEWISLANDENTRANCEDOCK, MAP_MEWISLANDENTRANCEDOCK

	; xy triggers
	db 0

	; signposts
	db 1
	signpost $F, $5, $0, MewIslandEntranceSign

	; people-events
	db 0

