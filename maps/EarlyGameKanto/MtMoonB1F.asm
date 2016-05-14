MtMoonB1FRB_MapScriptHeader: ; 0x7407f
	; trigger count
	db 0

	; callback count
	db 1
	dbw 1, .HideLadders
; 0x74089
.HideLadders
	changeblock $23, $07, 1
	changeblock $23, $1F, 1
	return

Trainer_HikerMarcos:
	trainer EVENT_HIKER_MARCOS, HIKER, MARCOS_RB, _MtMoon1BattleText2, _MtMoon1EndBattleText2, 0, .Script
.Script
	talkaftercancel
	loadfont
	writetext _MtMoon1AfterBattleText2
	waitbutton
	closetext
	end

Trainer_YoungsterJosh:
	trainer EVENT_YOUNGSTER_JOSH, YOUNGSTER, JOSH_RB, _MtMoon1BattleText3, _MtMoon1EndBattleText3, 0, .Script
.Script
	talkaftercancel
	loadfont
	writetext _MtMoon1AfterBattleText3
	waitbutton
	closetext
	end

Trainer_LassMiriam:
	trainer EVENT_LASS_MIRIAM, LASS, MIRIAM_RB, _MtMoon1BattleText4, _MtMoon1EndBattleText4, 0, .Script
.Script
	talkaftercancel
	loadfont
	writetext _MtMoon1AfterBattleText4
	waitbutton
	closetext
	end

Trainer_SuperNerdJovan:
	trainer EVENT_SUPER_NERD_JOVAN, SUPER_NERD, JOVAN_RB, _MtMoon1BattleText5, _MtMoon1EndBattleText5, 0, .Script
.Script
	talkaftercancel
	loadfont
	writetext _MtMoon1AfterBattleText5
	waitbutton
	closetext
	end

Trainer_LassIris:
	trainer EVENT_LASS_IRIS, LASS, IRIS_RB, _MtMoon1BattleText6, _MtMoon1EndBattleText6, 0, .Script
.Script
	talkaftercancel
	loadfont
	writetext _MtMoon1AfterBattleText6
	waitbutton
	closetext
	end

Trainer_BugCatcherKent:
	trainer EVENT_BUG_CATCHER_KENT, BUG_CATCHER, KENT_RB, _MtMoon1BattleText7, _MtMoon1EndBattleText7, 0, .Script
.Script
	talkaftercancel
	loadfont
	writetext _MtMoon1AfterBattleText7
	waitbutton
	closetext
	end

Trainer_BugCatcherRobby:
	trainer EVENT_BUG_CATCHER_ROBBY, BUG_CATCHER, ROBBY_RB, _MtMoon1BattleText8, _MtMoon1EndBattleText8, 0, .Script
.Script
	talkaftercancel
	loadfont
	writetext _MtMoon1AfterBattleText8
	waitbutton
	closetext
	end

MtMoonB1FRBSignpostScript:
	jumptext _MtMoon1Text14

Item_MtMoonB1FRBPotion1:
	db POTION, 1

Item_MtMoonB1FRBMoonStone:
	db MOON_STONE, 1

Item_MtMoonB1FRBRareCandy:
	db RARE_CANDY, 1

Item_MtMoonB1FRBEscapeRope:
	db ESCAPE_ROPE, 1

Item_MtMoonB1FRBPotion2:
	db POTION, 1

Item_MtMoonB1FRBTMSunnyDay:
	db TM_SUNNY_DAY, 1

_MtMoon1BattleText2:
	text "WHOA! You shocked"
	line "me! Oh, you're"
	cont "just a kid!"
	done

_MtMoon1EndBattleText2:
	text "Wow! Shocked"
	line "again!"
	done

_MtMoon1AfterBattleText2:
	text "Kids like you"
	line "shouldn't be"
	cont "here!"
	done

_MtMoon1BattleText3:
	text "Did you come to"
	line "explore too?"
	done

_MtMoon1EndBattleText3:
	text "Losing stinks!"
	done

_MtMoon1AfterBattleText3:
	text "I came down here"
	line "to show off to"
	cont "girls."
	done

_MtMoon1BattleText4:
	text "Wow! It's way"
	line "bigger in here"
	cont "than I thought!"
	done

_MtMoon1EndBattleText4:
	text "Oh! I lost it!"
	done

_MtMoon1AfterBattleText4:
	text "How do you get"
	line "out of here?"
	done

_MtMoon1BattleText5:
	text "What! Don't sneak"
	line "up on me!"
	done

_MtMoon1EndBattleText5:
	text "My #MON won't"
	line "do!"
	done

_MtMoon1AfterBattleText5:
	text "I have to find"
	line "stronger #MON."
	done

_MtMoon1BattleText6:
	text "What? I'm waiting"
	line "for my friends to"
	cont "find me here."
	done

_MtMoon1EndBattleText6:
	text "I lost?"
	done

_MtMoon1AfterBattleText6:
	text "I heard there are"
	line "some very rare"
	cont "fossils here."
	done

_MtMoon1BattleText7:
	text "Suspicious men"
	line "are in the cave."
	cont "What about you?"
	done

_MtMoon1EndBattleText7:
	text "You got me!"
	done

_MtMoon1AfterBattleText7:
	text "I saw them! I'm"
	line "sure they're from"
	cont "TEAM ROCKET!"
	done

_MtMoon1BattleText8:
	text "Go through this"
	line "cave to get to"
	cont "CERULEAN CITY!"
	done

_MtMoon1EndBattleText8:
	text "I lost."
	done

_MtMoon1AfterBattleText8:
	text "ZUBAT is tough!"
	line "But, it can be"
	cont "useful if you"
	cont "catch one."
	done

_MtMoon1Text14:
	text "Beware! ZUBAT is"
	line "a blood sucker!"
	done

MtMoonB1FRB_MapEventHeader: ; 0x1ac4af
	; filler
	db 0, 0

	; warps
	db 5
	warp_def $23, $0e, 1, GROUP_ROUTE_3_RB, MAP_ROUTE_3_RB
	warp_def $23, $0f, 1, GROUP_ROUTE_3_RB, MAP_ROUTE_3_RB
	warp_def $05, $05, 1, GROUP_MT_MOON_B2F_RB, MAP_MT_MOON_B2F_RB
	warp_def $0B, $11, 3, GROUP_MT_MOON_B2F_RB, MAP_MT_MOON_B2F_RB
	warp_def $0F, $19, 4, GROUP_MT_MOON_B2F_RB, MAP_MT_MOON_B2F_RB

	; xy triggers
	db 0

	; signposts
	db 1
	signpost 23, 15, $0, MtMoonB1FRBSignpostScript

	; people-events
	db 13
	person_event SPRITE_POKEFAN_M,   10,  9, $6, 0, 0, -1, -1, 0, 2, 2, Trainer_HikerMarcos, -1
	person_event SPRITE_YOUNGSTER,   20, 16, $9, 0, 0, -1, -1, 0, 2, 3, Trainer_YoungsterJosh, -1
	person_event SPRITE_LASS,         8, 34, $6, 0, 0, -1, -1, 0, 2, 3, Trainer_LassMiriam, -1
	person_event SPRITE_SUPER_NERD,  35, 28, $7, 0, 0, -1, -1, 0, 2, 3, Trainer_SuperNerdJovan, -1
	person_event SPRITE_LASS,        27, 20, $6, 0, 0, -1, -1, 0, 2, 3, Trainer_LassIris, -1
	person_event SPRITE_BUG_CATCHER, 26, 11, $6, 0, 0, -1, -1, 0, 2, 3, Trainer_BugCatcherKent, -1
	person_event SPRITE_BUG_CATCHER, 31, 34, $9, 0, 0, -1, -1, 0, 2, 3, Trainer_BugCatcherRobby, -1
	person_event SPRITE_POKE_BALL, 24,  6, $1, 0, 0, -1, -1, 0, 1, 0, Item_MtMoonB1FRBPotion1,    EVENT_MT_MOON_B1F_POTION_1
	person_event SPRITE_POKE_BALL,  6,  6, $1, 0, 0, -1, -1, 0, 1, 0, Item_MtMoonB1FRBMoonStone,  EVENT_MT_MOON_B1F_MOON_STONE
	person_event SPRITE_POKE_BALL, 35, 39, $1, 0, 0, -1, -1, 0, 1, 0, Item_MtMoonB1FRBRareCandy,  EVENT_MT_MOON_B1F_RARE_CANDY
	person_event SPRITE_POKE_BALL, 27, 40, $1, 0, 0, -1, -1, 0, 1, 0, Item_MtMoonB1FRBEscapeRope, EVENT_MT_MOON_B1F_ESCAPE_ROPE
	person_event SPRITE_POKE_BALL, 37, 24, $1, 0, 0, -1, -1, 0, 1, 0, Item_MtMoonB1FRBPotion2,    EVENT_MT_MOON_B1F_POTION_2
	person_event SPRITE_POKE_BALL, 36,  9, $1, 0, 0, -1, -1, 0, 1, 0, Item_MtMoonB1FRBTMSunnyDay, EVENT_MT_MOON_B1F_SUNNY_DAY
