Route10North_MapScriptHeader: ; 0x1b207e
	; trigger count
	db 0

	; callback count
	db 0
	; dbw 1, ZapdosIsHereScript
; ; 0x1b2080

; ZapdosIsHereScript:
	; checkevent EVENT_RESTORED_POWER_TO_KANTO
	; iftrue YesZapdosIsHere
	; disappear $2
; YesZapdosIsHere
	; return

MapRoute10NorthSignpost0Script: ; 0x1b2080
	jumptext UnknownText_0x1b2086
; 0x1b2083

MapRoute10NorthSignpost1Script: ; 0x1b2083
	jumpstd pokecentersign
; 0x1b2086

UnknownText_0x1b2086: ; 0x1b2086
	text "KANTO POWER PLANT"
	done
; 0x1b2099

Route10North_MapEventHeader: ; 0x1b2099
	; filler
	db 0, 0

	; warps
	db 3
	warp_def 1, 9, 1, GROUP_ROUTE_10_POKECENTER_1F, MAP_ROUTE_10_POKECENTER_1F
	warp_def 17, 9, 1, GROUP_POWER_PLANT, MAP_POWER_PLANT
	warp_def 9, 8, 2, GROUP_POWERPLANTB2, MAP_POWERPLANTB2

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 19, 11, 0, MapRoute10NorthSignpost0Script
	signpost 1, 10, 0, MapRoute10NorthSignpost1Script

	; people-events
	db 0 ; 1
; 	person_event SPRITE_BIRD, 14, 8, $0, 0, 0, -1, -1, 0, 0, 0, ZapdosScript1, EVENT_FOUGHT_ZAPDOS
; 0x1b20b3


