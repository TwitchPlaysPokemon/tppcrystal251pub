elitefloorblock: MACRO
IF \1 == 0
	warp_def \2, \3, 3, GROUP_ECRUTEAK_ELITE_FLOOR, MAP_ECRUTEAK_ELITE_FLOOR
	warp_def \2, \3+1, 3, GROUP_ECRUTEAK_ELITE_FLOOR, MAP_ECRUTEAK_ELITE_FLOOR
ELSE
IF \1 == 1
	warp_def \2, \3+1, 3, GROUP_ECRUTEAK_ELITE_FLOOR, MAP_ECRUTEAK_ELITE_FLOOR
	warp_def \2+1, \3+1, 3, GROUP_ECRUTEAK_ELITE_FLOOR, MAP_ECRUTEAK_ELITE_FLOOR
ELSE
IF \1 == 2
	warp_def \2, \3, 3, GROUP_ECRUTEAK_ELITE_FLOOR, MAP_ECRUTEAK_ELITE_FLOOR
	warp_def \2+1, \3, 3, GROUP_ECRUTEAK_ELITE_FLOOR, MAP_ECRUTEAK_ELITE_FLOOR
ELSE
	warp_def \2+1, \3, 3, GROUP_ECRUTEAK_ELITE_FLOOR, MAP_ECRUTEAK_ELITE_FLOOR
	warp_def \2+1, \3+1, 3, GROUP_ECRUTEAK_ELITE_FLOOR, MAP_ECRUTEAK_ELITE_FLOOR
ENDC
ENDC
ENDC
ENDM

elitefloor: MACRO
	elitefloorblock \1, efloorrow, 2
	elitefloorblock \2, efloorrow, 4
	elitefloorblock \3, efloorrow, 6
	elitefloorblock \4, efloorrow, 8
	elitefloorblock \5, efloorrow, 10
	elitefloorblock \6, efloorrow, 12
	elitefloorblock \7, efloorrow, 14
	elitefloorblock \8, efloorrow, 16
	elitefloorblock \9, efloorrow, 18
efloorrow = efloorrow + 2
ENDM

revealefloor: MACRO
	changeblock 2, efloorrow, $40 + \1
	changeblock 4, efloorrow, $40 + \2
	changeblock 6, efloorrow, $40 + \3
	changeblock 8, efloorrow, $40 + \4
	changeblock 10, efloorrow, $40 + \5
	changeblock 12, efloorrow, $40 + \6
	changeblock 14, efloorrow, $40 + \7
	changeblock 16, efloorrow, $40 + \8
	changeblock 18, efloorrow, $40 + \9
efloorrow = efloorrow + 2
ENDM

EcruteakEliteFloor_MapScriptHeader:
	; triggers
	db 0

	; callbacks
	db 0

	dbw 1, EcruteakEliteFloorCallback

EcruteakEliteFloorCallback:
	checkevent EVENT_MORTY_REMATCH
	iffalse .no_reveal
	scall RevealWholeFloor
.no_reveal
	return

RevealWholeFloor:
efloorrow = 4
	revealefloor 0,0,3,3,2,0,0,3,1
	revealefloor 2,2,0,0,1,3,2,2,3
	revealefloor 2,0,3,0,3,3,3,2,0
	revealefloor 3,3,3,3,3,3,3,1,1
	revealefloor 2,3,3,3,3,3,3,1,1
	revealefloor 2,0,2,0,0,2,2,0,1
	revealefloor 0,2,0,1,2,2,3,2,0
	revealefloor 2,0,0,2,3,2,2,1,1
	revealefloor 2,0,0,2,0,2,2,0,1
	setevent 0
	setevent 1
	setevent 2
	setevent 3
	setevent 4
	end

MortyRematchScript2:
	faceplayer
	loadfont
	checkevent EVENT_BEAT_ELM
	iftrue MortyPostgameRematchScript
	checkevent EVENT_MORTY_REMATCH
	iftrue MortyAfterRematch2
	writetext MortyRematchTextBefore2
	waitbutton
	closetext
	winlosstext MortyRematchBeatenText2, $0000
	loadtrainer MORTY, 2
	startbattle
	returnafterbattle
	setevent EVENT_MORTY_REMATCH
	refreshscreen 0
	special Function8c084
	scall RevealWholeFloor
	reloadmappart
	special Function8c079
	loadfont
MortyAfterRematch2:
	writetext MortyAfterRematchText2
	waitbutton
	closetext
	end

Trainer_SageZeke:
	trainer EVENT_ELITE_FLOOR_ZEKE, SAGE, ZEKE_SAGE, SageZekeBeforeText, SageZekeWinText, 0, .Script
.Script
	loadfont
	writetext SageZekeText
	waitbutton
	closetext
	checkevent 0
	iftrue .finish
	playsound SFX_FLASH
	refreshscreen 0
	special Function8c084
	changeblock 2, 10, $43
	changeblock 4, 10, $43
	changeblock 6, 10, $43
	changeblock 8, 10, $43
	changeblock 10, 10, $43
	changeblock 12, 10, $43
	changeblock 2, 12, $42
	changeblock 4, 12, $43
	changeblock 6, 12, $43
	changeblock 8, 12, $43
	changeblock 10, 12, $43
	changeblock 12, 12, $43
	changeblock 2, 14, $42
	changeblock 4, 14, $40
	changeblock 6, 14, $42
	reloadmappart
	special Function8c079
.finish
	end

Trainer_MediumMartha2:
	trainer EVENT_ELITE_FLOOR_MARTHA, MEDIUM, MARTHA2, MediumMartha2BeforeText, MediumMartha2WinText, 0, .Script
.Script
	loadfont
	writetext MediumMartha2Text
	waitbutton
	closetext
	checkevent 1
	iftrue .finish
	playsound SFX_FLASH
	refreshscreen 0
	special Function8c084
	changeblock 2, 4, $40
	changeblock 4, 4, $40
	changeblock 2, 6, $42
	changeblock 4, 6, $42
	changeblock 6, 6, $40
	changeblock 8, 6, $40
	changeblock 10, 6, $41
	changeblock 2, 8, $42
	changeblock 4, 8, $40
	changeblock 6, 8, $43
	changeblock 8, 8, $40
	reloadmappart
	special Function8c079
.finish
	end

Trainer_MediumGrace2:
	trainer EVENT_ELITE_FLOOR_GRACE, MEDIUM, GRACE2, MediumGrace2BeforeText, MediumGrace2WinText, 0, .Script
.Script
	loadfont
	writetext MediumGrace2Text
	waitbutton
	closetext
	checkevent 2
	iftrue .finish
	playsound SFX_FLASH
	refreshscreen 0
	special Function8c084
	changeblock 8, 14, $40
	changeblock 10, 14, $40
	changeblock 12, 14, $42
	changeblock 14, 14, $42
	changeblock 8, 16, $41
	changeblock 10, 16, $42
	changeblock 12, 16, $42
	changeblock 14, 16, $43
	changeblock 16, 16, $42
	changeblock 18, 16, $40
	changeblock 8, 18, $42
	changeblock 10, 18, $43
	changeblock 12, 18, $42
	changeblock 14, 18, $42
	changeblock 16, 18, $41
	changeblock 18, 18, $41
	reloadmappart
	special Function8c079
.finish
	end

Trainer_SageJeffrey2:
	trainer EVENT_ELITE_FLOOR_JEFFREY, SAGE, JEFFREY2, SageJeffrey2BeforeText, SageJeffrey2WinText, 0, .Script
.Script
	loadfont
	writetext SageJeffrey2Text
	waitbutton
	closetext
	checkevent 3
	iftrue .finish
	playsound SFX_FLASH
	refreshscreen 0
	special Function8c084
	changeblock 16, 4, $43
	changeblock 18, 4, $41
	changeblock 16, 6, $42
	changeblock 18, 6, $43
	changeblock 16, 8, $42
	changeblock 18, 8, $40
	changeblock 14, 10, $43
	changeblock 16, 10, $41
	changeblock 18, 10, $41
	changeblock 14, 12, $43
	changeblock 16, 12, $41
	changeblock 18, 12, $41
	changeblock 16, 14, $40
	changeblock 18, 14, $41
	reloadmappart
	special Function8c079
	setevent 4
.finish
	end

Trainer_SagePing2:
	trainer EVENT_ELITE_FLOOR_PING, SAGE, PING2, SagePing2BeforeText, SagePing2WinText, 0, .Script
.Script
	loadfont
	writetext SagePing2Text
	waitbutton
	closetext
	checkevent 4
	iftrue .finish
	playsound SFX_FLASH
	refreshscreen 0
	special Function8c084
	changeblock 2, 16, $40
	changeblock 4, 16, $42
	changeblock 6, 16, $40
	changeblock 2, 18, $42
	changeblock 4, 18, $40
	changeblock 6, 18, $40
	changeblock 2, 20, $42
	changeblock 4, 20, $40
	changeblock 6, 20, $40
	changeblock 8, 20, $42
	changeblock 10, 20, $40
	changeblock 12, 20, $42
	changeblock 14, 20, $42
	changeblock 16, 20, $40
	changeblock 18, 20, $41
	reloadmappart
	special Function8c079
.finish
	end

EcruteakGymGuy2Script: ; 0x99e39
	faceplayer
	loadfont
	checkevent EVENT_MORTY_REMATCH
	iftrue .EcruteakGymGuyWinScript
	writetext EcruteakGymGuy2Text
	waitbutton
	closetext
	end

.EcruteakGymGuyWinScript
	writetext EcruteakGymGuy2WinText
	waitbutton
	closetext
	end

MapEcruteakGym2Signpost1Script:
	trainertotext MORTY, 1, $1
	jumpstd gymstatue2

MortyRematchTextBefore2:
	text "Welcome back,"
	line "<PLAY_G>."

	para "I see you were"
	line "able to defeat"
	cont "the ELITE FLOOR."

	para "Haha!"

	para "<...>So the legend was"
	line "true, and HO-OH"
	cont "chose you<...>"

	para "But that does not"
	line "mean that I have"

	para "lost out on my"
	line "future."

	para "Show me the power"
	line "I trained to face!"
	done

MortyRematchBeatenText2:
	text "How is this"
	line "possible<...>?"
	done

MortyAfterRematchText2:
	text "Our potentials"
	line "aren't so"
	cont "different."

	para "But you seem to"
	line "have something<...>"

	para "Something more"
	line "than that<...>"
	done

SageZekeBeforeText:
	text "I enjoy picnics."

	para "They make me feel"
	line "so good."
	done

SageZekeWinText:
	text "It's not my way?"
	done

SageZekeText:
	text "A long time ago,"
	line "I would listen to"

	para "a song that was"
	line "inspirational."

	para "I couldn't under-"
	line "stand most of the"

	para "words, but they"
	line "kept saying to"
	cont "DO YOUR BEST<...>"

	para "<...>But I can't"
	line "remember the name"

	para "of that catchy"
	line "tune."

	para "<...>Maybe it was"
	line "part of a"
	cont "compilation?"
	done

MediumMartha2BeforeText:
	text "How do I get out"
	line "of here?"
	done

MediumMartha2WinText:
	text "Aiiiyuhh!!"
	done

MediumMartha2Text:
	text "I don't know why"
	line "MORTY had the idea"

	para "to rebuild his"
	line "puzzle to be this"
	cont "hard<...>"

	para "He once heard a"
	line "story about a"

	para "TRAINER who would"
	line "always jump ledges"
	cont "on ROUTE 22."

	para "I wonder if that's"
	line "why he did this?"
	done

MediumGrace2BeforeText:
	text "Take a deep"
	line "breath, child."

	para "Let the spirits of"
	line "the departed guide"
	cont "your thoughts."
	done

MediumGrace2WinText:
	text "The voices in your"
	line "head are quite"
	cont "strong, child."
	done

MediumGrace2Text:
	text "No matter how hard"
	line "the obstacle you"
	cont "are facing is<...>"

	para "You can always"
	line "overcome it!"

	para "Stay determined!"
	done

SageJeffrey2BeforeText:
	text "Oh hello!"

	para "Sorry to tell you,"
	line "but this is the"
	cont "wrong path<...>"

	para "There's nothing"
	line "except a dead end"
	cont "behind me."
	done

SageJeffrey2WinText:
	text "Your training's on"
	line "the right path."
	done

SageJeffrey2Text:
	text "When you take a"
	line "wrong turn,"

	para "you can always"
	line "turn back and try"
	cont "again."
	done

SagePing2BeforeText:
	text "Ah-ha!"

	para "You have fallen"
	line "into my trap!"
	done

SagePing2WinText:
	text "You escaped my"
	line "trap?!"
	done

SagePing2Text:
	text "Try the other"
	line "entrance and hope"

	para "that MORTY doesn't"
	line "fool you again."
	done

EcruteakGymGuy2Text:
	text "Yo, CHAMP!"

	para "MORTY has upgraded"
	line "his floor to a"
	cont "whole new level!"

	para "He even called it"
	line "THE ELITE FLOOR<...>"

	para "I really don't"
	line "understand him"
	cont "sometimes<...>"
	done

EcruteakGymGuy2WinText:
	text "Whew, <PLAYER>."
	line "You did great!"

	para "I was cowering in"
	line "the corner out of"
	cont "pure terror!"
	done
	
MortyPostgameRematchScript:
    writetext MortyPostgameRematchText
    yesorno
    iffalse .return
    closetext
    loadtrainer MORTY, 2
    winlosstext MortyPostgameBeatenText, 0
    startbattle
    returnafterbattle
    loadfont
    writetext MortyPostgameAfterText
    waitbutton
.return
    closetext
    end
	
MortyPostgameRematchText:
	text "Ah-ha! Welcome"
	line "back!"

	para "Couldn't get"
	line "enough of my maze?"

	para "Hm? You want to"
	line "battle again?"

	done
	
MortyPostgameBeatenText:
	text "Bah!"
	
	para "Yet again, I"
	line "admit defeat."
	done
	
MortyPostgameAfterText:
	text "You're a special"
	line "trainer, that's"
	cont "for sure."
	
	para "Thank you for"
	line "that exciting"
	cont "battle!"

	done

EcruteakEliteFloor_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 9 * 9 * 2 + 3
	warp_def $19, $a, 10, GROUP_ECRUTEAK_CITY, MAP_ECRUTEAK_CITY
	warp_def $19, $b, 10, GROUP_ECRUTEAK_CITY, MAP_ECRUTEAK_CITY
	warp_def $16, $a, 4, GROUP_ECRUTEAK_ELITE_FLOOR, MAP_ECRUTEAK_ELITE_FLOOR
efloorrow = 4
	elitefloor 0,0,3,3,2,0,0,3,1
	elitefloor 2,2,0,0,1,3,2,2,3
	elitefloor 2,0,3,0,3,3,3,2,0
	elitefloor 3,3,3,3,3,3,3,1,1
	elitefloor 2,3,3,3,3,3,3,1,1
	elitefloor 2,0,2,0,0,2,2,0,1
	elitefloor 0,2,0,1,2,2,3,2,0
	elitefloor 2,0,0,2,3,2,2,1,1
	elitefloor 2,0,0,2,0,2,2,0,1

	; coord events
	db 0

	; bg events
	db 2
	signpost $17, $9, $0, MapEcruteakGym2Signpost1Script
	signpost $17, $c, $0, MapEcruteakGym2Signpost1Script

	; object events
	db 7
	person_event SPRITE_MORTY, 5, 15, $6, 0, 0, -1, -1, 8 + PAL_OW_BROWN, 0, 0, MortyRematchScript2, -1
	person_event SPRITE_GYM_GUY, 27, 17, $6, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, EcruteakGymGuy2Script, -1
	person_event SPRITE_SAGE, 12, 22, $6, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 2, 1, Trainer_SageJeffrey2, -1
	person_event SPRITE_SAGE, 21, 6, $9, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 2, 1, Trainer_SagePing2, -1
	person_event SPRITE_GRANNY, 11, 15, $6, 0, 0, -1, -1, 8 + PAL_OW_BROWN, 2, 1, Trainer_MediumMartha2, -1
	person_event SPRITE_GRANNY, 19, 18, $6, 0, 0, -1, -1, 8 + PAL_OW_BROWN, 2, 1, Trainer_MediumGrace2, -1
	person_event SPRITE_GRAMPS, 15, 7, $6, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 2, 1, Trainer_SageZeke, -1
