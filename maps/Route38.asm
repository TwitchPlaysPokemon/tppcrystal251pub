Route38_MapScriptHeader: ; 0x1a1d0c
	; trigger count
	db 0

	; callback count
	db 0
; 0x1a1d0e

TrainerBird_keeperToby: ; 0x1a1d0e
	; bit/flag number
	dw $3ff

	; trainer group && trainer id
	db BIRD_KEEPER, TOBY

	; text when seen
	dw Bird_keeperTobySeenText

	; text when trainer beaten
	dw Bird_keeperTobyBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw Bird_keeperTobyScript
; 0x1a1d1a

Bird_keeperTobyScript: ; 0x1a1d1a
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a1f86
	waitbutton
	closetext
	end
; 0x1a1d22

TrainerSailorHarry: ; 0x1a1d22
	; bit/flag number
	dw $57e

	; trainer group && trainer id
	db SAILOR, HARRY

	; text when seen
	dw SailorHarrySeenText

	; text when trainer beaten
	dw SailorHarryBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SailorHarryScript
; 0x1a1d2e

SailorHarryScript: ; 0x1a1d2e
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a220c
	waitbutton
	closetext
	end
; 0x1a1d36

TrainerLassDana1: ; 0x1a1d36
	; bit/flag number
	dw $51e

	; trainer group && trainer id
	db LASS, DANA1

	; text when seen
	dw LassDana1SeenText

	; text when trainer beaten
	dw LassDana1BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw LassDana1Script
; 0x1a1d42

LassDana1Script: ; 0x1a1d42
	writecode VAR_CALLERID, $1a
	talkaftercancel
	loadfont
	checkflag ENGINE_DANA
	iftrue UnknownScript_0x1a1d82
	checkflag ENGINE_LIZ_HAS_THUNDERSTONE
	iftrue UnknownScript_0x1a1df6
	checkcellnum $1a
	iftrue UnknownScript_0x1a1e17
	checkevent EVENT_ROUTE_38_289
	iftrue UnknownScript_0x1a1d6b
	writetext UnknownText_0x1a20ec
	buttonsound
	setevent EVENT_ROUTE_38_289
	scall UnknownScript_0x1a1e0b
	jump UnknownScript_0x1a1d6e
; 0x1a1d6b

UnknownScript_0x1a1d6b: ; 0x1a1d6b
	scall UnknownScript_0x1a1e0f
UnknownScript_0x1a1d6e: ; 0x1a1d6e
	askforphonenumber $1a
	if_equal $1, UnknownScript_0x1a1e1f
	if_equal $2, UnknownScript_0x1a1e1b
	trainertotext LASS, DANA1, $0
	scall UnknownScript_0x1a1e13
	jump UnknownScript_0x1a1e17
; 0x1a1d82

UnknownScript_0x1a1d82: ; 0x1a1d82
	scall UnknownScript_0x1a1e23
	winlosstext LassDana1BeatenText, $0000
	copybytetovar wda03
	if_equal $4, UnknownScript_0x1a1da1
	if_equal $3, UnknownScript_0x1a1da7
	if_equal $2, UnknownScript_0x1a1dad
	if_equal $1, UnknownScript_0x1a1db3
	if_equal $0, UnknownScript_0x1a1db9
UnknownScript_0x1a1da1: ; 0x1a1da1
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue UnknownScript_0x1a1ded
UnknownScript_0x1a1da7: ; 0x1a1da7
	checkevent EVENT_FIRST_TIME_HALL_OF_FAME
	iftrue UnknownScript_0x1a1de0
UnknownScript_0x1a1dad: ; 0x1a1dad
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue UnknownScript_0x1a1dd3
UnknownScript_0x1a1db3: ; 0x1a1db3
	checkflag ENGINE_FLYPOINT_CIANWOOD
	iftrue UnknownScript_0x1a1dc6
UnknownScript_0x1a1db9: ; 0x1a1db9
	loadtrainer LASS, DANA1
	startbattle
	returnafterbattle
	loadvar wda03, $1
	clearflag ENGINE_DANA
	end
; 0x1a1dc6

UnknownScript_0x1a1dc6: ; 0x1a1dc6
	loadtrainer LASS, DANA2
	startbattle
	returnafterbattle
	loadvar wda03, $2
	clearflag ENGINE_DANA
	end
; 0x1a1dd3

UnknownScript_0x1a1dd3: ; 0x1a1dd3
	loadtrainer LASS, DANA3
	startbattle
	returnafterbattle
	loadvar wda03, $3
	clearflag ENGINE_DANA
	end
; 0x1a1de0

UnknownScript_0x1a1de0: ; 0x1a1de0
	loadtrainer LASS, DANA4
	startbattle
	returnafterbattle
	loadvar wda03, $4
	clearflag ENGINE_DANA
	end
; 0x1a1ded

UnknownScript_0x1a1ded: ; 0x1a1ded
	loadtrainer LASS, DANA5
	startbattle
	returnafterbattle
	clearflag ENGINE_DANA
	end
; 0x1a1df6

UnknownScript_0x1a1df6: ; 0x1a1df6
	scall UnknownScript_0x1a1e27
	verbosegiveitem THUNDERSTONE, 1
	iffalse UnknownScript_0x1a1e08
	clearflag ENGINE_LIZ_HAS_THUNDERSTONE
	setevent EVENT_ROUTE_38_PHONE
	jump UnknownScript_0x1a1e17
; 0x1a1e08

UnknownScript_0x1a1e08: ; 0x1a1e08
	jump UnknownScript_0x1a1e2b
; 0x1a1e0b

UnknownScript_0x1a1e0b: ; 0x1a1e0b
	jumpstd asknumber1f
	end
; 0x1a1e0f

UnknownScript_0x1a1e0f: ; 0x1a1e0f
	jumpstd asknumber2f
	end
; 0x1a1e13

UnknownScript_0x1a1e13: ; 0x1a1e13
	jumpstd registerednumberf
	end
; 0x1a1e17

UnknownScript_0x1a1e17: ; 0x1a1e17
	jumpstd numberacceptedf
	end
; 0x1a1e1b

UnknownScript_0x1a1e1b: ; 0x1a1e1b
	jumpstd numberdeclinedf
	end
; 0x1a1e1f

UnknownScript_0x1a1e1f: ; 0x1a1e1f
	jumpstd phonefullf
	end
; 0x1a1e23

UnknownScript_0x1a1e23: ; 0x1a1e23
	jumpstd rematchf
	end
; 0x1a1e27

UnknownScript_0x1a1e27: ; 0x1a1e27
	jumpstd giftf
	end
; 0x1a1e2b

UnknownScript_0x1a1e2b: ; 0x1a1e2b
	jumpstd packfullf
	end
; 0x1a1e2f

TrainerSchoolboyChad1: ; 0x1a1e2f
	; bit/flag number
	dw $475

	; trainer group && trainer id
	db SCHOOLBOY, CHAD1

	; text when seen
	dw SchoolboyChad1SeenText

	; text when trainer beaten
	dw SchoolboyChad1BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SchoolboyChad1Script
; 0x1a1e3b

SchoolboyChad1Script: ; 0x1a1e3b
	writecode VAR_CALLERID, $1b
	talkaftercancel
	loadfont
	checkflag ENGINE_CHAD
	iftrue UnknownScript_0x1a1e75
	checkcellnum $1b
	iftrue UnknownScript_0x1a1ef5
	checkevent EVENT_ROUTE_38_28B
	iftrue UnknownScript_0x1a1e5e
	writetext UnknownText_0x1a200e
	buttonsound
	setevent EVENT_ROUTE_38_28B
	scall UnknownScript_0x1a1ee9
	jump UnknownScript_0x1a1e61
; 0x1a1e5e

UnknownScript_0x1a1e5e: ; 0x1a1e5e
	scall UnknownScript_0x1a1eed
UnknownScript_0x1a1e61: ; 0x1a1e61
	askforphonenumber $1b
	if_equal $1, UnknownScript_0x1a1efd
	if_equal $2, UnknownScript_0x1a1ef9
	trainertotext SCHOOLBOY, CHAD1, $0
	scall UnknownScript_0x1a1ef1
	jump UnknownScript_0x1a1ef5
; 0x1a1e75

UnknownScript_0x1a1e75: ; 0x1a1e75
	scall UnknownScript_0x1a1f01
	winlosstext SchoolboyChad1BeatenText, $0000
	copybytetovar wda04
	if_equal $4, UnknownScript_0x1a1e94
	if_equal $3, UnknownScript_0x1a1e9a
	if_equal $2, UnknownScript_0x1a1ea0
	if_equal $1, UnknownScript_0x1a1ea6
	if_equal $0, UnknownScript_0x1a1eac
UnknownScript_0x1a1e94: ; 0x1a1e94
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue UnknownScript_0x1a1ee0
UnknownScript_0x1a1e9a: ; 0x1a1e9a
	checkevent EVENT_FIRST_TIME_HALL_OF_FAME
	iftrue UnknownScript_0x1a1ed3
UnknownScript_0x1a1ea0: ; 0x1a1ea0
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue UnknownScript_0x1a1ec6
UnknownScript_0x1a1ea6: ; 0x1a1ea6
	checkflag ENGINE_FLYPOINT_MAHOGANY
	iftrue UnknownScript_0x1a1eb9
UnknownScript_0x1a1eac: ; 0x1a1eac
	loadtrainer SCHOOLBOY, CHAD1
	startbattle
	returnafterbattle
	loadvar wda04, $1
	clearflag ENGINE_CHAD
	end
; 0x1a1eb9

UnknownScript_0x1a1eb9: ; 0x1a1eb9
	loadtrainer SCHOOLBOY, CHAD2
	startbattle
	returnafterbattle
	loadvar wda04, $2
	clearflag ENGINE_CHAD
	end
; 0x1a1ec6

UnknownScript_0x1a1ec6: ; 0x1a1ec6
	loadtrainer SCHOOLBOY, CHAD3
	startbattle
	returnafterbattle
	loadvar wda04, $3
	clearflag ENGINE_CHAD
	end
; 0x1a1ed3

UnknownScript_0x1a1ed3: ; 0x1a1ed3
	loadtrainer SCHOOLBOY, CHAD4
	startbattle
	returnafterbattle
	loadvar wda04, $4
	clearflag ENGINE_CHAD
	end
; 0x1a1ee0

UnknownScript_0x1a1ee0: ; 0x1a1ee0
	loadtrainer SCHOOLBOY, CHAD5
	startbattle
	returnafterbattle
	clearflag ENGINE_CHAD
	end
; 0x1a1ee9

UnknownScript_0x1a1ee9: ; 0x1a1ee9
	jumpstd asknumber1m
	end
; 0x1a1eed

UnknownScript_0x1a1eed: ; 0x1a1eed
	jumpstd asknumber2m
	end
; 0x1a1ef1

UnknownScript_0x1a1ef1: ; 0x1a1ef1
	jumpstd registerednumberm
	end
; 0x1a1ef5

UnknownScript_0x1a1ef5: ; 0x1a1ef5
	jumpstd numberacceptedm
	end
; 0x1a1ef9

UnknownScript_0x1a1ef9: ; 0x1a1ef9
	jumpstd numberdeclinedm
	end
; 0x1a1efd

UnknownScript_0x1a1efd: ; 0x1a1efd
	jumpstd phonefullm
	end
; 0x1a1f01

UnknownScript_0x1a1f01: ; 0x1a1f01
	jumpstd rematchm
	end
; 0x1a1f05

TrainerBeautyValerie: ; 0x1a1f05
	; bit/flag number
	dw $4bc

	; trainer group && trainer id
	db BEAUTY, VALERIE

	; text when seen
	dw BeautyValerieSeenText

	; text when trainer beaten
	dw BeautyValerieBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw BeautyValerieScript
; 0x1a1f11

BeautyValerieScript: ; 0x1a1f11
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a2185
	waitbutton
	closetext
	end
; 0x1a1f19

TrainerBeautyOlivia: ; 0x1a1f19
	; bit/flag number
	dw $5c1

	; trainer group && trainer id
	db BEAUTY, OLIVIA

	; text when seen
	dw BeautyOliviaSeenText

	; text when trainer beaten
	dw BeautyOliviaBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw BeautyOliviaScript
; 0x1a1f25

BeautyOliviaScript: ; 0x1a1f25
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a229a
	waitbutton
	closetext
	end
; 0x1a1f2d

MapRoute38Signpost0Script: ; 0x1a1f2d
	jumptext UnknownText_0x1a22fd
; 0x1a1f30

MapRoute38Signpost1Script: ; 0x1a1f30
	jumptext UnknownText_0x1a2324
; 0x1a1f33

FruitTreeScript_0x1a1f33: ; 0x1a1f33
	fruittree $3
; 0x1a1f35

Bird_keeperTobySeenText: ; 0x1a1f35
	text "Fly high into the"
	line "sky, my beloved"
	cont "bird #MON!"
	done
; 0x1a1f63

Bird_keeperTobyBeatenText: ; 0x1a1f63
	text "I feel like just"
	line "flying away now."
	done
; 0x1a1f86

UnknownText_0x1a1f86: ; 0x1a1f86
	text "I plan to train in"
	line "CIANWOOD CITY to"

	para "teach my #MON"
	line "how to FLY."
	done
; 0x1a1fc5

SchoolboyChad1SeenText: ; 0x1a1fc5
	text "EEVEE are common"
	line "in this area!"

	para "I heard you can"
	line "find some rare"

	para "EEVEE evolutions"
	line "here too!"
	done
; 0x1a1fee

SchoolboyChad1BeatenText: ; 0x1a1fee
	text "I wonder if my"
	line "EEVEE will evolve?"
	done
; 0x1a200e

UnknownText_0x1a200e: ; 0x1a200e
	text "I have tests"
	line "coming up."

	para "I don't have much"
	line "time for #MON."
	done
; 0x1a207d

LassDana1SeenText: ; 0x1a207d
	text "I feel like going"
	line "all in today!"
	done
; 0x1a20c8

LassDana1BeatenText: ; 0x1a20c8
	text "Down to my"
	line "last ¥100<...>"
	done
; 0x1a20ec

UnknownText_0x1a20ec: ; 0x1a20ec
	text "There is a certain"
	line "honor involved in"

	para "betting it all on"
	line "the roll of a"
	cont "dice."
	done
; 0x1a2130

BeautyValerieSeenText: ; 0x1a2130
	text "Hi! Aren't you a"
	line "cute trainer!"

	para "May I see your"
	line "#MON?"
	done
; 0x1a2164

BeautyValerieBeatenText: ; 0x1a2164
	text "I'm glad I got to"
	line "see your #MON!"
	done
; 0x1a2185

UnknownText_0x1a2185: ; 0x1a2185
	text "When I see #-"
	line "MON, it seems to"
	cont "soothe my nerves."
	done
; 0x1a21b7

SailorHarrySeenText: ; 0x1a21b7
	text "My dream is to"
	line "become admiral!"

	para "My #MON will"
	line "help me achieve"
	cont "that goal!"
	done
; 0x1a21f0

SailorHarryBeatenText: ; 0x1a21f0
	text "A cut below"
	line "the rest<...>"
	done
; 0x1a220c

UnknownText_0x1a220c: ; 0x1a220c
	text "I wonder how"
	line "useful CUT will"
	cont "be at sea<...>"
	done
; 0x1a224c

BeautyOliviaSeenText: ; 0x1a224c
	text "Don't you think my"
	line "#MON and I are"
	cont "beautiful?"
	done
; 0x1a2279

BeautyOliviaBeatenText: ; 0x1a2279
	text "We drink MOOMOO"
	line "MILK every day."
	done
; 0x1a229a

UnknownText_0x1a229a: ; 0x1a229a
	text "MOOMOO MILK is"
	line "good for beauty"

	para "and health, but"
	line "inconveniently,"

	para "they only sell a"
	line "bottle at a time."

	para "Thankfully I have"
	line "my own MILTANK!"
	done
; 0x1a22fd

UnknownText_0x1a22fd: ; 0x1a22fd
	text "ROUTE 38"

	para "OLIVINE CITY -"
	line "ECRUTEAK CITY"
	done
; 0x1a2324

UnknownText_0x1a2324: ; 0x1a2324
	text "TRAINER TIPS"

	para "If a #MON is"
	line "trying to evolve,"
	cont "you can stop it."

	para "Press the B But-"
	line "ton during evolu-"
	cont "tion."

	para "That startles the"
	line "#MON and stops"
	cont "its evolution."
	done
; 0x1a23bb

Route38_MapEventHeader: ; 0x1a23bb
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $8, $23, 1, GROUP_ROUTE_38_ECRUTEAK_GATE, MAP_ROUTE_38_ECRUTEAK_GATE
	warp_def $9, $23, 2, GROUP_ROUTE_38_ECRUTEAK_GATE, MAP_ROUTE_38_ECRUTEAK_GATE

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 7, 33, $0, MapRoute38Signpost0Script
	signpost 13, 5, $0, MapRoute38Signpost1Script

	; people-events
	db 7
	person_event SPRITE_STANDING_YOUNGSTER, 5, 8, $9, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 2, 1, TrainerSchoolboyChad1, -1
	person_event SPRITE_LASS, 7, 19, $a, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 2, 2, TrainerLassDana1, -1
	person_event SPRITE_STANDING_YOUNGSTER, 19, 16, $a, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 2, 1, TrainerBird_keeperToby, -1
	person_event SPRITE_BUENA, 13, 23, $6, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 2, 1, TrainerBeautyValerie, -1
	person_event SPRITE_SAILOR, 9, 28, $1e, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 2, 2, TrainerSailorHarry, -1
	person_event SPRITE_FRUIT_TREE, 14, 16, $1, 0, 0, -1, -1, 0, 0, 0, FruitTreeScript_0x1a1f33, -1
	person_event SPRITE_BUENA, 12, 9, $a, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 2, 1, TrainerBeautyOlivia, -1
; 0x1a2430

