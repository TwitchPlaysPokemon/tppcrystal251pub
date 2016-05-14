MtMoonB3F_MapScriptHeader: ; 0x1ac2ba
	; trigger count
	db 0

	; callback count
	db 0

TrainerSuperNerdMiguel:
	; bit/flag number
	dw EVENT_BEAT_SUPER_NERD_MIGUEL

	; trainer group && trainer id
	db SUPER_NERD, MIGUEL

	; text when seen
	dw SuperNerdMiguelSeenText

	; text when trainer beaten
	dw SuperNerdMiguelBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SuperNerdMiguelScript

SuperNerdMiguelScript:
	loadfont
	checkevent EVENT_ACTIVATED_MIGUEL_FOSSILS
	iftrue SuperNerdMiguelScript2
	writetext SuperNerdMiguelFirstFossilText
	buttonsound
	verbosegiveitem HELIX_FOSSIL, 1
	setflag ENGINE_DAILY_FOSSIL
	setevent EVENT_ACTIVATED_MIGUEL_FOSSILS
	jump SuperNerdMiguelScriptFinally

SuperNerdMiguelScript2:
	checkflag ENGINE_DAILY_FOSSIL
	iftrue SuperNerdMiguelScriptFinally
	checkevent EVENT_DAILY_MIGUEL_FOUND_NOTHING
	iftrue SuperNerdMiguelFoundNothing
	checkevent EVENT_DAILY_MIGUEL_FOUND_HELIX
	iftrue SuperNerdMiguelFoundHelix
	checkevent EVENT_DAILY_MIGUEL_FOUND_DOME
	iftrue SuperNerdMiguelFoundDome
	random 10
	if_equal 1, SuperNerdMiguelFoundNothing
	writetext SuperNerdMiguelFoundSomethingText
	buttonsound
	random 2
	if_equal 1, SuperNerdMiguelFoundDome

SuperNerdMiguelFoundNothing:
	setevent EVENT_DAILY_MIGUEL_FOUND_NOTHING
	writetext SuperNerdMiguelFoundNothingText
	buttonsound
	setflag ENGINE_DAILY_FOSSIL
	jump SuperNerdMiguelScriptFinally

SuperNerdMiguelFoundHelix:
	writetext SuperNerdMiguelFoundHelixText
	buttonsound
	checkitem HELIX_FOSSIL
	iftrue SuperNerdMiguelScriptAlreadyHaveIt
	setevent EVENT_DAILY_MIGUEL_FOUND_HELIX
	verbosegiveitem HELIX_FOSSIL, 1
	setflag ENGINE_DAILY_FOSSIL
	jump SuperNerdMiguelScriptFinally

SuperNerdMiguelFoundDome:
	writetext SuperNerdMiguelFoundDomeText
	buttonsound
	checkitem DOME_FOSSIL
	iftrue SuperNerdMiguelScriptAlreadyHaveIt
	setevent EVENT_DAILY_MIGUEL_FOUND_DOME
	verbosegiveitem DOME_FOSSIL, 1
	setflag ENGINE_DAILY_FOSSIL

SuperNerdMiguelScriptFinally:
	clearevent EVENT_DAILY_MIGUEL_FOUND_HELIX
	clearevent EVENT_DAILY_MIGUEL_FOUND_DOME
	clearevent EVENT_DAILY_MIGUEL_FOUND_NOTHING
	writetext SuperNerdMiguelText
	waitbutton
	closetext
	end

SuperNerdMiguelScriptAlreadyHaveIt:
	writetext SuperNerdMiguelAlreadyHaveItText
	waitbutton
	closetext
	end

SuperNerdMiguelSeenText:
	text "Hold it!"
	line "Not another step."

	para "You'll disturb the"
	line "precious FOSSILs!"
	done

SuperNerdMiguelBeatenText:
	text "Alright, alright!"
	line "You can have one."
	done

SuperNerdMiguelFirstFossilText:
	text "I've held on to"
	line "this FOSSIL for"
	cont "three months now."

	para "But in my recent"
	line "excavations, I've"

	para "found many more"
	line "just like it."
	done

SuperNerdMiguelFoundNothingText:
	text "Ah, good to see"
	line "you again!"

	para "I didn't find any"
	line "fossils today."
	cont "Sorry!"
	done

SuperNerdMiguelFoundSomethingText:
	text "Ah, good to see"
	line "you again!"

	para "You're in luck!"
	line "My excavation was"
	cont "a success!"
	done

SuperNerdMiguelFoundHelixText:
	text "Here, you can have"
	line "this HELIX FOSSIL."
	done

SuperNerdMiguelFoundDomeText:
	text "Here, you can have"
	line "this DOME FOSSIL."
	done

SuperNerdMiguelText:
	text "Come back again"
	line "tomorrow."

	para "I'll give you any"
	line "surplus FOSSILs"
	cont "I find."
	done

SuperNerdMiguelAlreadyHaveItText:
	text "Oh? You already"
	line "one of those."

	para "I guess I'll keep"
	line "this one."
	done

Item_MtMoonPGKB3F1:
	db HP_UP, 1
Item_MtMoonPGKB3F2:
	db CONFUSEGUARD, 1

MtMoonB3F_MapEventHeader: ; 0x1ac4af
	; filler
	db 0, 0

	db 4
	warp_def $09, $19, 2, GROUP_MT_MOON_B2F, MAP_MT_MOON_B2F
	warp_def $11, $15, 5, GROUP_MT_MOON_B2F, MAP_MT_MOON_B2F
	warp_def $1b, $f, 6, GROUP_MT_MOON_B2F, MAP_MT_MOON_B2F
	warp_def $7, $5, 7, GROUP_MT_MOON_B2F, MAP_MT_MOON_B2F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 3
	person_event SPRITE_SUPER_NERD, 12, 16, $9, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 2, 1, TrainerSuperNerdMiguel, -1
	person_event SPRITE_POKE_BALL, 25, 29, $1, 0, 0, -1, -1, 0, 1, 0, Item_MtMoonPGKB3F1, EVENT_MT_MOON_PGK_B3F_1
	person_event SPRITE_POKE_BALL, 9, 33, $1, 0, 0, -1, -1, 0, 1, 0, Item_MtMoonPGKB3F2, EVENT_MT_MOON_PGK_B3F_2
