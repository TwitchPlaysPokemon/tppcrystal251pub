BillsGarden_MapScriptHeader:
	; triggers
	db 0

	; callbacks
	db 0

; <scripts go here>
MewScript_BillsGarden:
	dw EVENT_SAW_MEW_IN_GARDEN, .Script
.Script
	appear $2
	checkcode VAR_FACING
	if_equal UP, .down
	applymovement $2, Movement_MewWalkDown
	jump .resume

.down
	follow $0, $2
	applymovement $0, Movement_MewPushesPlayerDown
	stopfollow
.resume
	loadfont
	writetext MewText_BillsGarden
	cry MEW
	waitbutton
	closetext
	setevent EVENT_SAW_MEW_IN_GARDEN
	playsound SFX_WARP_FROM
	checkcode VAR_FACING
	if_equal UP, .down2
	spriteface $0, DOWN
	applymovement $2, Movement_MewFliesOff
	waitsfx
	disappear $2
	end

.down2
	spriteface $0, DOWN
	applymovement $2, Movement_MewFliesOff2
	waitsfx
	disappear $2
	end

BillsGarden_HiddenMiracleBerry:
	dwb EVENT_BILLS_GARDEN_MIRACLEBERRY, MIRACLEBERRY

Movement_MewWalkDown:
	step_down
	step_end

Movement_MewPushesPlayerDown:
	fix_facing
	step_down
	remove_fixed_facing
	step_end

Movement_MewFliesOff2:
	big_step_right
Movement_MewFliesOff:
	big_step_down
	big_step_down
	big_step_down
	big_step_down
	big_step_down
	big_step_down
	step_end
; <text goes here>
MewText_BillsGarden:
	text "Mew!!"
	done

BillsGarden_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 2
	warp_def 33, 17, 3, GROUP_BILLS_HOUSE, MAP_BILLS_HOUSE
	warp_def 33, 18, 3, GROUP_BILLS_HOUSE, MAP_BILLS_HOUSE

	; coord events
	db 0

	; bg events
	db 2
	signpost 11, 22, $6, MewScript_BillsGarden
	signpost 9, 6, $7, BillsGarden_HiddenMiracleBerry

	; object events
	db 1
	person_event SPRITE_MONSTER, 15, 26, $0, 0, 0, -1, -1, 0, 0, 0, ObjectEvent, EVENT_UNLOCKED_GARDEN

