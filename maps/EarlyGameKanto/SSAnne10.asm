SSAnne10_MapScriptHeader:
	db 0
	db 0

Trainer_SSAnne10Sailor1:
	trainer EVENT_S_S_ANNE_10_SAILOR_1, SAILOR, PHILLIP_RB, _SSAnne10BattleText1, _SSAnne10EndBattleText1, 0, .Script
.Script
	talkaftercancel
	loadfont
	writetext _SSAnne10AfterBattleText1
	waitbutton
	closetext
	end

Trainer_SSAnne10Sailor2:
	trainer EVENT_S_S_ANNE_10_SAILOR_2, SAILOR, HUEY_RB, _SSAnne10BattleText2, _SSAnne10EndBattleText2, 0, .Script
.Script
	talkaftercancel
	loadfont
	writetext _SSAnne10AfterBattleText2
	waitbutton
	closetext
	end

Trainer_SSAnne10Sailor3:
	trainer EVENT_S_S_ANNE_10_SAILOR_3, SAILOR, DYLAN_RB, _SSAnne10BattleText3, _SSAnne10EndBattleText3, 0, .Script
.Script
	talkaftercancel
	loadfont
	writetext _SSAnne10AfterBattleText3
	waitbutton
	closetext
	end

Trainer_SSAnne10Sailor4:
	trainer EVENT_S_S_ANNE_10_SAILOR_4, SAILOR, DUNCAN_RB, _SSAnne10BattleText4, _SSAnne10EndBattleText4, 0, .Script
.Script
	talkaftercancel
	loadfont
	writetext _SSAnne10AfterBattleText4
	waitbutton
	closetext
	end

Trainer_SSAnne10Sailor5:
	trainer EVENT_S_S_ANNE_10_SAILOR_5, SAILOR, LEONARD_RB, _SSAnne10BattleText5, _SSAnne10EndBattleText5, 0, .Script
.Script
	talkaftercancel
	loadfont
	writetext _SSAnne10AfterBattleText5
	waitbutton
	closetext
	end

Trainer_SSAnne10Fisher:
	trainer EVENT_S_S_ANNE_10_FISHER, FISHER, BARNY_RB, _SSAnne10BattleText6, _SSAnne10EndBattleText6, 0, .Script
.Script
	talkaftercancel
	loadfont
	writetext _SSAnne10AfterBattleText6
	waitbutton
	closetext
	end

SSAnne10CooltrainerMScript:
	jumptextfaceplayer _SSAnne10Text7

SSAnne10MachopScript:
	loadfont
	writetext _SSAnne10Text8
	cry MACHOKE
	waitbutton
	closetext
	end

SSAnne10Ether:
	db ETHER, 1
SSAnne10Nugget:
	db NUGGET, 1
SSAnne10MaxPotion:
	db MAX_POTION, 1

SSAnne10BedScript:
	loadfont
	writetext _SSAnne10BedText1
	waitbutton
	closetext
	special Special_FadeToBlack
	special Functiond91
	playmusic MUSIC_HEAL
	special HealParty
	checkevent EVENT_S_S_ANNE_RUBBED_CAPTAINS_BACK
	iffalse .skip_timer
	special DecrementSSAnneTimer
.skip_timer
	blackoutmod GROUP_S_S_ANNE_10, MAP_S_S_ANNE_10
	pause 60
	special Function8c0ab
	special RestartMapMusic
	loadfont
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .female
	writetext _SSAnne10BedText2
	waitbutton
	closetext
	end
.female
	writetext _SSAnne10BedText2F
	waitbutton
	closetext
	end

_SSAnne10Text8:
	text "MACHOKE: Gwoh!"
	line "Goggoh!"
	done

_SSAnne10BattleText1:
	text "You know what they"
	line "say about sailors"
	cont "and fighting!"
	done

_SSAnne10EndBattleText1:
	text "Right!"
	line "Good fight, mate!"
	done

_SSAnne10AfterBattleText1:
	text "Haha! Want to be"
	line "a sailor, mate?"
	done

_SSAnne10BattleText2:
	text "My sailor's pride"
	line "is at stake!"
	done

_SSAnne10EndBattleText2:
	text "Your spirit sank"
	line "me!"
	done

_SSAnne10AfterBattleText2:
	text "Did you see the"
	line "FISHING GURU in"
	cont "VERMILION CITY?"
	done

_SSAnne10BattleText3:
	text "Us sailors have"
	line "#MON too!"
	done

_SSAnne10EndBattleText3:
	text "OK, you're not"
	line "bad."
	done

_SSAnne10AfterBattleText3:
	text "We caught all our"
	line "#MON while"
	cont "out at sea!"
	done

_SSAnne10BattleText4:
	text "I like feisty"
	line "kids like you!@@"

_SSAnne10EndBattleText4:
	text "Argh! Lost it!"
	done

_SSAnne10AfterBattleText4:
	text "Sea #MON live"
	line "in deep water."
	cont "You'll need a ROD!"
	done

_SSAnne10BattleText5:
	text "Matey, you're"
	line "walking the plank"
	cont "if you lose!"
	done

_SSAnne10EndBattleText5:
	text "Argh!"
	line "Beaten by a kid!"
	done

_SSAnne10AfterBattleText5:
	text "Jellyfish some-"
	line "times drift into"
	cont "the ship."
	done

_SSAnne10BattleText6:
	text "Hello stranger!"
	line "Stop and chat!"

	para "All my #MON"
	line "are from the sea!"
	done

_SSAnne10EndBattleText6:
	text "Darn!"
	line "I let that one"
	cont "get away!"
	done

_SSAnne10AfterBattleText6:
	text "I was going to"
	line "make you my"
	cont "assistant too!"
	done

_SSAnne10Text7:
	text "My buddy, MACHOKE,"
	line "is super strong!"

	para "He has enough"
	line "STRENGTH to move"
	cont "big rocks!"
	done

_SSAnne10BedText1:
	text "It's a comfy bed."
	line "Let's take a nap<...>"
	done

_SSAnne10BedText2:
	text "<PLAYER> and his"
	line "#MON woke up"
	cont "feeling refreshed!"
	done

_SSAnne10BedText2F:
	text "<PLAYER> and her"
	line "#MON woke up"
	cont "feeling refreshed!"
	done

SSAnne10_MapEventHeader:
	db 0, 0
	db 12
	db  5,  2, 5, GROUP_S_S_ANNE_4, MAP_S_S_ANNE_4
	db  5,  3, 5, GROUP_S_S_ANNE_4, MAP_S_S_ANNE_4
	db  5, 12, 4, GROUP_S_S_ANNE_4, MAP_S_S_ANNE_4
	db  5, 13, 4, GROUP_S_S_ANNE_4, MAP_S_S_ANNE_4
	db  5, 22, 3, GROUP_S_S_ANNE_4, MAP_S_S_ANNE_4
	db  5, 23, 3, GROUP_S_S_ANNE_4, MAP_S_S_ANNE_4
	db 15,  2, 2, GROUP_S_S_ANNE_4, MAP_S_S_ANNE_4
	db 15,  3, 2, GROUP_S_S_ANNE_4, MAP_S_S_ANNE_4
	db 15, 12, 1, GROUP_S_S_ANNE_4, MAP_S_S_ANNE_4
	db 15, 13, 1, GROUP_S_S_ANNE_4, MAP_S_S_ANNE_4
	db 15, 22, 7, GROUP_S_S_ANNE_4, MAP_S_S_ANNE_4
	db 15, 23, 7, GROUP_S_S_ANNE_4, MAP_S_S_ANNE_4

	db 0

	db 2
	signpost 11, 23, $0, SSAnne10BedScript
	signpost 12, 23, $0, SSAnne10BedScript

	db 11
	person_event SPRITE_SAILOR, 17,  4, $6, 0, 0, -1, -1, 0, 2, 3, Trainer_SSAnne10Sailor1, -1
	person_event SPRITE_SAILOR, 15,  6, $6, 0, 0, -1, -1, 0, 2, 3, Trainer_SSAnne10Sailor2, -1
	person_event SPRITE_SAILOR,  7, 16, $8, 0, 0, -1, -1, 0, 2, 3, Trainer_SSAnne10Sailor3, -1
	person_event SPRITE_SAILOR,  6, 26, $6, 0, 0, -1, -1, 0, 2, 3, Trainer_SSAnne10Sailor4, -1
	person_event SPRITE_SAILOR,  6,  4, $9, 0, 0, -1, -1, 0, 2, 3, Trainer_SSAnne10Sailor5, -1
	person_event SPRITE_FISHER,  8,  4, $9, 0, 0, -1, -1, 0, 2, 3, Trainer_SSAnne10Fisher, -1
	person_event SPRITE_COOLTRAINER_M, 17, 14, $9, 0, 0, -1, -1, 0, 0, 0, SSAnne10CooltrainerMScript, -1
	person_event SPRITE_MACHOP, 16, 15, $16, 0, 0, -1, -1, 0, 0, 0, SSAnne10MachopScript, -1
	person_event SPRITE_POKE_BALL, 6, 24, $1, 0, 0, -1, -1, 0, 1, 0, SSAnne10Ether, EVENT_S_S_ANNE_10_ETHER
	person_event SPRITE_POKE_BALL, 6, 14, $1, 0, 0, -1, -1, 0, 1, 0, SSAnne10Nugget, EVENT_S_S_ANNE_10_NUGGET
	person_event SPRITE_POKE_BALL, 15, 16, $1, 0, 0, -1, -1, 0, 1, 0, SSAnne10MaxPotion, EVENT_S_S_ANNE_10_MAX_POTION
