TohjoFallsBackRoom_MapScriptHeader:
	db 2

	dw TohjoFallsBackRoom_Trigger1, $0000
	dw TohjoFallsBackRoom_Trigger2, $0000

	db 0

TohjoFallsBackRoom_Trigger1:
	priorityjump GiovanniScript1
	end

TohjoFallsBackRoom_Trigger2:
	end

GiovanniScript1:
	showemote $0, $2, 15
	pause 15
	spriteface $2, $0
	playmusic MUSIC_ROCKET_ENCOUNTER
	loadfont
	writetext GiovanniText1
	waitbutton
	closetext
	applymovement $2, MovementData_Giovanni1
	loadtrainer ROCKETBOSS, GIOVANNI_RB
	winlosstext GiovanniText2, GiovanniText3
	startbattle
	reloadmapmusic
	returnafterbattle
	playmusic MUSIC_ROCKET_ENCOUNTER
	loadfont
	writetext GiovanniText4
	waitbutton
	closetext
	applymovement $0, MovementData_PlayerTFBR
	applymovement $2, MovementData_Giovanni2
	playsound SFX_EXIT_BUILDING
	disappear $2
	dotrigger $1
	playmapmusic
	end

MovementData_Giovanni1:
	step_down
MovementData_Giovanni2:
	step_down
	step_end

MovementData_PlayerTFBR:
	step_left
	turn_head_right
	step_end

GiovanniText1:
	text "You<...> How did you"
	line "find me here?"

	para "Never mind that."

	para "My name is"
	line "GIOVANNI."

	para "Three months ago I"
	line "led my TEAM ROCKET"
	cont "to glory."

	para "However, I was"
	line "beaten by a mere"
	cont "child."

	para "In my embarassment"
	line "I came here to"
	cont "train in solitude."

	para "I disbanded TEAM"
	line "ROCKET on that"
	cont "day."

	para "What? You say they"
	line "were looking for"
	cont "me?"

	para "And you defeated"
	line "them again in"
	cont "JOHTO? Ha!"

	para "If that is so,"
	line "allow me to test"
	cont "my skills against"
	cont "yours."

	para "Prepare to expe-"
	line "rience a world of"
	cont "pain."
	done

GiovanniText2:
	text "WHAT?!"

	para "How could this be?"
	line "Those months of"
	cont "training<...>"

	para "Were they all for"
	line "naught?"
	done

GiovanniText3:
	text "That should teach"
	line "you not to mess"

	para "with the greatest"
	line "#MON TRAINER."
	done

GiovanniText4:
	text "Unbelievable. It"
	line "seems I am not yet"

	para "finished with my"
	line "training."

	para "I will retreat for"
	line "now."

	para "May we meet again."
	done

TohjoFallsBackRoom_MapEventHeader:
	db 0, 0

	db 1
	warp_def 5, 5, 3, GROUP_TOHJO_FALLS, MAP_TOHJO_FALLS

	db 0

	db 0

	db 1
	person_event SPRITE_GIOVANNI, 6, 9, $7, 0, 0, $ff, $ff, 0, 0, 0, ObjectEvent, EVENT_BEAT_GIOVANNI
