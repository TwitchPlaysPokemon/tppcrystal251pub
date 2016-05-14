RocketHideout1_MapScriptHeader:
	; triggers
	db 2

	dw RocketHideout1_Trigger1, $0000
	dw RocketHideout1_Trigger2, $0000

	; callbacks
	db 1
	dbw 2, RocketHideout_TurnOnLights

; <scripts go here>
RocketHideout_TurnOnLights:
	checkevent EVENT_TURNED_ON_BATTLE_TENT_GENERATOR
	iffalse .KeepLightsOff
	loadvar TimeOfDayPal, 1
.KeepLightsOff
	return

RocketHideout1_Trigger1:
	priorityjump RocketHideout1_SimonScript1
	end

RocketHideout1_Trigger2:
	end

RocketHideout1_SimonScript1:
	applymovement $2, MovementData_RocketHideout_Simon1
	playsound SFX_TACKLE
	spriteface $0, $2
	applymovement $2, MovementData_RocketHideout_Simon2
	showemote $0, $2, 15
	pause 15
	playmusic MUSIC_POKEMANIAC_ENCOUNTER
	loadfont
	writetext Text_RocketHideout_Simon1
	waitbutton
	closetext
	applymovement $2, MovementData_RocketHideout_Simon3
	winlosstext Text_RocketHideout_SimonLoss, $0000
	checkevent EVENT_BEAT_SIMON_6
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
	writetext Text_RocketHideout_Simon2
	buttonsound
	verbosegiveitem GS_BALL, 1
	writetext Text_RocketHideout_Simon3
	waitbutton
	closetext
	applymovement $0, MovementData_RocketHideout_Player1
	applymovement $2, MovementData_RocketHideout_Simon4
	playsound SFX_EXIT_BUILDING
	disappear $2
	pause 15
	special DeleteSavedMusic
	playmapmusic
	dotrigger $1
	setevent EVENT_CAN_GIVE_GS_BALL_TO_KURT
	setevent EVENT_BEAT_SIMON_5
	end


MovementData_RocketHideout_Simon1:
	big_step_up
	big_step_up
	big_step_up
	big_step_up
	big_step_up
	big_step_right
	big_step_right
	step_end

MovementData_RocketHideout_Simon2:
	fix_facing
	jump_step_left
	accelerate_last
	accelerate_last
	remove_fixed_facing
	step_end

MovementData_RocketHideout_Simon3:
	big_step_right
	big_step_right
	step_end

MovementData_RocketHideout_Player1:
	step_up
	turn_head_down
	step_end

MovementData_RocketHideout_Simon4:
	big_step_right
	step_end
; <text goes here>

Text_RocketHideout_Simon1:
	text "Wha- You again?!"

	para "Listen, can you,"
	line "like, get offa"
	cont "da stairs or"
	cont "something?"

	para "I'm in the middle"
	line "of a big heist!"
	done

Text_RocketHideout_SimonLoss:
	text "Another failure?!"
	done

Text_RocketHideout_Simon2:
	text "Aw, geez. I was"
	line "this close."

	para "But the police are"
	line "just going to beat"
	cont "me up worse."

	para "I guess this isn't"
	line "worth as much as"
	cont "a clean getaway."
	done

Text_RocketHideout_Simon3:
	text "Later!"
	done

RocketHideout1_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 2
	warp_def 6, 13, 3, GROUP_ROCKET_HIDEOUT_2, MAP_ROCKET_HIDEOUT_2 ;to b2 rocket maze stairs upper left
	warp_def 10, 27, 4, GROUP_ROCKET_HIDEOUT_2, MAP_ROCKET_HIDEOUT_2 ;to b2 rocket maze stairs lower right

	; coord events
	db 0

	; bg events
	db 0

	; object events
	db 1
	person_event SPRITE_PHARMACIST, 19, 28, $6, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 0, 0, ObjectEvent, EVENT_BEAT_SIMON_5

