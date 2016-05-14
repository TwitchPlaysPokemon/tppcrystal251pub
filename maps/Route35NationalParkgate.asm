Route35NationalParkgate_MapScriptHeader: ; 0x6a189
	; trigger count
	db 3

	; triggers
	dw UnknownScript_0x6a19d, $0000
	dw UnknownScript_0x6a19e, $0000
	dw UnknownScript_0x6a19f, $0000

	; callback count
	db 2

	; callbacks

	dbw 5, UnknownScript_0x6a1a3

	dbw 2, UnknownScript_0x6a1ca ;UnknownScript_0x6a1af
; 0x6a19d

UnknownScript_0x6a19d: ; 0x6a19d
	end
; 0x6a19e

UnknownScript_0x6a19e: ; 0x6a19e
	end
; 0x6a19f

UnknownScript_0x6a19f: ; 0x6a19f
	priorityjump UnknownScript_0x6a1d1
	end
; 0x6a1a3

UnknownScript_0x6a1a3: ; 0x6a1a3
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftrue UnknownScript_0x6a1ac
	dotrigger $0
	return
; 0x6a1ac

UnknownScript_0x6a1ac: ; 0x6a1ac
	dotrigger $2
	return
; 0x6a1af

; UnknownScript_0x6a1af: ; 0x6a1af
	; jump UnknownScript_0x6a1ca ;redundent as bug catching always on
	;checkcode VAR_WEEKDAY
	;if_equal TUESDAY, UnknownScript_0x6a1ca
	;if_equal THURSDAY, UnknownScript_0x6a1ca
	;if_equal SATURDAY, UnknownScript_0x6a1ca
	;checkflag ENGINE_BUG_CONTEST_TIMER
	;iftrue UnknownScript_0x6a1ac
	;disappear $2
	;appear $3
	;appear $4
	;return
; 0x6a1ca

UnknownScript_0x6a1ca: ; 0x6a1ca
	appear $2
	disappear $3
	disappear $4
	return
; 0x6a1d1

UnknownScript_0x6a1d1: ; 0x6a1d1 run if enterng while contest is on
	applymovement $0, MovementData_0x6a2e2
	spriteface $2, $3
	loadfont
	checkcode VAR_CONTESTTIME
	addvar $1
	RAM2MEM $0
	writetext UnknownText_0x6a79a
	yesorno
	iffalse UnknownScript_0x6a1ee
	writetext UnknownText_0x6a7db
	waitbutton
	closetext
	jumpstd bugcontestresultswarp
; 0x6a1ee

UnknownScript_0x6a1ee: ; 0x6a1ee
	writetext UnknownText_0x6a823
	waitbutton
	closetext
	scall UnknownScript_0x6a261
	playsound SFX_ENTER_DOOR
	special Function8c084
	waitsfx
	warpfacing $1, GROUP_NATIONAL_PARK_BUG_CONTEST, MAP_NATIONAL_PARK_BUG_CONTEST, $a, $2f
	end
; 0x6a204

OfficerScript_0x6a204: ; 0x6a204
		;checkcode VAR_WEEKDAY
		;if_equal SUNDAY, UnknownScript_0x6a2c7
		;if_equal MONDAY, UnknownScript_0x6a2c7
		;if_equal WEDNESDAY, UnknownScript_0x6a2c7
		;if_equal FRIDAY, UnknownScript_0x6a2c7
	faceplayer
	loadfont
		;checkflag ENGINE_51
		;iftrue UnknownScript_0x6a2c1
	checkevent EVENT_CONTEST_ADMIN_HOLDING_OLD_AMBER ;If holding amber, give amber
	iffalse SkipAmber35
	writetext UnknownText_0x6b97f
	buttonsound
	verbosegiveitem OLD_AMBER, 1
	iffalse AmberFailText35
	clearevent EVENT_CONTEST_ADMIN_HOLDING_OLD_AMBER
SkipAmber35:
	checkevent EVENT_CONTEST_ADMIN_HOLDING_SUN_STONE
	iffalse SkipSun35
	writetext UnknownText_0x6b97f
	buttonsound
	verbosegiveitem SUN_STONE, 1
	iffalse SunFailText35
	clearevent EVENT_CONTEST_ADMIN_HOLDING_SUN_STONE
SkipSun35:
	checkevent EVENT_CONTEST_ADMIN_HOLDING_APRICORN_BALLS
	iffalse SkipBalls35
	writetext UnknownText_0x6b97f
	buttonsound
	checkcode VAR_WEEKDAY
	if_equal SUNDAY, RegiveFriend35
	if_equal MONDAY, RegiveMoon35
	if_equal TUESDAY, RegiveLevel35
	if_equal WEDNESDAY, RegiveLure35
	if_equal THURSDAY, RegiveFast35
	if_equal FRIDAY, RegiveLove35
	if_equal SATURDAY, RegiveHeavy35
SkipBalls35:
		;scall UnknownScript_0x6a2de ;daytotext
	writetext UnknownText_0x6a2eb
	yesorno
	iffalse UnknownScript_0x6a2a3
	checkcode VAR_PARTYCOUNT
	if_greater_than $1, UnknownScript_0x6a271
	special HealParty
	special Function13a12
	clearevent EVENT_CONTEST_ADMIN_HOLDING_YOUR_POKEMON
UnknownScript_0x6a234: ; 0x6a234
	setflag ENGINE_BUG_CONTEST_TIMER
	special PlayMapMusic
	writetext UnknownText_0x6a39d
	buttonsound
	writetext UnknownText_0x6a3c7
	playsound SFX_ITEM
	waitsfx
	writetext UnknownText_0x6a3e2
	waitbutton
	closetext
	special Function135db
	scall UnknownScript_0x6a261 ;key differnce, this movement script
	playsound SFX_ENTER_DOOR
	special Function8c084
	waitsfx
	special Function139a8
	warpfacing UP, GROUP_NATIONAL_PARK_BUG_CONTEST, MAP_NATIONAL_PARK_BUG_CONTEST, $a, $2f
	end
; 0x6a261

AmberFailText35:
	writetext BagIsFullText
	jump SkipAmber

SunFailText35:
	writetext BagIsFullText
	jump SkipSun

BallsFailText35:
	writetext BagIsFullText
	jump SkipBalls

RegiveFriend35:
	verbosegiveitem FRIEND_BALL, 8
	iffalse BallsFailText35
	clearevent EVENT_CONTEST_ADMIN_HOLDING_APRICORN_BALLS
	jump SkipBalls

RegiveMoon35:
	verbosegiveitem MOON_BALL, 8
	iffalse BallsFailText35
	clearevent EVENT_CONTEST_ADMIN_HOLDING_APRICORN_BALLS
	jump SkipBalls

RegiveLevel35:
	verbosegiveitem LEVEL_BALL, 8
	iffalse BallsFailText35
	clearevent EVENT_CONTEST_ADMIN_HOLDING_APRICORN_BALLS
	jump SkipBalls

RegiveLure35:
	verbosegiveitem LURE_BALL, 8
	iffalse BallsFailText35
	clearevent EVENT_CONTEST_ADMIN_HOLDING_APRICORN_BALLS
	jump SkipBalls

RegiveFast35:
	verbosegiveitem FAST_BALL, 8
	iffalse BallsFailText35
	clearevent EVENT_CONTEST_ADMIN_HOLDING_APRICORN_BALLS
	jump SkipBalls

RegiveLove35:
	verbosegiveitem LOVE_BALL, 8
	iffalse BallsFailText35
	clearevent EVENT_CONTEST_ADMIN_HOLDING_APRICORN_BALLS
	jump SkipBalls

RegiveHeavy35:
	verbosegiveitem HEAVY_BALL, 8
	iffalse BallsFailText35
	clearevent EVENT_CONTEST_ADMIN_HOLDING_APRICORN_BALLS
	jump SkipBalls

UnknownScript_0x6a261: ; 0x6a261
	checkcode VAR_FACING
	if_equal $2, UnknownScript_0x6a26c
	applymovement $0, MovementData_0x6a2e5
	end
; 0x6a26c

UnknownScript_0x6a26c: ; 0x6a26c
	applymovement $0, MovementData_0x6a2e9
	end
; 0x6a271

UnknownScript_0x6a271: ; 0x6a271
	checkcode VAR_PARTYCOUNT
	if_less_than $6, UnknownScript_0x6a27d
	checkcode VAR_BOXSPACE
	if_equal $0, UnknownScript_0x6a2b5

UnknownScript_0x6a27d: ; 6a27d
	special Function71ac
	if_equal $1, UnknownScript_0x6a2bb
	writetext UnknownText_0x6a4c6
	yesorno
	iffalse UnknownScript_0x6a2a9
	special HealParty
	special Function13a12
	iftrue UnknownScript_0x6a2af
	setevent EVENT_CONTEST_ADMIN_HOLDING_YOUR_POKEMON
	writetext UnknownText_0x6a537
	buttonsound
	writetext UnknownText_0x6a56b
	playsound SFX_GOT_SAFARI_BALLS
	waitsfx
	buttonsound
	jump UnknownScript_0x6a234
; 0x6a2a3

UnknownScript_0x6a2a3: ; 0x6a2a3
	writetext UnknownText_0x6a5dc
	waitbutton
	closetext
	end
; 0x6a2a9

UnknownScript_0x6a2a9: ; 0x6a2a9
	writetext UnknownText_0x6a597
	waitbutton
	closetext
	end
; 0x6a2af

UnknownScript_0x6a2af: ; 0x6a2af
	writetext UnknownText_0x6a608
	waitbutton
	closetext
	end
; 0x6a2b5

UnknownScript_0x6a2b5: ; 0x6a2b5
	writetext UnknownText_0x6a67c
	yesorno
	iftrue UnknownScript_0x6a27d
	writetext RejectWithFullPC
	waitbutton
	closetext
	end
; 0x6a2bb

UnknownScript_0x6a2bb: ; 0x6a2bb
	writetext UnknownText_0x6a71f
	waitbutton
	closetext
	end
; 0x6a2c1

UnknownScript_0x6a2c1: ; 0x6a2c1
	;writetext UnknownText_0x6a84f
	;waitbutton
	;closetext
	end
; 0x6a2c7

UnknownScript_0x6a2c7: ; 0x6a2c7
	jumptextfaceplayer UnknownText_0x6a894
; 0x6a2ca

OfficerScript_0x6a2ca: ; 0x6a2ca
	faceplayer
	loadfont
	;checkflag ENGINE_51
	;iftrue UnknownScript_0x6a2c1
	writetext UnknownText_0x6a894
	waitbutton
	closetext
	end
; 0x6a2d8

YoungsterScript_0x6a2d8: ; 0x6a2d8
	jumptextfaceplayer UnknownText_0x6a8d8
; 0x6a2db

MapRoute36NationalParkgateSignpost0Script: ; 0x6a2db
	jumptext UnknownText_0x6a90e
; 0x6a2de

UnknownScript_0x6a2de: ; 0x6a2de
	jumpstd daytotext
	end
; 0x6a2e2

MovementData_0x6a2e2: ; 0x6a2e2
	step_down
	turn_head_left
	step_end
; 0x6a2e5

MovementData_0x6a2e5: ; 0x6a2e5
	step_right
	step_up
	step_up
	step_end
; 0x6a2e9

MovementData_0x6a2e9: ; 0x6a2e9
	step_up
	step_end
; 0x6a2eb

BagIsFullText:
	text "Uh-oh<...> Your PACK"
	line "is full."

	para "We'll hold on to"
	line "your prize"

	para "Please make room,"
	line "then come see me."
	done

UnknownText_0x6a2eb: ; 0x6a2eb
	;text "Today's @"
	;text_from_ram StringBuffer3
	;text "."
	;line "That means the"

	text "The Bug-Catching"
	line "Contest is on"
	cont "today."

	para "The rules are sim-"
	line "ple."

	para "Using one of your"
	line "#MON, catch a"

	para "bug #MON to be"
	line "judged."

	para "Would you like to"
	line "give it a try?"
	done
; 0x6a39d

UnknownText_0x6a39d: ; 0x6a39d
	text "Here are the PARK"
	line "BALLS for the"
	cont "Contest."
	done
; 0x6a3c7

UnknownText_0x6a3c7: ; 0x6a3c7
	text "<PLAYER> received"
	line "20 PARK BALLS."
	done
; 0x6a3e2

UnknownText_0x6a3e2: ; 0x6a3e2
	text "The person who"
	line "gets the strong-"
	cont "est bug #MON"
	cont "is the winner."

	para "You have 20"
	line "minutes."

	para "If you run out of"
	line "PARK BALLS, you're"
	cont "done."

	para "You can keep the"
	line "last #MON you"
	cont "catch as your own."

	para "Go out and catch"
	line "the strongest bug"

	para "#MON you can"
	line "find!"
	done
; 0x6a4c6

UnknownText_0x6a4c6: ; 0x6a4c6
	text "Uh-oh<...>"

	para "You have more than"
	line "one #MON."

	para "You'll have to use"
	line "@"
	text_from_ram StringBuffer3
	text ", the"

	para "first #MON in"
	line "your party."

	para "Is that OK with"
	line "you?"
	done
; 0x6a537

UnknownText_0x6a537: ; 0x6a537
	text "Fine, we'll hold"
	line "your other #MON"
	cont "while you compete."
	done
; 0x6a56b

UnknownText_0x6a56b: ; 0x6a56b
	text "<PLAYER>'s #MON"
	line "were left with the"
	cont "CONTEST HELPER."
	done
; 0x6a597

UnknownText_0x6a597: ; 0x6a597
	text "Please choose the"
	line "#MON to be used"

	para "in the Contest,"
	line "then come see me."
	done
; 0x6a5dc

UnknownText_0x6a5dc: ; 0x6a5dc
	text "OK. We hope you'll"
	line "take part in the"
	cont "future."
	done
; 0x6a608

UnknownText_0x6a608: ; 0x6a608
	text "Uh-oh<...>"
	line "The first #MON"

	para "in your party"
	line "can't battle."

	para "Please switch it"
	line "with the #MON"

	para "you want to use,"
	line "then come see me."
	done
; 0x6a67c

UnknownText_0x6a67c: ; 0x6a67c
	text "Uh-oh<...>"
	line "Both your party"

	para "and your PC BOX"
	line "are full."

	para "You have no room"
	line "to put the bug"
	cont "#MON you catch."

	para "We will have to"
	line "release whatever"
	cont "you catch."

	para "Is that OK?"
	done

RejectWithFullPC:
	text "Please make room"
	line "in your party or"

	para "your PC BOX, then"
	line "come see me."
	done
; 0x6a71f

UnknownText_0x6a71f: ; 0x6a71f
	text "Uh-oh<...>"
	line "You have an EGG as"

	para "the first #MON"
	line "in your party."

	para "Please switch it"
	line "with the #MON"

	para "you want to use,"
	line "then come see me."
	done
; 0x6a79a

UnknownText_0x6a79a: ; 0x6a79a
	text "You still have @"
	text_from_ram StringBuffer3
	db $0
	line "minute(s) left."

	para "Do you want to"
	line "finish now?"
	done
; 0x6a7db

UnknownText_0x6a7db: ; 0x6a7db
	text "OK. Please wait at"
	line "the North Gate for"

	para "the announcement"
	line "of the winners."
	done
; 0x6a823

UnknownText_0x6a823: ; 0x6a823
	text "OK. Please get"
	line "back outside and"
	cont "finish up."
	done
; 0x6a84f

UnknownText_0x6a84f: ; 0x6a84f
	;text "Today's Contest is"
	;line "over. We hope you"

	;para "will participate"
	;line "in the future."
	;done
; 0x6a894

UnknownText_0x6a894: ; 0x6a894
	text "We hold Contests"
	line "regularly in the"

	para "PARK. You should"
	line "give it a shot."
	done
; 0x6a8d8

UnknownText_0x6a8d8: ; 0x6a8d8
	text "When is the next"
	line "Bug-Catching Con-"
	cont "test going to be?"
	done
; 0x6a90e

UnknownText_0x6a90e: ; 0x6a90e
	text "The Bug-Catching"
	line "Contest is held"
	cont "here every day."

	;para "Tuesday, Thursday"
	;line "and Saturday."

	para "Not only do you"
	line "earn a prize just"

	para "for participating,"
	line "you also get to"

	para "keep the bug"
	line "#MON you may"

	para "have at the end of"
	line "the contest."
	done
; 0x6a9d2

Route35NationalParkgate_MapEventHeader: ; 0x6a9d2
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $0, $3, 3, GROUP_NATIONAL_PARK, MAP_NATIONAL_PARK
	warp_def $0, $4, 4, GROUP_NATIONAL_PARK, MAP_NATIONAL_PARK
	warp_def $7, $3, 3, GROUP_ROUTE_35, MAP_ROUTE_35
	warp_def $7, $4, 3, GROUP_ROUTE_35, MAP_ROUTE_35

	; xy triggers
	db 0

	; signposts
	db 1
	signpost 0, 5, $0, MapRoute36NationalParkgateSignpost0Script

	; people-events
	db 3
	person_event SPRITE_OFFICER, 5, 6, $6, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 0, 0, OfficerScript_0x6a204, EVENT_NATIONALPARK_ROUTE35_GATE_OFFICER
	person_event SPRITE_YOUNGSTER, 9, 10, $2, 1, 1, -1, -1, 8 + PAL_OW_RED, 0, 0, YoungsterScript_0x6a2d8, EVENT_ROUTE35_NATIONALPARK_GATE_YOUNGSTER
	person_event SPRITE_OFFICER, 7, 4, $9, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 0, 0, OfficerScript_0x6a204, EVENT_NATIONALPARK_ROUTE35_GATE_OFFICER_2
; 0x6aa18
