MtMoonB1F_MapScriptHeader: ; 0x7407f
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x74089, $0000
	dw UnknownScript_0x7408d, $0000

	; callback count
	db 0
; 0x74089

UnknownScript_0x74089: ; 0x74089
	priorityjump UnknownScript_0x7408e
	end
; 0x7408d

UnknownScript_0x7408d: ; 0x7408d
	end
; 0x7408e

UnknownScript_0x7408e: ; 0x7408e
	spriteface $0, $1
	showemote $0, $0, 15
	special Functionc48f
	pause 15
	applymovement $2, MovementData_0x740f9
	playmusic MUSIC_RIVAL_ENCOUNTER
	loadfont
	writetext UnknownText_0x74105
	waitbutton
	closetext
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue UnknownScript_0x740c3
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue UnknownScript_0x740d3
	winlosstext UnknownText_0x7419d, UnknownText_0x742e0
	setlasttalked $2
	loadtrainer RIVAL2, 3
	startbattle
	reloadmapmusic
	returnafterbattle
	jump UnknownScript_0x740e3
; 0x740c3

UnknownScript_0x740c3: ; 0x740c3
	winlosstext UnknownText_0x7419d, UnknownText_0x742e0
	setlasttalked $2
	loadtrainer RIVAL2, 1
	startbattle
	reloadmapmusic
	returnafterbattle
	jump UnknownScript_0x740e3
; 0x740d3

UnknownScript_0x740d3: ; 0x740d3
	winlosstext UnknownText_0x7419d, UnknownText_0x742e0
	setlasttalked $2
	loadtrainer RIVAL2, 2
	startbattle
	reloadmapmusic
	returnafterbattle
	jump UnknownScript_0x740e3
; 0x740e3

UnknownScript_0x740e3: ; 0x740e3
	special DeleteSavedMusic
	playmusic MUSIC_RIVAL_AFTER
	loadfont
	writetext UnknownText_0x741fa
	waitbutton
	closetext
	applymovement $2, MovementData_0x740fd
	disappear $2
	dotrigger $1
	setevent EVENT_BEAT_RIVAL_IN_MT_MOON
	playmapmusic
	end
; 0x740f9

MovementData_0x740f9: ; 0x740f9
	step_down
	step_down
	step_down
	step_end
; 0x740fd

MovementData_0x740fd: ; 0x740fd
	step_up
	step_up
	step_up
	step_up
	step_up
	step_end
; 0x74105

UnknownText_0x74105: ; 0x74105
	text $56, " ", $56, " ", $56

	para "It's been a while,"
	line "<PLAYER>."

	para "<...>Since I lost to"
	line "you, I thought"

	para "about what I was"
	line "lacking with my"
	cont "#MON<...>"

	para "And we came up"
	line "with an answer."

	para "<PLAYER>, now we'll"
	line "show you!"
	done
; 0x7419d

UnknownText_0x7419d: ; 0x7419d
	text $56, " ", $56, " ", $56

	para "I thought I raised"
	line "my #MON to be"

	para "the best they"
	line "could be<...>"

	para "<...>But it still "
	line "wasn't enough<...>"
	done
; 0x741fa

UnknownText_0x741fa: ; 0x741fa
	text $56, " ", $56, " ", $56

	para "<...>You won, fair"
	line "and square."

	para "I admit it. But"
	line "this isn't the"
	cont "end."

	para "I'm going to be"
	line "the greatest #-"
	cont "MON trainer ever."

	para "Because these guys"
	line "are behind me."

	para "<...>Listen, <PLAYER>."

	para "One of these days"
	line "I'm going to prove"

	para "how good I am by"
	line "beating you."
	done
; 0x742e0

UnknownText_0x742e0: ; 0x742e0
	text $56, " ", $56, " ", $56

	para "I've repaid my"
	line "debt to you."

	para "With my #MON,"
	line "I'm going to beat"

	para "the CHAMPION and"
	line "become the world's"
	cont "greatest trainer."
	done
; 0x74356
MtMoonB1FSignpostScript:
	jumptext MtMoon1Text14

MtMoon1Text14:
	text "Beware! ZUBAT is"
	line "a blood sucker!"
	done

Item_MtMoonPGKB1F1:
	db MOON_STONE, 1
Item_MtMoonPGKB1F2:
	db MAX_REVIVE, 1
Item_MtMoonPGKB1F3:
	db MAX_REPEL, 1

MtMoonB1F_MapEventHeader: ; 0x1ac4af
	; filler
	db 0, 0

	; warps
	db 7
	warp_def $23, $0e, 1, GROUP_ROUTE_3, MAP_ROUTE_3
	warp_def $23, $0f, 1, GROUP_ROUTE_3, MAP_ROUTE_3
	warp_def $05, $05, 1, GROUP_MT_MOON_B2F, MAP_MT_MOON_B2F
	warp_def $0B, $11, 3, GROUP_MT_MOON_B2F, MAP_MT_MOON_B2F
	warp_def $0F, $19, 4, GROUP_MT_MOON_B2F, MAP_MT_MOON_B2F
	warp_def $07, $23, 1, GROUP_MOUNT_MOON_SQUARE, MAP_MOUNT_MOON_SQUARE
	warp_def $1F, $23, 2, GROUP_MOUNT_MOON_SQUARE, MAP_MOUNT_MOON_SQUARE

	; xy triggers
	db 0

	; signposts
	db 1
	signpost 23, 15, $0, MtMoonB1FSignpostScript

	; people-events
	db 4
	person_event SPRITE_SILVER, $23, $12, $6, 0, 0, -1, -1, 0, 0, 0, ObjectEvent, EVENT_SILVER_IN_MOUNT_MOON
	person_event SPRITE_POKE_BALL,  6,  6, $1, 0, 0, -1, -1, 0, 1, 0, Item_MtMoonPGKB1F1,  EVENT_MT_MOON_PGK_B1F_1
	person_event SPRITE_POKE_BALL, 27, 40, $1, 0, 0, -1, -1, 0, 1, 0, Item_MtMoonPGKB1F2, EVENT_MT_MOON_PGK_B1F_2
	person_event SPRITE_POKE_BALL, 36,  9, $1, 0, 0, -1, -1, 0, 1, 0, Item_MtMoonPGKB1F3, EVENT_MT_MOON_PGK_B1F_3

