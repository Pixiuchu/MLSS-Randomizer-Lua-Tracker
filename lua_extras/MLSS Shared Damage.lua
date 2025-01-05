--[[
	Known bug: if the other bro dies through shared damage,
	you won't play out the animation of the bros dying.
	The other bro won't be picked up, and the other bro will also run away.
	Otherwise, the bro is basically dead. I tried fixing this bug but I couldn't
	and I'm too lazy. It works otherwise.
]]

local function sharedDamage()
	local pointer = memory.read_u16_le(0x0FDC, "IWRAM") + 2070 -- points to the start of battle
	local MarioBattleHP = pointer
	local LuigiBattleHP = pointer + 0x130
	local MarioDamaged = memory.read_u16_le(pointer - 56, "EWRAM")
	local LuigiDamaged = memory.read_u16_le(pointer + 0x130 - 56, "EWRAM")
	
	print(MarioDamaged)
	if MarioDamaged > 0 then
		local damageDealt = memory.read_u16_le(pointer - 52, "EWRAM")
		local damageDealt1 = memory.read_u8(pointer - 52, "EWRAM")
		local damageDealt2 = memory.read_u8(pointer - 51, "EWRAM")
		
		local LuigiBattleHPValue = memory.read_u16_le(LuigiBattleHP, "EWRAM")
		if LuigiBattleHPValue > 0 then
			memory.write_bytes_as_array(pointer - 58 + 0x130, {0xE0, 0x96, 0x00, 0x02, 0x04, 0x20, damageDealt1, damageDealt2, 0x28, 0x00, 0x7C, 0x00}, "EWRAM")
			local newHPValue = LuigiBattleHPValue - damageDealt
			if newHPValue < 0 then newHPValue = 0 end
			memory.write_u16_le(LuigiBattleHP, newHPValue, "EWRAM")
		end
				
	elseif LuigiDamaged > 0 then
		local damageDealt = memory.read_u16_le(pointer - 52 + 0x130, "EWRAM")
		local damageDealt1 = memory.read_u8(pointer - 52 + 0x130, "EWRAM")
		local damageDealt2 = memory.read_u8(pointer - 51 + 0x130, "EWRAM")
		
		local MarioBattleHPValue = memory.read_u16_le(MarioBattleHP, "EWRAM")
		if MarioBattleHPValue > 0 then
			memory.write_bytes_as_array(pointer - 58, {0x54, 0xAB, 0x00, 0x02, 0x04, 0x20, damageDealt1, damageDealt2, 0x36, 0x00, 0x5C, 0x00}, "EWRAM")
			local newHPValue = MarioBattleHPValue - damageDealt
			if newHPValue < 0 then newHPValue = 0 end
			memory.write_u16_le(MarioBattleHP, newHPValue, "EWRAM")
		end
	end
end


while true do
	local inBattle = memory.read_u16_le(0x0FDC, "IWRAM")
	
	if inBattle ~= 0 and inBattle ~= 0x24B8 then
		sharedDamage()
	end
	emu.frameadvance();
end
