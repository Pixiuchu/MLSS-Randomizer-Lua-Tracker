dofile("tables.lua")
refreshRate = 600


function itemFlag(ItemAddress)
	local itemType = ramTable[ItemAddress][1]
	-- numbers 0-7: read bit, 8: consumables/equipment
	local bytevalue = memory.read_u8(ramTable[ItemAddress][2], ramTable[ItemAddress][3])
	local bitresult = nil
	
	if itemType == 8 then
		if (bytevalue == 255) or (bytevalue == 0) then
			bitresult = 0
		else
			bitresult = 1
		end
	elseif itemType < 8 then
		bitvalue = 2^itemType
		andedvalues = bytevalue & bitvalue
		if andedvalues > 0 then
			bitresult = 1
		else
			bitresult = 0
		end
	end
	
	return bitresult
end


function has(item)
	local hasitem = FT[item]
	if hasitem == 1 then hasitem = true else hasitem = false end
	--print(item .. ": " .. tostring(hasitem))
	return hasitem
end

function canDig()
	local hasitem = nil
	if has("GreenGoblet") and has("Hammers1") then hasitem = true else hasitem = false end
	return hasitem
end

function canMini()
	local hasitem = nil
	if has("RedGoblet") and has("Hammers1") then hasitem = true else hasitem = false end
	return hasitem
end

function canDash()
	local hasitem = nil
	if (has("RedPearlBean") and has("Firebrand")) then hasitem = true else hasitem = false end
	return hasitem
end

function canCrash()
	local hasitem = nil
	if has("GreenPearlBean") and has("Thunderhand") then hasitem = true else hasitem = false end
	return hasitem
end

function hardLogic()
	local hasitem = nil
	--if hardLogicOption() then hasitem = true
	if canCrash() then hasitem = true else hasitem = false end
	return hasitem
end

function canGoblets()
	local hasitem = nil
	if has("GreenGoblet") and has("RedGoblet") and has("Hammers1") then hasitem = true else hasitem = false end
	return hasitem
end

function canPearls()
	local hasitem = nil
	if has("GreenPearlBean") and has("Thunderhand") and has("RedPearlBean") and has("Firebrand") then hasitem = true else hasitem = false end
	return hasitem
end

function canPreChuckolator()
	local hasitem = nil
	if (has("BeanbeanBrooch") and has("RedChuckolaFruit") and has("WhiteChuckolaFruit") and has("PurpleChuckolaFruit")) then hasitem = true else hasitem = false end
	return hasitem
end

function canChuckolator()
	local hasitem = nil
	if canPreChuckolator() and (has("Hammers1") or has("Firebrand") or has("Thunderhand")) then hasitem = true else hasitem = false end
	return hasitem -- include MushBadge?
end

function canTeeheeValley()
	local hasitem = nil
	if has("Hammers2") or canDash() then hasitem = true else hasitem = false end
	return hasitem
end

function canFungi()
	local hasitem = nil
	if (canTeeheeValley() and canChuckolator() and has("PeasleysRose") and has("Thunderhand")) then hasitem = true else hasitem = false end
	return hasitem
end

function canSink()
	local hasitem = nil
	if (canTeeheeValley() and has("Firebrand") and has("MembershipCard")) then hasitem = true else hasitem = false end
	return hasitem
end

function canOhoOasis()
	local hasitem = nil
	if canGoblets() or canSink() then hasitem = true else hasitem = false end
	return hasitem
end

function canSurf()
	local hasitem = nil
	if (canOhoOasis() and has("Hammers3")) then hasitem = true else hasitem = false end
	return hasitem
end

function canGwarharLagoon()
	local hasitem = nil
	if (canSink() or canSurf()) then hasitem = true else hasitem = false end
	return hasitem
end

function canGwarharDeep()
	local hasitem = nil
	if (canGwarharLagoon() and has("RedPearlBean") and hardLogic()) then hasitem = true else hasitem = false end
	return hasitem
end

function canJokesEnd()
	local hasitem = nil
	if (canSurf() and has("Firebrand")) then hasitem = true else hasitem = false end
	return hasitem
end

function canJokesDeep()
	local hasitem = nil
	if (canJokesEnd() and hardLogic() and canDig()) then hasitem = true else hasitem = false end
	return hasitem
end

--function canBeanFruits()
--	local countitem = 0
--	countitem = if BeanFruit1() then countitem = countitem + 1 end
--	countitem = if BeanFruit2() then countitem = countitem + 1 end
--	countitem = if BeanFruit3() then countitem = countitem + 1 end
--	countitem = if BeanFruit4() then countitem = countitem + 1 end
--	countitem = if BeanFruit5() then countitem = countitem + 1 end
--	countitem = if BeanFruit6() then countitem = countitem + 1 end
--	countitem = if BeanFruit7() then countitem = countitem + 1 end
--	return countitem
--end

function canNeonEggs()
	local hasitem = nil
	if (has("NeonEggBlue") and has("NeonEggRed") and has("NeonEggGreen") and has("NeonEggYellow") and has("NeonEggPurple") and has("NeonEggOrange") and has("NeonEggAzure")) then hasitem = true else hasitem = false end
	return hasitem
end

function canBeanstar()
	local hasitem = nil
	if (canChuckolator() and has("PeasleysRose") and has("BeanstarPiece1") and has("BeanstarPiece2") and has("BeanstarPiece3") and has("BeanstarPiece4")) then hasitem = true else hasitem = false end
	return hasitem
end

function canBirdo()
	local hasitem = nil
	if (canJokesDeep() and canBeanstar() and has("FakeBeanstar") and has("PeachsExtraDress")) then hasitem = true else hasitem = false end
	return hasitem
end






function locFlag(ItemAddress)
	local bytevalue = memory.read_u8(ItemAddress[2], "EWRAM")
	local bitvalue = 2^ItemAddress[1]
	local andedvalues = bytevalue & bitvalue
	if andedvalues > 0 then
		bitresult = 1
	else
		bitresult = 0
	end
	return bitresult
end

function flip(number)
	if number == 0 then return 1 else return 0 end
end


function loadLocFlags()
	console.clear()
	refreshItemFlags()
	--local canStardust = 0
	--local sumStardust = 19
	--local maxStardust = 19
	--
	--local canHoohoo = 0
	--local sumHoohoo = 19
	--local maxHoohoo = 19
	
	local canOutskirts = 0
	local sumOutskirts = 102
	local maxOutskirts = 102
	local canCastleTown = 0
	local sumCastleTown = 58
	local maxCastleTown = 58
	local canGwarhar = 0
	local sumGwarhar = 29
	local maxGwarhar = 29
	local canChucklehuck = 0
	local sumChucklehuck = 69
	local maxChucklehuck = 69
	local canStardust = 0
	local sumStardust = 19
	local maxStardust = 19
	local canFungitown = 0
	local sumFungitown = 2
	local maxFungitown = 2
	local canHoohoo = 0
	local sumHoohoo = 74
	local maxHoohoo = 74
	local canJokes = 0
	local sumJokes = 42
	local maxJokes = 42
	local canOasis = 0
	local sumOasis = 24
	local maxOasis = 24
	local canTeehee = 0
	local sumTeehee = 27
	local maxTeehee = 27
	local canHooniversity = 0
	local sumHooniversity = 47
	local maxHooniversity = 47

	
	--[[ Example: 13 / 18 means I can do 13 locations out of 18
	sum must be 18.
	19 max - 1 done = 18
	
	Example flags with and without logic:
    x4565_0 = {0, 0x4565}; x4565_0 = locFlag(x4565_0); canStardust = canStardust + flip(x4565_0); sumStardust = sumStardust - x4565_0
    x4565_1 = {1, 0x4565}; x4565_1 = locFlag(x4565_1); if has("WinkleCard") then canStardust = canStardust + flip(x4565_1); sumStardust = sumStardust - x4565_1 end
	
	
	-- Stardust Fields
    --x4564_0 = {0, 0x4564}; x4564_0 = locFlag(x4564_0); canStardust = canStardust + flip(x4564_0); sumStardust = sumStardust - x4564_0
    --x4564_1 = {1, 0x4564}; x4564_1 = locFlag(x4564_1); canStardust = canStardust + flip(x4564_1); sumStardust = sumStardust - x4564_1
    --x4564_2 = {2, 0x4564}; x4564_2 = locFlag(x4564_2); canStardust = canStardust + flip(x4564_2); sumStardust = sumStardust - x4564_2
    --x4564_3 = {3, 0x4564}; x4564_3 = locFlag(x4564_3); canStardust = canStardust + flip(x4564_3); sumStardust = sumStardust - x4564_3
    --x4564_4 = {4, 0x4564}; x4564_4 = locFlag(x4564_4); canStardust = canStardust + flip(x4564_4); sumStardust = sumStardust - x4564_4
    --x4564_5 = {5, 0x4564}; x4564_5 = locFlag(x4564_5); canStardust = canStardust + flip(x4564_5); sumStardust = sumStardust - x4564_5
    --x4564_6 = {6, 0x4564}; x4564_6 = locFlag(x4564_6); canStardust = canStardust + flip(x4564_6); sumStardust = sumStardust - x4564_6
    --x4564_7 = {7, 0x4564}; x4564_7 = locFlag(x4564_7); canStardust = canStardust + flip(x4564_7); sumStardust = sumStardust - x4564_7
    --x4565_0 = {0, 0x4565}; x4565_0 = locFlag(x4565_0); canStardust = canStardust + flip(x4565_0); sumStardust = sumStardust - x4565_0
    --x4565_1 = {1, 0x4565}; x4565_1 = locFlag(x4565_1); canStardust = canStardust + flip(x4565_1); sumStardust = sumStardust - x4565_1
    --x4565_2 = {2, 0x4565}; x4565_2 = locFlag(x4565_2); canStardust = canStardust + flip(x4565_2); sumStardust = sumStardust - x4565_2
    --x4565_3 = {3, 0x4565}; x4565_3 = locFlag(x4565_3); canStardust = canStardust + flip(x4565_3); sumStardust = sumStardust - x4565_3
    --x4565_4 = {4, 0x4565}; x4565_4 = locFlag(x4565_4); canStardust = canStardust + flip(x4565_4); sumStardust = sumStardust - x4565_4
    --x4565_5 = {5, 0x4565}; x4565_5 = locFlag(x4565_5); canStardust = canStardust + flip(x4565_5); sumStardust = sumStardust - x4565_5
    --x4565_7 = {7, 0x4565}; x4565_7 = locFlag(x4565_7); canStardust = canStardust + flip(x4565_7); sumStardust = sumStardust - x4565_7
    --x4566_0 = {0, 0x4566}; x4566_0 = locFlag(x4566_0); canStardust = canStardust + flip(x4566_0); sumStardust = sumStardust - x4566_0
    --x4566_1 = {1, 0x4566}; x4566_1 = locFlag(x4566_1); canStardust = canStardust + flip(x4566_1); sumStardust = sumStardust - x4566_1
    --x456F_6 = {6, 0x456F}; x456F_6 = locFlag(x456F_6); canStardust = canStardust + flip(x456F_6); sumStardust = sumStardust - x456F_6
    --x456F_7 = {7, 0x456F}; x456F_7 = locFlag(x456F_7); canStardust = canStardust + flip(x456F_7); sumStardust = sumStardust - x456F_7
	--
	---- Hoohoo Village	
	--x456C_4 = {4, 0x456C}; x456C_4 = locFlag(x456C_4); if canDig() then canHoohoo = canHoohoo + flip(x456C_4); sumHoohoo = sumHoohoo - x456C_4 end
	--x456C_3 = {3, 0x456C}; x456C_3 = locFlag(x456C_3); canHoohoo = canHoohoo + flip(x456C_3); sumHoohoo = sumHoohoo - x456C_3
	--x4570_4 = {4, 0x4570}; x4570_4 = locFlag(x4570_4); canHoohoo = canHoohoo + flip(x4570_4); sumHoohoo = sumHoohoo - x4570_4
	--x4570_5 = {5, 0x4570}; x4570_5 = locFlag(x4570_5); canHoohoo = canHoohoo + flip(x4570_5); sumHoohoo = sumHoohoo - x4570_5
	--x4570_6 = {6, 0x4570}; x4570_6 = locFlag(x4570_6); canHoohoo = canHoohoo + flip(x4570_6); sumHoohoo = sumHoohoo - x4570_6
	--x4570_1 = {1, 0x4570}; x4570_1 = locFlag(x4570_1); canHoohoo = canHoohoo + flip(x4570_1); sumHoohoo = sumHoohoo - x4570_1
	--x4570_0 = {0, 0x4570}; x4570_0 = locFlag(x4570_0); canHoohoo = canHoohoo + flip(x4570_0); sumHoohoo = sumHoohoo - x4570_0
	--x4570_2 = {2, 0x4570}; x4570_2 = locFlag(x4570_2); canHoohoo = canHoohoo + flip(x4570_2); sumHoohoo = sumHoohoo - x4570_2
	--x456C_7 = {7, 0x456C}; x456C_7 = locFlag(x456C_7); canHoohoo = canHoohoo + flip(x456C_7); sumHoohoo = sumHoohoo - x456C_7
	--x456D_0 = {0, 0x456D}; x456D_0 = locFlag(x456D_0); canHoohoo = canHoohoo + flip(x456D_0); sumHoohoo = sumHoohoo - x456D_0
	--x456C_6 = {6, 0x456C}; x456C_6 = locFlag(x456C_6); canHoohoo = canHoohoo + flip(x456C_6); sumHoohoo = sumHoohoo - x456C_6
	--x456C_5 = {5, 0x456C}; x456C_5 = locFlag(x456C_5); canHoohoo = canHoohoo + flip(x456C_5); sumHoohoo = sumHoohoo - x456C_5
	--x456D_1 = {1, 0x456D}; x456D_1 = locFlag(x456D_1); canHoohoo = canHoohoo + flip(x456D_1); sumHoohoo = sumHoohoo - x456D_1
	--x4570_3 = {3, 0x4570}; x4570_3 = locFlag(x4570_3); if canDig() then canHoohoo = canHoohoo + flip(x4570_3); sumHoohoo = sumHoohoo - x4570_3 end
	--x4566_2 = {2, 0x4566}; x4566_2 = locFlag(x4566_2); if has("Hammers1") then canHoohoo = canHoohoo + flip(x4566_2); sumHoohoo = sumHoohoo - x4566_2 end
	--
	---- Hoohoo Mountain
	--
	---- Hoohoo Mountain Base
	-- x456C_1 = {1, 0x456C}; x456C_1 = locFlag(x456C_1); canHoohoo = canHoohoo + flip(x456C_1); sumHoohoo = sumHoohoo - x456C_1
	-- x456C_2 = {2, 0x456C}; x456C_2 = locFlag(x456C_2); if canDig() then canHoohoo = canHoohoo + flip(x456C_2); sumHoohoo = sumHoohoo - x456C_2 end
	-- x456F_1 = {1, 0x456F}; x456F_1 = locFlag(x456F_1); canHoohoo = canHoohoo + flip(x456F_1); sumHoohoo = sumHoohoo - x456F_1
	-- x456F_2 = {2, 0x456F}; x456F_2 = locFlag(x456F_2); canHoohoo = canHoohoo + flip(x456F_2); sumHoohoo = sumHoohoo - x456F_2]]
	
    x4589_1 = {1, 0x4589}; x4589_1 = locFlag(x4589_1); if (has("Thunderhand") and canDig()) then canOutskirts = canOutskirts + flip(x4589_1); sumOutskirts = sumOutskirts - x4589_1 end
    x4589_2 = {2, 0x4589}; x4589_2 = locFlag(x4589_2); if (has("Thunderhand") and canDig()) then canOutskirts = canOutskirts + flip(x4589_2); sumOutskirts = sumOutskirts - x4589_2 end
    x4589_3 = {3, 0x4589}; x4589_3 = locFlag(x4589_3); if (has("Thunderhand") and canDig()) then canOutskirts = canOutskirts + flip(x4589_3); sumOutskirts = sumOutskirts - x4589_3 end
    x4589_4 = {4, 0x4589}; x4589_4 = locFlag(x4589_4); if (has("Thunderhand") and canDig()) then canOutskirts = canOutskirts + flip(x4589_4); sumOutskirts = sumOutskirts - x4589_4 end
    x4589_5 = {5, 0x4589}; x4589_5 = locFlag(x4589_5); if (has("Thunderhand") and canDig()) then canOutskirts = canOutskirts + flip(x4589_5); sumOutskirts = sumOutskirts - x4589_5 end
    x4589_6 = {6, 0x4589}; x4589_6 = locFlag(x4589_6); if (has("Thunderhand") and canDig()) then canOutskirts = canOutskirts + flip(x4589_6); sumOutskirts = sumOutskirts - x4589_6 end
    x4589_7 = {7, 0x4589}; x4589_7 = locFlag(x4589_7); if (has("Thunderhand") and canDig()) then canOutskirts = canOutskirts + flip(x4589_7); sumOutskirts = sumOutskirts - x4589_7 end
    x458A_0 = {0, 0x458A}; x458A_0 = locFlag(x458A_0); if (has("Thunderhand") and canDig()) then canOutskirts = canOutskirts + flip(x458A_0); sumOutskirts = sumOutskirts - x458A_0 end
    x458A_1 = {1, 0x458A}; x458A_1 = locFlag(x458A_1); if (has("Thunderhand") and canDig()) then canOutskirts = canOutskirts + flip(x458A_1); sumOutskirts = sumOutskirts - x458A_1 end
    x458A_2 = {2, 0x458A}; x458A_2 = locFlag(x458A_2); if (has("Thunderhand") and canDig()) then canOutskirts = canOutskirts + flip(x458A_2); sumOutskirts = sumOutskirts - x458A_2 end
    x4588_2 = {2, 0x4588}; x4588_2 = locFlag(x4588_2); if (has("Thunderhand") and canDig()) then canOutskirts = canOutskirts + flip(x4588_2); sumOutskirts = sumOutskirts - x4588_2 end
    x4588_3 = {3, 0x4588}; x4588_3 = locFlag(x4588_3); if (has("Thunderhand") and canDig()) then canOutskirts = canOutskirts + flip(x4588_3); sumOutskirts = sumOutskirts - x4588_3 end
    x4588_4 = {4, 0x4588}; x4588_4 = locFlag(x4588_4); if (has("Thunderhand") and canDig()) then canOutskirts = canOutskirts + flip(x4588_4); sumOutskirts = sumOutskirts - x4588_4 end
    x4588_5 = {5, 0x4588}; x4588_5 = locFlag(x4588_5); if (has("Thunderhand") and canDig()) then canOutskirts = canOutskirts + flip(x4588_5); sumOutskirts = sumOutskirts - x4588_5 end
    x4588_6 = {6, 0x4588}; x4588_6 = locFlag(x4588_6); if (has("Thunderhand") and canDig()) then canOutskirts = canOutskirts + flip(x4588_6); sumOutskirts = sumOutskirts - x4588_6 end
    x4588_7 = {7, 0x4588}; x4588_7 = locFlag(x4588_7); if (has("Thunderhand") and canDig()) then canOutskirts = canOutskirts + flip(x4588_7); sumOutskirts = sumOutskirts - x4588_7 end
    x4589_0 = {0, 0x4589}; x4589_0 = locFlag(x4589_0); if (has("Thunderhand") and canDig()) then canOutskirts = canOutskirts + flip(x4589_0); sumOutskirts = sumOutskirts - x4589_0 end
    x4300_6 = {6, 0x4300}; x4300_6 = locFlag(x4300_6); if has("PeasleysRose") then canCastleTown = canCastleTown + flip(x4300_6); sumCastleTown = sumCastleTown - x4300_6 end
    x433D_3 = {3, 0x433D}; x433D_3 = locFlag(x433D_3); if canBeanstar() then canCastleTown = canCastleTown + flip(x433D_3); sumCastleTown = sumCastleTown - x433D_3 end
    x433D_3 = {3, 0x433D}; x433D_3 = locFlag(x433D_3); if canBeanstar() then canCastleTown = canCastleTown + flip(x433D_3); sumCastleTown = sumCastleTown - x433D_3 end
    x42FF_3 = {3, 0x42FF}; x42FF_3 = locFlag(x42FF_3); if canChuckolator() then canCastleTown = canCastleTown + flip(x42FF_3); sumCastleTown = sumCastleTown - x42FF_3 end
    x42FF_5 = {5, 0x42FF}; x42FF_5 = locFlag(x42FF_5); if canChuckolator() then canCastleTown = canCastleTown + flip(x42FF_5); sumCastleTown = sumCastleTown - x42FF_5 end
    x42FF_4 = {4, 0x42FF}; x42FF_4 = locFlag(x42FF_4); if canChuckolator() then canCastleTown = canCastleTown + flip(x42FF_4); sumCastleTown = sumCastleTown - x42FF_4 end
    x42FF_2 = {2, 0x42FF}; x42FF_2 = locFlag(x42FF_2); if canChuckolator() then canCastleTown = canCastleTown + flip(x42FF_2); sumCastleTown = sumCastleTown - x42FF_2 end
    x42FF_1 = {1, 0x42FF}; x42FF_1 = locFlag(x42FF_1); if canChuckolator() then canCastleTown = canCastleTown + flip(x42FF_1); sumCastleTown = sumCastleTown - x42FF_1 end
    x42FF_0 = {0, 0x42FF}; x42FF_0 = locFlag(x42FF_0); if canChuckolator() then canCastleTown = canCastleTown + flip(x42FF_0); sumCastleTown = sumCastleTown - x42FF_0 end
    x4302_4 = {4, 0x4302}; x4302_4 = locFlag(x4302_4); if (canChuckolator() and canDig()) then canCastleTown = canCastleTown + flip(x4302_4); sumCastleTown = sumCastleTown - x4302_4 end
    x4302_5 = {5, 0x4302}; x4302_5 = locFlag(x4302_5); if (canChuckolator() and canDig()) then canCastleTown = canCastleTown + flip(x4302_5); sumCastleTown = sumCastleTown - x4302_5 end
    x4302_6 = {6, 0x4302}; x4302_6 = locFlag(x4302_6); if (canChuckolator() and canDig()) then canCastleTown = canCastleTown + flip(x4302_6); sumCastleTown = sumCastleTown - x4302_6 end
    x4302_7 = {7, 0x4302}; x4302_7 = locFlag(x4302_7); if (canChuckolator() and canDig()) then canCastleTown = canCastleTown + flip(x4302_7); sumCastleTown = sumCastleTown - x4302_7 end
    x4303_0 = {0, 0x4303}; x4303_0 = locFlag(x4303_0); if (canChuckolator() and canDig()) then canCastleTown = canCastleTown + flip(x4303_0); sumCastleTown = sumCastleTown - x4303_0 end
    x4303_1 = {1, 0x4303}; x4303_1 = locFlag(x4303_1); if (canChuckolator() and canDig()) then canCastleTown = canCastleTown + flip(x4303_1); sumCastleTown = sumCastleTown - x4303_1 end
    x4303_2 = {2, 0x4303}; x4303_2 = locFlag(x4303_2); if (canChuckolator() and canDig()) then canCastleTown = canCastleTown + flip(x4303_2); sumCastleTown = sumCastleTown - x4303_2 end
    x4303_3 = {3, 0x4303}; x4303_3 = locFlag(x4303_3); if (canChuckolator() and canDig()) then canCastleTown = canCastleTown + flip(x4303_3); sumCastleTown = sumCastleTown - x4303_3 end
    x4303_4 = {4, 0x4303}; x4303_4 = locFlag(x4303_4); if (canChuckolator() and canDig()) then canCastleTown = canCastleTown + flip(x4303_4); sumCastleTown = sumCastleTown - x4303_4 end
    x4303_5 = {5, 0x4303}; x4303_5 = locFlag(x4303_5); if (canChuckolator() and canDig()) then canCastleTown = canCastleTown + flip(x4303_5); sumCastleTown = sumCastleTown - x4303_5 end
    x42FF_7 = {7, 0x42FF}; x42FF_7 = locFlag(x42FF_7); if (canChuckolator() and canDig()) then canCastleTown = canCastleTown + flip(x42FF_7); sumCastleTown = sumCastleTown - x42FF_7 end
    x4568_1 = {1, 0x4568}; x4568_1 = locFlag(x4568_1); if canChuckolator() then canCastleTown = canCastleTown + flip(x4568_1); sumCastleTown = sumCastleTown - x4568_1 end
    x4568_2 = {2, 0x4568}; x4568_2 = locFlag(x4568_2); if canChuckolator() then canCastleTown = canCastleTown + flip(x4568_2); sumCastleTown = sumCastleTown - x4568_2 end
    x4568_3 = {3, 0x4568}; x4568_3 = locFlag(x4568_3); if canChuckolator() then canCastleTown = canCastleTown + flip(x4568_3); sumCastleTown = sumCastleTown - x4568_3 end
    x4568_4 = {4, 0x4568}; x4568_4 = locFlag(x4568_4); if canChuckolator() then canCastleTown = canCastleTown + flip(x4568_4); sumCastleTown = sumCastleTown - x4568_4 end
    x4568_6 = {6, 0x4568}; x4568_6 = locFlag(x4568_6); if canMini() then canCastleTown = canCastleTown + flip(x4568_6); sumCastleTown = sumCastleTown - x4568_6 end
    x4568_7 = {7, 0x4568}; x4568_7 = locFlag(x4568_7); if canMini() then canCastleTown = canCastleTown + flip(x4568_7); sumCastleTown = sumCastleTown - x4568_7 end
    x4569_0 = {0, 0x4569}; x4569_0 = locFlag(x4569_0); if canMini() then canCastleTown = canCastleTown + flip(x4569_0); sumCastleTown = sumCastleTown - x4569_0 end
    x4569_1 = {1, 0x4569}; x4569_1 = locFlag(x4569_1); if canMini() then canCastleTown = canCastleTown + flip(x4569_1); sumCastleTown = sumCastleTown - x4569_1 end
    x4569_2 = {2, 0x4569}; x4569_2 = locFlag(x4569_2); if canMini() then canCastleTown = canCastleTown + flip(x4569_2); sumCastleTown = sumCastleTown - x4569_2 end
    x4568_5 = {5, 0x4568}; x4568_5 = locFlag(x4568_5); canCastleTown = canCastleTown + flip(x4568_5); sumCastleTown = sumCastleTown - x4568_5
    x4567_5 = {5, 0x4567}; x4567_5 = locFlag(x4567_5); if canChuckolator() then canCastleTown = canCastleTown + flip(x4567_5); sumCastleTown = sumCastleTown - x4567_5 end
    x4567_6 = {6, 0x4567}; x4567_6 = locFlag(x4567_6); if canChuckolator() then canCastleTown = canCastleTown + flip(x4567_6); sumCastleTown = sumCastleTown - x4567_6 end
    x4567_7 = {7, 0x4567}; x4567_7 = locFlag(x4567_7); if canChuckolator() then canCastleTown = canCastleTown + flip(x4567_7); sumCastleTown = sumCastleTown - x4567_7 end
    x4568_0 = {0, 0x4568}; x4568_0 = locFlag(x4568_0); if canChuckolator() then canCastleTown = canCastleTown + flip(x4568_0); sumCastleTown = sumCastleTown - x4568_0 end
    x432C_6 = {6, 0x432C}; x432C_6 = locFlag(x432C_6); if canDig() then canOutskirts = canOutskirts + flip(x432C_6); sumOutskirts = sumOutskirts - x432C_6 end
    x432D_1 = {1, 0x432D}; x432D_1 = locFlag(x432D_1); if canDig() then canOutskirts = canOutskirts + flip(x432D_1); sumOutskirts = sumOutskirts - x432D_1 end
    x432B_4 = {4, 0x432B}; x432B_4 = locFlag(x432B_4); if canDig() then canOutskirts = canOutskirts + flip(x432B_4); sumOutskirts = sumOutskirts - x432B_4 end
    x432B_7 = {7, 0x432B}; x432B_7 = locFlag(x432B_7); if (canDig() and has("Hammers2")) then canOutskirts = canOutskirts + flip(x432B_7); sumOutskirts = sumOutskirts - x432B_7 end
    x434B_1 = {1, 0x434B}; x434B_1 = locFlag(x434B_1); if (canDig() and has("Hammers2")) then canOutskirts = canOutskirts + flip(x434B_1); sumOutskirts = sumOutskirts - x434B_1 end
    x432B_2 = {2, 0x432B}; x432B_2 = locFlag(x432B_2); if canDig() then canOutskirts = canOutskirts + flip(x432B_2); sumOutskirts = sumOutskirts - x432B_2 end
    x432D_5 = {5, 0x432D}; x432D_5 = locFlag(x432D_5); if (canTeeheeValley() and canDig()) then canOutskirts = canOutskirts + flip(x432D_5); sumOutskirts = sumOutskirts - x432D_5 end
    x4598_4 = {4, 0x4598}; x4598_4 = locFlag(x4598_4); if (canCrash() and canDig()) then canOutskirts = canOutskirts + flip(x4598_4); sumOutskirts = sumOutskirts - x4598_4 end
    x4598_5 = {5, 0x4598}; x4598_5 = locFlag(x4598_5); if (canCrash() and canDig()) then canOutskirts = canOutskirts + flip(x4598_5); sumOutskirts = sumOutskirts - x4598_5 end
    x434B_3 = {3, 0x434B}; x434B_3 = locFlag(x434B_3); if (canCrash() and canMini()) then canOutskirts = canOutskirts + flip(x434B_3); sumOutskirts = sumOutskirts - x434B_3 end
    x4598_6 = {6, 0x4598}; x4598_6 = locFlag(x4598_6); if (canDig() and has("BeanbeanBrooch")) then canOutskirts = canOutskirts + flip(x4598_6); sumOutskirts = sumOutskirts - x4598_6 end
    x4598_7 = {7, 0x4598}; x4598_7 = locFlag(x4598_7); if (canDig() and has("BeanbeanBrooch")) then canOutskirts = canOutskirts + flip(x4598_7); sumOutskirts = sumOutskirts - x4598_7 end
    x4599_0 = {0, 0x4599}; x4599_0 = locFlag(x4599_0); if (canDig() and has("BeanbeanBrooch")) then canOutskirts = canOutskirts + flip(x4599_0); sumOutskirts = sumOutskirts - x4599_0 end
    x4599_1 = {1, 0x4599}; x4599_1 = locFlag(x4599_1); if (canDig() and has("BeanbeanBrooch")) then canOutskirts = canOutskirts + flip(x4599_1); sumOutskirts = sumOutskirts - x4599_1 end
    x4576_2 = {2, 0x4576}; x4576_2 = locFlag(x4576_2); if canDig() then canOutskirts = canOutskirts + flip(x4576_2); sumOutskirts = sumOutskirts - x4576_2 end
    x4576_3 = {3, 0x4576}; x4576_3 = locFlag(x4576_3); if (canDig() and has("Thunderhand")) then canOutskirts = canOutskirts + flip(x4576_3); sumOutskirts = sumOutskirts - x4576_3 end
    x4576_4 = {4, 0x4576}; x4576_4 = locFlag(x4576_4); if canDig() then canOutskirts = canOutskirts + flip(x4576_4); sumOutskirts = sumOutskirts - x4576_4 end
    x459D_3 = {3, 0x459D}; x459D_3 = locFlag(x459D_3); if canDig() then canOutskirts = canOutskirts + flip(x459D_3); sumOutskirts = sumOutskirts - x459D_3 end
    x459D_4 = {4, 0x459D}; x459D_4 = locFlag(x459D_4); if canDig() then canOutskirts = canOutskirts + flip(x459D_4); sumOutskirts = sumOutskirts - x459D_4 end
    x4571_5 = {5, 0x4571}; x4571_5 = locFlag(x4571_5); if (canDig() and has("Thunderhand")) then canOutskirts = canOutskirts + flip(x4571_5); sumOutskirts = sumOutskirts - x4571_5 end
    x4571_6 = {6, 0x4571}; x4571_6 = locFlag(x4571_6); if (canDig() and has("Thunderhand")) then canOutskirts = canOutskirts + flip(x4571_6); sumOutskirts = sumOutskirts - x4571_6 end
    x4571_7 = {7, 0x4571}; x4571_7 = locFlag(x4571_7); if (canDig() and has("Thunderhand")) then canOutskirts = canOutskirts + flip(x4571_7); sumOutskirts = sumOutskirts - x4571_7 end
    x434B_0 = {0, 0x434B}; x434B_0 = locFlag(x434B_0); if has("Thunderhand") then canOutskirts = canOutskirts + flip(x434B_0); sumOutskirts = sumOutskirts - x434B_0 end
    x434B_0 = {0, 0x434B}; x434B_0 = locFlag(x434B_0); if has("Thunderhand") then canOutskirts = canOutskirts + flip(x434B_0); sumOutskirts = sumOutskirts - x434B_0 end
    x4574_1 = {1, 0x4574}; x4574_1 = locFlag(x4574_1); if canDig() then canOutskirts = canOutskirts + flip(x4574_1); sumOutskirts = sumOutskirts - x4574_1 end
    x4574_2 = {2, 0x4574}; x4574_2 = locFlag(x4574_2); if canDig() then canOutskirts = canOutskirts + flip(x4574_2); sumOutskirts = sumOutskirts - x4574_2 end
    x4576_0 = {0, 0x4576}; x4576_0 = locFlag(x4576_0); if (canDig() and has("Thunderhand")) then canOutskirts = canOutskirts + flip(x4576_0); sumOutskirts = sumOutskirts - x4576_0 end
    x4576_1 = {1, 0x4576}; x4576_1 = locFlag(x4576_1); if canDig() then canOutskirts = canOutskirts + flip(x4576_1); sumOutskirts = sumOutskirts - x4576_1 end
    x434B_4 = {4, 0x434B}; x434B_4 = locFlag(x434B_4); if canMini() then canOutskirts = canOutskirts + flip(x434B_4); sumOutskirts = sumOutskirts - x434B_4 end
    x434B_5 = {5, 0x434B}; x434B_5 = locFlag(x434B_5); if canMini() then canOutskirts = canOutskirts + flip(x434B_5); sumOutskirts = sumOutskirts - x434B_5 end
    x4572_6 = {6, 0x4572}; x4572_6 = locFlag(x4572_6); if has("Hammers2") then canOutskirts = canOutskirts + flip(x4572_6); sumOutskirts = sumOutskirts - x4572_6 end
    x4572_7 = {7, 0x4572}; x4572_7 = locFlag(x4572_7); if has("Hammers2") then canOutskirts = canOutskirts + flip(x4572_7); sumOutskirts = sumOutskirts - x4572_7 end
    x4573_0 = {0, 0x4573}; x4573_0 = locFlag(x4573_0); if canDig() then canOutskirts = canOutskirts + flip(x4573_0); sumOutskirts = sumOutskirts - x4573_0 end
    x4577_1 = {1, 0x4577}; x4577_1 = locFlag(x4577_1); if canDig() then canOutskirts = canOutskirts + flip(x4577_1); sumOutskirts = sumOutskirts - x4577_1 end
    x4577_3 = {3, 0x4577}; x4577_3 = locFlag(x4577_3); if canDig() then canOutskirts = canOutskirts + flip(x4577_3); sumOutskirts = sumOutskirts - x4577_3 end
    x4577_2 = {2, 0x4577}; x4577_2 = locFlag(x4577_2); if (canTeeheeValley() and canDig()) then canOutskirts = canOutskirts + flip(x4577_2); sumOutskirts = sumOutskirts - x4577_2 end
    x459E_6 = {6, 0x459E}; x459E_6 = locFlag(x459E_6); if canDig() then canOutskirts = canOutskirts + flip(x459E_6); sumOutskirts = sumOutskirts - x459E_6 end
    x459E_7 = {7, 0x459E}; x459E_7 = locFlag(x459E_7); if canDig() then canOutskirts = canOutskirts + flip(x459E_7); sumOutskirts = sumOutskirts - x459E_7 end
    x4574_6 = {6, 0x4574}; x4574_6 = locFlag(x4574_6); if (has("Thunderhand") and has("Hammers3")) then canOutskirts = canOutskirts + flip(x4574_6); sumOutskirts = sumOutskirts - x4574_6 end
    x4574_5 = {5, 0x4574}; x4574_5 = locFlag(x4574_5); if (has("Thunderhand") and has("Hammers3")) then canOutskirts = canOutskirts + flip(x4574_5); sumOutskirts = sumOutskirts - x4574_5 end
    x4574_3 = {3, 0x4574}; x4574_3 = locFlag(x4574_3); if canDig() then canOutskirts = canOutskirts + flip(x4574_3); sumOutskirts = sumOutskirts - x4574_3 end
    x4574_7 = {7, 0x4574}; x4574_7 = locFlag(x4574_7); if (has("Thunderhand") and has("Hammers3") and canDig()) then canOutskirts = canOutskirts + flip(x4574_7); sumOutskirts = sumOutskirts - x4574_7 end
    x4575_3 = {3, 0x4575}; x4575_3 = locFlag(x4575_3); if canDig() then canOutskirts = canOutskirts + flip(x4575_3); sumOutskirts = sumOutskirts - x4575_3 end
    x4575_1 = {1, 0x4575}; x4575_1 = locFlag(x4575_1); if canCrash() then canOutskirts = canOutskirts + flip(x4575_1); sumOutskirts = sumOutskirts - x4575_1 end
    x4575_2 = {2, 0x4575}; x4575_2 = locFlag(x4575_2); if canCrash() then canOutskirts = canOutskirts + flip(x4575_2); sumOutskirts = sumOutskirts - x4575_2 end
    x4575_6 = {6, 0x4575}; x4575_6 = locFlag(x4575_6); if (canCrash() and canDig()) then canOutskirts = canOutskirts + flip(x4575_6); sumOutskirts = sumOutskirts - x4575_6 end
    x4575_5 = {5, 0x4575}; x4575_5 = locFlag(x4575_5); if (canCrash() and canDig()) then canOutskirts = canOutskirts + flip(x4575_5); sumOutskirts = sumOutskirts - x4575_5 end
    x4575_0 = {0, 0x4575}; x4575_0 = locFlag(x4575_0); if (canCrash() and canDig()) then canOutskirts = canOutskirts + flip(x4575_0); sumOutskirts = sumOutskirts - x4575_0 end
    x4576_5 = {5, 0x4576}; x4576_5 = locFlag(x4576_5); if canDig() then canOutskirts = canOutskirts + flip(x4576_5); sumOutskirts = sumOutskirts - x4576_5 end
    x4576_7 = {7, 0x4576}; x4576_7 = locFlag(x4576_7); if canDig() then canOutskirts = canOutskirts + flip(x4576_7); sumOutskirts = sumOutskirts - x4576_7 end
    x4577_0 = {0, 0x4577}; x4577_0 = locFlag(x4577_0); if canDig() then canOutskirts = canOutskirts + flip(x4577_0); sumOutskirts = sumOutskirts - x4577_0 end
    x4573_5 = {5, 0x4573}; x4573_5 = locFlag(x4573_5); if canDig() then canOutskirts = canOutskirts + flip(x4573_5); sumOutskirts = sumOutskirts - x4573_5 end
    x4573_7 = {7, 0x4573}; x4573_7 = locFlag(x4573_7); if canDig() then canOutskirts = canOutskirts + flip(x4573_7); sumOutskirts = sumOutskirts - x4573_7 end
    x4574_0 = {0, 0x4574}; x4574_0 = locFlag(x4574_0); if canDig() then canOutskirts = canOutskirts + flip(x4574_0); sumOutskirts = sumOutskirts - x4574_0 end
    x434E_1 = {1, 0x434E}; x434E_1 = locFlag(x434E_1); if (has("Thunderhand") and has("Hammers2")) then canOutskirts = canOutskirts + flip(x434E_1); sumOutskirts = sumOutskirts - x434E_1 end
    x434E_2 = {2, 0x434E}; x434E_2 = locFlag(x434E_2); if (has("Thunderhand") and has("Hammers3")) then canOutskirts = canOutskirts + flip(x434E_2); sumOutskirts = sumOutskirts - x434E_2 end
    x434B_2 = {2, 0x434B}; x434B_2 = locFlag(x434B_2); if canDig() then canOutskirts = canOutskirts + flip(x434B_2); sumOutskirts = sumOutskirts - x434B_2 end
    x4577_4 = {4, 0x4577}; x4577_4 = locFlag(x4577_4); if canDig() then canOutskirts = canOutskirts + flip(x4577_4); sumOutskirts = sumOutskirts - x4577_4 end
    x4599_2 = {2, 0x4599}; x4599_2 = locFlag(x4599_2); if canDig() then canOutskirts = canOutskirts + flip(x4599_2); sumOutskirts = sumOutskirts - x4599_2 end
    x4599_3 = {3, 0x4599}; x4599_3 = locFlag(x4599_3); if canDig() then canOutskirts = canOutskirts + flip(x4599_3); sumOutskirts = sumOutskirts - x4599_3 end
    x4599_4 = {4, 0x4599}; x4599_4 = locFlag(x4599_4); if canDig() then canOutskirts = canOutskirts + flip(x4599_4); sumOutskirts = sumOutskirts - x4599_4 end
    x4359_5 = {5, 0x4359}; x4359_5 = locFlag(x4359_5); if has("Thunderhand") then canOutskirts = canOutskirts + flip(x4359_5); sumOutskirts = sumOutskirts - x4359_5 end
    x4577_6 = {6, 0x4577}; x4577_6 = locFlag(x4577_6); canOutskirts = canOutskirts + flip(x4577_6); sumOutskirts = sumOutskirts - x4577_6
    x4577_5 = {5, 0x4577}; x4577_5 = locFlag(x4577_5); if (canSurf() and canDig()) then canOutskirts = canOutskirts + flip(x4577_5); sumOutskirts = sumOutskirts - x4577_5 end
    x4577_7 = {7, 0x4577}; x4577_7 = locFlag(x4577_7); if (canSurf() and canDig()) then canOutskirts = canOutskirts + flip(x4577_7); sumOutskirts = sumOutskirts - x4577_7 end
    x4578_0 = {0, 0x4578}; x4578_0 = locFlag(x4578_0); if (canSurf() and canDig()) then canOutskirts = canOutskirts + flip(x4578_0); sumOutskirts = sumOutskirts - x4578_0 end
    x4373_3 = {3, 0x4373}; x4373_3 = locFlag(x4373_3); if has("Thunderhand") then canOutskirts = canOutskirts + flip(x4373_3); sumOutskirts = sumOutskirts - x4373_3 end
    x4359_6 = {6, 0x4359}; x4359_6 = locFlag(x4359_6); if (has("Thunderhand") and canBeanstar()) then canOutskirts = canOutskirts + flip(x4359_6); sumOutskirts = sumOutskirts - x4359_6 end
    x4573_2 = {2, 0x4573}; x4573_2 = locFlag(x4573_2); if canDig() then canOutskirts = canOutskirts + flip(x4573_2); sumOutskirts = sumOutskirts - x4573_2 end
    x4573_3 = {3, 0x4573}; x4573_3 = locFlag(x4573_3); if canDig() then canOutskirts = canOutskirts + flip(x4573_3); sumOutskirts = sumOutskirts - x4573_3 end
    x4573_4 = {4, 0x4573}; x4573_4 = locFlag(x4573_4); if canDig() then canOutskirts = canOutskirts + flip(x4573_4); sumOutskirts = sumOutskirts - x4573_4 end
    x432E_4 = {4, 0x432E}; x432E_4 = locFlag(x432E_4); if canCrash() then canOutskirts = canOutskirts + flip(x432E_4); sumOutskirts = sumOutskirts - x432E_4 end
    x4340_5 = {5, 0x4340}; x4340_5 = locFlag(x4340_5); if (canGwarharDeep() and canCrash()) then canGwarhar = canGwarhar + flip(x4340_5); sumGwarhar = sumGwarhar - x4340_5 end
    x430F_0 = {0, 0x430F}; x430F_0 = locFlag(x430F_0); if (has("BeanbeanBrooch") and canDash() and has("WinkleCard")) then canChucklehuck = canChucklehuck + flip(x430F_0); sumChucklehuck = sumChucklehuck - x430F_0 end
    x434D_5 = {5, 0x434D}; x434D_5 = locFlag(x434D_5); if (canDash() and canNeonEggs()) then canOutskirts = canOutskirts + flip(x434D_5); sumOutskirts = sumOutskirts - x434D_5 end
    x456F_6 = {6, 0x456F}; x456F_6 = locFlag(x456F_6); canStardust = canStardust + flip(x456F_6); sumStardust = sumStardust - x456F_6
    x456F_7 = {7, 0x456F}; x456F_7 = locFlag(x456F_7); canStardust = canStardust + flip(x456F_7); sumStardust = sumStardust - x456F_7
    x4578_7 = {7, 0x4578}; x4578_7 = locFlag(x4578_7); if (has("BeanbeanBrooch") and canDig()) then canChucklehuck = canChucklehuck + flip(x4578_7); sumChucklehuck = sumChucklehuck - x4578_7 end
    x4579_0 = {0, 0x4579}; x4579_0 = locFlag(x4579_0); if (has("BeanbeanBrooch") and canDig()) then canChucklehuck = canChucklehuck + flip(x4579_0); sumChucklehuck = sumChucklehuck - x4579_0 end
    x42FE_2 = {2, 0x42FE}; x42FE_2 = locFlag(x42FE_2); if (has("BeanbeanBrooch") and canDig()) then canChucklehuck = canChucklehuck + flip(x42FE_2); sumChucklehuck = sumChucklehuck - x42FE_2 end
    x4578_3 = {3, 0x4578}; x4578_3 = locFlag(x4578_3); if has("BeanbeanBrooch") then canChucklehuck = canChucklehuck + flip(x4578_3); sumChucklehuck = sumChucklehuck - x4578_3 end
    x4578_5 = {5, 0x4578}; x4578_5 = locFlag(x4578_5); if has("BeanbeanBrooch") then canChucklehuck = canChucklehuck + flip(x4578_5); sumChucklehuck = sumChucklehuck - x4578_5 end
    x4578_6 = {6, 0x4578}; x4578_6 = locFlag(x4578_6); if (has("BeanbeanBrooch") and canDig()) then canChucklehuck = canChucklehuck + flip(x4578_6); sumChucklehuck = sumChucklehuck - x4578_6 end
    x4578_2 = {2, 0x4578}; x4578_2 = locFlag(x4578_2); if has("BeanbeanBrooch") then canChucklehuck = canChucklehuck + flip(x4578_2); sumChucklehuck = sumChucklehuck - x4578_2 end
    x4578_4 = {4, 0x4578}; x4578_4 = locFlag(x4578_4); if has("BeanbeanBrooch") then canChucklehuck = canChucklehuck + flip(x4578_4); sumChucklehuck = sumChucklehuck - x4578_4 end
    x42FE_1 = {1, 0x42FE}; x42FE_1 = locFlag(x42FE_1); if (has("BeanbeanBrooch") and canMini()) then canChucklehuck = canChucklehuck + flip(x42FE_1); sumChucklehuck = sumChucklehuck - x42FE_1 end
    x4578_1 = {1, 0x4578}; x4578_1 = locFlag(x4578_1); if (has("BeanbeanBrooch") and canDig()) then canChucklehuck = canChucklehuck + flip(x4578_1); sumChucklehuck = sumChucklehuck - x4578_1 end
    x4579_2 = {2, 0x4579}; x4579_2 = locFlag(x4579_2); if has("BeanbeanBrooch") then canChucklehuck = canChucklehuck + flip(x4579_2); sumChucklehuck = sumChucklehuck - x4579_2 end
    x4579_3 = {3, 0x4579}; x4579_3 = locFlag(x4579_3); if has("BeanbeanBrooch") then canChucklehuck = canChucklehuck + flip(x4579_3); sumChucklehuck = sumChucklehuck - x4579_3 end
    x4579_1 = {1, 0x4579}; x4579_1 = locFlag(x4579_1); if has("BeanbeanBrooch") then canChucklehuck = canChucklehuck + flip(x4579_1); sumChucklehuck = sumChucklehuck - x4579_1 end
    x4579_5 = {5, 0x4579}; x4579_5 = locFlag(x4579_5); if has("BeanbeanBrooch") then canChucklehuck = canChucklehuck + flip(x4579_5); sumChucklehuck = sumChucklehuck - x4579_5 end
    x4579_4 = {4, 0x4579}; x4579_4 = locFlag(x4579_4); if has("BeanbeanBrooch") then canChucklehuck = canChucklehuck + flip(x4579_4); sumChucklehuck = sumChucklehuck - x4579_4 end
    x4579_6 = {6, 0x4579}; x4579_6 = locFlag(x4579_6); if has("BeanbeanBrooch") then canChucklehuck = canChucklehuck + flip(x4579_6); sumChucklehuck = sumChucklehuck - x4579_6 end
    x4579_7 = {7, 0x4579}; x4579_7 = locFlag(x4579_7); if has("BeanbeanBrooch") then canChucklehuck = canChucklehuck + flip(x4579_7); sumChucklehuck = sumChucklehuck - x4579_7 end
    x457C_0 = {0, 0x457C}; x457C_0 = locFlag(x457C_0); if (has("BeanbeanBrooch") and canDig()) then canChucklehuck = canChucklehuck + flip(x457C_0); sumChucklehuck = sumChucklehuck - x457C_0 end
    x457E_6 = {6, 0x457E}; x457E_6 = locFlag(x457E_6); if has("BeanbeanBrooch") then canChucklehuck = canChucklehuck + flip(x457E_6); sumChucklehuck = sumChucklehuck - x457E_6 end
    x457F_0 = {0, 0x457F}; x457F_0 = locFlag(x457F_0); if has("BeanbeanBrooch") then canChucklehuck = canChucklehuck + flip(x457F_0); sumChucklehuck = sumChucklehuck - x457F_0 end
    x457E_7 = {7, 0x457E}; x457E_7 = locFlag(x457E_7); if has("BeanbeanBrooch") then canChucklehuck = canChucklehuck + flip(x457E_7); sumChucklehuck = sumChucklehuck - x457E_7 end
    x457F_1 = {1, 0x457F}; x457F_1 = locFlag(x457F_1); if (has("BeanbeanBrooch") and canDig()) then canChucklehuck = canChucklehuck + flip(x457F_1); sumChucklehuck = sumChucklehuck - x457F_1 end
    x457C_1 = {1, 0x457C}; x457C_1 = locFlag(x457C_1); if (has("BeanbeanBrooch") and canDig()) then canChucklehuck = canChucklehuck + flip(x457C_1); sumChucklehuck = sumChucklehuck - x457C_1 end
    x457C_2 = {2, 0x457C}; x457C_2 = locFlag(x457C_2); if (has("BeanbeanBrooch") and canDig()) then canChucklehuck = canChucklehuck + flip(x457C_2); sumChucklehuck = sumChucklehuck - x457C_2 end
    x457C_3 = {3, 0x457C}; x457C_3 = locFlag(x457C_3); if (has("BeanbeanBrooch") and canDig()) then canChucklehuck = canChucklehuck + flip(x457C_3); sumChucklehuck = sumChucklehuck - x457C_3 end
    x457C_4 = {4, 0x457C}; x457C_4 = locFlag(x457C_4); if (has("BeanbeanBrooch") and canDig()) then canChucklehuck = canChucklehuck + flip(x457C_4); sumChucklehuck = sumChucklehuck - x457C_4 end
    x457D_4 = {4, 0x457D}; x457D_4 = locFlag(x457D_4); if canPreChuckolator() then canChucklehuck = canChucklehuck + flip(x457D_4); sumChucklehuck = sumChucklehuck - x457D_4 end
    x457D_5 = {5, 0x457D}; x457D_5 = locFlag(x457D_5); if canPreChuckolator() then canChucklehuck = canChucklehuck + flip(x457D_5); sumChucklehuck = sumChucklehuck - x457D_5 end
    x457D_6 = {6, 0x457D}; x457D_6 = locFlag(x457D_6); if canPreChuckolator() then canChucklehuck = canChucklehuck + flip(x457D_6); sumChucklehuck = sumChucklehuck - x457D_6 end
    x457D_7 = {7, 0x457D}; x457D_7 = locFlag(x457D_7); if canPreChuckolator() then canChucklehuck = canChucklehuck + flip(x457D_7); sumChucklehuck = sumChucklehuck - x457D_7 end
    x457E_0 = {0, 0x457E}; x457E_0 = locFlag(x457E_0); if canPreChuckolator() then canChucklehuck = canChucklehuck + flip(x457E_0); sumChucklehuck = sumChucklehuck - x457E_0 end
    x457E_1 = {1, 0x457E}; x457E_1 = locFlag(x457E_1); if canPreChuckolator() then canChucklehuck = canChucklehuck + flip(x457E_1); sumChucklehuck = sumChucklehuck - x457E_1 end
    x457E_2 = {2, 0x457E}; x457E_2 = locFlag(x457E_2); if canPreChuckolator() then canChucklehuck = canChucklehuck + flip(x457E_2); sumChucklehuck = sumChucklehuck - x457E_2 end
    x457A_4 = {4, 0x457A}; x457A_4 = locFlag(x457A_4); if (has("BeanbeanBrooch") and has("Hammer1")) then canChucklehuck = canChucklehuck + flip(x457A_4); sumChucklehuck = sumChucklehuck - x457A_4 end
    x457A_2 = {2, 0x457A}; x457A_2 = locFlag(x457A_2); if (has("BeanbeanBrooch") and has("Hammer1")) then canChucklehuck = canChucklehuck + flip(x457A_2); sumChucklehuck = sumChucklehuck - x457A_2 end
    x457A_3 = {3, 0x457A}; x457A_3 = locFlag(x457A_3); if (has("BeanbeanBrooch") and has("Hammer1")) then canChucklehuck = canChucklehuck + flip(x457A_3); sumChucklehuck = sumChucklehuck - x457A_3 end
    x457A_5 = {5, 0x457A}; x457A_5 = locFlag(x457A_5); if (has("BeanbeanBrooch") and canDig()) then canChucklehuck = canChucklehuck + flip(x457A_5); sumChucklehuck = sumChucklehuck - x457A_5 end
    x457A_6 = {6, 0x457A}; x457A_6 = locFlag(x457A_6); if (has("BeanbeanBrooch") and canDig()) then canChucklehuck = canChucklehuck + flip(x457A_6); sumChucklehuck = sumChucklehuck - x457A_6 end
    x42FE_7 = {7, 0x42FE}; x42FE_7 = locFlag(x42FE_7); if has("BeanbeanBrooch") then canChucklehuck = canChucklehuck + flip(x42FE_7); sumChucklehuck = sumChucklehuck - x42FE_7 end
    x4301_4 = {4, 0x4301}; x4301_4 = locFlag(x4301_4); if (has("BeanbeanBrooch") and canMini()) then canChucklehuck = canChucklehuck + flip(x4301_4); sumChucklehuck = sumChucklehuck - x4301_4 end
    x4585_1 = {1, 0x4585}; x4585_1 = locFlag(x4585_1); if (has("BeanbeanBrooch") and canDig()) then canChucklehuck = canChucklehuck + flip(x4585_1); sumChucklehuck = sumChucklehuck - x4585_1 end
    x457A_0 = {0, 0x457A}; x457A_0 = locFlag(x457A_0); if has("BeanbeanBrooch") then canChucklehuck = canChucklehuck + flip(x457A_0); sumChucklehuck = sumChucklehuck - x457A_0 end
    x457A_1 = {1, 0x457A}; x457A_1 = locFlag(x457A_1); if (has("BeanbeanBrooch") and canDig()) then canChucklehuck = canChucklehuck + flip(x457A_1); sumChucklehuck = sumChucklehuck - x457A_1 end
    x457A_7 = {7, 0x457A}; x457A_7 = locFlag(x457A_7); if (has("BeanbeanBrooch") and canMini()) then canChucklehuck = canChucklehuck + flip(x457A_7); sumChucklehuck = sumChucklehuck - x457A_7 end
    x457B_0 = {0, 0x457B}; x457B_0 = locFlag(x457B_0); if (has("BeanbeanBrooch") and canMini()) then canChucklehuck = canChucklehuck + flip(x457B_0); sumChucklehuck = sumChucklehuck - x457B_0 end
    x457B_1 = {1, 0x457B}; x457B_1 = locFlag(x457B_1); if (has("BeanbeanBrooch") and canMini()) then canChucklehuck = canChucklehuck + flip(x457B_1); sumChucklehuck = sumChucklehuck - x457B_1 end
    x457B_2 = {2, 0x457B}; x457B_2 = locFlag(x457B_2); if (has("BeanbeanBrooch") and has("Hammer1")) then canChucklehuck = canChucklehuck + flip(x457B_2); sumChucklehuck = sumChucklehuck - x457B_2 end
    x457B_4 = {4, 0x457B}; x457B_4 = locFlag(x457B_4); if (has("BeanbeanBrooch") and has("Hammer1")) then canChucklehuck = canChucklehuck + flip(x457B_4); sumChucklehuck = sumChucklehuck - x457B_4 end
    x457B_3 = {3, 0x457B}; x457B_3 = locFlag(x457B_3); if (has("BeanbeanBrooch") and has("Hammer1")) then canChucklehuck = canChucklehuck + flip(x457B_3); sumChucklehuck = sumChucklehuck - x457B_3 end
    x457B_5 = {5, 0x457B}; x457B_5 = locFlag(x457B_5); if (has("BeanbeanBrooch") and canDig()) then canChucklehuck = canChucklehuck + flip(x457B_5); sumChucklehuck = sumChucklehuck - x457B_5 end
    x457B_6 = {6, 0x457B}; x457B_6 = locFlag(x457B_6); if (has("BeanbeanBrooch") and canDig()) then canChucklehuck = canChucklehuck + flip(x457B_6); sumChucklehuck = sumChucklehuck - x457B_6 end
    x457B_7 = {7, 0x457B}; x457B_7 = locFlag(x457B_7); if (has("BeanbeanBrooch") and canDig()) then canChucklehuck = canChucklehuck + flip(x457B_7); sumChucklehuck = sumChucklehuck - x457B_7 end
    x457D_1 = {1, 0x457D}; x457D_1 = locFlag(x457D_1); if has("BeanbeanBrooch") then canChucklehuck = canChucklehuck + flip(x457D_1); sumChucklehuck = sumChucklehuck - x457D_1 end
    x457D_0 = {0, 0x457D}; x457D_0 = locFlag(x457D_0); if has("BeanbeanBrooch") then canChucklehuck = canChucklehuck + flip(x457D_0); sumChucklehuck = sumChucklehuck - x457D_0 end
    x4302_2 = {2, 0x4302}; x4302_2 = locFlag(x4302_2); if (has("BeanbeanBrooch") and canGoblets()) then canChucklehuck = canChucklehuck + flip(x4302_2); sumChucklehuck = sumChucklehuck - x4302_2 end
    x457C_5 = {5, 0x457C}; x457C_5 = locFlag(x457C_5); if (has("BeanbeanBrooch") and canDig()) then canChucklehuck = canChucklehuck + flip(x457C_5); sumChucklehuck = sumChucklehuck - x457C_5 end
    x457C_6 = {6, 0x457C}; x457C_6 = locFlag(x457C_6); if (has("BeanbeanBrooch") and canGoblets()) then canChucklehuck = canChucklehuck + flip(x457C_6); sumChucklehuck = sumChucklehuck - x457C_6 end
    x457C_7 = {7, 0x457C}; x457C_7 = locFlag(x457C_7); if (has("BeanbeanBrooch") and canGoblets()) then canChucklehuck = canChucklehuck + flip(x457C_7); sumChucklehuck = sumChucklehuck - x457C_7 end
    x457D_2 = {2, 0x457D}; x457D_2 = locFlag(x457D_2); if (has("BeanbeanBrooch") and canDig()) then canChucklehuck = canChucklehuck + flip(x457D_2); sumChucklehuck = sumChucklehuck - x457D_2 end
    x457D_3 = {3, 0x457D}; x457D_3 = locFlag(x457D_3); if (has("BeanbeanBrooch") and canDig()) then canChucklehuck = canChucklehuck + flip(x457D_3); sumChucklehuck = sumChucklehuck - x457D_3 end
    x457F_4 = {4, 0x457F}; x457F_4 = locFlag(x457F_4); if (has("BeanbeanBrooch") and canDash()) then canChucklehuck = canChucklehuck + flip(x457F_4); sumChucklehuck = sumChucklehuck - x457F_4 end
    x457F_3 = {3, 0x457F}; x457F_3 = locFlag(x457F_3); if (has("BeanbeanBrooch") and canDash()) then canChucklehuck = canChucklehuck + flip(x457F_3); sumChucklehuck = sumChucklehuck - x457F_3 end
    x457F_2 = {2, 0x457F}; x457F_2 = locFlag(x457F_2); if (has("BeanbeanBrooch") and canDash()) then canChucklehuck = canChucklehuck + flip(x457F_2); sumChucklehuck = sumChucklehuck - x457F_2 end
    x4375_5 = {5, 0x4375}; x4375_5 = locFlag(x4375_5); if canChuckolator() then canCastleTown = canCastleTown + flip(x4375_5); sumCastleTown = sumCastleTown - x4375_5 end
    x4375_6 = {6, 0x4375}; x4375_6 = locFlag(x4375_6); if canChuckolator() then canCastleTown = canCastleTown + flip(x4375_6); sumCastleTown = sumCastleTown - x4375_6 end
    x4375_7 = {7, 0x4375}; x4375_7 = locFlag(x4375_7); if canChuckolator() then canCastleTown = canCastleTown + flip(x4375_7); sumCastleTown = sumCastleTown - x4375_7 end
    x4376_0 = {0, 0x4376}; x4376_0 = locFlag(x4376_0); if canChuckolator() then canCastleTown = canCastleTown + flip(x4376_0); sumCastleTown = sumCastleTown - x4376_0 end
    x4376_1 = {1, 0x4376}; x4376_1 = locFlag(x4376_1); if canChuckolator() then canCastleTown = canCastleTown + flip(x4376_1); sumCastleTown = sumCastleTown - x4376_1 end
    x4376_2 = {2, 0x4376}; x4376_2 = locFlag(x4376_2); if canChuckolator() then canCastleTown = canCastleTown + flip(x4376_2); sumCastleTown = sumCastleTown - x4376_2 end
    x4376_3 = {3, 0x4376}; x4376_3 = locFlag(x4376_3); if canChuckolator() then canCastleTown = canCastleTown + flip(x4376_3); sumCastleTown = sumCastleTown - x4376_3 end
    x4372_0 = {0, 0x4372}; x4372_0 = locFlag(x4372_0); if canChuckolator() then canCastleTown = canCastleTown + flip(x4372_0); sumCastleTown = sumCastleTown - x4372_0 end
    x4372_3 = {3, 0x4372}; x4372_3 = locFlag(x4372_3); if canChuckolator() then canCastleTown = canCastleTown + flip(x4372_3); sumCastleTown = sumCastleTown - x4372_3 end
    x4371_7 = {7, 0x4371}; x4371_7 = locFlag(x4371_7); if canChuckolator() then canCastleTown = canCastleTown + flip(x4371_7); sumCastleTown = sumCastleTown - x4371_7 end
    x4372_2 = {2, 0x4372}; x4372_2 = locFlag(x4372_2); if canChuckolator() then canCastleTown = canCastleTown + flip(x4372_2); sumCastleTown = sumCastleTown - x4372_2 end
    x4372_1 = {1, 0x4372}; x4372_1 = locFlag(x4372_1); if canChuckolator() then canCastleTown = canCastleTown + flip(x4372_1); sumCastleTown = sumCastleTown - x4372_1 end
    x4372_4 = {4, 0x4372}; x4372_4 = locFlag(x4372_4); if canChuckolator() then canCastleTown = canCastleTown + flip(x4372_4); sumCastleTown = sumCastleTown - x4372_4 end
    x4371_6 = {6, 0x4371}; x4371_6 = locFlag(x4371_6); if canChuckolator() then canCastleTown = canCastleTown + flip(x4371_6); sumCastleTown = sumCastleTown - x4371_6 end
    x4591_7 = {7, 0x4591}; x4591_7 = locFlag(x4591_7); if canFungi() then canFungitown = canFungitown + flip(x4591_7); sumFungitown = sumFungitown - x4591_7 end
    x4592_0 = {0, 0x4592}; x4592_0 = locFlag(x4592_0); if canFungi() then canFungitown = canFungitown + flip(x4592_0); sumFungitown = sumFungitown - x4592_0 end
    x458C_0 = {0, 0x458C}; x458C_0 = locFlag(x458C_0); if (canGwarharLagoon() and canDash()) then canGwarhar = canGwarhar + flip(x458C_0); sumGwarhar = sumGwarhar - x458C_0 end
    x458C_1 = {1, 0x458C}; x458C_1 = locFlag(x458C_1); if (canGwarharLagoon() and canDash()) then canGwarhar = canGwarhar + flip(x458C_1); sumGwarhar = sumGwarhar - x458C_1 end
    x458C_2 = {2, 0x458C}; x458C_2 = locFlag(x458C_2); if (canGwarharLagoon() and canDash()) then canGwarhar = canGwarhar + flip(x458C_2); sumGwarhar = sumGwarhar - x458C_2 end
    x458C_3 = {3, 0x458C}; x458C_3 = locFlag(x458C_3); if (canGwarharLagoon() and canDash()) then canGwarhar = canGwarhar + flip(x458C_3); sumGwarhar = sumGwarhar - x458C_3 end
    x458A_4 = {4, 0x458A}; x458A_4 = locFlag(x458A_4); if (canGwarharLagoon() and canDig()) then canGwarhar = canGwarhar + flip(x458A_4); sumGwarhar = sumGwarhar - x458A_4 end
    x458A_3 = {3, 0x458A}; x458A_3 = locFlag(x458A_3); if (canGwarharLagoon() and canDig()) then canGwarhar = canGwarhar + flip(x458A_3); sumGwarhar = sumGwarhar - x458A_3 end
    x4346_6 = {6, 0x4346}; x4346_6 = locFlag(x4346_6); if (canGwarharLagoon() and has("Firebrand") and has("Thunderhand")) then canGwarhar = canGwarhar + flip(x4346_6); sumGwarhar = sumGwarhar - x4346_6 end
    x4346_7 = {7, 0x4346}; x4346_7 = locFlag(x4346_7); if (canGwarharLagoon() and has("Firebrand") and has("Thunderhand")) then canGwarhar = canGwarhar + flip(x4346_7); sumGwarhar = sumGwarhar - x4346_7 end
    x458B_4 = {4, 0x458B}; x458B_4 = locFlag(x458B_4); if canGwarharDeep() then canGwarhar = canGwarhar + flip(x458B_4); sumGwarhar = sumGwarhar - x458B_4 end
    x458A_6 = {6, 0x458A}; x458A_6 = locFlag(x458A_6); if (canGwarharDeep() and canDig()) then canGwarhar = canGwarhar + flip(x458A_6); sumGwarhar = sumGwarhar - x458A_6 end
    x458A_7 = {7, 0x458A}; x458A_7 = locFlag(x458A_7); if (canGwarharDeep() and canDig()) then canGwarhar = canGwarhar + flip(x458A_7); sumGwarhar = sumGwarhar - x458A_7 end
    x458B_0 = {0, 0x458B}; x458B_0 = locFlag(x458B_0); if (canGwarharDeep() and canDig()) then canGwarhar = canGwarhar + flip(x458B_0); sumGwarhar = sumGwarhar - x458B_0 end
    x458B_1 = {1, 0x458B}; x458B_1 = locFlag(x458B_1); if (canGwarharDeep() and canDig()) then canGwarhar = canGwarhar + flip(x458B_1); sumGwarhar = sumGwarhar - x458B_1 end
    x458B_2 = {2, 0x458B}; x458B_2 = locFlag(x458B_2); if (canGwarharDeep() and canDig()) then canGwarhar = canGwarhar + flip(x458B_2); sumGwarhar = sumGwarhar - x458B_2 end
    x458B_3 = {3, 0x458B}; x458B_3 = locFlag(x458B_3); if (canGwarharDeep() and canDig()) then canGwarhar = canGwarhar + flip(x458B_3); sumGwarhar = sumGwarhar - x458B_3 end
    x458B_5 = {5, 0x458B}; x458B_5 = locFlag(x458B_5); if (canGwarharDeep() and canDig()) then canGwarhar = canGwarhar + flip(x458B_5); sumGwarhar = sumGwarhar - x458B_5 end
    x458A_5 = {5, 0x458A}; x458A_5 = locFlag(x458A_5); if (canGwarharDeep() and canDig() and canCrash()) then canGwarhar = canGwarhar + flip(x458A_5); sumGwarhar = sumGwarhar - x458A_5 end
    x458D_2 = {2, 0x458D}; x458D_2 = locFlag(x458D_2); if canGwarharDeep() then canGwarhar = canGwarhar + flip(x458D_2); sumGwarhar = sumGwarhar - x458D_2 end
    x458C_5 = {5, 0x458C}; x458C_5 = locFlag(x458C_5); if (canGwarharDeep() and canDig()) then canGwarhar = canGwarhar + flip(x458C_5); sumGwarhar = sumGwarhar - x458C_5 end
    x458C_6 = {6, 0x458C}; x458C_6 = locFlag(x458C_6); if (canGwarharDeep() and canDig()) then canGwarhar = canGwarhar + flip(x458C_6); sumGwarhar = sumGwarhar - x458C_6 end
    x458C_7 = {7, 0x458C}; x458C_7 = locFlag(x458C_7); if canGwarharDeep() then canGwarhar = canGwarhar + flip(x458C_7); sumGwarhar = sumGwarhar - x458C_7 end
    x458D_0 = {0, 0x458D}; x458D_0 = locFlag(x458D_0); if canGwarharDeep() then canGwarhar = canGwarhar + flip(x458D_0); sumGwarhar = sumGwarhar - x458D_0 end
    x458D_1 = {1, 0x458D}; x458D_1 = locFlag(x458D_1); if canGwarharDeep() then canGwarhar = canGwarhar + flip(x458D_1); sumGwarhar = sumGwarhar - x458D_1 end
    x458C_4 = {4, 0x458C}; x458C_4 = locFlag(x458C_4); if (canGwarharDeep() and canDig()) then canGwarhar = canGwarhar + flip(x458C_4); sumGwarhar = sumGwarhar - x458C_4 end
    x434A_6 = {6, 0x434A}; x434A_6 = locFlag(x434A_6); if (canGwarharDeep() and has("Hammers3")) then canGwarhar = canGwarhar + flip(x434A_6); sumGwarhar = sumGwarhar - x434A_6 end
    x434A_7 = {7, 0x434A}; x434A_7 = locFlag(x434A_7); if (canGwarharDeep() and canCrash() and has("Spangle")) then canGwarhar = canGwarhar + flip(x434A_7); sumGwarhar = sumGwarhar - x434A_7 end
    x458B_7 = {7, 0x458B}; x458B_7 = locFlag(x458B_7); if (canGwarharDeep() and has("Hammers3")) then canGwarhar = canGwarhar + flip(x458B_7); sumGwarhar = sumGwarhar - x458B_7 end
    x458B_6 = {6, 0x458B}; x458B_6 = locFlag(x458B_6); if (canGwarharDeep() and canDig()) then canGwarhar = canGwarhar + flip(x458B_6); sumGwarhar = sumGwarhar - x458B_6 end
    x434D_3 = {3, 0x434D}; x434D_3 = locFlag(x434D_3); if canCrash() then canOutskirts = canOutskirts + flip(x434D_3); sumOutskirts = sumOutskirts - x434D_3 end
    x4570_7 = {7, 0x4570}; x4570_7 = locFlag(x4570_7); if canCrash() or has("Hammers2") then canHoohoo = canHoohoo + flip(x4570_7); sumHoohoo = sumHoohoo - x4570_7 end
    x4571_1 = {1, 0x4571}; x4571_1 = locFlag(x4571_1); if canCrash() or has("Hammers2") then canHoohoo = canHoohoo + flip(x4571_1); sumHoohoo = sumHoohoo - x4571_1 end
    x4571_2 = {2, 0x4571}; x4571_2 = locFlag(x4571_2); if canCrash() or has("Hammers2") then canHoohoo = canHoohoo + flip(x4571_2); sumHoohoo = sumHoohoo - x4571_2 end
    x456D_7 = {7, 0x456D}; x456D_7 = locFlag(x456D_7); canHoohoo = canHoohoo + flip(x456D_7); sumHoohoo = sumHoohoo - x456D_7
    x456E_0 = {0, 0x456E}; x456E_0 = locFlag(x456E_0); canHoohoo = canHoohoo + flip(x456E_0); sumHoohoo = sumHoohoo - x456E_0
    x456E_1 = {1, 0x456E}; x456E_1 = locFlag(x456E_1); if canDig() then canHoohoo = canHoohoo + flip(x456E_1); sumHoohoo = sumHoohoo - x456E_1 end
    x456E_2 = {2, 0x456E}; x456E_2 = locFlag(x456E_2); canHoohoo = canHoohoo + flip(x456E_2); sumHoohoo = sumHoohoo - x456E_2
    x456E_3 = {3, 0x456E}; x456E_3 = locFlag(x456E_3); if (has("Hammers3") and canDig()) then canHoohoo = canHoohoo + flip(x456E_3); sumHoohoo = sumHoohoo - x456E_3 end
    x456D_2 = {2, 0x456D}; x456D_2 = locFlag(x456D_2); canHoohoo = canHoohoo + flip(x456D_2); sumHoohoo = sumHoohoo - x456D_2
    x456D_3 = {3, 0x456D}; x456D_3 = locFlag(x456D_3); canHoohoo = canHoohoo + flip(x456D_3); sumHoohoo = sumHoohoo - x456D_3
    x456D_4 = {4, 0x456D}; x456D_4 = locFlag(x456D_4); canHoohoo = canHoohoo + flip(x456D_4); sumHoohoo = sumHoohoo - x456D_4
    x456D_5 = {5, 0x456D}; x456D_5 = locFlag(x456D_5); canHoohoo = canHoohoo + flip(x456D_5); sumHoohoo = sumHoohoo - x456D_5
    x456D_6 = {6, 0x456D}; x456D_6 = locFlag(x456D_6); if canDig() then canHoohoo = canHoohoo + flip(x456D_6); sumHoohoo = sumHoohoo - x456D_6 end
    x456E_5 = {5, 0x456E}; x456E_5 = locFlag(x456E_5); canHoohoo = canHoohoo + flip(x456E_5); sumHoohoo = sumHoohoo - x456E_5
    x456E_4 = {4, 0x456E}; x456E_4 = locFlag(x456E_4); canHoohoo = canHoohoo + flip(x456E_4); sumHoohoo = sumHoohoo - x456E_4
    x456E_6 = {6, 0x456E}; x456E_6 = locFlag(x456E_6); if (has("Hammers3") and canDig()) then canHoohoo = canHoohoo + flip(x456E_6); sumHoohoo = sumHoohoo - x456E_6 end
    x4571_4 = {4, 0x4571}; x4571_4 = locFlag(x4571_4); canHoohoo = canHoohoo + flip(x4571_4); sumHoohoo = sumHoohoo - x4571_4
    x4373_4 = {4, 0x4373}; x4373_4 = locFlag(x4373_4); if has("Hammers3") then canHoohoo = canHoohoo + flip(x4373_4); sumHoohoo = sumHoohoo - x4373_4 end
    x456F_2 = {2, 0x456F}; x456F_2 = locFlag(x456F_2); canHoohoo = canHoohoo + flip(x456F_2); sumHoohoo = sumHoohoo - x456F_2
    x456F_1 = {1, 0x456F}; x456F_1 = locFlag(x456F_1); canHoohoo = canHoohoo + flip(x456F_1); sumHoohoo = sumHoohoo - x456F_1
    x456F_3 = {3, 0x456F}; x456F_3 = locFlag(x456F_3); if has("Hammers3") then canHoohoo = canHoohoo + flip(x456F_3); sumHoohoo = sumHoohoo - x456F_3 end
    x456F_4 = {4, 0x456F}; x456F_4 = locFlag(x456F_4); if has("Hammers3") then canHoohoo = canHoohoo + flip(x456F_4); sumHoohoo = sumHoohoo - x456F_4 end
    x456F_5 = {5, 0x456F}; x456F_5 = locFlag(x456F_5); if has("Hammers3") then canHoohoo = canHoohoo + flip(x456F_5); sumHoohoo = sumHoohoo - x456F_5 end
    x456C_1 = {1, 0x456C}; x456C_1 = locFlag(x456C_1); canHoohoo = canHoohoo + flip(x456C_1); sumHoohoo = sumHoohoo - x456C_1
    x456C_2 = {2, 0x456C}; x456C_2 = locFlag(x456C_2); if canDig() then canHoohoo = canHoohoo + flip(x456C_2); sumHoohoo = sumHoohoo - x456C_2 end
    x456E_7 = {7, 0x456E}; x456E_7 = locFlag(x456E_7); if has("Hammers3") then canHoohoo = canHoohoo + flip(x456E_7); sumHoohoo = sumHoohoo - x456E_7 end
    x456F_0 = {0, 0x456F}; x456F_0 = locFlag(x456F_0); if (has("Hammers3") and canDig()) then canHoohoo = canHoohoo + flip(x456F_0); sumHoohoo = sumHoohoo - x456F_0 end
    x456A_7 = {7, 0x456A}; x456A_7 = locFlag(x456A_7); canHoohoo = canHoohoo + flip(x456A_7); sumHoohoo = sumHoohoo - x456A_7
    x456B_0 = {0, 0x456B}; x456B_0 = locFlag(x456B_0); canHoohoo = canHoohoo + flip(x456B_0); sumHoohoo = sumHoohoo - x456B_0
    x456B_1 = {1, 0x456B}; x456B_1 = locFlag(x456B_1); if canDig() then canHoohoo = canHoohoo + flip(x456B_1); sumHoohoo = sumHoohoo - x456B_1 end
    x4569_5 = {5, 0x4569}; x4569_5 = locFlag(x4569_5); canHoohoo = canHoohoo + flip(x4569_5); sumHoohoo = sumHoohoo - x4569_5
    x4569_6 = {6, 0x4569}; x4569_6 = locFlag(x4569_6); canHoohoo = canHoohoo + flip(x4569_6); sumHoohoo = sumHoohoo - x4569_6
    x4569_7 = {7, 0x4569}; x4569_7 = locFlag(x4569_7); canHoohoo = canHoohoo + flip(x4569_7); sumHoohoo = sumHoohoo - x4569_7
    x4569_4 = {4, 0x4569}; x4569_4 = locFlag(x4569_4); if canDig() then canHoohoo = canHoohoo + flip(x4569_4); sumHoohoo = sumHoohoo - x4569_4 end
    x4597_3 = {3, 0x4597}; x4597_3 = locFlag(x4597_3); canHoohoo = canHoohoo + flip(x4597_3); sumHoohoo = sumHoohoo - x4597_3
    x4597_4 = {4, 0x4597}; x4597_4 = locFlag(x4597_4); if canDig() then canHoohoo = canHoohoo + flip(x4597_4); sumHoohoo = sumHoohoo - x4597_4 end
    x456B_2 = {2, 0x456B}; x456B_2 = locFlag(x456B_2); canHoohoo = canHoohoo + flip(x456B_2); sumHoohoo = sumHoohoo - x456B_2
    x456B_3 = {3, 0x456B}; x456B_3 = locFlag(x456B_3); canHoohoo = canHoohoo + flip(x456B_3); sumHoohoo = sumHoohoo - x456B_3
    x456A_3 = {3, 0x456A}; x456A_3 = locFlag(x456A_3); canHoohoo = canHoohoo + flip(x456A_3); sumHoohoo = sumHoohoo - x456A_3
    x456A_4 = {4, 0x456A}; x456A_4 = locFlag(x456A_4); canHoohoo = canHoohoo + flip(x456A_4); sumHoohoo = sumHoohoo - x456A_4
    x456A_5 = {5, 0x456A}; x456A_5 = locFlag(x456A_5); if canDig() then canHoohoo = canHoohoo + flip(x456A_5); sumHoohoo = sumHoohoo - x456A_5 end
    x456A_6 = {6, 0x456A}; x456A_6 = locFlag(x456A_6); if canDig() then canHoohoo = canHoohoo + flip(x456A_6); sumHoohoo = sumHoohoo - x456A_6 end
    x456A_0 = {0, 0x456A}; x456A_0 = locFlag(x456A_0); canHoohoo = canHoohoo + flip(x456A_0); sumHoohoo = sumHoohoo - x456A_0
    x456A_2 = {2, 0x456A}; x456A_2 = locFlag(x456A_2); canHoohoo = canHoohoo + flip(x456A_2); sumHoohoo = sumHoohoo - x456A_2
    x4597_6 = {6, 0x4597}; x4597_6 = locFlag(x4597_6); canHoohoo = canHoohoo + flip(x4597_6); sumHoohoo = sumHoohoo - x4597_6
    x4597_5 = {5, 0x4597}; x4597_5 = locFlag(x4597_5); if canDig() then canHoohoo = canHoohoo + flip(x4597_5); sumHoohoo = sumHoohoo - x4597_5 end
    x4597_7 = {7, 0x4597}; x4597_7 = locFlag(x4597_7); if canDig() then canHoohoo = canHoohoo + flip(x4597_7); sumHoohoo = sumHoohoo - x4597_7 end
    x456A_1 = {1, 0x456A}; x456A_1 = locFlag(x456A_1); if canDig() then canHoohoo = canHoohoo + flip(x456A_1); sumHoohoo = sumHoohoo - x456A_1 end
    x42F9_1 = {1, 0x42F9}; x42F9_1 = locFlag(x42F9_1); canHoohoo = canHoohoo + flip(x42F9_1); sumHoohoo = sumHoohoo - x42F9_1
    x456B_6 = {6, 0x456B}; x456B_6 = locFlag(x456B_6); canHoohoo = canHoohoo + flip(x456B_6); sumHoohoo = sumHoohoo - x456B_6
    x456B_7 = {7, 0x456B}; x456B_7 = locFlag(x456B_7); canHoohoo = canHoohoo + flip(x456B_7); sumHoohoo = sumHoohoo - x456B_7
    x456C_0 = {0, 0x456C}; x456C_0 = locFlag(x456C_0); canHoohoo = canHoohoo + flip(x456C_0); sumHoohoo = sumHoohoo - x456C_0
    x456B_4 = {4, 0x456B}; x456B_4 = locFlag(x456B_4); if canDig() then canHoohoo = canHoohoo + flip(x456B_4); sumHoohoo = sumHoohoo - x456B_4 end
    x456B_5 = {5, 0x456B}; x456B_5 = locFlag(x456B_5); if canDig() then canHoohoo = canHoohoo + flip(x456B_5); sumHoohoo = sumHoohoo - x456B_5 end
    x4569_3 = {3, 0x4569}; x4569_3 = locFlag(x4569_3); if canDig() then canHoohoo = canHoohoo + flip(x4569_3); sumHoohoo = sumHoohoo - x4569_3 end
    x456C_5 = {5, 0x456C}; x456C_5 = locFlag(x456C_5); canHoohoo = canHoohoo + flip(x456C_5); sumHoohoo = sumHoohoo - x456C_5
    x456C_7 = {7, 0x456C}; x456C_7 = locFlag(x456C_7); canHoohoo = canHoohoo + flip(x456C_7); sumHoohoo = sumHoohoo - x456C_7
    x456D_1 = {1, 0x456D}; x456D_1 = locFlag(x456D_1); canHoohoo = canHoohoo + flip(x456D_1); sumHoohoo = sumHoohoo - x456D_1
    x456C_6 = {6, 0x456C}; x456C_6 = locFlag(x456C_6); canHoohoo = canHoohoo + flip(x456C_6); sumHoohoo = sumHoohoo - x456C_6
    x456D_0 = {0, 0x456D}; x456D_0 = locFlag(x456D_0); canHoohoo = canHoohoo + flip(x456D_0); sumHoohoo = sumHoohoo - x456D_0
    x456C_3 = {3, 0x456C}; x456C_3 = locFlag(x456C_3); canHoohoo = canHoohoo + flip(x456C_3); sumHoohoo = sumHoohoo - x456C_3
    x456C_4 = {4, 0x456C}; x456C_4 = locFlag(x456C_4); if canDig() then canHoohoo = canHoohoo + flip(x456C_4); sumHoohoo = sumHoohoo - x456C_4 end
    x4566_2 = {2, 0x4566}; x4566_2 = locFlag(x4566_2); if has("Hammers1") then canHoohoo = canHoohoo + flip(x4566_2); sumHoohoo = sumHoohoo - x4566_2 end
    x42F9_2 = {2, 0x42F9}; x42F9_2 = locFlag(x42F9_2); canHoohoo = canHoohoo + flip(x42F9_2); sumHoohoo = sumHoohoo - x42F9_2
    x4373_5 = {5, 0x4373}; x4373_5 = locFlag(x4373_5); canHoohoo = canHoohoo + flip(x4373_5); sumHoohoo = sumHoohoo - x4373_5
    x4570_0 = {0, 0x4570}; x4570_0 = locFlag(x4570_0); canHoohoo = canHoohoo + flip(x4570_0); sumHoohoo = sumHoohoo - x4570_0
    x4570_1 = {1, 0x4570}; x4570_1 = locFlag(x4570_1); canHoohoo = canHoohoo + flip(x4570_1); sumHoohoo = sumHoohoo - x4570_1
    x4570_2 = {2, 0x4570}; x4570_2 = locFlag(x4570_2); canHoohoo = canHoohoo + flip(x4570_2); sumHoohoo = sumHoohoo - x4570_2
    x4570_3 = {3, 0x4570}; x4570_3 = locFlag(x4570_3); if canDig() then canHoohoo = canHoohoo + flip(x4570_3); sumHoohoo = sumHoohoo - x4570_3 end
    x4570_5 = {5, 0x4570}; x4570_5 = locFlag(x4570_5); canHoohoo = canHoohoo + flip(x4570_5); sumHoohoo = sumHoohoo - x4570_5
    x4570_4 = {4, 0x4570}; x4570_4 = locFlag(x4570_4); canHoohoo = canHoohoo + flip(x4570_4); sumHoohoo = sumHoohoo - x4570_4
    x4570_6 = {6, 0x4570}; x4570_6 = locFlag(x4570_6); canHoohoo = canHoohoo + flip(x4570_6); sumHoohoo = sumHoohoo - x4570_6
    x4571_0 = {0, 0x4571}; x4571_0 = locFlag(x4571_0); if canCrash() or has("Hammers2") then canHoohoo = canHoohoo + flip(x4571_0); sumHoohoo = sumHoohoo - x4571_0 end
    x4571_3 = {3, 0x4571}; x4571_3 = locFlag(x4571_3); if (canCrash() or has("Hammers2")) and canDig() then canHoohoo = canHoohoo + flip(x4571_3); sumHoohoo = sumHoohoo - x4571_3 end
    x4592_6 = {6, 0x4592}; x4592_6 = locFlag(x4592_6); if (canJokesEnd() and canDig()) then canJokes = canJokes + flip(x4592_6); sumJokes = sumJokes - x4592_6 end
    x4592_7 = {7, 0x4592}; x4592_7 = locFlag(x4592_7); if (canJokesEnd() and canDig()) then canJokes = canJokes + flip(x4592_7); sumJokes = sumJokes - x4592_7 end
    x4592_2 = {2, 0x4592}; x4592_2 = locFlag(x4592_2); if (canJokesEnd() and canDig()) then canJokes = canJokes + flip(x4592_2); sumJokes = sumJokes - x4592_2 end
    x4593_0 = {0, 0x4593}; x4593_0 = locFlag(x4593_0); if (canJokesEnd() and hardLogioc()) then canJokes = canJokes + flip(x4593_0); sumJokes = sumJokes - x4593_0 end
    x4593_1 = {1, 0x4593}; x4593_1 = locFlag(x4593_1); if (canJokesEnd() and hardLogioc()) then canJokes = canJokes + flip(x4593_1); sumJokes = sumJokes - x4593_1 end
    x4593_2 = {2, 0x4593}; x4593_2 = locFlag(x4593_2); if (canJokesEnd() and hardLogioc()) then canJokes = canJokes + flip(x4593_2); sumJokes = sumJokes - x4593_2 end
    x4593_3 = {3, 0x4593}; x4593_3 = locFlag(x4593_3); if (canJokesEnd() and hardLogioc()) then canJokes = canJokes + flip(x4593_3); sumJokes = sumJokes - x4593_3 end
    x4593_5 = {5, 0x4593}; x4593_5 = locFlag(x4593_5); if (canJokesEnd() and hardLogioc()) then canJokes = canJokes + flip(x4593_5); sumJokes = sumJokes - x4593_5 end
    x4592_3 = {3, 0x4592}; x4592_3 = locFlag(x4592_3); if (canSurf() and canDig()) then canJokes = canJokes + flip(x4592_3); sumJokes = sumJokes - x4592_3 end
    x4372_7 = {7, 0x4372}; x4372_7 = locFlag(x4372_7); if canJokesEnd() then canJokes = canJokes + flip(x4372_7); sumJokes = sumJokes - x4372_7 end
    x4372_7 = {7, 0x4372}; x4372_7 = locFlag(x4372_7); if canJokesEnd() then canJokes = canJokes + flip(x4372_7); sumJokes = sumJokes - x4372_7 end
    x4593_7 = {7, 0x4593}; x4593_7 = locFlag(x4593_7); if canJokesEnd() then canJokes = canJokes + flip(x4593_7); sumJokes = sumJokes - x4593_7 end
    x4594_0 = {0, 0x4594}; x4594_0 = locFlag(x4594_0); if canJokesEnd() then canJokes = canJokes + flip(x4594_0); sumJokes = sumJokes - x4594_0 end
    x4594_2 = {2, 0x4594}; x4594_2 = locFlag(x4594_2); if canJokesEnd() then canJokes = canJokes + flip(x4594_2); sumJokes = sumJokes - x4594_2 end
    x4594_3 = {3, 0x4594}; x4594_3 = locFlag(x4594_3); if canJokesEnd() then canJokes = canJokes + flip(x4594_3); sumJokes = sumJokes - x4594_3 end
    x4594_1 = {1, 0x4594}; x4594_1 = locFlag(x4594_1); if canJokesEnd() then canJokes = canJokes + flip(x4594_1); sumJokes = sumJokes - x4594_1 end
    x4592_4 = {4, 0x4592}; x4592_4 = locFlag(x4592_4); if canJokesEnd() then canJokes = canJokes + flip(x4592_4); sumJokes = sumJokes - x4592_4 end
    x4592_5 = {5, 0x4592}; x4592_5 = locFlag(x4592_5); if canJokesEnd() then canJokes = canJokes + flip(x4592_5); sumJokes = sumJokes - x4592_5 end
    x4593_6 = {6, 0x4593}; x4593_6 = locFlag(x4593_6); if canJokesDeep() then canJokes = canJokes + flip(x4593_6); sumJokes = sumJokes - x4593_6 end
    x4593_4 = {4, 0x4593}; x4593_4 = locFlag(x4593_4); if canJokesDeep() then canJokes = canJokes + flip(x4593_4); sumJokes = sumJokes - x4593_4 end
    x4598_0 = {0, 0x4598}; x4598_0 = locFlag(x4598_0); if canJokesDeep() then canJokes = canJokes + flip(x4598_0); sumJokes = sumJokes - x4598_0 end
    x4598_1 = {1, 0x4598}; x4598_1 = locFlag(x4598_1); if canJokesDeep() then canJokes = canJokes + flip(x4598_1); sumJokes = sumJokes - x4598_1 end
    x4598_2 = {2, 0x4598}; x4598_2 = locFlag(x4598_2); if canJokesDeep() then canJokes = canJokes + flip(x4598_2); sumJokes = sumJokes - x4598_2 end
    x4594_5 = {5, 0x4594}; x4594_5 = locFlag(x4594_5); if canJokesDeep() then canJokes = canJokes + flip(x4594_5); sumJokes = sumJokes - x4594_5 end
    x4598_3 = {3, 0x4598}; x4598_3 = locFlag(x4598_3); if (canJokesDeep() and has("RedPearlBean")) then canJokes = canJokes + flip(x4598_3); sumJokes = sumJokes - x4598_3 end
    x4596_1 = {1, 0x4596}; x4596_1 = locFlag(x4596_1); if canJokesDeep() then canJokes = canJokes + flip(x4596_1); sumJokes = sumJokes - x4596_1 end
    x4596_4 = {4, 0x4596}; x4596_4 = locFlag(x4596_4); if canJokesDeep() then canJokes = canJokes + flip(x4596_4); sumJokes = sumJokes - x4596_4 end
    x4596_5 = {5, 0x4596}; x4596_5 = locFlag(x4596_5); if canJokesDeep() then canJokes = canJokes + flip(x4596_5); sumJokes = sumJokes - x4596_5 end
    x4596_2 = {2, 0x4596}; x4596_2 = locFlag(x4596_2); if canJokesDeep() then canJokes = canJokes + flip(x4596_2); sumJokes = sumJokes - x4596_2 end
    x4596_3 = {3, 0x4596}; x4596_3 = locFlag(x4596_3); if canJokesDeep() then canJokes = canJokes + flip(x4596_3); sumJokes = sumJokes - x4596_3 end
    x4594_4 = {4, 0x4594}; x4594_4 = locFlag(x4594_4); if canJokesDeep() then canJokes = canJokes + flip(x4594_4); sumJokes = sumJokes - x4594_4 end
    x4594_7 = {7, 0x4594}; x4594_7 = locFlag(x4594_7); if canJokesDeep() then canJokes = canJokes + flip(x4594_7); sumJokes = sumJokes - x4594_7 end
    x4595_0 = {0, 0x4595}; x4595_0 = locFlag(x4595_0); if canJokesDeep() then canJokes = canJokes + flip(x4595_0); sumJokes = sumJokes - x4595_0 end
    x4595_4 = {4, 0x4595}; x4595_4 = locFlag(x4595_4); if canJokesDeep() then canJokes = canJokes + flip(x4595_4); sumJokes = sumJokes - x4595_4 end
    x4595_1 = {1, 0x4595}; x4595_1 = locFlag(x4595_1); if canJokesDeep() then canJokes = canJokes + flip(x4595_1); sumJokes = sumJokes - x4595_1 end
    x4595_2 = {2, 0x4595}; x4595_2 = locFlag(x4595_2); if canJokesDeep() then canJokes = canJokes + flip(x4595_2); sumJokes = sumJokes - x4595_2 end
    x4595_3 = {3, 0x4595}; x4595_3 = locFlag(x4595_3); if canJokesDeep() then canJokes = canJokes + flip(x4595_3); sumJokes = sumJokes - x4595_3 end
    x4595_5 = {5, 0x4595}; x4595_5 = locFlag(x4595_5); if canJokesDeep() then canJokes = canJokes + flip(x4595_5); sumJokes = sumJokes - x4595_5 end
    x4595_6 = {6, 0x4595}; x4595_6 = locFlag(x4595_6); if canJokesDeep() then canJokes = canJokes + flip(x4595_6); sumJokes = sumJokes - x4595_6 end
    x4595_7 = {7, 0x4595}; x4595_7 = locFlag(x4595_7); if canJokesDeep() then canJokes = canJokes + flip(x4595_7); sumJokes = sumJokes - x4595_7 end
    x4596_0 = {0, 0x4596}; x4596_0 = locFlag(x4596_0); if canJokesDeep() then canJokes = canJokes + flip(x4596_0); sumJokes = sumJokes - x4596_0 end
    x4594_6 = {6, 0x4594}; x4594_6 = locFlag(x4594_6); if canJokesDeep() then canJokes = canJokes + flip(x4594_6); sumJokes = sumJokes - x4594_6 end
    x4373_0 = {0, 0x4373}; x4373_0 = locFlag(x4373_0); if canSurf() then canOasis = canOasis + flip(x4373_0); sumOasis = sumOasis - x4373_0 end
    x457F_6 = {6, 0x457F}; x457F_6 = locFlag(x457F_6); if canOhoOasis() then canOasis = canOasis + flip(x457F_6); sumOasis = sumOasis - x457F_6 end
    x4345_3 = {3, 0x4345}; x4345_3 = locFlag(x4345_3); if (canOhoOasis() and canMini()) then canOasis = canOasis + flip(x4345_3); sumOasis = sumOasis - x4345_3 end
    x4345_2 = {2, 0x4345}; x4345_2 = locFlag(x4345_2); if (canOhoOasis() and canDig()) then canOasis = canOasis + flip(x4345_2); sumOasis = sumOasis - x4345_2 end
    x457F_5 = {5, 0x457F}; x457F_5 = locFlag(x457F_5); if (canOhoOasis() and canDig()) then canOasis = canOasis + flip(x457F_5); sumOasis = sumOasis - x457F_5 end
    x4581_1 = {1, 0x4581}; x4581_1 = locFlag(x4581_1); if (canSurf() and canDig()) then canOasis = canOasis + flip(x4581_1); sumOasis = sumOasis - x4581_1 end
    x4581_6 = {6, 0x4581}; x4581_6 = locFlag(x4581_6); if canSurf() then canOasis = canOasis + flip(x4581_6); sumOasis = sumOasis - x4581_6 end
    x4581_7 = {7, 0x4581}; x4581_7 = locFlag(x4581_7); if canSurf() then canOasis = canOasis + flip(x4581_7); sumOasis = sumOasis - x4581_7 end
    x4582_0 = {0, 0x4582}; x4582_0 = locFlag(x4582_0); if canSurf() then canOasis = canOasis + flip(x4582_0); sumOasis = sumOasis - x4582_0 end
    x4582_1 = {1, 0x4582}; x4582_1 = locFlag(x4582_1); if canSurf() then canOasis = canOasis + flip(x4582_1); sumOasis = sumOasis - x4582_1 end
    x4582_2 = {2, 0x4582}; x4582_2 = locFlag(x4582_2); if (canSurf() and canDig()) then canOasis = canOasis + flip(x4582_2); sumOasis = sumOasis - x4582_2 end
    x4582_3 = {3, 0x4582}; x4582_3 = locFlag(x4582_3); if (canSurf() and canDig()) then canOasis = canOasis + flip(x4582_3); sumOasis = sumOasis - x4582_3 end
    x4581_2 = {2, 0x4581}; x4581_2 = locFlag(x4581_2); if canGwarharLagoon() then canOasis = canOasis + flip(x4581_2); sumOasis = sumOasis - x4581_2 end
    x4581_3 = {3, 0x4581}; x4581_3 = locFlag(x4581_3); if (canGwarharLagoon() and canDig()) then canOasis = canOasis + flip(x4581_3); sumOasis = sumOasis - x4581_3 end
    x4582_4 = {4, 0x4582}; x4582_4 = locFlag(x4582_4); if (canSurf() and canDig()) then canOasis = canOasis + flip(x4582_4); sumOasis = sumOasis - x4582_4 end
    x4582_5 = {5, 0x4582}; x4582_5 = locFlag(x4582_5); if (canSurf() and canDig()) then canOasis = canOasis + flip(x4582_5); sumOasis = sumOasis - x4582_5 end
    x4582_6 = {6, 0x4582}; x4582_6 = locFlag(x4582_6); if (canSurf() and canDig()) then canOasis = canOasis + flip(x4582_6); sumOasis = sumOasis - x4582_6 end
    x4582_7 = {7, 0x4582}; x4582_7 = locFlag(x4582_7); if (canSurf() and canDig()) then canOasis = canOasis + flip(x4582_7); sumOasis = sumOasis - x4582_7 end
    x4583_0 = {0, 0x4583}; x4583_0 = locFlag(x4583_0); if (canSurf() and canDig()) then canOasis = canOasis + flip(x4583_0); sumOasis = sumOasis - x4583_0 end
    x4583_1 = {1, 0x4583}; x4583_1 = locFlag(x4583_1); if (canSurf() and canDig()) then canOasis = canOasis + flip(x4583_1); sumOasis = sumOasis - x4583_1 end
    x4583_2 = {2, 0x4583}; x4583_2 = locFlag(x4583_2); if (canSurf() and canDig()) then canOasis = canOasis + flip(x4583_2); sumOasis = sumOasis - x4583_2 end
    x4581_4 = {4, 0x4581}; x4581_4 = locFlag(x4581_4); if (canOhoOasis() and canDig()) then canOasis = canOasis + flip(x4581_4); sumOasis = sumOasis - x4581_4 end
    x4581_5 = {5, 0x4581}; x4581_5 = locFlag(x4581_5); if (canOhoOasis() and canDig()) then canOasis = canOasis + flip(x4581_5); sumOasis = sumOasis - x4581_5 end
    x4599_6 = {6, 0x4599}; x4599_6 = locFlag(x4599_6); canOutskirts = canOutskirts + flip(x4599_6); sumOutskirts = sumOutskirts - x4599_6
    x4599_5 = {5, 0x4599}; x4599_5 = locFlag(x4599_5); canOutskirts = canOutskirts + flip(x4599_5); sumOutskirts = sumOutskirts - x4599_5
    x4599_7 = {7, 0x4599}; x4599_7 = locFlag(x4599_7); canOutskirts = canOutskirts + flip(x4599_7); sumOutskirts = sumOutskirts - x4599_7
    x459A_0 = {0, 0x459A}; x459A_0 = locFlag(x459A_0); canOutskirts = canOutskirts + flip(x459A_0); sumOutskirts = sumOutskirts - x459A_0
    x4374_3 = {3, 0x4374}; x4374_3 = locFlag(x4374_3); if canTeeheeValley() then canTeehee = canTeehee + flip(x4374_3); sumTeehee = sumTeehee - x4374_3 end
    x4591_1 = {1, 0x4591}; x4591_1 = locFlag(x4591_1); if canTeeheeValley() then canTeehee = canTeehee + flip(x4591_1); sumTeehee = sumTeehee - x4591_1 end
    x4591_4 = {4, 0x4591}; x4591_4 = locFlag(x4591_4); if canTeeheeValley() then canTeehee = canTeehee + flip(x4591_4); sumTeehee = sumTeehee - x4591_4 end
    x4591_2 = {2, 0x4591}; x4591_2 = locFlag(x4591_2); if canTeeheeValley() then canTeehee = canTeehee + flip(x4591_2); sumTeehee = sumTeehee - x4591_2 end
    x4591_3 = {3, 0x4591}; x4591_3 = locFlag(x4591_3); if canTeeheeValley() then canTeehee = canTeehee + flip(x4591_3); sumTeehee = sumTeehee - x4591_3 end
    x4580_5 = {5, 0x4580}; x4580_5 = locFlag(x4580_5); if has("PeasleysRose") then canCastleTown = canCastleTown + flip(x4580_5); sumCastleTown = sumCastleTown - x4580_5 end
    x4580_6 = {6, 0x4580}; x4580_6 = locFlag(x4580_6); if has("PeasleysRose") then canCastleTown = canCastleTown + flip(x4580_6); sumCastleTown = sumCastleTown - x4580_6 end
    x4580_7 = {7, 0x4580}; x4580_7 = locFlag(x4580_7); if has("PeasleysRose") then canCastleTown = canCastleTown + flip(x4580_7); sumCastleTown = sumCastleTown - x4580_7 end
    x4581_0 = {0, 0x4581}; x4581_0 = locFlag(x4581_0); if has("PeasleysRose") then canCastleTown = canCastleTown + flip(x4581_0); sumCastleTown = sumCastleTown - x4581_0 end
    x4580_4 = {4, 0x4580}; x4580_4 = locFlag(x4580_4); if has("PeasleysRose") then canCastleTown = canCastleTown + flip(x4580_4); sumCastleTown = sumCastleTown - x4580_4 end
    x457F_7 = {7, 0x457F}; x457F_7 = locFlag(x457F_7); if has("PeasleysRose") then canCastleTown = canCastleTown + flip(x457F_7); sumCastleTown = sumCastleTown - x457F_7 end
    x4580_0 = {0, 0x4580}; x4580_0 = locFlag(x4580_0); if has("PeasleysRose") then canCastleTown = canCastleTown + flip(x4580_0); sumCastleTown = sumCastleTown - x4580_0 end
    x4580_1 = {1, 0x4580}; x4580_1 = locFlag(x4580_1); if has("PeasleysRose") then canCastleTown = canCastleTown + flip(x4580_1); sumCastleTown = sumCastleTown - x4580_1 end
    x4580_2 = {2, 0x4580}; x4580_2 = locFlag(x4580_2); if (has("PeasleysRose") and has("Hammers1")) then canCastleTown = canCastleTown + flip(x4580_2); sumCastleTown = sumCastleTown - x4580_2 end
    x4580_3 = {3, 0x4580}; x4580_3 = locFlag(x4580_3); if (has("PeasleysRose") and has("Hammers1")) then canCastleTown = canCastleTown + flip(x4580_3); sumCastleTown = sumCastleTown - x4580_3 end
    x4564_0 = {0, 0x4564}; x4564_0 = locFlag(x4564_0); canStardust = canStardust + flip(x4564_0); sumStardust = sumStardust - x4564_0
    x4564_1 = {1, 0x4564}; x4564_1 = locFlag(x4564_1); canStardust = canStardust + flip(x4564_1); sumStardust = sumStardust - x4564_1
    x4564_2 = {2, 0x4564}; x4564_2 = locFlag(x4564_2); canStardust = canStardust + flip(x4564_2); sumStardust = sumStardust - x4564_2
    x4564_3 = {3, 0x4564}; x4564_3 = locFlag(x4564_3); canStardust = canStardust + flip(x4564_3); sumStardust = sumStardust - x4564_3
    x4564_4 = {4, 0x4564}; x4564_4 = locFlag(x4564_4); canStardust = canStardust + flip(x4564_4); sumStardust = sumStardust - x4564_4
    x4564_5 = {5, 0x4564}; x4564_5 = locFlag(x4564_5); canStardust = canStardust + flip(x4564_5); sumStardust = sumStardust - x4564_5
    x4565_0 = {0, 0x4565}; x4565_0 = locFlag(x4565_0); canStardust = canStardust + flip(x4565_0); sumStardust = sumStardust - x4565_0
    x4564_6 = {6, 0x4564}; x4564_6 = locFlag(x4564_6); canStardust = canStardust + flip(x4564_6); sumStardust = sumStardust - x4564_6
    x4564_7 = {7, 0x4564}; x4564_7 = locFlag(x4564_7); canStardust = canStardust + flip(x4564_7); sumStardust = sumStardust - x4564_7
    x4565_3 = {3, 0x4565}; x4565_3 = locFlag(x4565_3); canStardust = canStardust + flip(x4565_3); sumStardust = sumStardust - x4565_3
    x4565_2 = {2, 0x4565}; x4565_2 = locFlag(x4565_2); canStardust = canStardust + flip(x4565_2); sumStardust = sumStardust - x4565_2
    x4565_1 = {1, 0x4565}; x4565_1 = locFlag(x4565_1); canStardust = canStardust + flip(x4565_1); sumStardust = sumStardust - x4565_1
    x4566_0 = {0, 0x4566}; x4566_0 = locFlag(x4566_0); canStardust = canStardust + flip(x4566_0); sumStardust = sumStardust - x4566_0
    x4565_7 = {7, 0x4565}; x4565_7 = locFlag(x4565_7); canStardust = canStardust + flip(x4565_7); sumStardust = sumStardust - x4565_7
    x4566_1 = {1, 0x4566}; x4566_1 = locFlag(x4566_1); canStardust = canStardust + flip(x4566_1); sumStardust = sumStardust - x4566_1
    x4565_4 = {4, 0x4565}; x4565_4 = locFlag(x4565_4); canStardust = canStardust + flip(x4565_4); sumStardust = sumStardust - x4565_4
    x4565_5 = {5, 0x4565}; x4565_5 = locFlag(x4565_5); canStardust = canStardust + flip(x4565_5); sumStardust = sumStardust - x4565_5
    x4375_1 = {1, 0x4375}; x4375_1 = locFlag(x4375_1); if canSurf() then canOasis = canOasis + flip(x4375_1); sumOasis = sumOasis - x4375_1 end
    x458F_1 = {1, 0x458F}; x458F_1 = locFlag(x458F_1); if canBirdo() then canTeehee = canTeehee + flip(x458F_1); sumTeehee = sumTeehee - x458F_1 end
    x458F_2 = {2, 0x458F}; x458F_2 = locFlag(x458F_2); if canBirdo() then canTeehee = canTeehee + flip(x458F_2); sumTeehee = sumTeehee - x458F_2 end
    x458F_3 = {3, 0x458F}; x458F_3 = locFlag(x458F_3); if canBirdo() then canTeehee = canTeehee + flip(x458F_3); sumTeehee = sumTeehee - x458F_3 end
    x458F_4 = {4, 0x458F}; x458F_4 = locFlag(x458F_4); if canBirdo() then canTeehee = canTeehee + flip(x458F_4); sumTeehee = sumTeehee - x458F_4 end
    x4590_7 = {7, 0x4590}; x4590_7 = locFlag(x4590_7); if (canTeeheeValley() and canDig()) then canTeehee = canTeehee + flip(x4590_7); sumTeehee = sumTeehee - x4590_7 end
    x4590_3 = {3, 0x4590}; x4590_3 = locFlag(x4590_3); if (has("Hammers3") and canDig()) then canTeehee = canTeehee + flip(x4590_3); sumTeehee = sumTeehee - x4590_3 end
    x458F_5 = {5, 0x458F}; x458F_5 = locFlag(x458F_5); if (canTeeheeValley() and has("Hammers3")) then canTeehee = canTeehee + flip(x458F_5); sumTeehee = sumTeehee - x458F_5 end
    x458F_7 = {7, 0x458F}; x458F_7 = locFlag(x458F_7); if (canTeeheeValley() and has("Hammers3")) then canTeehee = canTeehee + flip(x458F_7); sumTeehee = sumTeehee - x458F_7 end
    x4590_0 = {0, 0x4590}; x4590_0 = locFlag(x4590_0); if (canTeeheeValley() and has("Hammers3") and canDig()) then canTeehee = canTeehee + flip(x4590_0); sumTeehee = sumTeehee - x4590_0 end
    x4590_1 = {1, 0x4590}; x4590_1 = locFlag(x4590_1); if canBirdo() then canTeehee = canTeehee + flip(x4590_1); sumTeehee = sumTeehee - x4590_1 end
    x4590_2 = {2, 0x4590}; x4590_2 = locFlag(x4590_2); if (canTeeheeValley() and has("Hammers3") and canDig()) then canTeehee = canTeehee + flip(x4590_2); sumTeehee = sumTeehee - x4590_2 end
    x458F_6 = {6, 0x458F}; x458F_6 = locFlag(x458F_6); if (canTeeheeValley() and has("Hammers3")) then canTeehee = canTeehee + flip(x458F_6); sumTeehee = sumTeehee - x458F_6 end
    x458E_3 = {3, 0x458E}; x458E_3 = locFlag(x458E_3); if (canTeeheeValley() and canDig()) then canTeehee = canTeehee + flip(x458E_3); sumTeehee = sumTeehee - x458E_3 end
    x458E_4 = {4, 0x458E}; x458E_4 = locFlag(x458E_4); if (canTeeheeValley() and canDig()) then canTeehee = canTeehee + flip(x458E_4); sumTeehee = sumTeehee - x458E_4 end
    x458E_5 = {5, 0x458E}; x458E_5 = locFlag(x458E_5); if (canTeeheeValley() and canDig()) then canTeehee = canTeehee + flip(x458E_5); sumTeehee = sumTeehee - x458E_5 end
    x458E_6 = {6, 0x458E}; x458E_6 = locFlag(x458E_6); if (canTeeheeValley() and canDig()) then canTeehee = canTeehee + flip(x458E_6); sumTeehee = sumTeehee - x458E_6 end
    x458E_7 = {7, 0x458E}; x458E_7 = locFlag(x458E_7); if (canTeeheeValley() and canDig()) then canTeehee = canTeehee + flip(x458E_7); sumTeehee = sumTeehee - x458E_7 end
    x458F_0 = {0, 0x458F}; x458F_0 = locFlag(x458F_0); if (canTeeheeValley() and canDig()) then canTeehee = canTeehee + flip(x458F_0); sumTeehee = sumTeehee - x458F_0 end
    x4591_0 = {0, 0x4591}; x4591_0 = locFlag(x4591_0); if (canFungi() and canDig()) then canTeehee = canTeehee + flip(x4591_0); sumTeehee = sumTeehee - x4591_0 end
    x4590_6 = {6, 0x4590}; x4590_6 = locFlag(x4590_6); if has("Hammers3") then canTeehee = canTeehee + flip(x4590_6); sumTeehee = sumTeehee - x4590_6 end
    x4590_4 = {4, 0x4590}; x4590_4 = locFlag(x4590_4); if (has("Hammers3") and canDig()) then canTeehee = canTeehee + flip(x4590_4); sumTeehee = sumTeehee - x4590_4 end
    x4590_5 = {5, 0x4590}; x4590_5 = locFlag(x4590_5); if (has("Hammers3") and canDig()) then canTeehee = canTeehee + flip(x4590_5); sumTeehee = sumTeehee - x4590_5 end
    x457E_3 = {3, 0x457E}; x457E_3 = locFlag(x457E_3); if (has("BeanbeanBrooch") and canDash() and has("WinkleCard")) then canChucklehuck = canChucklehuck + flip(x457E_3); sumChucklehuck = sumChucklehuck - x457E_3 end
    x4596_6 = {6, 0x4596}; x4596_6 = locFlag(x4596_6); if (has("BeanbeanBrooch") and canDash() and canDig()) then canChucklehuck = canChucklehuck + flip(x4596_6); sumChucklehuck = sumChucklehuck - x4596_6 end
    x457E_4 = {4, 0x457E}; x457E_4 = locFlag(x457E_4); if (has("BeanbeanBrooch") and canDash() and canDig()) then canChucklehuck = canChucklehuck + flip(x457E_4); sumChucklehuck = sumChucklehuck - x457E_4 end
    x457E_5 = {5, 0x457E}; x457E_5 = locFlag(x457E_5); if (has("BeanbeanBrooch") and canDash()) then canChucklehuck = canChucklehuck + flip(x457E_5); sumChucklehuck = sumChucklehuck - x457E_5 end
    x430C_7 = {7, 0x430C}; x430C_7 = locFlag(x430C_7); if (has("BeanbeanBrooch") and canDash()) then canChucklehuck = canChucklehuck + flip(x430C_7); sumChucklehuck = sumChucklehuck - x430C_7 end
    x4584_4 = {4, 0x4584}; x4584_4 = locFlag(x4584_4); if canGoblets() then canHooniversity = canHooniversity + flip(x4584_4); sumHooniversity = sumHooniversity - x4584_4 end
    x4584_5 = {5, 0x4584}; x4584_5 = locFlag(x4584_5); if canGoblets() then canHooniversity = canHooniversity + flip(x4584_5); sumHooniversity = sumHooniversity - x4584_5 end
    x4584_6 = {6, 0x4584}; x4584_6 = locFlag(x4584_6); if canGoblets() then canHooniversity = canHooniversity + flip(x4584_6); sumHooniversity = sumHooniversity - x4584_6 end
    x4584_7 = {7, 0x4584}; x4584_7 = locFlag(x4584_7); if canGoblets() then canHooniversity = canHooniversity + flip(x4584_7); sumHooniversity = sumHooniversity - x4584_7 end
    x4584_3 = {3, 0x4584}; x4584_3 = locFlag(x4584_3); if canGoblets() then canHooniversity = canHooniversity + flip(x4584_3); sumHooniversity = sumHooniversity - x4584_3 end
    x4585_0 = {0, 0x4585}; x4585_0 = locFlag(x4585_0); if canGoblets() then canHooniversity = canHooniversity + flip(x4585_0); sumHooniversity = sumHooniversity - x4585_0 end
    x458D_5 = {5, 0x458D}; x458D_5 = locFlag(x458D_5); if canGoblets() then canHooniversity = canHooniversity + flip(x458D_5); sumHooniversity = sumHooniversity - x458D_5 end
    x458D_6 = {6, 0x458D}; x458D_6 = locFlag(x458D_6); if canGoblets() then canHooniversity = canHooniversity + flip(x458D_6); sumHooniversity = sumHooniversity - x458D_6 end
    x458D_7 = {7, 0x458D}; x458D_7 = locFlag(x458D_7); if canGoblets() then canHooniversity = canHooniversity + flip(x458D_7); sumHooniversity = sumHooniversity - x458D_7 end
    x458E_0 = {0, 0x458E}; x458E_0 = locFlag(x458E_0); if canGoblets() then canHooniversity = canHooniversity + flip(x458E_0); sumHooniversity = sumHooniversity - x458E_0 end
    x4586_4 = {4, 0x4586}; x4586_4 = locFlag(x4586_4); if canDig() then canHooniversity = canHooniversity + flip(x4586_4); sumHooniversity = sumHooniversity - x4586_4 end
    x4586_2 = {2, 0x4586}; x4586_2 = locFlag(x4586_2); if canDig() then canHooniversity = canHooniversity + flip(x4586_2); sumHooniversity = sumHooniversity - x4586_2 end
    x4586_3 = {3, 0x4586}; x4586_3 = locFlag(x4586_3); if canDig() then canHooniversity = canHooniversity + flip(x4586_3); sumHooniversity = sumHooniversity - x4586_3 end
    x4586_5 = {5, 0x4586}; x4586_5 = locFlag(x4586_5); if canMini() then canHooniversity = canHooniversity + flip(x4586_5); sumHooniversity = sumHooniversity - x4586_5 end
    x4586_6 = {6, 0x4586}; x4586_6 = locFlag(x4586_6); if canDig() then canHooniversity = canHooniversity + flip(x4586_6); sumHooniversity = sumHooniversity - x4586_6 end
    x4586_7 = {7, 0x4586}; x4586_7 = locFlag(x4586_7); if canMini() then canHooniversity = canHooniversity + flip(x4586_7); sumHooniversity = sumHooniversity - x4586_7 end
    x4587_0 = {0, 0x4587}; x4587_0 = locFlag(x4587_0); if canMini() then canHooniversity = canHooniversity + flip(x4587_0); sumHooniversity = sumHooniversity - x4587_0 end
    x4587_1 = {1, 0x4587}; x4587_1 = locFlag(x4587_1); if canMini() then canHooniversity = canHooniversity + flip(x4587_1); sumHooniversity = sumHooniversity - x4587_1 end
    x4587_2 = {2, 0x4587}; x4587_2 = locFlag(x4587_2); if canMini() then canHooniversity = canHooniversity + flip(x4587_2); sumHooniversity = sumHooniversity - x4587_2 end
    x4587_6 = {6, 0x4587}; x4587_6 = locFlag(x4587_6); if canGoblets() then canHooniversity = canHooniversity + flip(x4587_6); sumHooniversity = sumHooniversity - x4587_6 end
    x4587_7 = {7, 0x4587}; x4587_7 = locFlag(x4587_7); if canGoblets() then canHooniversity = canHooniversity + flip(x4587_7); sumHooniversity = sumHooniversity - x4587_7 end
    x4588_0 = {0, 0x4588}; x4588_0 = locFlag(x4588_0); if canGoblets() then canHooniversity = canHooniversity + flip(x4588_0); sumHooniversity = sumHooniversity - x4588_0 end
    x4588_1 = {1, 0x4588}; x4588_1 = locFlag(x4588_1); if canGoblets() then canHooniversity = canHooniversity + flip(x4588_1); sumHooniversity = sumHooniversity - x4588_1 end
    x4587_3 = {3, 0x4587}; x4587_3 = locFlag(x4587_3); if canGoblets() then canHooniversity = canHooniversity + flip(x4587_3); sumHooniversity = sumHooniversity - x4587_3 end
    x4587_4 = {4, 0x4587}; x4587_4 = locFlag(x4587_4); if canGoblets() then canHooniversity = canHooniversity + flip(x4587_4); sumHooniversity = sumHooniversity - x4587_4 end
    x4587_5 = {5, 0x4587}; x4587_5 = locFlag(x4587_5); if canGoblets() then canHooniversity = canHooniversity + flip(x4587_5); sumHooniversity = sumHooniversity - x4587_5 end
    x458E_1 = {1, 0x458E}; x458E_1 = locFlag(x458E_1); if canGoblets() then canHooniversity = canHooniversity + flip(x458E_1); sumHooniversity = sumHooniversity - x458E_1 end
    x458E_2 = {2, 0x458E}; x458E_2 = locFlag(x458E_2); if canGoblets() then canHooniversity = canHooniversity + flip(x458E_2); sumHooniversity = sumHooniversity - x458E_2 end
    x459E_3 = {3, 0x459E}; x459E_3 = locFlag(x459E_3); if canGoblets() then canHooniversity = canHooniversity + flip(x459E_3); sumHooniversity = sumHooniversity - x459E_3 end
    x459E_4 = {4, 0x459E}; x459E_4 = locFlag(x459E_4); if canGoblets() then canHooniversity = canHooniversity + flip(x459E_4); sumHooniversity = sumHooniversity - x459E_4 end
    x459E_5 = {5, 0x459E}; x459E_5 = locFlag(x459E_5); if canGoblets() then canHooniversity = canHooniversity + flip(x459E_5); sumHooniversity = sumHooniversity - x459E_5 end
    x4584_0 = {0, 0x4584}; x4584_0 = locFlag(x4584_0); if canGoblets() then canHooniversity = canHooniversity + flip(x4584_0); sumHooniversity = sumHooniversity - x4584_0 end
    x4583_3 = {3, 0x4583}; x4583_3 = locFlag(x4583_3); canHooniversity = canHooniversity + flip(x4583_3); sumHooniversity = sumHooniversity - x4583_3
    x4583_4 = {4, 0x4583}; x4583_4 = locFlag(x4583_4); canHooniversity = canHooniversity + flip(x4583_4); sumHooniversity = sumHooniversity - x4583_4
    x4583_5 = {5, 0x4583}; x4583_5 = locFlag(x4583_5); canHooniversity = canHooniversity + flip(x4583_5); sumHooniversity = sumHooniversity - x4583_5
    x4583_6 = {6, 0x4583}; x4583_6 = locFlag(x4583_6); canHooniversity = canHooniversity + flip(x4583_6); sumHooniversity = sumHooniversity - x4583_6
    x4583_7 = {7, 0x4583}; x4583_7 = locFlag(x4583_7); canHooniversity = canHooniversity + flip(x4583_7); sumHooniversity = sumHooniversity - x4583_7
    x4585_2 = {2, 0x4585}; x4585_2 = locFlag(x4585_2); if canDig() then canHooniversity = canHooniversity + flip(x4585_2); sumHooniversity = sumHooniversity - x4585_2 end
    x4585_3 = {3, 0x4585}; x4585_3 = locFlag(x4585_3); if canDig() then canHooniversity = canHooniversity + flip(x4585_3); sumHooniversity = sumHooniversity - x4585_3 end
    x4585_4 = {4, 0x4585}; x4585_4 = locFlag(x4585_4); canHooniversity = canHooniversity + flip(x4585_4); sumHooniversity = sumHooniversity - x4585_4
    x4585_5 = {5, 0x4585}; x4585_5 = locFlag(x4585_5); canHooniversity = canHooniversity + flip(x4585_5); sumHooniversity = sumHooniversity - x4585_5
    x4585_6 = {6, 0x4585}; x4585_6 = locFlag(x4585_6); canHooniversity = canHooniversity + flip(x4585_6); sumHooniversity = sumHooniversity - x4585_6
    x4585_7 = {7, 0x4585}; x4585_7 = locFlag(x4585_7); if canDig() then canHooniversity = canHooniversity + flip(x4585_7); sumHooniversity = sumHooniversity - x4585_7 end
    x4586_0 = {0, 0x4586}; x4586_0 = locFlag(x4586_0); if canDig() then canHooniversity = canHooniversity + flip(x4586_0); sumHooniversity = sumHooniversity - x4586_0 end
    x4586_1 = {1, 0x4586}; x4586_1 = locFlag(x4586_1); if canDig() then canHooniversity = canHooniversity + flip(x4586_1); sumHooniversity = sumHooniversity - x4586_1 end
    x4584_1 = {1, 0x4584}; x4584_1 = locFlag(x4584_1); if canDig() then canHooniversity = canHooniversity + flip(x4584_1); sumHooniversity = sumHooniversity - x4584_1 end
    x4584_2 = {2, 0x4584}; x4584_2 = locFlag(x4584_2); if canDig() then canHooniversity = canHooniversity + flip(x4584_2); sumHooniversity = sumHooniversity - x4584_2 end
    --x434C_4 = {4, 0x434C}; x434C_4 = locFlag(x434C_4); if (canDash() and canBeanFruits()) then canOutskirts = canOutskirts + flip(x434C_4); sumOutskirts = sumOutskirts - x434C_4 end
    --x434C_6 = {6, 0x434C}; x434C_6 = locFlag(x434C_6); if (canDash() and canBeanFruits()) then canOutskirts = canOutskirts + flip(x434C_6); sumOutskirts = sumOutskirts - x434C_6 end
    --x434C_3 = {3, 0x434C}; x434C_3 = locFlag(x434C_3); if (canDash() and canBeanFruits()) then canOutskirts = canOutskirts + flip(x434C_3); sumOutskirts = sumOutskirts - x434C_3 end
    --x434C_7 = {7, 0x434C}; x434C_7 = locFlag(x434C_7); if (canDash() and canBeanFruits()) then canOutskirts = canOutskirts + flip(x434C_7); sumOutskirts = sumOutskirts - x434C_7 end
    --x434D_1 = {1, 0x434D}; x434D_1 = locFlag(x434D_1); if (canDash() and canBeanFruits()) then canOutskirts = canOutskirts + flip(x434D_1); sumOutskirts = sumOutskirts - x434D_1 end
    --x434D_0 = {0, 0x434D}; x434D_0 = locFlag(x434D_0); if (canDash() and canBeanFruits()) then canOutskirts = canOutskirts + flip(x434D_0); sumOutskirts = sumOutskirts - x434D_0 end
    --x434C_5 = {5, 0x434C}; x434C_5 = locFlag(x434C_5); if (canDash() and canBeanFruits()) then canOutskirts = canOutskirts + flip(x434C_5); sumOutskirts = sumOutskirts - x434C_5 end
	
	
	print(canStardust .. " / " .. sumStardust .. " (" .. maxStardust .. ") - Stardust Fields")
	print(canHoohoo .. " / " .. sumHoohoo .. " (" .. maxHoohoo .. ") - Hoohoo Mountain")
	print(canOutskirts .. " / " .. sumOutskirts .. " (" .. maxOutskirts .. ") - Beanbean Outskirts")
	print(canCastleTown .. " / " .. sumCastleTown .. " (" .. maxCastleTown .. ") - Beanbean Castle Town")
	print(canChucklehuck .. " / " .. sumChucklehuck .. " (" .. maxChucklehuck .. ") - Chucklehuck Woods")
	print(canHooniversity .. " / " .. sumHooniversity .. " (" .. maxHooniversity .. ") - Woohoo Hooniversity")
	print(canOasis .. " / " .. sumOasis .. " (" .. maxOasis .. ") - Oho Oasis")
	print(canTeehee .. " / " .. sumTeehee .. " (" .. maxTeehee .. ") - Teehee Valley")
	print(canFungitown .. " / " .. sumFungitown .. " (" .. maxFungitown .. ") - Fungitown")
	print(canGwarhar .. " / " .. sumGwarhar .. " (" .. maxGwarhar .. ") - Gwarhar Lagoon")
	print(canJokes .. " / " .. sumJokes .. " (" .. maxJokes .. ") - Joke's End")
	--Stardust
	--Hoohoo
	--Outskirts
	--CastleTown
	--Chucklehuck
	--Hooniversity
	--Oasis
	--Teehee
	--Fungitown
	--Gwarhar
	--Jokes
end


function refreshlocs()
	console.clear()
	refreshItemFlags()
	loadLocFlags()
	-- local locTotal = getAvailablelocTotals()
	-- local locMaxTotal = getMaxlocTotals()
	-- print(locTotal .. " / " .. locMaxTotal)
end

loadLocFlags()

while true do
	local moduloRefresh = emu.framecount() % refreshRate
	if moduloRefresh == 0 then loadLocFlags() end
	emu.frameadvance();
end	