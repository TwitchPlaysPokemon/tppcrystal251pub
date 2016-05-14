
PewterMuseumOfScience1F_MapScriptHeader:
	; trigger count
	db 2
	dw .Trigger0, 0
	dw .Trigger1, 0

	; callback count
	db 1
	dbw 1, .ResetTrigger

.Trigger0
	end
.Trigger1
	end
.ResetTrigger
	checkcode VAR_XCOORD
	if_equal 7, .skip
	dotrigger 0
.skip
	return

PewterMuseumOfScience1FPayWall:
	spriteface $2, LEFT
	spriteface $0, RIGHT
	loadfont
	special Function24ae8
	writetext _Museum1FText_5c21f
	yesorno
	iffalse .send_back
	checkmoney 0, 50
	if_equal 2, .insufficient_funds
	takemoney 0, 50
	special Function24ae8
	playsound SFX_TRANSACTION
	waitsfx
	writetext _Museum1FText_5c224
	waitbutton
	closetext
	dotrigger 1
	end
.send_back
	writetext _Museum1FText_5c21a
	jump .finish
.insufficient_funds
	writetext _Museum1FText_5c229
.finish
	waitbutton
	closetext
	applymovement $0, PlayerStepsDown_PewterMuseumOfScience
	end

PewterMuseumOfScience1FScientist1Script:
	faceplayer
	loadfont
	checkcode VAR_FACING
	if_equal LEFT, .back_way
	if_equal DOWN, .back_way
	checktriggers
	iftrue .already_paid
	writetext _Museum1FText_5c23d
	jump .finish
.already_paid
	writetext _Museum1FText_5c242
.finish
	waitbutton
	closetext
	end
.back_way
	writetext _Museum1FText_5c22e
	yesorno
	iffalse .no
	writetext _Museum1FText_5c233
	jump .finish2
.no
	writetext _Museum1FText_5c238
.finish2
	waitbutton
	closetext
	spriteface $2, LEFT
	end

PewterMuseumOfScience1FUnusedGuyScript:
	jumptextfaceplayer _Museum1FText_5c251

PewterMuseumOfScience1FScientist2Script:
	faceplayer
	loadfont
	checkevent EVENT_PEWTER_MUSEUM_OLD_AMBER
	iftrue .got_amber
	writetext _Museum1FText_5c28e
	waitbutton
	verbosegiveitem OLD_AMBER, 1
	iffalse .bag_full
	disappear $6
.bag_full
	closetext
	end
.got_amber
	writetext _Museum1FText_5c299
	waitbutton
	closetext
	end

PewterMuseumOfScience1FScientist3Script:
	jumptextfaceplayer _Museum1FText_5c2ad

PewterMuseumOfScience1FOldAmberScript:
	jumptext _Museum1FText_5c2bc

PlayerStepsDown_PewterMuseumOfScience:
	step_down
	step_end

PewterMuseumOfScience1FAerodactylFossilScript:
	refreshscreen $0
	; pokepic AERODACTYL
	fossilpic 0
	waitbutton
	closepokepic
	loadfont
	writetext _AerodactylFossilText
	waitbutton
	closetext
	end

PewterMuseumOfScience1FKabutopsFossilScript:
	refreshscreen $0
	; pokepic KABUTOPS
	fossilpic 1
	waitbutton
	closepokepic
	loadfont
	writetext _KabutopsFossilText
	waitbutton
	closetext
	end

_Museum1FText_5c21a:
	text "Come again!"
	done

_Museum1FText_5c21f:
	text "It's ¥50 for a"
	line "child's ticket."

	para "Would you like to"
	line "come in?"
	done

_Museum1FText_5c224:
	text "Right, ¥50!"
	line "Thank you!"
	done

_Museum1FText_5c229:
	text "You don't have"
	line "enough money."
	done

_Museum1FText_5c22e:
	text "You can't sneak"
	line "in the back way!"

	para "Oh, whatever!"
	line "Do you know what"
	cont "AMBER is?"
	done

_Museum1FText_5c233:
	text "There's a lab"
	line "somewhere trying"
	cont "to resurrect"
	cont "ancient #MON"
	cont "from AMBER."
	done

_Museum1FText_5c238:
	text "AMBER is fossil-"
	line "ized tree sap."
	done

_Museum1FText_5c23d:
	text "Please go to the"
	line "other side!"
	done

_Museum1FText_5c242:
	text "Take plenty of"
	line "time to look!"
	done

_Museum1FText_5c251:
	text "That is one"
	line "magnificent"
	cont "fossil!"
	done

_Museum1FText_5c28e:
	text "Ssh! I think that"
	line "this chunk of"
	cont "AMBER contains"
	cont "#MON DNA!"

	para "It would be great"
	line "if #MON could"
	cont "be resurrected"
	cont "from it!"

	para "But, my colleagues"
	line "just ignore me!"

	para "So I have a favor"
	line "to ask!"

	para "Take this to a"
	line "#MON LAB and"
	cont "get it examined!"
	done

_Museum1FText_5c299:
	text "Ssh! Get the OLD"
	line "AMBER checked!"
	done

_Museum1FText_5c29e:
	text "You don't have"
	line "space for this!"
	done

_Museum1FText_5c2ad:
	text "We are proud of 2"
	line "fossils of very"
	cont "rare, prehistoric"
	cont "#MON!"
	done

_Museum1FText_5c2bc:
	text "The AMBER is"
	line "clear and gold!"
	done

_AerodactylFossilText:
	text "AERODACTYL Fossil"
	line "A primitive and"
	cont "rare #MON."
	done

_KabutopsFossilText:
	text "KABUTOPS Fossil"
	line "A primitive and"
	cont "rare #MON."
	done


PewterMuseumOfScience1F_MapEventHeader:
	db 0, 0 ; filler
	db 5 ; warps
	warp_def 7, 10, 6, GROUP_PEWTER_CITY_RB, MAP_PEWTER_CITY_RB
	warp_def 7, 11, 6, GROUP_PEWTER_CITY_RB, MAP_PEWTER_CITY_RB
	warp_def 7, 16, 7, GROUP_PEWTER_CITY_RB, MAP_PEWTER_CITY_RB
	warp_def 7, 17, 7, GROUP_PEWTER_CITY_RB, MAP_PEWTER_CITY_RB
	warp_def 7,  7, 1, GROUP_PEWTER_MUSEUM_2F_RB, MAP_PEWTER_MUSEUM_2F_RB

	db 2 ; coord events
	xy_trigger 0, 4,  9, $0, PewterMuseumOfScience1FPayWall, 0, 0
	xy_trigger 0, 4, 10, $0, PewterMuseumOfScience1FPayWall, 0, 0

	db 2 ; signposts
	signpost 3, 2, $0, PewterMuseumOfScience1FAerodactylFossilScript
	signpost 6, 2, $0, PewterMuseumOfScience1FKabutopsFossilScript

	db 5 ; objects
	person_event SPRITE_SCIENTIST, 8, 16, $8, 0, 0, -1, -1, 0, 0, 0, PewterMuseumOfScience1FScientist1Script, -1
	person_event SPRITE_UNUSED_GUY, 8, 5, $3, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, PewterMuseumOfScience1FUnusedGuyScript, -1
	person_event SPRITE_SCIENTIST, 6, 19, $6, 0, 0, -1, -1, 0, 0, 0, PewterMuseumOfScience1FScientist2Script, -1
	person_event SPRITE_SCIENTIST, 8, 21, $3, 0, 0, -1, -1, 0, 0, 0, PewterMuseumOfScience1FScientist3Script, -1
	person_event SPRITE_OLD_AMBER, 6, 20, $1, 0, 0, -1, -1, 0, 0, 0, PewterMuseumOfScience1FOldAmberScript, EVENT_PEWTER_MUSEUM_OLD_AMBER

