KurtsHouse_MapScriptHeader: ; 0x18e14f
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks

	dbw 2, UnknownScript_0x18e154
; 0x18e154

UnknownScript_0x18e154: ; 0x18e154
	checkevent EVENT_CLEARED_SLOWPOKE_WELL
	iffalse UnknownScript_0x18e177
	checkevent EVENT_GOT_GS_BALL_BACK_FROM_KURT
	iftrue UnknownScript_0x18e177
	checkflag ENGINE_KURT_MAKING_BALLS
	iftrue UnknownScript_0x18e16f
	disappear $5
	appear $2
	disappear $6
	appear $3
	return
; 0x18e16f

UnknownScript_0x18e16f: ; 0x18e16f
	disappear $2
	appear $5
	disappear $3
	appear $6
UnknownScript_0x18e177: ; 0x18e177
	return
; 0x18e178

KurtScript_0x18e178: ; 0x18e178
	faceplayer
	loadfont
	checkevent EVENT_KURT_GAVE_YOU_LURE_BALL
	iftrue UnknownScript_0x18e1cc
	checkevent EVENT_CLEARED_SLOWPOKE_WELL
	iftrue UnknownScript_0x18e1bf
	writetext UnknownText_0x18e473
	waitbutton
	closetext
	special Functionc48f
	setevent EVENT_GOOD_SAMARITAN_ROCKET_IN_AZALEA_TOWN
	checkcode VAR_FACING
	if_equal $1, UnknownScript_0x18e1ab
	spriteface $0, $0
	playsound SFX_FLY
	applymovement $2, MovementData_0x18e466
	playsound SFX_EXIT_BUILDING
	disappear $2
	waitsfx
	special RestartMapMusic
	end
; 0x18e1ab

UnknownScript_0x18e1ab: ; 0x18e1ab
	spriteface $0, $0
	playsound SFX_FLY
	applymovement $2, MovementData_0x18e46c
	playsound SFX_EXIT_BUILDING
	disappear $2
	waitsfx
	special RestartMapMusic
	end
; 0x18e1bf

UnknownScript_0x18e1bf: ; 0x18e1bf
	writetext UnknownText_0x18e615
	buttonsound
	verbosegiveitem LURE_BALL, 1
	iffalse UnknownScript_0x18e2b2
	setevent EVENT_KURT_GAVE_YOU_LURE_BALL
UnknownScript_0x18e1cc: ; 0x18e1cc
		;checkevent EVENT_000_STD
		;iftrue UnknownScript_0x18e29f ;it'll take a day
	checkevent EVENT_CAN_GIVE_GS_BALL_TO_KURT
	iftrue UnknownScript_0x18e34e
	checkevent EVENT_KURT_HAS_LEVEL_BALL
	iftrue UnknownScript_0x18e2b4
	checkevent EVENT_KURT_HAS_LURE_BALL
	iftrue UnknownScript_0x18e2ca
	checkevent EVENT_KURT_HAS_MOON_BALL
	iftrue UnknownScript_0x18e2e0
	checkevent EVENT_KURT_HAS_FRIEND_BALL
	iftrue UnknownScript_0x18e2f6
	checkevent EVENT_KURT_HAS_FAST_BALL
	iftrue UnknownScript_0x18e30c
	checkevent EVENT_KURT_HAS_HEAVY_BALL
	iftrue UnknownScript_0x18e322
	checkevent EVENT_KURT_HAS_LOVE_BALL
	iftrue UnknownScript_0x18e338
UnknownScript_0x18e202: ; 0x18e202
	checkevent EVENT_001_STD
	iftrue UnknownScript_0x18e212
	checkevent EVENT_002_STD
	iftrue UnknownScript_0x18e212
	writetext UnknownText_0x18e6c9 ;i can make balls from apricorns
	waitbutton
UnknownScript_0x18e212: ; 0x18e212
	checkitem RED_APRICORN
	iftrue UnknownScript_0x18e249 ;if any apricorn, go to apricorn menu
	checkitem BLU_APRICORN
	iftrue UnknownScript_0x18e249
	checkitem YLW_APRICORN
	iftrue UnknownScript_0x18e249
	checkitem GRN_APRICORN
	iftrue UnknownScript_0x18e249
	checkitem WHT_APRICORN
	iftrue UnknownScript_0x18e249
	checkitem BLK_APRICORN
	iftrue UnknownScript_0x18e249
	checkitem PNK_APRICORN
	iftrue UnknownScript_0x18e249
		;checkevent EVENT_001_STD
		;iftrue UnknownScript_0x18e2ae ;if made a ball
	checkevent EVENT_002_STD
	iftrue UnknownScript_0x18e243 ;can make balls
	closetext
	end
; 0x18e243

UnknownScript_0x18e243: ; 0x18e243
	writetext UnknownText_0x18e6c9 ;I can make balls from apricorns
	waitbutton
	closetext
	end
; 0x18e249

UnknownScript_0x18e249: ; 0x18e249
	writetext UnknownText_0x18e736 ;you have an apricorn for me?
	buttonsound
	setevent EVENT_002_STD
	special Function88018
	if_equal $0, UnknownScript_0x18e2a5 ;letdown
	if_equal $59, UnknownScript_0x18e275 ;lure
	if_equal $5c, UnknownScript_0x18e27b ;moon
	if_equal $5d, UnknownScript_0x18e281 ;friend
	if_equal $61, UnknownScript_0x18e287 ;fast
	if_equal $63, UnknownScript_0x18e28d ;heavy
	if_equal $65, UnknownScript_0x18e293 ;love
	writetext KurtGivesBallsText ;I finised your ball
	buttonsound
	verbosegiveitem2 LEVEL_BALL, $16
	iftrue KurtGaveBalls ;quit
	setevent EVENT_KURT_HAS_LEVEL_BALL
	jump KurtBagFull
; 0x18e275

UnknownScript_0x18e275: ; 0x18e275 lure
	writetext KurtGivesBallsText ;I finised your ball
	buttonsound
	verbosegiveitem2 LURE_BALL, $16
	iftrue KurtGaveBalls ;quit
	setevent EVENT_KURT_HAS_LURE_BALL
	jump KurtBagFull
; 0x18e27b

UnknownScript_0x18e27b: ; 0x18e27b
	writetext KurtGivesBallsText ;I finised your ball
	buttonsound
	verbosegiveitem2 MOON_BALL, $16
	iftrue KurtGaveBalls ;quit
	setevent EVENT_KURT_HAS_MOON_BALL
	jump KurtBagFull
; 0x18e281

UnknownScript_0x18e281: ; 0x18e281
	writetext KurtGivesBallsText ;I finised your ball
	buttonsound
	verbosegiveitem2 FRIEND_BALL, $16
	iftrue KurtGaveBalls ;quit
	setevent EVENT_KURT_HAS_FRIEND_BALL
	jump KurtBagFull
; 0x18e287

UnknownScript_0x18e287: ; 0x18e287
	writetext KurtGivesBallsText ;I finised your ball
	buttonsound
	verbosegiveitem2 FAST_BALL, $16
	iftrue KurtGaveBalls ;quit
	setevent EVENT_KURT_HAS_FAST_BALL
	jump KurtBagFull
; 0x18e28d

UnknownScript_0x18e28d: ; 0x18e28d
	writetext KurtGivesBallsText ;I finised your ball
	buttonsound
	verbosegiveitem2 HEAVY_BALL, $16
	iftrue KurtGaveBalls ;quit
	setevent EVENT_KURT_HAS_HEAVY_BALL
	jump KurtBagFull
; 0x18e293

UnknownScript_0x18e293: ; 0x18e293
	writetext KurtGivesBallsText ;I finised your ball
	buttonsound
	verbosegiveitem2 LOVE_BALL, $16
	iftrue KurtGaveBalls ;quit
	setevent EVENT_KURT_HAS_LOVE_BALL
	jump KurtBagFull
; 0x18e299


;UnknownScript_0x18e299: ; 0x18e299
;	setevent EVENT_000_STD
;	setflag ENGINE_KURT_MAKING_BALLS
;UnknownScript_0x18e29f: ; 0x18e29f
;	writetext UnknownText_0x18e779 ;it'll take a day
;	waitbutton
;	closetext
;	end
; 0x18e2a5

UnknownScript_0x18e2a5: ; 0x18e2a5
	writetext UnknownText_0x18e7bc
	waitbutton
	closetext
	end
; 0x18e2ab

;UnknownScript_0x18e2ab: ; 0x18e2ab
	;setevent EVENT_001_STD
;UnknownScript_0x18e2ae: ; 0x18e2ae
	;writetext UnknownText_0x18e82a ;turned out great
	;waitbutton

UnknownScript_0x18e2b2: ; 0x18e2b2
	closetext
	end
; 0x18e2b4

KurtBagFull:
	writetext KurtBagFullText
	waitbutton
	closetext
	end

KurtGaveBalls:
	writetext KurtGaveBallsText
	setevent EVENT_001_STD
	waitbutton
	closetext
	end

KurtGivesBallsText:
	text "And here's the"
	line "balls I made"
	cont "earlier."
	done

KurtGaveBallsText:
	text "I could always"
	line "use more"
	cont "APRICORNS"

	para "Keep bringin' me"
	line "them."
	done

KurtBagFullText:
	text "Can't carry them?"
	line "Guess I'll have"
	cont "to owe ya some."

	para "Come back"
	line "whenever."
	done

KurtOwesBallsText:
	text "Here are those"
	line "balls I owe ya."

UnknownScript_0x18e2b4: ; 0x18e2b4
		;checkflag ENGINE_KURT_MAKING_BALLS
		;iftrue UnknownScript_0x18e3c5 ;I'm working
	writetext KurtOwesBallsText ;I finised your ball
	buttonsound
	verbosegiveitem2 LEVEL_BALL, $16
	iffalse KurtBagFull ;quit
UnknownScript_0x18e2c4: ; 0x18e2c4
	clearevent EVENT_KURT_HAS_LEVEL_BALL
	jump KurtGaveBalls ;set event
; 0x18e2ca

UnknownScript_0x18e2ca: ; 0x18e2ca
	writetext KurtOwesBallsText
	buttonsound
	verbosegiveitem2 LURE_BALL, $16
	iffalse KurtBagFull
UnknownScript_0x18e2da: ; 0x18e2da
	clearevent EVENT_KURT_HAS_LURE_BALL
	jump KurtGaveBalls
; 0x18e2e0

UnknownScript_0x18e2e0: ; 0x18e2e0
	writetext KurtOwesBallsText
	buttonsound
	verbosegiveitem2 MOON_BALL, $16
	iffalse KurtBagFull
UnknownScript_0x18e2f0: ; 0x18e2f0
	clearevent EVENT_KURT_HAS_MOON_BALL
	jump KurtGaveBalls
; 0x18e2f6

UnknownScript_0x18e2f6: ; 0x18e2f6
	writetext KurtOwesBallsText
	buttonsound
	verbosegiveitem2 FRIEND_BALL, $16
	iffalse KurtBagFull
UnknownScript_0x18e306: ; 0x18e306
	clearevent EVENT_KURT_HAS_FRIEND_BALL
	jump KurtGaveBalls
; 0x18e30c

UnknownScript_0x18e30c: ; 0x18e30c
	writetext KurtOwesBallsText
	buttonsound
	verbosegiveitem2 FAST_BALL, $16
	iffalse KurtBagFull
UnknownScript_0x18e31c: ; 0x18e31c
	clearevent EVENT_KURT_HAS_FAST_BALL
	jump KurtGaveBalls
; 0x18e322

UnknownScript_0x18e322: ; 0x18e322
	writetext KurtOwesBallsText
	buttonsound
	verbosegiveitem2 HEAVY_BALL, $16
	iffalse KurtBagFull
UnknownScript_0x18e332: ; 0x18e332
	clearevent EVENT_KURT_HAS_HEAVY_BALL
	jump KurtGaveBalls
; 0x18e338

UnknownScript_0x18e338: ; 0x18e338
	writetext KurtOwesBallsText
	buttonsound
	verbosegiveitem2 LOVE_BALL, $16
	iffalse KurtBagFull
UnknownScript_0x18e348: ; 0x18e348
	clearevent EVENT_KURT_HAS_LOVE_BALL
	jump KurtGaveBalls
; 0x18e34e

UnknownScript_0x18e34e: ; 0x18e34e
	checkitem GS_BALL
	iffalse UnknownScript_0x18e202
	writetext UnknownText_0x18e8ab
	waitbutton
	closetext
	takeitem GS_BALL, 1
	loadfont
	writetext UnknownText_0x18e934
	waitbutton
	writetext UnknownText_0x18e949
	waitbutton
UnknownScript_0x18e378: ; 0x18e378
	writetext UnknownText_0x18e95c
	waitbutton
	closetext
	setevent EVENT_GOT_GS_BALL_BACK_FROM_KURT
	clearevent EVENT_CAN_GIVE_GS_BALL_TO_KURT
	special Functionc48f
	pause 20
	showemote $0, $2, 30
	checkcode VAR_FACING
	if_equal $1, UnknownScript_0x18e3a2
	spriteface $0, $0
	playsound SFX_FLY
	applymovement $2, MovementData_0x18e466
	jump UnknownScript_0x18e3ac
; 0x18e3a2

UnknownScript_0x18e3a2: ; 0x18e3a2
	spriteface $0, $0
	playsound SFX_FLY
	applymovement $2, MovementData_0x18e46c
UnknownScript_0x18e3ac: ; 0x18e3ac
	playsound SFX_EXIT_BUILDING
	disappear $2
	clearevent EVENT_KURT_OUTSIDE_IN_AZALEA_TOWN
	waitsfx
	special RestartMapMusic
	domaptrigger GROUP_AZALEA_TOWN, MAP_AZALEA_TOWN, $2
	end
; 0x18e3bd

KurtScript_0x18e3bd: ; 0x18e3bd
	faceplayer
	loadfont
	;checkevent EVENT_GAVE_GS_BALL_TO_KURT
	;iftrue UnknownScript_0x18e3e0
UnknownScript_0x18e3c5: ; 0x18e3c5
	checkevent EVENT_KURT_TOLD_YOU_ABOUT_HIS_DAUGHTER_HELPING_HIM
	iffalse UnknownScript_0x18e3d4
	writetext UnknownText_0x18e7d8 ;I'm working
	waitbutton
	closetext
	spriteface $5, $1
	end
; 0x18e3d4

UnknownScript_0x18e3d4: ; 0x18e3d4
	writetext UnknownText_0x18e863
	waitbutton
	closetext
	spriteface $5, $1
	setevent EVENT_KURT_TOLD_YOU_ABOUT_HIS_DAUGHTER_HELPING_HIM
	end
; 0x18e3e0

;UnknownScript_0x18e3e0: ; 0x18e3e0
;	writetext UnknownText_0x18e934
;	waitbutton
;	spriteface $5, $1
;	writetext UnknownText_0x18e949
;	waitbutton
;	closetext
;	end
; 0x18e3ed

TwinScript_0x18e3ed: ; 0x18e3ed
	faceplayer
	checkevent EVENT_000_STD
	iftrue UnknownScript_0x18e42f
	checkevent EVENT_001_STD
	iftrue UnknownScript_0x18e448
	checkevent EVENT_GOT_GS_BALL_BACK_FROM_KURT
	iftrue UnknownScript_0x18e420
	checkevent EVENT_FAST_SHIP_FIRST_TIME
	iftrue UnknownScript_0x18e427
	checkevent EVENT_CLEARED_SLOWPOKE_WELL
	iftrue UnknownScript_0x18e419
	checkevent EVENT_GOOD_SAMARITAN_ROCKET_IN_AZALEA_TOWN
	iftrue UnknownScript_0x18e420
	loadfont
	writetext UnknownText_0x18e9b5
	waitbutton
	closetext
	end
; 0x18e419

UnknownScript_0x18e419: ; 0x18e419
	loadfont
	writetext UnknownText_0x18ea0f
	waitbutton
	closetext
	end
; 0x18e420

UnknownScript_0x18e420: ; 0x18e420
	loadfont
	writetext UnknownText_0x18e9f1
	waitbutton
	closetext
	end
; 0x18e427

UnknownScript_0x18e427: ; 0x18e427
	loadfont
	writetext UnknownText_0x18ea55
	waitbutton
	closetext
	end
; 0x18e42e

TwinScript_0x18e42e: ; 0x18e42e
	faceplayer
UnknownScript_0x18e42f: ; 0x18e42f
	loadfont

	writetext UnknownText_0x18eab2
	waitbutton
	closetext
	spriteface $6, $3
	end
; 0x18e43f


; 0x18e448

UnknownScript_0x18e448: ; 0x18e448
	loadfont
	writetext UnknownText_0x18eafc
	waitbutton
	closetext
	end
; 0x18e44f

SlowpokeScript_0x18e44f: ; 0x18e44f
	faceplayer
	loadfont
	writetext UnknownText_0x18eb56
	cry SLOWPOKE
	waitbutton
	closetext
	end
; 0x18e45a

MapKurtsHouseSignpost2Script: ; 0x18e45a
	jumptext UnknownText_0x18eb69
; 0x18e45d

MapKurtsHouseSignpost6Script: ; 0x18e45d
	jumptext UnknownText_0x18eb7e
; 0x18e460

MapKurtsHouseSignpost5Script: ; 0x18e460
	jumpstd difficultbookshelf
; 0x18e463

MapKurtsHouseSignpost0Script: ; 0x18e463
	jumpstd radio2
; 0x18e466

MovementData_0x18e466: ; 0x18e466
	big_step_down
	big_step_down
	big_step_down
	big_step_down
	big_step_down
	step_end
; 0x18e46c

MovementData_0x18e46c: ; 0x18e46c
	big_step_right
	big_step_down
	big_step_down
	big_step_down
	big_step_down
	big_step_down
	step_end
; 0x18e473

UnknownText_0x18e473: ; 0x18e473
	text "Hm? Who are you?"

	para "<PLAYER>, eh? You"
	line "want me to make"
	cont "some BALLS?"

	para "Sorry, but that'll"
	line "have to wait."

	para "Do you know TEAM"
	line "ROCKET? Ah, don't"

	para "worry. I'll tell"
	line "you anyhow."

	para "TEAM ROCKET's an"
	line "evil gang that"

	para "uses #MON for"
	line "their dirty work."

	para "They're supposed"
	line "to have disbanded"
	cont "three months ago."

	para "Anyway, they're at"
	line "the WELL, cutting"

	para "off SLOWPOKETAILS"
	line "for sale!"

	para "So I'm going to"
	line "go give them a"
	cont "lesson in pain!"

	para "Hang on, SLOWPOKE!"
	line "Old KURT is on his"
	cont "way!"
	done
; 0x18e615

UnknownText_0x18e615: ; 0x18e615
	text "KURT: Hi, <PLAYER>!"

	para "You handled your-"
	line "self like a real"
	cont "hero at the WELL."

	para "I like your style!"

	para "I would be honored"
	line "to make BALLS for"

	para "a trainer like"
	line "you."

	para "Actually<...>"

	para "I have a bunch in"
	line "the back, so I can"
	cont "trade BALLS"
	cont "for APRICORNS"
	cont "without you having"
	cont "to wait."

	para "Here's a sample"
	line "for all you did."
	done
; 0x18e6c9

UnknownText_0x18e6c9: ; 0x18e6c9
	text "KURT: I make BALLS"
	line "from APRICORNS."

	para "Collect them from"
	line "trees and bring"
	cont "'em to me."

	para "I'll trade BALLS"
	line "for them."
	done
; 0x18e736

UnknownText_0x18e736: ; 0x18e736
	text "KURT: You have an"
	line "APRICORN for me?"

	para "Fine! I'll trade"
	line "it for a BALL."
	done
; 0x18e779

;UnknownText_0x18e779: ; 0x18e779
;	text "KURT: It'll take a"
;	line "day to make you a"

;	para "BALL. Come back"
;	line "for it later."
;	done
; 0x18e7bc

UnknownText_0x18e7bc: ; 0x18e7bc
	text "KURT: Oh<...>"
	line "That's a letdown."
	done
; 0x18e7d8

UnknownText_0x18e7d8: ; 0x18e7d8
	text "KURT: I'm working!"
	line "Don't bother me!"
	done
; 0x18e7fb

;UnknownText_0x18e7fb: ; 0x18e7fb
	;text "KURT: Ah, <PLAYER>!"
	;line "I just finished"
	;cont "your BALL. Here!"
	;done
; 0x18e82a

;UnknownText_0x18e82a: ; 0x18e82a
;	text "KURT: That turned"
;	line "out great."

;	para "Try catching"
;	line "#MON with it."
;	done
; 0x18e863

UnknownText_0x18e863: ; 0x18e863
	text "KURT: Now that my"
	line "granddaughter is"

	para "helping me, I can"
	line "work much faster."
	done
; 0x18e8ab

UnknownText_0x18e8ab: ; 0x18e8ab
	text "Wh-what is that?"

	para "I've never seen"
	line "one before."

	para "It looks a lot"
	line "like a # BALL,"

	para "but it appears to"
	line "be something else."

	para "Let me check it"
	line "for you."
	done
; 0x18e934

UnknownText_0x18e934: ; 0x18e934
	text "I'm checking it"
	line "now."
	done
; 0x18e949

UnknownText_0x18e949: ; 0x18e949
	text "Ah-ha! I see!"
	line "So<...>"
	done
; 0x18e95c

UnknownText_0x18e95c: ; 0x18e95c
	text "<PLAYER>!"

	para "This BALL started"
	line "to shake while I"
	cont "was checking it."

	para "There must be"
	line "something to this!"
	done
; 0x18e9b5

UnknownText_0x18e9b5: ; 0x18e9b5
	text "The SLOWPOKE are"
	line "gone<...> Were they"

	para "taken away by bad"
	line "people?"
	done
; 0x18e9f1

UnknownText_0x18e9f1: ; 0x18e9f1
	text "Grandpa's gone<...>"
	line "I'm so lonely<...>"
	done
; 0x18ea0f

UnknownText_0x18ea0f: ; 0x18ea0f
	text "The SLOWPOKE my"
	line "dad gave me came"

	para "back! Its TAIL is"
	line "growing back too!"
	done
; 0x18ea55

UnknownText_0x18ea55: ; 0x18ea55
	text "Dad works at SILPH"
	line "where he studies"
	cont "# BALLS."

	para "I have to stay"
	line "home with Grandpa"
	cont "and SLOWPOKE."
	done
; 0x18eab2

UnknownText_0x18eab2: ; 0x18eab2
	text "I get to help"
	line "Grandpa now!"

	para "We'll make good"
	line "BALLS for you, so"
	cont "please wait!"
	done
; 0x18eafc

UnknownText_0x18eafc: ; 0x18eafc
	text "It's fun to make"
	line "BALLS!"
	done
; 0x18eb14

;UnknownText_0x18eb14: ; 0x18eb14
	;text "Grandpa's checking"
	;line "a BALL right now."

	;para "So I'm waiting"
	;line "till he's done."
	;done
; 0x18eb56

UnknownText_0x18eb56: ; 0x18eb56
	text "SLOWPOKE: <...>"
	line "Yawn?"
	done
; 0x18eb69

UnknownText_0x18eb69: ; 0x18eb69
	text "<...>A young PROF."
	line "OAK?"
	done
; 0x18eb7e

UnknownText_0x18eb7e: ; 0x18eb7e
	text "It's a statue of"
	line "the forest's pro-"
	cont "tector."
	done
; 0x18eba8

KurtsHouse_MapEventHeader: ; 0x18eba8
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $3, 4, GROUP_AZALEA_TOWN, MAP_AZALEA_TOWN
	warp_def $7, $4, 4, GROUP_AZALEA_TOWN, MAP_AZALEA_TOWN

	; xy triggers
	db 0

	; signposts
	db 7
	signpost 1, 6, $0, MapKurtsHouseSignpost0Script
	signpost 0, 8, $0, MapKurtsHouseSignpost2Script
	signpost 0, 9, $0, MapKurtsHouseSignpost2Script
	signpost 1, 5, $0, MapKurtsHouseSignpost5Script
	signpost 1, 2, $0, MapKurtsHouseSignpost5Script
	signpost 1, 3, $0, MapKurtsHouseSignpost5Script
	signpost 1, 4, $0, MapKurtsHouseSignpost6Script

	; people-events
	db 5
	person_event SPRITE_KURT, 6, 7, $6, 0, 0, -1, -1, 0, 0, 0, KurtScript_0x18e178, EVENT_KURT_IN_HIS_HOUSE_1
	person_event SPRITE_TWIN, 7, 9, $3, 0, 0, -1, -1, 0, 0, 0, TwinScript_0x18e3ed, EVENT_KURTS_GRANDDAUGHTER_1
	person_event SPRITE_SLOWPOKE, 7, 10, $1, 0, 0, -1, -1, 0, 0, 0, SlowpokeScript_0x18e44f, EVENT_SLOWPOKE_IN_KURTS_HOUSE
	person_event SPRITE_KURT, 7, 18, $7, 0, 0, -1, -1, 0, 0, 0, KurtScript_0x18e3bd, EVENT_KURT_IN_HIS_HOUSE_2
	person_event SPRITE_TWIN, 8, 15, $9, 0, 0, -1, -1, 0, 0, 0, TwinScript_0x18e42e, EVENT_KURTS_GRANDDAUGHTER_2
; 0x18ec1c

