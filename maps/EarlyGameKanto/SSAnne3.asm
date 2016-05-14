SSAnne3_MapScriptHeader:
	db 2
	dw .Trigger0, 0
	dw .Trigger1, 0
	db 0
.Trigger0
	end
.Trigger1
	end
SSAnne3SimonTrigger:
	appear $3
	applymovement $3, SSAnneSimonMovementData1
	playsound SFX_TACKLE
	clearflag ENGINE_BOULDERBADGE
	clearflag ENGINE_CASCADEBADGE
	applymovement $3, SSAnneSimonMovementData2
	loadfont
	writetext SSAnneSimonText
	waitbutton
	closetext
	applymovement $0, SSAnneSimonMovementData3
	applymovement $3, SSAnneSimonMovementData4
	disappear $3
	playsound SFX_EXIT_BUILDING
	waitsfx
	pause 30
	showemote $0, $0, 15
	pause 15
	loadfont
	writetext SSAnneBadgesGoneText
	waitbutton
	closetext
	dotrigger 0
	end

SSAnne3SailorScript:
	jumptextfaceplayer _SSAnne3Text1

SSAnneSimonMovementData1:
	big_step_right
SSAnneSimonMovementData4:
	big_step_right
	big_step_right
	big_step_right
	step_end

SSAnneSimonMovementData2:
	fix_facing
	fast_jump_step_left
	remove_fixed_facing
	accelerate_last
	accelerate_last
	big_step_right
	big_step_right
	step_end

SSAnneSimonMovementData3:
	step_up
	turn_head_down
	step_end

_SSAnne3Text1:
	text "Our CAPTAIN is a"
	line "sword master!"

	para "He even teaches"
	line "CUT to #MON!"
	done

SSAnneSimonText:
	text "Whoops!"
	line "Excuse me!"
	done

SSAnneBadgesGoneText:
	text "<PLAYER>'s BADGE"
	line "CASE had fallen!"

	para "<PLAYER> went to"
	line "pick it up<...>"

	para "But the BADGES are"
	line "gone!"
	done

SSAnne3_MapEventHeader:
	db 0,0
	db 2
	warp_def 3,  0, 1, GROUP_S_S_ANNE_5, MAP_S_S_ANNE_5
	warp_def 3, 19, 8, GROUP_S_S_ANNE_2, MAP_S_S_ANNE_2

	db 1
	xy_trigger 1, 3, 17, $0, SSAnne3SimonTrigger, 0, 0

	db 0

	db 2
	person_event SPRITE_SAILOR, 7, 11, $5, 0, 3, -1, -1, 0, 0, 0, SSAnne3SailorScript, EVENT_ROCKET_TAKEOVER_OF_SS_ANNE
	person_event SPRITE_PHARMACIST, 7, 16, $9, 0, 0, -1, -1, 8 + PAL_OW_GREEN, 0, 0, ObjectEvent, EVENT_SS_ANNE_SIMON
