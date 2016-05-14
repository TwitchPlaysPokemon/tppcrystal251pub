CinnabarVolcanoLab_MapScriptHeader:
	; triggers
	db 0

	; callbacks
	db 1
	dbw 1, AlreadyGotResearchNotesCheck

AlreadyGotResearchNotesCheck:
	checkevent EVENT_GOT_RESEARCH_NOTES ;needed to prevent reclosing after using the item?
  	iftrue .dont_close_chamber
	changeblock 8, 10, $b2
.dont_close_chamber
	disappear $3
	disappear $4
	return

SimonScript2_CinnabarVolcanoB3F
	faceplayer
	loadfont
	writetext SimonText2_CinnabarVolcanoB3F
	waitbutton
	closetext
	end

PickUpResearchNotesScript:
	loadfont
	giveitem RESEARCHNOTE, 1
	iffalse .fail
	setevent EVENT_GOT_RESEARCH_NOTES
	disappear $2
	checkevent EVENT_BLUE_REMATCH
	iffalse .skip
	setevent EVENT_COOLTRAINER_BLOCKING_CERULEAN_CAVE
.skip
	writetext GotResearchNotesText
	playsound SFX_ITEM
	waitsfx
	itemnotify
	closetext
	;event here
	appear $3
	;playmusic MUSIC_POKEMANIAC_ENCOUNTER
	applymovement $3, MoveSimonToPath
	spriteface $0, UP
	applymovement $3, MoveSimonToCapsule
	spriteface $3, UP
	loadfont
	writetext SimonText1_Lab
	waitbutton
	closetext
	special Functionc48f ;fade music
	pause 16
	playsound SFX_2_BOOPS
	waitsfx
	pause 20
	playsound SFX_STRENGTH
	earthquake 10
	refreshscreen 0
	changeblock 8, 10, $b1
	reloadmappart
	waitsfx
	appear $4
	refreshscreen 0
	loadfont
	writetext Mewtwo_Lab
	cry MEWTWO
	pause 20
	closetext
	waitsfx
	showemote $0, $3, 15
	loadfont
	writetext SimonText2_Lab
	waitbutton
	closetext
	spriteface $3, RIGHT
	follow $3, $4
	playsound SFX_TACKLE
	applymovement $3, MoveSimonToLeft
	waitsfx
	applymovement $0, MovePlayerUp
	pause 20
	spriteface $3, DOWN
	loadfont
	writetext SimonText3_Lab
	waitbutton
	closetext
	playsound SFX_WARP_FROM
	applymovement $4, WarpMewtwoOut
	disappear $4
	spriteface $3, RIGHT
	showemote $0, $3, 15
	spriteface $3, LEFT
	showemote $1, $3, 15
	loadfont
	writetext SimonText4_Lab
	waitbutton
	closetext
	playmusic MUSIC_POKEMANIAC_ENCOUNTER
	spriteface $3, DOWN
	loadfont
	writetext SimonText4a_Lab
	spriteface $3, LEFT
	buttonsound
	writetext SimonText5_Lab
	spriteface $3, DOWN
	buttonsound
	writetext SimonText6_Lab
	waitbutton
	closetext
	special Functionc48f
	applymovement $3, MoveSimonOut
	disappear $3
	special DeleteSavedMusic
	special RestartMapMusic
	end

.fail
	buttonsound
	writetext TooFullForResearchNotes
	waitbutton
	closetext
	end

PickedUpNotesText:
	text "<PLAY_G> found"
	line "RESEARCH NOTES!"
	done

SimonText1_Lab:
	text "Man, it's hot down"
	line "here<...>"

	para "I wonder if<...>"
	done

Mewtwo_Lab:
	text "Mew!"
	done
	
SimonText2_Lab:
	text "AAAAAAAHHH!" ; subtle nod to a magmar we caught in AR
	done

SimonText3_Lab:
	text "What? You again!"

	para "Help me out here,"
	line "kid!"
	done

SimonText4_Lab:
	text "Is<...> is that thing"
	line "gone?"

	para "What was that?"
	done

SimonText4a_Lab:
	text "And what are YOU"
	line "doing here too?"
	
	para "Me? What am I"
	line "down here for?"
	
	para "Remember that ab-"
	line "andoned building"
	
	para "I mentioned a bit"
	line "earlier?"

	para "Well<...>"

	para "You're looking at"
	line "what's left of it<...>"

	para "I like to believe"
	line "my partner made it"

	para "out before the"
	line "volcano blew<...>"

	para "So I came back to"
	line "keep looking."
	done

SimonText5_Lab:
	
	text "I still can't find"
	line "a single trace"
	cont "of him though<...>"
	done

SimonText6_Lab:

	text "Guess I'll just"
	line "have to keep"
	cont "searching!"

	para "<PLAYER>, right?"

	para "I'll see ya around"
	line "elsewhere, bud!"
	done

GotResearchNotesText:
	text "<PLAYER> found"
	line "RESEARCHNOTE!"
	done

TooFullForResearchNotes:
	text "<PLAYER> found"
	line "RESEARCHNOTE!"

	para "But the bag is"
	line "full<...>"
	done

SimonText2_CinnabarVolcanoB3F:
	text "I want to be"
	line "alone for a while."
	done

MoveSimonToPath:
	slow_step_down
	slow_step_down
	slow_step_down
	slow_step_right
	step_end

MoveSimonToCapsule:
	slow_step_right
	step_end

MoveSimonToLeft:
	fix_facing
	step_left
	remove_fixed_facing
	step_end

MovePlayerUp:
	step_up
	step_end

MoveSimonOut:
	step_left
	step_up
	step_up
	step_up
	step_up
	step_end

WarpMewtwoOut:
	teleport_from
	step_end

CinnabarVolcanoLab_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 1
	warp_def  0, 16,  2, GROUP_CINNABAR_VOLCANO_HALLWAY, MAP_CINNABAR_VOLCANO_HALLWAY ; hallway

	; coord events
	db 0

	; bg events
	db 0

	; object events
	db 3
	person_event SPRITE_POKEDEX, 17, 11, $1, 0, 0, -1, -1, 0, 0, 0, PickUpResearchNotesScript, EVENT_GOT_RESEARCH_NOTES
	person_event SPRITE_PHARMACIST, 12, 11, $3, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 0, 0, SimonScript2_CinnabarVolcanoB3F, 0
	person_event SPRITE_MONSTER, 14, 13, $1, 0, 0, -1, -1, 0, 0, 0, ObjectEvent, 0
