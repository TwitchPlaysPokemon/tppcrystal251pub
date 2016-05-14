SSAnne5_MapScriptHeader:
	db 2
	dw .Trigger0, 0
	dw .Trigger1, 0
	db 0
.Trigger0
	end
.Trigger1
	priorityjump .InfiniteRockets
	end

.InfiniteRockets
	dotrigger 0
	disappear $2
	disappear $3
	loadvar EngineBuffer1, 0
	jump .next_rocket
.loop
	loadfont
	writetext SSAnne10Text_WontGetAwayWithThis
	waitbutton
	closetext
	checkevent EVENT_ROCKETS_SS_ANNE_1
	iftrue .female
	applymovement $2, Movement_SSAnneRocketRetreat
	disappear $2
	jump .okay
.female
	applymovement $3, Movement_SSAnneRocketRetreat
	disappear $3
.okay
	playsound SFX_EXIT_BUILDING
	waitsfx
	copybytetovar EngineBuffer1
	if_equal 100, .next_rocket
	addvar 1
	copyvartobyte EngineBuffer1
.next_rocket
	playmusic MUSIC_ROCKET_ENCOUNTER
	random 2
	iffalse .male
	loadtrainer GRUNTF, 0
	moveperson $3, 8, 6
	appear $3
	applymovement $3, Movement_SSAnneRocketOneStepRight
	showemote $0, $3, 15
	pause 15
	applymovement $3, Movement_SSAnneRocketApproachesPlayer
	jump .got_class
.male
	loadtrainer GRUNTM, 0
	moveperson $2, 8, 6
	appear $2
	applymovement $2, Movement_SSAnneRocketOneStepRight
	showemote $0, $2, 15
	pause 15
	applymovement $2, Movement_SSAnneRocketApproachesPlayer
.got_class
	loadfont
	scall .GetWinText
	waitbutton
	closetext
	special SampleRandomRocket
	startbattle
	reloadmap
	iffalse .loop
	loadfont
	writetext SSAnne5TextAfter
	waitbutton
	closetext
	pause 30
	playmusic MUSIC_NONE
	earthquake 100
	pause 30
	loadfont
	writetext SSAnne5ShipwreckText
	waitbutton
	closetext
	checkevent EVENT_ROCKETS_SS_ANNE_1
	iftrue .female2
	showemote $0, $2, 15
	pause 15
	spriteface $2, LEFT
	jump .finish
.female2
	showemote $0, $3, 15
	pause 15
	spriteface $3, LEFT
.finish
	loadfont
	writetext SSAnne5ShipwreckText2
	closetext
	special Special_FadeToBlack
	special Functiond91
	playsound SFX_HYDRO_PUMP
	pause 8
	playsound SFX_HYDRO_PUMP
	pause 8
	playsound SFX_HYDRO_PUMP
	pause 8
	playsound SFX_HYDRO_PUMP
	pause 180
	setflag ENGINE_EARLY_GAME_KANTO
	domaptrigger GROUP_CHERRYGROVE_CITY, MAP_CHERRYGROVE_CITY, 2
	blackoutmod GROUP_CHERRYGROVE_CITY, MAP_CHERRYGROVE_CITY
	warpfacing DOWN, GROUP_CHERRYGROVE_CITY, MAP_CHERRYGROVE_CITY, 10, 9
	end

.GetWinText
	random 8
	if_equal 0, .one
	if_equal 1, .two
	if_equal 2, .three
	if_equal 3, .four
	if_equal 4, .five
	if_equal 5, .six
	if_equal 6, .seven
	if_equal 7, .eight
.one
	writetext RandomRocketsBeforeText1
	winlosstext RandomRocketsWinText1, 0
	end
.two
	writetext RandomRocketsBeforeText2
	winlosstext RandomRocketsWinText2, 0
	end
.three
	writetext RandomRocketsBeforeText3
	winlosstext RandomRocketsWinText3, 0
	end
.four
	writetext RandomRocketsBeforeText4
	winlosstext RandomRocketsWinText4, 0
	end
.five
	writetext RandomRocketsBeforeText5
	winlosstext RandomRocketsWinText5, 0
	end
.six
	writetext RandomRocketsBeforeText6
	winlosstext RandomRocketsWinText6, 0
	end
.seven
	writetext RandomRocketsBeforeText7
	winlosstext RandomRocketsWinText7, 0
	end
.eight
	writetext RandomRocketsBeforeText8
	winlosstext RandomRocketsWinText8, 0
	end

SSAnne5CooltrainerMScript:
	faceplayer
	loadfont
	checkevent EVENT_S_S_ANNE_RUBBED_CAPTAINS_BACK
	iftrue .departed_text
	writetext _SSAnne5Text1
	waitbutton
	closetext
	end
.departed_text
	writetext _SSAnne5Text1b
	waitbutton
	closetext
	end
SSAnne5SailorScript:
	jumptextfaceplayer _SSAnne5Text2
SSAnne5SuperNerdScript:
	jumptextfaceplayer _SSAnne5Text3
SSAnee5Sailor1Battle:
	trainer EVENT_S_S_ANNE_5_SAILOR1, SAILOR, TREVOR_RB, _SSAnne5BattleText1, _SSAnne5EndBattleText1, 0, .Script
.Script
	talkaftercancel
	loadfont
	writetext _SSAnne5AfterBattleText1
	waitbutton
	closetext
	end

SSAnee5Sailor2Battle:
	trainer EVENT_S_S_ANNE_5_SAILOR2, SAILOR, EDMOND_RB, _SSAnne5BattleText2, _SSAnne5EndBattleText2, 0, .Script
.Script
	talkaftercancel
	loadfont
	writetext _SSAnne5AfterBattleText2
	waitbutton
	closetext
	end

Movement_SSAnneRocketApproachesPlayer:
	big_step_right
	big_step_right
Movement_SSAnneRocketOneStepRight:
	big_step_right
	step_end

Movement_SSAnneRocketRetreat:
	big_step_down
	big_step_right
	step_end

RandomRocketsBeforeText1:
	text "Annoying brats"
	line "must be elimi-"
	cont "nated!"
	done

RandomRocketsBeforeText2:
	text "Are you inter-"
	line "fering with TEAM"
	cont "ROCKET's plans?"
	done

RandomRocketsBeforeText3:
	text "Were you the one"
	line "who foiled our"
	cont "operation in MT."
	cont "MOON?"
	done

RandomRocketsBeforeText4:
	text "Give me your #-"
	line "MON!"
	done

RandomRocketsBeforeText5:
	text "You shouldn't have"
	line "come here, child."
	done

RandomRocketsBeforeText6:
	text "You're quite fool-"
	line "ish to challenge"
	cont "TEAM ROCKET."
	done

RandomRocketsBeforeText7:
	text "I'll dispose of"
	line "you quickly."
	done

RandomRocketsBeforeText8:
	text "Get back to the"
	line "cabins where it's"
	cont "safe, kid."
	done

RandomRocketsWinText1:
	text "Arrgh!!"
	done
RandomRocketsWinText2:
	text "No way!"
	done
RandomRocketsWinText3:
	text "Too good!"
	done
RandomRocketsWinText4:
	text "I give up!"
	done
RandomRocketsWinText5:
	text "How are you this"
	line "strong?"
	done
RandomRocketsWinText6:
	text "Beaten by a mere"
	line "child?"
	done
RandomRocketsWinText7:
	text "Now I'm mad!"
	done
RandomRocketsWinText8:
	text "Grrrr<...>"
	done

SSAnne5TextAfter:
	text "Yeah, serves you"
	line "right!"

	para "No one, not even a"
	line "child, messes with"
	cont "TEAM ROCKET and"
	cont "leaves unscathed!"
	done

SSAnne10Text_WontGetAwayWithThis:
	text "You won't get away"
	line "with this, you"
	cont "little brat!"
	done

_SSAnne5Text1:
	text "The party's over."
	line "The ship will be"
	cont "departing soon."
	done

_SSAnne5Text1b:
	text "I can't wait until"
	line "we make land in"
	cont "OLIVINE."

	para "The party there is"
	line "said to outdo the"
	cont "VERMILION parties."
	done

_SSAnne5Text2:
	text "Scrubbing decks"
	line "is hard work!"
	done

_SSAnne5Text3:
	text "Urf. I feel ill."

	para "I stepped out to"
	line "get some air."
	done

_SSAnne5BattleText1:
	text "Hey matey!"

	para "Let's do a little"
	line "jig!"
	done

_SSAnne5EndBattleText1:
	text "You're"
	line "impressive!"
	done

_SSAnne5AfterBattleText1:
	text "How many kinds of"
	line "#MON do you"
	cont "think there are?"
	done

_SSAnne5BattleText2:
	text "Ahoy there!"
	line "Are you seasick?"
	done

_SSAnne5EndBattleText2:
	text "I was just"
	line "careless!"
	done

_SSAnne5AfterBattleText2:
	text "My Pa said there"
	line "are 150 kinds of"
	cont "#MON."
	para "I think there are"
	line "more."
	done

SSAnne5ShipwreckText:
	text "PA: All GRUNTS!"
	line "All GRUNTS!"

	para "This ship is on a"
	line "collision course."
	cont "Abort mission!"

	para "Repeat:"
	line "Abort mission!"
	done

SSAnne5ShipwreckText2:
	text "We gotta get out"
	line "of here!"

	para "Abandon ship!"
	line "Abando"
	done

SSAnne5_MapEventHeader:
	db 0, 0
	db 2
	warp_def 6, 13, 1, GROUP_S_S_ANNE_3, MAP_S_S_ANNE_3
	warp_def 7, 13, 1, GROUP_S_S_ANNE_3, MAP_S_S_ANNE_3

	db 0
	db 0
	db 9
	person_event SPRITE_ROCKET,        10, 13, $9, 0, 0, -1, -1, 0, 0, 0, ObjectEvent, EVENT_ROCKETS_SS_ANNE_1
	person_event SPRITE_ROCKET_GIRL,   10, 13, $9, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, ObjectEvent, EVENT_ROCKETS_SS_ANNE_2
	person_event SPRITE_COOLTRAINER_M,  6,  9, $7, 0, 0, -1, -1, 0, 0, 0, SSAnne5CooltrainerMScript, EVENT_ROCKET_TAKEOVER_OF_SS_ANNE
	person_event SPRITE_SAILOR,        13,  8, $3, 0, 0, -1, -1, 0, 0, 0, SSAnne5SailorScript, EVENT_ROCKET_TAKEOVER_OF_SS_ANNE
	person_event SPRITE_SUPER_NERD,    15, 11, $2, 1, 1, -1, -1, 0, 0, 0, SSAnne5SuperNerdScript, EVENT_ROCKET_TAKEOVER_OF_SS_ANNE
	person_event SPRITE_SAILOR,         8,  8, $6, 0, 0, -1, -1, 0, 2, 3, SSAnee5Sailor1Battle, EVENT_ROCKET_TAKEOVER_OF_SS_ANNE
	person_event SPRITE_SAILOR,        12, 14, $7, 0, 0, -1, -1, 0, 2, 3, SSAnee5Sailor2Battle, EVENT_ROCKET_TAKEOVER_OF_SS_ANNE
	person_event SPRITE_ROCKET,         11, 15, $9, 0, 0, -1, -1, 0, 0, 0, ObjectEvent, EVENT_ROCKETS_NOT_YET_BOARDED_SS_ANNE
	person_event SPRITE_ROCKET,          9, 14, $9, 0, 0, -1, -1, 0, 0, 0, ObjectEvent, EVENT_ROCKETS_NOT_YET_BOARDED_SS_ANNE
