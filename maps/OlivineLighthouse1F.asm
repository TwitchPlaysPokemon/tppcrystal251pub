OlivineLighthouse1F_MapScriptHeader: ; 0x5ae65
	; trigger count
	db 2
	dw OlivineLighthouse1F_Trigger1, $0000
	dw OlivineLighthouse1F_Trigger2, $0000

	; callback count
	db 1
	dbw 1, OlivineLighthouse1F_ElevatorDoorScript
; 0x5ae67

OlivineLighthouse1F_Trigger1:
	end

OlivineLighthouse1F_Trigger2:
	end

OlivineLighthouse1F_ElevatorDoorScript:
	checkevent EVENT_TALKED_TO_JASMINE_ABOUT_AMPHY
	iffalse OlivineLighthouse1F_ElevatorDoorScriptReturn
	changeblock 10, 1, $16
OlivineLighthouse1F_ElevatorDoorScriptReturn:
	return

OlivineLighthouse1F_BurglarSimonScript1a:
	moveperson $4, 16, 13
	appear $4
	playsound SFX_KINESIS
	applymovement $4, OlivineLighthouse1F_BurglarSimonMovement1
	playsound SFX_STRENGTH
	earthquake 15
	showemote $0, $4, 15
	pause 15
	special SaveMusic
	playmusic MUSIC_POKEMANIAC_ENCOUNTER
	spriteface $4, $2
	spriteface $0, $3
	jump OlivineLighthouse1F_BurglarSimonScript2

OlivineLighthouse1F_BurglarSimonScript1b:
	moveperson $4, 16, 13
	appear $4
	playsound SFX_KINESIS
	applymovement $4, OlivineLighthouse1F_BurglarSimonMovement1
	playsound SFX_STRENGTH
	earthquake 15
	showemote $0, $4, 15
	pause 15
	playmusic MUSIC_POKEMANIAC_ENCOUNTER
	spriteface $4, $2
	applymovement $0, OlivineLighthouse1F_PlayerMovement1
OlivineLighthouse1F_BurglarSimonScript2:
	loadfont
	writetext OlivineLighthouse1F_BurglarSimonText1
	waitbutton
	closetext
	applymovement $4, OlivineLighthouse1F_BurglarSimonMovement2
	winlosstext OlivineLighthouse1F_BurglarSimonTextLoss, $0000
	loadtrainer BURGLAR, SIMON_2
	startbattle
	reloadmapmusic
	returnafterbattle
	playmusic MUSIC_POKEMANIAC_ENCOUNTER
	loadfont
	writetext OlivineLighthouse1F_BurglarSimonText2
	buttonsound
	random 2
	if_equal 1, OlivineLighthouse1F_BurglarSimonScript_GiveSilverLeaf
	verbosegiveitem GOLD_LEAF, 1
	jump OlivineLighthouse1F_BurglarSimonScript_Terminate
OlivineLighthouse1F_BurglarSimonScript_GiveSilverLeaf:
	verbosegiveitem SILVER_LEAF, 1
OlivineLighthouse1F_BurglarSimonScript_Terminate:
	writetext OlivineLighthouse1F_BurglarSimonText3
	waitbutton
	closetext
	applymovement $4, OlivineLighthouse1F_BurglarSimonMovement3
	playsound SFX_EXIT_BUILDING
	disappear $4
	pause 15
	special DeleteSavedMusic
	playmapmusic
	setevent EVENT_BEAT_SIMON_2
	dotrigger $1
	end

OlivineLighthouse1F_BurglarSimonMovement1:
	skyfall
	step_end

OlivineLighthouse1F_PlayerMovement1:
	step_up
	turn_head_right
	step_end

OlivineLighthouse1F_BurglarSimonMovement2:
	big_step_left
	big_step_left
	big_step_down
	big_step_left
	step_end

OlivineLighthouse1F_BurglarSimonMovement3:
	big_step_down
	big_step_left
	big_step_left
	big_step_down
	big_step_down
	step_end

SailorScript_0x5ae67: ; 0x5ae67
	jumptextfaceplayer UnknownText_0x5ae6d
; 0x5ae6a

PokefanFScript_0x5ae6a: ; 0x5ae6a
	jumptextfaceplayer UnknownText_0x5aec2
; 0x5ae6d


OlivineLighthouse1F_BurglarSimonText1:
	text "Hey, I remember"
	line "you!"

	para "You did a number"
	line "on me back in"
	cont "AZALEA TOWN."
	done

OlivineLighthouse1F_BurglarSimonTextLoss:
	text "Too much!"
	done

OlivineLighthouse1F_BurglarSimonText2:
	text "While searching"
	line "for my partner,"

	para "I did some looting"
	line "solo."

	para "I'm no good at it,"
	line "though."

	para "All I've found was"
	line "this garbage."
	done

OlivineLighthouse1F_BurglarSimonText3:
	text "Au revoir!"
	done

UnknownText_0x5ae6d: ; 0x5ae6d
	text "People train at"
	line "this LIGHTHOUSE."

	para "It's not easy to"
	line "climb because of"
	cont "all the trainers."
	done
; 0x5aec2

UnknownText_0x5aec2: ; 0x5aec2
	text "In the past, #-"
	line "MON used to light"

	para "the sea around"
	line "OLIVINE at night."

	para "The LIGHTHOUSE was"
	line "made in honor of"
	cont "those #MON."
	done
; 0x5af36

OlivineLighthouse1F_MapEventHeader: ; 0x5af36
	; filler
	db 0, 0

	; warps
	db 6
	warp_def $11, $a, 9, GROUP_OLIVINE_CITY, MAP_OLIVINE_CITY
	warp_def $11, $b, 9, GROUP_OLIVINE_CITY, MAP_OLIVINE_CITY
	warp_def $b, $3, 1, GROUP_OLIVINE_LIGHTHOUSE_2F, MAP_OLIVINE_LIGHTHOUSE_2F
	warp_def $d, $10, 3, GROUP_OLIVINE_LIGHTHOUSE_2F, MAP_OLIVINE_LIGHTHOUSE_2F
	warp_def $d, $11, 4, GROUP_OLIVINE_LIGHTHOUSE_2F, MAP_OLIVINE_LIGHTHOUSE_2F
	warp_def $1, $a, 1, GROUP_OLIVINE_LIGHTHOUSE_ELEVATOR, MAP_OLIVINE_LIGHTHOUSE_ELEVATOR

	; xy triggers
	db 2
	xy_trigger 0, 14, 12, $0, OlivineLighthouse1F_BurglarSimonScript1a, $0, $0
	xy_trigger 0, 15, 12, $0, OlivineLighthouse1F_BurglarSimonScript1b, $0, $0

	; signposts
	db 0

	; people-events
	db 3
	person_event SPRITE_SAILOR, 6, 12, $6, 0, 0, -1, -1, 0, 0, 0, SailorScript_0x5ae67, -1
	person_event SPRITE_POKEFAN_F, 13, 20, $4, 2, 0, -1, -1, 0, 0, 0, PokefanFScript_0x5ae6a, -1
	person_event SPRITE_PHARMACIST, 0, 0, $0, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 0, 0, ObjectEvent, EVENT_BEAT_SIMON_2
; 0x5af6f

