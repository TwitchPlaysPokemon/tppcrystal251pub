Route5SaffronCityGateRB_MapScriptHeader: ; 0x18b5b7
	; trigger count
	db 2
	dw .Trigger0, 0
	dw .Trigger1, 0

	; callback count
	db 0
; 0x18b5b9
.Trigger0
	end
.Trigger1
	end

Route5SaffronCityGateRB_TriggerScript:
	spriteface $0, LEFT
	loadfont
	writetext SaffronGateRBThirstyText
	waitbutton
	closetext
	applymovement $0, SaffronGateRBPushUp
	end

Route5SaffronCityGateRB_MapEventHeader: ; 0x18b60b
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $0, $4, 2, GROUP_ROUTE_5_RB, MAP_ROUTE_5_RB
	warp_def $0, $5, 3, GROUP_ROUTE_5_RB, MAP_ROUTE_5_RB

	; xy triggers
	db 6
	xy_trigger 0, 4, 2, $0, Route5SaffronCityGateRB_TriggerScript, 0, 0
	xy_trigger 0, 4, 3, $0, Route5SaffronCityGateRB_TriggerScript, 0, 0
	xy_trigger 0, 4, 4, $0, Route5SaffronCityGateRB_TriggerScript, 0, 0
	xy_trigger 0, 4, 5, $0, Route5SaffronCityGateRB_TriggerScript, 0, 0
	xy_trigger 0, 4, 6, $0, Route5SaffronCityGateRB_TriggerScript, 0, 0
	xy_trigger 0, 4, 7, $0, Route5SaffronCityGateRB_TriggerScript, 0, 0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_OFFICER, 8, 4, $9, 0, 0, -1, -1, 8 + PAL_OW_BLUE, 0, 0, ObjectEvent, -1
; 0x18b632

