RedsHouse2F_MapScriptHeader: ; 0x19b048
	; trigger count
	db 0

	; callback count
	db 0
; 0x19b04a

MapRedsHouse2FSignpost0Script: ; 0x19b04a
	jumptext UnknownText_0x19b050
; 0x19b04d

MapRedsHouse2FSignpost1Script: ; 0x19b04d
	jumptext UnknownText_0x19b087
; 0x19b050

MapRedsHouse2FBedScript:
	loadfont
	writetext RedsHouse2FComfyBedText
	waitbutton
	closetext
	special Special_FadeToBlack
	special Functiond91
	special Function1060a2
	playmusic MUSIC_HEAL
	special HealParty
	; blackoutmod GROUP_PALLET_TOWN, MAP_PALLET_TOWN
	pause 60
	checkevent EVENT_FIRST_TIME_BABA
	iftrue .skip
	checkcode VAR_BADGES
	if_equal 16, MapRedsHouseBedWarpScript
.skip
	special Function8c0ab
	special RestartMapMusic
	loadfont
	copybytetovar PlayerGender
	iftrue RedsHouse2BedHealedFScript
	writetext RedsHouse2FBedHealedMText
	waitbutton
	closetext
	end

RedsHouse2BedHealedFScript:
	writetext RedsHouse2FBedHealedFText
	waitbutton
	closetext
	end

MapRedsHouseBedWarpScript:
	warp GROUP_DUMMY_BLANK_MAP, MAP_DUMMY_BLANK_MAP, 0, 0
	end

UnknownText_0x19b050: ; 0x19b050
	text "<PLAYER> played the"
	line "N64."

	para "Better get going--"
	line "no time to lose!"
	done
; 0x19b087

UnknownText_0x19b087: ; 0x19b087
	text "It looks like it"
	line "hasn't been used"
	cont "in a long time<...>"
	done
; 0x19b0b9

RedsHouse2FComfyBedText:
	text "It's a comfy bed."
	line "Let's take a nap<...>"
	done

RedsHouse2FBedHealedMText:
	text "<PLAY_G> and his"
	line "#MON were"
	cont "fully healed!"
	done

RedsHouse2FBedHealedFText:
	text "<PLAY_G> and her"
	line "#MON were"
	cont "fully healed!"
	done

RedsHouse2F_MapEventHeader: ; 0x19b0b9
	; filler
	db 0, 0

	; warps
	db 1
	warp_def $0, $7, 3, GROUP_REDS_HOUSE_1F, MAP_REDS_HOUSE_1F

	; xy triggers
	db 0

	; signposts
	db 4
	signpost 5, 3, $0, MapRedsHouse2FSignpost0Script
	signpost 1, 0, $0, MapRedsHouse2FSignpost1Script
	signpost 6, 0, $0, MapRedsHouse2FBedScript
	signpost 7, 0, $0, MapRedsHouse2FBedScript

	; people-events
	db 0
; 0x19b0ce

