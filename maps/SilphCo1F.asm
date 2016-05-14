SilphCo1F_MapScriptHeader: ; 0x18abe3
	; trigger count
	db 0

	; callback count
	db 0
; 0x18abe5

ReceptionistScript_0x18abe5: ; 0x18abe5
	jumptextfaceplayer UnknownText_0x18ac03
; 0x18abe8

OfficerScript_0x18abe8: ; 0x18abe8
	faceplayer
	loadfont
	writetext UnknownText_0x18ac36
	buttonsound
	checkmoney 0, 300000
	if_equal 2, Not300k
	yesorno
	iffalse DontBuyMasterBall
	verbosegiveitem MASTER_BALL, 1
	iffalse BagFullMasterBall
	takemoney 0, 300000
	writetext BoughtMasterBallText
	waitbutton
	closetext
	end

DontBuyMasterBall:
	writetext UnknownText_0x18aca8
	waitbutton
	closetext
	end

BagFullMasterBall
	writetext MasterBallBagFullText
	waitbutton
	closetext
	end
; 0x18ac03

Not300k:
	writetext Not300kText
	waitbutton
	closetext
	end


UnknownText_0x18ac03: ; 0x18ac03
	text "Welcome. This is"
	line "SILPH CO.'s HEAD"
	cont "OFFICE BUILDING."
	done
; 0x18ac36

UnknownText_0x18ac36: ; 0x18ac36
	text "Only employees are"
	line "permitted to go"
	cont "upstairs."

	para "But<...>"

	para "I got a few MASTER"
	line "BALLS I swiped"
	cont "off the shipment."

	para "I think I can"
	line "let one vanish"
	cont "for a<...>"
	
	para "small fee"
	line "of ", $f0, "300,000."
	done
; 0x18aca8

UnknownText_0x18aca8: ; 0x18aca8
	text "Shame<...>"
	done

BoughtMasterBallText:
	text "Pleasure doing"
	line "business with you!"

	para "Don't waste it on"
	line "a GOLDEEN!"
	done

Not300kText:
	text "No money?"
	line "Shame<...>"
	done

MasterBallBagFullText:
	text "I can't get it in"
	line "your PACK, make"
	cont "some space."
	done
; 0x18ace7

SilphCo1F_MapEventHeader: ; 0x18ace7
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 7, GROUP_SAFFRON_CITY, MAP_SAFFRON_CITY
	warp_def $7, $3, 7, GROUP_SAFFRON_CITY, MAP_SAFFRON_CITY

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 2
	person_event SPRITE_RECEPTIONIST, 6, 8, $6, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, ReceptionistScript_0x18abe5, -1
	person_event SPRITE_OFFICER, 5, 17, $6, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, OfficerScript_0x18abe8, -1
; 0x18ad11

