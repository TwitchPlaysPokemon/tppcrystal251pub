CeruleanTradeSpeechHouseRB_MapScriptHeader: ; 0x188131
	; trigger count
	db 0

	; callback count
	db 0
; 0x188133

CeruleanTradeSpeechHouseRBGrannyScript: ; 0x188133
	jumptextfaceplayer CeruleanTradeSpeechHouseRBGrannyText
; 0x188136

CeruleanTradeSpeechHouseRBGrampsScript: ; 0x188136
	faceplayer
	loadfont
	trade $8
	waitbutton
	closetext
	end
; 0x188139

CeruleanTradeSpeechHouseRBGrannyText: ; 0x18814d
	text "My husband likes"
	line "trading #MON."

	para "If you are a"
	line "collector, would"
	cont "you please trade"
	cont "with him?"
	done
; 0x18818a

; 0x18819c
CeruleanTradeSpeechHouseRB_MapEventHeader: ; 0x1881c9
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 2, GROUP_CERULEAN_CITY_RB, MAP_CERULEAN_CITY_RB
	warp_def $7, $3, 2, GROUP_CERULEAN_CITY_RB, MAP_CERULEAN_CITY_RB

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 2
	person_event SPRITE_GRANNY, 8, 6, $9, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, CeruleanTradeSpeechHouseRBGrannyScript, -1
	person_event SPRITE_GRAMPS, 6, 5, $2, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 0, 0, CeruleanTradeSpeechHouseRBGrampsScript, -1
; 0x18820d

