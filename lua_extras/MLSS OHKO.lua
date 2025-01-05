local function killOtherBro()
	local pointer = memory.read_u16_le(0x0FDC, "IWRAM") + 2070 -- points to the start of battle
	local MarioBattleHP = pointer
	local LuigiBattleHP = pointer + 0x130
	local MarioDamaged = memory.read_u16_le(pointer - 56, "EWRAM")
	local LuigiDamaged = memory.read_u16_le(pointer + 0x130 - 56, "EWRAM")
	
	if MarioDamaged > 0 then
		memory.write_u16_le(pointer - 52, 999, "EWRAM")
		memory.write_u16_le(MarioBattleHP, 0, "EWRAM")
		memory.write_bytes_as_array(pointer - 58 + 0x130, {0xE0, 0x96, 0x00, 0x02, 0x04, 0x20, 0xE7, 0x03, 0x28, 0x00, 0x7C, 0x00}, "EWRAM")
		memory.write_u16_le(LuigiBattleHP, 0, "EWRAM")
	elseif LuigiDamaged > 0 then
		memory.write_u16_le(pointer - 52 + 0x130, 999, "EWRAM")
		memory.write_u16_le(MarioBattleHP, 0, "EWRAM")
		memory.write_bytes_as_array(pointer - 58, {0xE0, 0x96, 0x00, 0x02, 0x04, 0x20, 0xE7, 0x03, 0x36, 0x00, 0x5C, 0x00}, "EWRAM")
		memory.write_u16_le(LuigiBattleHP, 0, "EWRAM")
	end
end

local function sharedDamage()
	local pointer = memory.read_u16_le(0x0FDC, "IWRAM") + 2070 -- points to the start of battle
	local MarioBattleHP = pointer
	local LuigiBattleHP = pointer + 0x130
	local MarioDamaged = memory.read_u16_le(pointer - 56, "EWRAM")
	local LuigiDamaged = memory.read_u16_le(pointer + 0x130 - 56, "EWRAM")
	
	if MarioDamaged > 0 then
		memory.write_u16_le(pointer - 52, 999, "EWRAM")
		memory.write_u16_le(MarioBattleHP, 0, "EWRAM")
		memory.write_bytes_as_array(pointer - 58 + 0x130, {0xE0, 0x96, 0x00, 0x02, 0x04, 0x20, 0xE7, 0x03, 0x28, 0x00, 0x7C, 0x00}, "EWRAM")
		memory.write_u16_le(LuigiBattleHP, 0, "EWRAM")
	elseif LuigiDamaged > 0 then
		memory.write_u16_le(pointer - 52 + 0x130, 999, "EWRAM")
		memory.write_u16_le(MarioBattleHP, 0, "EWRAM")
		memory.write_bytes_as_array(pointer - 58, {0xE0, 0x96, 0x00, 0x02, 0x04, 0x20, 0xE7, 0x03, 0x36, 0x00, 0x5C, 0x00}, "EWRAM")
		memory.write_u16_le(LuigiBattleHP, 0, "EWRAM")
	end
end

while true do
	local inBattle = memory.read_u8(0x0FDD, "IWRAM")
	
	if inBattle ~= 0 then
		killOtherBro()
	end
	emu.frameadvance();
end
