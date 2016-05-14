-- Fast Clock --
-- 1 ingame day = 10 real hours --

-- RAM labels --

hRTCDayLo   = 0xff8e
hRTCHours   = 0xff8f
hRTCMinutes = 0xff90
hRTCSeconds = 0xff91

-- Constants --

stream_start = 1455483600.0 -- 14 Feb 2016, 2100 UTC
start_clock  = os.clock()
start_time   = os.time() - stream_start

-- Main Code 

function updateclock()
	diff = os.clock() - start_clock + start_time
	diff = diff * 12.0 / 5.0
	t = math.floor(diff / 86400) % 7
	memory.writebyte(hRTCDayLo, t)
	t = math.floor(diff / 3600) % 24
	memory.writebyte(hRTCHours, t)
	t = math.floor(diff / 60) % 60
	memory.writebyte(hRTCMinutes, t)
	t = diff % 60
	memory.writebyte(hRTCSeconds, t)
end

vba.registerbefore(updateclock)
