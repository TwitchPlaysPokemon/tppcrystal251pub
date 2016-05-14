SilverCaveRoom3_MapScriptHeader: ; 0x18c601
	; trigger count
	db 0

	; callback count
	db 0

RedScript_0x18c603: ; 0x18c603
	special Functionc48f
	faceplayer
	loadfont
	writetext UnknownText_0x18c637
	waitbutton
	closetext
	winlosstext UnknownText_0x18c63c, UnknownText_0x18c63c
	loadtrainer RED, 1
	startbattle
	reloadmapmusic
	returnafterbattle
	setevent EVENT_BEAT_AIIIAAB
	setevent EVENT_ELM_IN_SILVER_CAVE_RUINS
	clearevent EVENT_BIRD_IN_SILVER_CAVE_RUINS
	special Functionc48f
	loadfont
	writetext UnknownText_0x18c63f
	waitbutton
	closetext
	special HealParty
	playsound SFX_STRENGTH
	earthquake 80
	changeblock 9, 7, $42
	changeblock 10, 7, $43
	reloadmappart
	waitsfx
	pause 20
	checkcode VAR_FACING
	if_equal DOWN, .script2
	if_equal RIGHT, .script3
	if_equal UP, .script4
	scall .abe_walks
	applymovement $0, SilverCave3_PlayerTakes3StepsUp
	warpcheck
	end
.script3
	scall .abe_walks
	applymovement $0, SilverCave3_PlayerStepsRightThen3Up
	warpcheck
	end
.script4
	scall .abe_walks
	applymovement $0, SilverCave3_PlayerTakes4StepsUp
	warpcheck
	end
.script2
	applymovement $2, Movement_AbeSortaKindaLeadsPlayerIntoRuins2 ; Anarchy or RIOT
	spriteface $0, UP
	disappear $2
	playsound SFX_EXIT_BUILDING
	waitsfx
	applymovement $0, SilverCave3_PlayerTakes2StepsUp
	warpcheck
	end
; 0x18c637
.abe_walks
	spriteface $0, UP
	applymovement $2, Movement_AbeSortaKindaLeadsPlayerIntoRuins ; Anarchy or RIOT
	disappear $2
	playsound SFX_EXIT_BUILDING
	waitsfx
	end

Movement_AbeSortaKindaLeadsPlayerIntoRuins:
	step_up
	step_up
	half_step_right
	half_step_left
	half_step_down
	step_sleep 16
	half_step_down
	step_down
	half_step_right
	step_left
	half_step_up
	half_step_right
	half_step_down
	half_step_left
	half_step_up
	half_step_up
	half_step_up
	half_step_up
	step_right
	step_up
	step_up
	step_end
Movement_AbeSortaKindaLeadsPlayerIntoRuins2:
	step_right
	step_up
	half_step_right
	half_step_left
	half_step_down
	step_sleep 16
	half_step_down
	step_down
	half_step_right
	step_left
	half_step_up
	half_step_right
	half_step_down
	half_step_left
	half_step_up
	half_step_up
	half_step_up
	half_step_up
SilverCave3_PlayerStepsRightThen3Up:
	step_right
	step_up
	step_up
	step_sleep 16
	half_step_down
	step_sleep 48
	step_up
	step_end

SilverCave3_PlayerTakes4StepsUp:
	step_up
SilverCave3_PlayerTakes3StepsUp:
	step_up
SilverCave3_PlayerTakes2StepsUp
	step_up
	step_sleep 16
	half_step_down
	step_sleep 48
	step_up
	step_end

UnknownText_0x18c637: ; 0x18c637
	text $56
	line $56
	done
; 0x18c63c

UnknownText_0x18c63c: ; 0x18c63c
	text "wait4baba"
	done
; 0x18c63f

UnknownText_0x18c63f: ; 0x18c63f
	text $56
	line $56
	done
; 0x18c644

UnknownText_MoreText1: ; 0x18c63c
	text "start9"
	done

UnknownText_MoreText2:
	text "select"
	done

RuinsEntranceSignScript:
	jumptext RuinsEntranceText

RuinsEntranceText:
	text "There's a piece"
    line "of text here<...>"
	para "A PIECE OF THE"
	line "WORLD IS MISSING,"
	cont "CAST DOWN BY THE"
	cont "ORIGINAL ONE."
	para "BUT HOW CAN ONE"
	line "CAST DOWN THAT"
	cont "WHICH DOES NOT"
	cont "EXIST?"
    para "<...>"
	para "IT WAITS FOR A"
	line "TAMER - IT WAITS"
	cont "FOR YOU."
    para "<...>"
	para "GO FORTH AND"
	line "CONFRONT THE"
	cont "SLEEPING ONE,"
	cont "FOR ITS NAME IS-"
	para "<...>"
	para "The statue appears"
	line "to be broken off."
    done

SilverCaveRoom3_MapEventHeader: ; 0x18c644
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $21, $9, 2, GROUP_SILVER_CAVE_ROOM_2, MAP_SILVER_CAVE_ROOM_2
	warp_def 7, 9, 1, GROUP_MT_SILVER_RUINS, MAP_MT_SILVER_RUINS
	warp_def 7, 10, 2, GROUP_MT_SILVER_RUINS, MAP_MT_SILVER_RUINS

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 8, 8, $0, RuinsEntranceSignScript
	signpost 8, 11, $0, RuinsEntranceSignScript

	; people-events
	db 1
	person_event SPRITE_RED, 14, 13, $7, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, RedScript_0x18c603, EVENT_RED_IN_SILVER_CAVE
; 0x18c65c

