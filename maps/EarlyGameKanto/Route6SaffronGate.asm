Route6SaffronGateRB_MapScriptHeader: ; 0x18b6b7
	; trigger count
	db 2
	dw .Trigger0, 0
	dw .Trigger1, 0

	; callback count
	db 0
; 0x18b6b9
.Trigger0
	end
.Trigger1
	end

Route6SaffronGateRB_TriggerScript:
	spriteface $0, LEFT
	loadfont
	writetext SaffronGateRBThirstyText
	waitbutton
	closetext
	applymovement $0, SaffronGateRBPushDown
	end

SaffronGateRBThirstyText:
	text "Gee, I sure am"
	line "thirsty<...>"

	para "Oh, wait there,"
	line "the road's closed."
	done

SaffronGateRBPushDown:
	step_down
	step_end

SaffronGateRBPushUp:
	step_up
	step_end

Route6SaffronGateRB_MapEventHeader: ; 0x18b60b
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $4, 2, GROUP_ROUTE_6_RB, MAP_ROUTE_6_RB
	warp_def $7, $5, 2, GROUP_ROUTE_6_RB, MAP_ROUTE_6_RB

	; xy triggers
	db 6
	xy_trigger 0, 4, 2, $0, Route6SaffronGateRB_TriggerScript, 0, 0
	xy_trigger 0, 4, 3, $0, Route6SaffronGateRB_TriggerScript, 0, 0
	xy_trigger 0, 4, 4, $0, Route6SaffronGateRB_TriggerScript, 0, 0
	xy_trigger 0, 4, 5, $0, Route6SaffronGateRB_TriggerScript, 0, 0
	xy_trigger 0, 4, 6, $0, Route6SaffronGateRB_TriggerScript, 0, 0
	xy_trigger 0, 4, 7, $0, Route6SaffronGateRB_TriggerScript, 0, 0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_OFFICER, 8, 4, $9, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, ObjectEvent, -1
; 0x18b632

