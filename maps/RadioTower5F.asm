RadioTower5F_MapScriptHeader: ; 0x60000
	; trigger count
	db 3

	; triggers
	dw UnknownScript_0x6000e, $0000
	dw UnknownScript_0x6000f, $0000
	dw UnknownScript_0x60010, $0000

	; callback count
	db 1
	dbw 1, OpenRaikouDoor
; 0x6000e

UnknownScript_0x6000e: ; 0x6000e
	end
; 0x6000f

UnknownScript_0x6000f: ; 0x6000f
	end
; 0x60010

UnknownScript_0x60010: ; 0x60010
	end
; 0x60011
OpenRaikouDoor:
	checkevent EVENT_OPENED_RAIKOU_DOOR
	iffalse .skip_door
	changeblock 3, 0, $03
.skip_door
	return

UnknownScript_0x60011: ; 0x60011
	spriteface $2, $1
	showemote $0, $2, 15
	loadfont
	writetext UnknownText_0x60128
	waitbutton
	closetext
	applymovement $2, MovementData_0x60109
	special SaveMusic
	playmusic MUSIC_ROCKET_ENCOUNTER
	loadfont
	writetext UnknownText_0x60147
	waitbutton
	closetext
	winlosstext UnknownText_0x60223, $0000
	setlasttalked $2
	loadtrainer EXECUTIVEM, 3
	startbattle
	returnafterbattle
	loadfont
	writetext UnknownText_0x60246
	buttonsound
	verbosegiveitem BASEMENT_KEY, 1
	closetext
	dotrigger $1
	setevent EVENT_BEAT_ROCKET_EXECUTIVEM_573
	end
; 0x60046

GentlemanScript_0x60046: ; 0x60046
	faceplayer
	loadfont
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue UnknownScript_0x60054
	writetext UnknownText_0x60246
	waitbutton
	closetext
	end
; 0x60054

UnknownScript_0x60054: ; 0x60054
	writetext UnknownText_0x60824
	waitbutton
	closetext
	end
; 0x6005a

TrainerExecutivef1: ; 0x6005a
	; bit/flag number
	dw $56f

	; trainer group && trainer id
	db EXECUTIVEF, 1

	; text when seen
	dw Executivef1SeenText

	; text when trainer beaten
	dw Executivef1BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw Executivef1Script
; 0x60066

Executivef1Script: ; 0x60066
	talkaftercancel
	loadfont
	writetext UnknownText_0x60358
	waitbutton
	closetext
	end
; 0x6006e

UnknownScript_0x6006e: ; 0x6006e
	applymovement $0, MovementData_0x60125
	playmusic MUSIC_ROCKET_ENCOUNTER
	spriteface $3, $3
	loadfont
	writetext UnknownText_0x603d1
	waitbutton
	closetext
	winlosstext UnknownText_0x604f3, $0000
	setlasttalked $3
	loadtrainer EXECUTIVEM, 1
	startbattle
	returnafterbattle
	loadfont
	writetext UnknownText_0x6050e
	waitbutton
	closetext
	special Special_FadeToBlack
	special Functiond91
	disappear $3
	disappear $4
	pause 15
	special Function8c0ab
	setevent EVENT_BEAT_ROCKET_EXECUTIVEF_571
	setevent EVENT_CLEARED_RADIO_TOWER
	clearflag ENGINE_BIKE_SHOP_CALL_ENABLED
	setevent EVENT_ROCKET_IN_GOLDENROD_1
	setevent EVENT_ROCKET_IN_GOLDENROD_2
	setevent EVENT_ROCKET_TAKEOVER_OF_GOLDENROD
	clearevent EVENT_MAHOGANY_MART_TRUE_OWNERS
	clearflag ENGINE_ROCKETS_IN_MAHOGANY
	clearevent EVENT_CIVILIANS_EVACUATED_GOLDENROD
	clearevent EVENT_CIVILIANS_EVACUATED_RADIO_TOWER_UPPER_FLOORS
	setevent EVENT_GUY_BLOCKING_BLACKTHORN_GYM
	clearevent EVENT_GUY_NOT_BLOCKING_BLACKTHORN_GYM
	special PlayMapMusic
	disappear $2
	moveperson $2, $c, $0
	appear $2
	applymovement $2, MovementData_0x6010f
	spriteface $0, $3
	loadfont
	writetext UnknownText_0x605b2
	buttonsound
	verbosegiveitem CLEAR_BELL, 1
	writetext UnknownText_0x6062c
	waitbutton
	closetext
	dotrigger $2
	domaptrigger GROUP_ECRUTEAK_HOUSE, MAP_ECRUTEAK_HOUSE, $0
	setevent EVENT_GOT_CLEAR_BELL
	setevent EVENT_SET_AFTER_GETTING_CLEAR_BELL
	jump UnknownScript_0x600f1
; 0x600f1

UnknownScript_0x600f1: ; 0x600f1
	applymovement $2, MovementData_0x6011a
	playsound SFX_EXIT_BUILDING
	disappear $2
	end
; 0x600fb

RockerScript_0x600fb: ; 0x600fb
	jumptextfaceplayer UnknownText_0x608be
; 0x600fe

ItemFragment_0x600fe: ; 0x600fe
	db ULTRA_BALL, 1
; 0x60100

MapRadioTower5FSignpost0Script: ; 0x60100
	dw EVENT_OPENED_RAIKOU_DOOR, .script
.script
	loadfont
	checkevent EVENT_FOUGHT_SUICUNE
	iftrue .hidden_switch
	writetext UnknownText_0x608e0
	waitbutton
	closetext
	end
.hidden_switch
	writetext SwitchBehindPosterText
	playsound SFX_PUSH_BUTTON
	waitsfx
	closetext
	changeblock 3, 0, $03
	reloadmappart
	playsound SFX_ENTER_DOOR
	waitsfx
	setevent EVENT_OPENED_RAIKOU_DOOR
	end
; 0x60103

MapRadioTower5FSignpost2Script: ; 0x60103
	jumptext UnknownText_0x608f9
; 0x60106

MapRadioTower5FSignpost4Script: ; 0x60106
	jumpstd magazinebookshelf
; 0x60109

MovementData_0x60109: ; 0x60109
	step_left
	step_left
	step_left
	step_up
	step_up
	step_end
; 0x6010f

MovementData_0x6010f: ; 0x6010f
	step_down
	step_down
	step_right
	step_right
	step_right
	step_right
	step_down
	step_down
	step_down
	step_left
	step_end
; 0x6011a

MovementData_0x6011a: ; 0x6011a
	step_right
	step_up
	step_up
	step_up
	step_left
	step_left
	step_left
	step_left
	step_up
	step_up
	step_end
; 0x60125

MovementData_0x60125: ; 0x60125
	step_left
	step_left
	step_end
; 0x60128

UnknownText_0x60128: ; 0x60128
	text "Y-you! You came to"
	line "rescue me?"
	done
; 0x60147

UnknownText_0x60147: ; 0x60147
	text "Is that what you"
	line "were expecting?"

	para "Wrong!"
	line "I'm an imposter!"

	para "I pretended to be"
	line "the real thing to"

	para "prepare for our"
	line "takeover."

	para "Do you want to"
	line "know where we hid"
	cont "the real DIRECTOR?"

	para "Sure, I'll tell"
	line "you. But only if"
	cont "you can beat me!"
	done
; 0x60223

UnknownText_0x60223: ; 0x60223
	text "OK, OK. I'll tell"
	line "you where he is."
	done
; 0x60246

UnknownText_0x60246: ; 0x60246
	text "We stashed the"
	line "real DIRECTOR in"

	para "the UNDERGROUND"
	line "WAREHOUSE."

	para "It's at the far"
	line "end of the UNDER-"
	cont "GROUND."

	para "But I doubt you'll"
	line "get that far."
	done
; 0x602cb

Executivef1SeenText: ; 0x602cb
	text "Remember me from"
	line "the HIDEOUT in"
	cont "MAHOGANY TOWN?"

	para "I lost then, but I"
	line "won't this time."

	para "I am well prepared"
	line "this time!"
	done
; 0x6031e

Executivef1BeatenText: ; 0x6031e
	text "This can't be"
	line "happening!"

	para "I fought hard, but"
	line "I still lost<...>"
	done
; 0x60358

UnknownText_0x60358: ; 0x60358
	text "<PLAYER>, isn't it?"

	para "A brat like you"
	line "won't appreciate"

	para "the magnificence"
	line "of TEAM ROCKET."

	para "That's too bad."
	line "I really admire"
	cont "your power."
	done
; 0x603d1

UnknownText_0x603d1: ; 0x603d1
	text "Oh? You managed to"
	line "get this far?"

	para "You must be quite"
	line "the trainer."

	para "We intend to take"
	line "over this RADIO"

	para "STATION and an-"
	line "nounce our come-"
	cont "back."

	para "That should bring"
	line "our boss GIOVANNI"

	para "back from his solo"
	line "training."

	para "We are going to"
	line "regain our former"
	cont "glory."

	para "I won't allow you"
	line "to interfere with"
	cont "our plans."
	done
; 0x604f3

UnknownText_0x604f3: ; 0x604f3
	text "No! Forgive me,"
	line "GIOVANNI!"
	done
; 0x6050e

UnknownText_0x6050e: ; 0x6050e
	text "How could this be?"

	para "Our dreams have"
	line "come to naught."

	para "I wasn't up to the"
	line "task after all."

	para "Like GIOVANNI did"
	line "before me, I will"

	para "disband TEAM"
	line "ROCKET here today."

	para "Farewell."
	done
; 0x605b2

UnknownText_0x605b2: ; 0x605b2
	text "DIRECTOR: <PLAY_G>,"
	line "thank you!"

	para "Your courageous"
	line "actions have saved"

	para "#MON nation-"
	line "wide."

	para "I know it's not"
	line "much, but please"
	cont "take this."
	done
; 0x6062c

UnknownText_0x6062c: ; 0x6062c
	text "There used to be a"
	line "tower right here"
	cont "in GOLDENROD CITY."

	para "But it was old and"
	line "creaky."

	para "So we replaced it"
	line "with our RADIO"
	cont "TOWER."

	para "We dug up that"
	line "bell during"
	cont "construction."

	para "I heard that all"
	line "sorts of #MON"

	para "lived in GOLDENROD"
	line "in the past."

	para "Perhaps<...>"

	para "That bell has some"
	line "connection to the"

	para "TIN TOWER in"
	line "ECRUTEAK CITY<...>"

	para "Ah!"

	para "That reminds me<...>"

	para "I overheard TEAM"
	line "ROCKET whispering."

	para "Apparently, some-"
	line "thing is going on"
	cont "at the TIN TOWER."

	para "I have no idea"
	line "what is happening,"

	para "but you might look"
	line "into it."

	para "OK, I better go to"
	line "my OFFICE."
	done
; 0x60824

UnknownText_0x60824: ; 0x60824
	text "DIRECTOR: Hello,"
	line "<PLAY_G>!"

	para "You know, I love"
	line "#MON."

	para "I built this RADIO"
	line "TOWER so I could"

	para "express my love"
	line "of #MON."

	para "It would be nice"
	line "if people enjoyed"
	cont "our programs."
	done
; 0x608be

UnknownText_0x608be: ; 0x608be
	text "BEN: Do you listen"
	line "to our music?"
	done
; 0x608e0

UnknownText_0x608e0: ; 0x608e0
	text "5F DIRECTOR'S"
	line "   OFFICE"
	done
; 0x608f9
SwitchBehindPosterText:
	text "Hey!"

	para "A switch behind"
	line "the poster!?"
	cont "Let's push it!"
	done

UnknownText_0x608f9: ; 0x608f9
	text "5F STUDIO 1"
	done
; 0x60906

RadioTower5F_MapEventHeader: ; 0x60906
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $0, $0, 1, GROUP_RADIO_TOWER_4F, MAP_RADIO_TOWER_4F
	warp_def $0, $c, 3, GROUP_RADIO_TOWER_4F, MAP_RADIO_TOWER_4F
	warp_def $0, $3, 1, GROUP_RAIKOU_ROOM, MAP_RAIKOU_ROOM

	; xy triggers
	db 2
	xy_trigger 0, $3, $0, $0, UnknownScript_0x60011, $0, $0
	xy_trigger 1, $5, $10, $0, UnknownScript_0x6006e, $0, $0

	; signposts
	db 5
	signpost 0, 3, $6, MapRadioTower5FSignpost0Script
	signpost 0, 11, $0, MapRadioTower5FSignpost2Script
	signpost 0, 15, $0, MapRadioTower5FSignpost2Script
	signpost 1, 16, $0, MapRadioTower5FSignpost4Script
	signpost 1, 17, $0, MapRadioTower5FSignpost4Script

	; people-events
	db 5
	person_event SPRITE_GENTLEMAN, 10, 7, $3, 0, 0, -1, -1, 0, 0, 0, GentlemanScript_0x60046, -1
	person_event SPRITE_ROCKET, 9, 17, $8, 0, 0, -1, -1, 0, 0, 0, ObjectEvent, EVENT_ROCKET_TAKEOVER_OF_GOLDENROD
	person_event SPRITE_ROCKET_GIRL, 6, 21, $8, 0, 0, -1, -1, 8 + PAL_OW_RED, 2, 1, TrainerExecutivef1, EVENT_ROCKET_TAKEOVER_OF_GOLDENROD
	person_event SPRITE_ROCKER, 9, 17, $8, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, RockerScript_0x600fb, EVENT_CIVILIANS_EVACUATED_RADIO_TOWER_UPPER_FLOORS
	person_event SPRITE_POKE_BALL, 9, 12, $1, 0, 0, -1, -1, 0, 1, 0, ItemFragment_0x600fe, EVENT_ITEM_RADIOTOWER_5F_ULTRA_BALL
; 0x60980

