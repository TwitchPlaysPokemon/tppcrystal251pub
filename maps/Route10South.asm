Route10South_MapScriptHeader: ; 0x1ae3f4
	; trigger count
	db 0

	; callback count
	db 0
; 0x1ae3f6

TrainerHikerJim: ; 0x1ae3f6
	; bit/flag number
	dw $534

	; trainer group && trainer id
	db HIKER, JIM

	; text when seen
	dw HikerJimSeenText

	; text when trainer beaten
	dw HikerJimBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw HikerJimScript
; 0x1ae402

HikerJimScript: ; 0x1ae402
	talkaftercancel
	loadfont
	writetext UnknownText_0x1ae43b
	waitbutton
	closetext
	end
; 0x1ae40a

TrainerPokefanmRobert: ; 0x1ae40a
	; bit/flag number
	dw $4cf

	; trainer group && trainer id
	db POKEFANM, ROBERT

	; text when seen
	dw PokefanmRobertSeenText

	; text when trainer beaten
	dw PokefanmRobertBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw PokefanmRobertScript
; 0x1ae416

PokefanmRobertScript: ; 0x1ae416
	talkaftercancel
	loadfont
	writetext UnknownText_0x1ae4a9
	waitbutton
	closetext
	end
; 0x1ae41e

MapRoute10SouthSignpost0Script: ; 0x1ae41e
	jumptext UnknownText_0x1ae4dc
; 0x1ae421

HikerJimSeenText: ; 0x1ae421
	text "Hahahah!"
	done
; 0x1ae42b

HikerJimBeatenText: ; 0x1ae42b
	text "Hahaha-hachoo!"
	done
; 0x1ae43b

UnknownText_0x1ae43b: ; 0x1ae43b
	text "Hay fever is"
	line "making me sneeze!"
	cont "Ahahah-CHOO!"
	done
; 0x1ae468

PokefanmRobertSeenText: ; 0x1ae468
	text "I picked this"
	line "#MON up when"
	cont "the #MON"
	cont "TOWER closed."
	done
; 0x1ae48a

PokefanmRobertBeatenText: ; 0x1ae48a
	text "SON: Dad, why is"
	line "Cubone so sad?"
	done
; 0x1ae4a9

UnknownText_0x1ae4a9: ; 0x1ae4a9
	text "This CUBONE has"
	line "had it rough."

	para "We are giving it"
	line "as much love"
	cont "as we can."
	done
; 0x1ae4dc

UnknownText_0x1ae4dc: ; 0x1ae4dc
	text "ROUTE 10"

	para "CERULEAN CITY -"
	line "LAVENDER TOWN"
	done
; 0x1ae504

Route10South_MapEventHeader: ; 0x1ae504
	; filler
	db 0, 0

	; warps
	db 1
	warp_def $1, $6, 2, GROUP_ROCK_TUNNEL_1F, MAP_ROCK_TUNNEL_1F

	; xy triggers
	db 0

	; signposts
	db 1
	signpost 3, 5, $0, MapRoute10SouthSignpost0Script

	; people-events
	db 2
	person_event SPRITE_POKEFAN_M, 7, 21, $8, 0, 0, -1, -1, 8 + PAL_OW_BROWN, 2, 3, TrainerHikerJim, -1
	person_event SPRITE_POKEFAN_M, 14, 12, $a, 0, 0, -1, -1, 8 + PAL_OW_RED, 2, 3, TrainerPokefanmRobert, -1
; 0x1ae52e

