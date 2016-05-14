Route39Farmhouse_MapScriptHeader: ; 0x9ceb2
	; trigger count
	db 0

	; callback count
	db 0
; 0x9ceb4

PokefanMScript_0x9ceb4: ; 0x9ceb4
	faceplayer
	loadfont
	checkevent EVENT_HEALED_MOOMOO
	iftrue UnknownScript_0x9cec5
	writetext UnknownText_0x9cf38
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_FARMER_ABOUT_MOOMOO
	end
; 0x9cec5

UnknownScript_0x9cec5: ; 0x9cec5
	checkitem MOOMOO_MILK
	iftrue UnknownScript_0x9cf08
	writetext UnknownText_0x9cfe1
	special Function24ae8
	yesorno
	iffalse UnknownScript_0x9cf02
	checkmoney $0, 500
	if_equal $2, UnknownScript_0x9cef6
	giveitem MOOMOO_MILK, $1
	iffalse UnknownScript_0x9cefc
	takemoney $0, 500
	special Function24ae8
	waitsfx
	playsound SFX_TRANSACTION
	writetext UnknownText_0x9d05d
	buttonsound
	itemnotify
	closetext
	end
; 0x9cef6

UnknownScript_0x9cef6: ; 0x9cef6
	writetext UnknownText_0x9d07c
	waitbutton
	closetext
	end
; 0x9cefc

UnknownScript_0x9cefc: ; 0x9cefc
	writetext UnknownText_0x9d09d
	waitbutton
	closetext
	end
; 0x9cf02

UnknownScript_0x9cf02: ; 0x9cf02
	writetext UnknownText_0x9d0b7
	waitbutton
	closetext
	end
; 0x9cf08

UnknownScript_0x9cf08: ; 0x9cf08
	writetext UnknownText_0x9d0dc
	waitbutton
	closetext
	end
; 0x9cf0e

PokefanFScript_0x9cf0e: ; 0x9cf0e
	faceplayer
	loadfont
	checkevent EVENT_GOT_TM13_SNORE_FROM_MOOMOO_FARM
	iftrue UnknownScript_0x9cf2f
	checkevent EVENT_HEALED_MOOMOO
	iftrue UnknownScript_0x9cf22
	writetext UnknownText_0x9d0f6
	waitbutton
	closetext
	end
; 0x9cf22

UnknownScript_0x9cf22: ; 0x9cf22
	writetext UnknownText_0x9d156
	buttonsound
	verbosegiveitem TM_DAZZLINGLEAM, 1
	iffalse UnknownScript_0x9cf33
	setevent EVENT_GOT_TM13_SNORE_FROM_MOOMOO_FARM
UnknownScript_0x9cf2f: ; 0x9cf2f
	writetext UnknownText_0x9d1c7
	waitbutton
UnknownScript_0x9cf33: ; 0x9cf33
	closetext
	end
; 0x9cf35

MapRoute39FarmhouseSignpost1Script: ; 0x9cf35
	jumpstd picturebookshelf
; 0x9cf38

UnknownText_0x9cf38: ; 0x9cf38
	text "My MILTANK ain't"
	line "givin' me milk"
	cont "n'more."

	para "This here FARM's"
	line "got famous milk."

	para "Most everyone"
	line "wants a drink."

	para "It'll give me lots"
	line "o' milk if'n I"

	para "feed it lots o'"
	line "ORAN BERRIES, I"
	cont "reckon."
	done
; 0x9cfe1

UnknownText_0x9cfe1: ; 0x9cfe1
	text "How'd you like my"
	line "MOOMOO MILK?"

	para "It's my pride and"
	line "joy, there."

	para "Give it to #MON"
	line "to restore HP!"

	para "I'll give it to ya"
	line "fer just ¥500."
	done
; 0x9d05d

UnknownText_0x9d05d: ; 0x9d05d
	text "Here ya go!"
	line "Drink up'n enjoy!"
	done
; 0x9d07c

UnknownText_0x9d07c: ; 0x9d07c
	text "Sorry, there."
	line "No cash, no sale!"
	done
; 0x9d09d

UnknownText_0x9d09d: ; 0x9d09d
	text "I reckon yer"
	line "PACK's full."
	done
; 0x9d0b7

UnknownText_0x9d0b7: ; 0x9d0b7
	text "You don't want it?"
	line "Come again, hear?"
	done
; 0x9d0dc

UnknownText_0x9d0dc: ; 0x9d0dc
	text "I best go do my"
	line "milkin'."
	done
; 0x9d0f6

UnknownText_0x9d0f6: ; 0x9d0f6
	text "Our milk even goes"
	line "out to KANTO."

	para "So if our own"
	line "MILTANK won't give"

	para "us any milk, we're"
	line "in trouble."
	done
; 0x9d156

UnknownText_0x9d156: ; 0x9d156
	text "Our MILTANK seem"
	line "to be doing much"
	cont "better!"

	para "Looks like we'll"
	line "have MOOMOO MILK"
	cont "again soon."

	para "Here's somethin'"
	line "fer your trouble."
	done
; 0x9d1b5

UnknownText_0x9d1b5: ; 0x9d1b5
	text "<PLAYER> received"
	line "TM13."
	done
; 0x9d1c7

UnknownText_0x9d1c7: ; 0x9d1c7
	text "That there's"
	line "DAZZLINGLEAM."

	para "It's a strong"
	line "FAIRY type attack."

	para "WHITNEY bought a"
	line "ton of 'em, and"

	para "gave them to us"
	line "for our MOOMOO."

	para "She won't mind if"
	line "if we give ya one."
	done
; 0x9d242

Route39Farmhouse_MapEventHeader: ; 0x9d242
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 2, GROUP_ROUTE_39, MAP_ROUTE_39
	warp_def $7, $3, 2, GROUP_ROUTE_39, MAP_ROUTE_39

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 1, 0, $0, MapRoute39FarmhouseSignpost1Script
	signpost 1, 1, $0, MapRoute39FarmhouseSignpost1Script

	; people-events
	db 2
	person_event SPRITE_POKEFAN_M, 6, 7, $6, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, PokefanMScript_0x9ceb4, -1
	person_event SPRITE_POKEFAN_F, 8, 9, $8, 0, 0, -1, -1, 8 + PAL_OW_BROWN, 0, 0, PokefanFScript_0x9cf0e, -1
; 0x9d276

