PewterCityRB_MapScriptHeader: ; 0x18c000
	; trigger count
	db 0

	; callback count
	db 0

PewterCityRBLassScript:
	jumptextfaceplayer _PewterCityText1

PewterCityRBCooltrainerMScript:
	jumptextfaceplayer _PewterCityText2

PewterCityRBPokemaniac1Script:
	faceplayer
	loadfont
	writetext _PewterCityText_193f1
	yesorno
	iffalse .no
	writetext _PewterCityText_193f6
	waitbutton
	closetext
	end

.no
	writetext _PewterCityText_193fb
	waitbutton
	closetext
	playmusic MUSIC_SHOW_ME_AROUND
	follow $4, $0
	applymovement $4, Movement_PewterRBPokemaniacDragsPlayerToMuseum
	stopfollow
	loadfont
	writetext _PewterCityText13
	waitbutton
	closetext
	special RestartMapMusic
	applymovement $4, Movement_PewterRBPokemaniacReturns
	disappear $4
	moveperson $4, 27, 17
	appear $4
	end

PewterCityRBPokemaniac2Script:
	faceplayer
	loadfont
	writetext _PewterCityText_19427
	yesorno
	iffalse .no
	writetext _PewterCityText_1942c
	jump .finish
.no
	writetext _PewterCityText_19431
.finish
	waitbutton
	closetext
	end

PewterRBFruitTree1:
	fruittree $1c

PewterRBFruitTree2:
	fruittree $1d

MapPewterCityRBSignpost0Script:
	jumptext _PewterCityText12

MapPewterCityRBSignpost1Script:
	jumptext _PewterCityText11

MapPewterCityRBSignpost2Script:
	jumptext _PewterCityText10

MapPewterCityRBSignpost3Script:
	jumptext _PewterCityText7

MapPewterCityRBSignpost4Script:
	jumptext _PewterCityText6

MapPewterCityRBSignpost5Script:
	jumpstd pokecentersign

MapPewterCityRBSignpost6Script:
	jumpstd martsign

Movement_PewterRBPokemaniacDragsPlayerToMuseum:
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_up
	step_up
	step_up
	step_left
	turn_head_up
	step_end

Movement_PewterRBPokemaniacReturns:
	slow_step_down
	slow_step_down
	slow_step_down
	slow_step_down
	slow_step_down
	step_end

_PewterCityText1:
	text "It's rumored that"
	line "CLEFAIRYs came"
	cont "from the moon!"

	para "They appeared "
	line "after MOON STONE"
	cont "fell on MT.MOON."
	done

_PewterCityText2:
	text "There aren't many"
	line "serious #MON"
	cont "trainers here!"

	para "They're all like"
	line "BUG CATCHERs,"
	cont "but PEWTER GYM's"
	cont "BROCK is totally"
	cont "into it!"
	done

_PewterCityText_193f1:
	text "Did you check out"
	line "the MUSEUM?"
	done

_PewterCityText_193f6:
	text "Weren't those"
	line "fossils from MT."
	cont "MOON amazing?"
	done

_PewterCityText_193fb:
	text "Really?"
	line "You absolutely"
	cont "have to go!"
	done

_PewterCityText13:
	text "It's right here!"
	line "You have to pay"
	cont "to get in, but"
	cont "it's worth it!"
	cont "See you around!"
	done

_PewterCityText_19427:
	text "Psssst!"
	line "Do you know what"
	cont "I'm doing?"
	done

_PewterCityText_1942c:
	text "That's right!"
	line "It's hard work!"
	done

_PewterCityText_19431:
	text "I'm spraying REPEL"
	line "to keep #MON"
	cont "out of my garden!"
	done

_PewterCityText6:
	text "TRAINER TIPS"

	para "Any #MON that"
	line "takes part in"
	cont "battle, however"
	cont "short, earns EXP!"
	done

_PewterCityText7:
	text "NOTICE!"

	para "Thieves have been"
	line "stealing #MON"
	cont "fossils at MT."
	cont "MOON! Please call"
	cont "PEWTER POLICE"
	cont "with any info!"
	done

_PewterCityText10:
	text "PEWTER MUSEUM"
	line "OF SCIENCE"
	done

_PewterCityText11:
	text "PEWTER CITY"
	line "#MON GYM"
	cont "LEADER: BROCK"

	para "The Rock Solid"
	line "#MON Trainer!"
	done

_PewterCityText12:
	text "PEWTER CITY"
	line "A Stone Gray"
	cont "City"
	done



PewterCityRB_MapEventHeader: ; 0x18c2f5
	; filler
	db 0, 0

	; warps
	db 7
	warp_def $d, $1d, 1, GROUP_PEWTER_NIDORAN_SPEECH_HOUSE_RB, MAP_PEWTER_NIDORAN_SPEECH_HOUSE_RB
	warp_def $11, $10, 1, GROUP_PEWTER_GYM_RB, MAP_PEWTER_GYM_RB
	warp_def $11, $17, 2, GROUP_PEWTER_MART_RB, MAP_PEWTER_MART_RB
	warp_def $19, $d, 1, GROUP_PEWTER_POKECENTER_1F_RB, MAP_PEWTER_POKECENTER_1F_RB
	warp_def $1d, $7, 1, GROUP_PEWTER_SNOOZE_SPEECH_HOUSE_RB, MAP_PEWTER_SNOOZE_SPEECH_HOUSE_RB
	warp_def $7, $e, 1, GROUP_PEWTER_MUSEUM_1F_RB, MAP_PEWTER_MUSEUM_1F_RB
	warp_def $5, $13, 3, GROUP_PEWTER_MUSEUM_1F_RB, MAP_PEWTER_MUSEUM_1F_RB ; this one should be inaccessible without cut

	; xy triggers
	db 0

	; signposts
	db 7
	signpost 23, 25, $0, MapPewterCityRBSignpost0Script
	signpost 17, 11, $0, MapPewterCityRBSignpost1Script
	signpost  9, 15, $0, MapPewterCityRBSignpost2Script
	signpost 19, 33, $0, MapPewterCityRBSignpost3Script
	signpost 29, 19, $0, MapPewterCityRBSignpost4Script
	signpost 25, 14, $0, MapPewterCityRBSignpost5Script
	signpost 17, 24, $0, MapPewterCityRBSignpost6Script

	; people-events
	db 6
	person_event SPRITE_TEACHER, 19, 12, $3, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 0, 0, PewterCityRBLassScript, -1
	person_event SPRITE_YOUNGSTER, 29, 21, $3, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, PewterCityRBCooltrainerMScript, -1
	person_event SPRITE_SUPER_NERD, 21, 31, $3, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, PewterCityRBPokemaniac1Script, -1
	person_event SPRITE_YOUNGSTER, 29, 30, $5, 0, 2, -1, -1, 8 + PAL_OW_GREEN, 0, 0, PewterCityRBPokemaniac2Script, -1
	person_event SPRITE_FRUIT_TREE, 7, 36, $1, 0, 0, -1, -1, 0, 0, 0, PewterRBFruitTree1, -1
	person_event SPRITE_FRUIT_TREE, 7, 34, $1, 0, 0, -1, -1, 0, 0, 0, PewterRBFruitTree2, -1
