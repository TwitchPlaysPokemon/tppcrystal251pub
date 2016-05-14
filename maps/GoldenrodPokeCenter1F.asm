GoldenrodPokeCenter1F_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

NurseScript_PCC:
	jumpstd pokecenternurse

GameboyKidScript_PCC1:
	jumptextfaceplayer PccText1

GameboyKidScript_PCC2:
	jumptextfaceplayer PccText2

GrannyTextScript_PCC:
	jumptextfaceplayer PccText3

LassScript_PCC:
	jumptextfaceplayer PccText4

YoungsterScript_PCC:
	jumptextfaceplayer PccText5

GreenHairScript_PCC:
	jumptextfaceplayer PccText6

CoolTrainerFScript_PCC:
	jumptextfaceplayer PccText7

TeacherScript_PCC:
	jumptextfaceplayer PccText8

YoungsterScript2_PCC:
	faceplayer
	loadfont
	writetext PccText9
	waitbutton
	closetext
	spriteface 14, $2
	end

PCCDirectorySignScript:
	loadfont
	writetext PccText10
	waitbutton
	closetext
	end

PCCMachineSignScript:
	loadfont
	writetext UnknownText_0x623c7
	waitbutton
	closetext
	end

LinkStationNurseScript:
	jumptextfaceplayer UnknownText_0x61072

PokefanFScript_PCC:
	faceplayer
	loadfont
	writetext UnknownText_0x623fb
	waitbutton
	writetext UnknownText_0x6248c
	yesorno
	iffalse UnknownScript_0x6104b
	takeitem EON_MAIL, 1
	iffalse UnknownScript_0x6104b
	writetext UnknownText_0x62549
	waitbutton
	writetext UnknownText_0x624a4
	waitbutton
	verbosegiveitem MAX_REVIVE, 1
	iffalse UnknownScript_0x61051
	writetext UnknownText_0x624e9
	waitbutton
	closetext
	end
; 0x6104b

UnknownScript_0x6104b: ; 0x6104b
	writetext UnknownText_0x62509
	waitbutton
	closetext
	end
; 0x61051

UnknownScript_0x61051: ; 0x61051
	giveitem EON_MAIL, $1
	writetext UnknownText_0x6252a
	waitbutton
	closetext
	end
; 0x6105a

UnknownText_0x61072: ; 0x61072
	text "Hello! Welcome to"
	line "the #COM CENTER"
	cont "TRADE CORNER."

	para "You can receive"
	line "unique #MON"

	para "if you have a"
	line "SPECIAL CODE."
	
	para "<...>Oh. But it looks"
	line "like our system"
	cont "isn't running yet<...>"
	
	para "Please come back"
	line "later!"
	done

;UnknownText_0x61344: ; 0x61344
	;text "We hope to see you"
	;line "again."
	;done
; 0x6135f

;UnknownText_0x6149a: ; 0x6149a
	;text "It's your new"
	;line "partner."

	;para "Please take care"
	;line "of it with love."

	;para "We hope to see you"
	;line "again."
	;done
; 0x614ed

;UnknownText_0x614ed: ; 0x614ed
	;text "Uh-oh. Your party"
	;line "is already full."

	;para "Please come back"
	;line "when you have room"
	;cont "in your party."
	;done
; 0x61544

;UnknownText_0x616fb: ; 0x616fb
	;text "We'll SAVE before"
	;line "connecting to the"
	;cont "CENTER."
	;done
; 0x61727

PccText5: ; 0x61c89
	text "Whoa, this #MON"
	line "CENTER is huge."

	para "They just built"
	line "this place. They"

	para "installed lots of"
	line "new machines too."
	done
; 0x61cef

PccText7: ; 0x61cef
	text "I thought up a fun"
	line "new thing for the"
	cont "TRADE CORNER!"

	para "I make a NOCTOWL"
	line "hold MAIL, then"

	para "put it up for"
	line "trade for another"
	cont "one!"

	para "If everyone did"
	line "that, MAIL could"

	para "be traded with all"
	line "sorts of people!"

	para "I call it<...>"
	line "NOCTOWL MAIL!"

	para "If it becomes"
	line "popular, I might"

	para "make lots of new"
	line "friends!"
	done
; 0x61dfd

PccText8: ; 0x61f48
	text "The #COM CENTER"
	line "will link with all"

	para "#MON CENTERS in"
	line "a wireless net."

	para "That must mean"
	line "I'll be able to"

	para "link with all"
	line "sorts of people."
	done

PccText9: ; 0x61f48
	text "I'm waiting for"
	line "my friend to"
	cont "connect!"

	para "It's crazy that"
	line "people from all"

	para "over the world"
	line "can play together!"

	done
; 0x61fc9

PccText2: ; 0x61fc9
	text "The machines here"
	line "can't be used yet."

	para "Still, it's nice"
	line "coming to a trendy"

	para "place before other"
	line "people."
	done
; 0x6202c

UnknownText_0x620a1: ; 0x620a1
	text "If I get in the"
	line "NEWS and become"

	para "famous, I bet I'll"
	line "be adored."

	para "I wonder how I"
	line "could get in the"
	cont "NEWS?"
	done
; 0x62105

PccText1: ; 0x62105
	text "In all #MON"
	line "CENTERS,"

	para "there is a PC"
	line "on both floors."

	para "Feels like a big"
	line "waste of money."
	done
; 0x62173

PccText6: ; 0x62173
	text "I came over here"
	line "when I got word"

	para "that GOLDENROD's"
	line "#MON CENTER has"

	para "new machines that"
	line "no one's ever seen"
	cont "before."

	para "But it looks like"
	line "they're still busy"

	para "with all their"
	line "preparations<...>"
	done

; 0x62222

PccText3: ; 0x62222
	text "Just seeing all"
	line "these new things"

	para "here makes me feel"
	line "younger!"
	done
; 0x62260

PccText4: ; 0x62260
	text "You just came"
	line "from training your"
	cont "#MON too?"

	para "I'm training my"
	line "SENTRET for the"
	cont "gym around here."

	para "For some weird"
	line "reason though,"

	para "she gets really"
	line "scared when I"
	cont "go near a PC."
	done

PccText10: ; 0x62370
	text "#COM CENTER"
	line "1F INFORMATION"

	para "Left:"
	line "ADMINISTRATION"

	para "Center:"
	line "#MON CENTER"

	para "Right:"
	line "#TRADE CORNER"
	done
; 0x623c7

UnknownText_0x623c7: ; 0x623c7
	text "It's a massive"
	line "computer!"

	para "It looks very"
	line "complicated<...>"
	done
; 0x623fb

UnknownText_0x623fb: ; 0x623fb
	text "Oh my, your pack"
	line "looks so heavy!"

	para "Oh! Do you happen"
	line "to have something"
	cont "named EON MAIL?"

	para "My daughter is"
	line "after one."

	para "You can part with"
	line "one, can't you?"
	done
; 0x6248c

UnknownText_0x6248c: ; 0x6248c
	text "Give away an EON"
	line "MAIL?"
	done
; 0x624a4

UnknownText_0x624a4: ; 0x624a4
	text "Oh, that's great!"
	line "Thank you, honey!"

	para "Here, this is for"
	line "you in return!"
	done
; 0x624e9

UnknownText_0x624e9: ; 0x624e9
	text "My daughter will"
	line "be delighted!"
	done
; 0x62509

UnknownText_0x62509: ; 0x62509
	text "Oh? You don't have"
	line "one? Too bad."
	done
; 0x6252a

UnknownText_0x6252a: ; 0x6252a
	text "Oh<...> Well, another"
	line "time, then."
	done
; 0x62549

UnknownText_0x62549: ; 0x62549
	text "<PLAYER> gave away"
	line "the EON MAIL."
	done
; 0x62564

SentretCryScript_PCC: ; 0x1a9f46
	loadfont
	writetext SentretCry_PCC
	cry SENTRET
	waitbutton
	closetext
	end

SentretCry_PCC: ; 0x62549
	text "SENTRET: Nyeut!"
	done

GoldenrodPokeCenter1F_MapEventHeader: ; 0x62564
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $f, $7, 15, GROUP_GOLDENROD_CITY, MAP_GOLDENROD_CITY
	warp_def $f, $6, 15, GROUP_GOLDENROD_CITY, MAP_GOLDENROD_CITY
	warp_def $6, $0, 1, GROUP_GOLDENROD_POKECOM_CENTER_2F_MOBILE, MAP_GOLDENROD_POKECOM_CENTER_2F_MOBILE
	warp_def $f, $0, 1, GROUP_POKECENTER_2F, MAP_POKECENTER_2F

	; xy triggers
	db 0
	;xy_trigger 0, $f, $6, $0, UnknownScript_0x60f94, $0, $0
	;xy_trigger 0, $f, $7, $0, UnknownScript_0x60fd9, $0, $0

	; signposts
	db 18
	signpost 9, 2, $0, PCCDirectorySignScript
	signpost 4, 24, $0, PCCMachineSignScript
	signpost 5, 24, $0, PCCMachineSignScript
	signpost 6, 24, $0, PCCMachineSignScript
	signpost 7, 24, $0, PCCMachineSignScript
	signpost 8, 24, $0, PCCMachineSignScript
	signpost 9, 24, $0, PCCMachineSignScript
	signpost 10, 24, $0, PCCMachineSignScript
	signpost 11, 25, $0, PCCMachineSignScript
	signpost 11, 26, $0, PCCMachineSignScript
	signpost 11, 27, $0, PCCMachineSignScript
	signpost 11, 28, $0, PCCMachineSignScript
	signpost 4, 29, $0, PCCMachineSignScript
	signpost 5, 29, $0, PCCMachineSignScript
	signpost 6, 29, $0, PCCMachineSignScript
	signpost 7, 29, $0, PCCMachineSignScript
	signpost 8, 29, $0, PCCMachineSignScript
	signpost 9, 29, $0, PCCMachineSignScript

	; people-events
	db 13
	person_event SPRITE_NURSE, 11, 11, $6, 0, 0, -1, -1, 0, 0, 0, NurseScript_PCC, -1
	person_event SPRITE_LINK_RECEPTIONIST, 12, 20, $6, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, LinkStationNurseScript, -1
	person_event SPRITE_GAMEBOY_KID, 16, 14, $6, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, GameboyKidScript_PCC2, -1
	person_event SPRITE_GAMEBOY_KID, 16, 15, $6, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 0, 0, GameboyKidScript_PCC1, -1
	person_event SPRITE_RHYDON, 13, 8, $16, 0, 0, -1, -1, 8 + PAL_OW_BROWN, 0, 0, SentretCryScript_PCC, -1
	person_event SPRITE_LASS, 13, 9, $6, 0, 0, -1, -1, 0, 0, 0, LassScript_PCC, -1
	person_event SPRITE_COOLTRAINER_F, 16, 8, $5, 0, 1,  -1, -1, 0, 0, 0, CoolTrainerFScript_PCC, -1
	person_event SPRITE_GRAMPS, 13, 25, $2, 0, 1, -1, -1, 0, 0, 0, GrannyTextScript_PCC, -1
	person_event SPRITE_POKEFAN_F, 18, 22, $6, 0, 0, -1, -1, 8 + PAL_OW_BROWN, 0, 0, PokefanFScript_PCC, -1
	person_event SPRITE_YOUNGSTER, 17, 12, $2, 2, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, YoungsterScript_PCC, -1
	person_event SPRITE_SILVER, 10, 25, $2, 1, 1, -1, -1, 8 + PAL_OW_GREEN, 0, 0, GreenHairScript_PCC, -1
	person_event SPRITE_TEACHER, 17, 31, $2, 0, 0, -1, -1, 8 + PAL_OW_YELLOW, 0, 0, TeacherScript_PCC, -1
	person_event SPRITE_YOUNGSTER, 14, 34, $8, 0, 0, -1, -1, 0, 0, 0, YoungsterScript2_PCC, -1
; 0x625cf

