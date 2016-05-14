SSAnne6_MapScriptHeader:
	db 0
	db 0

SSAnne6Gentleman1Script:
	checkevent EVENT_ROCKET_TAKEOVER_OF_SS_ANNE
	iftrue SSAnne6CookingUpTroubleScript
	jumptextfaceplayer _SSAnne6Text1

SSAnne6Gentleman2Script:
	checkevent EVENT_ROCKET_TAKEOVER_OF_SS_ANNE
	iftrue SSAnne6CookingUpTroubleScript
	jumptextfaceplayer _SSAnne6Text2

SSAnne6Gentleman3Script:
	checkevent EVENT_ROCKET_TAKEOVER_OF_SS_ANNE
	iftrue SSAnne6CookingUpTroubleScript
	jumptextfaceplayer _SSAnne6Text3

SSAnne6Gentleman4Script:
	checkevent EVENT_ROCKET_TAKEOVER_OF_SS_ANNE
	iftrue SSAnne6CookingUpTroubleScript
	jumptextfaceplayer _SSAnne6Text4

SSAnne6Gentleman5Script:
	checkevent EVENT_ROCKET_TAKEOVER_OF_SS_ANNE
	iftrue SSAnne6CookingUpTroubleScript
	jumptextfaceplayer _SSAnne6Text5

SSAnne6Gentleman6Script:
	checkevent EVENT_ROCKET_TAKEOVER_OF_SS_ANNE
	iftrue SSAnne6CookingUpTroubleScript
	jumptextfaceplayer _SSAnne6Text6

SSAnne6Gentleman7Script:
	checkevent EVENT_ROCKET_TAKEOVER_OF_SS_ANNE
	iftrue SSAnne6CookingUpTroubleScript
	faceplayer
	loadfont
	writetext _SSAnne6Text_61807
	buttonsound
	checkcode VAR_WEEKDAY
	if_equal SUNDAY, .zero
	if_equal MONDAY, .one
	if_equal TUESDAY, .two
	if_equal WEDNESDAY, .zero
	if_equal THURSDAY, .two
	if_equal FRIDAY, .zero
	if_equal SATURDAY, .one
.zero
	writetext _SSAnne6Text_6180c
	waitbutton
	closetext
	end
.one
	writetext _SSAnne6Text_61811
	waitbutton
	closetext
	end
.two
	writetext _SSAnne6Text_61816
	waitbutton
	closetext
	end

SSAnne6CookingUpTroubleScript:
	jumptextfaceplayer _SSAnne6Text_CookingUpTrouble

_SSAnne6Text1:
	text "You, mon petit!"
	line "We're busy here!"
	cont "Out of the way!"
	done

_SSAnne6Text2:
	text "I saw an odd ball"
	line "in the trash."
	done

_SSAnne6Text3:
	text "I'm so busy I'm"
	line "getting dizzy!"
	done

_SSAnne6Text4:
	text "Hum-de-hum-de-"
	line "ho<...>"

	para "I peel spuds"
	line "every day!"
	cont "Hum-hum<...>"
	done

_SSAnne6Text5:
	text "Did you hear about"
	line "SNORLAX?"

	para "All it does is"
	line "eat and sleep!"
	done

_SSAnne6Text6:
	text "Snivel<...> Sniff<...>"

	para "I only get to"
	line "peel onions<...>"
	cont "Snivel<...>"
	done

_SSAnne6Text_61807:
	text "Er-hem! Indeed I"
	line "am le CHEF!"

	para "Le main course is"
	done

_SSAnne6Text_6180c:
	text "Salmon du Salad!"

	para "Les guests may"
	line "gripe it's fish"
	cont "again, however!"
	done

_SSAnne6Text_61811:
	text "Eels au Barbecue!"

	para "Les guests will"
	line "mutiny, I fear."
	done

_SSAnne6Text_61816:
	text "Prime Beef Steak!"

	para "But, have I enough"
	line "fillets du beef?"
	done

_SSAnne6Text_CookingUpTrouble:
	text "Les men in noir"
	line "are cooking up"
	cont "trouble!"
	done

SSAnne6TrashcanIfSet:
	dw EVENT_S_S_ANNE_6_GREAT_BALL, SSAnne6Trashcan
SSAnne6Trashcan:
	jumpstd trashcan
SSAnne6HiddenGreatBall:
	checkevent EVENT_S_S_ANNE_6_GREAT_BALL
	iftrue SSAnne6Trashcan
	loadfont
	verbosegiveitem GREAT_BALL, 1
	setevent EVENT_S_S_ANNE_6_GREAT_BALL
	closetext
	end

SSAnne6_MapEventHeader:
	db 0, 0
	db 1
	warp_def 0, 6, 11, GROUP_S_S_ANNE_1, MAP_S_S_ANNE_1

	db 0
	db 3
	signpost 5, 13, $0, SSAnne6Trashcan
	signpost 7, 13, $0, SSAnne6Trashcan
	signpost 9, 13, $0, SSAnne6HiddenGreatBall

	db 7
	person_event SPRITE_GENTLEMAN, 12,  5, $4, 2, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, SSAnne6Gentleman1Script, -1
	person_event SPRITE_GENTLEMAN, 12,  9, $4, 2, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, SSAnne6Gentleman2Script, -1
	person_event SPRITE_GENTLEMAN, 11, 13, $4, 2, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, SSAnne6Gentleman3Script, -1
	person_event SPRITE_GENTLEMAN, 10, 17, $3, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, SSAnne6Gentleman4Script, -1
	person_event SPRITE_GENTLEMAN, 12, 17, $3, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, SSAnne6Gentleman5Script, -1
	person_event SPRITE_GENTLEMAN, 14, 17, $3, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, SSAnne6Gentleman6Script, -1
	person_event SPRITE_GENTLEMAN, 17, 15, $7, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, SSAnne6Gentleman7Script, -1
