Route25RB_MapScriptHeader: ; 0x19ee94
	; trigger count
	db 0
	; callback count
	db 0
; 0x19ee9e

Route25RBTrainer1:
	trainer EVENT_ROUTE_25_YOUNGSTER_1_RB, YOUNGSTER, JOEY_RB, _Route25BattleText1, _Route25EndBattleText1, 0, .Script
.Script
	talkaftercancel
	loadfont
	writetext _Route25AfterBattleText1
	waitbutton
	closetext
	end

Route25RBTrainer2:
	trainer EVENT_ROUTE_25_YOUNGSTER_2_RB, YOUNGSTER, DAN_RB, _Route25BattleText2, _Route25EndBattleText2, 0, .Script
.Script
	talkaftercancel
	loadfont
	writetext _Route25AfterBattleText2
	waitbutton
	closetext
	end

Route25RBTrainer3:
	trainer EVENT_ROUTE_25_JR_TRAINER_RB, CAMPER, FLINT_RB, _Route25BattleText3, _Route25EndBattleText3, 0, .Script
.Script
	talkaftercancel
	loadfont
	writetext _Route25AfterBattleText3
	waitbutton
	closetext
	end

Route25RBTrainer4:
	trainer EVENT_ROUTE_25_LASS_1_RB, PICNICKER, KELSEY_RB, _Route25BattleText4, _Route25EndBattleText4, 0, .Script
.Script
	talkaftercancel
	loadfont
	writetext _Route25AfterBattleText4
	waitbutton
	closetext
	end

Route25RBTrainer5:
	trainer EVENT_ROUTE_25_YOUNGSTER_3_RB, YOUNGSTER, CHAD_RB, _Route25BattleText5, _Route25EndBattleText5, 0, .Script
.Script
	talkaftercancel
	loadfont
	writetext _Route25AfterBattleText5
	waitbutton
	closetext
	end

Route25RBTrainer6:
	trainer EVENT_ROUTE_25_LASS_2_RB, LASS, HALEY_RB, _Route25BattleText6, _Route25EndBattleText6, 0, .Script
.Script
	talkaftercancel
	loadfont
	writetext _Route25AfterBattleText6
	waitbutton
	closetext
	end

Route25RBTrainer7:
	trainer EVENT_ROUTE_25_HIKER_1_RB, HIKER, FRANK_RB, _Route25BattleText7, _Route25EndBattleText7, 0, .Script
.Script
	talkaftercancel
	loadfont
	writetext _Route25AfterBattleText7
	waitbutton
	closetext
	end

Route25RBTrainer8:
	trainer EVENT_ROUTE_25_HIKER_2_RB, HIKER, WAYNE_RB, _Route25BattleText8, _Route25EndBattleText8, 0, .Script
.Script
	talkaftercancel
	loadfont
	writetext _Route25AfterBattleText8
	waitbutton
	closetext
	end

Route25RBTrainer9:
	trainer EVENT_ROUTE_25_HIKER_3_RB, HIKER, NOB_RB, _Route25BattleText9, _Route25EndBattleText9, 0, .Script
.Script
	talkaftercancel
	loadfont
	writetext _Route25AfterBattleText9
	waitbutton
	closetext
	end

Route25RB_TMBall:
	db TM_SEISMIC_TOSS, 1

Route25RB_HiddenEther:
	dwb EVENT_ROUTE_25_RB_HIDDEN_ETHER, ETHER

Route25RB_HiddenElixer:
	dwb EVENT_ROUTE_25_RB_HIDDEN_ELIXER, ELIXER

Route25RB_BillsHouseSignScript:
	jumptext _Route25Text11

_Route25BattleText1:
	text "Local trainers"
	line "come here to"
	cont "practice!"
	done

_Route25EndBattleText1:
	text "You're decent."
	done

_Route25AfterBattleText1:
	text "All #MON have"
	line "weaknesses. It's"
	cont "best to raise"
	cont "different kinds."
	done

_Route25BattleText2:
	text "Dad took me to a"
	line "great party on"
	cont "S.S.ANNE at"
	cont "VERMILION CITY!"
	done

_Route25EndBattleText2:
	text "I'm not mad!"
	done

_Route25AfterBattleText2:
	text "On S.S.ANNE, I"
	line "saw trainers from"
	cont "around the world."
	done

_Route25BattleText3:
	text "I'm a cool guy."
	line "I've got a girl"
	cont "friend!"
	done

_Route25EndBattleText3:
	text "Aww, darn<...>"
	done

_Route25AfterBattleText3:
	text "Oh well. My girl"
	line "will cheer me up."
	done

_Route25BattleText4:
	text "Hi! My boy"
	line "friend is cool!"
	done

_Route25EndBattleText4:
	text "I was in bad"
	line "condition!"
	done

_Route25AfterBattleText4:
	text "I wish my guy was"
	line "as good as you!"
	done

_Route25BattleText5:
	text "I knew I had to"
	line "fight you!"
	done

_Route25EndBattleText5:
	text "I knew I'd lose,"
	line "too!"
	done

_Route25AfterBattleText5:
	text "If your #MON"
	line "gets confused or"
	cont "falls asleep,"
	cont "switch it!"
	done

_Route25BattleText6:
	text "My friend has a"
	line "cute #MON."
	cont "I'm so jealous!"
	done

_Route25EndBattleText6:
	text "I'm not so"
	line "jealous!"
	done

_Route25AfterBattleText6:
	text "You came from MT."
	line "MOON? May I have"
	cont "a CLEFAIRY?"
	done

_Route25BattleText7:
	text "I just got down"
	line "from MT.MOON,"
	cont "but I'm ready!"
	done

_Route25EndBattleText7:
	text "You worked hard!"
	done

_Route25AfterBattleText7:
	text "Drat!"
	line "A ZUBAT bit me"
	cont "back in there."
	done

_Route25BattleText8:
	text "I'm off to see a"
	line "#MON collector"
	cont "at the cape!"
	done

_Route25EndBattleText8:
	text "You got me."
	done

_Route25AfterBattleText8:
	text "The collector has"
	line "many rare kinds"
	cont "of #MON."
	done

_Route25BattleText9:
	text "You're going to"
	line "see BILL? First,"
	cont "let's fight!"
	done

_Route25EndBattleText9:
	text "You're something."
	done

_Route25AfterBattleText9:
	text "The trail below"
	line "is a shortcut to"
	cont "CERULEAN CITY."
	done

_Route25Text11:
	text "SEA COTTAGE"
	line "BILL lives here!"
	done

Route25RB_MapEventHeader: ; 0x19f58f
	; filler
	db 0, 0

	; warps
	db 1
	warp_def 3, 45, 1, GROUP_BILLS_HOUSE_RB, MAP_BILLS_HOUSE_RB

	; xy triggers
	db 0

	; signposts
	db 3
	signpost 3, 43, $0, Route25RB_BillsHouseSignScript
	signpost 3, 38, $7, Route25RB_HiddenEther
	signpost 1, 10, $7, Route25RB_HiddenElixer

	; people-events
	db 10
	person_event SPRITE_YOUNGSTER,      6, 18, $6, 0, 0, -1, -1, 0, 2, 2, Route25RBTrainer1, -1
	person_event SPRITE_YOUNGSTER,      9, 22, $7, 0, 0, -1, -1, 0, 2, 3, Route25RBTrainer2, -1
	person_event SPRITE_COOLTRAINER_M,  8, 28, $6, 0, 0, -1, -1, 0, 2, 3, Route25RBTrainer3, -1
	person_event SPRITE_LASS,          12, 22, $9, 0, 0, -1, -1, 0, 2, 2, Route25RBTrainer4, -1
	person_event SPRITE_YOUNGSTER,      7, 36, $8, 0, 0, -1, -1, 0, 2, 3, Route25RBTrainer5, -1
	person_event SPRITE_LASS,           8, 41, $6, 0, 0, -1, -1, 0, 2, 3, Route25RBTrainer6, -1
	person_event SPRITE_POKEFAN_M,      8, 12, $9, 0, 0, -1, -1, 0, 2, 3, Route25RBTrainer7, -1
	person_event SPRITE_POKEFAN_M,     13, 27, $7, 0, 0, -1, -1, 0, 2, 2, Route25RBTrainer8, -1
	person_event SPRITE_POKEFAN_M,     11, 17, $9, 0, 0, -1, -1, 0, 2, 2, Route25RBTrainer9, -1
	person_event SPRITE_POKE_BALL,      6, 26, $1, 0, 0, -1, -1, 0, 1, 0, Route25RB_TMBall, EVENT_ROUTE_25_TM19_RB
; 0x19f643
