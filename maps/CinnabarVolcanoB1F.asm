CinnabarVolcanoB1F_MapScriptHeader:
	; map trigger count
	db 0
	; callback count
	db 1

	; callbacks
	dbw 3, WriteCommandQueue_CinnabarVolcanoB1F




WriteCommandQueue_CinnabarVolcanoB1F:
	writecmdqueue CmdQueue_CinnabarVolcanoB1F
	return

CmdQueue_CinnabarVolcanoB1F:
	dbw 2, StoneTable_CinnabarVolcanoB1F
	db 0, 0 ; filler

StoneTable_CinnabarVolcanoB1F:
	db 4, 2
	dw Boulder1Down_CinnabarVolcanoB1F

	db 5, 3
	dw Boulder2Down_CinnabarVolcanoB1F

	db 2, 4
	dw Boulder3Down_CinnabarVolcanoB1F

	db 3, 5
	dw Boulder4Down_CinnabarVolcanoB1F

	db $ff

Boulder1Down_CinnabarVolcanoB1F:
	disappear 2
	clearevent EVENT_MOLTRES_BOULDER_1b
	jump PushedDownHoleScript_CinnabarVolcanoB1F

Boulder2Down_CinnabarVolcanoB1F:
	disappear 3
	clearevent EVENT_MOLTRES_BOULDER_2b
	jump PushedDownHoleScript_CinnabarVolcanoB1F

Boulder3Down_CinnabarVolcanoB1F:
	disappear 4
	clearevent EVENT_MOLTRES_BOULDER_3b
	jump PushedDownHoleScript_CinnabarVolcanoB1F

Boulder4Down_CinnabarVolcanoB1F:
	disappear 5
	clearevent EVENT_MOLTRES_BOULDER_4b
	jump PushedDownHoleScript_CinnabarVolcanoB1F

BoulderScript_CinnabarVolcanoB1F:
	jumpstd strengthboulder

PushedDownHoleScript_CinnabarVolcanoB1F
	pause 30
	scall PushedDownHoleSoundScript_CinnabarVolcanoB1F
	loadfont
	writetext PushedDownHoleText_CinnabarVolcanoB1F
	waitbutton
	closetext
	end

PushedDownHoleSoundScript_CinnabarVolcanoB1F:
	playsound SFX_STRENGTH
	earthquake 80
	end

PushedDownHoleText_CinnabarVolcanoB1F:
	text "The boulder fell"
	line "through!"
	done

CinnabarVolcanoB1F_MapEventHeader:
	; filler
	db 0, 0
	; warp count
	db 9
	warp_def  3, 7, 2, GROUP_CINNABAR_VOLCANO_ENTRANCE, MAP_CINNABAR_VOLCANO_ENTRANCE ; ladder up
	warp_def  5, 12, 1, GROUP_CINNABAR_VOLCANO_B2F, MAP_CINNABAR_VOLCANO_B2F ; hole top
	warp_def 15, 12, 2, GROUP_CINNABAR_VOLCANO_B2F, MAP_CINNABAR_VOLCANO_B2F ; hole middle
	warp_def 25, 14, 3, GROUP_CINNABAR_VOLCANO_B2F, MAP_CINNABAR_VOLCANO_B2F ; hole bottom middle
	warp_def 27, 20, 4, GROUP_CINNABAR_VOLCANO_B2F, MAP_CINNABAR_VOLCANO_B2F ; hole bottom right
	warp_def 11, 17, 5, GROUP_CINNABAR_VOLCANO_B2F, MAP_CINNABAR_VOLCANO_B2F ; ladder down top right
	warp_def 19, 17, 6, GROUP_CINNABAR_VOLCANO_B2F, MAP_CINNABAR_VOLCANO_B2F ; ladder dowm middle right
	warp_def 27, 15, 7, GROUP_CINNABAR_VOLCANO_B2F, MAP_CINNABAR_VOLCANO_B2F ; ladder down bottom right
	warp_def 27,  5, 8, GROUP_CINNABAR_VOLCANO_B2F, MAP_CINNABAR_VOLCANO_B2F ; ladder down bottom left
	; xy-trigger count
	db 0
	; signpost count
	db 0
	; person-event count
	db 4
	person_event SPRITE_BOULDER, 34, 10, $19, 0, 0, -1, -1, 0, 0, 0, BoulderScript_CinnabarVolcanoB1F, EVENT_MOLTRES_BOULDER_1a
	person_event SPRITE_BOULDER, 36, 23, $19, 0, 0, -1, -1, 0, 0, 0, BoulderScript_CinnabarVolcanoB1F, EVENT_MOLTRES_BOULDER_2a
	person_event SPRITE_BOULDER, 11, 11, $19, 0, 0, -1, -1, 0, 0, 0, BoulderScript_CinnabarVolcanoB1F, EVENT_MOLTRES_BOULDER_3a
	person_event SPRITE_BOULDER, 15, 23, $19, 0, 0, -1, -1, 0, 0, 0, BoulderScript_CinnabarVolcanoB1F, EVENT_MOLTRES_BOULDER_4a
