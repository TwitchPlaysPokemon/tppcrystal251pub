CeruleanGym_MapScriptHeader: ; 0x1883cf
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x1883d9, $0000
	dw UnknownScript_0x1883da, $0000

	; callback count
	db 0
; 0x1883d9

UnknownScript_0x1883d9: ; 0x1883d9
	end
; 0x1883da

UnknownScript_0x1883da: ; 0x1883da
	priorityjump UnknownScript_0x1883de
	end
; 0x1883de

UnknownScript_0x1883de: ; 0x1883de
	applymovement $2, MovementData_0x1884e3
	playsound SFX_TACKLE
	applymovement $2, MovementData_0x1884eb
	playmusic MUSIC_ROCKET_ENCOUNTER
	loadfont
	writetext UnknownText_0x1884fb
	waitbutton
	closetext
	showemote $0, $2, 15
	applymovement $2, MovementData_0x1884f7
	loadfont
	writetext UnknownText_0x188574
	waitbutton
	closetext
	applymovement $2, MovementData_0x1884f5
	loadfont
	writetext UnknownText_0x1885a5
	waitbutton
	closetext
	applymovement $2, MovementData_0x1884e8
	playsound SFX_EXIT_BUILDING
	disappear $2
	setevent EVENT_MET_ROCKET_GRUNT_AT_CERULEAN_GYM
	clearevent EVENT_ROCKET_ON_ROUTE_24
	clearevent EVENT_MISTY_AND_HER_DATE_ON_CERULEAN_CAPE
	dotrigger $0
	domaptrigger GROUP_ROUTE_25, MAP_ROUTE_25, $1
	domaptrigger GROUP_POWER_PLANT, MAP_POWER_PLANT, $0
	waitsfx
	special RestartMapMusic
	pause 15
	spriteface $0, $0
	pause 15
	end
; 0x188432
;
MistyScript_0x188432: ; 0x188432
	faceplayer
	loadfont
	checkevent EVENT_BEAT_ELM
	iftrue MistyPostgameRematchScript
	checkevent EVENT_MISTY_REMATCH
	iftrue MistyAfterRematch
	checkevent EVENT_SET_BY_OAK_AFTER_16_BADGES
	iftrue MistyRematchScript
	checkflag ENGINE_CASCADEBADGE
	iftrue UnknownScript_0x188460
	writetext UnknownText_0x188674
	waitbutton
	checkevent EVENT_BEAT_MISTY_RB
	iftrue MistySecondScript
	writetext TextBranchFirstMisty
	waitbutton
	closetext
MistyFight:
	winlosstext UnknownText_0x18870c, $0000
	loadtrainer MISTY, 1
	startbattle
	returnafterbattle
	setevent EVENT_BEAT_MISTY
	setevent EVENT_BEAT_SWIMMERF_DIANA
	setevent EVENT_BEAT_SWIMMERF_BRIANA
	setevent EVENT_BEAT_SWIMMERM_PARKER
	loadfont
	writetext UnknownText_0x188768
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_CASCADEBADGE
	checkevent EVENT_BEAT_MISTY_RB
	iffalse GiveRainBranch
UnknownScript_0x188460: ; 0x188460
	writetext UnknownText_0x188782
	waitbutton
	closetext
	end

MistySecondScript:
	writetext TextBranchSecondMisty
	waitbutton
	closetext
	jump MistyFight

MistyRematchScript:
	writetext MistyRematchTextBefore
	waitbutton
	closetext
	winlosstext MistyRematchBeatenText, $0000
	loadtrainer MISTY, 2
	startbattle
	returnafterbattle
	setevent EVENT_MISTY_REMATCH
	loadfont
	jump MistyAfterRematch
; 0x188466

MistyAfterRematch:
	writetext MistyAfterRematchText
	waitbutton
	closetext
	end

MistyRematchTextBefore:
	text "MISTY: My dream"
	line "was to go on a"
	
	para "great journey"
	line "and battle power-"
	cont "ful trainers."

	para "I made my dream"
	line "come true."

	para "And now<...>"

	para "My next dream is"
	line "to defeat you!"
	done

MistyRematchBeatenText:
	text "First my date,"
	line "now my dreams<...>"
	done

MistyAfterRematchText:
	text "MISTY: I guess"
	line "you are really"
	cont "strong<...>"

	para "I'll admit<...>"
	line "you've got skills."
	done

GiveRainBranch:
	writetext MistyBeforeRainDance
	verbosegiveitem TM_RAIN_DANCE, 1
	writetext MistyAfterRainDance
	waitbutton
	closetext
	end
	
TrainerSwimmerfDiana: ; 0x188466
	; bit/flag number
	dw $3f9

	; trainer group && trainer id
	db SWIMMERF, DIANA

	; text when seen
	dw SwimmerfDianaSeenText

	; text when trainer beaten
	dw SwimmerfDianaBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SwimmerfDianaScript
; 0x188472

SwimmerfDianaScript: ; 0x188472
	talkaftercancel
	loadfont
	writetext UnknownText_0x188856
	waitbutton
	closetext
	end
; 0x18847a

TrainerSwimmerfBriana: ; 0x18847a
	; bit/flag number
	dw $3fa

	; trainer group && trainer id
	db SWIMMERF, BRIANA

	; text when seen
	dw SwimmerfBrianaSeenText

	; text when trainer beaten
	dw SwimmerfBrianaBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SwimmerfBrianaScript
; 0x188486

SwimmerfBrianaScript: ; 0x188486
	talkaftercancel
	loadfont
	writetext UnknownText_0x1888c0
	waitbutton
	closetext
	end
; 0x18848e

TrainerSwimmermParker: ; 0x18848e
	; bit/flag number
	dw $5a8

	; trainer group && trainer id
	db SWIMMERM, PARKER

	; text when seen
	dw SwimmermParkerSeenText

	; text when trainer beaten
	dw SwimmermParkerBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SwimmermParkerScript
; 0x18849a

SwimmermParkerScript: ; 0x18849a
	talkaftercancel
	loadfont
	writetext UnknownText_0x188943
	waitbutton
	closetext
	end
; 0x1884a2

CeruleanGymGuyScript: ; 0x1884a2
	faceplayer
	loadfont
	checkevent EVENT_BEAT_MISTY
	iftrue .CeruleanGymGuyWinScript
	writetext CeruleanGymGuyText
	waitbutton
	closetext
	end

.CeruleanGymGuyWinScript
	writetext CeruleanGymGuyWinText
	waitbutton
	closetext
	end
; 0x1884b6

MapCeruleanGymSignpostItem0: ; 0x1884b6
	dw $00fb
	db MACHINE_PART

; 0x1884b9

MapCeruleanGymSignpost1Script: ; 0x1884b9
	checkevent EVENT_CERULEAN_GYM_POPULATION
	iffalse UnknownScript_0x1884d3
	loadfont
	writetext UnknownText_0x188610
	waitbutton
	closetext
	end
; 0x1884c6

MapCeruleanGymSignpost2Script: ; 0x1884c6
	checkevent EVENT_CERULEAN_GYM_POPULATION
	iffalse UnknownScript_0x1884d3
	loadfont
	writetext UnknownText_0x188642
	waitbutton
	closetext
	end
; 0x1884d3

UnknownScript_0x1884d3: ; 0x1884d3
	trainertotext MISTY, 1, $1
	checkflag ENGINE_CASCADEBADGE
	iftrue UnknownScript_0x1884dc
	jumpstd gymstatue1
; 0x1884dc

UnknownScript_0x1884dc: ; 0x1884dc
	jumpstd gymstatue2
; 0x1884e3

MovementData_0x1884e3: ; 0x1884e3
	big_step_down
	big_step_down
	big_step_down
	big_step_down
	step_end
; 0x1884e8

MovementData_0x1884e8: ; 0x1884e8
	big_step_right
	big_step_down
	step_end
; 0x1884eb

MovementData_0x1884eb: ; 0x1884eb
	fix_facing
	db $39 ; movement
	jump_step_up
	db $38 ; movement
	remove_fixed_facing
	accelerate_last
	accelerate_last
	step_down
	step_down
	step_end
; 0x1884f5

MovementData_0x1884f5: ; 0x1884f5
	big_step_down
	step_end
; 0x1884f7

MovementData_0x1884f7: ; 0x1884f7
	fix_facing
	slow_step_up
	remove_fixed_facing
	step_end
; 0x1884fb

UnknownText_0x1884fb: ; 0x1884fb
	text "Oops! I so sorry!"
	line "You not hurt,"
	cont "okay?"

	para "I very busy."
	line "No time for talk-"
	cont "ing with you. Not"
	cont "good for me if"
	cont "seen by somebody."
	done
; 0x188574

UnknownText_0x188574: ; 0x188574
	text "Oh no! You seen"
	line "me already! I make"
	cont "big mistake!"
	done
; 0x1885a5

UnknownText_0x1885a5: ; 0x1885a5
	text "Hey, you! Forget"
	line "you see me, okay?"

	para "You see, hear,"
	line "know nothing,"

	para "okay?"
	line "Bye, kid! Nothing!"

	para "Bye-bye a go-go!"
	done
; 0x188610

UnknownText_0x188610: ; 0x188610
	text "Sorry, I'll be out"
	line "for a while."
	cont "MISTY, GYM LEADER"
	done
; 0x188642

UnknownText_0x188642: ; 0x188642
	text "Since MISTY's out,"
	line "we'll be away too."
	cont "GYM TRAINERS"
	done
; 0x188674

UnknownText_0x188674: ; 0x188674
	text "MISTY: I was ex-"
	line "pecting you, you"
	cont "pest!"

	para "You may have a"
	line "lot of JOHTO GYM"

	para "BADGES, but you'd"
	line "better not take me"
	cont "too lightly."
	done

TextBranchFirstMisty
	text "My water-type"
	line "#MON are tough!"
	done

TextBranchSecondMisty:
	text "What's that? Your"
	line "badges were"
	cont "stolen?"

	para "If you want"
	line "another, you'll"
	cont "have to earn it!"
	done

; 0x18870c

UnknownText_0x18870c: ; 0x18870c
	text "MISTY: You really"
	line "are good<...>"

	para "I'll admit that"
	line "you are skilled<...>"

	para "Here you go. It's"
	line "CASCADEBADGE."
	done
; 0x188768

UnknownText_0x188768: ; 0x188768
	text "<PLAYER> received"
	line "CASCADEBADGE."
	done
; 0x188782

MistyBeforeRainDance:
	text "MISTY: Here is"
	line "another memento"
	cont "from this battle."

	para "Take it!"

	done

MistyAfterRainDance:
	text "It contains the"
	line "move RAIN DANCE."

	para "It powers up"
	line "water moves."

	para "I'm sure you have"
	line "a good use for it."
	done

UnknownText_0x188782: ; 0x188782
	text "MISTY: Are there"
	line "many strong train-"
	cont "ers in JOHTO?"

	para "I'm going to"
	line "travel one day, so"

	para "I can battle some"
	line "skilled trainers."
	done
; 0x18880a

SwimmerfDianaSeenText: ; 0x18880a
	text "Sorry about being"
	line "away. Let's get on"
	cont "with it!"
	done
; 0x188838

SwimmerfDianaBeatenText: ; 0x188838
	text "I give up! You're"
	line "the winner!"
	done
; 0x188856

UnknownText_0x188856: ; 0x188856
	text "I'll be swimming"
	line "quietly."
	done
; 0x188870

SwimmerfBrianaSeenText: ; 0x188870
	text "Don't let my ele-"
	line "gant swimming un-"
	cont "nerve you."
	done
; 0x18889f

SwimmerfBrianaBeatenText: ; 0x18889f
	text "Ooh, you calmly"
	line "disposed of me<...>"
	done
; 0x1888c0

UnknownText_0x1888c0: ; 0x1888c0
	text "Don't be too smug"
	line "about beating me."

	para "MISTY will destroy"
	line "you if you get"
	cont "complacent."
	done
; 0x188912

SwimmermParkerSeenText: ; 0x188912
	text "Glub<...>"

	para "I'm first! Come"
	line "and get me!"
	done
; 0x188934

SwimmermParkerBeatenText: ; 0x188934
	text "This can't be<...>"
	done
; 0x188943

UnknownText_0x188943: ; 0x188943
	text "MISTY has gotten"
	line "much better in the"
	cont "past few months."

	para "Don't let your"
	line "guard down, or"
	cont "you'll be crushed!"
	done
; 0x1889a7

CeruleanGymGuyText: ; 0x1889a7
	text "Yo! CHAMP!"

	para "Since MISTY was"
	line "away, I went out"

	para "for some fun too."
	line "He-he-he."
	done
; 0x1889fa

CeruleanGymGuyWinText: ; 0x1889fa
	text "Hoo, you showed me"
	line "how tough you are."

	para "As always, that"
	line "was one heck of a"
	cont "great battle!"
	done
; 0x188a51

MistyPostgameRematchScript:
    writetext MistyPostgameRematchText
    yesorno
    iffalse .return
    closetext
    loadtrainer MISTY, 2
    winlosstext MistyPostgameBeatenText, 0
    startbattle
    returnafterbattle
    loadfont
    writetext MistyPostgameAfterText
    waitbutton
.return
    closetext
    end

MistyPostgameRematchText:
	text "Oh, look, if it"
	line "isn't the pest!"

	para "Ha! What?"

	para "You came back to"
	line "battle again?"
	done

MistyPostgameBeatenText:
	text "No way!"
	
	para "You beat me AGAIN!"
	done

MistyPostgameAfterText:
	text "Oh you little"
	line "pest<...>"

	para "I can never win"
	line "against you, huh?"
	
	para "Hmph."
	
	para "<...>You are pretty"
	line "good<...>"
	done

CeruleanGym_MapEventHeader: ; 0x188a51
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $f, $4, 5, GROUP_CERULEAN_CITY, MAP_CERULEAN_CITY
	warp_def $f, $5, 5, GROUP_CERULEAN_CITY, MAP_CERULEAN_CITY

	; xy triggers
	db 0

	; signposts
	db 3
	signpost 8, 3, $7, MapCeruleanGymSignpostItem0
	signpost 13, 2, $0, MapCeruleanGymSignpost1Script
	signpost 13, 6, $0, MapCeruleanGymSignpost2Script

	; people-events
	db 6
	person_event SPRITE_ROCKET, 14, 8, $6, 0, 0, -1, -1, 0, 0, 0, ObjectEvent, EVENT_ROCKET_IN_CERULEAN_GYM
	person_event SPRITE_MISTY, 7, 9, $6, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, MistyScript_0x188432, EVENT_CERULEAN_GYM_POPULATION
	person_event SPRITE_SWIMMER_GIRL, 10, 8, $9, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 2, 3, TrainerSwimmerfDiana, EVENT_CERULEAN_GYM_POPULATION
	person_event SPRITE_SWIMMER_GIRL, 13, 5, $9, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 2, 1, TrainerSwimmerfBriana, EVENT_CERULEAN_GYM_POPULATION
	person_event SPRITE_SWIMMER_GUY, 13, 12, $8, 0, 0, -1, -1, 8 + PAL_OW_RED, 2, 3, TrainerSwimmermParker, EVENT_CERULEAN_GYM_POPULATION
	person_event SPRITE_GYM_GUY, 17, 11, $6, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, CeruleanGymGuyScript, EVENT_CERULEAN_GYM_POPULATION
; 0x188abe

