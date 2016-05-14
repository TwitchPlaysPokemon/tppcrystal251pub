OlivineLighthouseElevator_MapScriptHeader: ; OlivineLighthouse_0x56697
	; trigger count
	db 0

	; callback count
	db 0
; OlivineLighthouse_0x56699

MapOlivineLighthouseElevatorSignpost0Script: ; OlivineLighthouse_0x56699
	loadfont
	elevator Elevator_OlivineLighthouse_0x566e0
	closetext
	iffalse UnknownScript_OlivineLighthouse_0x566df
	pause 5
	playsound SFX_ELEVATOR
	earthquake 60
	waitsfx
UnknownScript_OlivineLighthouse_0x566df:
	end
; OlivineLighthouse_0x566e0


Elevator_OlivineLighthouse_0x566e0: ; OlivineLighthouse_0x566e0
	db 2 ; floors
	db _1F,  6, GROUP_OLIVINE_LIGHTHOUSE_1F, MAP_OLIVINE_LIGHTHOUSE_1F
	db _6F,  4, GROUP_OLIVINE_LIGHTHOUSE_6F, MAP_OLIVINE_LIGHTHOUSE_6F
	db $ff ; end
; OlivineLighthouse_0x566fe


OlivineLighthouseElevator_MapEventHeader: ; OlivineLighthouse_0x566fe
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $5, $2, 255, GROUP_OLIVINE_LIGHTHOUSE_1F, MAP_OLIVINE_LIGHTHOUSE_1F
	warp_def $5, $3, 255, GROUP_OLIVINE_LIGHTHOUSE_1F, MAP_OLIVINE_LIGHTHOUSE_1F

	; xy triggers
	db 0

	; signposts
	db 1
	signpost 1, 4, $0, MapOlivineLighthouseElevatorSignpost0Script

	; people-events
	db 0
; OlivineLighthouse_0x56713

