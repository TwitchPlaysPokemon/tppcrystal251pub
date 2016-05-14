; givetm TM_SANDSTORM, EVENT_GOT_TM_SANDSTORM
givetm: macro
	checkevent \2
	iftrue \3
	verbosegiveitem \1, 1
	iffalse \4
	setevent \2
endm
