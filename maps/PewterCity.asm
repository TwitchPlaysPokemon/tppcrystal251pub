PewterCity_MapScriptHeader: ; 0x18c000
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks

	dbw 5, .Flypoint
; 0x18c005

.Flypoint: ; 0x18c005
	setflag ENGINE_FLYPOINT_PEWTER
	disappear $7
	return

CooltrainerFScript_0x18c009: ; 0x18c009
	jumptextfaceplayer UnknownText_0x18c042
; 0x18c00c

BugCatcherScript_0x18c00c: ; 0x18c00c
	jumptextfaceplayer UnknownText_0x18c080
; 0x18c00f

GrampsScript_0x18c00f: ; 0x18c00f
	faceplayer
	loadfont
	writetext UnknownText_0x18c1aa
	waitbutton
	closetext
	end
; 0x18c023

; 0x18c029

MapPewterCitySignpost0Script: ; 0x18c029
	jumptext UnknownText_0x18c1ff
; 0x18c02c

MapPewterCitySignpost1Script: ; 0x18c02c
	jumptext UnknownText_0x18c21e
; 0x18c02f

MapPewterCitySignpost2Script:
	jumptext UnknownText_0x18c25e

MapPewterCitySignpostDoor2Script:
	jumptext MuseumDoorText

MapPewterCitySignpostDoor1Script: ; 0x18c02f
	loadfont
	writetext MuseumDoorText
	waitbutton
	closetext
	checkevent EVENT_BEAT_SIMON_6
	iftrue MapPewterCitySignpost2EndScript
	; disappear $7
	; moveperson $7, $12, $6
	appear $7
	playsound SFX_EXIT_BUILDING
	pause 20
	playsound SFX_JUMP_OVER_LEDGE
	applymovement $7, MapPewterCityMovementData1
	showemote $0, $7, 15
	pause 15
	spriteface $7, $2
	spriteface $0, $3
	playmusic MUSIC_POKEMANIAC_ENCOUNTER
	loadfont
	writetext MapPewterCitySimonText1
	waitbutton
	closetext
	applymovement $7, MapPewterCityMovementData2
	winlosstext MapPewterCitySimonLostText, $0000
	checkevent EVENT_BEAT_SIMON_5
	iftrue .HardSimon
	loadtrainer BURGLAR, SIMON_5
	jump .LoadedSimon
.HardSimon
	loadtrainer BURGLAR, SIMON_6
.LoadedSimon
	startbattle
	reloadmapmusic
	returnafterbattle
	playmusic MUSIC_POKEMANIAC_ENCOUNTER
	loadfont
	writetext MapPewterCitySimonText2
	buttonsound
	verbosegiveitem OLD_AMBER, 1
	writetext MapPewterCitySimonText3
	waitbutton
	closetext
	applymovement $7, MapPewterCityMovementData3
	spriteface $0, $0
	applymovement $7, MapPewterCityMovementData4
	spriteface $0, $2
	applymovement $7, MapPewterCityMovementData5
	disappear $7
	setevent EVENT_BEAT_SIMON_6
	special DeleteSavedMusic
	playmapmusic
MapPewterCitySignpost2EndScript:
	end

; 0x18c032

MapPewterCitySignpost3Script: ; 0x18c032
	jumptext UnknownText_0x18c2a9
; 0x18c035

MapPewterCitySignpost4Script: ; 0x18c035
	jumptext UnknownText_0x18wLinkMode
; 0x18c038

MapPewterCitySignpost5Script: ; 0x18c038
	jumpstd pokecentersign
; 0x18c03b

MapPewterCitySignpost6Script: ; 0x18c03b
	jumpstd martsign
; 0x18c03e

FruitTreeScript_0x18c03e: ; 0x18c03e
	fruittree $1c
; 0x18c040

FruitTreeScript_0x18c040: ; 0x18c040
	fruittree $1d
; 0x18c042

MapPewterCityMovementData1:
	big_step_down
	fast_jump_step_down
	step_end

MapPewterCityMovementData2:
	big_step_left
	big_step_left
	big_step_left
	step_end

MapPewterCityMovementData3:
	big_step_down
	step_end

MapPewterCityMovementData4:
	big_step_down
	big_step_left
	big_step_left
	step_end

MapPewterCityMovementData5:
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	step_end

UnknownText_0x18c042: ; 0x18c042
	text "Have you visited"
	line "PEWTER GYM?"

	para "The LEADER uses"
	line "rock-type #MON."
	done
; 0x18c080

UnknownText_0x18c080: ; 0x18c080
	text "At night, CLEFAIRY"
	line "come out to play"
	cont "at MT.MOON."

	para "But not every"
	line "night."
	done
; 0x18c0c6

MuseumDoorText:
	text "The door is"
	line "locked<...>"
	done

;UnknownText_0x18c0c6: ; 0x18c0c6
;	text "Ah, you came all"
;	line "the way out here"
;	cont "from JOHTO?"

;	para "That brings back"
;	line "memories. When I"

;	para "was young, I went"
;	line "to JOHTO to train."

;	para "You remind me so"
;	line "much of what I was"

;	para "like as a young"
;	line "man."

;	para "Here. I want you"
;	line "to have this item"
;	cont "I found in JOHTO."
;	done
; 0x18c1aa

UnknownText_0x18c1aa: ; 0x18c1aa
	text "Going to new, un-"
	line "known places and"
	cont "seeing new people<...>"

	para "Those are the joys"
	line "of travel."

	para "I remember when"
	line "PRYCE found that"
	cont "rare item<...>"

	para "Had I not stopped"
	line "I would have"
	cont "found it instead<...>"
	done
; 0x18c1ff

UnknownText_0x18c1ff: ; 0x18c1ff
	text "PEWTER CITY"
	line "A Stone Gray City"
	done
; 0x18c21e

UnknownText_0x18c21e: ; 0x18c21e
	text "PEWTER CITY"
	line "#MON GYM"
	cont "LEADER: BROCK"

	para "The Rock Solid"
	line "#MON Trainer"
	done
; 0x18c25e

UnknownText_0x18c25e: ; 0x18c25e
	text "There's a notice"
	line "here<...>"

	para "PEWTER MUSEUM OF"
	line "SCIENCE is closed"
	cont "for renovations<...>"
	done
; 0x18c2a9

UnknownText_0x18c2a9: ; 0x18c2a9
	text "There's a notice"
	line "here<...>"

	para "MT.MOON GIFT SHOP"
	line "NOW OPEN!"
	done
; 0x18wLinkMode

UnknownText_0x18wLinkMode: ; 0x18wLinkMode
	text "WELCOME TO"
	line "PEWTER CITY!"
	done
; 0x18c2f5

MapPewterCitySimonText1:
	text "You again?!"

	para "Listen, you. This"
	line "better be the last"
	cont "I see of you."

	para "Capice?"
	done

MapPewterCitySimonLostText:
	text "H-how? Why can I"
	line "never beat you?"
	done

MapPewterCitySimonText2:
	text "Arrgh!"

	para "Thanks to you, my"
	line "clean getaway is"
	cont "ruined!"

	para "Sigh<...> A loss is a"
	line "loss, though."

	para "And to the winner"
	line "go the spoils."

	para "Besides, I doubt"
	line "I'll have much use"
	cont "for this anyway."
	done

MapPewterCitySimonText3:
	text "Toodles!"
	done

PewterCity_MapEventHeader: ; 0x18c2f5
	; filler
	db 0, 0

	; warps
	db 5
	warp_def $d, $1d, 1, GROUP_PEWTER_NIDORAN_SPEECH_HOUSE, MAP_PEWTER_NIDORAN_SPEECH_HOUSE
	warp_def $11, $10, 1, GROUP_PEWTER_GYM, MAP_PEWTER_GYM
	warp_def $11, $17, 2, GROUP_PEWTER_MART, MAP_PEWTER_MART
	warp_def $19, $d, 1, GROUP_PEWTER_POKECENTER_1F, MAP_PEWTER_POKECENTER_1F
	warp_def $1d, $7, 1, GROUP_PEWTER_SNOOZE_SPEECH_HOUSE, MAP_PEWTER_SNOOZE_SPEECH_HOUSE

	; xy triggers
	db 0

	; signposts
	db 9
	signpost 23, 25, $0, MapPewterCitySignpost0Script
	signpost 17, 11, $0, MapPewterCitySignpost1Script
	signpost 9, 15, $0, MapPewterCitySignpost2Script
	signpost 19, 33, $0, MapPewterCitySignpost3Script
	signpost 29, 19, $0, MapPewterCitySignpost4Script
	signpost 25, 14, $0, MapPewterCitySignpost5Script
	signpost 17, 24, $0, MapPewterCitySignpost6Script
	signpost 7, 15, $0, MapPewterCitySignpostDoor1Script
	signpost 5, 19, $0, MapPewterCitySignpostDoor2Script

	; people-events
	db 6
	person_event SPRITE_COOLTRAINER_F, 15, 23, $2, 2, 2, -1, -1, 8 + PAL_OW_GREEN, 0, 0, CooltrainerFScript_0x18c009, -1
	person_event SPRITE_BUG_CATCHER, 33, 18, $2, 2, 2, -1, -1, 8 + PAL_OW_RED, 0, 0, BugCatcherScript_0x18c00c, -1
	person_event SPRITE_GRAMPS, 21, 33, $5, 0, 2, -1, -1, 8 + PAL_OW_BLUE, 0, 0, GrampsScript_0x18c00f, -1
	person_event SPRITE_FRUIT_TREE, 7, 36, $1, 0, 0, -1, -1, 0, 0, 0, FruitTreeScript_0x18c03e, -1
	person_event SPRITE_FRUIT_TREE, 7, 34, $1, 0, 0, -1, -1, 0, 0, 0, FruitTreeScript_0x18c040, -1
	person_event SPRITE_PHARMACIST, 9, 23, $0, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 0, 0, ObjectEvent, EVENT_SIMON_IN_PEWTER_CITY
; 0x18c378

