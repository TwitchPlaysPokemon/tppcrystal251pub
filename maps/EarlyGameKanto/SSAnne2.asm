SSAnne2_MapScriptHeader:
	db 2
	dw .Trigger0, 0
	dw .Trigger1, 0

	db 1
	dbw 2, .HideRival

.Trigger0
	end
.Trigger1
	end
.HideRival
	disappear $3
	return

SSAnne2RivalBattleTriggerLeft:
	appear $3
	playsound SFX_EXIT_BUILDING
	waitsfx
	playmusic MUSIC_RIVAL_RB
	applymovement $3, Movement_SSAnneRivalWalksStraightDown
	scall DoRivalBattleSSAnne
	applymovement $3, Movement_SSAnneRivalDepartsAroundPlayer
	disappear $3
	special RestartMapMusic
	end

SSAnne2RivalBattleTriggerRight:
	appear $3
	playsound SFX_EXIT_BUILDING
	waitsfx
	playmusic MUSIC_RIVAL_RB
	applymovement $3, Movement_SSAnneRivalWalksDownFacesRight
	spriteface $0, LEFT
	scall DoRivalBattleSSAnne
	applymovement $3, Movement_SSAnneRivalDepartsDirectly
	disappear $3
	special RestartMapMusic
	end

DoRivalBattleSSAnne:
	setlasttalked $3
	loadfont
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .malerival1
	writetext _SSAnneRivalBeforeBattleTextF
	jump .checkstarter
.malerival1
	writetext _SSAnneRivalBeforeBattleText
.checkstarter
	waitbutton
	closetext
	checkevent EVENT_GOT_CHARMANDER_FROM_OAK
	iftrue .charmander
	checkevent EVENT_GOT_SQUIRTLE_FROM_OAK
	iftrue .squirtle
	loadtrainer BLUE_RB, BLUE_RB_4C
	jump .StartBattle

.charmander
	loadtrainer BLUE_RB, BLUE_RB_4A
	jump .StartBattle

.squirtle
	loadtrainer BLUE_RB, BLUE_RB_4B
.StartBattle
	winlosstext _SSAnneRivalDefeatedText, _SSAnneRivalWonText
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .got_rival_gender
	loadvar OtherTrainerClass, BLUE_RB_F
	winlosstext _SSAnneRivalDefeatedTextF, _SSAnneRivalWonTextF
.got_rival_gender
	writecode VAR_BATTLETYPE, BATTLETYPE_RIVAL_RB
	startbattle
	returnafterbattle
	special RestartMapMusic
	loadfont
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .male_rival_2
	writetext _SSAnneRivalCaptainTextF
	jump .done_outro_text

.male_rival_2
	writetext _SSAnneRivalCaptainText
.done_outro_text
	waitbutton
	closetext
	playmusic MUSIC_RIVAL_AFTER_RB
	dotrigger 1
	end

SSAnne2RocketScript:
	jumptextfaceplayer SSAnne2RocketText

Movement_SSAnneRivalWalksStraightDown:
	slow_step_down
	slow_step_down
	slow_step_down
	step_end

Movement_SSAnneRivalWalksDownFacesRight:
	slow_step_down
	slow_step_down
	slow_step_down
	slow_step_down
	turn_head_right
	step_end

Movement_SSAnneRivalDepartsDirectly:
	slow_step_down
	slow_step_down
	slow_step_down
	slow_step_down
	slow_step_left
	slow_step_left
	slow_step_left
	slow_step_left
	slow_step_left
	step_end

Movement_SSAnneRivalDepartsAroundPlayer:
	slow_step_right
	slow_step_down
	slow_step_down
	slow_step_down
	slow_step_down
	slow_step_down
	slow_step_left
	slow_step_left
	slow_step_left
	slow_step_left
	slow_step_left
	slow_step_left
	step_end

SSAnne2GentlemanScript:
	jumptextfaceplayer _SSAnne2Text1

_SSAnne2Text1:
	text "This ship, she is"
	line "a luxury liner"
	cont "for trainers!"

	para "At every port, we"
	line "hold parties with"
	cont "invited trainers!"
	done

_SSAnneRivalBeforeBattleText:
	text "<GREEN>: Bonjour!"
	line "<PLAYER>!"

	para "Imagine seeing"
	line "you here!"

	para "<PLAYER>, were you"
	line "really invited?"

	para "So how's your"
	line "#DEX coming?"

	para "I already caught"
	line "40 kinds, pal!"

	para "Different kinds"
	line "are everywhere!"

	para "Crawl around in"
	line "grassy areas!"
	done

_SSAnneRivalDefeatedText:
	text "Humph!"

	para "At least you're"
	line "raising your"
	cont "#MON!"
	done

_SSAnneRivalWonText:
	text "<PLAYER>! What are"
	line "you, seasick?"

	para "You should shape"
	line "up, pal!"
	done

_SSAnneRivalCaptainText:
	text "<GREEN>: I heard"
	line "there was a CUT"
	cont "master on board."

	para "But, he was just a"
	line "seasick, old man!"

	para "But, CUT itself is"
	line "really useful!"

	para "You should go see"
	line "him! Smell ya!"
	done

_SSAnneRivalBeforeBattleTextF:
	text "<GREEN>: <PLAYER>,"
	line "bonjour!"

	para "You were invited"
	line "too? That's awe-"
	cont "some!"

	para "So how's your"
	line "#DEX coming?"

	para "Mine's filling up"
	line "nicely. I think I'm"
	cont "at 40 or some-"
	cont "thing."

	para "There's such a huge"
	line "variety of #-"
	cont "MON!"

	para "What kinds have"
	line "you caught,"
	cont "<PLAYER>?"
	done

_SSAnneRivalDefeatedTextF:
	text "Wow, you've found"
	line "some pretty tough"
	cont "#MON!"
	done

_SSAnneRivalWonTextF:
	text "Aww, <PLAYER><...>"

	para "Are you seasick?"
	line "You should've told"
	cont "me<...>"
	done

_SSAnneRivalCaptainTextF:
	text "<GREEN>: I heard"
	line "there was a CUT"
	cont "master on board."

	para "But, he seems to"
	line "be seasick. Poor"
	cont "guy<...>"

	para "The HM is pretty"
	line "handy, though."

	para "You should go see"
	line "him. Really!"

	para "See you around!"
	done

SSAnne2RocketText:
	text "The mutiny was a"
	line "success!"

	para "BOSS will be so"
	line "pleased!"
	done

SSAnne2_MapEventHeader:
	db 0, 0
	db 9
	warp_def 11, 9, 1, GROUP_S_S_ANNE_9, MAP_S_S_ANNE_9
	warp_def 11, 13, 3, GROUP_S_S_ANNE_9, MAP_S_S_ANNE_9
	warp_def 11, 17, 5, GROUP_S_S_ANNE_9, MAP_S_S_ANNE_9
	warp_def 11, 21, 7, GROUP_S_S_ANNE_9, MAP_S_S_ANNE_9
	warp_def 11, 25, 9, GROUP_S_S_ANNE_9, MAP_S_S_ANNE_9
	warp_def 11, 29, 11, GROUP_S_S_ANNE_9, MAP_S_S_ANNE_9
	warp_def 4, 2, 9, GROUP_S_S_ANNE_1, MAP_S_S_ANNE_1
	warp_def 12, 2, 2, GROUP_S_S_ANNE_3, MAP_S_S_ANNE_3
	warp_def 4, 36, 1, GROUP_S_S_ANNE_7, MAP_S_S_ANNE_7

	db 2
	xy_trigger 0, 8, 36, $0, SSAnne2RivalBattleTriggerLeft, 0, 0
	xy_trigger 0, 8, 37, $0, SSAnne2RivalBattleTriggerRight, 0, 0

	db 0
	db 10
	person_event SPRITE_GENTLEMAN, 11, 7, $4, 2, 0, -1, -1, 0, 0, 0, SSAnne2GentlemanScript, EVENT_ROCKET_TAKEOVER_OF_SS_ANNE
	person_event SPRITE_EGK_RIVAL, 8, 40, $0, 0, 0, -1, -1, 0, 0, 0, ObjectEvent, EVENT_SS_ANNE_EGK_RIVAL
	person_event SPRITE_ROCKET, 16, 13, $6, 0, 0, -1, -1, 0, 0, 0, SSAnne2RocketScript, EVENT_ROCKETS_NOT_YET_BOARDED_SS_ANNE
	person_event SPRITE_ROCKET, 16, 17, $6, 0, 0, -1, -1, 0, 0, 0, SSAnne2RocketScript, EVENT_ROCKETS_NOT_YET_BOARDED_SS_ANNE
	person_event SPRITE_ROCKET, 16, 21, $6, 0, 0, -1, -1, 0, 0, 0, SSAnne2RocketScript, EVENT_ROCKETS_NOT_YET_BOARDED_SS_ANNE
	person_event SPRITE_ROCKET, 16, 25, $6, 0, 0, -1, -1, 0, 0, 0, SSAnne2RocketScript, EVENT_ROCKETS_NOT_YET_BOARDED_SS_ANNE
	person_event SPRITE_ROCKET_GIRL, 16, 29, $6, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, SSAnne2RocketScript, EVENT_ROCKETS_NOT_YET_BOARDED_SS_ANNE
	person_event SPRITE_ROCKET, 16, 33, $6, 0, 0, -1, -1, 0, 0, 0, SSAnne2RocketScript, EVENT_ROCKETS_NOT_YET_BOARDED_SS_ANNE
	person_event SPRITE_ROCKET, 14, 7, $6, 0, 0, -1, -1, 0, 0, 0, SSAnne2RocketScript, EVENT_ROCKETS_NOT_YET_BOARDED_SS_ANNE
	person_event SPRITE_ROCKET_GIRL, 14, 6, $6, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, SSAnne2RocketScript, EVENT_ROCKETS_NOT_YET_BOARDED_SS_ANNE
