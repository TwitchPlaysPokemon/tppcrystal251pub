SSAnne9_MapScriptHeader:
	db 0
	db 0

SSAnne9Trainer_Gentleman1:
	trainer EVENT_S_S_ANNE_9_GENTLEMAN_1, GENTLEMAN, BROOKS_RB, _SSAnne9BattleText1, _SSAnne9EndBattleText1, 0, .Script
.Script
	talkaftercancel
	loadfont
	writetext _SSAnne9AfterBattleText1
	waitbutton
	closetext
	end

SSAnne9Trainer_Fisher:
	trainer EVENT_S_S_ANNE_9_FISHER, FISHER, DALE_RB, _SSAnne9BattleText2, _SSAnne9EndBattleText2, 0, .Script
.Script
	talkaftercancel
	loadfont
	writetext _SSAnne9AfterBattleText2
	waitbutton
	closetext
	end

SSAnne9Trainer_Gentleman2:
	trainer EVENT_S_S_ANNE_9_GENTLEMAN_2, GENTLEMAN, LAMAR_RB, _SSAnne9BattleText3, _SSAnne9EndBattleText3, 0, .Script
.Script
	talkaftercancel
	loadfont
	writetext _SSAnne9AfterBattleText3
	waitbutton
	closetext
	end

SSAnne9Trainer_Lass:
	trainer EVENT_S_S_ANNE_9_LASS, LASS, DAWN_RB, _SSAnne9BattleText4, _SSAnne9EndBattleText4, 0, .Script
.Script
	talkaftercancel
	loadfont
	writetext _SSAnne9AfterBattleText4
	waitbutton
	closetext
	end


SSAnne9Gentleman1Script:
	faceplayer
	loadfont
	writetext _SSAnne9Text_61bf2
	waitbutton
	closetext
	refreshscreen $0
	pokepic SNORLAX
	waitbutton
	closepokepic
	reloadmappart
	end

SSAnne9MaxEther:
	db MAX_ETHER, 1

SSAnne9Gentleman2Script:
	jumptextfaceplayer _SSAnne9Text_61c01

SSAnne9GrampsScript:
	jumptextfaceplayer _SSAnne9Text_61c10

SSAnne9RareCandy:
	db RARE_CANDY, 1

SSAnne9Gentleman3Script:
	jumptextfaceplayer _SSAnne9Text_61c1f

SSAnne9BugCatcherScript:
	jumptextfaceplayer _SSAnne9Text_61c2e

SSAnne9BuenaScript:
	jumptextfaceplayer _SSAnne9Text_61c3d

SSAnne9PokefanFScript:
	jumptextfaceplayer _SSAnne9Text_61c4c

_SSAnne9Text_61bf2:
	text "In all my travels"
	line "I've never seen"
	cont "any #MON sleep"
	cont "like this one!"

	para "It was something"
	line "like this!"
	done

_SSAnne9Text_61c01:
	text "Ah yes, I have"
	line "seen some #MON"
	cont "ferry people"
	cont "across the water!"
	done

_SSAnne9Text_61c10:
	text "#MON can CUT"
	line "down small bushes."
	done

_SSAnne9Text_61c1f:
	text "Have you gone to"
	line "the SAFARI ZONE"
	cont "in FUCHSIA CITY?"

	para "It had many rare"
	line "kinds of #MON!!"
	done

_SSAnne9Text_61c2e:
	text "Me and my Daddy"
	line "think the SAFARI"
	cont "ZONE is awesome!"
	done

_SSAnne9Text_61c3d:
	text "The CAPTAIN looked"
	line "really sick and"
	cont "pale!"
	done

_SSAnne9Text_61c4c:
	text "I hear many people"
	line "get seasick!"
	done

_SSAnne9BattleText1:
	text "Competing against"
	line "the young keeps"
	cont "me youthful."
	done

_SSAnne9EndBattleText1:
	text "Good fight!"
	line "Ah, I feel"
	cont "young again!"
	done

_SSAnne9AfterBattleText1:
	text "15 years ago, I"
	line "would have won!"
	done

_SSAnne9BattleText2:
	text "Check out what I"
	line "fished up!"
	done

_SSAnne9EndBattleText2:
	text "I'm all out!"
	done

_SSAnne9AfterBattleText2:
	text "Party?"

	para "The cruise ship's"
	line "party should be"
	cont "over by now."
	done

_SSAnne9BattleText3:
	text "Which do you like,"
	line "a strong or a"
	cont "rare #MON?"
	done

_SSAnne9EndBattleText3:
	text "I must salute you!"
	done

_SSAnne9AfterBattleText3:
	text "I prefer strong"
	line "and rare #MON."
	done

_SSAnne9BattleText4:
	text "I never saw you"
	line "at the party."
	done

_SSAnne9EndBattleText4:
	text "Take it easy!"
	done

_SSAnne9AfterBattleText4:
	text "Oh, I adore your"
	line "strong #MON!"
	done



SSAnne9_MapEventHeader:
	db 0, 0

	db 12
	warp_def  5,  2, 1, GROUP_S_S_ANNE_2, MAP_S_S_ANNE_2
	warp_def  5,  3, 1, GROUP_S_S_ANNE_2, MAP_S_S_ANNE_2
	warp_def  5, 12, 2, GROUP_S_S_ANNE_2, MAP_S_S_ANNE_2
	warp_def  5, 13, 2, GROUP_S_S_ANNE_2, MAP_S_S_ANNE_2
	warp_def  5, 22, 3, GROUP_S_S_ANNE_2, MAP_S_S_ANNE_2
	warp_def  5, 23, 3, GROUP_S_S_ANNE_2, MAP_S_S_ANNE_2
	warp_def 15,  2, 4, GROUP_S_S_ANNE_2, MAP_S_S_ANNE_2
	warp_def 15,  3, 4, GROUP_S_S_ANNE_2, MAP_S_S_ANNE_2
	warp_def 15, 12, 5, GROUP_S_S_ANNE_2, MAP_S_S_ANNE_2
	warp_def 15, 13, 5, GROUP_S_S_ANNE_2, MAP_S_S_ANNE_2
	warp_def 15, 22, 6, GROUP_S_S_ANNE_2, MAP_S_S_ANNE_2
	warp_def 15, 23, 6, GROUP_S_S_ANNE_2, MAP_S_S_ANNE_2

	db 0

	db 0

	db 13
	person_event SPRITE_GENTLEMAN,    6, 14, $9, 0, 0, -1, -1, 0, 2, 3, SSAnne9Trainer_Gentleman1, -1
	person_event SPRITE_FISHER,       8, 17, $8, 0, 0, -1, -1, 0, 2, 3, SSAnne9Trainer_Fisher, -1
	person_event SPRITE_GENTLEMAN,   18,  4, $9, 0, 0, -1, -1, 0, 2, 3, SSAnne9Trainer_Gentleman2, -1
	person_event SPRITE_LASS,        15,  6, $6, 0, 0, -1, -1, 0, 2, 3, SSAnne9Trainer_Lass, -1
	person_event SPRITE_GENTLEMAN,    6,  5, $6, 0, 0, -1, -1, 0, 0, 0, SSAnne9Gentleman1Script, -1
	person_event SPRITE_POKE_BALL,    5, 16, $1, 0, 0, -1, -1, 0, 1, 0, SSAnne9MaxEther, EVENT_S_S_ANNE_9_MAX_ETHER
	person_event SPRITE_GENTLEMAN,    6, 25, $6, 0, 0, -1, -1, 0, 0, 0, SSAnne9Gentleman2Script, -1
	person_event SPRITE_GRAMPS,       5, 26, $6, 0, 0, -1, -1, 0, 0, 0, SSAnne9GrampsScript, -1
	person_event SPRITE_POKE_BALL,   16,  4, $1, 0, 0, -1, -1, 0, 1, 0, SSAnne9RareCandy, EVENT_S_S_ANNE_9_RARE_CANDY
	person_event SPRITE_GENTLEMAN,   16, 16, $6, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, SSAnne9Gentleman3Script, -1
	person_event SPRITE_BUG_CATCHER, 18, 15, $3, 0, 0, -1, -1, 0, 0, 0, SSAnne9BugCatcherScript, -1
	person_event SPRITE_BUENA,       16, 26, $8, 0, 0, -1, -1, 0, 0, 0, SSAnne9BuenaScript, -1
	person_event SPRITE_POKEFAN_F,   16, 24, $9, 0, 0, -1, -1, 0, 0, 0, SSAnne9PokefanFScript, -1
