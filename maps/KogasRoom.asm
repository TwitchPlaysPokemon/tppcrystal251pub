KogasRoom_MapScriptHeader: ; 0x18071b
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x180728, $0000
	dw UnknownScript_0x18072c, $0000

	; callback count
	db 1

	; callbacks

	dbw 1, UnknownScript_0x18072d
; 0x180728

UnknownScript_0x180728: ; 0x180728
	priorityjump UnknownScript_0x180742
	end
; 0x18072c

UnknownScript_0x18072c: ; 0x18072c
	end
; 0x18072d

UnknownScript_0x18072d: ; 0x18072d
	checkevent EVENT_WILLS_ROOM_ENTRANCE_CLOSED
	iffalse UnknownScript_0x180737
	changeblock $4, $e, $2a
UnknownScript_0x180737: ; 0x180737
	checkevent EVENT_KOGAS_ROOM_EXIT_OPEN
	iffalse UnknownScript_0x180741
	changeblock $4, $2, $16
UnknownScript_0x180741: ; 0x180741
	return
; 0x180742

UnknownScript_0x180742: ; 0x180742
	applymovement $0, MovementData_0x18078e
	refreshscreen $86
	playsound SFX_STRENGTH
	earthquake 80
	changeblock $4, $e, $2a
	reloadmappart
	closetext
	dotrigger $1
	setevent EVENT_WILLS_ROOM_ENTRANCE_CLOSED
	waitsfx
	end
; 0x18075a

KogaScript_0x18075a: ; 0x18075a
	faceplayer
	loadfont
	checkevent EVENT_OAK_DEFEATED
	iftrue KogaRematch
	checkevent EVENT_BEAT_ELITE_4_KOGA
	iftrue UnknownScript_0x180788
	writetext UnknownText_0x180793
	waitbutton
	closetext
	winlosstext UnknownText_0x1808a9, $0000
	loadtrainer KOGA, 1
	startbattle
	returnafterbattle
	setevent EVENT_BEAT_ELITE_4_KOGA
	loadfont
	writetext UnknownText_0x1808ca
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock $4, $2, $16
	reloadmappart
	closetext
	setevent EVENT_KOGAS_ROOM_EXIT_OPEN
	waitsfx
	end
; 0x180788

KogaRematch:
	checkevent EVENT_BEAT_ELITE_4_KOGA
	iftrue KogaAfterRematch
	writetext KogeBeforeRematchText
	waitbutton
	closetext
	winlosstext UnknownText_0x1808a9, $0000
	loadtrainer KOGA, 2
	startbattle
	returnafterbattle
	setevent EVENT_BEAT_ELITE_4_KOGA
	loadfont
	writetext KogaAfterRematchText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	changeblock $4, $2, $16
	reloadmappart
	closetext
	setevent EVENT_KOGAS_ROOM_EXIT_OPEN
	waitsfx
	end

KogeBeforeRematchText:
	text "Your arrival is"
	line "indeed impressive,"
	cont "as is your look of"
	cont "resolve."

	para "Fwahahahaha!"

	para "My skill will be"
	line "hard to overcome!"

	para "Let me show you"
	line "what I mean!"

	done

KogaAfterRematchText:
	text "Never have I met"
	line "the likes of you."

	para "I must devote"
	line "myself to my"
	cont "training."

	done

UnknownScript_0x180788: ; 0x180788
	writetext UnknownText_0x1808ca
	waitbutton
	closetext
	end

KogaAfterRematch: ; 0x180788
	writetext KogaAfterRematchText
	waitbutton
	closetext
	end
; 0x18078e

MovementData_0x18078e: ; 0x18078e
	step_up
	step_up
	step_up
	step_up
	step_end
; 0x180793

UnknownText_0x180793: ; 0x180793
	text "Fwahahahaha!"

	para "I am KOGA of the"
	line "ELITE FOUR."

	para "I live in shadows,"
	line "a ninja!"

	para "My intricate style"
	line "will confound and"
	cont "destroy you!"

	para "Confusion, sleep,"
	line "poison<...>"

	para "Prepare to be the"
	line "victim of my sin-"
	cont "ister technique!"

	para "Fwahahahaha!"

	para "#MON is not"
	line "merely about brute"

	para "force--you shall"
	line "see soon enough!"
	done
; 0x1808a9

UnknownText_0x1808a9: ; 0x1808a9
	text "Ah!"
	line "You have proven"
	cont "your worth!"
	done
; 0x1808ca

UnknownText_0x1808ca: ; 0x1808ca
	text "I subjected you to"
	line "everything I could"
	cont "muster."

	para "But my efforts"
	line "failed. I must"
	cont "hone my skills."

	para "Go on to the next"
	line "room, and put your"
	cont "abilities to test!"
	done
; 0x18095f

KogasRoom_MapEventHeader: ; 0x18095f
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $11, $4, 2, GROUP_WILLS_ROOM, MAP_WILLS_ROOM
	warp_def $11, $5, 3, GROUP_WILLS_ROOM, MAP_WILLS_ROOM
	warp_def $2, $4, 1, GROUP_BRUNOS_ROOM, MAP_BRUNOS_ROOM
	warp_def $2, $5, 2, GROUP_BRUNOS_ROOM, MAP_BRUNOS_ROOM

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_KOGA, 11, 9, $6, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, KogaScript_0x18075a, -1
; 0x180986

