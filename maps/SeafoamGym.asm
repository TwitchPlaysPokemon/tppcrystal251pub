SeafoamGym_MapScriptHeader: ; 0x1ab4f4
	; trigger count
	db 1

	; triggers
	dw UnknownScript_0x1ab4fa, $0000

	; callback count
	db 0
; 0x1ab4fa

UnknownScript_0x1ab4fa: ; 0x1ab4fa
	end
; 0x1ab4fb

BlaineScript_0x1ab4fb: ; 0x1ab4fb
	faceplayer
	loadfont
	checkevent EVENT_BEAT_ELM
	iftrue BlainePostgameRematchScript
	checkevent EVENT_BLAINE_REMATCH
	iftrue BlaineAfterRematch
	checkevent EVENT_SET_BY_OAK_AFTER_16_BADGES
	iftrue BlaineRematchScript
	checkflag ENGINE_VOLCANOBADGE
	iftrue UnknownScript_0x1ab52b
	writetext UnknownText_0x1ab548
	waitbutton
	closetext
	winlosstext UnknownText_0x1ab646, $0000
	loadtrainer BLAINE, 1
	startbattle
	iftrue UnknownScript_0x1ab516
	appear $3
UnknownScript_0x1ab516: ; 0x1ab516
	returnafterbattle
	setevent EVENT_BEAT_BLAINE
	loadfont
	writetext UnknownText_0x1ab683
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_VOLCANOBADGE
	writetext UnknownText_0x1ab69d
	waitbutton
	verbosegiveitem TM_FIRE_BLAST, 1
	writetext AfterFireBlastText
	waitbutton
	closetext
	end
; 0x1ab52b

UnknownScript_0x1ab52b: ; 0x1ab52b
	writetext UnknownText_0x1ab71c
	waitbutton
	closetext
	end
; 0x1ab531

BlaineRematchScript:
	checkitem RESEARCHNOTE
	iffalse BlaineReject
	writetext BlaineBeforeRematchText
	waitbutton
	closetext
	winlosstext BlaineRematchBeatenText, $0000
	loadtrainer BLAINE, 2
	startbattle
	returnafterbattle
	setevent EVENT_BLAINE_REMATCH
	loadfont
	writetext BlaineAfterRematchText
	takeitem RESEARCHNOTE, 1
	waitbutton
	closetext
	end

BlaineAfterRematch:
	loadfont
	writetext BlaineAfterRematchText2
	waitbutton
	closetext
	end

BlaineReject:
	writetext BlaineRejectText
	waitbutton
	closetext
	applymovement $2, BlaineHeatedRage
	loadfont
	writetext BlaineRejectText2
	waitbutton
	closetext
	end

BlaineHeatedRage:
	half_step_right
	half_step_up
	half_step_left
	half_step_up
	half_step_right
	half_step_left
	step_end

BlaineRejectText:
	text "BLAINE: My"
	line "RESEARCH NOTES!"

	para "They're gone!"

	para "The last traces of"
	line "CINNABAR RESEARCH"
	cont "LAB, gone!"

	para "How could this"
	line "have happened!?"
	
	para "Once the CINNABAR"
	line "VOLCANO erupted<...>"
	
	para "No<...> no<...> no!"
	done

BlaineRejectText2:
	text "You decide it"
	line "would be unwise"
	
	para "to interrupt his"
	line "heated frenzy."
	done

BlaineBeforeRematchText:
	text "BLAINE: <...>!"
	line "My RESEARCH NOTES!"

	para "You got them back!"

	para "Thanks for getting"
	line "those for me."
	
	para "They are the last"
	line "copies of the map"
	
	para "to MEW's only"
	line "known home."

	para "But I heard you"
	line "want to test your-"
	cont "self against the"
	
	para "the hottest flames"
	line "I have."

	para "Let's get cookin'!"
	done

BlaineRematchBeatenText:
	text "How could this be!"

	para "My spirit has not"
	line "been defeated!"
	done

BlaineAfterRematchText:
	text "BLAINE: I burnt"
	line "myself out<...>"

	para "I'll take my NOTES"
	line "back, but leave"
	
	para "you with a map to"
	line "GUYANA, the only"
	
	para "known habitat of"
	line "MEW, as thanks."

	para "I'll never give"
	line "up until the day"
	
	para "I've rebuilt the"
	line "CINNABAR GYM!"
	done

BlaineAfterRematchText2:
	text "Gahahaha!!"

	para "Battling with you"
	line "gets me all fired"
	cont "up!"
	done

SeafoamGymGuyScript: ; 0x1ab531
	faceplayer
	loadfont
	checkevent EVENT_TALKED_TO_SEAFOAM_GYM_GUY_ONCE
	iftrue .TalkedToSeafoamGymGuyScript
	writetext SeafoamGymGuyWinText
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_SEAFOAM_GYM_GUY_ONCE
	end

.TalkedToSeafoamGymGuyScript
	checkevent EVENT_SET_BY_OAK_AFTER_16_BADGES
	iffalse .skip_notes_check
	checkevent EVENT_SAW_MEW_IN_GARDEN
	iffalse .tell_about_garden
	checkevent EVENT_BLAINE_REMATCH
	iffalse .just_steamed
.skip_notes_check
	writetext SeafoamGymGuyWinText2
	waitbutton
	closetext
	end

.just_steamed
	writetext SeafoamGymGuySteamedText
	waitbutton
	closetext
	end

.tell_about_garden
	writetext SeafoamGymGuyGardenText
	waitbutton
	closetext
	end
; 0x1ab548

UnknownText_0x1ab548: ; 0x1ab548
	text "BLAINE: Waaah!"

	para "My GYM in CINNABAR"
	line "burned down."

	para "My fire-breathing"
	line "#MON and I are"

	para "homeless because"
	line "of the volcano."

	para "Waaah!"

	para "But I'm back in"
	line "business as a GYM"

	para "LEADER here in"
	line "this cave."

	para "If you can beat"
	line "me, I'll give you"
	cont "a BADGE."

	para "Ha! You'd better"
	line "have BURN HEAL!"
	done
; 0x1ab646

UnknownText_0x1ab646: ; 0x1ab646
	text "BLAINE: Awesome."
	line "I've burned out<...>"

	para "You've earned"
	line "VOLCANOBADGE!"
	done
; 0x1ab683

UnknownText_0x1ab683: ; 0x1ab683
	text "<PLAYER> received"
	line "VOLCANOBADGE."
	done
; 0x1ab69d

UnknownText_0x1ab69d: ; 0x1ab69d
	text "BLAINE: Also"
	line "take this."
	done

AfterFireBlastText:
	text "It contains"
	line "FIRE BLAST!"

	para "Don't waste it"
	line "on water types!"

	para "I'm going to win"
	line "next time."

	para "When I rebuild my"
	line "CINNABAR GYM,"

	para "we'll have to have"
	line "a rematch."
	done
; 0x1ab71c

UnknownText_0x1ab71c: ; 0x1ab71c
	text "BLAINE: My fire"
	line "#MON will be"

	para "even stronger."
	line "Just you watch!"
	done
; 0x1ab759

SeafoamGymGuyWinText: ; 0x1ab759
	text "Yo!"

	para "<...> Huh? It's over"
	line "already?"

	para "Sorry, sorry!"

	para "CINNABAR GYM was"
	line "gone, so I didn't"

	para "know where to find"
	line "you."

	para "But, hey, you're"
	line "plenty strong even"

	para "without my advice."
	line "I knew you'd win!"
	done
; 0x1ab806

SeafoamGymGuyWinText2: ; 0x1ab806
	text "A #MON GYM can"
	line "be anywhere as"

	para "long as the GYM"
	line "LEADER is there."

	para "There's no need"
	line "for a building."
	done
; 0x1ab865

SeafoamGymGuySteamedText:
	text "Boy, BLAINE sure"
	line "seems steamed<...>"

	para "He needs to chill"
	line "for a bit."
	done

SeafoamGymGuyGardenText:
	text "Boy, BLAINE sure"
	line "seems steamed<...>"

	para "Oh! Hey, CHAMP!"

	para "Listen, I heard"
	line "this weird rumor."

	para "You know BILL? The"
	line "#MANIAC?"

	para "He used to live up"
	line "at the cape on"
	cont "ROUTE 25."

	para "People say there's"
	line "a GARDEN up there"

	para "where BILL would"
	line "keep his rare"
	cont "#MON."

	para "If you're working"
	line "on a #DEX, you"

	para "might want to"
	line "check it out."
	done

BlainePostgameRematchScript:
    writetext BlainePostgameRematchText
    yesorno
    iffalse .return
    closetext
    loadtrainer BLAINE, 2
    winlosstext BlainePostgameBeatenText, 0
    startbattle
    returnafterbattle
    loadfont
    writetext BlainePostgameAfterText
    waitbutton
.return
    closetext
    end

BlainePostgameRematchText:
	text "BLAINE: Woah!"
	
	para "I didn't think I'd"
	line "see you back here"
	cont "in my<...>"

	para "<...> <...> <...>"
	line "<...>my <``>GYM<''><...>"
	
	para "Oh? You want to"
	line "battle again?"
	done

BlainePostgameBeatenText:
	text "No! It can't be!"
	done

BlainePostgameAfterText:
	text "BLAINE: Your #-"
	line "MON are super hot!"

	para "I guess I'm just a"
	line "smoldering ember"
	cont "without my GYM<...>"
	done
	
SeafoamGym_MapEventHeader: ; 0x1ab865
	; filler
	db 0, 0

	; warps
	db 1
	warp_def $5, $5, 3, GROUP_SEAFOAM_ISLANDS_ENTRANCE, MAP_SEAFOAM_ISLANDS_ENTRANCE

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 2
	person_event SPRITE_BLAINE, 6, 9, $6, 0, 0, -1, -1, 8 + PAL_OW_BROWN, 0, 0, BlaineScript_0x1ab4fb, -1
	person_event SPRITE_GYM_GUY, 9, 10, $7, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, SeafoamGymGuyScript, EVENT_GYM_GUY_IN_SEAFOAM_GYM
; 0x1ab88a



