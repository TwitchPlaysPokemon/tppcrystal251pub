PewterGymRB_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

PewterGymRB_BrockScript:
	faceplayer
	loadfont
	checkevent EVENT_GOT_TM_SANDSTORM
	iftrue .have_tm
	checkflag ENGINE_BOULDERBADGE
	iftrue .have_badge
	writetext PewterGymRB_BrockIntroText
	waitbutton
	closetext
	winlosstext PewterGymRB_BrockLostText, $0000
	loadtrainer BROCK_RB, 1
	startbattle
	returnafterbattle
	setevent EVENT_BEAT_BROCK_RB
	setevent EVENT_BEAT_CAMPER_JERRY_RB ; Moved camper 2 tiles down, allowing player to skip him
	loadfont
	writetext PewterGymRB_GotBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_BOULDERBADGE
	setevent EVENT_RIVAL_ROUTE_22_RB
	domaptrigger GROUP_ROUTE_22_RB, MAP_ROUTE_22_RB, 0
	writetext PewterGymRB_BrockCongratsText
	waitbutton
	scall .tm
	closetext
	end

.have_badge
	writetext PewterGymRB_BrockCongratsText
	waitbutton
	scall.tm
	closetext
	end

.have_tm
	writetext PewterGymRB_BrockAfterText
	waitbutton
	scall .tm
	closetext
	end

.tm:
	givetm TM_SANDSTORM, EVENT_GOT_TM_SANDSTORM, .already_had_it, .bag_full
	writetext PewterGymRB_TMText
	waitbutton
.already_had_it:
.bag_full:
	end

TrainerCamperJerryRB:
	trainer EVENT_BEAT_CAMPER_JERRY_RB, CAMPER, JERRY_RB, CamperJerryRBSeenText, CamperJerryRBBeatenText, NULL, CamperJerryRBScript

CamperJerryRBScript:
	talkaftercancel
	loadfont
	writetext CamperJerryRBAfterText
	waitbutton
	closetext
	end

PewterGymRB_GymGuyScript:
	faceplayer
	loadfont
	checkevent EVENT_BEAT_BROCK_RB
	iffalse .NotChallengedYet
	writetext PewterGymRB_GymGuyWinText
	waitbutton
	closetext
	end

.NotChallengedYet
	writetext PewterGymRB_GymGuyText
	yesorno
	iffalse .no
	writetext PewterGymRB_GymGuyYesText
	jump .ok
.no
	writetext PewterGymRB_GymGuyNoText
.ok
	buttonsound
	writetext PewterGymRB_AdviceText
	waitbutton
	closetext
	end

PewterGymRB_StatueScript:
	trainertotext BROCK_RB, 1, $1
	checkflag ENGINE_BOULDERBADGE
	iftrue .HaveBadge
	jumpstd gymstatue1

.HaveBadge:
	jumpstd gymstatue2

PewterGymRB_BrockIntroText:
	text "I'm BROCK!"
	line "I'm PEWTER's GYM"
	cont "LEADER!"

	para "I believe in rock"
	line "hard defense and"
	cont "determination!"

	para "That's why my"
	line "#MON are all"
	cont "the ROCK-type!"

	para "Do you still want"
	line "to challenge me?"

	para "Fine then! Show"
	line "me your best!"
	done

PewterGymRB_BrockLostText:

	text "BROCK: I took"
	line "you for granted."

	para "As proof of your"
	line "victory, here's"
	cont "the BOULDERBADGE!"
	done

PewterGymRB_GotBadgeText:
	text "<PLAYER> received"
	line "BOULDERBADGE."
	done

PewterGymRB_BrockCongratsText:

	text "BROCK: <PLAY_G>,"
	line "thanks. I enjoyed"

	para "battling you, even"
	line "though I am a bit"
	cont "upset."

	para "That BOULDERBADGE"
	line "will make your"

	para "#MON even more"
	line "powerful."

	para "Here, have this as"
	line "well."
	done

PewterGymRB_BrockAfterText:
	text "There are all"
	line "kinds of trainers"
	cont "in the world!"

	para "You appear to be"
	line "very gifted as a"
	cont "#MON trainer!"

	para "Go to the GYM in"
	line "CERULEAN and test"
	cont "your abilities!"
	done

PewterGymRB_TMText:
	text "A TM contains a"
	line "technique that"
	para "can be taught to"
	line "#MON!"

	para "What's more, you"
	line "can use that TM"

	para "as many times as"
	line "you'd like, so"
	cont "don't be stingy!"

	para "TM37 contains"
	line "SANDSTORM!"

	para "It whips up a"
	line "sandstorm that"
	cont "damages #MON"
	cont "for 5 turns."

	para "Some #MON are"
	line "immune, so use it"
	cont "with caution."
	done


CamperJerryRBSeenText:
	text "Stop right there,"
	line "kid!"

	para "You're still light"
	line "years from facing"
	cont "BROCK!"
	done

CamperJerryRBBeatenText:
	text "Darn!"

	para "Light years isn't"
	line "time! It measures"
	cont "distance!"
	done

CamperJerryRBAfterText:
	text "You're pretty hot,"
	line "but not as hot"
	cont "as BROCK!"
	done

PewterGymRB_GymGuyText:
	text "Hiya! I can tell"
	line "you have what it"
	cont "takes to become a"
	cont "#MON champ!"

	para "I'm no trainer,"
	line "but I can tell"
	cont "you how to win!"

	para "Let me take you"
	line "to the top!"
	done

PewterGymRB_GymGuyYesText:
	text "All right! Let's"
	line "get happening!"
	done

PewterGymRB_AdviceText:
	text "The 1st #MON"
	line "out in a match is"
	para "at the top of the"
	line "#MON LIST!"

	para "By changing the"
	line "order of #MON,"
	para "matches could be"
	line "made easier!"
	done

PewterGymRB_GymGuyNoText:
	text "It's a free"
	line "service! Let's"
	cont "get happening!"
	done

PewterGymRB_GymGuyWinText:
	text "Just as I thought!"
	line "You're #MON"
	cont "champ material!"

	para "The way you took"
	line "charge was really"
	para "inspiring. I mean"
	line "that seriously."
	done

PewterGymRB_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 2
	warp_def 13, 4, 2, GROUP_PEWTER_CITY_RB, MAP_PEWTER_CITY_RB
	warp_def 13, 5, 2, GROUP_PEWTER_CITY_RB, MAP_PEWTER_CITY_RB

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 11, 2, $0, PewterGymRB_StatueScript
	signpost 11, 7, $0, PewterGymRB_StatueScript

	; people-events
	db 3
	person_event SPRITE_BROCK, 5, 9, $6, 0, 0, -1, -1, 8 + PAL_OW_BROWN, 0, 0, PewterGymRB_BrockScript, -1
	person_event SPRITE_YOUNGSTER, 11, 6, $9, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 2, 3, TrainerCamperJerryRB, -1
	person_event SPRITE_GYM_GUY, 15, 10, $6, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 1, PewterGymRB_GymGuyScript, -1

