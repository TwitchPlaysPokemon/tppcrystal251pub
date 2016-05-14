RedsHouse1F_MapScriptHeader: ; 0x19ae9c
	; trigger count
	db 1

	; triggers
	dw UnknownScript_0x19aea2, $0000

	; callback count
	db 0
; 0x19aea2

UnknownScript_0x19aea2: ; 0x19aea2
	end
; 0x19aea3

RedsMomScript_0x19aea3: ; 0x19aea3
	faceplayer
	loadfont
	checkevent EVENT_MET_REDS_MOM
	iftrue UnknownScript_0x19aeb4
	writetext UnknownText_0x19aec0
	waitbutton
	closetext
	setevent EVENT_MET_REDS_MOM
	end
; 0x19aeb4

UnknownScript_0x19aeb4: ; 0x19aeb4
	writetext UnknownText_0x19af81
	waitbutton
	closetext
	end
; 0x19aeba

MapRedsHouse1FSignpost2Script: ; 0x19aeba
	jumptext UnknownText_0x19afe8
; 0x19aebd

MapRedsHouse1FSignpost1Script: ; 0x19aebd
	jumpstd picturebookshelf
; 0x19aec0

UnknownText_0x19aec0: ; 0x19aec0
	text "Hello there."

	para "AIIIAAB's been"
	line "away for a long"
	cont "time."

	para "He hasn't called"
	line "either, so I have"
	cont "no idea what he's"
	cont "up to."

	para "They say that no"
	line "news is good news,"
	cont "so I like to think"
	cont "he's safe<...>"

	para "But I always do"
	line "worry about him."
	done
; 0x19af81

UnknownText_0x19af81: ; 0x19af81
	text "Oh hello."

	para "Oh, you used to"
	line "live here?"

	para "<...>"

	para "You were on"
	line "board the S.S."
	cont "ANNE when it"
	cont "crashed?"

	para "Thank goodness"
	line "you are safe."

	para "I worry that my"
	line "son AIIIAAB might"
	cont "get into trouble"
	cont "too<...>"

	para "He never has time"
	line "to contact me,"
	cont "since he's always"
	cont "busy training."

	para "You can look"
	line "around the house"
	cont "if you want."
	done
; 0x19afe8

UnknownText_0x19afe8: ; 0x19afe8
	text "They have programs"
	line "that aren't shown"
	cont "in JOHTO<...>"
	done
; 0x19b017

RedsHouse1F_MapEventHeader: ; 0x19b017
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $7, $2, 1, GROUP_PALLET_TOWN, MAP_PALLET_TOWN
	warp_def $7, $3, 1, GROUP_PALLET_TOWN, MAP_PALLET_TOWN
	warp_def $0, $7, 1, GROUP_REDS_HOUSE_2F, MAP_REDS_HOUSE_2F

	; xy triggers
	db 0

	; signposts
	db 3
	signpost 1, 0, $0, MapRedsHouse1FSignpost1Script
	signpost 1, 1, $0, MapRedsHouse1FSignpost1Script
	signpost 1, 2, $0, MapRedsHouse1FSignpost2Script

	; people-events
	db 1
	person_event SPRITE_REDS_MOM, 7, 9, $8, 0, 0, -1, -1, 0, 0, 0, RedsMomScript_0x19aea3, -1
; 0x19b048

