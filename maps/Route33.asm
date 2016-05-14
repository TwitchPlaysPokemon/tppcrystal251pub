Route33_MapScriptHeader: ; 0x1ac000
	; trigger count
	db 0

	; callback count
	db 0
; 0x1ac002

LassScript_0x1ac002: ; 0x1ac002
	jumptextfaceplayer UnknownText_0x1ac1e7
; 0x1ac005

TrainerHikerAnthony2: ; 0x1ac005
	; bit/flag number
	dw $528

	; trainer group && trainer id
	db HIKER, ANTHONY2

	; text when seen
	dw HikerAnthony2SeenText

	; text when trainer beaten
	dw HikerAnthony2BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw HikerAnthony2Script
; 0x1ac011

HikerAnthony2Script: ; 0x1ac011
	writecode VAR_CALLERID, $13
	talkaftercancel
	loadfont
	checkflag ENGINE_ANTHONY
	iftrue UnknownScript_0x1ac051
	checkflag ENGINE_DUNSPARCE_SWARM
	iftrue UnknownScript_0x1ac0c5
	checkcellnum $13
	iftrue UnknownScript_0x1ac0d7
	checkevent EVENT_ROUTE_33_27B
	iftrue UnknownScript_0x1ac03a
	writetext UnknownText_0x1ac153
	buttonsound
	setevent EVENT_ROUTE_33_27B
	scall UnknownScript_0x1ac0cb
	jump UnknownScript_0x1ac03d
; 0x1ac03a

UnknownScript_0x1ac03a: ; 0x1ac03a
	scall UnknownScript_0x1ac0cf
UnknownScript_0x1ac03d: ; 0x1ac03d
	askforphonenumber $13
	if_equal $1, UnknownScript_0x1ac0df
	if_equal $2, UnknownScript_0x1ac0db
	trainertotext HIKER, ANTHONY2, $0
	scall UnknownScript_0x1ac0d3
	jump UnknownScript_0x1ac0d7
; 0x1ac051

UnknownScript_0x1ac051: ; 0x1ac051
	scall UnknownScript_0x1ac0e3
	winlosstext HikerAnthony2BeatenText, $0000
	copybytetovar wd9fd
	if_equal $4, UnknownScript_0x1ac070
	if_equal $3, UnknownScript_0x1ac076
	if_equal $2, UnknownScript_0x1ac07c
	if_equal $1, UnknownScript_0x1ac082
	if_equal $0, UnknownScript_0x1ac088
UnknownScript_0x1ac070: ; 0x1ac070
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue UnknownScript_0x1ac0bc
UnknownScript_0x1ac076: ; 0x1ac076
	checkevent EVENT_FIRST_TIME_HALL_OF_FAME
	iftrue UnknownScript_0x1ac0af
UnknownScript_0x1ac07c: ; 0x1ac07c
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue UnknownScript_0x1ac0a2
UnknownScript_0x1ac082: ; 0x1ac082
	checkflag ENGINE_FLYPOINT_OLIVINE
	iftrue UnknownScript_0x1ac095
UnknownScript_0x1ac088: ; 0x1ac088
	loadtrainer HIKER, ANTHONY2
	startbattle
	returnafterbattle
	loadvar wd9fd, $1
	clearflag ENGINE_ANTHONY
	end
; 0x1ac095

UnknownScript_0x1ac095: ; 0x1ac095
	loadtrainer HIKER, ANTHONY1
	startbattle
	returnafterbattle
	loadvar wd9fd, $2
	clearflag ENGINE_ANTHONY
	end
; 0x1ac0a2

UnknownScript_0x1ac0a2: ; 0x1ac0a2
	loadtrainer HIKER, ANTHONY3
	startbattle
	returnafterbattle
	loadvar wd9fd, $3
	clearflag ENGINE_ANTHONY
	end
; 0x1ac0af

UnknownScript_0x1ac0af: ; 0x1ac0af
	loadtrainer HIKER, ANTHONY4
	startbattle
	returnafterbattle
	loadvar wd9fd, $4
	clearflag ENGINE_ANTHONY
	end
; 0x1ac0bc

UnknownScript_0x1ac0bc: ; 0x1ac0bc
	loadtrainer HIKER, ANTHONY5
	startbattle
	returnafterbattle
	clearflag ENGINE_ANTHONY
	end
; 0x1ac0c5

UnknownScript_0x1ac0c5: ; 0x1ac0c5
	writetext UnknownText_0x1ac180
	waitbutton
	closetext
	end
; 0x1ac0cb

UnknownScript_0x1ac0cb: ; 0x1ac0cb
	jumpstd asknumber1m
	end
; 0x1ac0cf

UnknownScript_0x1ac0cf: ; 0x1ac0cf
	jumpstd asknumber2m
	end
; 0x1ac0d3

UnknownScript_0x1ac0d3: ; 0x1ac0d3
	jumpstd registerednumberm
	end
; 0x1ac0d7

UnknownScript_0x1ac0d7: ; 0x1ac0d7
	jumpstd numberacceptedm
	end
; 0x1ac0db

UnknownScript_0x1ac0db: ; 0x1ac0db
	jumpstd numberdeclinedm
	end
; 0x1ac0df

UnknownScript_0x1ac0df: ; 0x1ac0df
	jumpstd phonefullm
	end
; 0x1ac0e3

UnknownScript_0x1ac0e3: ; 0x1ac0e3
	jumpstd rematchm
	end
; 0x1ac0e7

MapRoute33Signpost0Script: ; 0x1ac0e7
	jumptext UnknownText_0x1ac279
; 0x1ac0ea

FruitTreeScript_0x1ac0ea: ; 0x1ac0ea
	fruittree $6
; 0x1ac0ec

HikerAnthony2SeenText: ; 0x1ac0ec
	text "My #MON"
	line "are the best!"
	done
; 0x1ac130

HikerAnthony2BeatenText: ; 0x1ac130
	text "Now I feel like"
	line "a MAGIKARP<...>"
	done
; 0x1ac153

UnknownText_0x1ac153: ; 0x1ac153
	text "I will be even"
	line "better next time!"
	done
; 0x1ac180

UnknownText_0x1ac180: ; 0x1ac180
	text "Hey, did you get a"
	line "DUNSPARCE?"

	para "In DARK CAVE?"

	para "They're known to"
	line "swarm there from"
	cont "time to time."

	para "When they do, it"
	line "creates a host of"

	para "problems for near-"
	line "by BLACKTHORN"
	cont "CITY<...>"
	done
; 0x1ac1e7

UnknownText_0x1ac1e7: ; 0x1ac1e7
	text "Pant, pant<...>"

	para "I finally got"
	line "through that cave."

	para "It was much bigger"
	line "than I'd expected."

	para "I got too tired to"
	line "explore the whole"

	para "thing, so I came"
	line "outside."
	done
; 0x1ac279

UnknownText_0x1ac279: ; 0x1ac279
	text "ROUTE 33"
	done
; 0x1ac283

Route33_MapEventHeader: ; 0x1ac283
	; filler
	db 0, 0

	; warps
	db 1
	warp_def $9, $b, 3, GROUP_UNION_CAVE_1F, MAP_UNION_CAVE_1F

	; xy triggers
	db 0

	; signposts
	db 1
	signpost 11, 11, $0, MapRoute33Signpost0Script

	; people-events
	db 3
	person_event SPRITE_POKEFAN_M, 17, 10, $a, 0, 0, -1, -1, 8 + PAL_OW_BROWN, 2, 2, TrainerHikerAnthony2, -1
	person_event SPRITE_LASS, 20, 17, $2, 1, 1, -1, -1, 8 + PAL_OW_BLUE, 0, 0, LassScript_0x1ac002, -1
	person_event SPRITE_FRUIT_TREE, 20, 18, $1, 0, 0, -1, -1, 0, 0, 0, FruitTreeScript_0x1ac0ea, -1
; 0x1ac2ba

