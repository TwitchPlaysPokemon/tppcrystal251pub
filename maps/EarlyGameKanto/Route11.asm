Route11RB_MapScriptHeader: ; 0x68000
	; trigger count
	db 0

	; callback count
	db 0
; 0x68002
Trainer_Route11RBGambler1:
	trainer EVENT_ROUTE_11_GAMBLER_1_RB, GENTLEMAN, HUGO_RB, _Route11BattleText1, _Route11EndBattleText1, 0, .Script
.Script
	talkaftercancel
	loadfont
	writetext _Route11AfterBattleText1
	waitbutton
	closetext
	end

Trainer_Route11RBGambler2:
	trainer EVENT_ROUTE_11_GAMBLER_2_RB, GENTLEMAN, JASPER_RB, _Route11BattleText2, _Route11EndBattleText2, 0, .Script
.Script
	talkaftercancel
	loadfont
	writetext _Route11AfterBattleText2
	waitbutton
	closetext
	end

Trainer_Route11RBYoungster1:
	trainer EVENT_ROUTE_11_YOUNGSTER_1_RB, YOUNGSTER, EDDIE_RB, _Route11BattleText3, _Route11EndBattleText3, 0, .Script
.Script
	talkaftercancel
	loadfont
	writetext _Route11AfterBattleText3
	waitbutton
	closetext
	end

Trainer_Route11RBRocker1:
	trainer EVENT_ROUTE_11_ROCKER_1_RB, GUITARIST, BERNIE_RB, _Route11BattleText4, _Route11EndBattleText4, 0, .Script
.Script
	talkaftercancel
	loadfont
	writetext _Route11AfterBattleText4
	waitbutton
	closetext
	end

Trainer_Route11RBYoungster2:
	trainer EVENT_ROUTE_11_YOUNGSTER_2_RB, YOUNGSTER, DAVE_RB, _Route11BattleText5, _Route11EndBattleText5, 0, .Script
.Script
	talkaftercancel
	loadfont
	writetext _Route11AfterBattleText5
	waitbutton
	closetext
	end

Trainer_Route11RBGambler3:
	trainer EVENT_ROUTE_11_GAMBLER_3_RB, GENTLEMAN, DARIAN_RB, _Route11BattleText6, _Route11EndBattleText6, 0, .Script
.Script
	talkaftercancel
	loadfont
	writetext _Route11AfterBattleText6
	waitbutton
	closetext
	end

Trainer_Route11RBGambler4:
	trainer EVENT_ROUTE_11_GAMBLER_4_RB, GENTLEMAN, DIRK_RB, _Route11BattleText7, _Route11EndBattleText7, 0, .Script
.Script
	talkaftercancel
	loadfont
	writetext _Route11AfterBattleText7
	waitbutton
	closetext
	end

Trainer_Route11RBYoungster3:
	trainer EVENT_ROUTE_11_YOUNGSTER_3_RB, YOUNGSTER, DILLON_RB, _Route11BattleText8, _Route11EndBattleText8, 0, .Script
.Script
	talkaftercancel
	loadfont
	writetext _Route11AfterBattleText8
	waitbutton
	closetext
	end

Trainer_Route11RBRocker2:
	trainer EVENT_ROUTE_11_ROCKER_2_RB, GUITARIST, BRAXTON_RB, _Route11BattleText9, _Route11EndBattleText9, 0, .Script
.Script
	talkaftercancel
	loadfont
	writetext _Route11AfterBattleText9
	waitbutton
	closetext
	end

Trainer_Route11RBYoungster4:
	trainer EVENT_ROUTE_11_YOUNGSTER_4_RB, YOUNGSTER, YASU_RB, _Route11BattleText10, _Route11EndBattleText10, 0, .Script
.Script
	talkaftercancel
	loadfont
	writetext _Route11AfterBattleText10
	waitbutton
	closetext
	end


Route11RBFruitTree:
	fruittree $18

MapRoute11RBSignpost0Script:
	jumptext Route11RBSignpostText

Route11RBHiddenEscapeRope:
	dwb EVENT_ROUTE_11_HIDDEN_ESCAPE_ROPE_RB, ESCAPE_ROPE

_Route11BattleText1:
	text "Win, lose or draw!"
	done

_Route11EndBattleText1:
	text "Atcha!"
	line "Didn't go my way!"
	done

_Route11AfterBattleText1:
	text "#MON is life!"
	line "And to live is to"
	cont "gamble!"
	done

_Route11BattleText2:
	text "Competition! I"
	line "can't get enough!"
	done

_Route11EndBattleText2:
	text "I had a chance!"
	done

_Route11AfterBattleText2:
	text "You can't be a"
	line "coward in the"
	cont "world of #MON!"
	done

_Route11BattleText3:
	text "Let's go, but"
	line "don't cheat!"
	done

_Route11EndBattleText3:
	text "Huh?"
	line "That's not right!"
	done

_Route11AfterBattleText3:
	text "I did my best! I"
	line "have no regrets!"
	done

_Route11BattleText4:
	text "All amped up and"
	line "ready to rock!"
	done

_Route11EndBattleText4:
	text "Totally metal!"
	done

_Route11AfterBattleText4:
	text "It's important to"
	line "keep your instru-"
	cont "ments well tuned."
	done

_Route11BattleText5:
	text "I just became a"
	line "trainer! But, I"
	cont "think I can win!"
	done

_Route11EndBattleText5:
	text "My"
	line "#MON couldn't!"
	done

_Route11AfterBattleText5:
	text "What do you want?"
	line "Leave me alone!"
	done

_Route11BattleText6:
	text "Fwahaha! I have"
	line "never lost!"
	done

_Route11EndBattleText6:
	text "My first loss!"
	done

_Route11AfterBattleText6:
	text "Luck of the draw!"
	line "Just luck!"
	done

_Route11BattleText7:
	text "I have never won"
	line "before<...>"
	done

_Route11EndBattleText7:
	text "I saw this coming<...>"
	done

_Route11AfterBattleText7:
	text "It's just luck."
	line "Luck of the draw."
	done

_Route11BattleText8:
	text "I'm the best in"
	line "my class!"
	done

_Route11EndBattleText8:
	text "Darn!"
	line "I need to make my"
	cont "#MON stronger!"
	done

_Route11AfterBattleText8:
	text "There's a fat"
	line "#MON that"
	cont "comes down from"
	cont "the mountains."

	para "It's strong if"
	line "you can get it."
	done

_Route11BattleText9:
	text "#MON! Gotta"
	line "catch 'em all!!"

	para $56, " ", $56, " ", $56
	line $56, " ", $56, " ", $56

	para "Come on, sing with"
	line "me!"
	done

_Route11EndBattleText9:
	text "I know it's my"
	line "destiny!"
	done

_Route11AfterBattleText9:
	text "Gotta catch 'em"
	line "all!"
	para "Gotta catch 'em"
	line "all! #MON!!"
	done

_Route11BattleText10:
	text "My #MON should"
	line "be ready by now!"
	done

_Route11EndBattleText10:
	text "Too much, too"
	line "young!"
	done

_Route11AfterBattleText10:
	text "I better go find"
	line "stronger ones!"
	done

Route11RBSignpostText: ; 0x68238
	text "ROUTE 11"
	done

Route11RB_MapEventHeader: ; 0x68242
	; filler
	db 0, 0

	; warps
	db 2
	warp_def 8, 33, 1, GROUP_ROUTE_11_GATE_RB, MAP_ROUTE_11_GATE_RB
	warp_def 9, 33, 2, GROUP_ROUTE_11_GATE_RB, MAP_ROUTE_11_GATE_RB

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 7, 3, $0, MapRoute11RBSignpost0Script
	signpost 5, 32, $7, Route11RBHiddenEscapeRope

	; people-events
	db 11
	person_event SPRITE_GENTLEMAN, 18, 8, $6, 0, 0, -1, -1, 0, 2, 3, Trainer_Route11RBGambler1, -1
	person_event SPRITE_GENTLEMAN, 13, 19, $6, 0, 0, -1, -1, 0, 2, 2, Trainer_Route11RBGambler2, -1
	person_event SPRITE_YOUNGSTER, 9, 11, $8, 0, 0, -1, -1, 0, 2, 3, Trainer_Route11RBYoungster1, -1
	person_event SPRITE_COOLTRAINER_M, 15, 26, $6, 0, 0, -1, -1, 0, 2, 3, Trainer_Route11RBRocker1, -1
	person_event SPRITE_YOUNGSTER, 8, 16, $7, 0, 0, -1, -1, 0, 2, 3, Trainer_Route11RBYoungster2, -1
	person_event SPRITE_GENTLEMAN, 17, 35, $6, 0, 0, -1, -1, 0, 2, 3, Trainer_Route11RBGambler3, -1
	person_event SPRITE_GENTLEMAN, 7, 23, $7, 0, 0, -1, -1, 0, 2, 3, Trainer_Route11RBGambler4, -1
	person_event SPRITE_YOUNGSTER, 9, 32, $9, 0, 0, -1, -1, 0, 2, 4, Trainer_Route11RBYoungster3, -1
	person_event SPRITE_COOLTRAINER_M, 20, 33, $8, 0, 0, -1, -1, 0, 2, 4, Trainer_Route11RBRocker2, -1
	person_event SPRITE_YOUNGSTER, 16, 16, $6, 0, 0, -1, -1, 0, 2, 3, Trainer_Route11RBYoungster4, -1
	person_event SPRITE_FRUIT_TREE, 6, 36, $1, 0, 0, -1, -1, 0, 0, 0, Route11RBFruitTree, -1
; 0x68293

