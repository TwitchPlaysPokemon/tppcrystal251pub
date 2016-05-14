Route2NuggetSpeechHouseRB_MapScriptHeader: ; 0x9b845
	; trigger count
	db 0

	; callback count
	db 0
; 0x9b847

Route2NuggetSpeechHouseTradeScript:
	faceplayer
	loadfont
	trade $7
	waitbutton
	closetext
	end

Route2NuggetSpeechHouseGameboyKidScript:
	jumptextfaceplayer _Route2HouseText1

_Route2HouseText1: ; 8a7b8 (22:67b8)
	text "A fainted #MON"
	line "can't fight."

	para "But, it can still"
	line "use moves like"
	cont "CUT!"
	done


Route2NuggetSpeechHouseRB_MapEventHeader: ; 0x9b933
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 1, GROUP_ROUTE_2_RB, MAP_ROUTE_2_RB
	warp_def $7, $3, 1, GROUP_ROUTE_2_RB, MAP_ROUTE_2_RB

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 2
	person_event SPRITE_SCIENTIST, 8, 6, $9, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, Route2NuggetSpeechHouseTradeScript, -1
	person_event SPRITE_GAMEBOY_KID, 5, 8, $6, 0, 0, -1, -1, 0, 0, 0, Route2NuggetSpeechHouseGameboyKidScript, -1
; 0x9b950

