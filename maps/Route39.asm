Route39_MapScriptHeader: ; 0x1a5af3
	; trigger count
	db 0

	; callback count
	db 0
; 0x1a5af5

TaurosScript_0x1a5af5: ; 0x1a5af5
	loadfont
	writetext UnknownText_0x1a5bf9
	cry MILTANK
	waitbutton
	closetext
	end
; 0x1a5aff

TrainerPokefanmDerek1: ; 0x1a5aff
	; bit/flag number
	dw $4ce

	; trainer group && trainer id
	db POKEFANM, DEREK1

	; text when seen
	dw PokefanmDerek1SeenText

	; text when trainer beaten
	dw PokefanmDerek1BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw PokefanmDerek1Script
; 0x1a5b0b

PokefanmDerek1Script: ; 0x1a5b0b
	writecode VAR_CALLERID, $1c
	talkaftercancel
	loadfont
	checkflag ENGINE_DEREK_HAS_NUGGET
	iftrue UnknownScript_0x1a5b4a
	checkcellnum $1c
	iftrue UnknownScript_0x1a5b6e
	checkpoke PIKACHU
	iffalse UnknownScript_0x1a5b5c
	checkevent EVENT_SHOWED_DEREK_PIKACHU
	iftrue UnknownScript_0x1a5b33
	writetext UnknownText_0x1a5cf8
	buttonsound
	setevent EVENT_SHOWED_DEREK_PIKACHU
	scall UnknownScript_0x1a5b62
	jump UnknownScript_0x1a5b36
; 0x1a5b33

UnknownScript_0x1a5b33: ; 0x1a5b33
	scall UnknownScript_0x1a5b66
UnknownScript_0x1a5b36: ; 0x1a5b36
	askforphonenumber $1c
	if_equal $1, UnknownScript_0x1a5b76
	if_equal $2, UnknownScript_0x1a5b72
	trainertotext POKEFANM, DEREK1, $0
	scall UnknownScript_0x1a5b6a
	jump UnknownScript_0x1a5b6e
; 0x1a5b4a

UnknownScript_0x1a5b4a: ; 0x1a5b4a
	scall UnknownScript_0x1a5b7a
	verbosegiveitem NUGGET, 1
	iffalse UnknownScript_0x1a5b59
	clearflag ENGINE_DEREK_HAS_NUGGET
	jump UnknownScript_0x1a5b6e
; 0x1a5b59

UnknownScript_0x1a5b59: ; 0x1a5b59
	jump UnknownScript_0x1a5b7e
; 0x1a5b5c

UnknownScript_0x1a5b5c: ; 0x1a5b5c
	writetext UnknownText_0x1a5dec
	waitbutton
	closetext
	end
; 0x1a5b62

UnknownScript_0x1a5b62: ; 0x1a5b62
	jumpstd asknumber1m
	end
; 0x1a5b66

UnknownScript_0x1a5b66: ; 0x1a5b66
	jumpstd asknumber2m
	end
; 0x1a5b6a

UnknownScript_0x1a5b6a: ; 0x1a5b6a
	jumpstd registerednumberm
	end
; 0x1a5b6e

UnknownScript_0x1a5b6e: ; 0x1a5b6e
	jumpstd numberacceptedm
	end
; 0x1a5b72

UnknownScript_0x1a5b72: ; 0x1a5b72
	jumpstd numberdeclinedm
	end
; 0x1a5b76

UnknownScript_0x1a5b76: ; 0x1a5b76
	jumpstd phonefullm
	end
; 0x1a5b7a

UnknownScript_0x1a5b7a: ; 0x1a5b7a
	jumpstd giftm
	end
; 0x1a5b7e

UnknownScript_0x1a5b7e: ; 0x1a5b7e
	jumpstd packfullm
	end
; 0x1a5b82

TrainerPokefanfRuth: ; 0x1a5b82
	; bit/flag number
	dw $4da

	; trainer group && trainer id
	db POKEFANF, RUTH

	; text when seen
	dw PokefanfRuthSeenText

	; text when trainer beaten
	dw PokefanfRuthBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw PokefanfRuthScript
; 0x1a5b8e

PokefanfRuthScript: ; 0x1a5b8e
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a5db2
	waitbutton
	closetext
	end
; 0x1a5b96

TrainerSailorEugene: ; 0x1a5b96
	; bit/flag number
	dw $575

	; trainer group && trainer id
	db SAILOR, EUGENE

	; text when seen
	dw SailorEugeneSeenText

	; text when trainer beaten
	dw SailorEugeneBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SailorEugeneScript
; 0x1a5ba2

SailorEugeneScript: ; 0x1a5ba2
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a5c4d
	waitbutton
	closetext
	end
; 0x1a5baa

TrainerPsychicNorman: ; 0x1a5baa
	; bit/flag number
	dw $43f

	; trainer group && trainer id
	db PSYCHIC_T, NORMAN

	; text when seen
	dw PsychicNormanSeenText

	; text when trainer beaten
	dw PsychicNormanBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw PsychicNormanScript
; 0x1a5bb6

PsychicNormanScript: ; 0x1a5bb6
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a5e57
	waitbutton
	closetext
	end
; 0x1a5bbe

PokefanFScript_0x1a5bbe: ; 0x1a5bbe
	faceplayer
	loadfont
	checktime $4
	iffalse UnknownScript_0x1a5be5
	checkevent EVENT_BEAT_POKEFANF_JAIME
	iftrue UnknownScript_0x1a5bdf
	writetext UnknownText_0x1a5ee8
	waitbutton
	closetext
	winlosstext UnknownText_0x1a5f17, $0000
	loadtrainer POKEFANF, JAIME
	startbattle
	returnafterbattle
	setevent EVENT_BEAT_POKEFANF_JAIME
	closetext
	end
; 0x1a5bdf

UnknownScript_0x1a5bdf: ; 0x1a5bdf
	writetext UnknownText_0x1a5f31
	waitbutton
	closetext
	end
; 0x1a5be5

UnknownScript_0x1a5be5: ; 0x1a5be5
	writetext UnknownText_0x1a5ec4
	waitbutton
	closetext
	end
; 0x1a5beb

MapRoute39Signpost2Script: ; 0x1a5beb
	jumptext UnknownText_0x1a5fe3
; 0x1a5bee

MapRoute39Signpost1Script: ; 0x1a5bee
	jumptext UnknownText_0x1a600a
; 0x1a5bf1

MapRoute39Signpost0Script: ; 0x1a5bf1
	jumptext UnknownText_0x1a6036
; 0x1a5bf4

FruitTreeScript_0x1a5bf4: ; 0x1a5bf4
	fruittree $f
; 0x1a5bf6

MapRoute39SignpostItem3: ; 0x1a5bf6
	dw $00aa
	db NUGGET

; 0x1a5bf9

UnknownText_0x1a5bf9: ; 0x1a5bf9
	text "MILTANK: Mooo!"
	done
; 0x1a5c09

SailorEugeneSeenText: ; 0x1a5c09
	text "I am gathering"
	line "groceries for"
	cont "our next journey!"

	para "Some #MON"
	line "happened to get"
	cont "mixed into it<...>"
	done
; 0x1a5c42

SailorEugeneBeatenText: ; 0x1a5c42
	text "Awaaargh!"
	done
; 0x1a5c4d

UnknownText_0x1a5c4d: ; 0x1a5c4d
	text "I guess this"
	line "shows how"
	cont "important it is"

	para "to develop bonds"
	line "with #MON"
	cont "before battling!"
	done
; 0x1a5ca5

PokefanmDerek1SeenText: ; 0x1a5ca5
	text "I work at the"
	line "local farm here!"

	para "My son likes to"
	line "come around and"
	cont "watch me work."

	para "I know!"

	para "I'll impress him"
	line "a bit by battling!"
	done
; 0x1a5cd4

PokefanmDerek1BeatenText: ; 0x1a5cd4
	text "SON: Dad, how"
	line "could you lose!?"

	para "DAD: <...>"
	done
; 0x1a5cf8

UnknownText_0x1a5cf8: ; 0x1a5cf8
	text "You can train"
	line "#MON by other"
	cont "means than battle."

	para "Mine train by"
	line "mowing the grass"
	cont "at ROUTE 38!"
	done
; 0x1a5d5b

PokefanfRuthSeenText: ; 0x1a5d5b
	text "I am a big fan"
	line "of OLIVINE's GYM"
	cont "LEADER, JASMINE."

	para "I named my #-"
	line "MON, just like she"
	cont "does!"
	done
; 0x1a5d9d

PokefanfRuthBeatenText: ; 0x1a5d9d
	text "ZAPPY, no!"
	done
; 0x1a5db2

UnknownText_0x1a5db2: ; 0x1a5db2
	text "Nicknames really"
	line "give #MON"
	cont "a personal touch."

	para "I visit the NAME"
	line "RATER sometimes in"
	cont "GOLDENROD CITY."
	done
; 0x1a5dec

UnknownText_0x1a5dec: ; 0x1a5dec
	text "You can train"
	line "#MON by other"
	cont "means than battle."

	para "Mine train by"
	line "mowing the grass"
	cont "at ROUTE 38!"
	done
; 0x1a5e0c

PsychicNormanSeenText: ; 0x1a5e0c
	text "Let me see what"
	line "your #MON are"
	cont "capable of."
	done
; 0x1a5e37

PsychicNormanBeatenText: ; 0x1a5e37
	text "Ooh, your #MON"
	line "have potential."
	done
; 0x1a5e57

UnknownText_0x1a5e57: ; 0x1a5e57
	text "You know how #-"
	line "MON have different"
	para "levels of"
	line "strength?"

	para "People are like"
	line "that too."

	para "Everyone has their"
	line "own unique poten-"
	cont "tial."
	done
; 0x1a5ec4

UnknownText_0x1a5ec4: ; 0x1a5ec4
	text "Ufufufu<...> I hope it"
	line "gets dark soon."
	done
; 0x1a5ee8

UnknownText_0x1a5ee8: ; 0x1a5ee8
	text "You came at just"
	line "the right time."

	para "Let's battle."
	done
; 0x1a5f17

UnknownText_0x1a5f17: ; 0x1a5f17
	text "Oh, how disap-"
	line "pointing<...>"
	done
; 0x1a5f31

UnknownText_0x1a5f31: ; 0x1a5f31
	text "I met my MEOWTH at"
	line "night, right here"
	cont "on ROUTE 39."

	para "I'm not sure why,"
	line "but it seems to"

	para "like it when I"
	line "train here."

	para "It seems to become"
	line "friendlier by"

	para "training here than"
	line "anywhere else."
	done
; 0x1a5fe3

UnknownText_0x1a5fe3: ; 0x1a5fe3
	text "ROUTE 39"

	para "OLIVINE CITY -"
	line "ECRUTEAK CITY"
	done
; 0x1a600a

UnknownText_0x1a600a: ; 0x1a600a
	text "MOOMOO FARM"

	para "Enjoy Our Fresh"
	line "and Tasty Milk"
	done
; 0x1a6036

UnknownText_0x1a6036: ; 0x1a6036
	text "TRAINER TIPS"

	para "Use HEADBUTT on"
	line "trees to shake"
	cont "#MON out."

	para "Different kinds of"
	line "#MON drop out"
	cont "of trees."

	para "Use HEADBUTT on"
	line "any tree you see!"
	done
; 0x1a60ba

Route39_MapEventHeader: ; 0x1a60ba
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $3, $1, 1, GROUP_ROUTE_39_BARN, MAP_ROUTE_39_BARN
	warp_def $3, $5, 1, GROUP_ROUTE_39_FARMHOUSE, MAP_ROUTE_39_FARMHOUSE

	; xy triggers
	db 0

	; signposts
	db 4
	signpost 31, 5, $0, MapRoute39Signpost0Script
	signpost 5, 9, $0, MapRoute39Signpost1Script
	signpost 7, 15, $0, MapRoute39Signpost2Script
	signpost 13, 5, $7, MapRoute39SignpostItem3

	; people-events
	db 10
	person_event SPRITE_SAILOR, 33, 17, $8, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 2, 5, TrainerSailorEugene, -1
	person_event SPRITE_POKEFAN_M, 26, 14, $7, 0, 0, -1, -1, 8 + PAL_OW_RED, 2, 4, TrainerPokefanmDerek1, -1
	person_event SPRITE_POKEFAN_F, 23, 15, $9, 0, 0, -1, -1, 8 + PAL_OW_RED, 2, 4, TrainerPokefanfRuth, -1
	person_event SPRITE_TAUROS, 16, 7, $16, 0, 0, -1, -1, 0, 0, 0, TaurosScript_0x1a5af5, -1
	person_event SPRITE_TAUROS, 15, 10, $16, 0, 0, -1, -1, 0, 0, 0, TaurosScript_0x1a5af5, -1
	person_event SPRITE_TAUROS, 19, 8, $16, 0, 0, -1, -1, 0, 0, 0, TaurosScript_0x1a5af5, -1
	person_event SPRITE_TAUROS, 17, 12, $16, 0, 0, -1, -1, 0, 0, 0, TaurosScript_0x1a5af5, -1
	person_event SPRITE_STANDING_YOUNGSTER, 11, 17, $a, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 2, 1, TrainerPsychicNorman, -1
	person_event SPRITE_FRUIT_TREE, 7, 13, $1, 0, 0, -1, -1, 0, 0, 0, FruitTreeScript_0x1a5bf4, -1
	person_event SPRITE_POKEFAN_F, 26, 8, $6, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, PokefanFScript_0x1a5bbe, -1
; 0x1a6160

