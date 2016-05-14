CeruleanGymRB_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

CeruleanGymRB_MistyScript:
	faceplayer
	loadfont
	checkevent EVENT_GOT_TM_RAIN_DANCE
	iftrue .got_tm
	checkflag ENGINE_CASCADEBADGE
	iftrue .have_badge
	writetext CeruleanGymRB_MistyIntroText
	waitbutton
	closetext
	winlosstext CeruleanGymRB_MistyLostText, $0000
	loadtrainer MISTY_RB, 1
	startbattle
	returnafterbattle
	setevent EVENT_BEAT_MISTY_RB
	setevent EVENT_BEAT_SWIMMERM_PARKER_RB
	setevent EVENT_BEAT_SWIMMERF_DIANA_RB
	loadfont
	writetext CeruleanGymRB_GotBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_CASCADEBADGE
.have_badge:
	writetext CeruleanGymRB_MistyCongratsText
	waitbutton
.got_tm
	scall .tm
	waitbutton
	closetext
	end

.tm:
	givetm TM_RAIN_DANCE, EVENT_GOT_TM_RAIN_DANCE, .already_had_it, .bag_full
	writetext CeruleanGymRB_TMText
	end

.already_had_it:
	writetext CeruleanGymRB_TMText
	end

.bag_full:
	writetext CeruleanGymRB_NeedTMText
	end

TrainerSwimmerfDianaRB:
	trainer EVENT_BEAT_SWIMMERF_DIANA_RB, SWIMMERF, DIANA_RB, CeruleanGymRB_BattleText1, CeruleanGymRB_EndBattleText1, NULL, .After

.After:
	talkaftercancel
	loadfont
	writetext CeruleanGymRB_AfterBattleText1
	waitbutton
	closetext
	end

TrainerSwimmermParkerRB:
	trainer EVENT_BEAT_SWIMMERM_PARKER_RB, SWIMMERM, PARKER_RB, CeruleanGymRB_BattleText2, CeruleanGymRB_EndBattleText2, NULL, .After

.After:
	talkaftercancel
	loadfont
	writetext CeruleanGymRB_AfterBattleText2
	waitbutton
	closetext
	end

CeruleanGymRB_GymGuyScript:
	faceplayer
	loadfont
	checkevent EVENT_BEAT_MISTY_RB
	iftrue .Won
	writetext CeruleanGymRB_GymGuyText
	waitbutton
	closetext
	end

.Won
	writetext CeruleanGymRB_GymGuyWinText
	waitbutton
	closetext
	end

CeruleanGymRB_StatueScript:
	trainertotext MISTY_RB, 1, $1
	checkflag ENGINE_CASCADEBADGE
	iftrue .HaveBadge
	jumpstd gymstatue1

.HaveBadge:
	jumpstd gymstatue2

CeruleanGymRB_MistyIntroText:
	text "Hi, you're a new"
	line "face!"

	para "Trainers who want"
	line "to turn pro have"
	para "to have a policy"
	line "about #MON!"

	para "What is your"
	line "approach when you"
	cont "catch #MON?"

	para "My policy is an"
	line "all-out offensive"
	para "with WATER-type"
	line "#MON!"
	done

CeruleanGymRB_MistyLostText:
	text "Wow!"
	line "You're too much!"

	para "All right!"

	para "You can have the"
	line "CASCADEBADGE to"
	cont "show you beat me!"
	done

CeruleanGymRB_GotBadgeText:
	text "<PLAYER> received"
	line "CASCADEBADGE."
	done

CeruleanGymRB_MistyCongratsText:
	text "The CASCADEBADGE"
	line "makes all #MON"
	cont "up to L30 obey!"

	para "That includes"
	line "even outsiders!"

	para "There's more, you"
	line "can now use CUT"
	cont "any time!"

	para "You can CUT down"
	line "small bushes to"
	cont "open new paths!"

	para "You can also have"
	line "my favorite TM!"
	done

CeruleanGymRB_TMText:
	text "TM18 teaches"
	line "RAIN DANCE!"

	para "Use it on an"
	line "aquatic #MON!"
	done

CeruleanGymRB_NeedTMText:
	text "You better make"
	line "room for this TM!"
	done

CeruleanGymRB_BattleText1:
	text "I'm more than good"
	line "enough for you!"

	para "MISTY can wait!"
	done

CeruleanGymRB_EndBattleText1:
	text "You totally"
	line "overwhelmed me!"
	done

CeruleanGymRB_AfterBattleText1:
	text "You have to face"
	line "other trainers to"
	cont "find out how good"
	cont "you really are."
	done

CeruleanGymRB_BattleText2:
	text "Splash!"

	para "I'm first up!"
	line "Let's do it!"
	done

CeruleanGymRB_EndBattleText2:
	text "That can't be!"
	done

CeruleanGymRB_AfterBattleText2:
	text "MISTY is going to"
	line "keep improving!"

	para "She won't lose to"
	line "someone like you!"
	done

CeruleanGymRB_GymGuyText:
	text "Yo! Champ in"
	line "making!"

	para "Here's my advice!"

	para "The LEADER, MISTY,"
	line "is a pro who uses"
	cont "WATER #MON!"

	para "You can drain all"
	line "their water with"
	cont "GRASS #MON!"

	para "Or, zap them with"
	line "electricity!"
	done

CeruleanGymRB_GymGuyWinText:
	text "You beat MISTY!"
	line "What'd I tell ya?"

	para "You and me kid,"
	line "we make a pretty"
	cont "darn good team!"
	done


CeruleanGymRB_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 2
	warp_def 15, 4, 4, GROUP_CERULEAN_CITY_RB, MAP_CERULEAN_CITY_RB
	warp_def 15, 5, 4, GROUP_CERULEAN_CITY_RB, MAP_CERULEAN_CITY_RB

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 13, 2, $0, CeruleanGymRB_StatueScript
	signpost 13, 6, $0, CeruleanGymRB_StatueScript

	; people-events
	db 4
	person_event SPRITE_MISTY, 7, 9, $6, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, CeruleanGymRB_MistyScript, -1
	person_event SPRITE_LASS, 8, 6, $9, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 2, 3, TrainerSwimmerfDianaRB, -1
	person_event SPRITE_SWIMMER_GUY, 13, 12, $8, 0, 0, -1, -1, 8 + PAL_OW_RED, 2, 3, TrainerSwimmermParkerRB, -1
	person_event SPRITE_GYM_GUY, 17, 11, $6, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, CeruleanGymRB_GymGuyScript, -1

