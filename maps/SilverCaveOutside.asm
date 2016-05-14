SilverCaveOutside_MapScriptHeader: ; 0x1b2042
	; trigger count
	db 2
	dw .Trigger0, 0
	dw .Trigger1, 0

	; callback count
	db 1

	; callbacks

	dbw 5, .Flypoint
; 0x1b2047
.Trigger0
	end
.Trigger1
	end

.Flypoint: ; 0x1b2047
	setflag ENGINE_FLYPOINT_SILVER_CAVE
	disappear $3
	return
; 0x1b204b

MtSilverRedScript:
	special Functionc48f
	appear $3
	spriteface $0, UP
	playsound SFX_EXIT_BUILDING
	follow $0, $3
	applymovement $0, Movement_SilverCaveOutside_PlayerStepsDown
	stopfollow
	loadfont
	writetext SilverCaveOutside_RedBeforeText
	waitbutton
	closetext
	setlasttalked $3
	winlosstext RedWinText, RedLossText
	loadtrainer RED, 2
	startbattle
	returnafterbattle
	loadfont
	writetext SilverCaveOutside_RedAfterText
	waitbutton
	closetext
	special Special_FadeToBlack
	special Functiond91
	disappear $3
	pause 15
	special Function8c0ab
	pause 30
	special RestartMapMusic
	dotrigger $1
	setevent EVENT_BEAT_RED
	end

SilverCaveOutsideCooltrainerMScript:
	jumptextfaceplayer SilverCaveOutsideCooltrainerMText

MapSilverCaveOutsideSignpost0Script: ; 0x1b204b
	jumpstd pokecentersign
; 0x1b204e

MapSilverCaveOutsideSignpost1Script: ; 0x1b204e
	jumptext UnknownText_0x1b2054
; 0x1b2051
Movement_SilverCaveOutside_PlayerStepsDown:
	fix_facing
	step_down
	remove_fixed_facing
	step_end

SilverCaveOutside_RedBeforeText:
SilverCaveOutside_RedAfterText:
	text $56
	line $56
	done

RedWinText:
RedLossText:
	text "start9"
	done

MapSilverCaveOutsideSignpostItem2: ; 0x1b2051
	dw $00b8
	db FULL_RESTORE

; 0x1b2054
SilverCaveOutsideCooltrainerMText:
	text "The #MON in"
	line "this cave are im-"
	cont "mensely powerful."

	para "Only true #MON"
	line "MASTERs may enter."

	para "Only the GAMEFREAK"
	line "DIRECTOR can cer-"
	cont "tify you as a"
	cont "#MON MASTER."
	done

UnknownText_0x1b2054: ; 0x1b2054
	text "MT.SILVER"
	done
; 0x1b205f

SilverCaveOutside_MapEventHeader: ; 0x1b205f
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $13, $17, 1, GROUP_SILVER_CAVE_POKECENTER_1F, MAP_SILVER_CAVE_POKECENTER_1F
	warp_def $b, $12, 1, GROUP_SILVER_CAVE_ROOM_1, MAP_SILVER_CAVE_ROOM_1

	; xy triggers
	db 1
	xy_trigger 0, 12, 18, 0, MtSilverRedScript, 0, 0

	; signposts
	db 3
	signpost 19, 24, $0, MapSilverCaveOutsideSignpost0Script
	signpost 13, 17, $0, MapSilverCaveOutsideSignpost1Script
	signpost 25, 9, $7, MapSilverCaveOutsideSignpostItem2

	; people-events
	db 2
	person_event SPRITE_COOLTRAINER_M, 16, 22, $6, 0, 0, -1, -1, 0, 0, 0, SilverCaveOutsideCooltrainerMScript, EVENT_ENABLE_DIPLOMA_PRINTING
	person_event SPRITE_RED, 15, 22, $6, 0, 0, -1, -1, 0, 0, 0, ObjectEvent, EVENT_RED_IN_FRONT_OF_MT_SILVER
; 0x1b207e

