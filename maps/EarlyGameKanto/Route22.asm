Route22RB_MapScriptHeader:
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

Route22RBRivalBattleTriggerBottom:
	playmusic MUSIC_RIVAL_RB
	applymovement $2, Route22RB_RivalWalksIn_PlayerOnBottom
	scall Route22RBRivalBattle
	applymovement $2, Route22RB_RivalWalksOut_PlayerOnBottom
	disappear $2
	dotrigger $0
	special RestartMapMusic
	end

Route22RBRivalBattleTriggerTop:
	playmusic MUSIC_RIVAL_RB
	applymovement $2, Route22RB_RivalWalksIn_PlayerOnTop
	spriteface $0, DOWN
	scall Route22RBRivalBattle
	applymovement $2, Route22RB_RivalWalksOut_PlayerOnTop
	disappear $2
	dotrigger $0
	special RestartMapMusic
	end

Route22RBRivalBattle:
	setlasttalked $2
	loadfont
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .male_rival_1
	writetext _Route22RivalBeforeBattleText1F
	jump .done_intro_text

.male_rival_1
	writetext _Route22RivalBeforeBattleText1
.done_intro_text
	waitbutton
	closetext
	checkevent EVENT_GOT_CHARMANDER_FROM_OAK
	iftrue .charmander
	checkevent EVENT_GOT_SQUIRTLE_FROM_OAK
	iftrue .squirtle
	loadtrainer BLUE_RB, BLUE_RB_2C
	jump .StartBattle

.charmander
	loadtrainer BLUE_RB, BLUE_RB_2A
	jump .StartBattle

.squirtle
	loadtrainer BLUE_RB, BLUE_RB_2B
.StartBattle
	winlosstext _Route22RivalDefeatedText1, _Route22RivalLossText
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .got_rival_gender
	loadvar OtherTrainerClass, BLUE_RB_F
	winlosstext _Route22RivalDefeatedText1F, _Route22RivalLossTextF
.got_rival_gender
	writecode VAR_BATTLETYPE, BATTLETYPE_RIVAL_RB
	startbattle
	returnafterbattle
	special RestartMapMusic
	loadfont
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .male_rival_2
	writetext _Route22RivalAfterBattleText1F
	jump .done_outro_text

.male_rival_2
	writetext _Route22RivalAfterBattleText1
.done_outro_text
	waitbutton
	closetext
	playmusic MUSIC_RIVAL_AFTER_RB
	end

Route22RB_RivalWalksIn_PlayerOnTop:
	step_right
	step_right
	step_right
	step_right
	step_right
	turn_head_up
	step_end

Route22RB_RivalWalksIn_PlayerOnBottom:
	step_right
	step_right
	step_right
	step_right
	step_end

Route22RB_RivalWalksOut_PlayerOnBottom:
	step_up
	step_right
	step_right
	step_right
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end

Route22RB_RivalWalksOut_PlayerOnTop:
	step_right
	step_right
	step_down
	step_down
	step_down
	step_down
	step_end

MapRoute22RBSignpost0Script:
	jumptext _Route22FrontGateText

_Route22RivalBeforeBattleText1::
	text "<GREEN>: Hey-ya!"
	line "<PLAYER>!"

	para "Seems like you're"
	line "going to the"
	cont "#MON LEAGUE."

	para "Well, forget it!"
	line "You don't have"
	cont "any BADGEs!"

	para "The guard won't"
	line "let you through!"

	para "That guard won't"
	line "let anybody"
	cont "through without"
	cont "BADGEs!"

	para "By the way, did"
	line "you make your"
	cont "#MON any"
	cont "stronger?"
	done

_Route22RivalAfterBattleText1::
	text "I've been hearin'"
	line "that the #MON"
	cont "LEAGUE has a lot"
	cont "of elite trainers!"

	para "I just gotta"
	line "figure out how to"
	cont "beat 'em!"

	para "You should stop"
	line "standing around"
	cont "and get going!"
	done

_Route22RivalDefeatedText1::
	text "<GREEN>: Ugh!"
	line "You just got"
	cont "lucky is all<...>"
	done

_Route22RivalLossText:
	text "<GREEN>: Aw yeah!"
	line "I'm good at this!"
	done

_Route22RivalBeforeBattleText1F::
	text "<GREEN>: Oh, hi"
	line "there <PLAYER>!"

	para "Are you going"
	line "towards the"
	cont "#MON LEAGUE?"

	para "I hate to disap-"
	line "point you, but<...>"
	cont "Don't bother."

	para "They won't let you"
	line "in without any"
	cont "BADGEs<...>"

	para "By the way, have"
	line "you taken good"
	cont "care of your"
	cont "#MON?"
	done

_Route22RivalAfterBattleText1F::
	text "I've heard a lot"
	line "of things about"
	cont "the #MON"
	cont "LEAGUE<...>"

	para "There are a lot of"
	line "powerful trainers"
	cont "up there."

	para "I'd really like to "
	line "see their battling"
	cont "techniques<...>"

	para "Oh, excuse me."
	line "I'll be on my way."
	done

_Route22RivalDefeatedText1F::
	text "<GREEN>: Oh<...>"
	line "not bad at all."
	done

_Route22RivalLossTextF:
	text "<GREEN>: Oh<...> I'm"
	line "sorry. I should've"
	cont "gone easier on"
	cont "you<...>"
	done

_Route22FrontGateText::
	text "#MON LEAGUE"
	line "Front Gate"
	done

Route22RB_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 1
	warp_def $5, $8, 1, GROUP_VICTORY_ROAD_GATE_RB, MAP_VICTORY_ROAD_GATE_RB

	; xy triggers
	db 2
	xy_trigger 1, 4, 29, $0, Route22RBRivalBattleTriggerTop, 0, 0
	xy_trigger 1, 5, 29, $0, Route22RBRivalBattleTriggerBottom, 0, 0

	; signposts
	db 1
	signpost 11, 7, $0, MapRoute22RBSignpost0Script

	; people-events
	db 1
	person_event SPRITE_EGK_RIVAL, 9, 28, $0, 0, 0, -1, -1, 0, 0, 0, ObjectEvent, EVENT_RIVAL_ROUTE_22_RB
; 0x7c038

