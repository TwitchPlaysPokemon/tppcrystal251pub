CinnabarIsland_MapScriptHeader: ; 0x1ac9a7
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks

	dbw 5, UnknownScript_0x1ac9ac
; 0x1ac9ac

UnknownScript_0x1ac9ac: ; 0x1ac9ac
	setflag ENGINE_FLYPOINT_CINNABAR
	return
; 0x1ac9b0

BlueScript_0x1ac9b0: ; 0x1ac9b0
	faceplayer
	loadfont
	writetext UnknownText_0x1ac9d2
	waitbutton
	closetext
	playsound SFX_WARP_TO
	applymovement $2, MovementData_0x1ac9d0
	disappear $2
	clearevent EVENT_BLUE_IN_HIS_GYM
	end
; 0x1ac9c4

MapCinnabarIslandSignpost1Script: ; 0x1ac9c4
	jumptext UnknownText_0x1acc73
; 0x1ac9c7

MapCinnabarIslandSignpost2Script: ; 0x1ac9c7
	jumptext UnknownText_0x1accc2
; 0x1ac9ca

MapCinnabarIslandSignpost0Script: ; 0x1ac9ca
	jumpstd pokecentersign
; 0x1ac9cd

MapCinnabarIslandSignpostItem3: ; 0x1ac9cd
	dw $00fe
	db RARE_CANDY

; 0x1ac9d0

MapCinnabarIslandSignpost4Script:
	jumptext EnteiCaveSign

MovementData_0x1ac9d0: ; 0x1ac9d0
	teleport_from
	step_end
; 0x1ac9d2


UnknownText_0x1ac9d2: ; 0x1ac9d2
	text "Who are you?"

	para "Well, it's plain"
	line "to see that you're"
	cont "a trainer<...>"

	para "My name's BLUE."

	para "I was once the"
	line "CHAMPION, although"

	para "it was for only a"
	line "short time<...>"

	para "That meddling"
	line "<RED> did me in<...>"

	para "Anyway, what do"
	line "you want? You want"

	para "to challenge me or"
	line "something?"

	para "<...>I hate to say"
	line "it, but I'm not in"

	para "the mood for a"
	line "battle now."

	para "Take a good look"
	line "around you<...>"

	para "A volcano erupts,"
	line "and just like"

	para "that, a whole town"
	line "disappears."

	para "We can go on win-"
	line "ning and losing in"

	para "#MON. But if"
	line "nature so much as"

	para "twitches, we can"
	line "lose in a second."

	para "<...>"

	para "That's the way it"
	line "is<...>"

	para "But, anyway, I'm"
	line "still a trainer."

	para "If I see a strong"
	line "opponent, it makes"
	cont "me want to battle."

	para "If you want to"
	line "battle me, come to"
	cont "the VIRIDIAN GYM."

	para "I'll take you on"
	line "then."
	done
; 0x1acc73

UnknownText_0x1acc73: ; 0x1acc73
	text "There's a notice"
	line "here<...>"

	para "CINNABAR GYM has"
	line "relocated to SEA-"
	cont "FOAM ISLANDS."

	para "BLAINE"
	done
; 0x1accc2

UnknownText_0x1accc2: ; 0x1accc2
	text "CINNABAR ISLAND"

	para "The Fiery Town of"
	line "Burning Desire"
	done
; 0x1accf4

EnteiCaveSign: ; 0x1accc2
	text "You try hard to"
    line "read the sign<...>"
    para "But it is too"
    line "charred to read."
    done

CinnabarIsland_MapEventHeader: ; 0x1accf4
	; filler
	db 0, 0

	; warps
	db 3
	warp_def 15, $b, 1, GROUP_CINNABAR_POKECENTER_1F, MAP_CINNABAR_POKECENTER_1F
	warp_def 7, 22, 1, GROUP_CINNABAR_VOLCANO_ENTRANCE, MAP_CINNABAR_VOLCANO_ENTRANCE
	warp_def 21, 26, 1, GROUP_ENTEI_ROOM, MAP_ENTEI_ROOM

	; xy triggers
	db 0

	; signposts
	db 5
	signpost 15, 12, $0, MapCinnabarIslandSignpost0Script
	signpost 15, 9, $0, MapCinnabarIslandSignpost1Script
	signpost 11, 7, $0, MapCinnabarIslandSignpost2Script
	signpost 23, 25, $0, MapCinnabarIslandSignpost4Script
	signpost 5, 9, $7, MapCinnabarIslandSignpostItem3

	; people-events
	db 1
	person_event SPRITE_BLUE, 14, 12, $3, 0, 0, -1, -1, 0, 0, 0, BlueScript_0x1ac9b0, EVENT_BLUE_IN_CINNABAR
; 0x1acd20

