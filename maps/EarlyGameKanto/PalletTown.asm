PalletTownRB_MapScriptHeader:
.TriggerTable
	db 2
	dw .Trigger1, $0000
	dw .Trigger2, $0000

.CallbackTable
	db 0

.Trigger1:
	end

.Trigger2:
	end

PalletTownRB_OakStopsPlayerLeftTile:
	playmusic MUSIC_PROF_OAK
	loadfont
	writetext PalletTownRB_OakText1
	spriteface $0, DOWN
	showemote $0, $0, 15
	pause 15
	closetext
	appear $2 ; Oak
	applymovement $2, PalletTownRB_OakWalksUpToPlayer
	loadfont
	writetext PalletTownRB_OakText2
	waitbutton
	closetext
	follow $2, $0
	applymovement $2, PalletTownRB_OakWalksToLabLeftTile
	jump PalletTownRB_WalkIntoLab

PalletTownRB_OakStopsPlayerRightTile:
	playmusic MUSIC_PROF_OAK
	moveperson $2, 9, 6
	loadfont
	writetext PalletTownRB_OakText1
	spriteface $0, DOWN
	showemote $0, $0, 15
	pause 15
	closetext
	appear $2 ; Oak
	applymovement $2, PalletTownRB_OakWalksUpToPlayer
	loadfont
	writetext PalletTownRB_OakText2
	waitbutton
	closetext
	follow $2, $0
	applymovement $2, PalletTownRB_OakWalksToLabRightTile

PalletTownRB_WalkIntoLab
	stopfollow
	playsound SFX_ENTER_DOOR
	disappear $2
	applymovement $0, PalletTownRB_PlayerEntersLab
	dotrigger $1
	domaptrigger GROUP_OAKS_LAB_RB, MAP_OAKS_LAB_RB, $1
	clearevent EVENT_OAKS_LAB_OAK
	warpcheck
	end

MapPalletTownRBSignpost0Script:
	jumptext PalletTownRB_TownSignText

MapPalletTownRBSignpost1Script:
	jumptext PalletTownRB_PlayerHouseSignText

MapPalletTownRBSignpost2Script:
	jumptext PalletTownRB_OakLabSignText

MapPalletTownRBSignpost3Script:
	jumptext PalletTownRB_GreenHouseSignText

PalletTownRB_OakWalksUpToPlayer:
	step_up
	step_up
	step_up
PalletTownRB_PlayerEntersLab
	step_up
	step_end

PalletTownRB_OakWalksToLabRightTile:
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_right
	step_right
	step_right
	step_up
	step_end

PalletTownRB_OakWalksToLabLeftTile:
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_right
	step_right
	step_right
	step_right
	step_up
	step_end

PalletTownRB_TeacherScript:
	checkevent EVENT_GOT_POKEMON_FROM_OAK
	iftrue .gotmon
	jumptextfaceplayer PalletTownRB_TeacherText1
.gotmon
	jumptextfaceplayer PalletTownRB_TeacherText2

PalletTownRB_FisherScript:
	jumptextfaceplayer PalletTownRB_FisherText

PalletTownRB_OakText1:
	text "<PLAY_G>, wait!"
	done

PalletTownRB_OakText2:
	text "It's unsafe! Wild"
	line "#MON can jump"

	para "out and attack"
	line "you!"

	para "You need your own"
	line "#MON for your"
	cont "protection!"

	para "I know! Here, come"
	line "with me."
	done

PalletTownRB_TeacherText1:
	text "I wish I had a"
	line "#MON."

	para "Then I could tra-"
	line "vel, and it could"
	cont "protect me."
	done

PalletTownRB_TeacherText2:
	text "Oh, you have a"
	line "#MON from"
	cont "PROF.OAK?"

	para "I'm so jealous!"
	done

PalletTownRB_FisherText:
	text "Technology is"
	line "incredible!"

	para "You can now store"
	line "and retrieve #-"
	cont "MON while they are"
	cont "holding items!"
	done

PalletTownRB_TownSignText: ; 0x1ac76b
	text "PALLET TOWN"

	para "A Tranquil Setting"
	line "of Peace & Purity"
	done
; 0x1ac79d

PalletTownRB_PlayerHouseSignText: ; 0x1ac79d
	text "<PLAYER>'S HOUSE"
	done
; 0x1ac7aa

PalletTownRB_OakLabSignText: ; 0x1ac7aa
	text "OAK #MON"
	line "RESEARCH LAB"
	done
; 0x1ac7c1

PalletTownRB_GreenHouseSignText: ; 0x1ac7c1
	text "<GREEN>'S HOUSE"
	done
; 0x1ac7cf

PalletTownRB_MapEventHeader:
	db 0, 0 ; filler
.Warps:
	db 3
	warp_def $5, $5, 1, GROUP_REDS_HOUSE_1F_RB, MAP_REDS_HOUSE_1F_RB
	warp_def $5, $d, 1, GROUP_BLUES_HOUSE_RB, MAP_BLUES_HOUSE_RB
	warp_def $b, $c, 2, GROUP_OAKS_LAB_RB, MAP_OAKS_LAB_RB

.XYTriggers:
	db 2
	xy_trigger 0, 1, 8, $0, PalletTownRB_OakStopsPlayerLeftTile, $0, $0
	xy_trigger 0, 1, 9, $0, PalletTownRB_OakStopsPlayerRightTile, $0, $0

.Signposts:
	db 4
	signpost 9, 7, $0, MapPalletTownRBSignpost0Script
	signpost 5, 3, $0, MapPalletTownRBSignpost1Script
	signpost 13, 13, $0, MapPalletTownRBSignpost2Script
	signpost 5, 11, $0, MapPalletTownRBSignpost3Script

.PersonEvents:
	db 3
	person_event SPRITE_OAK, 10, 12, $0, 0, 0, -1, -1, 0, 0, 0, ObjectEvent, EVENT_PALLET_TOWN_RB_OAK
	person_event SPRITE_TEACHER, 12, 7, $2, 2, 2, -1, -1, 0, 0, 0, PalletTownRB_TeacherScript, -1
	person_event SPRITE_FISHER, 18, 16, $5, 0, 2, -1, -1, 8 + PAL_OW_GREEN, 0, 0, PalletTownRB_FisherScript, -1
