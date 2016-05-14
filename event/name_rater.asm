NameRater: ; fb6ed
	ld hl, NameRaterIntroText ;would you like me to rate names?
	call PrintText
	call YesNoBox
	jp c, .quit ;if no, exit
	ld hl, NameRaterSelectPokemonText ;which mon should I rate
	call PrintText
	callba Function50000 ;call party menu
	jr c, .quit
	ld a, [CurPartySpecies]
	cp EGG
	jr z, .egg ;can't name eggs
	call GetCurNick
	call NameRater_CheckTraded
	jr c, .traded ;what a great name
	ld hl, NameRaterPromptRenameText ;want a better name
	call PrintText
	call YesNoBox
	jr c, .quit
	ld hl, NameRaterWhatNameText ;what name?
	call PrintText
	xor a
	ld [MonType], a
	ld a, [CurPartySpecies]
	ld [wd265], a
	ld [CurSpecies], a
	call GetBaseData
	ld b, 0
	ld de, StringBuffer2
	callba Function116b7
	call NameRaterCheckNameHasNonSpaceCharacter
	ld hl, NameRaterSameAsBeforeText
	jr c, .finish_nickname
	call NameRaterNicknameCmp
	ld hl, NameRaterSameAsBeforeText
	jr c, .finish_nickname
	ld hl, PartyMonNicknames
	ld bc, PKMN_NAME_LENGTH
	ld a, [CurPartyMon]
	call AddNTimes
	ld e, l
	ld d, h
	ld hl, StringBuffer2
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes
	ld hl, NameRaterBetterThanBeforeText

.finish_nickname
	push hl
	call GetCurNick
	ld hl, NameRaterNowNamedText
	call PrintText
	pop hl
	jr .finish

.traded
	ld hl, NameRaterTradedText
	jr .finish

.quit
	ld hl, NameRaterQuitText ;come back again
	jr .finish

.egg
	ld hl, NameRaterEggText

.finish
	call PrintText ;exit
	ret
; fb78a

NameRater_CheckTraded: ; fb78a
	ld hl, PartyMonOT
	ld bc, NAME_LENGTH
	ld a, [CurPartyMon]
	call AddNTimes ;hl = party trainer name
	ld de, PlayerName ;de = player name
	ld c, NAME_LENGTH
	call .StrCmp ;compare c chars, ret c if different
	ret c
	ld hl, PartyMon1ID ;do the same as above for ID
	ld bc, PartyMon2 - PartyMon1
	ld a, [CurPartyMon]
	call AddNTimes
	ld de, PlayerID
	ld c, 2
.StrCmp: ;if any chars are different, ret c, else continue
	ld a, [de]
	cp [hl]
	jr nz, .different
	inc hl
	inc de
	dec c
	jr nz, .StrCmp
	and a
	ret

.different
	scf
	ret
; fb7be

NameRaterCheckNameHasNonSpaceCharacter: ; fb7be
	ld hl, StringBuffer2
	ld c, 10
.loop
	ld a, [hli]
	cp "@"
	jr z, .terminator
	cp " "
	jr nz, .not_space
	dec c
	jr nz, .loop

.terminator
	scf
	ret

.not_space
	and a
	ret
; fb7d3

NameRaterNicknameCmp: ; fb7d3
	ld hl, PartyMonNicknames
	ld bc, PKMN_NAME_LENGTH
	ld a, [CurPartyMon]
	call AddNTimes
	push hl
	call NameRaterCountChars
	ld b, c
	ld hl, StringBuffer2
	call NameRaterCountChars
	pop hl
	ld a, c
	cp b
	jr nz, .different
	ld de, StringBuffer2
.loop
	ld a, [de]
	cp "@"
	jr z, .identical
	cp [hl]
	jr nz, .different
	inc hl
	inc de
	jr .loop

.different
	and a
	ret

.identical
	scf
	ret
; fb802

NameRaterCountChars: ; fb802
	ld c, 0
.loop
	ld a, [hli]
	cp "@"
	ret z
	inc c
	ld a, c
	cp 10
	jr nz, .loop
	ret
; fb80f

NameRaterIntroText: ; 0xfb80f
	; Hello, hello! I'm the NAME RATER.
	; I rate the names of #MON.
	; Would you like me to rate names?
	text_jump UnknownText_0x1c0043
	db "@"
; 0xfb814

NameRaterSelectPokemonText: ; 0xfb814
	; Which #MON's nickname should I rate for you?
	text_jump UnknownText_0x1c00a0
	db "@"
; 0xfb819

NameRaterPromptRenameText: ; 0xfb819
	; Hm<...> @ <...> That's a fairly decent name.
	; But, how about a slightly better nickname?
	; Want me to give it a better name?
	text_jump UnknownText_0x1c00cd
	db "@"
; 0xfb81e

NameRaterWhatNameText: ; 0xfb81e
	; All right. What name should we give it, then?
	text_jump UnknownText_0x1c0142
	db "@"
; 0xfb823

NameRaterBetterThanBeforeText: ; 0xfb823
	; That's a better name than before! Well done!
	text_jump UnknownText_0x1c0171
	db "@"
; 0xfb828

NameRaterQuitText: ; 0xfb828
	; OK, then. Come again sometime.
	text_jump UnknownText_0x1c019e
	db "@"
; 0xfb82d

NameRaterTradedText: ; 0xfb82d
	; Hm<...> @ ? What a great name! It's perfect.
	; Treat @ with loving care.
	text_jump UnknownText_0x1c01be
	db "@"
; 0xfb832

NameRaterEggText: ; 0xfb832
	; Whoa<...> That's just an EGG.
	text_jump UnknownText_0x1c0208
	db "@"
; 0xfb837

NameRaterSameAsBeforeText: ; 0xfb837
	; It might look the same as before,
	; but this new name is much better! Well done!
	text_jump UnknownText_0x1c0222
	db "@"
; 0xfb83c

NameRaterNowNamedText: ; 0xfb83c
	; All right. This #MON is now named @ .
	text_jump UnknownText_0x1c0272
	db "@"
; 0xfb841

