-- RAM labels

EnemyDisabledMove = 0xc6f6
EnemyMonMoves     = 0xd208
EnemyMonPP        = 0xd20e
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

function checkLUASerial()
    if memory.readbyte(rLSC) == BEESAFREE_LSC_TRANSFERRING then
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
