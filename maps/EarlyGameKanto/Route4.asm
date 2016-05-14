Route4RB_MapScriptHeader:
	db 0
	db 0

Trainer_LassCrissy:
	trainer EVENT_LASS_CRISSY, LASS, CRISSY_RB, _Route4BattleText1, _Route4EndBattleText1, 0, .Script
.Script
	talkaftercancel
	loadfont
	writetext _Route4AfterBattleText1
	waitbutton
	closetext
	end

Route4RBEverstone:
	db TM_STRING_SHOT, 1

MapRoute4RBSignpost0Script:
	jumptext _Route4Text6

MapRoute4RBHiddenGreatBall:
	dwb EVENT_ROUTE_4_RB_HIDDEN_GREAT_BALL, GREAT_BALL

_Route4BattleText1:
	text "I came to get my"
	line "mushroom #MON!"
	done

_Route4EndBattleText1:
	text "Oh! My cute"
	line "mushroom #MON!"
	done

_Route4AfterBattleText1:
	text "There might not"
	line "be any more"
	cont "mushrooms here."

	para "I think I got"
	line "them all."
	done

_Route4Text6:
	text "ROUTE 4"
	line "MT.MOON -"
	cont "CERULEAN CITY"
	done


Route4RB_MapEventHeader:
	db 0, 0
	db 1
	warp_def $5, $2, 8, GROUP_MT_MOON_B2F_RB, MAP_MT_MOON_B2F_RB

	db 0

	db 2
	signpost  7,  3, $0, MapRoute4RBSignpost0Script
	signpost  3, 10, $7, MapRoute4RBHiddenGreatBall

	db 3
	person_event SPRITE_LASS,  8, 35, $9, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 2, 2, Trainer_LassCrissy, -1
	person_event SPRITE_POKE_BALL, 8, 26, $1, 0, 0, -1, -1, 0, 1, 0, Route4RBEverstone, EVENT_ROUTE_4_EVERSTONE
	person_event SPRITE_COOLTRAINER_M, 8, 48, $6, 0, 0, -1, -1, 8 + PAL_OW_BROWN, 0, 0, ObjectEvent, EVENT_BLUE_REMATCH
