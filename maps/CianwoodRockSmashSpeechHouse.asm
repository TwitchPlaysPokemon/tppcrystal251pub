CianwoodRockSmashSpeechHouse_MapScriptHeader:
	; triggers
	db 0

	; callbacks
	db 0

CianwoodRockSmashManiac:
	faceplayer
	loadfont
	checkevent EVENT_GOT_TM08_ROCK_SMASH
	iftrue .after_smash
	writetext RockSmashManiacBeforeText
	buttonsound
	checkitem TM_ROCK_SMASH
	iftrue .AlreadyHaveRockSmash
	verbosegiveitem TM_ROCK_SMASH, 1
	jump .after_got_smash

.AlreadyHaveRockSmash
	writetext GotRockSmashText
	buttonsound
.after_got_smash
	setevent EVENT_GOT_TM08_ROCK_SMASH
.after_smash
	writetext RockSmashManiacAfterText
	waitbutton
.cancel
	closetext
	end

RockSmashManiacBeforeText:
	text "Woohoo!"

	para "I hear people call"
	line "me the ROCK SMASH"

	para "guy, but I find"
	line "that sort of de-"
	cont "grading."

	para "I think I deserve"
	line "a bit more res-"
	cont "pect, like maybe"

	para "the ROCK SMASH"
	line "DUDE."

	para "Woohoo!"

	para "Anyways, your"
	line "#MON look"
	cont "pretty strong."

	para "I like that!"
	line "Here, take this"
	cont "TM!"
	done

GotRockSmashText:
	text "Oh? You already"
	line "have one?"

	para "AWESOME!"
	done

RockSmashManiacAfterText:
	text "That TM contains"
	line "ROCK SMASH."

	para "If you come across"
	line "large boulders"

	para "that block your"
	line "path<...>"

	para "Well, use that TM"
	line "move and smash"

	para "them right out of"
	line "your way!"

	para "Yes, sir! Smash"
	line "rocks aside, I"
	cont "say! Woohoo!"
	done

CianwoodRockSmashSpeechHouse_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 8, GROUP_CIANWOOD_CITY, MAP_CIANWOOD_CITY
	warp_def $7, $3, 8, GROUP_CIANWOOD_CITY, MAP_CIANWOOD_CITY

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_SCIENTIST, 7, 6, $6, 0, 0, -1, -1, 0, 0, 0, CianwoodRockSmashManiac, -1
	
