VermilionHouseDiglettsCaveSpeechHouseRB_MapScriptHeader: ; 0x19202f
	; trigger count
	db 0

	; callback count
	db 0
; 0x192031

VermilionHouseDiglettsCaveSpeechHouseRB_LassScript: ; 0x192031
	faceplayer
	loadfont
	trade $a
	waitbutton
	closetext
	end

VermilionHouseDiglettsCaveSpeechHouseRB_MapEventHeader: ; 0x192086
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 6, GROUP_VERMILION_CITY_RB, MAP_VERMILION_CITY_RB
	warp_def $7, $3, 6, GROUP_VERMILION_CITY_RB, MAP_VERMILION_CITY_RB

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_LASS, 7, 5, $4, 1, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, VermilionHouseDiglettsCaveSpeechHouseRB_LassScript, -1
; 0x1920a3

