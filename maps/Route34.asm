Route34_MapScriptHeader: ; 0x78000
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks

	dbw 2, .DaycareChecks
; 0x78005

.DaycareChecks: ; 0x78005
	checkflag ENGINE_DAYCARE_MONS_ARE_COMPATIBLE
	iftrue .NoEgg
	clearevent EVENT_DAYCARE_MAN_INSIDE
	setevent EVENT_DAYCARE_MAN_OUTSIDE
	jump .CheckDayCareMon1
.NoEgg: ; 0x78014
	setevent EVENT_DAYCARE_MAN_INSIDE
	clearevent EVENT_DAYCARE_MAN_OUTSIDE
.CheckDayCareMon1: ; 0x7801d
	checkflag ENGINE_DAYCARE_MAN_HAS_MON
	iffalse .NoDayCareMon1
	clearevent EVENT_DAYCARE_MON_1
	jump .CheckDayCareMon2
.NoDayCareMon1: ; 0x78029
	setevent EVENT_DAYCARE_MON_1
.CheckDayCareMon2: ; 0x7802f
	checkflag ENGINE_DAYCARE_LADY_HAS_MON
	iffalse .NoDayCareMon2
	clearevent EVENT_DAYCARE_MON_2
	jump .CheckRandomEgg
.NoDayCareMon2: ; 0x78039
	setevent EVENT_DAYCARE_MON_2
.CheckRandomEgg:
	checkflag ENGINE_DAILY_EGG
	iftrue .NoRandomEgg
	clearevent EVENT_RANDOM_EGG
	return
.NoRandomEgg:
	setevent EVENT_RANDOM_EGG
	return
; 0x7803d

GrampsScript_0x7803d: ; 0x7803d
	faceplayer
	loadfont
	special Function16936
	waitbutton
	closetext
	if_equal $1, UnknownScript_0x7805a
	clearflag ENGINE_DAYCARE_MONS_ARE_COMPATIBLE
	checkcode VAR_FACING
	if_equal $3, UnknownScript_0x7805b
	applymovement $8, MovementData_0x78333
	playsound SFX_ENTER_DOOR
	disappear $8
UnknownScript_0x7805a: ; 0x7805a
	end
; 0x7805b

UnknownScript_0x7805b: ; 0x7805b
	applymovement $8, MovementData_0x78337
	playsound SFX_ENTER_DOOR
	disappear $8
	end
; 0x78065

DaycareMon1Script_0x78065: ; 0x78065
	loadfont
	special Function17421
	closetext
	end
; 0x7806b

DaycareMon2Script_0x7806b: ; 0x7806b
	loadfont
	special Function17440
	closetext
	end
; 0x78071

TrainerCamperTodd1: ; 0x78071
	; bit/flag number
	dw $41b

	; trainer group && trainer id
	db CAMPER, TODD1

	; text when seen
	dw CamperTodd1SeenText

	; text when trainer beaten
	dw CamperTodd1BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw CamperTodd1Script
; 0x7807d

CamperTodd1Script: ; 0x7807d
	writecode VAR_CALLERID, $14
	talkaftercancel
	loadfont
	checkflag ENGINE_TODD
	iftrue UnknownScript_0x780bd
	checkflag ENGINE_GOLDENROD_DEPT_STORE_SALE_IS_ON
	iftrue UnknownScript_0x78131
	checkcellnum $14
	iftrue UnknownScript_0x78143
	checkevent EVENT_ROUTE_34_27D
	iftrue UnknownScript_0x780a6
	writetext UnknownText_0x784f0
	buttonsound
	setevent EVENT_ROUTE_34_27D
	scall UnknownScript_0x78137
	jump UnknownScript_0x780a9
; 0x780a6

UnknownScript_0x780a6: ; 0x780a6
	scall UnknownScript_0x7813b
UnknownScript_0x780a9: ; 0x780a9
	askforphonenumber $14
	if_equal $1, UnknownScript_0x7814b
	if_equal $2, UnknownScript_0x78147
	trainertotext CAMPER, TODD1, $0
	scall UnknownScript_0x7813f
	jump UnknownScript_0x78143
; 0x780bd

UnknownScript_0x780bd: ; 0x780bd
	scall UnknownScript_0x7814f
	winlosstext CamperTodd1BeatenText, $0000
	copybytetovar wd9fe
	if_equal $4, UnknownScript_0x780dc
	if_equal $3, UnknownScript_0x780e2
	if_equal $2, UnknownScript_0x780e8
	if_equal $1, UnknownScript_0x780ee
	if_equal $0, UnknownScript_0x780f4
UnknownScript_0x780dc: ; 0x780dc
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue UnknownScript_0x78128
UnknownScript_0x780e2: ; 0x780e2
	checkevent EVENT_FIRST_TIME_HALL_OF_FAME
	iftrue UnknownScript_0x7811b
UnknownScript_0x780e8: ; 0x780e8
	checkflag ENGINE_FLYPOINT_BLACKTHORN
	iftrue UnknownScript_0x7810e
UnknownScript_0x780ee: ; 0x780ee
	checkflag ENGINE_FLYPOINT_CIANWOOD
	iftrue UnknownScript_0x78101
UnknownScript_0x780f4: ; 0x780f4
	loadtrainer CAMPER, TODD1
	startbattle
	returnafterbattle
	loadvar wd9fe, $1
	clearflag ENGINE_TODD
	end
; 0x78101

UnknownScript_0x78101: ; 0x78101
	loadtrainer CAMPER, TODD2
	startbattle
	returnafterbattle
	loadvar wd9fe, $2
	clearflag ENGINE_TODD
	end
; 0x7810e

UnknownScript_0x7810e: ; 0x7810e
	loadtrainer CAMPER, TODD3
	startbattle
	returnafterbattle
	loadvar wd9fe, $3
	clearflag ENGINE_TODD
	end
; 0x7811b

UnknownScript_0x7811b: ; 0x7811b
	loadtrainer CAMPER, TODD4
	startbattle
	returnafterbattle
	loadvar wd9fe, $4
	clearflag ENGINE_TODD
	end
; 0x78128

UnknownScript_0x78128: ; 0x78128
	loadtrainer CAMPER, TODD5
	startbattle
	returnafterbattle
	clearflag ENGINE_TODD
	end
; 0x78131

UnknownScript_0x78131: ; 0x78131
	writetext UnknownText_0x78532
	waitbutton
	closetext
	end
; 0x78137

UnknownScript_0x78137: ; 0x78137
	jumpstd asknumber1m
	end
; 0x7813b

UnknownScript_0x7813b: ; 0x7813b
	jumpstd asknumber2m
	end
; 0x7813f

UnknownScript_0x7813f: ; 0x7813f
	jumpstd registerednumberm
	end
; 0x78143

UnknownScript_0x78143: ; 0x78143
	jumpstd numberacceptedm
	end
; 0x78147

UnknownScript_0x78147: ; 0x78147
	jumpstd numberdeclinedm
	end
; 0x7814b

UnknownScript_0x7814b: ; 0x7814b
	jumpstd phonefullm
	end
; 0x7814f

UnknownScript_0x7814f: ; 0x7814f
	jumpstd rematchm
	end
; 0x78153

TrainerPicnickerGina1: ; 0x78153
	; bit/flag number
	dw $47f

	; trainer group && trainer id
	db PICNICKER, GINA1

	; text when seen
	dw PicnickerGina1SeenText

	; text when trainer beaten
	dw PicnickerGina1BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw PicnickerGina1Script
; 0x7815f

PicnickerGina1Script: ; 0x7815f
	writecode VAR_CALLERID, $15
	talkaftercancel
	loadfont
	checkflag ENGINE_GINA
	iftrue UnknownScript_0x7819f
	checkflag ENGINE_GINA_HAS_LEAF_STONE
	iftrue UnknownScript_0x78213
	checkcellnum $15
	iftrue UnknownScript_0x78234
	checkevent EVENT_ROUTE_34_27F
	iftrue UnknownScript_0x78188
	writetext UnknownText_0x785b8
	buttonsound
	setevent EVENT_ROUTE_34_27F
	scall UnknownScript_0x78228
	jump UnknownScript_0x7818b
; 0x78188

UnknownScript_0x78188: ; 0x78188
	scall UnknownScript_0x7822c
UnknownScript_0x7818b: ; 0x7818b
	askforphonenumber $15
	if_equal $1, UnknownScript_0x7823c
	if_equal $2, UnknownScript_0x78238
	trainertotext PICNICKER, GINA1, $0
	scall UnknownScript_0x78230
	jump UnknownScript_0x78234
; 0x7819f

UnknownScript_0x7819f: ; 0x7819f
	scall UnknownScript_0x78240
	winlosstext PicnickerGina1BeatenText, $0000
	copybytetovar wd9ff
	if_equal $4, UnknownScript_0x781be
	if_equal $3, UnknownScript_0x781c4
	if_equal $2, UnknownScript_0x781ca
	if_equal $1, UnknownScript_0x781d0
	if_equal $0, UnknownScript_0x781d6
UnknownScript_0x781be: ; 0x781be
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue UnknownScript_0x7820a
UnknownScript_0x781c4: ; 0x781c4
	checkevent EVENT_FIRST_TIME_HALL_OF_FAME
	iftrue UnknownScript_0x781fd
UnknownScript_0x781ca: ; 0x781ca
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue UnknownScript_0x781f0
UnknownScript_0x781d0: ; 0x781d0
	checkflag ENGINE_FLYPOINT_MAHOGANY
	iftrue UnknownScript_0x781e3
UnknownScript_0x781d6: ; 0x781d6
	loadtrainer PICNICKER, GINA1
	startbattle
	returnafterbattle
	loadvar wd9ff, $1
	clearflag ENGINE_GINA
	end
; 0x781e3

UnknownScript_0x781e3: ; 0x781e3
	loadtrainer PICNICKER, GINA2
	startbattle
	returnafterbattle
	loadvar wd9ff, $2
	clearflag ENGINE_GINA
	end
; 0x781f0

UnknownScript_0x781f0: ; 0x781f0
	loadtrainer PICNICKER, GINA3
	startbattle
	returnafterbattle
	loadvar wd9ff, $3
	clearflag ENGINE_GINA
	end
; 0x781fd

UnknownScript_0x781fd: ; 0x781fd
	loadtrainer PICNICKER, GINA4
	startbattle
	returnafterbattle
	loadvar wd9ff, $4
	clearflag ENGINE_GINA
	end
; 0x7820a

UnknownScript_0x7820a: ; 0x7820a
	loadtrainer PICNICKER, GINA5
	startbattle
	returnafterbattle
	clearflag ENGINE_GINA
	end
; 0x78213

UnknownScript_0x78213: ; 0x78213
	scall UnknownScript_0x78244
	verbosegiveitem LEAF_STONE, 1
	iffalse UnknownScript_0x78225
	clearflag ENGINE_GINA_HAS_LEAF_STONE
	setevent EVENT_ROUTE_34_PHONE
	jump UnknownScript_0x78234
; 0x78225

UnknownScript_0x78225: ; 0x78225
	jump UnknownScript_0x78248
; 0x78228

UnknownScript_0x78228: ; 0x78228
	jumpstd asknumber1f
	end
; 0x7822c

UnknownScript_0x7822c: ; 0x7822c
	jumpstd asknumber2f
	end
; 0x78230

UnknownScript_0x78230: ; 0x78230
	jumpstd registerednumberf
	end
; 0x78234

UnknownScript_0x78234: ; 0x78234
	jumpstd numberacceptedf
	end
; 0x78238

UnknownScript_0x78238: ; 0x78238
	jumpstd numberdeclinedf
	end
; 0x7823c

UnknownScript_0x7823c: ; 0x7823c
	jumpstd phonefullf
	end
; 0x78240

UnknownScript_0x78240: ; 0x78240
	jumpstd rematchf
	end
; 0x78244

UnknownScript_0x78244: ; 0x78244
	jumpstd giftf
	end
; 0x78248

UnknownScript_0x78248: ; 0x78248
	jumpstd packfullf
	end
; 0x7824c

OfficerScript_0x7824c: ; 0x7824c
	faceplayer
	loadfont
	checktime $4
	iffalse UnknownScript_0x78276
	checkevent EVENT_BEAT_OFFICER_ON_ROUTE_34
	iftrue UnknownScript_0x78270
	special SaveMusic
	playmusic MUSIC_OFFICER_ENCOUNTER
	writetext UnknownText_0x785e4
	waitbutton
	closetext
	winlosstext UnknownText_0x78609, $0000
	loadtrainer OFFICER, KEITH
	startbattle
	returnafterbattle
	setevent EVENT_BEAT_OFFICER_ON_ROUTE_34
	closetext
	end
; 0x78270

UnknownScript_0x78270: ; 0x78270
	writetext UnknownText_0x78624
	waitbutton
	closetext
	end
; 0x78276

UnknownScript_0x78276: ; 0x78276
	writetext UnknownText_0x7866a
	waitbutton
	closetext
	end
; 0x7827c

TrainerYoungsterSamuel: ; 0x7827c
	; bit/flag number
	dw $5ad

	; trainer group && trainer id
	db YOUNGSTER, SAMUEL

	; text when seen
	dw YoungsterSamuelSeenText

	; text when trainer beaten
	dw YoungsterSamuelBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw YoungsterSamuelScript
; 0x78288

YoungsterSamuelScript: ; 0x78288
	talkaftercancel
	loadfont
	writetext UnknownText_0x783d8
	waitbutton
	closetext
	end
; 0x78290

TrainerYoungsterIan: ; 0x78290
	; bit/flag number
	dw $5ae

	; trainer group && trainer id
	db YOUNGSTER, IAN

	; text when seen
	dw YoungsterIanSeenText

	; text when trainer beaten
	dw YoungsterIanBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw YoungsterIanScript
; 0x7829c

YoungsterIanScript: ; 0x7829c
	talkaftercancel
	loadfont
	writetext UnknownText_0x78469
	waitbutton
	closetext
	end
; 0x782a4

TrainerPokefanmBrandon: ; 0x782a4
	; bit/flag number
	dw $4d3

	; trainer group && trainer id
	db POKEFANM, BRANDON

	; text when seen
	dw PokefanmBrandonSeenText

	; text when trainer beaten
	dw PokefanmBrandonBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw PokefanmBrandonScript
; 0x782b0

PokefanmBrandonScript: ; 0x782b0
	talkaftercancel
	loadfont
	writetext UnknownText_0x786fc
	waitbutton
	closetext
	end
; 0x782b8

TrainerCooltrainerfIrene: ; 0x782b8
	; bit/flag number
	dw $560

	; trainer group && trainer id
	db COOLTRAINERF, IRENE

	; text when seen
	dw CooltrainerfIreneSeenText

	; text when trainer beaten
	dw CooltrainerfIreneBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw CooltrainerfIreneScript
; 0x782c4

CooltrainerfIreneScript: ; 0x782c4
	talkaftercancel
	loadfont
	checkevent EVENT_GOT_SOFT_SAND_FROM_KATE
	iftrue UnknownScript_0x782d2
	writetext UnknownText_0x7877f
	waitbutton
	closetext
	end
; 0x782d2

TeachMoveIce:
	writebyte 4
	jump TeachMove

TeachMoveFire:
	writebyte 6
	jump TeachMove

TeachMoveThunder:
	writebyte 5

TeachMove:
	writetext WhoToTeachText
	waitbutton
	special Function4925b
	iffalse AfterTutor
	writetext TutorQuitText
	waitbutton
	closetext
	end

AfterTutor:
	writetext TutorTakeMoneyText
	buttonsound
	takemoney 0, 5000
	writetext LightPocketsText
	waitbutton
	closetext
	end

WhoToTeachText:
	text "Who should I"
	line "teach?"
	done

WeirdTutorText:
	text ""
	done

TutorQuitText:
	text "Well if you change"
	line "your mind<...>"
	done

TutorPoorText:
	text "You don't have"
	line "enough money!"
	done

TutorTakeMoneyText:
	text "Great, they learn"
	line "fast!"

	para "Now to hold up"
	line "your end<...>"
	done

LightPocketsText:
	text "Your pockets are"
	line "suddenly lighter<...>"
	done

UnknownScript_0x782d2: ; 0x782d2
	writetext UnknownText_0x787ad
	yesorno
	iffalse TutorQuit
	checkmoney 0, 5000
	if_equal 2, TutorPoor
	jump TeachMoveFire

TutorQuit:
	writetext TutorQuitText
	waitbutton
	closetext
	end
; 0x782d8
TutorPoor:
	writetext TutorPoorText
	waitbutton
	closetext
	end

TrainerCooltrainerfJenn: ; 0x782d8
	; bit/flag number
	dw $56b

	; trainer group && trainer id
	db COOLTRAINERF, JENN

	; text when seen
	dw CooltrainerfJennSeenText

	; text when trainer beaten
	dw CooltrainerfJennBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw CooltrainerfJennScript
; 0x782e4

CooltrainerfJennScript: ; 0x782e4
	talkaftercancel
	loadfont
	checkevent EVENT_GOT_SOFT_SAND_FROM_KATE
	iftrue UnknownScript_0x782f2
	writetext UnknownText_0x78836
	waitbutton
	closetext
	end
; 0x782f2

UnknownScript_0x782f2: ; 0x782f2
	writetext UnknownText_0x78866
	yesorno
	iffalse TutorQuit
	checkmoney 0, 5000
	if_equal 2, TutorPoor
	jump TeachMoveThunder
; 0x782f8



TrainerCooltrainerfKate: ; 0x782f8
	; bit/flag number
	dw $55f

	; trainer group && trainer id
	db COOLTRAINERF, KATE

	; text when seen
	dw CooltrainerfKateSeenText

	; text when trainer beaten
	dw CooltrainerfKateBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw CooltrainerfKateScript
; 0x78304

CooltrainerfKateScript: ; 0x78304
	talkaftercancel
	loadfont
	checkevent EVENT_GOT_SOFT_SAND_FROM_KATE
	iftrue UnknownScript_0x78319
	writetext UnknownText_0x788e2
	setevent EVENT_GOT_SOFT_SAND_FROM_KATE
	waitbutton
	closetext
	end

UnknownScript_0x78319: ; 0x78319
	writetext UnknownText_0x7892b
	yesorno
	iffalse TutorQuit
	checkmoney 0, 5000
	if_equal 2, TutorPoor
	jump TeachMoveIce
; 0x7831f

UnknownScript_0x7831f: ; 0x7831f
	jumptext UnknownText_0x7898a
; 0x78322

MapRoute34Signpost0Script: ; 0x78322
	jumptext UnknownText_0x789a8
; 0x78325

MapRoute34Signpost1Script: ; 0x78325
	jumptext UnknownText_0x789ed
; 0x78328

MapRoute34Signpost2Script: ; 0x78328
	jumptext UnknownText_0x78a52
; 0x7832b

ItemFragment_0x7832b: ; 0x7832b
	db NUGGET, 1
; 0x7832d

MapRoute34SignpostItem3: ; 0x7832d
	dw $00a7
	db RARE_CANDY

; 0x78330

MapRoute34SignpostItem4: ; 0x78330
	dw $00a8
	db LUCKY_PUNCH

RandomEggScript:
	checkevent EVENT_BULBASAUR_EGG
	iffalse RandomEggScriptMain
	checkevent EVENT_CHARMANDER_EGG
	iffalse RandomEggScriptMain
	checkevent EVENT_SQUIRTLE_EGG
	iffalse RandomEggScriptMain
	checkevent EVENT_CHIKORITA_EGG
	iffalse RandomEggScriptMain
	checkevent EVENT_CYNDAQUIL_EGG
	iffalse RandomEggScriptMain
	checkevent EVENT_TOTODILE_EGG
	iffalse RandomEggScriptMain
	clearevent EVENT_BULBASAUR_EGG
	clearevent EVENT_CHARMANDER_EGG
	clearevent EVENT_SQUIRTLE_EGG
	clearevent EVENT_CHIKORITA_EGG
	clearevent EVENT_CYNDAQUIL_EGG
	clearevent EVENT_TOTODILE_EGG
RandomEggScriptMain:
	loadfont
	writetext EggApproach_Text
	yesorno
	iffalse RandomEggScriptNo
	checkcode VAR_PARTYCOUNT
	if_equal $6, RandomEggFreeSpace
RandomEggRandomizer:
	random $6
	if_equal $0, GiveBulbasaurEgg
	if_equal $1, GiveCharmanderEgg
	if_equal $2, GiveSquirtleEgg
	if_equal $3, GiveChikoritaEgg
	if_equal $4, GiveCyndaquilEgg
	jump GiveTotodileEgg

GiveBulbasaurEgg:
	checkevent EVENT_BULBASAUR_EGG
	iftrue RandomEggRandomizer
	setevent EVENT_BULBASAUR_EGG
	giveegg BULBASAUR, 1
	jump GotEgg

GiveCharmanderEgg:
	checkevent EVENT_CHARMANDER_EGG
	iftrue RandomEggRandomizer
	setevent EVENT_CHARMANDER_EGG
	giveegg CHARMANDER, 1
	jump GotEgg

GiveSquirtleEgg:
	checkevent EVENT_SQUIRTLE_EGG
	iftrue RandomEggRandomizer
	setevent EVENT_SQUIRTLE_EGG
	giveegg SQUIRTLE, 1
	jump GotEgg

GiveChikoritaEgg:
	checkevent EVENT_CHIKORITA_EGG
	iftrue RandomEggRandomizer
	setevent EVENT_CHIKORITA_EGG
	giveegg CHIKORITA, 1
	jump GotEgg

GiveCyndaquilEgg:
	checkevent EVENT_CYNDAQUIL_EGG
	iftrue RandomEggRandomizer
	setevent EVENT_CYNDAQUIL_EGG
	giveegg CYNDAQUIL, 1
	jump GotEgg

GiveTotodileEgg:
	checkevent EVENT_TOTODILE_EGG
	iftrue RandomEggRandomizer
	setevent EVENT_TOTODILE_EGG
	giveegg TOTODILE, 1
GotEgg:
	disappear $f
	writetext FoundEgg_Text
	playsound SFX_KEY_ITEM
	waitsfx
	setflag ENGINE_DAILY_EGG
RandomEggScriptNo:
	closetext
	end

RandomEggFreeSpace:
	writetext FreeSpace_Text
	waitbutton
	closetext
	end

; 0x78333

MovementData_0x78333: ; 0x78333
	slow_step_left
	slow_step_left
	slow_step_up
	step_end
; 0x78337

MovementData_0x78337: ; 0x78337
	slow_step_down
	slow_step_left
	slow_step_left
	slow_step_up
	slow_step_up
	step_end
; 0x7833d

YoungsterSamuelSeenText: ; 0x7833d
	text "I went to"
	line "KANTO once!"

	para "My strategy is to"
	line "combine #MON"
	cont "from both regions!"
	done
; 0x7835e

YoungsterSamuelBeatenText: ; 0x7835e
	text "It wasn't"
	line "enough<...>"
	done
; 0x7837d

UnknownText_0x7837d: ; 0x7837d
	text "Have you been to"
	line "GOLDENROD CITY?"

	para "Weren't you amazed"
	line "by how they've"

	para "changed the"
	line "#MON CENTER?"
	done
; 0x783d8

UnknownText_0x783d8: ; 0x783d8
	text "I'm going to train"
	line "even harder."

	para "After all, I'm"
	line "trying to become"
	cont "a GYM LEADER."
	done
; 0x78425

YoungsterIanSeenText: ; 0x78425
	text "I'm the best in my"
	line "class at #MON."

	para "I make use of"
	line "stat-enhancing"
	cont "items."

	para "They make my"
	line "#MON even more"
	cont "powerful!"
	done
; 0x78447

YoungsterIanBeatenText: ; 0x78447
	text "I guess I have"
	line "things to learn"
	cont "still<...>"
	done
; 0x78469

UnknownText_0x78469: ; 0x78469
	text "LUCKY PUNCH<...>"

	para "METAL POWDER<...>"

	para "They make CHANSEY"
	line "and DITTO even"
	cont "more powerful."
	done
; 0x7849b

CamperTodd1SeenText: ; 0x7849b
	text "I'm confident in"
	line "my ability to"
	cont "raise #MON."

	para "Want to see?"
	done
; 0x784d3

CamperTodd1BeatenText: ; 0x784d3
	text "Did I screw up my"
	line "training?"
	done
; 0x784f0

UnknownText_0x784f0: ; 0x784f0
	text "Maybe I should"
	line "take one to a DAY-"

	para "CARE. Or maybe use"
	line "some items<...>"
	done
; 0x78532

UnknownText_0x78532: ; 0x78532
	text "Shopping under the"
	line "sky!"

	para "It feels so nice"
	line "up on a rooftop."
	done
; 0x7856d

PicnickerGina1SeenText: ; 0x7856d
	text "Are you a trainer?"

	para "Let's have a"
	line "practice battle."
	done
; 0x7859e

PicnickerGina1BeatenText: ; 0x7859e
	text "Oh, no! I just"
	line "can't win<...>"
	done
; 0x785b8

UnknownText_0x785b8: ; 0x785b8
	text "Maybe it is time"
	line "for my CHIKORITA"
	cont "to evolve<...>"

	para "It is so cute"
	line "so I have been"
	cont "putting it off<...>"
	done
; 0x785e4

UnknownText_0x785e4: ; 0x785e4
	text "Who goes there?"
	line "What are you up"
	cont "to?"
	done
; 0x78609

UnknownText_0x78609: ; 0x78609
	text "You're a tough"
	line "little kid."
	done
; 0x78624

UnknownText_0x78624: ; 0x78624
	text "Yep, I see nothing"
	line "wrong today. You"

	para "be good and stay"
	line "out of trouble."
	done
; 0x7866a

UnknownText_0x7866a: ; 0x7866a
	text "I'm on patrol for"
	line "suspicious indi-"
	cont "viduals."
	done
; 0x78696

PokefanmBrandonSeenText: ; 0x78696
	text "I'm helping my"
	line "son with his"
	cont "#MON battles."

	para "These aren't"
	line "my own #MON,"
	cont "honestly!"
	done
; 0x786e1

PokefanmBrandonBeatenText: ; 0x786e1
	text "DAD: I'll bring"
	line "my own #MON"
	cont "next time<...>"

	para "SON: But these"
	line "aren't my #MON,"
	cont "DAD<...>"

	para "DAD: <...>"
	done
; 0x786fc

UnknownText_0x786fc: ; 0x786fc
	text "<...>"

	para "<...><...>"

	para "I happen to like"
	line "cute baby #MON!"

	para "It's nothing to"
	line "be ashamed about!"
	done
; 0x78743

CooltrainerfIreneSeenText: ; 0x78743
	text "IRENE: Kyaaah!"
	line "Someone found us!"
	done
; 0x78765

CooltrainerfIreneBeatenText: ; 0x78765
	text "IRENE: Ohhh!"
	line "Too hot!"
	done
; 0x7877f

UnknownText_0x7877f: ; 0x7877f
	text "IRENE: My sister"
	line "KATE will get you"
	cont "for this!"
	done
; 0x787ad

UnknownText_0x787ad: ; 0x787ad
	text "IRENE: I'm so hot"
	line "it's like my fists"
	cont "are on fire."

	para "For ¥5000 I can"
	line "teach you my"
	cont "secret?"
	done
; 0x787eb

CooltrainerfJennSeenText: ; 0x787eb
	text "JENN: You can't"
	line "beat IRENE and go"
	cont "unpunished!"
	done
; 0x78819

CooltrainerfJennBeatenText: ; 0x78819
	text "JENN: So sorry,"
	line "IRENE! Sis!"
	done
; 0x78836

UnknownText_0x78836: ; 0x78836
	text "JENN: Don't get"
	line "cocky! My sister"
	cont "KATE is tough!"
	done
; 0x78866

UnknownText_0x78866: ; 0x78866
	text "JENN: Strike hard!"

	para "Fast!"

	para "Like lightning!"

	para "For ¥5000 your"
	line "#MON can too."
	cont "Well?"
	done
; 0x78890

CooltrainerfKateSeenText: ; 0x78890
	text "KATE: You sure"
	line "were mean to my"
	cont "little sisters!"
	done
; 0x788c0

CooltrainerfKateBeatenText: ; 0x788c0
	text "KATE: No! I can't"
	line "believe we lost."
	done
; 0x788e2

UnknownText_0x788e2: ; 0x788e2
	text "KATE: Oh, you're"
	line "just a #MON"
	cont "trainer?"

	para "I thought you were"
	line "a spy<...>"

	para "We're training"
	line "elemental martial"
	cont "arts in secret,"
	cont "but so far we only"
	cont "taught our"
	cont "#MON<...>"

	para "Say<...>"

	para "If you bring us"
	line "some snack money"
	cont "we can teach your"
	cont "#MON too."
	done
; 0x7892b

UnknownText_0x7892b: ; 0x7892b
	text "KATE: I'm so cool"
	line "it's like my hands"
	cont "are ice."

	para "¥5000 and I can"
	line "give your mon my"
	cont "freezng touch."
	done
; 0x7898a

UnknownText_0x7898a: ; 0x7898a
	text "ILEX FOREST"
	line "THROUGH THE GATE"
	done
; 0x789a8

UnknownText_0x789a8: ; 0x789a8
	text "ROUTE 34"

	para "GOLDENROD CITY -"
	line "AZALEA TOWN"

	para "ILEX FOREST"
	line "SOMEWHERE BETWEEN"
	done
; 0x789ed

UnknownText_0x789ed: ; 0x789ed
	text "TRAINER TIPS"

	para "BERRY trees grow"
	line "new BERRIES"
	cont "every day."

	para "Make a note of"
	line "which trees bear"
	cont "which BERRIES."
	done
; 0x78a52

UnknownText_0x78a52: ; 0x78a52
	text "DAY-CARE"

	para "LET US RAISE YOUR"
	line "#MON FOR YOU!"
	done
; 0x78a7c

EggApproach_Text: ; 0x78a52
	text "What a unique"
	line "looking EGG!"

	para "Want to take it?"
	done

FreeSpace_Text: ; 0x78a52
	text "You've no room for"
	line "this."
	done

FoundEgg_Text: ; 0x631ae
	text "<PLAYER> found"
	line "an EGG!"
	done

Route34_MapEventHeader: ; 0x78a7c
	; filler
	db 0, 0

	; warps
	db 5
	warp_def $25, $d, 1, GROUP_ROUTE_34_ILEX_FOREST_GATE, MAP_ROUTE_34_ILEX_FOREST_GATE
	warp_def $25, $e, 2, GROUP_ROUTE_34_ILEX_FOREST_GATE, MAP_ROUTE_34_ILEX_FOREST_GATE
	warp_def $e, $b, 1, GROUP_DAY_CARE, MAP_DAY_CARE
	warp_def $f, $b, 2, GROUP_DAY_CARE, MAP_DAY_CARE
	warp_def $f, $d, 3, GROUP_DAY_CARE, MAP_DAY_CARE

	; xy triggers
	db 0

	; signposts
	db 5
	signpost 6, 12, $0, MapRoute34Signpost0Script
	signpost 33, 13, $0, MapRoute34Signpost1Script
	signpost 13, 10, $0, MapRoute34Signpost2Script
	signpost 32, 8, $7, MapRoute34SignpostItem3
	signpost 19, 17, $7, MapRoute34SignpostItem4

	; people-events
	db 14
	person_event SPRITE_YOUNGSTER, 11, 17, $8, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 2, 5, TrainerCamperTodd1, -1
	person_event SPRITE_YOUNGSTER, 36, 19, $6, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 2, 3, TrainerYoungsterSamuel, -1
	person_event SPRITE_YOUNGSTER, 24, 15, $6, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 2, 3, TrainerYoungsterIan, -1
	person_event SPRITE_LASS, 30, 14, $9, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 2, 3, TrainerPicnickerGina1, -1
	person_event SPRITE_OFFICER, 15, 13, $6, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, OfficerScript_0x7824c, -1
	person_event SPRITE_POKEFAN_M, 32, 22, $1e, 0, 0, -1, -1, 8 + PAL_OW_RED, 2, 3, TrainerPokefanmBrandon, -1
	person_event SPRITE_GRAMPS, 20, 19, $6, 0, 0, -1, -1, 0, 0, 0, GrampsScript_0x7803d, EVENT_DAYCARE_MAN_OUTSIDE
	person_event SPRITE_DAYCARE_MON_1, 22, 18, $16, 2, 2, -1, -1, 0, 0, 0, DaycareMon1Script_0x78065, EVENT_DAYCARE_MON_1
	person_event SPRITE_DAYCARE_MON_2, 23, 21, $16, 2, 2, -1, -1, 0, 0, 0, DaycareMon2Script_0x7806b, EVENT_DAYCARE_MON_2
	person_event SPRITE_COOLTRAINER_F, 52, 15, $8, 0, 0, -1, -1, 8 + PAL_OW_RED, 2, 5, TrainerCooltrainerfIrene, -1
	person_event SPRITE_COOLTRAINER_F, 52, 7, $9, 0, 0, -1, -1, 8 + PAL_OW_RED, 2, 3, TrainerCooltrainerfJenn, -1
	person_event SPRITE_COOLTRAINER_F, 55, 10, $7, 0, 0, -1, -1, 8 + PAL_OW_RED, 2, 2, TrainerCooltrainerfKate, -1
	person_event SPRITE_POKE_BALL, 34, 11, $1, 0, 0, -1, -1, 0, 1, 0, ItemFragment_0x7832b, EVENT_ITEM_ROUTE_34_NUGGET
	person_event SPRITE_EGG, $18, $11, $16, 2, 2, -1, -1, 0, 0, 0, RandomEggScript, EVENT_RANDOM_EGG
; 0x78b5d

