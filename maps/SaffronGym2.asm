sabrinawarp: MACRO
	warp_def \1, \2, 1, GROUP_SAFFRON_GYM_2, MAP_SAFFRON_GYM_2 ; center
IF \3 == -1
	warp_def \1-1, \2, 4, GROUP_SAFFRON_GYM_2, MAP_SAFFRON_GYM_2 ; top
ELSE
	warp_def \1-1, \2, (\3*5)+1, GROUP_SAFFRON_GYM_2, MAP_SAFFRON_GYM_2
ENDC
IF \4 == -1
	warp_def \1, \2-1, 4, GROUP_SAFFRON_GYM_2, MAP_SAFFRON_GYM_2 ; left
ELSE
	warp_def \1, \2-1, (\4*5)+1, GROUP_SAFFRON_GYM_2, MAP_SAFFRON_GYM_2
ENDC
IF \5 == -1
	warp_def \1, \2+1, 4, GROUP_SAFFRON_GYM_2, MAP_SAFFRON_GYM_2 ; right
ELSE
	warp_def \1, \2+1, (\5*5)+1, GROUP_SAFFRON_GYM_2, MAP_SAFFRON_GYM_2
ENDC
IF \6 == -1
	warp_def \1+1, \2, 4, GROUP_SAFFRON_GYM_2, MAP_SAFFRON_GYM_2 ; bottom
ELSE
	warp_def \1+1, \2, (\6*5)+1, GROUP_SAFFRON_GYM_2, MAP_SAFFRON_GYM_2
ENDC
ENDM

SaffronGym2_MapScriptHeader:
	; triggers
	db 0

	; callbacks
	db 0

SabrinaRematchScript:
	faceplayer
	loadfont
	checkevent EVENT_BEAT_ELM
	iftrue SabrinaPostgameRematchScript
	checkevent EVENT_SABRINA_REMATCH
	iftrue SabrinaAfterRematch
	writetext SabrinaBeforeRematchText
	waitbutton
	closetext
	winlosstext SabrinaRematchBeatenText, $0000
	loadtrainer SABRINA, 2
	startbattle
	returnafterbattle
	setevent EVENT_SABRINA_REMATCH
	loadfont

SabrinaAfterRematch:
	writetext SabrinaAfterRematchText
	waitbutton
	closetext
	end

SaffronGym2GuyScript:
	faceplayer
	loadfont
	checkevent EVENT_SABRINA_REMATCH
	iftrue .SaffronGymGuyWinScript
	writetext SaffronGym2GuyText
	waitbutton
	closetext
	end

.SaffronGymGuyWinScript
	writetext SaffronGym2GuyWinText
	waitbutton
	closetext
	end

MapSaffronGym2Signpost0Script: ; 0x189ccf
	trainertotext SABRINA, 1, $1
	jumpstd gymstatue2

SabrinaBeforeRematchText:
	text "SABRINA: I can"
	line "sense great"
	cont "ambition in you."

	para "I know this"
	line "because I train"
	cont "psychic #MON."

	para "If I go all out I"
	line "predict that you"

	para "will be defeated"
	line "easily."

	para "Let us test my"
	line "prediction and see"
	cont "if I am right."

	para "Shall we?"

	done

SabrinaRematchBeatenText:
	text "Was what I saw<...>"
	line "wrong?"
	done

SabrinaAfterRematchText:
	text "SABRINA: <...>"
	line "Your victory<...>"

	para "It's exactly as I"
	line "foresaw, actually."

	para "But I wanted to"
	line "turn that future"

	para "on its head with"
	line "my conviction as"
	cont "a trainer."

	done

SaffronGym2GuyText:
	text "Yo, CHAMP!"

	para "A trainer as"
	line "skilled as you"

	para "doesn't need to be"
	line "told how to deal"

	para "with this tele-"
	line "porter maze right?"

	para "I expect great"
	line "things from you!"

	para "Good luck!"
	done

SaffronGym2GuyWinText:
	text "That was another"
	line "fantastic battle!"
	done

SabrinaPostgameRematchScript:
    writetext SabrinaPostgameRematchText
    yesorno
    iffalse .return
    closetext
    loadtrainer SABRINA, 2
    winlosstext SabrinaPostgameBeatenText, 0
    startbattle
    returnafterbattle
    loadfont
    writetext SabrinaPostgameAfterText
    waitbutton
.return
    closetext
    end
	
SabrinaPostgameRematchText:
	text "SABRINA: <PLAYER>."

	para "I knew you would"
	line "return here."

	para "You are wishing to"
	line "battle again?"
	done
	
SabrinaPostgameBeatenText:
	text "<...>"
	
	para "I still cannot"
	line "read you clearly<...>"
	done
	
SabrinaPostgameAfterText:

	text "SABRINA: <...>I knew"
	line "the outcome of"
	cont "this battle."

	para "I simply wanted to"
	line "test my skills."
	
	para "Thank you. I hope"
	line "you return soon."
	done
	
SaffronGym2_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 5 + 12 * 5 + 1 ; 66
	warp_def $13, $6, 1, GROUP_SAFFRON_GYM_2, MAP_SAFFRON_GYM_2 ; not teh urn
	warp_def $15, $6, 2, GROUP_SAFFRON_CITY, MAP_SAFFRON_CITY ; door
	warp_def $15, $7, 2, GROUP_SAFFRON_CITY, MAP_SAFFRON_CITY ; door
	warp_def $3, $6, 1, GROUP_SAFFRON_GYM_2, MAP_SAFFRON_GYM_2 ; teh urn
	warp_def $3, $7, 1, GROUP_SAFFRON_GYM_2, MAP_SAFFRON_GYM_2 ; teh return
	; center y, x, up, left, right, down
	; -1 is teh urn
	sabrinawarp  7,  2,  8,  0,  5, -1 ;  1
	sabrinawarp  8,  5,  0,  9,  3, 11 ;  2
	sabrinawarp  7,  8, 11,  5,  0, 10 ;  3
	sabrinawarp  8, 11,  3,  5,  0,  7 ;  4
	sabrinawarp 10,  3,  0,  9, 11,  8 ;  5
	sabrinawarp 11,  6,  0, 12,  3, 10 ;  6
	sabrinawarp 10,  9,  0,  1, 10,  2 ;  7
	sabrinawarp 11, 12,  9,  0,  2, 10 ;  8
	sabrinawarp 13,  2,  2, 10,  5,  0 ;  9
	sabrinawarp 14,  5,  2,  0, 11,  8 ; 10
	sabrinawarp 13,  8,  9,  3,  0,  8 ; 11
	sabrinawarp 14, 11,  3,  5,  4,  0 ; 12
	warp_def $12, $6, 5 * 6 + 1, GROUP_SAFFRON_GYM_2, MAP_SAFFRON_GYM_2 ; teh start

	; coord events
	db 0

	; bg events
	db 2
	signpost 19, 5, $0, MapSaffronGym2Signpost0Script
	signpost 19, 8, $0, MapSaffronGym2Signpost0Script

	; object events
	db 2
	person_event SPRITE_SABRINA,  5, 10, $6, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, SabrinaRematchScript, -1
	person_event SPRITE_GYM_GUY, 23, 11, $6, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, SaffronGym2GuyScript, -1
