Route43_MapScriptHeader: ; 0x19d04c
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks

	dbw 5, UnknownScript_0x19d051
; 0x19d051

UnknownScript_0x19d051: ; 0x19d051
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue UnknownScript_0x19d05c
	domaptrigger GROUP_ROUTE_43_GATE, MAP_ROUTE_43_GATE, $0
	return
; 0x19d05c

UnknownScript_0x19d05c: ; 0x19d05c
	domaptrigger GROUP_ROUTE_43_GATE, MAP_ROUTE_43_GATE, $1
	return
; 0x19d061

TrainerCamperSpencer: ; 0x19d061
	; bit/flag number
	dw $42c

	; trainer group && trainer id
	db CAMPER, SPENCER

	; text when seen
	dw CamperSpencerSeenText

	; text when trainer beaten
	dw CamperSpencerBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw CamperSpencerScript
; 0x19d06d

CamperSpencerScript: ; 0x19d06d
	talkaftercancel
	loadfont
	writetext UnknownText_0x19d57e
	waitbutton
	closetext
	end
; 0x19d075

TrainerPokemaniacBen: ; 0x19d075
	; bit/flag number
	dw $4e8

	; trainer group && trainer id
	db POKEMANIAC, BEN

	; text when seen
	dw PokemaniacBenSeenText

	; text when trainer beaten
	dw PokemaniacBenBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw PokemaniacBenScript
; 0x19d081

PokemaniacBenScript: ; 0x19d081
	talkaftercancel
	loadfont
	writetext UnknownText_0x19d2d2
	waitbutton
	closetext
	end
; 0x19d089

TrainerPokemaniacBrent1: ; 0x19d089
	; bit/flag number
	dw $4e9

	; trainer group && trainer id
	db POKEMANIAC, BRENT1

	; text when seen
	dw PokemaniacBrent1SeenText

	; text when trainer beaten
	dw PokemaniacBrent1BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw PokemaniacBrent1Script
; 0x19d095

PokemaniacBrent1Script: ; 0x19d095
	writecode VAR_CALLERID, $1e
	talkaftercancel
	loadfont
	checkflag ENGINE_BRENT
	iftrue UnknownScript_0x19d0cf
	checkcellnum $1e
	iftrue UnknownScript_0x19d138
	checkevent EVENT_ROUTE_43
	iftrue UnknownScript_0x19d0b8
	writetext UnknownText_0x19d359
	buttonsound
	setevent EVENT_ROUTE_43
	scall UnknownScript_0x19d12c
	jump UnknownScript_0x19d0bb
; 0x19d0b8

UnknownScript_0x19d0b8: ; 0x19d0b8
	scall UnknownScript_0x19d130
UnknownScript_0x19d0bb: ; 0x19d0bb
	askforphonenumber $1e
	if_equal $1, UnknownScript_0x19d140
	if_equal $2, UnknownScript_0x19d13c
	trainertotext POKEMANIAC, BRENT1, $0
	scall UnknownScript_0x19d134
	jump UnknownScript_0x19d138
; 0x19d0cf

UnknownScript_0x19d0cf: ; 0x19d0cf
	scall UnknownScript_0x19d144
	winlosstext PokemaniacBrent1BeatenText, $0000
	copybytetovar wda07
	if_equal $3, UnknownScript_0x19d0ea
	if_equal $2, UnknownScript_0x19d0f0
	if_equal $1, UnknownScript_0x19d0f6
	if_equal $0, UnknownScript_0x19d0fc
UnknownScript_0x19d0ea: ; 0x19d0ea
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue UnknownScript_0x19d123
UnknownScript_0x19d0f0: ; 0x19d0f0
	checkevent EVENT_FIRST_TIME_HALL_OF_FAME
	iftrue UnknownScript_0x19d116
UnknownScript_0x19d0f6: ; 0x19d0f6
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue UnknownScript_0x19d109
UnknownScript_0x19d0fc: ; 0x19d0fc
	loadtrainer POKEMANIAC, BRENT1
	startbattle
	returnafterbattle
	loadvar wda07, $1
	clearflag ENGINE_BRENT
	end
; 0x19d109

UnknownScript_0x19d109: ; 0x19d109
	loadtrainer POKEMANIAC, BRENT2
	startbattle
	returnafterbattle
	loadvar wda07, $2
	clearflag ENGINE_BRENT
	end
; 0x19d116

UnknownScript_0x19d116: ; 0x19d116
	loadtrainer POKEMANIAC, BRENT3
	startbattle
	returnafterbattle
	loadvar wda07, $3
	clearflag ENGINE_BRENT
	end
; 0x19d123

UnknownScript_0x19d123: ; 0x19d123
	loadtrainer POKEMANIAC, BRENT4
	startbattle
	returnafterbattle
	clearflag ENGINE_BRENT
	end
; 0x19d12c

UnknownScript_0x19d12c: ; 0x19d12c
	jumpstd asknumber1m
	end
; 0x19d130

UnknownScript_0x19d130: ; 0x19d130
	jumpstd asknumber2m
	end
; 0x19d134

UnknownScript_0x19d134: ; 0x19d134
	jumpstd registerednumberm
	end
; 0x19d138

UnknownScript_0x19d138: ; 0x19d138
	jumpstd numberacceptedm
	end
; 0x19d13c

UnknownScript_0x19d13c: ; 0x19d13c
	jumpstd numberdeclinedm
	end
; 0x19d140

UnknownScript_0x19d140: ; 0x19d140
	jumpstd phonefullm
	end
; 0x19d144

UnknownScript_0x19d144: ; 0x19d144
	jumpstd rematchm
	end
; 0x19d148

TrainerPokemaniacRon: ; 0x19d148
	; bit/flag number
	dw $4ea

	; trainer group && trainer id
	db POKEMANIAC, RON

	; text when seen
	dw PokemaniacRonSeenText

	; text when trainer beaten
	dw PokemaniacRonBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw PokemaniacRonScript
; 0x19d154

PokemaniacRonScript: ; 0x19d154
	talkaftercancel
	loadfont
	writetext UnknownText_0x19d3f8
	waitbutton
	closetext
	end
; 0x19d15c

TrainerFisherMarvin: ; 0x19d15c
	; bit/flag number
	dw $453

	; trainer group && trainer id
	db FISHER, MARVIN

	; text when seen
	dw FisherMarvinSeenText

	; text when trainer beaten
	dw FisherMarvinBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw FisherMarvinScript
; 0x19d168

FisherMarvinScript: ; 0x19d168
	talkaftercancel
	loadfont
	writetext UnknownText_0x19d4d3
	waitbutton
	closetext
	end
; 0x19d170

TrainerPicnickerTiffany3: ; 0x19d170
	; bit/flag number
	dw $491

	; trainer group && trainer id
	db PICNICKER, TIFFANY3

	; text when seen
	dw PicnickerTiffany3SeenText

	; text when trainer beaten
	dw PicnickerTiffany3BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw PicnickerTiffany3Script
; 0x19d17c

PicnickerTiffany3Script: ; 0x19d17c
	writecode VAR_CALLERID, $1f
	talkaftercancel
	loadfont
	checkflag ENGINE_TIFFANY
	iftrue UnknownScript_0x19d1c1
	checkflag ENGINE_TIFFANY_HAS_PINK_BOW
	iftrue UnknownScript_0x19d21e
	checkcellnum $1f
	iftrue UnknownScript_0x19d245
	checkpoke CLEFAIRY
	iffalse UnknownScript_0x19d233
	checkevent EVENT_SHOWED_TIFFANY_CLEFAIRY
	iftrue UnknownScript_0x19d1aa
	writetext UnknownText_0x19d618
	buttonsound
	setevent EVENT_SHOWED_TIFFANY_CLEFAIRY
	scall UnknownScript_0x19d239
	jump UnknownScript_0x19d1ad
; 0x19d1aa

UnknownScript_0x19d1aa: ; 0x19d1aa
	scall UnknownScript_0x19d23d
UnknownScript_0x19d1ad: ; 0x19d1ad
	askforphonenumber $1f
	if_equal $1, UnknownScript_0x19d24d
	if_equal $2, UnknownScript_0x19d249
	trainertotext PICNICKER, TIFFANY3, $0
	scall UnknownScript_0x19d241
	jump UnknownScript_0x19d245
; 0x19d1c1

UnknownScript_0x19d1c1: ; 0x19d1c1
	scall UnknownScript_0x19d251
	winlosstext PicnickerTiffany3BeatenText, $0000
	copybytetovar wda08
	if_equal $3, UnknownScript_0x19d1dc
	if_equal $2, UnknownScript_0x19d1e2
	if_equal $1, UnknownScript_0x19d1e8
	if_equal $0, UnknownScript_0x19d1ee
UnknownScript_0x19d1dc: ; 0x19d1dc
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue UnknownScript_0x19d215
UnknownScript_0x19d1e2: ; 0x19d1e2
	checkevent EVENT_FIRST_TIME_HALL_OF_FAME
	iftrue UnknownScript_0x19d208
UnknownScript_0x19d1e8: ; 0x19d1e8
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue UnknownScript_0x19d1fb
UnknownScript_0x19d1ee: ; 0x19d1ee
	loadtrainer PICNICKER, TIFFANY3
	startbattle
	returnafterbattle
	loadvar wda08, $1
	clearflag ENGINE_TIFFANY
	end
; 0x19d1fb

UnknownScript_0x19d1fb: ; 0x19d1fb
	loadtrainer PICNICKER, TIFFANY1
	startbattle
	returnafterbattle
	loadvar wda08, $2
	clearflag ENGINE_TIFFANY
	end
; 0x19d208

UnknownScript_0x19d208: ; 0x19d208
	loadtrainer PICNICKER, TIFFANY2
	startbattle
	returnafterbattle
	loadvar wda08, $3
	clearflag ENGINE_TIFFANY
	end
; 0x19d215

UnknownScript_0x19d215: ; 0x19d215
	loadtrainer PICNICKER, TIFFANY4
	startbattle
	returnafterbattle
	clearflag ENGINE_TIFFANY
	end
; 0x19d21e

UnknownScript_0x19d21e: ; 0x19d21e
	scall UnknownScript_0x19d255
	verbosegiveitem PINK_BOW, 1
	iffalse UnknownScript_0x19d230
	clearflag ENGINE_TIFFANY_HAS_PINK_BOW
	setevent EVENT_ROUTE_43_PHONE
	jump UnknownScript_0x19d245
; 0x19d230

UnknownScript_0x19d230: ; 0x19d230
	jump UnknownScript_0x19d259
; 0x19d233

UnknownScript_0x19d233: ; 0x19d233
	writetext UnknownText_0x19d64b
	waitbutton
	closetext
	end
; 0x19d239

UnknownScript_0x19d239: ; 0x19d239
	jumpstd asknumber1f
	end
; 0x19d23d

UnknownScript_0x19d23d: ; 0x19d23d
	jumpstd asknumber2f
	end
; 0x19d241

UnknownScript_0x19d241: ; 0x19d241
	jumpstd registerednumberf
	end
; 0x19d245

UnknownScript_0x19d245: ; 0x19d245
	jumpstd numberacceptedf
	end
; 0x19d249

UnknownScript_0x19d249: ; 0x19d249
	jumpstd numberdeclinedf
	end
; 0x19d24d

UnknownScript_0x19d24d: ; 0x19d24d
	jumpstd phonefullf
	end
; 0x19d251

UnknownScript_0x19d251: ; 0x19d251
	jumpstd rematchf
	end
; 0x19d255

UnknownScript_0x19d255: ; 0x19d255
	jumpstd giftf
	end
; 0x19d259

UnknownScript_0x19d259: ; 0x19d259
	jumpstd packfullf
	end
; 0x19d25d

MapRoute43Signpost0Script: ; 0x19d25d
	jumptext UnknownText_0x19d67b
; 0x19d260

MapRoute43Signpost1Script: ; 0x19d260
	jumptext UnknownText_0x19d6a2
; 0x19d263

MapRoute43Signpost2Script: ; 0x19d263
	jumptext UnknownText_0x19d6c9
; 0x19d266

FruitTreeScript_0x19d266: ; 0x19d266
	fruittree $8
; 0x19d268

ItemFragment_0x19d268: ; 0x19d268
	db MAX_ETHER, 1
; 0x19d26a

PokemaniacBenSeenText: ; 0x19d26a
	text "I love #MON!"

	para "That's why I"
	line "started--and why"

	para "I'll keep on"
	line "collecting!"
	done
; 0x19d2b4

PokemaniacBenBeatenText: ; 0x19d2b4
	text "How could you do"
	line "this to me?"
	done
; 0x19d2d2

UnknownText_0x19d2d2: ; 0x19d2d2
	text "What else do I"
	line "like besides"
	cont "#MON?"

	para "MARY on the"
	line "radio! I bet"
	cont "she's cute!"
	done
; 0x19d319

PokemaniacBrent1SeenText: ; 0x19d319
	text "Hey! Do you have"
	line "any rare #MON?"
	done
; 0x19d33a

PokemaniacBrent1BeatenText: ; 0x19d33a
	text "Oh, my poor #-"
	line "MON! Darlings!"
	done
; 0x19d359

UnknownText_0x19d359: ; 0x19d359
	text "I'd be happy just"
	line "to own a single"
	cont "rare #MON."
	done
; 0x19d386

PokemaniacRonSeenText: ; 0x19d386
	text "Would you get"
	line "this?"

	para "Some <RIVAL> guy"
	line "made fun of my"
	cont "cute bug #MON!"

	para "I'll show him!"
	line "My #MON's"
	cont "great!"
	done
; 0x19d3d6

PokemaniacRonBeatenText: ; 0x19d3d6
	text "My VENOMOTH did"
	line "pretty great!"
	done
; 0x19d3f8

UnknownText_0x19d3f8: ; 0x19d3f8
	text "It's okay for"
	line "people to like"

	para "different types"
	line "of #MON."

	para "Being a good "
	line "trainer isn't"

	para "just about having"
	line "the most powerful"
	cont "ones."
	done
; 0x19d461

FisherMarvinSeenText: ; 0x19d461
	text "This forest is"
	line "full of bugs!"

	para "I keep reeling in"
	line "#MON trying to"
	cont "eat them!"
	done
; 0x19d4b0

FisherMarvinBeatenText: ; 0x19d4b0
	text "At least POLITOED"
	line "was a nice catch."
	done
; 0x19d4d3

UnknownText_0x19d4d3: ; 0x19d4d3
	text "KURT's LURE BALL"
	line "is the best for"

	para "catching hooked"
	line "#MON."

	para "It's much more"
	line "effective than an"
	cont "ULTRA BALL."
	done
; 0x19d535

CamperSpencerSeenText: ; 0x19d535
	text "I can do so much"
	line "with my #MON--"
	cont "they're super-fun!"
	done
; 0x19d565

CamperSpencerBeatenText: ; 0x19d565
	text "Losing isn't fun"
	line "at all<...>"
	done
; 0x19d57e

UnknownText_0x19d57e: ; 0x19d57e
	text "What is going on"
	line "at LAKE OF RAGE?"

	para "We were planning"
	line "to camp there."
	done
; 0x19d5c1

PicnickerTiffany3SeenText: ; 0x19d5c1
	text "Are you going to"
	line "LAKE OF RAGE too?"

	para "Let's play for a"
	line "little while!"
	done
; 0x19d604

PicnickerTiffany3BeatenText: ; 0x19d604
	text "I played too much!"
	done
; 0x19d618

UnknownText_0x19d618: ; 0x19d618
	text "I'm having a pic-"
	line "nic with #MON."

	para "Won't you join us?"
	done
; 0x19d64b

UnknownText_0x19d64b: ; 0x19d64b
	text "Isn't my CLEFAIRY"
	line "just the cutest?"
	done
; 0x19d67b

UnknownText_0x19d67b: ; 0x19d67b
	text "ROUTE 43"

	para "LAKE OF RAGE -"
	line "MAHOGANY TOWN"
	done
; 0x19d6a2

UnknownText_0x19d6a2: ; 0x19d6a2
	text "ROUTE 43"

	para "LAKE OF RAGE -"
	line "MAHOGANY TOWN"
	done
; 0x19d6c9

UnknownText_0x19d6c9: ; 0x19d6c9
	text "TRAINER TIPS"

	para "All #MON have"
	line "pros and cons"

	para "depending on their"
	line "types."

	para "If their types"
	line "differ, a higher-"

	para "level #MON may"
	line "lose in battle."

	para "Learn which types"
	line "are strong and"

	para "weak against your"
	line "#MON's type."
	done
; 0x19d78c

Route43_MapEventHeader: ; 0x19d78c
	; filler
	db 0, 0

	; warps
	db 5
	warp_def $33, $9, 1, GROUP_ROUTE_43_MAHOGANY_GATE, MAP_ROUTE_43_MAHOGANY_GATE
	warp_def $33, $a, 2, GROUP_ROUTE_43_MAHOGANY_GATE, MAP_ROUTE_43_MAHOGANY_GATE
	warp_def $23, $11, 3, GROUP_ROUTE_43_GATE, MAP_ROUTE_43_GATE
	warp_def $1f, $11, 1, GROUP_ROUTE_43_GATE, MAP_ROUTE_43_GATE
	warp_def $1f, $12, 2, GROUP_ROUTE_43_GATE, MAP_ROUTE_43_GATE

	; xy triggers
	db 0

	; signposts
	db 3
	signpost 3, 13, $0, MapRoute43Signpost0Script
	signpost 49, 11, $0, MapRoute43Signpost1Script
	signpost 38, 16, $0, MapRoute43Signpost2Script

	; people-events
	db 8
	person_event SPRITE_SUPER_NERD, 9, 17, $8, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 2, 2, TrainerPokemaniacBen, -1
	person_event SPRITE_SUPER_NERD, 24, 17, $a, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 2, 3, TrainerPokemaniacBrent1, -1
	person_event SPRITE_SUPER_NERD, 11, 18, $6, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 2, 2, TrainerPokemaniacRon, -1
	person_event SPRITE_FISHER, 20, 8, $9, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 2, 4, TrainerFisherMarvin, -1
	person_event SPRITE_LASS, 29, 13, $6, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 2, 2, TrainerPicnickerTiffany3, -1
	person_event SPRITE_YOUNGSTER, 44, 17, $a, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 2, 3, TrainerCamperSpencer, -1
	person_event SPRITE_FRUIT_TREE, 30, 5, $1, 0, 0, -1, -1, 0, 0, 0, FruitTreeScript_0x19d266, -1
	person_event SPRITE_POKE_BALL, 36, 16, $1, 0, 0, -1, -1, 0, 1, 0, ItemFragment_0x19d268, EVENT_ITEM_ROUTE_43_MAX_ETHER
; 0x19d822

