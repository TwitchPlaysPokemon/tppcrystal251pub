SaffronPokeCenter1F_MapScriptHeader: ; 0x18a47b
	; trigger count
	db 0

	; callback count
	db 0
; 0x18a47d

NurseScript_0x18a47d: ; 0x18a47d
	jumpstd pokecenternurse
; 0x18a480

TeacherScript_0x18a480: ; 0x18a480
	special Function10630f
	iftrue UnknownScript_0x18a489
	jumptextfaceplayer UnknownText_0x18a4a3
; 0x18a489

UnknownScript_0x18a489: ; 0x18a489
	jumptextfaceplayer UnknownText_0x18a532
; 0x18a48c

FisherScript_0x18a48c: ; 0x18a48c
	faceplayer
	loadfont
	checkevent EVENT_RETURNED_MACHINE_PART
	iftrue UnknownScript_0x18a49a
	writetext UnknownText_0x18a5d3
	waitbutton
	closetext
	end
; 0x18a49a

UnknownScript_0x18a49a: ; 0x18a49a
	writetext UnknownText_0x18a62e
	waitbutton
	closetext
	end
; 0x18a4a0

YoungsterScript_0x18a4a0: ; 0x18a4a0
	jumptextfaceplayer UnknownText_0x18a6c5
; 0x18a4a3

PokefanMScript_GiveFlute:
	faceplayer
	loadfont
	checkevent EVENT_GOT_POKE_FLUTE
	iftrue .GotFluteAlready
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .TryGiveFlute
	writetext SnorlaxInTheWayText
	waitbutton
	closetext
	end
.TryGiveFlute
	writetext TryGiveFluteText
	waitbutton
	verbosegiveitem POKE_FLUTE, 1
	iffalse .NoRoomForItem
	setevent EVENT_GOT_POKE_FLUTE
.GotFluteAlready
	writetext GotFluteAlreadyText
	waitbutton
.NoRoomForItem
	closetext
	end

SnorlaxInTheWayText:
	text "Have you seen the"
	line "SNORLAX around"
	cont "here?"

	para "They've been cau-"
	line "sing trouble for"
	cont "the locals."
	done

TryGiveFluteText:
	text "Have you seen the"
	line "SNORLAX around"
	cont "here?"

	para "If you try playing"
	line "this, they might"
	cont "wake up."
	done

GotFluteAlreadyText:
	text "That flute plays"
	line "a sublime sound."

	para "#MON hearing"
	line "it will surely"
	cont "wake up."

	para "It's so effective,"
	line "they play it non-"
	cont "stop on the RADIO."
	done

UnknownText_0x18a4a3: ; 0x18a4a3
	text "Have you heard"
	line "about the KANTO"
	cont "CHOIR GROUP?"

	para "They get their in-"
	line "spiration from a"

	para "famous trainer"
	line "and his journey."

	para "Nobody knows where"
	line "that trainer is"
	cont "now, though."
	done
; 0x18a532

UnknownText_0x18a532: ; 0x18a532
	text "What are JOHTO's"
	line "#MON CENTERS"
	cont "like?"

	para "<...>Oh, I see."
	line "So they let you"

	para "link with people"
	line "far away?"

	para "Then I'll get my"
	line "friend in JOHTO to"

	para "catch a MARILL and"
	line "trade it to me!"
	done
; 0x18a5d3

UnknownText_0x18a5d3: ; 0x18a5d3
	text "I just happened to"
	line "come through ROCK"

	para "TUNNEL. There was"
	line "some commotion at"
	cont "the POWER PLANT."
	done
; 0x18a62e

UnknownText_0x18a62e: ; 0x18a62e
	text "Caves are sturdy."

	para "I thought the one"
	line "outside CERULEAN"
	cont "was about to cave"
	cont "in, but it still"
	cont "stands today!"

	done
; 0x18a6c5

UnknownText_0x18a6c5: ; 0x18a6c5
	text "SILPH CO.'s HEAD"
	line "OFFICE and the"

	para "MAGNET TRAIN STA-"
	line "TION--they're the"

	para "places to see in"
	line "SAFFRON."
	done
; 0x18a722

SaffronOldCenter_LinkScript:
	jumpstd pokecenteroldlink
	
SaffronPokeCenter1F_MapEventHeader: ; 0x18a722
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $7, $5, 4, GROUP_SAFFRON_CITY, MAP_SAFFRON_CITY
	warp_def $7, $6, 4, GROUP_SAFFRON_CITY, MAP_SAFFRON_CITY
	warp_def $7, $2, 1, GROUP_POKECENTER_2F_KANTO, MAP_POKECENTER_2F_KANTO

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 6
	person_event SPRITE_NURSE, 5, 9, $6, 0, 0, -1, -1, 0, 0, 0, NurseScript_0x18a47d, -1
	person_event SPRITE_TEACHER, 8, 13, $2, 1, 1, -1, -1, 8 + PAL_OW_GREEN, 0, 0, TeacherScript_0x18a480, -1
	person_event SPRITE_FISHER, 8, 6, $9, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, FisherScript_0x18a48c, -1
	person_event SPRITE_YOUNGSTER, 10, 15, $3, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, YoungsterScript_0x18a4a0, -1
	person_event SPRITE_POKEFAN_M, 7, 10, $6, 0, 0, -1, -1 ,0, 0, 0, PokefanMScript_GiveFlute, -1
	person_event SPRITE_LINK_RECEPTIONIST, 6, 17, $6, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 0, 0, SaffronOldCenter_LinkScript, -1
; 0x18a76b

