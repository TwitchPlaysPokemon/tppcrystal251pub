CeladonGameCorner_MapScriptHeader: ; 0x7211b
	; trigger count
	db 0

	; callback count
	db 0
; 0x7211d

ClerkScript_0x7211d: ; 0x7211d
	jumpstd gamecornercoinvendor
; 0x72120

ReceptionistScript_0x72120: ; 0x72120
	jumptextfaceplayer UnknownText_0x721d0
; 0x72123

PokefanMScript_0x72123: ; 0x72123
	faceplayer
	loadfont
	writetext UnknownText_0x72215
	waitbutton
	closetext
	spriteface $4, $2
	end
; 0x7212e

TeacherScript_0x7212e: ; 0x7212e
	faceplayer
	loadfont
	writetext UnknownText_0x72242
	waitbutton
	closetext
	spriteface $5, $3
	end
; 0x72139

FishingGuruScript_0x72139: ; 0x72139
	faceplayer
	loadfont
	writetext UnknownText_0x72295
	waitbutton
	closetext
	spriteface $6, $3
	end
; 0x72144

CeladonVoltorbFlipGuyScript:
	faceplayer
	loadfont
	writetext CeladonVoltorbFlipGuyText
	waitbutton
	closetext
	spriteface $b, $3
	end

FisherScript_0x72144: ; 0x72144
	faceplayer
	loadfont
	checkevent EVENT_GOT_COINS_FROM_GAMBLER_AT_CELADON
	iftrue .UnknownScript_0x72169
	writetext UnknownText_0x722dc
	buttonsound
	checkitem COIN_CASE
	iffalse UnknownScript_0x7217b
	checkcoins MAX_COINS - 1
	if_equal $0, UnknownScript_0x72184
	stringtotext .coinname, $1
	scall .UnknownScript_0x72172
	givecoins 18
	setevent EVENT_GOT_COINS_FROM_GAMBLER_AT_CELADON
.UnknownScript_0x72169 ; 0x72169
	writetext UnknownText_0x72345
	waitbutton
	closetext
	spriteface $fe, $2
	end
; 0x72172

.UnknownScript_0x72172 ; 0x72172
	jumpstd receiveitem
	end
; 0x72176

.coinname ; 0x72176
	db "COIN@"
; 0x7217b

UnknownScript_0x7217b: ; 0x7217b
	writetext UnknownText_0x7238a
	waitbutton
	closetext
	spriteface $fe, $2
	end
; 0x72184

UnknownScript_0x72184: ; 0x72184
	writetext UnknownText_0x723d9
	waitbutton
	closetext
	spriteface $fe, $2
	end
; 0x7218d

CeladonGymGuyScript: ; 0x7218d
	jumptextfaceplayer CeladonGymGuyText
; 0x72190

GrampsScript_0x72190: ; 0x72190
	faceplayer
	loadfont
	writetext UnknownText_0x724ad
	waitbutton
	closetext
	spriteface $a, $2
	end
; 0x7219b

MapCeladonGameCornerSignpost36Script: ; 0x7219b
	jumptext UnknownText_0x724f3
; 0x7219e

MapCeladonGameCornerSignpost37Script: ; 0x7219e
	jumptext UnknownText_0x72521
; 0x721a1

MapCeladonGameCornerSignpost35Script: ; 0x721a1
	random $6
	if_equal $0, MapCeladonGameCornerSignpost16Script
	refreshscreen $0
	writebyte $0
	special Functionc373
	closetext
	end
; 0x721b0

MapCeladonGameCornerSignpost16Script: ; 0x721b0
	refreshscreen $0
	writebyte $1
	special Functionc373
	closetext
	end
; 0x721b9

MapCeladonGameCornerSignpost11Script: ; 0x721b9
	refreshscreen $0
	special Functionc380
	closetext
	end
; 0x721c0

MapCeladonGameCornerSignpost32Script: ; 0x721c0
	jumptext UnknownText_0x7254f
; 0x721c3

MapCeladonGameCornerSignpost9Script: ; 0x721c3
	loadfont
	writetext UnknownText_0x72567
	waitbutton
	special Functionc380
	closetext
	end
; 0x721cd
MapCeladonGameCornerVFlipSignpostScript: ; 0x56e2e
	loadfont
	checkitem COIN_CASE
	iffalse .NoCoinCase
	checkcoins 3
	if_equal $2, .NotEnoughCoins
	writetext CeladonVoltorbFlipText
	waitbutton
	closetext
	refreshscreen $0
	special Special_VoltorbFlip
	closetext
	if_equal 10, .ReachedLevel10
	end
; 0x56e31
.NotEnoughCoins
	writetext CeladonVoltorbFlipNotEnoughCoinsText
	waitbutton
	closetext
	end
.NoCoinCase
	writetext CeladonVoltorbFlipNoCoinCaseText
	waitbutton
	closetext
	end

.ReachedLevel10
	loadfont
	writetext CeladonVoltorbFlipReachedHighestLevel
	waitbutton
	verbosegiveitem MASTER_BALL, 1
	iffalse .nope
	writetext CeladonVoltorbFlipReceivedMasterBallText
.nope
	waitbutton
	closetext
	end

MovementData_0x721cd: ; 0x721cd
; Unreferenced.
	step_right
	turn_head_left
	step_end
; 0x721d0

UnknownText_0x721d0: ; 0x721d0
	text "Welcome!"

	para "You may exchange"
	line "your coins for"

	para "fabulous prizes"
	line "next door."
	done
; 0x72215

UnknownText_0x72215: ; 0x72215
	text "The slot machines"
	line "are all state of"
	cont "the art."
	done
; 0x72242

UnknownText_0x72242: ; 0x72242
	text "Apparently there"
	line "is a very rare"

	para "#MON available"
	line "as a prize in"

	para "the CELADON"
	line "GAME CORNER<...>"
	done
; 0x72295

UnknownText_0x72295: ; 0x72295
	text "I think this slot"
	line "machine will pay"
	cont "out<...>"

	para "The odds vary"
	line "among machines."
	done
; 0x722dc

UnknownText_0x722dc: ; 0x722dc
	text "Gahahaha!"

	para "The coins just"
	line "keep popping out!"

	para "Hm? What, kid? You"
	line "want to play?"

	para "I'll share my luck"
	line "with you!"
	done
; 0x72345

UnknownText_0x72345: ; 0x72345
	text "Gahahaha!"

	para "It makes me feel"
	line "good to do nice"

	para "things for other"
	line "people!"
	done
; 0x7238a

UnknownText_0x7238a: ; 0x7238a
	text "Hey, you don't"
	line "have a COIN CASE."

	para "How am I supposed"
	line "to give you any"
	cont "coins, kid?"
	done
; 0x723d9

UnknownText_0x723d9: ; 0x723d9
	text "Hey, your COIN"
	line "CASE is full, kid."

	para "You must be riding"
	line "a winning streak"
	cont "too."
	done
; 0x72425

CeladonGymGuyText: ; 0x72425
	text "Hey! CHAMP!"

	para "Are you playing"
	line "the slots too?"

	para "I'm trying to get"
	line "enough coins for a"
	cont "prize #MON."

	para "But I don't have"
	line "enough coins yet<...>"
	done
; 0x724ad

UnknownText_0x724ad: ; 0x724ad
	text "Hmmm<...> The odds are"
	line "surely better for"

	para "PIKACHU's line,"
	line "but<...> What to do?"
	done
; 0x724f3

UnknownText_0x724f3: ; 0x724f3
	text "Hey!"

	para "Underneath this"
	line "poster<...>"

	para "There's nothing!"
	done
; 0x72521

UnknownText_0x72521: ; 0x72521
	text "Hey!"

	para "Underneath this"
	line "poster<...>"

	para "There's nothing!"
	done
; 0x7254f

UnknownText_0x7254f: ; 0x7254f
	text "There's a lighter"
	line "here."
	done
; 0x72567

UnknownText_0x72567: ; 0x72567
	text "A can of soda<...>"

	para "Someone must be"
	line "coming back<...>"

	para "Huh? It's empty!"
	done
; 0x725a4
CeladonVoltorbFlipGuyText:
	text "I'm trying out a"
	line "fun new game here."

	para "Sit across from me"
	line "to play!"
	done

CeladonVoltorbFlipText:
	text "Let's play some"
	line "VOLTORB FLIP!"
	done

CeladonVoltorbFlipNotEnoughCoinsText:
	text "You need 3 coins"
	line "to play this game."
	done

CeladonVoltorbFlipReachedHighestLevel:
	text "Splendid! Marve-"
	line "lous!"

	para "You've reached the"
	line "highest possible"

	para "level in VOLTORB"
	line "FLIP!"

	para "This deserves a"
	line "special reward."

	para "Here, take this."
	done

CeladonVoltorbFlipReceivedMasterBallText:
	text "Come back and play"
	line "again any time!"
	done

CeladonVoltorbFlipNoCoinCaseText:
	text "You need to have a"
	line "COIN CASE to play."
	done

CeladonGameCorner_MapEventHeader: ; 0x725a4
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $d, $e, 6, GROUP_CELADON_CITY, MAP_CELADON_CITY
	warp_def $d, $f, 6, GROUP_CELADON_CITY, MAP_CELADON_CITY

	; xy triggers
	db 0

	; signposts
	db 39
	signpost 6, 1, $0, MapCeladonGameCornerSignpost11Script
	signpost 7, 1, $0, MapCeladonGameCornerSignpost11Script
	signpost 8, 1, $0, MapCeladonGameCornerSignpost11Script
	signpost 9, 1, $0, MapCeladonGameCornerSignpost11Script
	signpost 10, 1, $0, MapCeladonGameCornerSignpost11Script
	signpost 11, 1, $4, MapCeladonGameCornerSignpost11Script
	signpost 6, 6, $0, MapCeladonGameCornerSignpost11Script
	signpost 7, 6, $0, MapCeladonGameCornerSignpost11Script
	signpost 8, 6, $0, MapCeladonGameCornerSignpost11Script
	signpost 9, 6, $0, MapCeladonGameCornerSignpost9Script
	signpost 10, 6, $0, MapCeladonGameCornerSignpost11Script
	signpost 11, 6, $3, MapCeladonGameCornerSignpost11Script
	signpost 6, 7, $0, MapCeladonGameCornerSignpost35Script
	signpost 7, 7, $0, MapCeladonGameCornerSignpost35Script
	signpost 8, 7, $0, MapCeladonGameCornerSignpost35Script
	signpost 9, 7, $0, MapCeladonGameCornerSignpost35Script
	signpost 10, 7, $0, MapCeladonGameCornerSignpost16Script
	signpost 11, 7, $4, MapCeladonGameCornerSignpost35Script
	signpost 6, 12, $0, MapCeladonGameCornerSignpost35Script
	signpost 7, 12, $0, MapCeladonGameCornerSignpost35Script
	signpost 8, 12, $0, MapCeladonGameCornerSignpost35Script
	signpost 9, 12, $0, MapCeladonGameCornerSignpost35Script
	signpost 10, 12, $0, MapCeladonGameCornerSignpost35Script
	signpost 11, 12, $3, MapCeladonGameCornerSignpost35Script
	signpost 6, 13, $0, MapCeladonGameCornerSignpost35Script
	signpost 7, 13, $0, MapCeladonGameCornerSignpost35Script
	signpost 8, 13, $0, MapCeladonGameCornerSignpost35Script
	signpost 9, 13, $0, MapCeladonGameCornerSignpost35Script
	signpost 10, 13, $0, MapCeladonGameCornerSignpost35Script
	signpost 11, 13, $4, MapCeladonGameCornerSignpost35Script
	signpost 6, 18, $0, MapCeladonGameCornerSignpost35Script
	signpost 7, 18, $0, MapCeladonGameCornerSignpost35Script
	signpost 8, 18, $0, MapCeladonGameCornerSignpost32Script
	signpost 9, 18, $0, MapCeladonGameCornerSignpost35Script
	signpost 10, 18, $0, MapCeladonGameCornerSignpost35Script
	signpost 11, 18, $3, MapCeladonGameCornerSignpost35Script
	signpost 0, 17, $0, MapCeladonGameCornerSignpost36Script
	signpost 0, 13, $0, MapCeladonGameCornerSignpost37Script
	signpost 1, 10, $4, MapCeladonGameCornerVFlipSignpostScript

	; people-events
	db 10
	person_event SPRITE_CLERK, 6, 9, $6, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 0, 0, ClerkScript_0x7211d, -1
	person_event SPRITE_RECEPTIONIST, 6, 7, $6, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 0, 0, ReceptionistScript_0x72120, -1
	person_event SPRITE_POKEFAN_M, 14, 18, $8, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, PokefanMScript_0x72123, -1
	person_event SPRITE_TEACHER, 11, 21, $9, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, TeacherScript_0x7212e, -1
	person_event SPRITE_FISHING_GURU, 11, 15, $9, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 0, 0, FishingGuruScript_0x72139, -1
	person_event SPRITE_FISHER, 14, 12, $8, 0, 0, -1, 2, 8 + PAL_OW_RED, 0, 0, FisherScript_0x72144, -1
	person_event SPRITE_FISHER, 14, 12, $8, 0, 0, -1, 4, 8 + PAL_OW_RED, 0, 0, FisherScript_0x72144, -1
	person_event SPRITE_GYM_GUY, 7, 15, $6, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, CeladonGymGuyScript, -1
	person_event SPRITE_GRAMPS, 12, 6, $8, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 0, 0, GrampsScript_0x72190, -1
	person_event SPRITE_GENTLEMAN, 5, 12, $9, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 0, 0, CeladonVoltorbFlipGuyScript, -1
; 0x726e7

