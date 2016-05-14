CinnabarVolcanoB2F_MapScriptHeader:
	; map trigger count
	db 0

	; callback count
	db 1

	; callbacks
	dbw 3, WriteCommandQueue_CinnabarVolcanoB2F



WriteCommandQueue_CinnabarVolcanoB2F:
	writecmdqueue CmdQueue_CinnabarVolcanoB2F
	return

CmdQueue_CinnabarVolcanoB2F:
	dbw 2, StoneTable_CinnabarVolcanoB2F
	db 0, 0 ; filler

StoneTable_CinnabarVolcanoB2F:
	db 13, 2
	dw Boulder1Down_CinnabarVolcanoB2F

	db 14, 3
	dw Boulder2Down_CinnabarVolcanoB2F

	db 11, 4
	dw Boulder3Down_CinnabarVolcanoB2F

	db 12, 5
	dw Boulder4Down_CinnabarVolcanoB2F

	db $ff

Boulder1Down_CinnabarVolcanoB2F:
	disappear 2
	clearevent EVENT_MOLTRES_BOULDER_1c
	jump PushedDownHoleScript_CinnabarVolcanoB2F

Boulder2Down_CinnabarVolcanoB2F:
	disappear 3
	clearevent EVENT_MOLTRES_BOULDER_2c
	jump PushedDownHoleScript_CinnabarVolcanoB2F

Boulder3Down_CinnabarVolcanoB2F:
	disappear 4
	clearevent EVENT_MOLTRES_BOULDER_3c
	jump PushedDownHoleScript_CinnabarVolcanoB2F

Boulder4Down_CinnabarVolcanoB2F:
	disappear 5
	clearevent EVENT_MOLTRES_BOULDER_4c
	jump PushedDownHoleScript_CinnabarVolcanoB2F

BoulderScript_CinnabarVolcanoB2F:
	jumpstd strengthboulder

PushedDownHoleScript_CinnabarVolcanoB2F
	pause 30
	scall PushedDownHoleSoundScript_CinnabarVolcanoB2F
	loadfont
	writetext PushedDownHoleText_CinnabarVolcanoB2F
	waitbutton
	closetext
	end

PushedDownHoleSoundScript_CinnabarVolcanoB2F:
	playsound SFX_STRENGTH
	earthquake 80
	end

PushedDownHoleText_CinnabarVolcanoB2F:
	text "The boulder fell"
	line "through."

	para "The immense heat"
	line "has diminished!"
	done




CinnabarVolcanoB2F_MapEventHeader:
	; filler
	db 0, 0
	; warp count
	db 14
	warp_def  9,  2, 2, GROUP_CINNABAR_VOLCANO_B1F, MAP_CINNABAR_VOLCANO_B1F ; fall spot middle
	warp_def 19, 32, 3, GROUP_CINNABAR_VOLCANO_B1F, MAP_CINNABAR_VOLCANO_B1F ; fall spot top
	warp_def 19, 19, 4, GROUP_CINNABAR_VOLCANO_B1F, MAP_CINNABAR_VOLCANO_B1F ; fall spot bottom middle
	warp_def 23, 33, 5, GROUP_CINNABAR_VOLCANO_B1F, MAP_CINNABAR_VOLCANO_B1F ; fall spot bottom right
	warp_def 11, 35, 6, GROUP_CINNABAR_VOLCANO_B1F, MAP_CINNABAR_VOLCANO_B1F ; ladder up top right
	warp_def 13,  7, 7, GROUP_CINNABAR_VOLCANO_B1F, MAP_CINNABAR_VOLCANO_B1F ; ladder up top left
	warp_def 25, 35, 8, GROUP_CINNABAR_VOLCANO_B1F, MAP_CINNABAR_VOLCANO_B1F ; ladder up bottom right
	warp_def 23, 19, 9, GROUP_CINNABAR_VOLCANO_B1F, MAP_CINNABAR_VOLCANO_B1F ; ladder up bottom left
	warp_def  5, 11, 1, GROUP_CINNABAR_VOLCANO_B3F, MAP_CINNABAR_VOLCANO_B3F ; ladder down top
	warp_def 25,  3, 2, GROUP_CINNABAR_VOLCANO_B3F, MAP_CINNABAR_VOLCANO_B3F ; ladder down bottom
	warp_def 13, 14, 3, GROUP_CINNABAR_VOLCANO_B3F, MAP_CINNABAR_VOLCANO_B3F ; hole top left
	warp_def 13, 30, 3, GROUP_CINNABAR_VOLCANO_B3F, MAP_CINNABAR_VOLCANO_B3F ; hole top right
	warp_def 23,  8, 3, GROUP_CINNABAR_VOLCANO_B3F, MAP_CINNABAR_VOLCANO_B3F ; hole bottom left
	warp_def 33, 32, 3, GROUP_CINNABAR_VOLCANO_B3F, MAP_CINNABAR_VOLCANO_B3F ; hole bottom right
	; xy-trigger count
	db 0
	; signpost count
	db 0
	; person-event count
	db 4
    person_event SPRITE_BOULDER, 23, 22, $19, 0, 0, -1, -1, 0, 0, 0, BoulderScript_CinnabarVolcanoB2F, EVENT_MOLTRES_BOULDER_1b
    person_event SPRITE_BOULDER, 27, 36, $19, 0, 0, -1, -1, 0, 0, 0, BoulderScript_CinnabarVolcanoB2F, EVENT_MOLTRES_BOULDER_2b
    person_event SPRITE_BOULDER, 13,  7, $19, 0, 0, -1, -1, 0, 0, 0, BoulderScript_CinnabarVolcanoB2F, EVENT_MOLTRES_BOULDER_3b
	person_event SPRITE_BOULDER, 23, 37, $19, 0, 0, -1, -1, 0, 0, 0, BoulderScript_CinnabarVolcanoB2F, EVENT_MOLTRES_BOULDER_4b
