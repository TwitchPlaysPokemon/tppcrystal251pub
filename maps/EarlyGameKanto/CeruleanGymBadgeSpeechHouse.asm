CeruleanGymBadgeSpeechHouseRB_MapScriptHeader: ; 0x188000
	; trigger count
	db 0

	; callback count
	db 0
; 0x188002

GymBadgeSpeechHouseRBScript: ; 0x188002
	faceplayer
	loadfont
	writetext _CeruleanHouse2Text_74e77
.loop
	buttonsound
	writetext _CeruleanHouse2Text_74e7c
	loadmenudata .MenuDataHeader
	interpretmenu2
	writebackup
	iffalse .quit
	if_equal 1, .boulder
	if_equal 2, .cascade
	if_equal 3, .thunder
	if_equal 4, .rainbow
	if_equal 5, .soul
	if_equal 6, .marsh
	if_equal 7, .volcano
	if_equal 8, .earth
.quit
	writetext _CeruleanHouse2Text_74e81
	waitbutton
	closetext
	end

.boulder
	writetext _CeruleanHouse2Text_74e96
	jump .loop
.cascade
	writetext _CeruleanHouse2Text_74e9b
	jump .loop
.thunder
	writetext _CeruleanHouse2Text_74ea0
	jump .loop
.rainbow
	writetext _CeruleanHouse2Text_74ea5
	jump .loop
.soul
	writetext _CeruleanHouse2Text_74eaa
	jump .loop
.marsh
	writetext _CeruleanHouse2Text_74eaf
	jump .loop
.volcano
	writetext _CeruleanHouse2Text_74eb4
	jump .loop
.earth
	writetext _CeruleanHouse2Text_74eb9
	jump .loop

.MenuDataHeader
	db $40 ; flags
	db 00, 00 ; start coords
	db 17, 15 ; end coords
	dw .MenuData2
	db 1 ; default option
.MenuData2
	db $a0 ; flags
	db 8
	db "BOULDERBADGE@"
	db "CASCADEBADGE@"
	db "THUNDERBADGE@"
	db "RAINBOWBADGE@"
	db "SOULBADGE@"
	db "MARSHBADGE@"
	db "VOLCANOBADGE@"
	db "EARTHBADGE@"

_CeruleanHouse2Text_74e77:
	text "#MON BADGEs"
	line "are owned only by"
	cont "skilled trainers."

	para "I see you have"
	line "at least one."

	para "Those BADGEs have"
	line "amazing secrets!"
	done

_CeruleanHouse2Text_74e7c:
	text "Now then<...>"

	para "Which of the 8"
	line "BADGEs should I"
	cont "describe?"

	para ""
	done

_CeruleanHouse2Text_74e81:
	text "Come visit me any"
	line "time you wish."
	done

_CeruleanHouse2Text_74e96:
	text "The ATTACK of all"
	line "#MON increases"
	cont "a little bit."

	para "It also lets you"
	line "use FLASH any"
	cont "time you desire."
	done

_CeruleanHouse2Text_74e9b:
	text "#MON up to L30"
	line "will obey you."

	para "Any higher, they"
	line "become unruly!"

	para "It also lets you"
	line "use CUT outside"
	cont "of battle."
	done

_CeruleanHouse2Text_74ea0:
	text "The SPEED of all"
	line "#MON increases"
	cont "a little bit."

	para "It also lets you"
	line "use FLY outside"
	cont "of battle."
	done

_CeruleanHouse2Text_74ea5:
	text "#MON up to L50"
	line "will obey you."

	para "Any higher, they"
	line "become unruly!"

	para "It also lets you"
	line "use STRENGTH out-"
	cont "side of battle."
	done

_CeruleanHouse2Text_74eaa:
	text "The DEFENSE of all"
	line "#MON increases"
	cont "a little bit."

	para "It also lets you"
	line "use SURF outside"
	cont "of battle."
	done

_CeruleanHouse2Text_74eaf:
	text "#MON up to L70"
	line "will obey you."

	para "Any higher, they"
	line "become unruly!"
	done

_CeruleanHouse2Text_74eb4:
	text "Your #MON's"
	line "SPECIAL ATTACK"
	cont "increases a bit."
	done

_CeruleanHouse2Text_74eb9:
	text "All #MON will"
	line "obey you!"
	done

CeruleanGymBadgeSpeechHouseRB_MapEventHeader: ; 0x18802b
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $7, $2, 1, GROUP_CERULEAN_CITY_RB, MAP_CERULEAN_CITY_RB
	warp_def $7, $3, 1, GROUP_CERULEAN_CITY_RB, MAP_CERULEAN_CITY_RB
	warp_def $0, $3, 6, GROUP_CERULEAN_CITY_RB, MAP_CERULEAN_CITY_RB

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_POKEFAN_M, 7, 6, $9, 0, 0, -1, -1, 0, 0, 0, GymBadgeSpeechHouseRBScript, -1
; 0x188048

