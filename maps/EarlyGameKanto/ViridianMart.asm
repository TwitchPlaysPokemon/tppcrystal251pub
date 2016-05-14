ViridianMartRB_MapScriptHeader: ; 0x9b5e5
	; trigger count
	db 2
	dw .Trigger0, 0
	dw .Trigger1, 0

	; callback count
	db 0
; 0x9b5e7

.Trigger0
	priorityjump ViridianMartRB_GiveParcel
	end

.Trigger1
	end

ViridianMartRB_GiveParcel:
	spriteface $2, DOWN
	loadfont
	writetext _ViridianMartText4
	waitbutton
	closetext
	applymovement $0, ViridianMartRB_PlayerWalksUp
	spriteface $2, RIGHT
	loadfont
	writetext ViridianMartParcelQuestText
	waitbutton
	verbosegiveitem OAKS_PARCEL, 1
	closetext
	setevent EVENT_GOT_PARCEL
	dotrigger $1
	end

ViridianMartRBClerkScript: ; 0x9b5e7
	checkflag ENGINE_POKEDEX
	iffalse .sayhitooak
	loadfont
	pokemart $0, $0028
	closetext
	end
; 0x9b5ee
.sayhitooak
	jumptextfaceplayer _ViridianMartText1

ViridianMartRBYoungsterScript: ; 0x9b5ee
	jumptextfaceplayer _ViridianMartText2
; 0x9b5f1

ViridianMartRBCooltrainerMScript: ; 0x9b5f1
	jumptextfaceplayer _ViridianMartText3
; 0x9b5f4

ViridianMartRB_PlayerWalksUp:
	step_up
	step_up
	step_up
	step_up
	turn_head_left
	step_end

_ViridianMartText1:
	text "Okay! Say hi to"
	line "PROF.OAK for me!"
	done

_ViridianMartText4:
	text "Hey! You came from"
	line "PALLET TOWN?"
	done

ViridianMartParcelQuestText:
	text "You know PROF."
	line "OAK, right?"

	para "His order came in."
	line "Will you take it"
	cont "to him?"
	done

_ViridianMartText2:
	text "This shop sells"
	line "many ANTIDOTEs."
	done

_ViridianMartText3:
	text "No! POTIONs are"
	line "all sold out."
	done

ViridianMartRB_MapEventHeader: ; 0x9b657
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 3, GROUP_VIRIDIAN_CITY_RB, MAP_VIRIDIAN_CITY_RB
	warp_def $7, $3, 3, GROUP_VIRIDIAN_CITY_RB, MAP_VIRIDIAN_CITY_RB

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 3
	person_event SPRITE_CLERK, 7, 5, $9, 0, 0, -1, -1, 0, 0, 0, ViridianMartRBClerkScript, -1
	person_event SPRITE_YOUNGSTER, 6, 11, $5, 0, 2, -1, -1, 0, 0, 0, ViridianMartRBYoungsterScript, -1
	person_event SPRITE_COOLTRAINER_M, 10, 5, $7, 0, 0, -1, -1, 0, 0, 0, ViridianMartRBCooltrainerMScript, -1
; 0x9b68e

