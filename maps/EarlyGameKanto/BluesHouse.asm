BluesHouseRB_MapScriptHeader: ; 0x19b0ce
	; trigger count
	db 0

	; callback count
	db 0
; 0x19b0d0

EGK_DaisyScript: ; 0x19b0d0
	faceplayer
	loadfont
	checkflag ENGINE_MAP_CARD
	iftrue .AfterTownMap
	checkflag ENGINE_POKEDEX
	iffalse .BeforePokedex
	writetext Text_DaisyGiveTownMap
	waitbutton
	disappear $3
	setflag ENGINE_MAP_CARD
	writetext Text_ReceivedMapCard
	playsound SFX_ITEM
	waitsfx
	writetext Text_DaisyExplainMapCard
	jump .FinishDaisy

.AfterTownMap
	writetext Text_DaisyAfterMapCard
	jump .FinishDaisy

.BeforePokedex
	writetext Text_DaisyBeforePokedex
.FinishDaisy
	waitbutton
	closetext
	spriteface $2, RIGHT
	end

TownMapScript_EGKBluesHouse:
	jumptext Text_MapCard

Text_DaisyGiveTownMap:
	text "PROF. OAK asked"
	line "you to run an"
	cont "errand for him?"

	para "Here, this will"
	line "help you!"
	done

Text_ReceivedMapCard:
	text "<PLAYER> received"
	line "the MAP CARD!"
	done

Text_DaisyExplainMapCard:
	text "Use the MAP CARD"
	line "on your #GEAR"

	para "to find out where"
	line "you are."
	done

Text_MapCard:
	text "It looks like a"
	line "CARD for the #-"
	cont "GEAR."

	para "Perhaps this will"
	line "be useful?"
	done

Text_DaisyBeforePokedex:
	text "Hi, <PLAYER>!"
	line "<GREEN> is out at"
	cont "the PROF's lab."
	done

Text_DaisyAfterMapCard:
	text "#MON are living"
	line "things!"

	para "If they get tired,"
	line "give them a rest!"
	done

BluesHouseRB_MapEventHeader: ; 0x19b3a8
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 2, GROUP_PALLET_TOWN_RB, MAP_PALLET_TOWN_RB
	warp_def $7, $3, 2, GROUP_PALLET_TOWN_RB, MAP_PALLET_TOWN_RB

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 2
	person_event SPRITE_DAISY, 7, 6, $3, 0, 0, -1, -1, 0, 0, 0, EGK_DaisyScript, -1
	person_event SPRITE_PAPER, 7, 7, $0, 0, 0, -1, -1, 0, 0, 0, TownMapScript_EGKBluesHouse, EVENT_GOT_MAP_CARD
; 0x19b3c5

