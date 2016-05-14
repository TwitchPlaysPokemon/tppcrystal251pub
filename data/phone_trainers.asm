GetRematchTrainer:
	ld a, [wdbf9]
	ld hl, RematchCallers
	ld de, 3
	call IsInArray
	ret nc
	inc hl
	; load pointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	; load rematch index pointer into bc
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	; load trainer class into d
	ld a, [hli]
	ld d, a
	; use the rematch index to look up the trainer id and load it into e
	ld a, [bc]
	ld c, a
	ld b, 0
	add hl, bc
	ld e, [hl]
	; set carry
	scf
	ret

RematchCallers:
	dbw PHONE_SCHOOLBOY_JACK, .Jack
	dbw PHONE_SAILOR_HUEY, .Huey
	dbw PHONE_COOLTRAINERM_GAVEN, .Gaven
	dbw PHONE_COOLTRAINERF_BETH, .Beth
	dbw PHONE_BIRDKEEPER_JOSE, .Jose
	dbw PHONE_COOLTRAINERF_REENA, .Reena
	dbw PHONE_YOUNGSTER_JOEY, .Joey
	dbw PHONE_BUG_CATCHER_WADE, .Wade
	dbw PHONE_FISHER_RALPH, .Ralph
	dbw PHONE_PICNICKER_LIZ, .Liz
	dbw PHONE_HIKER_ANTHONY, .Anthony
	dbw PHONE_CAMPER_TODD, .Todd
	dbw PHONE_PICNICKER_GINA, .Gina
	dbw PHONE_BUG_CATCHER_ARNIE, .Arnie
	dbw PHONE_SCHOOLBOY_ALAN, .Alan
	dbw PHONE_LASS_DANA, .Dana
	dbw PHONE_SCHOOLBOY_CHAD, .Chad
	dbw PHONE_FISHER_TULLY, .Tully
	dbw PHONE_POKEMANIAC_BRENT, .Brent
	dbw PHONE_PICNICKER_TIFFANY, .Tiffany
	dbw PHONE_BIRDKEEPER_VANCE, .Vance
	dbw PHONE_FISHER_WILTON, .Wilton
	dbw PHONE_HIKER_PARRY, .Parry
	dbw PHONE_PICNICKER_ERIN, .Erin
	db -1

.Jack
	dwb wd9f2, SCHOOLBOY
	db JACK1
	db JACK2
	db JACK3
	db JACK4
	db JACK5

.Huey
	dwb wd9f4, SAILOR
	db HUEY1
	db HUEY2
	db HUEY3
	db HUEY4

.Gaven
	dwb wd9f5, COOLTRAINERM
	db GAVEN3
	db GAVEN1
	db GAVEN2

.Beth
	dwb wd9f6, COOLTRAINERF
	db BETH1
	db BETH2
	db BETH3

.Jose
	dwb wd9f7, BIRD_KEEPER
	db JOSE2
	db JOSE1
	db JOSE3

.Reena
	dwb wd9f8, COOLTRAINERF
	db REENA1
	db REENA2
	db REENA3

.Joey
	dwb wd9f9, YOUNGSTER
	db JOEY1
	db JOEY2
	db JOEY3
	db JOEY4
	db JOEY5

.Wade
	dwb wd9fa, BUG_CATCHER
	db WADE1
	db WADE2
	db WADE3
	db WADE4
	db WADE5

.Ralph
	dwb wd9fb, FISHER
	db RALPH1
	db RALPH2
	db RALPH3
	db RALPH4
	db RALPH5

.Liz
	dwb wd9fc, PICNICKER
	db LIZ1
	db LIZ2
	db LIZ3
	db LIZ4
	db LIZ5

.Anthony
	dwb wd9fd, HIKER
	db ANTHONY2
	db ANTHONY1
	db ANTHONY3
	db ANTHONY4
	db ANTHONY5

.Todd
	dwb wd9fe, CAMPER
	db TODD1
	db TODD2
	db TODD3
	db TODD4
	db TODD5

.Gina
	dwb wd9ff, PICNICKER
	db GINA1
	db GINA2
	db GINA3
	db GINA4
	db GINA5

.Arnie
	dwb wda01, BUG_CATCHER
	db ARNIE1
	db ARNIE2
	db ARNIE3
	db ARNIE4
	db ARNIE5

.Alan
	dwb wda02, SCHOOLBOY
	db ALAN1
	db ALAN2
	db ALAN3
	db ALAN4
	db ALAN5

.Dana
	dwb wda03, LASS
	db DANA1
	db DANA2
	db DANA3
	db DANA4
	db DANA5

.Chad
	dwb wda04, SCHOOLBOY
	db CHAD1
	db CHAD2
	db CHAD3
	db CHAD4
	db CHAD5

.Tully
	dwb wda06, FISHER
	db TULLY1
	db TULLY2
	db TULLY3
	db TULLY4

.Brent
	dwb wda07, POKEMANIAC
	db BRENT1
	db BRENT2
	db BRENT3
	db BRENT4

.Tiffany
	dwb wda08, PICNICKER
	db TIFFANY3
	db TIFFANY1
	db TIFFANY2
	db TIFFANY4

.Vance
	dwb wda09, BIRD_KEEPER
	db VANCE1
	db VANCE2
	db VANCE3

.Wilton
	dwb wda0a, FISHER
	db WILTON1
	db WILTON2
	db WILTON3

.Parry
	dwb wda0c, HIKER
	db PARRY3
	db PARRY1
	db PARRY2

.Erin
	dwb wda0d, PICNICKER
	db ERIN1
	db ERIN2
	db ERIN3
