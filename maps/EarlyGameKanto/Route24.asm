Route24RB_MapScriptHeader: ; 0x1adbf8
	; trigger count
	db 2
	dw .Trigger0, 0
	dw .Trigger1, 0

	; callback count
	db 0
.Trigger0
	end
.Trigger1
	end

Route24RBTrainerCamper:
	trainer EVENT_ROUTE_24_JR_TRAINER_RB, CAMPER, SHANE_RB, _Route24BattleText1, _Route24EndBattleText1, 0, .script
.script
	talkaftercancel
	loadfont
	writetext _Route24AfterBattleText1
	waitbutton
	closetext
	end

NuggetBridgeRBTrainer5:
	trainer EVENT_NUGGET_BRIDGE_TRAINER_5_RB, CAMPER, ETHAN_RB, _Route24BattleText2, _Route24EndBattleText2, 0, .script
.script
	talkaftercancel
	loadfont
	writetext _Route24AfterBattleText2
	waitbutton
	closetext
	end

NuggetBridgeRBTrainer4:
	trainer EVENT_NUGGET_BRIDGE_TRAINER_4_RB, LASS, RELI_RB, _Route24BattleText3, _Route24EndBattleText3, 0, .script
.script
	talkaftercancel
	loadfont
	writetext _Route24AfterBattleText3
	waitbutton
	closetext
	end

NuggetBridgeRBTrainer3:
	trainer EVENT_NUGGET_BRIDGE_TRAINER_3_RB, YOUNGSTER, TIMMY_RB, _Route24BattleText4, _Route24EndBattleText4, 0, .script
.script
	talkaftercancel
	loadfont
	writetext _Route24AfterBattleText4
	waitbutton
	closetext
	end

NuggetBridgeRBTrainer2:
	trainer EVENT_NUGGET_BRIDGE_TRAINER_2_RB, LASS, ALI_RB, _Route24BattleText5, _Route24EndBattleText5, 0, .script
.script
	talkaftercancel
	loadfont
	writetext _Route24AfterBattleText5
	waitbutton
	closetext
	end

NuggetBridgeRBTrainer1:
	trainer EVENT_NUGGET_BRIDGE_TRAINER_1_RB, BUG_CATCHER, CALE_RB, _Route24BattleText6, _Route24EndBattleText6, 0, .script
.script
	talkaftercancel
	loadfont
	writetext _Route24AfterBattleText6
	waitbutton
	closetext
	end

Route24RBRocketBattleTrigger:
	setlasttalked $2
	spriteface $0, RIGHT
NuggetBridgeRBEndGuyScript:
	faceplayer
	loadfont
	checkevent EVENT_NUGGET_BRIDGE_TRAINER_6_RB
	iftrue .after_text
	writetext Route24RBRocketText1a
	writetext Route24RBRocketText1b
	buttonsound
	verbosegiveitem NUGGET, 1
	writetext Route24RBRocketText2a
.loop1
	yesorno
	iffalse .ask2
	writetext Route24RBOakIntervenesText
	jump .loop1

.ask2
	writetext Route24RBRocketText2b
	yesorno
	iftrue .ask3
	writetext Route24RBOakIntervenesText
.loop2
	yesorno
	iffalse .ask3
	writetext Route24RBOakIntervenesText
	jump .loop2

.ask3
	writetext Route24RBRocketText2c
.loop3
	yesorno
	iffalse .ask4
	writetext Route24RBOakIntervenesText
	jump .loop3

.ask4
	writetext Route24RBRocketText2d
.loop4
	yesorno
	iffalse .startbattle
	writetext Route24RBOakIntervenesText
	jump .loop4

.startbattle
	playmusic MUSIC_HIKER_ENCOUNTER
	writetext Route24RBRocketText3
	waitbutton
	closetext
	loadtrainer GRUNTM, 36
	winlosstext Route24RBRocketWinText, 0
	startbattle
	returnafterbattle
	special RestartMapMusic
	dotrigger $1
	setevent EVENT_NUGGET_BRIDGE_TRAINER_6_RB
	loadfont
.after_text
	writetext Route24RBRocketText4
	waitbutton
	closetext
	end

Route24RBTM45:
	db TM_THUNDER_WAVE, 1

Route24RBRocketText1a:
	text "Congratulations!"
	para "You beat our 5"
	line "contest trainers!@"
	sound0x02
	text_waitsfx
	db "@"

Route24RBRocketText1b:
	text "You just earned a"
	line "fabulous prize!"
	done

Route24RBRocketText2a:
	text "By the way, would"
	line "you like to join"
	cont "TEAM ROCKET?"

	para "We're a group"
	line "dedicated to evil"
	cont "using #MON!"

	para "Want to join?"
	done

Route24RBRocketText2b:
	text "Are you sure?"
	done

Route24RBRocketText2c:
	text "Come on, join us!"
	done

Route24RBRocketText2d:
	text "I'm telling you"
	line "to join!"
	done

Route24RBRocketText3:
	text "OK, you need"
	line "convincing!"

	para "I'll make you an"
	line "offer you can't"
	cont "refuse!"
	done

Route24RBOakIntervenesText:
	text "OAK's words echoed<...>"

	para "<PLAYER>! Is this"
	line "the right thing to"
	cont "do?"

	para $56, $56, $56
	line $56, $56, $56

	para "Why are you hesi-"
	line "tating? This is"
	cont "a great offer!"
	cont "Take it!"
	done

Route24RBRocketWinText:
	text "Arrgh!"
	line "You are good!"
	done

Route24RBRocketText4:
	text "With your ability,"
	line "you could become"
	cont "a top leader in"
	cont "TEAM ROCKET!"
	done

_Route24BattleText1:
	text "I saw your feat"
	line "from the grass!"
	done

_Route24EndBattleText1:
	text "I thought not!"
	done

_Route24AfterBattleText1:
	text "I hid because the"
	line "people on the"
	cont "bridge scared me!"
	done

_Route24BattleText2:
	text "OK! I'm No. 5!"
	line "I'll stomp you!"
	done

_Route24EndBattleText2:
	text "Whoa! Too much!"
	done

_Route24AfterBattleText2:
	text "I did my best, I"
	line "have no regrets!"
	done

_Route24BattleText3:
	text "I'm No. 4!"
	line "Getting tired?"
	done

_Route24EndBattleText3:
	text "I lost too!"
	done

_Route24AfterBattleText3:
	text "I did my best, so"
	line "I've no regrets!"
	done

_Route24BattleText4:
	text "Here's No. 3!"
	line "I won't be easy!"
	done

_Route24EndBattleText4:
	text "Ow! Stomped flat!"
	done

_Route24AfterBattleText4:
	text "I did my best, I"
	line "have no regrets!"
	done

_Route24BattleText5:
	text "I'm second!"
	line "Now it's serious!"
	done

_Route24EndBattleText5:
	text "How could I lose?"
	done

_Route24AfterBattleText5:
	text "I did my best, I"
	line "have no regrets!"
	done

_Route24BattleText6:
	text "This is NUGGET"
	line "BRIDGE! Beat us 5"
	cont "trainers and win"
	cont "a fabulous prize!"

	para "Think you got"
	line "what it takes?"
	done

_Route24EndBattleText6:
	text "Whoo! Good stuff!"
	done

_Route24AfterBattleText6:
	text "I did my best, I"
	line "have no regrets!"
	done

Route24RB_MapEventHeader: ; 0x1adf50
	; filler
	db 0, 0

	; warps
	db 0

	; xy triggers
	db 1
	xy_trigger 0, 15, 10, $0, Route24RBRocketBattleTrigger, 0, 0

	; signposts
	db 0

	; people-events
	db 8
	person_event SPRITE_COOLTRAINER_M, 19, 15, $8, 0, 0, -1, -1, 0, 0, 0, NuggetBridgeRBEndGuyScript, -1
	person_event SPRITE_COOLTRAINER_M, 24,  9, $7, 0, 0, -1, -1, 0, 2, 4, Route24RBTrainerCamper,     -1
	person_event SPRITE_COOLTRAINER_M, 22, 15, $8, 0, 0, -1, -1, 0, 2, 1, NuggetBridgeRBTrainer5,     -1
	person_event SPRITE_LASS,          25, 14, $9, 0, 0, -1, -1, 0, 2, 1, NuggetBridgeRBTrainer4,     -1
	person_event SPRITE_YOUNGSTER,     28, 15, $8, 0, 0, -1, -1, 0, 2, 1, NuggetBridgeRBTrainer3,     -1
	person_event SPRITE_LASS,          31, 14, $9, 0, 0, -1, -1, 0, 2, 1, NuggetBridgeRBTrainer2,     -1
	person_event SPRITE_BUG_CATCHER,   34, 15, $8, 0, 0, -1, -1, 0, 2, 1, NuggetBridgeRBTrainer1,     -1
	person_event SPRITE_POKE_BALL,      9, 14, $1, 0, 0, -1, -1, 0, 1, 0, Route24RBTM45, EVENT_ROUTE_24_TM45_RB
; 0x1adf63

