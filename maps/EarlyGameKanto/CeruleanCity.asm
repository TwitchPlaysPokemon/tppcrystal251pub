CeruleanCityRB_MapScriptHeader: ; 0x184000
	; trigger count
	db 2
	dw .Trigger0, 0
	dw .Trigger1, 0

	; callback count
	db 1
	dbw 5, .Callback
.Trigger0
	end
.Trigger1
	end
.Callback
	disappear $2
	return

CeruleanCityRivalBattleLeftTrigger:
	scall CeruleanCityRivalBattle
	spriteface $0, RIGHT
	applymovement $2, Movement_CeruleanRivalExitsRight
	spriteface $0, DOWN
	applymovement $2, Movement_CeruleanRivalExits
	disappear $2
	special RestartMapMusic
	end

CeruleanCityRivalBattleRightTrigger:
	moveperson $2, 21, 2
	scall CeruleanCityRivalBattle
	spriteface $0, LEFT
	applymovement $2, Movement_CeruleanRivalExitsLeft
	spriteface $0, DOWN
	applymovement $2, Movement_CeruleanRivalExits
	disappear $2
	special RestartMapMusic
	end

CeruleanCityRivalBattle:
	appear $2
	setlasttalked $2
	playmusic MUSIC_RIVAL_RB
	applymovement $2, Movement_CeruleanRivalEnters
	loadfont
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .male_intro
	writetext _CeruleanCityText_19668F
	jump .selectbattle
.male_intro
	writetext _CeruleanCityText_19668
.selectbattle
	waitbutton
	closetext
	checkevent EVENT_GOT_CHARMANDER_FROM_OAK
	iftrue .charmander
	checkevent EVENT_GOT_SQUIRTLE_FROM_OAK
	iftrue .squirtle
	loadtrainer BLUE_RB, BLUE_RB_3C
	jump .startbattle
.squirtle
	loadtrainer BLUE_RB, BLUE_RB_3B
	jump .startbattle
.charmander
	loadtrainer BLUE_RB, BLUE_RB_3A
.startbattle
	winlosstext _CeruleanCityText_1966d, _CeruleanCityText_19672
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .got_rival_gender
	loadvar OtherTrainerClass, BLUE_RB_F
	winlosstext _CeruleanCityText_1966dF, _CeruleanCityText_19672F
.got_rival_gender
	writecode VAR_BATTLETYPE, BATTLETYPE_RIVAL_RB
	startbattle
	returnafterbattle
	special RestartMapMusic
	loadfont
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .male_outro
	writetext _CeruleanCityText_19677F
	jump .finish
.male_outro
	writetext _CeruleanCityText_19677
.finish
	waitbutton
	closetext
	dotrigger $1
	playmusic MUSIC_RIVAL_AFTER_RB
	end

CeruleanCityRBSuperNerdScript:
	jumptextfaceplayer _CeruleanCityText3

CeruleanCityRBCooltrainerM1Script:
	faceplayer
	loadfont
	checkevent EVENT_CERULEAN_CITY_RB_STOPPED_ROBBERY
	iftrue .after
	writetext _CeruleanCityText4
	waitbutton
	closetext
	end
.after
	writetext _CeruleanCityText4After
	waitbutton
	closetext
	end

CeruleanCityRBCooltrainerM2Script:
	jumptextfaceplayer _CeruleanCityText5

CeruleanCityRBLass1Script:
	random 3
	if_equal 1, .text1
	if_equal 2, .text2
	jumptext _CeruleanCityText_19730
.text1
	jumptext _CeruleanCityText_19735
.text2
	loadfont
	writetext _CeruleanCityText_1973a
	waitbutton
	closetext
	faceplayer
	loadfont
	writetext _CeruleanCityText_1973a_2
	waitbutton
	closetext
	checkevent EVENT_CERULEAN_CITY_RB_STOPPED_ROBBERY
	iftrue .post_robbery_sprite
	spriteface $6, LEFT
	end
.post_robbery_sprite
	spriteface $7, LEFT
	end

CeruleanCityRBSlowbroScript:
	waitsfx
	cry SLOWBRO
	random 4
	if_equal 1, .text1
	if_equal 2, .text2
	if_equal 3, .text3
	jumptext _CeruleanCityText_1976f
.text1
	jumptext _CeruleanCityText_19774
.text2
	jumptext _CeruleanCityText_19779
.text3
	jumptext _CeruleanCityText_1977e

CeruleanCityRBLass2Script:
	jumptextfaceplayer _CeruleanCityText9

CeruleanCityRBRocketScript:
	loadfont
	writetext CeruleanCityRBRocketText1
	waitbutton
	closetext
	pause 15
	showemote $0, $c, 15
	pause 15
	faceplayer
	playmusic MUSIC_HIKER_ENCOUNTER
	loadfont
	writetext CeruleanCityRBRocketText2
	waitbutton
	closetext
	loadtrainer GRUNTM, 37
	winlosstext CeruleanCityRBRocketWinText, 0
	startbattle
	returnafterbattle
	special RestartMapMusic
	loadfont
	writetext CeruleanCityRBRocketText3
	waitbutton
	closetext
	disappear $6
	disappear $8
	appear $7
	appear $9
	moveperson $d, 27, 11
	checkcode VAR_FACING
	if_equal RIGHT, CeruleanRBGrampsScript_Right
	if_equal LEFT, CeruleanRBGrampsScript_Left
	spriteface $0, LEFT
	applymovement $c, Movement_CeruleanRocketRBRunsAway_playerbelow
	disappear $c
	pause 15
	appear $d
	playsound SFX_EXIT_BUILDING
	waitsfx
	applymovement $d, Movement_CeruleanGrampsRBApproaches_playerbelow
	loadfont
	writetext CeruleanCityRBRocketText4
	buttonsound
	verbosegiveitem TM_THIEF, 1
	iffalse .bag_full_up
	writetext CeruleanCityRBRocketText5
	waitbutton
	closetext
	applymovement $d, Movement_CeruleanGrampsRBRetreats_playerbelow
	disappear $d
	playsound SFX_ENTER_DOOR
	waitsfx
	end

.bag_full_up
	closetext
	applymovement $d, Movement_CeruleanGrampsRBPartialRetreat_playerbelow
	spriteface $d, DOWN
	end

CeruleanRBGrampsScript_Left
	spriteface $0, LEFT
	applymovement $c, Movement_CeruleanRocketRBRunsAway_playerright
	disappear $c
	pause 15
	appear $d
	playsound SFX_EXIT_BUILDING
	waitsfx
	applymovement $d, Movement_CeruleanGrampsRBApproaches_playerright
	loadfont
	writetext CeruleanCityRBRocketText4
	buttonsound
	verbosegiveitem TM_THIEF, 1
	iffalse .bag_full_left
	writetext CeruleanCityRBRocketText5
	waitbutton
	closetext
	applymovement $d, Movement_CeruleanGrampsRBRetreats_playerright
	disappear $d
	playsound SFX_ENTER_DOOR
	waitsfx
	end

.bag_full_left
	closetext
	applymovement $d, Movement_CeruleanGrampsRBPartialRetreat_playerright
	spriteface $d, DOWN
	end

CeruleanRBGrampsScript_Right
	spriteface $0, LEFT
	applymovement $c, Movement_CeruleanRocketRBRunsAway_playerleft
	disappear $c
	pause 15
	appear $d
	playsound SFX_EXIT_BUILDING
	waitsfx
	follow $0, $d
	applymovement $0, Movement_CeruleanGrampsRBApproaches_playerleft
	stopfollow
	spriteface $d, RIGHT
	loadfont
	writetext CeruleanCityRBRocketText4
CeruleanCityRBGrampsScriptContinue:
	buttonsound
	verbosegiveitem TM_THIEF, 1
	iffalse .bag_full_right
	writetext CeruleanCityRBRocketText5
	waitbutton
	closetext
	applymovement $d, Movement_CeruleanGrampsRBRetreats_playerleft
	disappear $d
	playsound SFX_ENTER_DOOR
	waitsfx
	end

.bag_full_right
	closetext
	spriteface $d, DOWN
	end

CeruleanCityRBGrampsScript:
	faceplayer
	loadfont
	writetext CeruleanCityRBRocketText6
	jump CeruleanCityRBGrampsScriptContinue

MapCeruleanCityRBSignpost0Script:
	jumptext _CeruleanCityText12

MapCeruleanCityRBSignpost1Script:
	jumptext _CeruleanCityText17

MapCeruleanCityRBSignpost2Script:
	jumptext _CeruleanCityText16

MapCeruleanCityRBSignpost3Script:
	jumptext _CeruleanCityText13

MapCeruleanCityRBSignpost6Script:
	jumpstd pokecentersign

MapCeruleanCityRBSignpost7Script:
	jumpstd martsign

MapCeruleanCityRBLockedDoorScript:
	jumptext Text_CeruleanCityRBLockedDoor

MapCeruleanCityRBHiddenRareCandy:
	dwb EVENT_CERULEAN_CITY_HIDDEN_RARE_CANDY, RARE_CANDY

Movement_CeruleanRivalExitsRight:
	slow_step_right
	step_end

Movement_CeruleanRivalExitsLeft
	slow_step_left
	step_end

Movement_CeruleanRivalExits:
	slow_step_down
	slow_step_down
Movement_CeruleanRivalEnters:
	slow_step_down
	slow_step_down
	slow_step_down
	slow_step_down
	step_end

Movement_CeruleanRocketRBRunsAway_playerleft:
	big_step_down
Movement_CeruleanRocketRBRunsAway_playerbelow:
Movement_CeruleanRocketRBRunsAway_playerright:
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	step_end

Movement_CeruleanGrampsRBApproaches_playerleft:
	step_right
	turn_head_left
	step_end

Movement_CeruleanGrampsRBApproaches_playerright:
	step_down
	step_right
	step_end

Movement_CeruleanGrampsRBApproaches_playerbelow:
	step_down
	step_down
	turn_head_right
	step_end

Movement_CeruleanGrampsRBRetreats_playerbelow:
	step_up
Movement_CeruleanGrampsRBPartialRetreat_playerbelow
	step_up
	step_end

Movement_CeruleanGrampsRBRetreats_playerright:
	step_left
Movement_CeruleanGrampsRBRetreats_playerleft:
	step_up
	step_end

Movement_CeruleanGrampsRBPartialRetreat_playerright:
	step_left
	step_end

_CeruleanCityText_19668F:
	text "<GREEN>: <PLAYER>!"
	line "Good to see you"
	cont "again!"

	para "How are you doing?"
	line "Your #MON look"
	cont "happy with you."

	para "I've caught a"
	line "bunch of cute"
	cont "#MON since we"
	cont "last fought."

	para "Let me show you"
	line "just how cute they"
	cont "are!"
	done

_CeruleanCityText_19668:
	text "<GREEN>: Yo!"
	line "<PLAYER>!"

	para "You're still"
	line "struggling along"
	cont "back here?"

	para "I'm doing great!"
	line "I caught a bunch"
	cont "of strong and"
	cont "smart #MON!"

	para "Here, let me see"
	line "what you caught,"
	cont "<PLAYER>!"
	done

_CeruleanCityText_1966dF:
	text "Wow, your #MON"
	line "have grown strong!"
	done

_CeruleanCityText_1966d:
	text "Hey! Take it easy!"
	line "You won already!"
	done

_CeruleanCityText_19672F:
	text "Aww<...> Looks like"
	line "my #MON won"
	cont "this time!"
	done

_CeruleanCityText_19672:
	text "Heh! You're no"
	line "match for my"
	cont "genius!"
	done

_CeruleanCityText_19677F:
	text "<GREEN>: So, I was"
	line "just at the cape,"

	para "and I met this"
	line "really nice man"
	cont "named BILL."

	para "He's quite the"
	line "collector, and he"
	cont "showed me his"
	cont "cutest catches."

	para "Oh, did you know?"
	line "BILL runs the"
	cont "#MON Storage"
	cont "System on PC!"

	para "You should go"
	line "introduce yourself"
	cont "to him."

	para "Alright, I should"
	line "get going."
	cont "Nice seeing you!"
	done

_CeruleanCityText_19677:
	text "<GREEN>: Hey,"
	line "guess what?"

	para "I went to BILL's"
	line "and got him to"
	cont "show me his rare"
	cont "#MON!"

	para "That added a lot"
	line "of pages to my"
	cont "#DEX!"

	para "After all, BILL's"
	line "world famous as a"
	cont "#MANIAC!"

	para "He invented the"
	line "#MON Storage"
	cont "System on PC!"

	para "Since you're using"
	line "his system, go"
	cont "thank him!"

	para "Well, I better"
	line "get rolling!"
	cont "Smell ya later!"
	done

_CeruleanCityText3:
	text "You're a trainer"
	line "too?"

	para "I got it! You're"
	line "here to challenge"
	cont "MISTY, is that it?"

	para "Best of luck!"
	done

_CeruleanCityText4:
	text "That SLOWBRO in"
	line "front of the shop"
	cont "is in the way."

	para "There might be a"
	line "way around."
	done

_CeruleanCityText4After:
	text "#MON have fee-"
	line "lings, too."

	para "If you let them"
	line "faint too often,"
	cont "they'll be un-"
	cont "happy with you."
	done

_CeruleanCityText5:
	text "The GYM LEADER is"
	line "out-of-this-world"
	cont "tough. You better"
	cont "watch yourself!"
	done

_CeruleanCityText_19730:
	text "OK! SLOWBRO!"
	line "Use SONICBOOM!"
	cont "Come on, SLOWBRO"
	cont "pay attention!"
	done

_CeruleanCityText_19735:
	text "SLOWBRO punch!"
	line "No! You blew it"
	cont "again!"
	done

_CeruleanCityText_1973a:
	text "SLOWBRO, WITHDRAW!"
	line "No! That's wrong!"
	done

_CeruleanCityText_1973a_2:
	text "It's so hard to"
	line "control #MON!"

	para "Your #MON's"
	line "obedience depends"
	cont "on your abilities"
	cont "as a trainer!"
	done

_CeruleanCityText_1976f:
	text "SLOWBRO took a"
	line "snooze<...>"
	done

_CeruleanCityText_19774:
	text "SLOWBRO is"
	line "loafing around<...>"
	done

_CeruleanCityText_19779:
	text "SLOWBRO turned"
	line "away<...>"
	done

_CeruleanCityText_1977e:
	text "SLOWBRO"
	line "ignored orders<...>"
	done

_CeruleanCityText9:
	text "I want a bright"
	line "red BICYCLE!"

	para "When will the"
	line "shop's OWNER"
	cont "return?"
	done

_CeruleanCityText12:
	text "CERULEAN CITY"
	line "A Mysterious,"
	cont "Blue Aura"
	cont "Surrounds It"
	done

_CeruleanCityText13:
	text "TRAINER TIPS"

	para "Pressing B Button"
	line "during evolution"
	cont "cancels the whole"
	cont "process."
	done

_CeruleanCityText16:
	text "Grass and caves"
	line "handled easily!"
	cont "BIKE SHOP"

	para "  CLOSED FOR THE"
	line "      HOLIDAY"
	done

_CeruleanCityText17:
	text "CERULEAN CITY"
	line "#MON GYM"
	cont "LEADER: MISTY"

	para "The Tomboyish"
	line "Mermaid!"
	done

Text_CeruleanCityRBLockedDoor:
	text "It's locked<...>"
	done

CeruleanCityRBRocketText1:
	text "So that's where he"
	line "keeps it<...>"
	done

CeruleanCityRBRocketText2:
	text "What? I was just"
	line "muttering to my-"
	cont "self."

	para "I'm innocent! Don't"
	line "you believe me?"
	done

CeruleanCityRBRocketWinText:
	text "Stop! I give up!"
	line "I'll leave quiet-"
	cont "ly!"
	done

CeruleanCityRBRocketText3:
	text "Darn it all! I'll"
	line "make sure you pay"
	cont "dearly for this!"
	done

CeruleanCityRBRocketText4:
	text "What was all that"
	line "commotion?"

	para "<...> Oh? Was that man"
	line "after my TM?"

	para "Thank you for cha-"
	line "sing him off."

	para "If I were just a"
	line "few years younger<...>"

	para "Ah, it can't be"
	line "helped."

	para "Here, let me thank"
	line "you for your trou-"
	cont "ble."
	done

CeruleanCityRBRocketText5:
	text "That TM teaches"
	line "THIEF."

	para "Not that you"
	line "should become one."
	done

CeruleanCityRBRocketText6:
	text "There you are! I've"
	line "held this for you!"
	done

CeruleanCityRB_MapEventHeader: ; 0x18445d
	; filler
	db 0, 0

	; warps
	db 6
	warp_def 11,  9, 1, GROUP_CERULEAN_GYM_BADGE_SPEECH_HOUSE_RB, MAP_CERULEAN_GYM_BADGE_SPEECH_HOUSE_RB
	warp_def 15, 13, 1, GROUP_CERULEAN_TRADE_SPEECH_HOUSE_RB, MAP_CERULEAN_TRADE_SPEECH_HOUSE_RB
	warp_def 17, 19, 1, GROUP_CERULEAN_POKECENTER_1F_RB, MAP_CERULEAN_POKECENTER_1F_RB
	warp_def 19, 30, 1, GROUP_CERULEAN_GYM_RB, MAP_CERULEAN_GYM_RB
	warp_def 25, 25, 2, GROUP_CERULEAN_MART_RB, MAP_CERULEAN_MART_RB
	warp_def  9,  9, 3, GROUP_CERULEAN_GYM_BADGE_SPEECH_HOUSE_RB, MAP_CERULEAN_GYM_BADGE_SPEECH_HOUSE_RB

	; xy triggers
	db 2
	xy_trigger 0,  7, 20, $0, CeruleanCityRivalBattleLeftTrigger, 0, 0
	xy_trigger 0,  7, 21, $0, CeruleanCityRivalBattleRightTrigger, 0, 0

	; signposts
	db 9
	signpost 19, 23, $0, MapCeruleanCityRBSignpost0Script
	signpost 21, 27, $0, MapCeruleanCityRBSignpost1Script
	signpost 25, 11, $0, MapCeruleanCityRBSignpost2Script
	signpost 29, 17, $0, MapCeruleanCityRBSignpost3Script
	signpost 17, 20, $0, MapCeruleanCityRBSignpost6Script
	signpost 25, 26, $0, MapCeruleanCityRBSignpost7Script
	signpost 25, 14, $0, MapCeruleanCityRBLockedDoorScript
	signpost 11, 27, $0, MapCeruleanCityRBLockedDoorScript
	signpost  8, 17, $7, MapCeruleanCityRBHiddenRareCandy

	; people-events
	db 13
	person_event SPRITE_EGK_RIVAL,  6, 24, $0, 0, 0, -1, -1, 0, 0, 0, ObjectEvent, EVENT_BEAT_RIVAL_IN_EGK_CERULEAN
	person_event SPRITE_SUPER_NERD, 24, 35, $6, 0, 0, -1, -1, 0, 0, 0, CeruleanCityRBSuperNerdScript, -1
	person_event SPRITE_COOLTRAINER_M, 22, 19, $2, 1, 1, -1, -1, 0, 0, 0, CeruleanCityRBCooltrainerM1Script, -1
	person_event SPRITE_COOLTRAINER_M, 25, 13, $4, 2, 0, -1, -1, 0, 0, 0, CeruleanCityRBCooltrainerM2Script, -1
	person_event SPRITE_LASS, 31, 24, $8, 0, 0, -1, -1, 0, 0, 0, CeruleanCityRBLass1Script, EVENT_CERULEAN_CITY_RB_STOPPED_ROBBERY
	person_event SPRITE_LASS, 30, 24, $8, 0, 0, -1, -1, 0, 0, 0, CeruleanCityRBLass1Script, EVENT_CERULEAN_CITY_RB_NOT_YET_ROBBERY
	person_event SPRITE_SLOWPOKE, 31, 23, $1, 0, 0, -1, -1, 0, 0, 0, CeruleanCityRBSlowbroScript, EVENT_CERULEAN_CITY_RB_STOPPED_ROBBERY
	person_event SPRITE_SLOWPOKE, 30, 23, $1, 0, 0, -1, -1, 0, 0, 0, CeruleanCityRBSlowbroScript, EVENT_CERULEAN_CITY_RB_NOT_YET_ROBBERY
	person_event SPRITE_LASS, 31, 13, $5, 0, 2, -1, -1, 0, 0, 0, CeruleanCityRBLass2Script, -1
	person_event SPRITE_COOLTRAINER_M, 16, 8, $6, 0, 0, -1, -1, 8 + PAL_OW_BROWN, 0, 0, ObjectEvent, EVENT_BLUE_REMATCH
	person_event SPRITE_ROCKET, 16, 32, $7, 0, 0, -1, -1, 0, 0, 0, CeruleanCityRBRocketScript, EVENT_CERULEAN_RB_ROCKET_1
	person_event SPRITE_GRAMPS, 16, 31, $3, 0, 0, -1, -1, 0, 0, 0, CeruleanCityRBGrampsScript, EVENT_CERULEAN_RB_ROCKET_2
; 0x1844fc

