PewterGym_MapScriptHeader: ; 0x1a2862
	; trigger count
	db 0

	; callback count
	db 0
; 0x1a2864

BrockScript_0x1a2864: ; 0x1a2864
	faceplayer
	loadfont
	checkevent EVENT_BEAT_ELM
	iftrue BrockPostgameRematchScript
	checkevent EVENT_BROCK_REMATCH
	iftrue BrockAfterRematch
	checkevent EVENT_SET_BY_OAK_AFTER_16_BADGES
	iftrue BrockRematchScript
	checkflag ENGINE_BOULDERBADGE
	iftrue UnknownScript_0x1a2892
	writetext UnknownText_0x1a28d0
	waitbutton
	closetext
	winlosstext UnknownText_0x1a29bb, $0000
	loadtrainer BROCK, 1
	startbattle
	returnafterbattle
	setevent EVENT_BEAT_BROCK
	setevent EVENT_BEAT_CAMPER_JERRY
	loadfont
	writetext UnknownText_0x1a2a3d
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_BOULDERBADGE
	writetext UnknownText_0x1a2a57
	waitbutton
	closetext
	end
; 0x1a2892

UnknownScript_0x1a2892: ; 0x1a2892
	writetext UnknownText_0x1a2ada
	waitbutton
	closetext
	end

BrockRematchScript:
	checkevent EVENT_ACTIVATED_MIGUEL_FOSSILS
	iffalse BrockReject
	writetext BrockBeforeRematchText
	waitbutton
	closetext
	winlosstext BrockRematchBeatenText, $0000
	loadtrainer BROCK, 2
	startbattle
	returnafterbattle
	setevent EVENT_BROCK_REMATCH
	loadfont ;fallthrough
; 0x188466

BrockAfterRematch:
	writetext BrockAfterRematchText
	waitbutton
	closetext
	end
; 0x1a2898

BrockReject:
	writetext BrockRejectText
	waitbutton
	closetext
	end

BrockRejectText:
	text "BROCK: <PLAY_G>?"

	para "Are you interested"
	line "in FOSSIL #MON?"

	para "You should visit"
	line "MT. MOON."

	para "One of my friends"
	line "is excavating for"
	cont "fossils there."

	para "They say a lab in"
	line "JOHTO is able to"

	para "restore these fos-"
	line "sils to life."
	done

BrockBeforeRematchText:
	text "BROCK: So, you're"
	line "here."

	para "It has been some"
	line "time since I was"
	para "able to go all"
	line "out like this."

	para "When it comes to"
	line "rock #MON,"
	cont "I'm the best!"

	para "Come on!"

	done

BrockRematchBeatenText:
	text "Ah! What a solid"
	line "battle!"
	done

BrockAfterRematchText:
	text "BROCK: I've lost"
	line "again<...>"

	para "Seems you've been"
	line "making the most of"
	cont "your adventure!"
	done

TrainerCamperJerry: ; 0x1a2898
	; bit/flag number
	dw $42b

	; trainer group && trainer id
	db CAMPER, JERRY

	; text when seen
	dw CamperJerrySeenText

	; text when trainer beaten
	dw CamperJerryBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw CamperJerryScript
; 0x1a28a4

CamperJerryScript: ; 0x1a28a4
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a2c0f
	waitbutton
	closetext
	end
; 0x1a28ac

PewterGymGuyScript: ; 0x1a28ac
	faceplayer
	loadfont
	checkevent EVENT_BEAT_BROCK
	iftrue .PewterGymGuyWinScript
	writetext PewterGymGuyText
	waitbutton
	closetext
	end

.PewterGymGuyWinScript
	writetext PewterGymGuyWinText
	waitbutton
	closetext
	end
; 0x1a28c0

MapPewterGymSignpost1Script: ; 0x1a28c0
	trainertotext BROCK, 1, $1
	checkflag ENGINE_BOULDERBADGE
	iftrue UnknownScript_0x1a28c9
	jumpstd gymstatue1
; 0x1a28c9

UnknownScript_0x1a28c9: ; 0x1a28c9
	jumpstd gymstatue2
; 0x1a28d0

UnknownText_0x1a28d0: ; 0x1a28d0
	text "BROCK: Wow, it's"
	line "not often that we"

	para "get a challenger"
	line "from JOHTO-"

	para "<...>"

	para "So you're from"
	line "PALLET TOWN,"
	
	para "but you lost your"
	line "BOULDERBADGE<...>"

	para "While I could"
	line "simply replace it,"
	
	para "I want to see how"
	line "much you've grown"
	
	para "to become JOHTO's"
	line "CHAMPION."

	para "Come on!"
	done
; 0x1a29bb

UnknownText_0x1a29bb: ; 0x1a29bb
	text "BROCK: Your #-"
	line "MON's powerful"

	para "attacks overcame"
	line "my rock-hard"
	cont "defense<...>"

	para "You're stronger"
	line "than I expected<...>"

	para "Go ahead--take"
	line "this BADGE."
	done
; 0x1a2a3d

UnknownText_0x1a2a3d: ; 0x1a2a3d
	text "<PLAYER> received"
	line "BOULDERBADGE."
	done
; 0x1a2a57

UnknownText_0x1a2a57: ; 0x1a2a57
	text "BROCK: <PLAY_G>,"
	line "thanks. I enjoyed"

	para "battling you, even"
	line "though I am a bit"
	cont "upset."

	para "That BOULDERBADGE"
	line "will make your"

	para "#MON even more"
	line "powerful."
	done
; 0x1a2ada

UnknownText_0x1a2ada: ; 0x1a2ada
	text "BROCK: The world"
	line "is huge. There are"

	para "still many strong"
	line "trainers like you."

	para "Just wait and see."
	line "I'm going to be-"
	cont "come a lot strong-"
	cont "er too."
	done
; 0x1a2b62

CamperJerrySeenText: ; 0x1a2b62
	text "The trainers of"
	line "this GYM use rock-"
	cont "type #MON."

	para "The rock-type has"
	line "high DEFENSE."

	para "Battles could end"
	line "up going a long"

	para "time. Are you"
	line "ready for this?"
	done
; 0x1a2bf1

CamperJerryBeatenText: ; 0x1a2bf1
	text "I have to win"
	line "these battles<...>"
	done
; 0x1a2c0f

UnknownText_0x1a2c0f: ; 0x1a2c0f
	text "Hey, you! BROCK"
	line "is tough. He'll"
	cont "punish you if you"

	para "don't take him"
	line "seriously."
	done
; 0x1a2c6e

PewterGymGuyText: ; 0x1a2c6e
	text "Yo, CHAMP!"

	para "You're really"
	line "rocking."

	para "Are you battling"
	line "the GYM LEADERS of"
	cont "KANTO?"

	para "They're strong and"
	line "dedicated people,"

	para "just like JOHTO's"
	line "GYM LEADERS."
	done
; 0x1a2d07

PewterGymGuyWinText: ; 0x1a2d07
	text "Yo, CHAMP!"

	para "That GYM didn't"
	line "give you much"
	cont "trouble."

	para "The way you took"
	line "charge was really"

	para "inspiring. I mean"
	line "that, seriously!"
	done
; 0x1a2d88

BrockPostgameRematchScript:
    writetext BrockPostgameRematchText
    yesorno
    iffalse .return
    closetext
    loadtrainer BROCK, 2
    winlosstext BrockPostgameBeatenText, 0
    startbattle
    returnafterbattle
    loadfont
    writetext BrockPostgameAfterText
    waitbutton
.return
    closetext
    end

BrockPostgameRematchText:
	text "BROCK: <PLAY_G>!"
	
	para "Still making your"
	line "rounds in KANTO?"
	
	para "What's that?"
	
	para "You came back to"
	line "battle me again?"
	done

BrockPostgameBeatenText:
	text "No! My defense"
	line "wasn't enough!"
	done

BrockPostgameAfterText:
	text "BROCK: I guess"
	line "there's a reason"
	
	line "you are JOHTO'S"
	cont "CHAMPION."

	para "You have my"
	line "respect, that's"
	cont "for sure!"
	done

PewterGym_MapEventHeader: ; 0x1a2d88
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $d, $4, 2, GROUP_PEWTER_CITY, MAP_PEWTER_CITY
	warp_def $d, $5, 2, GROUP_PEWTER_CITY, MAP_PEWTER_CITY

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 11, 2, $0, MapPewterGymSignpost1Script
	signpost 11, 7, $0, MapPewterGymSignpost1Script

	; people-events
	db 3
	person_event SPRITE_BROCK, 5, 9, $6, 0, 0, -1, -1, 8 + PAL_OW_BROWN, 0, 0, BrockScript_0x1a2864, -1
	person_event SPRITE_YOUNGSTER, 9, 6, $9, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 2, 3, TrainerCamperJerry, -1
	person_event SPRITE_GYM_GUY, 15, 10, $6, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 1, PewterGymGuyScript, -1
; 0x1a2dc9

