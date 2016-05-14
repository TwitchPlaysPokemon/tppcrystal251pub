VermilionCityRB_MapScriptHeader: ; 0x1aa97a
	; trigger count
	db 3

	; triggers

	dw .Trigger0, 0
	dw .Trigger1, 0
	dw .Trigger2, 0

	db 1
	dbw 5, .Callback
.Trigger0
	end
.Trigger1
	end
.Trigger2
	end

.Callback
	checktriggers
	if_not_equal 2, .reset
	dotrigger $1
	jump .finish
.reset
	dotrigger $0
.finish
	return

VermilionCityRBSailor1Script:
	faceplayer
	loadfont
	checktriggers
	iffalse VermilionCityTicketScanContinueScript
	writetext _SSAnneWelcomeText4
	waitbutton
	closetext
	end

VermilionCityTicketScanTriggerScript:
	spriteface $0, RIGHT
	spriteface $4, LEFT
	loadfont
VermilionCityTicketScanContinueScript:
	writetext _SSAnneWelcomeText9
	buttonsound
	checkitem S_S_TICKET
	iffalse .dont_have_ticket
	writetext _SSAnneFlashedTicketText
	waitbutton
	closetext
	dotrigger 1
	end

.dont_have_ticket
	writetext _SSAnneNoTicketText
	waitbutton
	closetext
	spriteface $4, UP
	applymovement $0, Movement_VermilionPlayerStepsUp
	end

VermilionCityRBMachopScript:
	loadfont
	writetext _VermilionCityText5
	cry MACHOP
	closetext
	earthquake 30
	loadfont
	writetext _VermilionCityText14
	waitbutton
	closetext
	end

VermilionCityRBTeacherScript:
	jumptextfaceplayer _VermilionCityText1

VermilionCityRBGramps1Script:
	jumptextfaceplayer _VermilionCityText_198a7

VermilionCityRBGramps2Script:
	jumptextfaceplayer _VermilionCityText4

VermilionCityRBSailor2Script:
	jumptextfaceplayer _VermilionCityText6

VermilionCityRBPokeCenterSignScript:
	jumpstd pokecentersign

VermilionCityRBPokemartSignScript:
	jumpstd martsign

VermilionCityRBCityDescScript:
	jumptext _VermilionCityText7

VermilionCityRBFanClubSignScript:
	jumptext _VermilionCityText11

VermilionCityRBGymSignScript:
	jumptext _VermilionCityText12

VermilionCityRBPortSignScript:
	jumptext _VermilionCityText13

VermilionCityRBDiglettsCaveScript:
	jumptext _VermilionCityText15

Movement_VermilionPlayerStepsUp:
	step_up
	turn_head_down
	step_end

_VermilionCityText1:
	text "We're careful"
	line "about pollution!"

	para "We've heard GRIMER"
	line "multiplies in"
	cont "toxic sludge!"
	done

_VermilionCityText_198a7:
	text "Did you see S.S."
	line "ANNE moored in"
	cont "the harbor?"
	done

_SSAnneWelcomeText4:
	text "Welcome to S.S."
	line "ANNE!"
	done

_SSAnneWelcomeText9:
	text "Welcome to S.S."
	line "ANNE!"

	para "Excuse me, do you"
	line "have a ticket?"
	done

_SSAnneFlashedTicketText:
	text "<PLAYER> flashed"
	line "the S.S.TICKET!"

	para "Great! Welcome to"
	line "S.S.ANNE!"
	done

_SSAnneNoTicketText:
	text "<PLAYER> doesn't"
	line "have the needed"
	cont "S.S.TICKET."

	para "Sorry!"

	para "You need a ticket"
	line "to get aboard."
	done

_VermilionCityText4:
	text "I'm putting up a"
	line "building on this"
	cont "plot of land."

	para "My #MON is"
	line "tamping the land."
	done

_VermilionCityText5:
	text "MACHOP: Guoh!"
	line "Gogogoh!"
	done

_VermilionCityText14:
	text "A MACHOP is"
	line "stomping the land"
	cont "flat."
	done

_VermilionCityText6:
	text "S.S.ANNE is a"
	line "famous luxury"
	cont "cruise ship."

	para "We visit VERMILION"
	line "once a year."
	done

_VermilionCityText7:
	text "VERMILION CITY"
	line "The Port of"
	cont "Exquisite Sunsets"
	done

_VermilionCityText11:
	text "#MON FAN CLUB"
	line "All #MON fans"
	cont "welcome!"
	done

_VermilionCityText12:
	text "VERMILION CITY"
	line "#MON GYM"
	cont "LEADER: LT.SURGE"

	para "The Lightning "
	line "American!"
	done

_VermilionCityText13:
	text "VERMILION HARBOR"
	done

_VermilionCityText15:
	text "DIGLETT'S CAVE"
	done

VermilionCityRB_MapEventHeader: ; 0x1aae77
	; filler
	db 0, 0

	; warps
	db 9
	warp_def  3,  7, 1, GROUP_VERMILION_HOUSE_FISHING_SPEECH_HOUSE_RB, MAP_VERMILION_HOUSE_FISHING_SPEECH_HOUSE_RB
	warp_def  3, 11, 1, GROUP_VERMILION_POKECENTER_1F_RB, MAP_VERMILION_POKECENTER_1F_RB
	warp_def 13,  9, 1, GROUP_POKEMON_FAN_CLUB_RB, MAP_POKEMON_FAN_CLUB_RB
	warp_def 13, 15, 1, GROUP_VERMILION_MAGNET_TRAIN_SPEECH_HOUSE_RB, MAP_VERMILION_MAGNET_TRAIN_SPEECH_HOUSE_RB
	warp_def 13, 23, 2, GROUP_VERMILION_MART_RB, MAP_VERMILION_MART_RB
	warp_def 19, 23, 1, GROUP_VERMILION_HOUSE_DIGLETTS_CAVE_SPEECH_HOUSE_RB, MAP_VERMILION_HOUSE_DIGLETTS_CAVE_SPEECH_HOUSE_RB
	warp_def 31, 18, 1, GROUP_VERMILION_DOCK, MAP_VERMILION_DOCK
	warp_def 31, 19, 2, GROUP_VERMILION_DOCK, MAP_VERMILION_DOCK
	warp_def  7, 36, 1, GROUP_DIGLETTS_CAVE_RB, MAP_DIGLETTS_CAVE_RB

	; xy triggers
	db 1
	xy_trigger 0, 30, 18, $0, VermilionCityTicketScanTriggerScript, 0, 0

	; signposts
	db 7
	signpost  3, 12, $0, VermilionCityRBPokeCenterSignScript
	signpost 13, 24, $0, VermilionCityRBPokemartSignScript
	signpost  3, 27, $0, VermilionCityRBCityDescScript
	signpost 13,  7, $0, VermilionCityRBFanClubSignScript
	signpost 19,  7, $0, VermilionCityRBGymSignScript
	signpost 15, 29, $0, VermilionCityRBPortSignScript
	signpost  9, 37, $0, VermilionCityRBDiglettsCaveScript

	; people-events
	db 6
	person_event SPRITE_TEACHER, 11, 23, $2, 2, 2, -1, -1, 8 + PAL_OW_BLUE, 0, 0, VermilionCityRBTeacherScript, -1
	person_event SPRITE_GRAMPS,  10, 18, $3, 0, 0, -1, -1, 0, 0, 0, VermilionCityRBGramps1Script, -1
	person_event SPRITE_SAILOR,  34, 23, $7, 0, 0, -1, -1, 0, 0, 0, VermilionCityRBSailor1Script, -1
	person_event SPRITE_GRAMPS,  11, 34, $3, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, VermilionCityRBGramps2Script, -1
	person_event SPRITE_MACHOP,  13, 33, $16, 0, 0, -1, -1, 0, 0, 0, VermilionCityRBMachopScript, -1
	person_event SPRITE_SAILOR,  31, 29, $5, 0, 2, -1, -1, 0, 0, 0, VermilionCityRBSailor2Script, -1
; 0x1aaf25

