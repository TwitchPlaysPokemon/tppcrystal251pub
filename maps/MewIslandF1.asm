MewIslandF1_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 1
	dbw 3, Boulder_CheckIfOverWarp

Boulder_CheckIfOverWarp:
	writecmdqueue CmdQueue_MewIslandBoulder
	return

CmdQueue_MewIslandBoulder:
	dbw 2, MewIsland_BoulderTable ; check if any stones are sitting on a warp
	db 0, 0 ; filler

MewIsland_BoulderTable:
	db 13, 2 ; warp, person
	dw RemoveBoulder_Wrong

	db 14, 2 ; warp, person
	dw RemoveBoulder_Wrong

	db 15, 2 ; warp, person
	dw RemoveBoulder_Wrong

	db 16, 2 ; warp, person
	dw RemoveBoulder_Wrong

	db 28, 2 ; warp, person
	dw RemoveBoulder_Wrong

	db 33, 2 ; warp, person
	dw RemoveBoulder_Right

	db $ff ; end

RemoveBoulder_Wrong:
	disappear 2
	pause 30
	playsound SFX_STRENGTH
	earthquake 80
	clearevent MEW_ISLAND_DAMMED
	end

RemoveBoulder_Right:
	disappear 2
	pause 30
	playsound SFX_STRENGTH
	earthquake 80
	loadfont
	writetext MewIsland_RightBoulder
	waitbutton
	closetext
	setevent MEW_ISLAND_DAMMED
	end

MewIslandSignF1_Text: ; 0x78a52
	text "Be careful of"
	line "holes!"
	done

MewIsland_RightBoulder:
	text "Maybe that dammed"
	line "up the water?"
	done

MewIslandF1Sign:
	jumptext MewIslandSignF1_Text

BoulderScript_MewIslandF1:
	jumpstd strengthboulder

ItemFragment_MewIslandF1:
	db POWER_HERB, 1

MewIslandF1_MapEventHeader:
	; filler
	db 0, 0

	db 33
	warp_def $10, $0, 3, GROUP_MEWISLANDENTRANCE, MAP_MEWISLANDENTRANCE ;1
	warp_def $3, $3, 1, GROUP_MEWISLANDB1, MAP_MEWISLANDB1 ;2
	warp_def $2, $1a, 2, GROUP_MEWISLANDB1, MAP_MEWISLANDB1 ;3
	warp_def $b, $b, 1, GROUP_MEWISLANDF2, MAP_MEWISLANDF2 ;4
	warp_def $5, $f, 2, GROUP_MEWISLANDF2, MAP_MEWISLANDF2 ;5
	warp_def $d, $17, 3, GROUP_MEWISLANDF2, MAP_MEWISLANDF2 ;6
	warp_def $7, $1a, 4, GROUP_MEWISLANDF2, MAP_MEWISLANDF2 ;7
	warp_def 5, 6, 3, GROUP_MEWISLANDB1, MAP_MEWISLANDB1 ;8
	warp_def 13, 5, 3, GROUP_MEWISLANDB1, MAP_MEWISLANDB1 ;9
	warp_def 13, 6, 3, GROUP_MEWISLANDB1, MAP_MEWISLANDB1 ;10
	warp_def 7, 10, 3, GROUP_MEWISLANDB1, MAP_MEWISLANDB1 ;11
	warp_def 11, 13, 3, GROUP_MEWISLANDB1, MAP_MEWISLANDB1 ;12
	warp_def 14, 14, 3, GROUP_MEWISLANDB1, MAP_MEWISLANDB1 ;13
	warp_def 12, 16, 3, GROUP_MEWISLANDB1, MAP_MEWISLANDB1 ;14
	warp_def 9, 17, 3, GROUP_MEWISLANDB1, MAP_MEWISLANDB1 ;15
	warp_def 2, 22, 3, GROUP_MEWISLANDB1, MAP_MEWISLANDB1 ;16
	warp_def 14, 24, 3, GROUP_MEWISLANDB1, MAP_MEWISLANDB1 ;17
	warp_def 5, 5, 6, GROUP_MEWISLANDF2, MAP_MEWISLANDF2 ;18
	warp_def 6, 7, 7, GROUP_MEWISLANDF2, MAP_MEWISLANDF2 ;19
	warp_def 4, 8, 8, GROUP_MEWISLANDF2, MAP_MEWISLANDF2 ;20
	warp_def 6, 12, 9, GROUP_MEWISLANDF2, MAP_MEWISLANDF2 ;21
	warp_def 8, 17, 10, GROUP_MEWISLANDF2, MAP_MEWISLANDF2 ;22
	warp_def 2, 19, 11, GROUP_MEWISLANDF2, MAP_MEWISLANDF2 ;23
	warp_def 8, 21, 12, GROUP_MEWISLANDF2, MAP_MEWISLANDF2 ;24
	warp_def 9, 25, 13, GROUP_MEWISLANDF2, MAP_MEWISLANDF2 ;25
	warp_def 13, 24, 14, GROUP_MEWISLANDF2, MAP_MEWISLANDF2 ;26
	warp_def 13, 15, 15, GROUP_MEWISLANDF2, MAP_MEWISLANDF2 ;27
	warp_def 12, 10, 16, GROUP_MEWISLANDF2, MAP_MEWISLANDF2 ;28
	warp_def 12, 5, 18, GROUP_MEWISLANDF2, MAP_MEWISLANDF2
	warp_def 14, 3, 19, GROUP_MEWISLANDF2, MAP_MEWISLANDF2
	warp_def 13, 27, 5, GROUP_MEWISLANDB1B, MAP_MEWISLANDB1B
	warp_def 14, 27, 6, GROUP_MEWISLANDB1B, MAP_MEWISLANDB1B
	warp_def 15, 18, 3, GROUP_MEWISLANDB1, MAP_MEWISLANDB1

	; xy triggers
	db 0

	; signposts
	db 1
	signpost $d, $3, $0, MewIslandF1Sign

	; people-events
	db 2
	person_event SPRITE_BOULDER, 8, 22, $19, 0, 0, -1, -1, 0, 0, 0, BoulderScript_MewIslandF1, MEW_ISLAND_DAMMED
    person_event SPRITE_POKE_BALL, 13, 24, $1, 0, 0, -1, -1, 0, 1, 0, ItemFragment_MewIslandF1, MEW_ISLAND_F1_ITEM
