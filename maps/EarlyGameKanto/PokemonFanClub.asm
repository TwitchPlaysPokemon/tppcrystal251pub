PokemonFanClubRB_MapScriptHeader: ; 0x1917e7
	; trigger count
	db 0

	; callback count
	db 0
; 0x1917e9

FanClubChairmanScriptRB: ; 0x1917e9
	faceplayer
	loadfont
	checkevent EVENT_TALKED_TO_CHAIRMAN_RB
	iftrue .talk_after
	checkevent EVENT_002_STD
	iftrue .try_again_item
	writetext FanClubMeetChairText
	yesorno
	iffalse .refused
	writetext FanClubChairStoryText
	setevent EVENT_002_STD
.show_choices
	loadmenudata .MenuDataHeader
	interpretmenu2
	writebackup
	if_equal 1, .FireStone
	if_equal 2, .WaterStone
	verbosegiveitem THUNDERSTONE, 1
	iffalse .bag_full
	jump .return_from_item
.FireStone
	verbosegiveitem FIRE_STONE, 1
	iffalse .bag_full
	jump .return_from_item
.WaterStone
	verbosegiveitem WATER_STONE
	iffalse .bag_full
.return_from_item
	writetext ExplainStoneText
	setevent EVENT_TALKED_TO_CHAIRMAN_RB
.bag_full
	waitbutton
	closetext
	end

.try_again_item
	writetext FanClubChairTryAgainItemText
	jump .show_choices

.talk_after
	writetext FanClubChairFinalText
	waitbutton
	closetext
	end

.refused
	writetext FanClubNoStoryText
	waitbutton
	closetext
	end

.MenuDataHeader: ; 0xbce54
	db $40 ; flags
	db 04, 00 ; start coords
	db 11, 15 ; end coords
	dw .MenuData2
	db 1 ; default option
; 0xbce5c

.MenuData2: ; 0xbce5c
	db $81 ; flags
	db 3 ; items
	db "FIRE STONE@"
	db "WATER STONE@"
	db "THUNDERSTONE@"
; 0xbce7f


PokemonFanClubRB_ReceptionistScript: ; 0x191821
	jumptextfaceplayer _FanClubText6
; 0x191824

PokemonFanClubRB_FisherScript: ; 0x191824
	faceplayer
	loadfont
	checkevent EVENT_000_STD
	iftrue .hmmph
	writetext PikachuFanText
	waitbutton
	closetext
	setevent EVENT_001_STD
	end
.hmmph
	writetext PikachuFanBetterText
	waitbutton
	closetext
	clearevent EVENT_000_STD
	end

PokemonFanClubRB_TeacherScript: ; 0x19186b
	faceplayer
	loadfont
	checkevent EVENT_001_STD
	iftrue .hmmph
	writetext SeelFanText
	waitbutton
	closetext
	setevent EVENT_000_STD
	end
.hmmph
	writetext SeelFanBetterText
	waitbutton
	closetext
	clearevent EVENT_001_STD
	end
; 0x19186e

PokemonFanClubRB_PikachuScript: ; 0x19186e
	loadfont
	writetext FanClubPikachuText
	cry PIKACHU
	waitbutton
	closetext
	end
; 0x191871

PokemonFanClubRB_SeelScript: ; 0x191871
	loadfont
	writetext FanClubSeelText
	cry SEEL
	waitbutton
	closetext
	end
; 0x19187b

MapPokemonFanClubRBSignpost0Script: ; 0x19187b
	jumptext _FanClubText7
; 0x19187e

MapPokemonFanClubRBSignpost1Script: ; 0x19187e
	jumptext _FanClubText8
; 0x191881

PikachuFanText:
	text "Won't you admire"
	line "my PIKACHU's"
	cont "adorable tail?"
	done

PikachuFanBetterText:
	text "Humph! My PIKACHU"
	line "is twice as cute"
	cont "as that one!"
	done

SeelFanText:
	text "I just love my"
	line "SEEL!"

	para "It squeals when I"
	line "hug it!"
	done

SeelFanBetterText:
	text "Oh dear!"

	para "My SEEL is far"
	line "more attractive!"
	done

FanClubPikachuText:
	text "PIKACHU: Chu!"
	line "Pikachu!"
	done

FanClubSeelText:
	text "SEEL: Kyuoo!"
	done

FanClubMeetChairText:
	text "I chair the"
	line "#MON Fan Club!"

	para "I have collected"
	line "over 100 #MON!"

	para "I'm very fussy"
	line "when it comes to"
	cont "#MON!"

	para "So<...>"

	para "Did you come"
	line "visit to hear"
	cont "about my #MON?"
	done

FanClubChairStoryText:
	text "Good!"
	line "Then listen up!"

	para "My favorite"
	line "RAPIDASH<...>"

	para "It<...> cute<...>"
	line "lovely<...> smart<...>"
	cont "plus<...> amazing<...>"
	cont "you think so?<...>"
	cont "oh yes<...> it<...>"
	cont "stunning<...>"
	cont "kindly<...>"
	cont "love it!"

	para "Hug it<...> when<...>"
	line "sleeping<...> warm"
	cont "and cuddly<...>"
	cont "spectacular<...>"
	cont "ravishing<...>"

	para "<...> Oops! Look at"
	line "the time! I kept"
	cont "you too long!"

	para "Thanks for hearing"
	line "me out! I want"
	cont "you to have this!"

	para "Actually, there"
	line "are three to pick"
	cont "from."

	para "Go on, choose!"
	done

ExplainStoneText:
	text "That stone has"
	line "amazing powers."

	para "Some #MON will"
	line "evolve when ex-"
	cont "posed to it."

	para "It's a valuable"
	line "asset for any"
	cont "#MON collector!"
	done

FanClubNoStoryText:
	text "Oh. Come back"
	line "when you want to"
	cont "hear my story!"
	done

FanClubChairFinalText:
	text "Hello, <PLAYER>!"

	para "Did you come see"
	line "me about my"
	cont "#MON again?"

	para "No? Too bad!"
	done

FanClubChairTryAgainItemText:
	text "Ah, <PLAYER>!"

	para "Have you made room"
	line "for my gift?"

	para "Go on, choose!"
	done

_FanClubText6:
	text "Our Chairman is"
	line "very vocal about"
	cont "#MON."
	done

_FanClubText7:
	text "Let's all listen"
	line "politely to other"
	cont "trainers!"
	done

_FanClubText8:
	text "If someone brags,"
	line "brag right back!"
	done


PokemonFanClubRB_MapEventHeader: ; 0x191e4d
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 3, GROUP_VERMILION_CITY_RB, MAP_VERMILION_CITY_RB
	warp_def $7, $3, 3, GROUP_VERMILION_CITY_RB, MAP_VERMILION_CITY_RB

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 0, 7, $0, MapPokemonFanClubRBSignpost0Script
	signpost 0, 9, $0, MapPokemonFanClubRBSignpost1Script

	; people-events
	db 6
	person_event SPRITE_GENTLEMAN, 5, 7, $6, 0, 0, -1, -1, 0, 0, 0, FanClubChairmanScriptRB, -1
	person_event SPRITE_RECEPTIONIST, 5, 8, $6, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 0, 0, PokemonFanClubRB_ReceptionistScript, -1
	person_event SPRITE_FISHER, 7, 6, $9, 0, 0, -1, -1, 0, 0, 0, PokemonFanClubRB_FisherScript, -1
	person_event SPRITE_TEACHER, 6, 11, $8, 0, 0, -1, -1, 0, 0, 0, PokemonFanClubRB_TeacherScript, -1
	person_event SPRITE_PIKACHU, 8, 6, $16, 0, 0, -1, -1, 0, 0, 0, PokemonFanClubRB_PikachuScript, -1
	person_event SPRITE_LAPRAS, 7, 11, $16, 0, 0, -1, -1, 0, 0, 0, PokemonFanClubRB_SeelScript, -1
; 0x191eb5

