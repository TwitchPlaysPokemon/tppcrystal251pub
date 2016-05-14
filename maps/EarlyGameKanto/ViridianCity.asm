ViridianCityRB_MapScriptHeader: ; 0x1a9a43
	; trigger count
	db 3
	dw .Trigger0, 0
	dw .Trigger1, 0
	dw .Trigger2, 0

	; callback count
	db 0

.Trigger0
	end
.Trigger1
	end
.Trigger2
	end

ViridianCityRBAngryGrandpaTrigger:
	spriteface $0, LEFT
	scall ViridianCityRBAngryGrandpaScript
	applymovement $0, ViridianCityRB_PlayerStepsDown
	end

ViridianCityRBAngryGrandpaScript:
	loadfont
	writetext _ViridianCityText_19191
	waitbutton
	closetext
	end

ViridianCityRBGymDoorTrigger:
	spriteface $0, UP
	loadfont
	writetext _ViridianCityText14
	waitbutton
	closetext
	playsound SFX_JUMP_OVER_LEDGE
	applymovement $0, ViridianCityRB_PlayerJumpsDown
	end

ViridianCityRB_CatchingTutorial:
	faceplayer
	loadfont
	writetext _ViridianCityText_1920a
	yesorno
	iftrue .DeclineTutorial
	writetext _ViridianCityText_1920f
	waitbutton
	closetext
	loadpokedata WEEDLE, 5
	catchtutorial BATTLETYPE_TUTORIAL
	loadfont
	writetext _ViridianCityText_19219
	waitbutton
	closetext
	end

.DeclineTutorial
	writetext _ViridianCityText_19214
	waitbutton
	closetext
	end

ViridianCityRB_GirlShoppingScript:
	jumptextfaceplayer _ViridianCityText_1917a

ViridianCityRB_GirlApologyScript:
	jumptextfaceplayer _ViridianCityText_19175

ViridianCityRB_BugSpeechYoungster:
	faceplayer
	loadfont
	writetext _ViridianCityText_1914d
	yesorno
	iffalse .declined
	writetext _ViridianCityText_19157
	waitbutton
	closetext
	end

.declined
	writetext _ViridianCityText_19152
	waitbutton
	closetext
	end

ViridianCityRB_WhereIsTheLeader:
	jumptextfaceplayer _ViridianCityText_19122

ViridianCityRB_PokeballsAtWaistYoungster:
	jumptextfaceplayer _ViridianCityText1

MapViridianCityRBTownSignScript: ; 0x1a9a93
	jumptext _ViridianCityText8
; 0x1a9a96

MapViridianCityRBGymSignScript: ; 0x1a9a96
	jumptext _ViridianCityText13
; 0x1a9a99

MapViridianCityRBTrainerTips1SignScript: ; 0x1a9a99
	jumptext _ViridianCityText9
; 0x1a9a9c

MapViridianCityRBTrainerTips2SignScript: ; 0x1a9a99
	jumptext _ViridianCityText10
; 0x1a9a9c

MapViridianCityRBHiddenPotion: ; 0x1a9a9c
	dw EVENT_VIRIDIAN_CITY_RB_HIDDEN_POTION
	db POTION
; 0x1a9a9f

MapViridianCityRBPokecenterSignScript: ; 0x1a9a9f
	jumpstd pokecentersign
; 0x1a9aa2

MapViridianCityRBPokemartSignScript: ; 0x1a9aa2
	jumpstd martsign
; 0x1a9aa5

ViridianCityRB_PlayerStepsDown:
	step_down
	step_end

ViridianCityRB_PlayerJumpsDown:
	jump_step_down
	step_end

_ViridianCityText1:
	text "Those # BALLs"
	line "at your waist!"
	cont "You have #MON!"

	para "It's great that"
	line "you can carry and"
	cont "use #MON any"
	cont "time, anywhere!"
	done

_ViridianCityText_19122:
	text "This #MON GYM"
	line "is always closed."

	para "I wonder who the"
	line "LEADER is?"
	done

_ViridianCityText_1914d:
	text "You want to know"
	line "about the 2 kinds"
	cont "of caterpillar"
	cont "#MON?"
	done

_ViridianCityText_19152:
	text "Oh, OK then!"
	done

_ViridianCityText_19157:
	text "CATERPIE has no"
	line "poison, but"
	cont "WEEDLE does."

	para "Watch out for its"
	line "POISON STING!"
	done

_ViridianCityText_19175:
	text "Oh Grandpa! Don't"
	line "be so mean!"
	cont "He hasn't had his"
	cont "coffee yet."
	done

_ViridianCityText_1917a:
	text "When I go shop in"
	line "PEWTER CITY, I"
	cont "have to take the"
	cont "winding trail in"
	cont "VIRIDIAN FOREST."
	done

_ViridianCityText_19191:
	text "You can't go"
	line "through here!"

	para "This is private"
	line "property!"
	done

_ViridianCityText_1920a:
	text "Ahh, I've had my"
	line "coffee now and I"
	cont "feel great!"

	para "Sure you can go"
	line "through!"

	para "Are you in a"
	line "hurry?"
	done

_ViridianCityText_1920f:
	text "I see you're using"
	line "a #DEX."

	para "When you catch a"
	line "#MON, #DEX"
	cont "is automatically"
	cont "updated."

	para "What? Don't you"
	line "know how to catch"
	cont "#MON?"

	para "I'll show you"
	line "how to then."
	done

_ViridianCityText_19214:
	text "Time is money<...>"
	line "Go along then."
	done

_ViridianCityText_19219:
	text "First, you need"
	line "to weaken the"
	cont "target #MON."
	done

_ViridianCityText8:
	text "VIRIDIAN CITY "
	line "The Eternally"
	cont "Green Paradise"
	done

_ViridianCityText9:
	text "TRAINER TIPS"

	para "Catch #MON"
	line "and expand your"
	cont "collection!"

	para "The more you have,"
	line "the easier it is"
	cont "to fight!"
	done

_ViridianCityText10:
	text "TRAINER TIPS"

	para "The battle moves"
	line "of #MON are"
	cont "limited by their"
	cont "POWER POINTs, PP."

	para "To replenish PP,"
	line "rest your tired"
	cont "#MON at a"
	cont "#MON CENTER!"
	done

_ViridianCityText13:
	text "VIRIDIAN CITY"
	line "#MON GYM"
	done

_ViridianCityText14:
	text "The GYM's doors"
	line "are locked<...>"
	done

ViridianCityRB_MapEventHeader: ; 0x1a9ec9
	; filler
	db 0, 0

	; warps
	db 4
	warp_def  $9, $15, 1, GROUP_VIRIDIAN_NICKNAME_SPEECH_HOUSE_RB, MAP_VIRIDIAN_NICKNAME_SPEECH_HOUSE_RB
	warp_def  $f, $15, 1, GROUP_VIRIDIAN_TRAINER_SCHOOL_RB, MAP_VIRIDIAN_TRAINER_SCHOOL_RB
	warp_def $13, $1d, 2, GROUP_VIRIDIAN_MART_RB, MAP_VIRIDIAN_MART_RB
	warp_def $19, $17, 1, GROUP_VIRIDIAN_POKECENTER_1F_RB, MAP_VIRIDIAN_POKECENTER_1F_RB

	; xy triggers
	db 3
	xy_trigger 0, 6, 19, $0, ViridianCityRBAngryGrandpaTrigger, 0, 0
	xy_trigger 0, 8, 32, $0, ViridianCityRBGymDoorTrigger, 0, 0
	xy_trigger 1, 8, 32, $0, ViridianCityRBGymDoorTrigger, 0, 0

	; signposts
	db 7
	signpost 17, 17, $0, MapViridianCityRBTownSignScript
	signpost  7, 27, $0, MapViridianCityRBGymSignScript
	signpost  1, 19, $0, MapViridianCityRBTrainerTips1SignScript
	signpost 29, 21, $0, MapViridianCityRBTrainerTips2SignScript
	signpost  4, 14, $7, MapViridianCityRBHiddenPotion
	signpost 25, 24, $0, MapViridianCityRBPokecenterSignScript
	signpost 19, 30, $0, MapViridianCityRBPokemartSignScript

	; people-events
	db 8
	person_event SPRITE_SIDEWAYS_GRAMPS, 10, 22, $0, 0, 0, -1, -1, 0, 0, 0, ViridianCityRBAngryGrandpaScript, EVENT_VIRIDIAN_CITY_RB_OLD_MAN_LYING_DOWN
	person_event SPRITE_GRAMPS, 10, 22, $5, 0, 1, -1, -1, 8 + PAL_OW_BLUE, 0, 0, ViridianCityRB_CatchingTutorial, EVENT_VIRIDIAN_CITY_RB_OLD_MAN_WALKING_ABOUT
	person_event SPRITE_GRAMPS, 12, 34, $6, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, ViridianCityRB_WhereIsTheLeader, -1
	person_event SPRITE_FISHER, 27, 10, $6, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, ObjectEvent, -1
	person_event SPRITE_YOUNGSTER, 25, 21, $2, 3, 3, -1, -1, 8 + PAL_OW_GREEN, 0, 0, ViridianCityRB_PokeballsAtWaistYoungster, -1
	person_event SPRITE_YOUNGSTER, 29, 34, $2, 2, 2, -1, -1, 8 + PAL_OW_GREEN, 0, 0, ViridianCityRB_BugSpeechYoungster, -1
	person_event SPRITE_TEACHER, 10, 21, $9, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 0, 0, ViridianCityRB_GirlApologyScript, EVENT_VIRIDIAN_CITY_RB_OLD_MAN_LYING_DOWN
	person_event SPRITE_TEACHER, 13, 22, $5, 0, 1, -1, -1, 8 + PAL_OW_GREEN, 0, 0, ViridianCityRB_GirlShoppingScript, EVENT_VIRIDIAN_CITY_RB_OLD_MAN_WALKING_ABOUT
; 0x1a9f3a

