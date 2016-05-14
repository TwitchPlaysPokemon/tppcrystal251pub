CinnabarVolcanoB3F_MapScriptHeader:
	; triggers
	db 0

	; callbacks
	db 1
	dbw 1, CinnabarVolcanoB3F_CheckBlocks

CinnabarVolcanoB3F_CheckBlocks:
	checkevent EVENT_MOLTRES_BOULDER_1c
	iftrue CinnabarVolcanoB3F_CheckBlocks_Not1
	checkevent EVENT_MOLTRES_BOULDER_2c
	iftrue CinnabarVolcanoB3F_CheckBlocks_1_Not2
	checkevent EVENT_MOLTRES_BOULDER_3c
	iftrue CinnabarVolcanoB3F_CheckBlocks_1_2_Not3
	checkevent EVENT_MOLTRES_BOULDER_4c
	iftrue CinnabarVolcanoB3F_CheckBlocks_1_2_3_Not4
	changemap CinnabarVolcanoB3F_Bld1234_BlockData
	return

CinnabarVolcanoB3F_CheckBlocks_1_2_3_Not4:
	changemap CinnabarVolcanoB3F_Bld123_BlockData
	return

CinnabarVolcanoB3F_CheckBlocks_1_2_Not3:
	checkevent EVENT_MOLTRES_BOULDER_4c
	iftrue CinnabarVolcanoB3F_CheckBlocks_1_2_Not3_Not4
	changemap CinnabarVolcanoB3F_Bld124_BlockData
	return

CinnabarVolcanoB3F_CheckBlocks_1_2_Not3_Not4:
	changemap CinnabarVolcanoB3F_Bld12_BlockData
	return

CinnabarVolcanoB3F_CheckBlocks_1_Not2:
	checkevent EVENT_MOLTRES_BOULDER_3c
	iftrue CinnabarVolcanoB3F_CheckBlocks_1_Not2_Not3
	checkevent EVENT_MOLTRES_BOULDER_4c
	iftrue CinnabarVolcanoB3F_CheckBlocks_1_Not2_3_Not4
	changemap CinnabarVolcanoB3F_Bld134_BlockData
	return

CinnabarVolcanoB3F_CheckBlocks_1_Not2_3_Not4:
	changemap CinnabarVolcanoB3F_Bld13_BlockData
	return

CinnabarVolcanoB3F_CheckBlocks_1_Not2_Not3:
	checkevent EVENT_MOLTRES_BOULDER_4c
	iftrue CinnabarVolcanoB3F_CheckBlocks_1_Not2_Not3_Not4
	changemap CinnabarVolcanoB3F_Bld14_BlockData
	return

CinnabarVolcanoB3F_CheckBlocks_1_Not2_Not3_Not4:
	changemap CinnabarVolcanoB3F_Bld1_BlockData
	return

CinnabarVolcanoB3F_CheckBlocks_Not1:
	checkevent EVENT_MOLTRES_BOULDER_2c
	iftrue CinnabarVolcanoB3F_CheckBlocks_Not1_Not2
	checkevent EVENT_MOLTRES_BOULDER_3c
	iftrue CinnabarVolcanoB3F_CheckBlocks_Not1_2_Not3
	checkevent EVENT_MOLTRES_BOULDER_4c
	iftrue CinnabarVolcanoB3F_CheckBlocks_Not1_2_3_Not4
	changemap CinnabarVolcanoB3F_Bld234_BlockData
	return

CinnabarVolcanoB3F_CheckBlocks_Not1_2_3_Not4:
	changemap CinnabarVolcanoB3F_Bld23_BlockData
	return

CinnabarVolcanoB3F_CheckBlocks_Not1_2_Not3:
	checkevent EVENT_MOLTRES_BOULDER_4c
	iftrue CinnabarVolcanoB3F_CheckBlocks_Not1_2_Not3_Not4
	changemap CinnabarVolcanoB3F_Bld24_BlockData
	return

CinnabarVolcanoB3F_CheckBlocks_Not1_2_Not3_Not4:
	changemap CinnabarVolcanoB3F_Bld2_BlockData
	return

CinnabarVolcanoB3F_CheckBlocks_Not1_Not2:
	checkevent EVENT_MOLTRES_BOULDER_3c
	iftrue CinnabarVolcanoB3F_CheckBlocks_Not1_Not2_Not3
	checkevent EVENT_MOLTRES_BOULDER_4c
	iftrue CinnabarVolcanoB3F_CheckBlocks_Not1_Not2_3_Not4
	changemap CinnabarVolcanoB3F_Bld34_BlockData
	return

CinnabarVolcanoB3F_CheckBlocks_Not1_Not2_3_Not4:
	changemap CinnabarVolcanoB3F_Bld3_BlockData
	return

CinnabarVolcanoB3F_CheckBlocks_Not1_Not2_Not3:
	checkevent EVENT_MOLTRES_BOULDER_4c
	iftrue CinnabarVolcanoB3F_CheckBlocks_Not1_Not2_Not3_Not4
	changemap CinnabarVolcanoB3F_Bld4_BlockData
CinnabarVolcanoB3F_CheckBlocks_Not1_Not2_Not3_Not4:
	return


; <scripts go here>

MoltresScript1:
	faceplayer
	loadfont
	writetext MoltresText1
	cry MOLTRES
	waitbutton
	closetext
	loadpokedata MOLTRES, 95
	writecode VAR_BATTLETYPE, BATTLETYPE_KANTOLEGEND
	startbattle
	writebyte MOLTRES
	special SpecialMonCheck
	iffalse DontKillMoltres
	disappear $2
DontKillMoltres:
	returnafterbattle
	end

BoulderScript_CinnabarVolcanoB3F:
	jumptext BoulderText_CinnabarVolcanoB3F

BoulderText_CinnabarVolcanoB3F:
	text "The boulder is"
	line "blocking the lava"

	para "flow. Better not"
	line "touch it!"
	done

MoltresText1:
	text "Gyaoooh!"
	done
	
CinnabarVolcanoB3F_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 4
	warp_def   5, 9,  9, GROUP_CINNABAR_VOLCANO_B2F, MAP_CINNABAR_VOLCANO_B2F ; ladder top
	warp_def  25, 3, 10, GROUP_CINNABAR_VOLCANO_B2F, MAP_CINNABAR_VOLCANO_B2F ; ladder bottom
	warp_def  27, 3, 11, GROUP_CINNABAR_VOLCANO_B2F, MAP_CINNABAR_VOLCANO_B2F ; fall spot
	warp_def   1, 9,  1, GROUP_CINNABAR_VOLCANO_HALLWAY, MAP_CINNABAR_VOLCANO_HALLWAY ; hallway
	; coord events
	db 0

	; bg events
	db 0

	; object events
	db 5
	person_event SPRITE_MOLTRES, 7, 23, $16, 0, 0, -1, -1, 0, 0, 0, MoltresScript1, EVENT_FOUGHT_MOLTRES
    person_event SPRITE_BOULDER, 29, 12, $19, 0, 0, -1, -1, 0, 0, 0, BoulderScript_CinnabarVolcanoB3F, EVENT_MOLTRES_BOULDER_1c
    person_event SPRITE_BOULDER, 30, 34, $19, 0, 0, -1, -1, 0, 0, 0, BoulderScript_CinnabarVolcanoB3F, EVENT_MOLTRES_BOULDER_2c
    person_event SPRITE_BOULDER, 18, 18, $19, 0, 0, -1, -1, 0, 0, 0, BoulderScript_CinnabarVolcanoB3F, EVENT_MOLTRES_BOULDER_3c
	person_event SPRITE_BOULDER, 17, 32, $19, 0, 0, -1, -1, 0, 0, 0, BoulderScript_CinnabarVolcanoB3F, EVENT_MOLTRES_BOULDER_4c

