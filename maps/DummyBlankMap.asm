DummyBlankMap_MapScriptHeader:
	; triggers
	db 3

	dw DummyBlankMap_Trigger1, $0000
	dw DummyBlankMap_Trigger2, $0000
	dw DummyBlankMap_Trigger3, $0000

	; callbacks
	db 1
	dbw 1, DummyHidePlayer

DummyBlankMap_Trigger1:
	priorityjump DummyMap_WarpCheck1
	end

DummyBlankMap_Trigger2:
	priorityjump DummyMap_WarpCheck2
	end

DummyBlankMap_Trigger3:
	end

DummyHidePlayer:
	disappear $0
	return

DummyMap_WarpCheck1:
	loadfont
	writetext RedsHouse2FDreaming1Text
	waitbutton
	closetext
	playsound SFX_EXIT_BUILDING
	pause 15
	dotrigger $1
	warpfacing $1, GROUP_SILVER_CAVE_DREAM_ROOM, MAP_SILVER_CAVE_DREAM_ROOM, $9, $21
	end

DummyMap_WarpCheck2:
	loadfont
	checkevent EVENT_FIRST_TIME_BABA
	iftrue DummyMap_BeatRed
	writetext RedsHouse2FDreaming2Text
	dotrigger $0
	jump DummyMap_Continue

DummyMap_BeatRed:
	writetext WasItADreamText
DummyMap_Continue
	waitbutton
	closetext
	playsound SFX_EXIT_BUILDING
	pause 15
	warp GROUP_REDS_HOUSE_2F, MAP_REDS_HOUSE_2F, $1, $6
	end

RedsHouse2FDreaming1Text:
	text "While <PLAY_G>"
	line "was sleeping<...>"
	done

RedsHouse2FDreaming2Text:
	text "What a horrible"
	line "nightmare!"
	done

WasItADreamText:
	text "Was it all a"
	line "dream<...>?"
	done

DummyBlankMap_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 0

	; xy triggers
	db 0

	; signposts
	db 0

	; person events
	db 0
