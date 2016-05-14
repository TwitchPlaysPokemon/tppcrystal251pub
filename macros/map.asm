map: MACRO
	db GROUP_\1, MAP_\1
ENDM

roam_map: MACRO
; A map and an arbitrary number of some more maps.

	map \1
	db  \2

	rept \2
	map \3
	shift
	endr

	db 0
ENDM


person_event: macro
	db \1 ; sprite
	db \2 ; y
	db \3 ; x
	db \4 ; movement function
	;$2 = random wander
	;$6 = stand still facing down
	;$7 = facing up
	;$8 = left
	;$9 = right
	;$3 = look around
	;$4 = random walk y
	;$5 = random walk x
	;$a = fast random spinner
	;$16 = bouncing pokemon
	;$15 = big sprite i.e. snorlax
	;$1e = timed spin counterclockwise
	;$1f = timed spin clockwise
	dn \5, \6 ; radius: y, x
	shift
	db \6 ; clock_hour
	;-1 indicates no time dependence, otherwise time appears
	db \7 ; clock_daytime
	dn \8, \9 ; color_function ;if bit 3 is set, the palette used is given by bits 0-2; otherwise, the default palette is used
	shift
	db \9 ; sight_range
	shift
	dw \9 ; pointer
	shift
	dw \9 ; event flag
	endm
	;0 = run script
	;1 = give item
	;2 = load trainer

signpost: macro
	db \1 ; y
	db \2 ; x
	db \3 ; function
	dw \4 ; pointer
	endm

xy_trigger: macro
	db \1 ; number
	db \2 ; y
	db \3 ; x
	db \4 ; unknown1
	dw \5 ; script
	db \6 ; unknown2
	db \7 ; unknown3
	endm

warp_def: macro
	db \1 ; y
	db \2 ; x
	db \3 ; warp_to
	db \4 ; map group
	db \5 ; map number
	endm


map_header: MACRO
	; label, tileset, permission, location, music, unknown, time of day, fishing group
\1_MapHeader:
	db BANK(\1_SecondMapHeader), \2, \3
	dw \1_SecondMapHeader
	db \4, \5
	dn \6, \7
	db \8
ENDM


map_header_2: MACRO
; label, map, border block, connections
\1_SecondMapHeader::
	db \3
	db \2_HEIGHT, \2_WIDTH
	db BANK(\1_BlockData)
	dw \1_BlockData
	db BANK(\1_MapScriptHeader)
	dw \1_MapScriptHeader
	dw \1_MapEventHeader
	db \4
ENDM

connection: MACRO
if "\1" == "north"
;\2: map id
;\3: map label (eventually will be rolled into map id)
;\4: x
;\5: offset?
;\6: strip length
;\7: this map id
	map \2
	dw \3_BlockData + \2_WIDTH * (\2_HEIGHT - 3) + \5
	dw OverworldMap + \4 + 3
	db \6
	db \2_WIDTH
	db \2_HEIGHT * 2 - 1
	db (\4 - \5) * -2
	dw OverworldMap + \2_HEIGHT * (\2_WIDTH + 6) + 1
endc

if "\1" == "south"
;\2: map id
;\3: map label (eventually will be rolled into map id)
;\4: x
;\5: offset?
;\6: strip length
;\7: this map id
	map \2
	dw \3_BlockData + \5
	dw OverworldMap + (\7_HEIGHT + 3) * (\7_WIDTH + 6) + \4 + 3
	db \6
	db \2_WIDTH
	db 0
	db (\4 - \5) * -2
	dw OverworldMap + \2_WIDTH + 7
endc

if "\1" == "west"
;\2: map id
;\3: map label (eventually will be rolled into map id)
;\4: y
;\5: offset?
;\6: strip length
;\7: this map id
	map \2
	dw \3_BlockData + (\2_WIDTH * \5) + \2_WIDTH - 3
	dw OverworldMap + (\7_WIDTH + 6) * (\4 + 3)
	db \6
	db \2_WIDTH
	db (\4 - \5) * -2
	db \2_WIDTH * 2 - 1
	dw OverworldMap + \2_WIDTH * 2 + 6
endc

if "\1" == "east"
;\2: map id
;\3: map label (eventually will be rolled into map id)
;\4: y
;\5: offset?
;\6: strip length
;\7: this map id
	map \2
	dw \3_BlockData + (\2_WIDTH * \5)
	dw OverworldMap + (\7_WIDTH + 6) * (\4 + 3 + 1) - 3
	db \6
	db \2_WIDTH
	db (\4 - \5) * -2
	db 0
	dw OverworldMap + \2_WIDTH + 7
endc

ENDM

mapgroup: MACRO
GROUP_\1 EQU const_value
	enum MAP_\1
\1_HEIGHT EQU \2
\1_WIDTH EQU \3
ENDM

newgroup: MACRO
const_value = const_value + 1
	enum_start 1
ENDM
