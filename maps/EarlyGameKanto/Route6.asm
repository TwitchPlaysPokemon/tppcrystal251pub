Route6RB_MapScriptHeader: ; 0x1ad927
	; trigger count
	db 0

	; callback count
	db 0
; 0x1ad929

TrainerRoute6RBCamper1:
	checkevent EVENT_ROUTE_6_CAMPER_1_RB
	iftrue .Script
	faceplayer
	waitsfx
	special SaveMusic
	playmusic MUSIC_YOUNGSTER_ENCOUNTER
	loadfont
	writetext _Route6BattleText1
	waitbutton
	closetext
	loadtrainer CAMPER, RICKY_RB
	winlosstext _Route6EndBattleText1, 0
	startbattle
	returnafterbattle
	playmapmusic
	setevent EVENT_ROUTE_6_CAMPER_1_RB
	spriteface $2, RIGHT
	end
.Script
	spriteface $2, RIGHT
	loadfont
	writetext _Route6AfterBattleText1
	waitbutton
	closetext
	end

TrainerRoute6RBPicnicker1:
	checkevent EVENT_ROUTE_6_PICNICKER_1_RB
	iftrue .Script
	faceplayer
	waitsfx
	special SaveMusic
	playmusic MUSIC_LASS_ENCOUNTER
	loadfont
	writetext _Route6BattleText2
	waitbutton
	closetext
	loadtrainer PICNICKER, NANCY_RB
	winlosstext _Route6EndBattleText2, 0
	startbattle
	returnafterbattle
	playmapmusic
	spriteface $3, LEFT
	setevent EVENT_ROUTE_6_PICNICKER_1_RB
	end
.Script
	spriteface $3, LEFT
	loadfont
	writetext _Route6AfterBattleText1
	waitbutton
	closetext
	end

TrainerRoute6RBBugCatcher1:
	trainer EVENT_ROUTE_6_BUG_CATCHER_1_RB, BUG_CATCHER, KEIGO_RB, _Route6BattleText3, _Route6EndBattleText3, 0, .Script
.Script
	talkaftercancel
	loadfont
	writetext _Route6AfterBattleText3
	waitbutton
	closetext
	end

TrainerRoute6RBCamper2:
	trainer EVENT_ROUTE_6_CAMPER_2_RB, CAMPER, JEFF_RB, _Route6BattleText4, _Route6EndBattleText4, 0, .Script
.Script
	talkaftercancel
	loadfont
	writetext _Route6AfterBattleText4
	waitbutton
	closetext
	end

TrainerRoute6RBPicnicker2:
	trainer EVENT_ROUTE_6_PICNICKER_2_RB, PICNICKER, IZZY_RB, _Route6BattleText5, _Route6EndBattleText5, 0, .Script
.Script
	talkaftercancel
	loadfont
	writetext _Route6AfterBattleText5
	waitbutton
	closetext
	end

TrainerRoute6RBBugCatcher2:
	trainer EVENT_ROUTE_6_BUG_CATCHER_2_RB, BUG_CATCHER, ELIJAH_RB, _Route6BattleText6, _Route6EndBattleText6, 0, .Script
.Script
	talkaftercancel
	loadfont
	writetext _Route6AfterBattleText6
	waitbutton
	closetext
	end

MapRoute6RBSignpost0Script: ; 0x1ad954
	jumptext _Route6Text7
; 0x1ad957
_Route6BattleText1:
	text "Who's there?"
	line "Quit listening in"
	cont "on us!"
	done

_Route6EndBattleText1:
	text "I just can't win!"
	done

_Route6AfterBattleText1:
	text "Whisper<...>"
	line "whisper<...>"
	done

_Route6BattleText2:
	text "Excuse me! This"
	line "is a private"
	cont "conversation!"
	done

_Route6EndBattleText2:
	text "Ugh! I hate"
	line "losing!"
	done

_Route6BattleText3:
	text "There aren't many"
	line "bugs out here."
	done

_Route6EndBattleText3:
	text "No! You're"
	line "kidding!"
	done

_Route6AfterBattleText3:
	text "I like bugs, so"
	line "I'm going back to"
	cont "VIRIDIAN FOREST."
	done

_Route6BattleText4:
	text "Huh? You want"
	line "to talk to me?"
	done

_Route6EndBattleText4:
	text "I didn't start it!"
	done

_Route6AfterBattleText4:
	text "I should carry"
	line "more #MON with"
	cont "me for safety."
	done

_Route6BattleText5:
	text "Me? Well, OK."
	line "I'll play!"
	done

_Route6EndBattleText5:
	text "Just didn't work!"
	done

_Route6AfterBattleText5:
	text "I want to get"
	line "stronger! What's"
	cont "your secret?"
	done

_Route6BattleText6:
	text "I've never seen"
	line "you around!"
	cont "Are you good?"
	done

_Route6EndBattleText6:
	text "You're too good!"
	done

_Route6AfterBattleText6:
	text "Are my #MON"
	line "weak? Or, am I"
	cont "just bad?"
	done

_Route6Text7:
	text "UNDERGROUND PATH"
	line "CERULEAN CITY -"
	cont "VERMILION CITY"
	done

Route6RB_MapEventHeader: ; 0x1adadb
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $3, $11, 1, GROUP_ROUTE_6_UNDERGROUND_ENTRANCE_RB, MAP_ROUTE_6_UNDERGROUND_ENTRANCE_RB
	warp_def $1, $6, 1, GROUP_ROUTE_6_SAFFRON_GATE_RB, MAP_ROUTE_6_SAFFRON_GATE_RB

	; xy triggers
	db 0

	; signposts
	db 1
	signpost 5, 19, $0, MapRoute6RBSignpost0Script

	; people-events
	db 6
	person_event SPRITE_COOLTRAINER_M, 13, 14, $9, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 0, 0, TrainerRoute6RBCamper1, -1
	person_event SPRITE_LASS, 13, 15, $8, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 0, 0, TrainerRoute6RBPicnicker1, -1
	person_event SPRITE_BUG_CATCHER, 10, 4, $9, 0, 0, -1, -1, 0, 2, 4, TrainerRoute6RBBugCatcher1, -1
	person_event SPRITE_COOLTRAINER_M, 21, 13, $8, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 2, 3, TrainerRoute6RBCamper2, -1
	person_event SPRITE_LASS, 20, 13, $8, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 2, 3, TrainerRoute6RBPicnicker2, -1
	person_event SPRITE_BUG_CATCHER, 17, 23, $8, 0, 0, -1, -1, 0, 2, 3, TrainerRoute6RBBugCatcher2, -1
; 0x1adb17

