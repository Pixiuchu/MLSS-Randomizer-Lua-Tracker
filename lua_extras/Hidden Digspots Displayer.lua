gui.defaultBackground("#55111111")
gui.defaultForeground("#88222222")

function itemFlag(ItemAddress, readBit)
	local bytevalue = memory.read_u8(ItemAddress, "EWRAM")
	local bitresult = nil
	
	bitvalue = 2^readBit
	andedvalues = bytevalue & bitvalue
	if andedvalues > 0 then
		bitresult = 1
	else
		bitresult = 0
	end
	
	return bitresult
end


function findDigspot(roomID, romAddress, ramAddress, readBit)
	local inBattle = memory.read_u8(0x0FDD, "IWRAM")
	local x = itemFlag(ramAddress, readBit)
	
	
	if roomID == currentRoom then
		if x == 0 then
			if inBattle == 0 then
				local digspotX = memory.read_u8(romAddress-5, "System Bus")
				local digspotY = memory.read_u8(romAddress-4, "System Bus")
				local digspotZ = memory.read_u8(romAddress-3, "System Bus")
				gui.drawBox(digspotX*16+4 - camX, 
							digspotY*16+4 - camY - digspotZ*8,
							
							digspotX*16+12 - camX,
							digspotY*16+12 - camY - digspotZ*8)
			end
		end
	end
end

while true do
	currentRoom = memory.read_u16_le(0x2332, "IWRAM")
	camX = memory.read_u16_le(0x2486, "IWRAM")
	camY = memory.read_u16_le(0x2488, "IWRAM")
	camZ = memory.read_u16_le(0x248A, "IWRAM")
	findDigspot(0x1F7, 0x839EC4D, 0x459E, 7)
	findDigspot(0x1F6, 0x839EC40, 0x459E, 6)
	findDigspot(0x194, 0x839E9A0, 0x4599, 4)
	findDigspot(0x193, 0x839E983, 0x4599, 1)
	findDigspot(0x191, 0x839E959, 0x4598, 5)
	findDigspot(0x190, 0x839E944, 0x4598, 3)
	findDigspot(0x18E, 0x839E91A, 0x4597, 7)
	findDigspot(0x181, 0x839E8A3, 0x4596, 6)
	findDigspot(0x171, 0x839E857, 0x4596, 3)
	findDigspot(0x154, 0x839E702, 0x4592, 7)
	findDigspot(0x14F, 0x839E6CF, 0x4592, 3)
	findDigspot(0x14E, 0x839E6C2, 0x4592, 2)
	findDigspot(0x12B, 0x839E5FD, 0x4591, 0)
	findDigspot(0x12A, 0x839E5F0, 0x4590, 7)
	findDigspot(0x126, 0x839E5D0, 0x4590, 5)
	findDigspot(0x126, 0x839E5C8, 0x4590, 4)
	findDigspot(0x123, 0x839E5B5, 0x4590, 3)
	findDigspot(0x11E, 0x839E51E, 0x458E, 3)
	findDigspot(0x10F, 0x839E477, 0x458C, 6)
	findDigspot(0x10E, 0x839E462, 0x458C, 4)
	findDigspot(0x105, 0x839E3F3, 0x458B, 3)
	findDigspot(0x103, 0x839E3D1, 0x458B, 0)
	findDigspot(0x0FC, 0x839E396, 0x458A, 4)
	findDigspot(0x0F6, 0x839E370, 0x458A, 2)
	findDigspot(0x0F5, 0x839E343, 0x4589, 5)
	findDigspot(0x0F4, 0x839E316, 0x4589, 0)
	findDigspot(0x0F3, 0x839E2E9, 0x4588, 3)
	findDigspot(0x0F2, 0x839E2DC, 0x4588, 2)
	findDigspot(0x0E6, 0x839E232, 0x4586, 3)
	findDigspot(0x0E5, 0x839E21D, 0x4586, 1)
	findDigspot(0x0E3, 0x839E1E3, 0x4585, 3)
	findDigspot(0x0E1, 0x839E1C9, 0x4585, 1)
	findDigspot(0x0E0, 0x839E1BC, 0x4585, 0)
	findDigspot(0x0DF, 0x839E187, 0x4584, 2)
	findDigspot(0x0CE, 0x839E102, 0x4583, 1)
	findDigspot(0x0CE, 0x839E0FA, 0x4583, 0)
	findDigspot(0x0CD, 0x839E0CD, 0x4582, 3)
	findDigspot(0x0CA, 0x839E092, 0x4581, 5)
	findDigspot(0x0C7, 0x839E077, 0x4581, 3)
	findDigspot(0x0A1, 0x839DF63, 0x457F, 1)
	findDigspot(0x09B, 0x839DED7, 0x457D, 3)
	findDigspot(0x098, 0x839DEA8, 0x457C, 7)
	findDigspot(0x08E, 0x839DDF6, 0x457A, 6)
	findDigspot(0x083, 0x839DD13, 0x4578, 0)
	findDigspot(0x081, 0x839DCE1, 0x4577, 3)
	findDigspot(0x080, 0x839DCC4, 0x4577, 0)
	findDigspot(0x07E, 0x839DC82, 0x4576, 1)
	findDigspot(0x07D, 0x839DC65, 0x4575, 6)
	findDigspot(0x07D, 0x839DC5D, 0x4575, 5)
	findDigspot(0x079, 0x839DBE1, 0x4574, 0)
	findDigspot(0x078, 0x839DBBC, 0x4573, 4)
	findDigspot(0x070, 0x839DB32, 0x4571, 7)
	findDigspot(0x070, 0x839DB2A, 0x4571, 6)
	findDigspot(0x06D, 0x839DB0F, 0x4571, 4)
	findDigspot(0x06C, 0x839DB02, 0x4571, 3)
	findDigspot(0x069, 0x839DAB5, 0x4570, 3)
	findDigspot(0x055, 0x839D9E9, 0x456E, 3)
	findDigspot(0x04B, 0x839D90F, 0x456B, 5)
	findDigspot(0x047, 0x839D8C5, 0x456A, 6)	
	emu.frameadvance()
	gui.clearGraphics()
end

