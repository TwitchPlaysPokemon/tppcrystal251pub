hPushOAM           EQU $ff80
hPushOAMAddress    EQU $ff81

hROMBankBackup     EQU $ff8a
hBuffer            EQU $ff8b

hRTCDayHi          EQU $ff8d
hRTCDayLo          EQU $ff8e
hRTCHours          EQU $ff8f
hRTCMinutes        EQU $ff90
hRTCSeconds        EQU $ff91

hHours             EQU $ff94

hMinutes           EQU $ff96

hSeconds           EQU $ff98

hROMBank           EQU $ff9d
hVBlank            EQU $ff9e

;joypad key
; bit 0 A
;     1 B
;     2 SELECT
;     3 START
;     4 RIGHT
;     5 LEFT
;     6 UP
;     7 DOWN
hJoypadReleased    EQU $ffa2 ;buttons on last frame, off this frame
hJoypadPressed     EQU $ffa3 ;buttons off last frame, on this one
hJoypadDown        EQU $ffa4 ;buttons on this frame
hJoypadSum         EQU $ffa5
hJoyReleased       EQU $ffa6
hJoyPressed        EQU $ffa7
hJoyDown           EQU $ffa8 ;buttons on last frame
;ffa9 = joylast, which is set to either hJoyPressed if in menu, else hJoyDown
hConnectionStripLength EQU $ffaf
hConnectedMapWidth EQU $ffb0

;$ffe0 = trainer object

hPastLeadingZeroes EQU $ffb3

hDividend          EQU $ffb3
hDivisor           EQU $ffb7
hQuotient          EQU $ffb4

hMultiplicand      EQU $ffb4
hMultiplier        EQU $ffb7
hProduct           EQU $ffb3

hMathBuffer        EQU $ffb8

hLCDStatCustom     EQU $ffc6

hLinkPlayer        EQU $ffcb

hSerialSend        EQU $ffcd
hSerialReceive     EQU $ffce

hSCX               EQU $ffcf
hSCY               EQU $ffd0
hWX                EQU $ffd1
hWY                EQU $ffd2

hBGMapMode         EQU $ffd4 ;1 = in mon sub menu?
hBGMapThird        EQU $ffd5
hBGMapAddress      EQU $ffd6

hOAMUpdate         EQU $ffd8
hSPBuffer          EQU $ffd9

hBGMapUpdate       EQU $ffdb

hTileAnimFrame     EQU $ffdf

hLastTalked        EQU $ffe0
hRandom            EQU $ffe1
hRandomAdd         EQU $ffe1
hRandomSub         EQU $ffe2

hBattleTurn        EQU $ffe4
hCGBPalUpdate      EQU $ffe5
hCGB               EQU $ffe6
hSGB               EQU $ffe7
hDMATransfer       EQU $ffe8

; LUA serial transfer
hLSB               EQU $fff1
hLSC               EQU $fff2

hMPTmp             EQU $fff5
hMPTmp3		       EQU $fff6

hTmpd              EQU $fff7
hTmpe              EQU $fff8

hFastMusicUpdate   EQU $fff9

