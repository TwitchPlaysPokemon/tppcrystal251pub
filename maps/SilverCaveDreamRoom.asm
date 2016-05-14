SilverCaveDreamRoom_MapScriptHeader:
	db 0 ; triggers

	db 0 ; callbacks
	; dbw 1, DeleteSilverCaveExit

; DeleteSilverCaveExit:
	; changeblock $9, $21, $2
	; changeblock $9, $23, $5
	; return

DreamBabaScript: ; 0x18c603
	special Functionc48f
	faceplayer
	loadfont
	writetext BabaTextBefore
	waitbutton
	closetext
	winlosstext BabaTextWinLoss, BabaTextWinLoss
	loadtrainer BABA, 1
	writecode VAR_BATTLETYPE, BATTLETYPE_CANLOSE
	startbattle
	reloadmapmusic
	reloadmap
	iftrue .DreamBabaLost
	setevent EVENT_FIRST_TIME_BABA
.DreamBabaLost
	special Functionc48f
	loadfont
	writetext BabaTextAfter
	waitbutton
	closetext
	special Special_FadeToBlack
	special Functiond91
	disappear $2
	pause 15
	special Function8c0ab
	pause 30
	special HealParty
	warp GROUP_DUMMY_BLANK_MAP, MAP_DUMMY_BLANK_MAP, 0, 0
	end

BabaTextBefore: ; 0x18c637
	text $56
	line $56
	done
; 0x18c63c

BabaTextWinLoss:
	text "select"
	done

BabaTextAfter: ; 0x18c63f
	text $56
	line $56
	done
; 0x18c644

SilverCaveDreamRoom_MapEventHeader: ; 0x18c644
	; filler
	db 0, 0

	; warps
	db 0

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_BABA, 14, 13, $7, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, DreamBabaScript, -1
; 0x18c65c
