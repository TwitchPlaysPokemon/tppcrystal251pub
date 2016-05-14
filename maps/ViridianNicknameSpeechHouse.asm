ViridianNicknameSpeechHouse_MapScriptHeader: ; 0x9ae38
	; trigger count
	db 0

	; callback count
	db 0
; 0x9ae3a

PokefanMScript_0x9ae3a: ; 0x9ae3a
	jumptextfaceplayer UnknownText_0x9ae54
; 0x9ae3d

LassScript_0x9ae3d: ; 0x9ae3d
	jumptextfaceplayer UnknownText_0x9aecb
; 0x9ae40

MoltresScript_0x9ae40: ; 0x9ae40
	loadfont
	writetext UnknownText_0x9aefe
	cry SPEAROW
	waitbutton
	closetext
	end
; 0x9ae4a

GrowlitheScript_0x9ae4a: ; 0x9ae4a
	loadfont
	writetext UnknownText_0x9af10
	cry RATTATA
	waitbutton
	closetext
	end
; 0x9ae54

UnknownText_0x9ae54: ; 0x9ae54
	text "Do you put much"
	line "thought into"

	para "naming your"
	line "#MON?"

	para "Having good"
	line "nicknames adds to"

	para "the fun of trading"
	line "#MON."
	done
; 0x9aecb

UnknownText_0x9aecb: ; 0x9aecb
	text "They're SPEARY--"
	line "a SPEAROW--and"
	cont "RATTEY--a RATTATA."
	done
; 0x9aefe

UnknownText_0x9aefe: ; 0x9aefe
	text "SPEARY: Ch-chun!"
	done
; 0x9af10

UnknownText_0x9af10: ; 0x9af10
	text "RATTEY: Kikiii!"
	done
; 0x9af21

ViridianNicknameSpeechHouse_MapEventHeader: ; 0x9af21
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 2, GROUP_VIRIDIAN_CITY, MAP_VIRIDIAN_CITY
	warp_def $7, $3, 2, GROUP_VIRIDIAN_CITY, MAP_VIRIDIAN_CITY

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 4
	person_event SPRITE_POKEFAN_M, 8, 6, $9, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, PokefanMScript_0x9ae3a, -1
	person_event SPRITE_LASS, 8, 9, $7, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 0, 0, LassScript_0x9ae3d, -1
	person_event SPRITE_SPEAROW, 6, 9, $16, 0, 2, -1, -1, 8 + PAL_OW_BROWN, 0, 0, MoltresScript_0x9ae40, -1
	person_event SPRITE_GROWLITHE, 7, 10, $16, 0, 2, -1, -1, 8 + PAL_OW_BLUE, 0, 0, GrowlitheScript_0x9ae4a, -1
; 0x9af65

