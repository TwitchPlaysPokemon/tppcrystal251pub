BlackthornGymRematch2F_MapScriptHeader:
	; triggers
	db 0

	; callback count
	db 1
	dbw 3, BlackthornRematch2FBoulder_CheckIfOverWarp

BoulderScriptRematch2F: ; 0x19575e
	jumpstd strengthboulder

BlackthornRematch2FBoulder_CheckIfOverWarp:
	writecmdqueue CmdQueue_BlackthornRematch2FBoulder
	return

CmdQueue_BlackthornRematch2FBoulder:
	dbw 2, BlackthornRematch2F_BoulderTable ; check if any stones are sitting on a warp
	db 0, 0 ; filler

BlackthornRematch2F_BoulderTable:
	db 7, 2 ; warp, person
	dw BlackthornRematch_Boulder1_Pushed
	db 8, 3 ; warp, person
	dw BlackthornRematch_Boulder2_Pushed
	db 9, 4 ; warp, person
	dw BlackthornRematch_Boulder3_Pushed
	db 10, 5 ; warp, person
	dw BlackthornRematch_Boulder4_Pushed
	db $ff

BlackthornRematch_Boulder1_Pushed: ; 0x19573d
	disappear 2
	jump BlackthornRematch_PushedBoulder
	end

BlackthornRematch_Boulder2_Pushed: ; 0x19573d
	disappear 3
	jump BlackthornRematch_PushedBoulder
	end

BlackthornRematch_Boulder3_Pushed: ; 0x19573d
	disappear 4
	jump BlackthornRematch_PushedBoulder
	end

BlackthornRematch_Boulder4_Pushed: ; 0x19573d
	disappear 5
	jump BlackthornRematch_PushedBoulder
	end

BlackthornRematch_PushedBoulder:
	pause 30
	playsound SFX_STRENGTH
	earthquake 80
	loadfont
	writetext BlackthornRematch_PushBoulderText
	waitbutton
	closetext
	end

Trainer_CoolsibsMingLee1:
	trainer EVENT_BLACKTHORN_REMATCH_TRAINER_4, COOL_SIBLINGS, MINGLEE1, CoolsibsMingLee1TextBefore, CoolsibsMingLee1TextWin, 0, .Script
.Script
	talkaftercancel
	faceplayer
	loadfont
	writetext CoolsibsMingLee1TextAfter
	waitbutton
	closetext
	end

Trainer_CoolsibsMingLee2:
	trainer EVENT_BLACKTHORN_REMATCH_TRAINER_4, COOL_SIBLINGS, MINGLEE2, CoolsibsMingLee2TextBefore, CoolsibsMingLee2TextWin, 0, .Script
.Script
	talkaftercancel
	faceplayer
	loadfont
	writetext CoolsibsMingLee2TextAfter
	waitbutton
	closetext
	end

; <text goes here>
BlackthornRematch_PushBoulderText: ; 0x1958a5
	text "The boulder fell"
	line "through!"
	done

CoolsibsMingLee1TextBefore:
	text "MING: CLAIR asked"
	line "us to stop you, no"
	cont "matter what!"
	done

CoolsibsMingLee2TextBefore:
	text "LEE: If the GYM"
	line "LEADER wants you"

	para "out, there must be"
	line "a good reason for"
	cont "it."
	done

CoolsibsMingLee1TextWin:
	text "MING: We failed?"

	para "LEE: Is it because"
	line "you're so strong?"
	done

CoolsibsMingLee2TextWin:
	text "LEE: Is it because"
	line "you're so strong?"

	para "MING: We failed?"
	done

CoolsibsMingLee1TextAfter:
	text "MING: I guess"
	line "there's no stop-"
	cont "ping you now<...>"
	done

CoolsibsMingLee2TextAfter:
	text "LEE: That power<...>"

	para "Could it be what"
	line "CLAIR's been mis-"
	cont "sing?"
	done

BlackthornGymRematch2F_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 10
	warp_def $15, $d, 3, GROUP_BLACKTHORNGYMREMATCH1F, MAP_BLACKTHORNGYMREMATCH1F
	warp_def $d, $5, 4, GROUP_BLACKTHORNGYMREMATCH1F, MAP_BLACKTHORNGYMREMATCH1F
	warp_def $9, $9, 5, GROUP_BLACKTHORNGYMREMATCH1F, MAP_BLACKTHORNGYMREMATCH1F
	warp_def $9, $3, 6, GROUP_BLACKTHORNGYMREMATCH1F, MAP_BLACKTHORNGYMREMATCH1F
	warp_def $3, $d, 7, GROUP_BLACKTHORNGYMREMATCH1F, MAP_BLACKTHORNGYMREMATCH1F
	warp_def $9, $f, 8, GROUP_BLACKTHORNGYMREMATCH1F, MAP_BLACKTHORNGYMREMATCH1F

	warp_def $d, $c, 9, GROUP_BLACKTHORNGYMREMATCH1F, MAP_BLACKTHORNGYMREMATCH1F
	warp_def $11, $6, 10, GROUP_BLACKTHORNGYMREMATCH1F, MAP_BLACKTHORNGYMREMATCH1F
	warp_def $d, $2, 11, GROUP_BLACKTHORNGYMREMATCH1F, MAP_BLACKTHORNGYMREMATCH1F
	warp_def $3, $8, 12, GROUP_BLACKTHORNGYMREMATCH1F, MAP_BLACKTHORNGYMREMATCH1F

	; coord events
	db 0

	; bg events
	db 0

	; object events
	db 7
	person_event SPRITE_BOULDER, 23, 18, $19, 0, 0, -1, -1, 0, 0, 0, BoulderScriptRematch2F, EVENT_BLACKTHORN_REMATCH_BOULDER_1
	person_event SPRITE_BOULDER, 25, 5, $19, 0, 0, -1, -1, 0, 0, 0, BoulderScriptRematch2F, EVENT_BLACKTHORN_REMATCH_BOULDER_2
	person_event SPRITE_BOULDER, 22, 5, $19, 0, 0, -1, -1, 0, 0, 0, BoulderScriptRematch2F, EVENT_BLACKTHORN_REMATCH_BOULDER_3
	person_event SPRITE_BOULDER, 8, 5, $19, 0, 0, -1, -1, 0, 0, 0, BoulderScriptRematch2F, EVENT_BLACKTHORN_REMATCH_BOULDER_4
	person_event SPRITE_BOULDER, 8, 4, $19, 0, 0, -1, -1, 0, 0, 0, BoulderScriptRematch2F, EVENT_BLACKTHORN_REMATCH_BOULDER_5
	person_event SPRITE_COOLTRAINER_M, 21, 6, $6, 0, 0, -1, -1, 0, 2, 1, Trainer_CoolsibsMingLee1, -1
	person_event SPRITE_COOLTRAINER_F, 21, 7, $6, 0, 0, -1, -1, 0, 2, 1, Trainer_CoolsibsMingLee2, -1

