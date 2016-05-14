-- RAM labels

dofile("constants.lua")

EnemyDisableCount = 0xc67d
EnemyMonMoves     = 0xd208
EnemyMonPP        = 0xd20e
PlayerDisableCount = 0xc675
BattleMonMoves     = 0xc62e
BattleMonPP        = 0xc634
rLSB              = 0xfff1
rLSC              = 0xfff2
hMilitary        = 0xfff3

-- other stuff --

BEESAFREE_LSC_TRANSFERRING  = 0xff
BEESAFREE_LSC_COMPLETED     = 0x00

BEESAFREE_SND_RESET         = 0x00
BEESAFREE_SND_ASKMOVE       = 0x01
BEESAFREE_SND_ASKITEM       = 0x02

BEESAFREE_RES_RESET         = 0x00

function refreshinterval(seconds)
	-- Revo's function (liar, it's Timmy's function)
	local lastupdate = os.time()
	local now
	repeat
		now = os.time()
		emu.frameadvance()
	until now - lastupdate >= seconds
	lastupdate = now
	return true
end

function GetUsableMoves(MovesPointer, PPPointer, DisabledMovePointer)
	disabledMove = memory.readbyte(DisabledMovePointer)
	if disabledMove ~= 0 then
		disabledMoveIDX = AND(disabledMove, 0xf0) / 16
	else
		disabledMoveIDX = -1
	end
	usableMoves = {}
	for t = 0, 3 do
		tt = memory.readbyte(MovesPointer + t)
		pp = AND(memory.readbyte(PPPointer + t), 0x3f) -- Upper two bits are the PP Up counters
		if tt ~= 0 and t ~= disabledMoveIDX and pp >= 0 then
			table.insert(usableMoves, t)
		end
	end
	return usableMoves
end

function UseRandomMove(MovesPointer, PPPointer, DisabledMovePointer)
	usableMoves = GetUsableMoves(MovesPointer, PPPointer, DisabledMovePointer)
	if #usableMoves == 0 then
		return 0
	else
		return usableMoves[math.random(#usableMoves)]
	end
end

function checkLUASerial()
    if memory.readbyte(rLSC) == BEESAFREE_LSC_TRANSFERRING then
        outai = UseRandomMove(EnemyMonMoves, EnemyMonPP, EnemyDisableCount)
        outplayer = UseRandomMove(BattleMonMoves, BattleMonPP, PlayerDisableCount)
        out = (outai * 16) + outplayer
        memory.writebyte(0xDFF8, out)
        memory.writebyte(0xDFF9, 0x00)
        memory.writebyte(0xDFFA, 0x00)
        vba.print(string.format("Player: Move choice #%d, %s was selected.",outplayer+1, moveTable[memory.readbyte(0xc62e+outplayer)+1]))
        vba.print(string.format("AI: Move choice #%d, %s was selected.",outai+1, moveTable[memory.readbyte(0xd208+outai)+1]))
        vba.print("LUA serial! Wrote completed bytes.") -- it did not, was just a test
        memory.writebyte(rLSB, BEESAFREE_LSC_COMPLETED) -- write the response here but whatever
        memory.writebyte(rLSC, BEESAFREE_LSC_COMPLETED)
    else
        vba.print("Waiting on LUA serial...")
    end
end

repeat
    checkLUASerial()
until not refreshinterval(0.100)
