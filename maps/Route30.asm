Route30_MapScriptHeader: ; 0x1a1671
	; trigger count
	db 0

	; callback count
	db 0
; 0x1a1673

YoungsterScript_0x1a1673: ; 0x1a1673
	waitsfx
	playmusic MUSIC_JOHTO_TRAINER_BATTLE
	loadfont
	writetext UnknownText_0x1a1806
	pause 30
	closetext
	playsound SFX_TACKLE
	applymovement $8, MovementData_0x1a17fe
	loadfont
	faceplayer
	writetext UnknownText_0x1a181c
	waitbutton
	spriteface $2, $1
	closetext
	playsound SFX_TACKLE
	applymovement $7, MovementData_0x1a1802
	special RestartMapMusic
	end
; 0x1a169a

TrainerYoungsterJoey1: ; 0x1a169a
	; bit/flag number
	dw $5a9

	; trainer group && trainer id
	db YOUNGSTER, JOEY1

	; text when seen
	dw YoungsterJoey1SeenText

	; text when trainer beaten
	dw YoungsterJoey1BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw YoungsterJoey1Script
; 0x1a16a6

YoungsterJoey1Script: ; 0x1a16a6
	writecode VAR_CALLERID, $f
	talkaftercancel
	loadfont
	checkflag ENGINE_JOEY
	iftrue UnknownScript_0x1a16e0
	checkcellnum $f
	iftrue UnknownScript_0x1a178f
	checkevent EVENT_ROUTE_30_273
	iftrue UnknownScript_0x1a16c9
	writetext UnknownText_0x1a18c2
	buttonsound
	setevent EVENT_ROUTE_30_273
	scall UnknownScript_0x1a1783
	jump UnknownScript_0x1a16cc
; 0x1a16c9

UnknownScript_0x1a16c9: ; 0x1a16c9
	scall UnknownScript_0x1a1787
UnknownScript_0x1a16cc: ; 0x1a16cc
	askforphonenumber $f
	if_equal $1, UnknownScript_0x1a1797
	if_equal $2, UnknownScript_0x1a1793
	trainertotext YOUNGSTER, JOEY1, $0
	scall UnknownScript_0x1a178b
	jump UnknownScript_0x1a178f
; 0x1a16e0

UnknownScript_0x1a16e0: ; 0x1a16e0
	scall UnknownScript_0x1a179b
	winlosstext YoungsterJoey1BeatenText, $0000
	copybytetovar wd9f9
	if_equal $4, UnknownScript_0x1a16ff
	if_equal $3, UnknownScript_0x1a1705
	if_equal $2, UnknownScript_0x1a170b
	if_equal $1, UnknownScript_0x1a1711
	if_equal $0, UnknownScript_0x1a1717
UnknownScript_0x1a16ff: ; 0x1a16ff
	checkevent EVENT_FIRST_TIME_HALL_OF_FAME
	iftrue UnknownScript_0x1a174b
UnknownScript_0x1a1705: ; 0x1a1705
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue UnknownScript_0x1a173e
UnknownScript_0x1a170b: ; 0x1a170b
	checkflag ENGINE_FLYPOINT_OLIVINE
	iftrue UnknownScript_0x1a1731
UnknownScript_0x1a1711: ; 0x1a1711
	checkflag ENGINE_FLYPOINT_GOLDENROD
	iftrue UnknownScript_0x1a1724
UnknownScript_0x1a1717: ; 0x1a717
	loadtrainer YOUNGSTER, JOEY1
	startbattle
	returnafterbattle
	loadvar wd9f9, $1
	clearflag ENGINE_JOEY
	end
; 0x1a1724

UnknownScript_0x1a1724: ; 0x1a1724
	loadtrainer YOUNGSTER, JOEY2
	startbattle
	returnafterbattle
	loadvar wd9f9, $2
	clearflag ENGINE_JOEY
	end
; 0x1a1731

UnknownScript_0x1a1731: ; 0x1a1731
	loadtrainer YOUNGSTER, JOEY3
	startbattle
	returnafterbattle
	loadvar wd9f9, $3
	clearflag ENGINE_JOEY
	end
; 0x1a173e

UnknownScript_0x1a173e: ; 0x1a173e
	loadtrainer YOUNGSTER, JOEY4
	startbattle
	returnafterbattle
	loadvar wd9f9, $4
	clearflag ENGINE_JOEY
	end
; 0x1a174b

UnknownScript_0x1a174b: ; 0x1a174b
	winlosstext YoungsterJoey5BeatenText, $0000
	loadtrainer YOUNGSTER, JOEY5
	startbattle
	returnafterbattle
	clearflag ENGINE_JOEY
	checkevent EVENT_JOEY_HP_UP
	iftrue UnknownScript_0x1a176f
	checkevent EVENT_ROUTE_30_266
	iftrue UnknownScript_0x1a176e
	scall UnknownScript_0x1a17a6
	verbosegiveitem HP_UP, 1
	iffalse UnknownScript_0x1a179f
	setevent EVENT_ROUTE_30_266
	jump UnknownScript_0x1a178f
; 0x1a176e

UnknownScript_0x1a176e: ; 0x1a176e
	end
; 0x1a176f

UnknownScript_0x1a176f: ; 0x1a176f
	loadfont
	writetext UnknownText_0x1a1bc0
	waitbutton
	verbosegiveitem HP_UP, 1
	iffalse UnknownScript_0x1a179f
	clearevent EVENT_JOEY_HP_UP
	setevent EVENT_ROUTE_30_266
	jump UnknownScript_0x1a178f
; 0x1a1783

UnknownScript_0x1a1783: ; 0x1a1783
	jumpstd asknumber1m
	end
; 0x1a1787

UnknownScript_0x1a1787: ; 0x1a1787
	jumpstd asknumber2m
	end
; 0x1a178b

UnknownScript_0x1a178b: ; 0x1a178b
	jumpstd registerednumberm
	end
; 0x1a178f

UnknownScript_0x1a178f: ; 0x1a178f
	jumpstd numberacceptedm
	end
; 0x1a1793

UnknownScript_0x1a1793: ; 0x1a1793
	jumpstd numberdeclinedm
	end
; 0x1a1797

UnknownScript_0x1a1797: ; 0x1a1797
	jumpstd phonefullm
	end
; 0x1a179b

UnknownScript_0x1a179b: ; 0x1a179b
	jumpstd rematchm
	end
; 0x1a179f

UnknownScript_0x1a179f: ; 0x1a179f
	setevent EVENT_JOEY_HP_UP
	jumpstd packfullm
	end
; 0x1a17a6

UnknownScript_0x1a17a6: ; 0x1a17a6
	jumpstd rematchgiftm
	end
; 0x1a17aa

TrainerYoungsterMikey: ; 0x1a17aa
	; bit/flag number
	dw $5aa

	; trainer group && trainer id
	db YOUNGSTER, MIKEY

	; text when seen
	dw YoungsterMikeySeenText

	; text when trainer beaten
	dw YoungsterMikeyBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw YoungsterMikeyScript
; 0x1a17b6

YoungsterMikeyScript: ; 0x1a17b6
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a197d
	waitbutton
	closetext
	end
; 0x1a17be

TrainerBug_catcherDon: ; 0x1a17be
	; bit/flag number
	dw $538

	; trainer group && trainer id
	db BUG_CATCHER, DON

	; text when seen
	dw Bug_catcherDonSeenText

	; text when trainer beaten
	dw Bug_catcherDonBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw Bug_catcherDonScript
; 0x1a17ca

Bug_catcherDonScript: ; 0x1a17ca
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a1a1c
	waitbutton
	closetext
	end
; 0x1a17d2

YoungsterScript_0x1a17d2: ; 0x1a17d2
	faceplayer
	loadfont
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue UnknownScript_0x1a17e0
	writetext UnknownText_0x1a1a6a
	waitbutton
	closetext
	end
; 0x1a17e0

UnknownScript_0x1a17e0: ; 0x1a17e0
	writetext UnknownText_0x1a1a94
	waitbutton
	closetext
	end
; 0x1a17e6

CooltrainerFScript_0x1a17e6: ; 0x1a17e6
	jumptextfaceplayer UnknownText_0x1a1ac4
; 0x1a17e9

MapRoute30Signpost0Script: ; 0x1a17e9
	jumptext UnknownText_0x1a1b0b
; 0x1a17ec

MapRoute30Signpost1Script: ; 0x1a17ec
	jumptext UnknownText_0x1a1b34
; 0x1a17ef

MapRoute30Signpost2Script: ; 0x1a17ef
	jumptext UnknownText_0x1a1b55
; 0x1a17f2

MapRoute30Signpost3Script: ; 0x1a17f2
	jumptext UnknownText_0x1a1b66
; 0x1a17f5

ItemFragment_0x1a17f5: ; 0x1a17f5
	db METAL_POWDER, 1
; 0x1a17f7

FruitTreeScript_0x1a17f7: ; 0x1a17f7
	fruittree $2
; 0x1a17f9

FruitTreeScript_0x1a17f9: ; 0x1a17f9
	fruittree $5
; 0x1a17fb

MapRoute30SignpostItem4: ; 0x1a17fb
	dw $00a4
	db SUPER_POTION

; 0x1a17fe

MovementData_0x1a17fe: ; 0x1a17fe
	fix_facing
	big_step_up
	big_step_down
	step_end
; 0x1a1802

MovementData_0x1a1802: ; 0x1a1802
	fix_facing
	big_step_down
	big_step_up
	step_end
; 0x1a1806

UnknownText_0x1a1806: ; 0x1a1806
	text "Go, RATTATA!"

	para "HYPER FANG!"
	done
; 0x1a181c

UnknownText_0x1a181c: ; 0x1a181c
	text "What? This is a"
	line "big battle!"
	cont "Leave me alone!"
	done
; 0x1a1849

YoungsterJoey1SeenText: ; 0x1a1849
	text "I recently moved"
	line "to here from the"
	cont "KANTO region!"

	para "I brought a"
	line "#MON that I"
	cont "caught back home."

	para "My RATTATA is a"
	line "very special one!"
	done
; 0x1a18a2

;we should modify this with rematches
YoungsterJoey1BeatenText: ; 0x1a18a2
	text "Ack! How could my"
	line "RATTATA lose?!"
	done
; 0x1a18c2
YoungsterJoey5BeatenText:
	text "No way! Even after"
	line "it evolved?!"
	done

UnknownText_0x1a18c2: ; 0x1a18c2
	text "Do I have to have"
	line "more #MON in"

	para "order to battle"
	line "better?"

	para "No! I'm sticking"
	line "with this one no"
	cont "matter what!"
	done
; 0x1a1928

YoungsterMikeySeenText: ; 0x1a1928
	text "You're a #MON"
	line "trainer, right?"

	para "Great! I just"
	line "caught some new"
	cont "#MON in the"
	cont "mountains!"
	done
; 0x1a195f

YoungsterMikeyBeatenText: ; 0x1a195f
	text "I guess they need"
	line "more training."
	done
; 0x1a197d

UnknownText_0x1a197d: ; 0x1a197d
	text "Becoming a good"
	line "trainer is really"
	cont "tough."

	para "I'm going to bat-"
	line "tle other people"
	cont "to get better."
	done
; 0x1a19d8

Bug_catcherDonSeenText: ; 0x1a19d8
	text "Instead of a bug"
	line "#MON, I found"
	cont "a trainer!"
	done
; 0x1a1a03

Bug_catcherDonBeatenText: ; 0x1a1a03
	text "Argh! You're too"
	line "strong for my bug"
	cont "#MON<...>"
	done
; 0x1a1a1c

UnknownText_0x1a1a1c: ; 0x1a1a1c
	text "This area is"
	line "great for finding"
	cont "bug #MON!"

	para "They vary depen-"
	line "ding on the time"
	cont "of the day!"
	done
; 0x1a1a6a

UnknownText_0x1a1a6a: ; 0x1a1a6a
	text "MR.#MON's"
	line "house? It's a bit"
	cont "farther ahead."
	done
; 0x1a1a94

UnknownText_0x1a1a94: ; 0x1a1a94
	text "Everyone's having"
	line "fun battling!"
	cont "You should too!"
	done
; 0x1a1ac4

UnknownText_0x1a1ac4: ; 0x1a1ac4
	text "I'm not a trainer."

	para "My AZUMARILL and I"
	line "prefer to travel"
	cont "the seas."
	done
; 0x1a1b0b

UnknownText_0x1a1b0b: ; 0x1a1b0b
	text "ROUTE 30"

	para "VIOLET CITY -"
	line "CHERRYGROVE CITY"
	done
; 0x1a1b34

UnknownText_0x1a1b34: ; 0x1a1b34
	text "MR.#MON'S HOUSE"
	line "STRAIGHT AHEAD!"
	done
; 0x1a1b55

UnknownText_0x1a1b55: ; 0x1a1b55
	text "MR.#MON'S HOUSE"
	done
; 0x1a1b66

UnknownText_0x1a1b66: ; 0x1a1b66
	text "TRAINER TIPS"

	para "No stealing other"
	line "people's #MON!"

	para "# BALLS are to"
	line "be thrown only at"
	cont "wild #MON!"
	done
; 0x1a1bc0

UnknownText_0x1a1bc0: ; 0x1a1bc0
	text "I lost again<...>"
	line "Gee, you're tough!"

	para "Oh yeah, I almost"
	line "forgot that I had"
	cont "to give you this."

	para "Use it to get even"
	line "tougher, OK?"

	para "I'm going to get"
	line "tougher too."
	done
; 0x1a1c54

Route30_MapEventHeader: ; 0x1a1c54
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $27, $7, 1, GROUP_ROUTE_30_BERRY_SPEECH_HOUSE, MAP_ROUTE_30_BERRY_SPEECH_HOUSE
	warp_def $5, $11, 1, GROUP_MR_POKEMONS_HOUSE, MAP_MR_POKEMONS_HOUSE

	; xy triggers
	db 0

	; signposts
	db 5
	signpost 43, 9, $0, MapRoute30Signpost0Script
	signpost 29, 13, $0, MapRoute30Signpost1Script
	signpost 5, 15, $0, MapRoute30Signpost2Script
	signpost 21, 3, $0, MapRoute30Signpost3Script
	signpost 9, 14, $7, MapRoute30SignpostItem4

	; people-events
	db 11
	person_event SPRITE_YOUNGSTER, 30, 9, $7, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, YoungsterScript_0x1a1673, EVENT_YOUNGSTERS_BATTLE_ON_ROUTE_30
	person_event SPRITE_YOUNGSTER, 32, 6, $9, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 2, 3, TrainerYoungsterJoey1, EVENT_YOUNGSTER_JOEY_ON_ROUTE_30
	person_event SPRITE_YOUNGSTER, 27, 9, $6, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 2, 1, TrainerYoungsterMikey, -1
	person_event SPRITE_BUG_CATCHER, 11, 5, $6, 0, 0, -1, -1, 8 + PAL_OW_BROWN, 2, 3, TrainerBug_catcherDon, -1
	person_event SPRITE_YOUNGSTER, 34, 11, $5, 0, 1, -1, -1, 8 + PAL_OW_RED, 0, 0, YoungsterScript_0x1a17d2, -1
	person_event SPRITE_MONSTER, 28, 9, $6, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, ObjectEvent, EVENT_YOUNGSTERS_BATTLE_ON_ROUTE_30
	person_event SPRITE_MONSTER, 29, 9, $7, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, ObjectEvent, EVENT_YOUNGSTERS_BATTLE_ON_ROUTE_30
	person_event SPRITE_FRUIT_TREE, 43, 9, $1, 0, 0, -1, -1, 0, 0, 0, FruitTreeScript_0x1a17f7, -1
	person_event SPRITE_FRUIT_TREE, 9, 15, $1, 0, 0, -1, -1, 0, 0, 0, FruitTreeScript_0x1a17f9, -1
	person_event SPRITE_COOLTRAINER_F, 17, 6, $6, 0, 0, -1, -1, 0, 0, 0, CooltrainerFScript_0x1a17e6, -1
	person_event SPRITE_POKE_BALL, 39, 12, $1, 0, 0, -1, -1, 0, 1, 0, ItemFragment_0x1a17f5, EVENT_ITEM_ROUTE_30_ANTIDOTE
; 0x1a1d0c

