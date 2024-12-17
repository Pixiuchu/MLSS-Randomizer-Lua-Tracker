dofile("tables.lua")
dofile("logic.lua")
refreshRate = 1


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
	
	local canrOutskirts = 0
	local sumrOutskirts = 102
	local maxrOutskirts = 102
	local canrCastleTown = 0
	local sumrCastleTown = 58
	local maxrCastleTown = 58
	local canrGwarhar = 0
	local sumrGwarhar = 29
	local maxrGwarhar = 29
	local canrChucklehuck = 0
	local sumrChucklehuck = 69
	local maxrChucklehuck = 69
	local canrStardust = 0
	local sumrStardust = 19
	local maxrStardust = 19
	local canrHoohoo = 0
	local sumrHoohoo = 73 -- with Minecart: 73
	local maxrHoohoo = 73
	local canrJokes = 0
	local sumrJokes = 42
	local maxrJokes = 42
	local canrOasis = 0
	local sumrOasis = 24
	local maxrOasis = 24
	local canrTeehee = 0
	local sumrTeehee = 29
	local maxrTeehee = 29
	local canrHooniversity = 0
	local sumrHooniversity = 47
	local maxrHooniversity = 47

	
	--[[ Example: 13 / 18 means I can do 13 locations out of 18
	sum must be 18.
	19 max - 1 done = 18
	
	Example flags with and without logic:
    x4565_0 = {0, 0x4565}; x4565_0 = locFlag(x4565_0); canStardust = canStardust + flip(x4565_0); sumStardust = sumStardust - x4565_0
    x4565_1 = {1, 0x4565}; x4565_1 = locFlag(x4565_1); if has("WinkleCard") then canStardust = canStardust + flip(x4565_1); sumStardust = sumStardust - x4565_1 end]]
	
	
    if has("Thunderhand") and canDig() then local x4589_1 = {1, 0x4589}; x4589_1 = locFlag(x4589_1); canrOutskirts = canrOutskirts + flip(x4589_1); sumrOutskirts = sumrOutskirts - x4589_1 end --Airport Center Digspot 1
    if has("Thunderhand") and canDig() then local x4589_2 = {2, 0x4589}; x4589_2 = locFlag(x4589_2); canrOutskirts = canrOutskirts + flip(x4589_2); sumrOutskirts = sumrOutskirts - x4589_2 end --Airport Center Digspot 2
    if has("Thunderhand") and canDig() then local x4589_3 = {3, 0x4589}; x4589_3 = locFlag(x4589_3); canrOutskirts = canrOutskirts + flip(x4589_3); sumrOutskirts = sumrOutskirts - x4589_3 end --Airport Center Digspot 3
    if has("Thunderhand") and canDig() then local x4589_4 = {4, 0x4589}; x4589_4 = locFlag(x4589_4); canrOutskirts = canrOutskirts + flip(x4589_4); sumrOutskirts = sumrOutskirts - x4589_4 end --Airport Center Digspot 4
    if has("Thunderhand") and canDig() then local x4589_5 = {5, 0x4589}; x4589_5 = locFlag(x4589_5); canrOutskirts = canrOutskirts + flip(x4589_5); sumrOutskirts = sumrOutskirts - x4589_5 end --Airport Center Digspot 5
    if has("Thunderhand") and canDig() then local x4589_6 = {6, 0x4589}; x4589_6 = locFlag(x4589_6); canrOutskirts = canrOutskirts + flip(x4589_6); sumrOutskirts = sumrOutskirts - x4589_6 end --Airport Eastside Digspot 1
    if has("Thunderhand") and canDig() then local x4589_7 = {7, 0x4589}; x4589_7 = locFlag(x4589_7); canrOutskirts = canrOutskirts + flip(x4589_7); sumrOutskirts = sumrOutskirts - x4589_7 end --Airport Eastside Digspot 2
    if has("Thunderhand") and canDig() then local x458A_0 = {0, 0x458A}; x458A_0 = locFlag(x458A_0); canrOutskirts = canrOutskirts + flip(x458A_0); sumrOutskirts = sumrOutskirts - x458A_0 end --Airport Eastside Digspot 3
    if has("Thunderhand") and canDig() then local x458A_1 = {1, 0x458A}; x458A_1 = locFlag(x458A_1); canrOutskirts = canrOutskirts + flip(x458A_1); sumrOutskirts = sumrOutskirts - x458A_1 end --Airport Eastside Digspot 4
    if has("Thunderhand") and canDig() then local x458A_2 = {2, 0x458A}; x458A_2 = locFlag(x458A_2); canrOutskirts = canrOutskirts + flip(x458A_2); sumrOutskirts = sumrOutskirts - x458A_2 end --Airport Eastside Digspot 5
    if has("Thunderhand") and canDig() then local x4588_2 = {2, 0x4588}; x4588_2 = locFlag(x4588_2); canrOutskirts = canrOutskirts + flip(x4588_2); sumrOutskirts = sumrOutskirts - x4588_2 end --Airport Entrance Digspot
    if has("Thunderhand") and canDig() then local x4588_3 = {3, 0x4588}; x4588_3 = locFlag(x4588_3); canrOutskirts = canrOutskirts + flip(x4588_3); sumrOutskirts = sumrOutskirts - x4588_3 end --Airport Lobby Digspot
    if has("Thunderhand") and canDig() then local x4588_4 = {4, 0x4588}; x4588_4 = locFlag(x4588_4); canrOutskirts = canrOutskirts + flip(x4588_4); sumrOutskirts = sumrOutskirts - x4588_4 end --Airport Westside Digspot 1
    if has("Thunderhand") and canDig() then local x4588_5 = {5, 0x4588}; x4588_5 = locFlag(x4588_5); canrOutskirts = canrOutskirts + flip(x4588_5); sumrOutskirts = sumrOutskirts - x4588_5 end --Airport Westside Digspot 2
    if has("Thunderhand") and canDig() then local x4588_6 = {6, 0x4588}; x4588_6 = locFlag(x4588_6); canrOutskirts = canrOutskirts + flip(x4588_6); sumrOutskirts = sumrOutskirts - x4588_6 end --Airport Westside Digspot 3
    if has("Thunderhand") and canDig() then local x4588_7 = {7, 0x4588}; x4588_7 = locFlag(x4588_7); canrOutskirts = canrOutskirts + flip(x4588_7); sumrOutskirts = sumrOutskirts - x4588_7 end --Airport Westside Digspot 4
    if has("Thunderhand") and canDig() then local x4589_0 = {0, 0x4589}; x4589_0 = locFlag(x4589_0); canrOutskirts = canrOutskirts + flip(x4589_0); sumrOutskirts = sumrOutskirts - x4589_0 end --Airport Westside Digspot 5
    if has("PeasleysRose") then local x4300_6 = {6, 0x4300}; x4300_6 = locFlag(x4300_6); canrCastleTown = canrCastleTown + flip(x4300_6); sumrCastleTown = sumrCastleTown - x4300_6 end --Beanbean Castle Beanbean Brooch
    if canBeanstar() then local x433D_3 = {3, 0x433D}; x433D_3 = locFlag(x433D_3); canrCastleTown = canrCastleTown + flip(x433D_3); sumrCastleTown = sumrCastleTown - x433D_3 end --Beanbean Castle Fake Beanstar
    if canBeanstar() then local x433D_3 = {3, 0x433D}; x433D_3 = locFlag(x433D_3); canrCastleTown = canrCastleTown + flip(x433D_3); sumrCastleTown = sumrCastleTown - x433D_3 end --Beanbean Castle Peach's Extra Dress
    if canChuckolator() then local x42FF_3 = {3, 0x42FF}; x42FF_3 = locFlag(x42FF_3); canrCastleTown = canrCastleTown + flip(x42FF_3); sumrCastleTown = sumrCastleTown - x42FF_3 end --Beanbean Castle Town Beanlet 1
    if canChuckolator() then local x42FF_5 = {5, 0x42FF}; x42FF_5 = locFlag(x42FF_5); canrCastleTown = canrCastleTown + flip(x42FF_5); sumrCastleTown = sumrCastleTown - x42FF_5 end --Beanbean Castle Town Beanlet 2
    if canChuckolator() then local x42FF_4 = {4, 0x42FF}; x42FF_4 = locFlag(x42FF_4); canrCastleTown = canrCastleTown + flip(x42FF_4); sumrCastleTown = sumrCastleTown - x42FF_4 end --Beanbean Castle Town Beanlet 3
    if canChuckolator() then local x42FF_2 = {2, 0x42FF}; x42FF_2 = locFlag(x42FF_2); canrCastleTown = canrCastleTown + flip(x42FF_2); sumrCastleTown = sumrCastleTown - x42FF_2 end --Beanbean Castle Town Beanlet 4
    if canChuckolator() then local x42FF_1 = {1, 0x42FF}; x42FF_1 = locFlag(x42FF_1); canrCastleTown = canrCastleTown + flip(x42FF_1); sumrCastleTown = sumrCastleTown - x42FF_1 end --Beanbean Castle Town Beanlet 5
    if canChuckolator() then local x42FF_0 = {0, 0x42FF}; x42FF_0 = locFlag(x42FF_0); canrCastleTown = canrCastleTown + flip(x42FF_0); sumrCastleTown = sumrCastleTown - x42FF_0 end --Beanbean Castle Town Beanlet Reward
    if canChuckolator() and canDig() then local x4302_4 = {4, 0x4302}; x4302_4 = locFlag(x4302_4); canrCastleTown = canrCastleTown + flip(x4302_4); sumrCastleTown = sumrCastleTown - x4302_4 end --Beanbean Castle Town Beanstone 1
    if canChuckolator() and canDig() then local x4302_5 = {5, 0x4302}; x4302_5 = locFlag(x4302_5); canrCastleTown = canrCastleTown + flip(x4302_5); sumrCastleTown = sumrCastleTown - x4302_5 end --Beanbean Castle Town Beanstone 2
    if canChuckolator() and canDig() then local x4302_6 = {6, 0x4302}; x4302_6 = locFlag(x4302_6); canrCastleTown = canrCastleTown + flip(x4302_6); sumrCastleTown = sumrCastleTown - x4302_6 end --Beanbean Castle Town Beanstone 3
    if canChuckolator() and canDig() then local x4302_7 = {7, 0x4302}; x4302_7 = locFlag(x4302_7); canrCastleTown = canrCastleTown + flip(x4302_7); sumrCastleTown = sumrCastleTown - x4302_7 end --Beanbean Castle Town Beanstone 4
    if canChuckolator() and canDig() then local x4303_0 = {0, 0x4303}; x4303_0 = locFlag(x4303_0); canrCastleTown = canrCastleTown + flip(x4303_0); sumrCastleTown = sumrCastleTown - x4303_0 end --Beanbean Castle Town Beanstone 5
    if canChuckolator() and canDig() then local x4303_1 = {1, 0x4303}; x4303_1 = locFlag(x4303_1); canrCastleTown = canrCastleTown + flip(x4303_1); sumrCastleTown = sumrCastleTown - x4303_1 end --Beanbean Castle Town Beanstone 6
    if canChuckolator() and canDig() then local x4303_2 = {2, 0x4303}; x4303_2 = locFlag(x4303_2); canrCastleTown = canrCastleTown + flip(x4303_2); sumrCastleTown = sumrCastleTown - x4303_2 end --Beanbean Castle Town Beanstone 7
    if canChuckolator() and canDig() then local x4303_3 = {3, 0x4303}; x4303_3 = locFlag(x4303_3); canrCastleTown = canrCastleTown + flip(x4303_3); sumrCastleTown = sumrCastleTown - x4303_3 end --Beanbean Castle Town Beanstone 8
    if canChuckolator() and canDig() then local x4303_4 = {4, 0x4303}; x4303_4 = locFlag(x4303_4); canrCastleTown = canrCastleTown + flip(x4303_4); sumrCastleTown = sumrCastleTown - x4303_4 end --Beanbean Castle Town Beanstone 9
    if canChuckolator() and canDig() then local x4303_5 = {5, 0x4303}; x4303_5 = locFlag(x4303_5); canrCastleTown = canrCastleTown + flip(x4303_5); sumrCastleTown = sumrCastleTown - x4303_5 end --Beanbean Castle Town Beanstone 10
    if canChuckolator() and canDig() then local x42FF_7 = {7, 0x42FF}; x42FF_7 = locFlag(x42FF_7); canrCastleTown = canrCastleTown + flip(x42FF_7); sumrCastleTown = sumrCastleTown - x42FF_7 end --Beanbean Castle Town Beanstone Reward
    if canChuckolator() then local x4568_1 = {1, 0x4568}; x4568_1 = locFlag(x4568_1); canrCastleTown = canrCastleTown + flip(x4568_1); sumrCastleTown = sumrCastleTown - x4568_1 end --Beanbean Castle Town East Side House Block 1
    if canChuckolator() then local x4568_2 = {2, 0x4568}; x4568_2 = locFlag(x4568_2); canrCastleTown = canrCastleTown + flip(x4568_2); sumrCastleTown = sumrCastleTown - x4568_2 end --Beanbean Castle Town East Side House Block 2
    if canChuckolator() then local x4568_3 = {3, 0x4568}; x4568_3 = locFlag(x4568_3); canrCastleTown = canrCastleTown + flip(x4568_3); sumrCastleTown = sumrCastleTown - x4568_3 end --Beanbean Castle Town East Side House Block 3
    if canChuckolator() then local x4568_4 = {4, 0x4568}; x4568_4 = locFlag(x4568_4); canrCastleTown = canrCastleTown + flip(x4568_4); sumrCastleTown = sumrCastleTown - x4568_4 end --Beanbean Castle Town East Side House Block 4
    if canMini() then local x4568_6 = {6, 0x4568}; x4568_6 = locFlag(x4568_6); canrCastleTown = canrCastleTown + flip(x4568_6); sumrCastleTown = sumrCastleTown - x4568_6 end --Beanbean Castle Town Mini Mario Block 1
    if canMini() then local x4568_7 = {7, 0x4568}; x4568_7 = locFlag(x4568_7); canrCastleTown = canrCastleTown + flip(x4568_7); sumrCastleTown = sumrCastleTown - x4568_7 end --Beanbean Castle Town Mini Mario Block 2
    if canMini() then local x4569_0 = {0, 0x4569}; x4569_0 = locFlag(x4569_0); canrCastleTown = canrCastleTown + flip(x4569_0); sumrCastleTown = sumrCastleTown - x4569_0 end --Beanbean Castle Town Mini Mario Block 3
    if canMini() then local x4569_1 = {1, 0x4569}; x4569_1 = locFlag(x4569_1); canrCastleTown = canrCastleTown + flip(x4569_1); sumrCastleTown = sumrCastleTown - x4569_1 end --Beanbean Castle Town Mini Mario Block 4
    if canMini() then local x4569_2 = {2, 0x4569}; x4569_2 = locFlag(x4569_2); canrCastleTown = canrCastleTown + flip(x4569_2); sumrCastleTown = sumrCastleTown - x4569_2 end --Beanbean Castle Town Mini Mario Block 5
    local x4568_5 = {5, 0x4568}; x4568_5 = locFlag(x4568_5); canrCastleTown = canrCastleTown + flip(x4568_5); sumrCastleTown = sumrCastleTown - x4568_5 --Beanbean Castle Town Passport Photo Room Coin Block
    if canChuckolator() then local x4567_5 = {5, 0x4567}; x4567_5 = locFlag(x4567_5); canrCastleTown = canrCastleTown + flip(x4567_5); sumrCastleTown = sumrCastleTown - x4567_5 end --Beanbean Castle Town West Side House Block 1
    if canChuckolator() then local x4567_6 = {6, 0x4567}; x4567_6 = locFlag(x4567_6); canrCastleTown = canrCastleTown + flip(x4567_6); sumrCastleTown = sumrCastleTown - x4567_6 end --Beanbean Castle Town West Side House Block 2
    if canChuckolator() then local x4567_7 = {7, 0x4567}; x4567_7 = locFlag(x4567_7); canrCastleTown = canrCastleTown + flip(x4567_7); sumrCastleTown = sumrCastleTown - x4567_7 end --Beanbean Castle Town West Side House Block 3
    if canChuckolator() then local x4568_0 = {0, 0x4568}; x4568_0 = locFlag(x4568_0); canrCastleTown = canrCastleTown + flip(x4568_0); sumrCastleTown = sumrCastleTown - x4568_0 end --Beanbean Castle Town West Side House Block 4
    if canDig() then local x432C_6 = {6, 0x432C}; x432C_6 = locFlag(x432C_6); canrOutskirts = canrOutskirts + flip(x432C_6); sumrOutskirts = sumrOutskirts - x432C_6 end --Beanbean Outskirts Bean Fruit 1
    if canDig() then local x432D_1 = {1, 0x432D}; x432D_1 = locFlag(x432D_1); canrOutskirts = canrOutskirts + flip(x432D_1); sumrOutskirts = sumrOutskirts - x432D_1 end --Beanbean Outskirts Bean Fruit 2
    if canDig() then local x432B_4 = {4, 0x432B}; x432B_4 = locFlag(x432B_4); canrOutskirts = canrOutskirts + flip(x432B_4); sumrOutskirts = sumrOutskirts - x432B_4 end --Beanbean Outskirts Bean Fruit 3
    if canDig() and has("Hammers2") then local x432B_7 = {7, 0x432B}; x432B_7 = locFlag(x432B_7); canrOutskirts = canrOutskirts + flip(x432B_7); sumrOutskirts = sumrOutskirts - x432B_7 end --Beanbean Outskirts Bean Fruit 4
    if canDig() and has("Hammers2") then local x434B_1 = {1, 0x434B}; x434B_1 = locFlag(x434B_1); canrOutskirts = canrOutskirts + flip(x434B_1); sumrOutskirts = sumrOutskirts - x434B_1 end --Beanbean Outskirts Bean Fruit 5
    if canDig() then local x432B_2 = {2, 0x432B}; x432B_2 = locFlag(x432B_2); canrOutskirts = canrOutskirts + flip(x432B_2); sumrOutskirts = sumrOutskirts - x432B_2 end --Beanbean Outskirts Bean Fruit 6
    if canTeehee() and canDig() then local x432D_5 = {5, 0x432D}; x432D_5 = locFlag(x432D_5); canrOutskirts = canrOutskirts + flip(x432D_5); sumrOutskirts = sumrOutskirts - x432D_5 end --Beanbean Outskirts Bean Fruit 7
    if canCrash() and canDig() then local x4598_4 = {4, 0x4598}; x4598_4 = locFlag(x4598_4); canrOutskirts = canrOutskirts + flip(x4598_4); sumrOutskirts = sumrOutskirts - x4598_4 end --Beanbean Outskirts Before Harhall Digspot 1
    if canCrash() and canDig() then local x4598_5 = {5, 0x4598}; x4598_5 = locFlag(x4598_5); canrOutskirts = canrOutskirts + flip(x4598_5); sumrOutskirts = sumrOutskirts - x4598_5 end --Beanbean Outskirts Before Harhall Digspot 2
    if canCrash() and canMini() then local x434B_3 = {3, 0x434B}; x434B_3 = locFlag(x434B_3); canrOutskirts = canrOutskirts + flip(x434B_3); sumrOutskirts = sumrOutskirts - x434B_3 end --Beanbean Outskirts Boo Statue Mole
    if canDig() and has("BeanbeanBrooch") then local x4598_6 = {6, 0x4598}; x4598_6 = locFlag(x4598_6); canrOutskirts = canrOutskirts + flip(x4598_6); sumrOutskirts = sumrOutskirts - x4598_6 end --Beanbean Outskirts Brooch Guards Room Digspot 1
    if canDig() and has("BeanbeanBrooch") then local x4598_7 = {7, 0x4598}; x4598_7 = locFlag(x4598_7); canrOutskirts = canrOutskirts + flip(x4598_7); sumrOutskirts = sumrOutskirts - x4598_7 end --Beanbean Outskirts Brooch Guards Room Digspot 2
    if canDig() and has("BeanbeanBrooch") then local x4599_0 = {0, 0x4599}; x4599_0 = locFlag(x4599_0); canrOutskirts = canrOutskirts + flip(x4599_0); sumrOutskirts = sumrOutskirts - x4599_0 end --Beanbean Outskirts Chateau Entrance Digspot 1
    if canDig() and has("BeanbeanBrooch") then local x4599_1 = {1, 0x4599}; x4599_1 = locFlag(x4599_1); canrOutskirts = canrOutskirts + flip(x4599_1); sumrOutskirts = sumrOutskirts - x4599_1 end --Beanbean Outskirts Chateau Entrance Digspot 2
    if canDig() then local x4576_2 = {2, 0x4576}; x4576_2 = locFlag(x4576_2); canrOutskirts = canrOutskirts + flip(x4576_2); sumrOutskirts = sumrOutskirts - x4576_2 end --Beanbean Outskirts E Digspot 1
    if canDig() and has("Thunderhand") then local x4576_3 = {3, 0x4576}; x4576_3 = locFlag(x4576_3); canrOutskirts = canrOutskirts + flip(x4576_3); sumrOutskirts = sumrOutskirts - x4576_3 end --Beanbean Outskirts E Digspot 2
    if canDig() then local x4576_4 = {4, 0x4576}; x4576_4 = locFlag(x4576_4); canrOutskirts = canrOutskirts + flip(x4576_4); sumrOutskirts = sumrOutskirts - x4576_4 end --Beanbean Outskirts E Digspot 3
    if canDig() then local x459D_3 = {3, 0x459D}; x459D_3 = locFlag(x459D_3); canrOutskirts = canrOutskirts + flip(x459D_3); sumrOutskirts = sumrOutskirts - x459D_3 end --Beanbean Outskirts Entrance to Hoohoo Mountain Base Digspot 1
    if canDig() then local x459D_4 = {4, 0x459D}; x459D_4 = locFlag(x459D_4); canrOutskirts = canrOutskirts + flip(x459D_4); sumrOutskirts = sumrOutskirts - x459D_4 end --Beanbean Outskirts Entrance to Hoohoo Mountain Base Digspot 2
    if canDig() and has("Thunderhand") then local x4571_5 = {5, 0x4571}; x4571_5 = locFlag(x4571_5); canrOutskirts = canrOutskirts + flip(x4571_5); sumrOutskirts = sumrOutskirts - x4571_5 end --Beanbean Outskirts Farm Room Digspot 1
    if canDig() and has("Thunderhand") then local x4571_6 = {6, 0x4571}; x4571_6 = locFlag(x4571_6); canrOutskirts = canrOutskirts + flip(x4571_6); sumrOutskirts = sumrOutskirts - x4571_6 end --Beanbean Outskirts Farm Room Digspot 2
    if canDig() and has("Thunderhand") then local x4571_7 = {7, 0x4571}; x4571_7 = locFlag(x4571_7); canrOutskirts = canrOutskirts + flip(x4571_7); sumrOutskirts = sumrOutskirts - x4571_7 end --Beanbean Outskirts Farm Room Digspot 3
    if has("Thunderhand") then local x434B_0 = {0, 0x434B}; x434B_0 = locFlag(x434B_0); canrOutskirts = canrOutskirts + flip(x434B_0); sumrOutskirts = sumrOutskirts - x434B_0 end --Beanbean Outskirts Farm Room Mole Reward 1
    if has("Thunderhand") then local x434B_0 = {0, 0x434B}; x434B_0 = locFlag(x434B_0); canrOutskirts = canrOutskirts + flip(x434B_0); sumrOutskirts = sumrOutskirts - x434B_0 end --Beanbean Outskirts Farm Room Mole Reward 2
    if canDig() then local x4574_1 = {1, 0x4574}; x4574_1 = locFlag(x4574_1); canrOutskirts = canrOutskirts + flip(x4574_1); sumrOutskirts = sumrOutskirts - x4574_1 end --Beanbean Outskirts N Room 1 Digspot
    if canDig() then local x4574_2 = {2, 0x4574}; x4574_2 = locFlag(x4574_2); canrOutskirts = canrOutskirts + flip(x4574_2); sumrOutskirts = sumrOutskirts - x4574_2 end --Beanbean Outskirts N Room 2 Digspot
    if canDig() and has("Thunderhand") then local x4576_0 = {0, 0x4576}; x4576_0 = locFlag(x4576_0); canrOutskirts = canrOutskirts + flip(x4576_0); sumrOutskirts = sumrOutskirts - x4576_0 end --Beanbean Outskirts NE Digspot 1
    if canDig() then local x4576_1 = {1, 0x4576}; x4576_1 = locFlag(x4576_1); canrOutskirts = canrOutskirts + flip(x4576_1); sumrOutskirts = sumrOutskirts - x4576_1 end --Beanbean Outskirts NE Digspot 2
    if canMini() then local x434B_4 = {4, 0x434B}; x434B_4 = locFlag(x434B_4); canrOutskirts = canrOutskirts + flip(x434B_4); sumrOutskirts = sumrOutskirts - x434B_4 end --Beanbean Outskirts NE Solo Mario Mole 1
    if canMini() then local x434B_5 = {5, 0x434B}; x434B_5 = locFlag(x434B_5); canrOutskirts = canrOutskirts + flip(x434B_5); sumrOutskirts = sumrOutskirts - x434B_5 end --Beanbean Outskirts NE Solo Mario Mole 2
    if has("Hammers2") then local x4572_6 = {6, 0x4572}; x4572_6 = locFlag(x4572_6); canrOutskirts = canrOutskirts + flip(x4572_6); sumrOutskirts = sumrOutskirts - x4572_6 end --Beanbean Outskirts NW Block
    if has("Hammers2") then local x4572_7 = {7, 0x4572}; x4572_7 = locFlag(x4572_7); canrOutskirts = canrOutskirts + flip(x4572_7); sumrOutskirts = sumrOutskirts - x4572_7 end --Beanbean Outskirts NW Coin Block
    if canDig() then local x4573_0 = {0, 0x4573}; x4573_0 = locFlag(x4573_0); canrOutskirts = canrOutskirts + flip(x4573_0); sumrOutskirts = sumrOutskirts - x4573_0 end --Beanbean Outskirts NW Digspot
    if canDig() then local x4577_1 = {1, 0x4577}; x4577_1 = locFlag(x4577_1); canrOutskirts = canrOutskirts + flip(x4577_1); sumrOutskirts = sumrOutskirts - x4577_1 end --Beanbean Outskirts North Beach Digspot 1
    if canDig() then local x4577_3 = {3, 0x4577}; x4577_3 = locFlag(x4577_3); canrOutskirts = canrOutskirts + flip(x4577_3); sumrOutskirts = sumrOutskirts - x4577_3 end --Beanbean Outskirts North Beach Digspot 2
    if canTeehee() and canDig() then local x4577_2 = {2, 0x4577}; x4577_2 = locFlag(x4577_2); canrOutskirts = canrOutskirts + flip(x4577_2); sumrOutskirts = sumrOutskirts - x4577_2 end --Beanbean Outskirts North Beach Digspot 3
    if canDig() then local x459E_6 = {6, 0x459E}; x459E_6 = locFlag(x459E_6); canrOutskirts = canrOutskirts + flip(x459E_6); sumrOutskirts = sumrOutskirts - x459E_6 end --Beanbean Outskirts Pipe 2 Room Digspot
    if canDig() then local x459E_7 = {7, 0x459E}; x459E_7 = locFlag(x459E_7); canrOutskirts = canrOutskirts + flip(x459E_7); sumrOutskirts = sumrOutskirts - x459E_7 end --Beanbean Outskirts Pipe 4 Room Digspot
    if has("Thunderhand") and has("Hammers3") then local x4574_6 = {6, 0x4574}; x4574_6 = locFlag(x4574_6); canrOutskirts = canrOutskirts + flip(x4574_6); sumrOutskirts = sumrOutskirts - x4574_6 end --Beanbean Outskirts S Room 1 Block
    if has("Thunderhand") and has("Hammers3") then local x4574_5 = {5, 0x4574}; x4574_5 = locFlag(x4574_5); canrOutskirts = canrOutskirts + flip(x4574_5); sumrOutskirts = sumrOutskirts - x4574_5 end --Beanbean Outskirts S Room 1 Coin Block
    if canDig() then local x4574_3 = {3, 0x4574}; x4574_3 = locFlag(x4574_3); canrOutskirts = canrOutskirts + flip(x4574_3); sumrOutskirts = sumrOutskirts - x4574_3 end --Beanbean Outskirts S Room 1 Digspot 1
    if has("Thunderhand") and has("Hammers3") and canDig() then local x4574_7 = {7, 0x4574}; x4574_7 = locFlag(x4574_7); canrOutskirts = canrOutskirts + flip(x4574_7); sumrOutskirts = sumrOutskirts - x4574_7 end --Beanbean Outskirts S Room 1 Digspot 2
    if canDig() then local x4575_3 = {3, 0x4575}; x4575_3 = locFlag(x4575_3); canrOutskirts = canrOutskirts + flip(x4575_3); sumrOutskirts = sumrOutskirts - x4575_3 end --Beanbean Outskirts S Room 2 Block 1
    if canCrash() then local x4575_1 = {1, 0x4575}; x4575_1 = locFlag(x4575_1); canrOutskirts = canrOutskirts + flip(x4575_1); sumrOutskirts = sumrOutskirts - x4575_1 end --Beanbean Outskirts S Room 2 Block 2
    if canCrash() then local x4575_2 = {2, 0x4575}; x4575_2 = locFlag(x4575_2); canrOutskirts = canrOutskirts + flip(x4575_2); sumrOutskirts = sumrOutskirts - x4575_2 end --Beanbean Outskirts S Room 2 Coin Block
    if canCrash() and canDig() then local x4575_6 = {6, 0x4575}; x4575_6 = locFlag(x4575_6); canrOutskirts = canrOutskirts + flip(x4575_6); sumrOutskirts = sumrOutskirts - x4575_6 end --Beanbean Outskirts S Room 2 Digspot 1
    if canCrash() and canDig() then local x4575_5 = {5, 0x4575}; x4575_5 = locFlag(x4575_5); canrOutskirts = canrOutskirts + flip(x4575_5); sumrOutskirts = sumrOutskirts - x4575_5 end --Beanbean Outskirts S Room 2 Digspot 2
    if canCrash() and canDig() then local x4575_0 = {0, 0x4575}; x4575_0 = locFlag(x4575_0); canrOutskirts = canrOutskirts + flip(x4575_0); sumrOutskirts = sumrOutskirts - x4575_0 end --Beanbean Outskirts S Room 2 Digspot 3
    if canDig() then local x4576_5 = {5, 0x4576}; x4576_5 = locFlag(x4576_5); canrOutskirts = canrOutskirts + flip(x4576_5); sumrOutskirts = sumrOutskirts - x4576_5 end --Beanbean Outskirts SE Digspot 1
    if canDig() then local x4576_7 = {7, 0x4576}; x4576_7 = locFlag(x4576_7); canrOutskirts = canrOutskirts + flip(x4576_7); sumrOutskirts = sumrOutskirts - x4576_7 end --Beanbean Outskirts SE Digspot 2
    if canDig() then local x4577_0 = {0, 0x4577}; x4577_0 = locFlag(x4577_0); canrOutskirts = canrOutskirts + flip(x4577_0); sumrOutskirts = sumrOutskirts - x4577_0 end --Beanbean Outskirts SE Digspot 3
    if canDig() then local x4573_5 = {5, 0x4573}; x4573_5 = locFlag(x4573_5); canrOutskirts = canrOutskirts + flip(x4573_5); sumrOutskirts = sumrOutskirts - x4573_5 end --Beanbean Outskirts SW Digspot 1
    if canDig() then local x4573_7 = {7, 0x4573}; x4573_7 = locFlag(x4573_7); canrOutskirts = canrOutskirts + flip(x4573_7); sumrOutskirts = sumrOutskirts - x4573_7 end --Beanbean Outskirts SW Digspot 2
    if canDig() then local x4574_0 = {0, 0x4574}; x4574_0 = locFlag(x4574_0); canrOutskirts = canrOutskirts + flip(x4574_0); sumrOutskirts = sumrOutskirts - x4574_0 end --Beanbean Outskirts SW Digspot 3
    if has("Thunderhand") and has("Hammers2") then local x434E_1 = {1, 0x434E}; x434E_1 = locFlag(x434E_1); canrOutskirts = canrOutskirts + flip(x434E_1); sumrOutskirts = sumrOutskirts - x434E_1 end --Beanbean Outskirts Secret Scroll 1
    if has("Thunderhand") and has("Hammers3") then local x434E_2 = {2, 0x434E}; x434E_2 = locFlag(x434E_2); canrOutskirts = canrOutskirts + flip(x434E_2); sumrOutskirts = sumrOutskirts - x434E_2 end --Beanbean Outskirts Secret Scroll 2
    if canDig() then local x434B_2 = {2, 0x434B}; x434B_2 = locFlag(x434B_2); canrOutskirts = canrOutskirts + flip(x434B_2); sumrOutskirts = sumrOutskirts - x434B_2 end --Beanbean Outskirts Solo Luigi Cave Mole
    if canDig() then local x4577_4 = {4, 0x4577}; x4577_4 = locFlag(x4577_4); canrOutskirts = canrOutskirts + flip(x4577_4); sumrOutskirts = sumrOutskirts - x4577_4 end --Beanbean Outskirts South Beach Digspot
    if canDig() then local x4599_2 = {2, 0x4599}; x4599_2 = locFlag(x4599_2); canrOutskirts = canrOutskirts + flip(x4599_2); sumrOutskirts = sumrOutskirts - x4599_2 end --Beanbean Outskirts South of Hooniversity Guards Digspot 1
    if canDig() then local x4599_3 = {3, 0x4599}; x4599_3 = locFlag(x4599_3); canrOutskirts = canrOutskirts + flip(x4599_3); sumrOutskirts = sumrOutskirts - x4599_3 end --Beanbean Outskirts South of Hooniversity Guards Digspot 2
    if canDig() then local x4599_4 = {4, 0x4599}; x4599_4 = locFlag(x4599_4); canrOutskirts = canrOutskirts + flip(x4599_4); sumrOutskirts = sumrOutskirts - x4599_4 end --Beanbean Outskirts South of Hooniversity Guards Digspot 3
    if has("Thunderhand") then local x4359_5 = {5, 0x4359}; x4359_5 = locFlag(x4359_5); canrOutskirts = canrOutskirts + flip(x4359_5); sumrOutskirts = sumrOutskirts - x4359_5 end --Beanbean Outskirts Super Hammer Upgrade
    local x4577_6 = {6, 0x4577}; x4577_6 = locFlag(x4577_6); canrOutskirts = canrOutskirts + flip(x4577_6); sumrOutskirts = sumrOutskirts - x4577_6 --Beanbean Outskirts Surf Beach Block
    if canSurf() and canDig() then local x4577_5 = {5, 0x4577}; x4577_5 = locFlag(x4577_5); canrOutskirts = canrOutskirts + flip(x4577_5); sumrOutskirts = sumrOutskirts - x4577_5 end --Beanbean Outskirts Surf Beach Digspot 1
    if canSurf() and canDig() then local x4577_7 = {7, 0x4577}; x4577_7 = locFlag(x4577_7); canrOutskirts = canrOutskirts + flip(x4577_7); sumrOutskirts = sumrOutskirts - x4577_7 end --Beanbean Outskirts Surf Beach Digspot 2
    if canSurf() and canDig() then local x4578_0 = {0, 0x4578}; x4578_0 = locFlag(x4578_0); canrOutskirts = canrOutskirts + flip(x4578_0); sumrOutskirts = sumrOutskirts - x4578_0 end --Beanbean Outskirts Surf Beach Digspot 3
    if has("Thunderhand") then local x4373_3 = {3, 0x4373}; x4373_3 = locFlag(x4373_3); canrOutskirts = canrOutskirts + flip(x4373_3); sumrOutskirts = sumrOutskirts - x4373_3 end --Beanbean Outskirts Thunderhand Mole
    if has("Thunderhand") and canBeanstar() then local x4359_6 = {6, 0x4359}; x4359_6 = locFlag(x4359_6); canrOutskirts = canrOutskirts + flip(x4359_6); sumrOutskirts = sumrOutskirts - x4359_6 end --Beanbean Outskirts Ultra Hammer Upgrade
    if canDig() then local x4573_2 = {2, 0x4573}; x4573_2 = locFlag(x4573_2); canrOutskirts = canrOutskirts + flip(x4573_2); sumrOutskirts = sumrOutskirts - x4573_2 end --Beanbean Outskirts W Digspot 1
    if canDig() then local x4573_3 = {3, 0x4573}; x4573_3 = locFlag(x4573_3); canrOutskirts = canrOutskirts + flip(x4573_3); sumrOutskirts = sumrOutskirts - x4573_3 end --Beanbean Outskirts W Digspot 2
    if canDig() then local x4573_4 = {4, 0x4573}; x4573_4 = locFlag(x4573_4); canrOutskirts = canrOutskirts + flip(x4573_4); sumrOutskirts = sumrOutskirts - x4573_4 end --Beanbean Outskirts W Digspot 3
    if canCrash() then local x432E_4 = {4, 0x432E}; x432E_4 = locFlag(x432E_4); canrOutskirts = canrOutskirts + flip(x432E_4); sumrOutskirts = sumrOutskirts - x432E_4 end --Beanstar Piece Harhall
    if canGwarharDeep() and canCrash() then local x4340_5 = {5, 0x4340}; x4340_5 = locFlag(x4340_5); canrGwarhar = canrGwarhar + flip(x4340_5); sumrGwarhar = sumrGwarhar - x4340_5 end --Beanstar Piece Hermie
    if has("BeanbeanBrooch") and canDash() and has("WinkleCard") then local x430F_0 = {0, 0x430F}; x430F_0 = locFlag(x430F_0); canrChucklehuck = canrChucklehuck + flip(x430F_0); sumrChucklehuck = sumrChucklehuck - x430F_0 end --Beanstar Piece Winkle Area
    if canDash() and canNeonEggs() then local x434D_5 = {5, 0x434D}; x434D_5 = locFlag(x434D_5); canrOutskirts = canrOutskirts + flip(x434D_5); sumrOutskirts = sumrOutskirts - x434D_5 end --Beanstar Piece Yoshi Theater
    -- local  --Bowser's Castle Before Fawful Fight Block 1
    -- local  --Bowser's Castle Before Fawful Fight Block 2
    -- local  --Bowser's Castle Before Wendy Fight Block 1
    -- local  --Bowser's Castle Before Wendy Fight Block 2
    -- local  --Bowser's Castle Entrance Block 1
    -- local  --Bowser's Castle Entrance Block 2
    -- local  --Bowser's Castle Entrance Digspot
    -- local  --Bowser's Castle Great Door Block 1
    -- local  --Bowser's Castle Great Door Block 2
    -- local  --Bowser's Castle Iggy & Morton Hallway Block 1
    -- local  --Bowser's Castle Iggy & Morton Hallway Block 2
    -- local  --Bowser's Castle Iggy & Morton Hallway Digspot
    -- local  --Bowser's Castle Larry Room Block
    -- local  --Bowser's Castle Lemmy Room 1 Block
    -- local  --Bowser's Castle Lemmy Room 1 Digspot
    -- local  --Bowser's Castle Lemmy Room Mole
    -- local  --Bowser's Castle Ludwig & Roy Hallway Block 1
    -- local  --Bowser's Castle Ludwig & Roy Hallway Block 2
    -- local  --Bowser's Castle Ludwig Room 1 Block
    -- local  --Bowser's Castle Mini Mario Maze Block 1
    -- local  --Bowser's Castle Mini Mario Maze Block 2
    -- local  --Bowser's Castle Mini Mario Sidescroller Block 1
    -- local  --Bowser's Castle Mini Mario Sidescroller Block 2
    -- local  --Bowser's Castle Morton Room 1 Digspot
    -- local  --Bowser's Castle Past Morton Block
    -- local  --Bowser's Castle Roy Corridor Block 1
    -- local  --Bowser's Castle Roy Corridor Block 2
    -- local  --Bowser's Castle Wendy & Larry Hallway Digspot
    local x456F_6 = {6, 0x456F}; x456F_6 = locFlag(x456F_6); canrStardust = canrStardust + flip(x456F_6); sumrStardust = sumrStardust - x456F_6 --Cave Connecting Stardust Fields and Hoohoo Village Block 1
    local x456F_7 = {7, 0x456F}; x456F_7 = locFlag(x456F_7); canrStardust = canrStardust + flip(x456F_7); sumrStardust = sumrStardust - x456F_7 --Cave Connecting Stardust Fields and Hoohoo Village Block 2
    if has("BeanbeanBrooch") and canDig() then local x4578_7 = {7, 0x4578}; x4578_7 = locFlag(x4578_7); canrChucklehuck = canrChucklehuck + flip(x4578_7); sumrChucklehuck = sumrChucklehuck - x4578_7 end --Chateau Barrel Room Digspot
    if has("BeanbeanBrooch") and canDig() then local x4579_0 = {0, 0x4579}; x4579_0 = locFlag(x4579_0); canrChucklehuck = canrChucklehuck + flip(x4579_0); sumrChucklehuck = sumrChucklehuck - x4579_0 end --Chateau Goblet Room Digspot
    if has("BeanbeanBrooch") and canDig() then local x42FE_2 = {2, 0x42FE}; x42FE_2 = locFlag(x42FE_2); canrChucklehuck = canrChucklehuck + flip(x42FE_2); sumrChucklehuck = sumrChucklehuck - x42FE_2 end --Chateau Green Goblet
    if has("BeanbeanBrooch") then local x4578_3 = {3, 0x4578}; x4578_3 = locFlag(x4578_3); canrChucklehuck = canrChucklehuck + flip(x4578_3); sumrChucklehuck = sumrChucklehuck - x4578_3 end --Chateau Popple Fight Room Block 1
    if has("BeanbeanBrooch") then local x4578_5 = {5, 0x4578}; x4578_5 = locFlag(x4578_5); canrChucklehuck = canrChucklehuck + flip(x4578_5); sumrChucklehuck = sumrChucklehuck - x4578_5 end --Chateau Popple Fight Room Block 2
    if has("BeanbeanBrooch") and canDig() then local x4578_6 = {6, 0x4578}; x4578_6 = locFlag(x4578_6); canrChucklehuck = canrChucklehuck + flip(x4578_6); sumrChucklehuck = sumrChucklehuck - x4578_6 end --Chateau Popple Fight Room Digspot
    if has("BeanbeanBrooch") then local x4578_2 = {2, 0x4578}; x4578_2 = locFlag(x4578_2); canrChucklehuck = canrChucklehuck + flip(x4578_2); sumrChucklehuck = sumrChucklehuck - x4578_2 end --Chateau Popple Room Coin Block 1
    if has("BeanbeanBrooch") then local x4578_4 = {4, 0x4578}; x4578_4 = locFlag(x4578_4); canrChucklehuck = canrChucklehuck + flip(x4578_4); sumrChucklehuck = sumrChucklehuck - x4578_4 end --Chateau Popple Room Coin Block 2
    if has("BeanbeanBrooch") and canMini() then local x42FE_1 = {1, 0x42FE}; x42FE_1 = locFlag(x42FE_1); canrChucklehuck = canrChucklehuck + flip(x42FE_1); sumrChucklehuck = sumrChucklehuck - x42FE_1 end --Chateau Red Goblet
    if has("BeanbeanBrooch") and canDig() then local x4578_1 = {1, 0x4578}; x4578_1 = locFlag(x4578_1); canrChucklehuck = canrChucklehuck + flip(x4578_1); sumrChucklehuck = sumrChucklehuck - x4578_1 end --Chateau Room 1 Digspot
    if has("BeanbeanBrooch") then local x4579_2 = {2, 0x4579}; x4579_2 = locFlag(x4579_2); canrChucklehuck = canrChucklehuck + flip(x4579_2); sumrChucklehuck = sumrChucklehuck - x4579_2 end --Chucklehuck Woods Cave Room 1 Block 1
    if has("BeanbeanBrooch") then local x4579_3 = {3, 0x4579}; x4579_3 = locFlag(x4579_3); canrChucklehuck = canrChucklehuck + flip(x4579_3); sumrChucklehuck = sumrChucklehuck - x4579_3 end --Chucklehuck Woods Cave Room 1 Block 2
    if has("BeanbeanBrooch") then local x4579_1 = {1, 0x4579}; x4579_1 = locFlag(x4579_1); canrChucklehuck = canrChucklehuck + flip(x4579_1); sumrChucklehuck = sumrChucklehuck - x4579_1 end --Chucklehuck Woods Cave Room 1 Coin Block
    if has("BeanbeanBrooch") then local x4579_5 = {5, 0x4579}; x4579_5 = locFlag(x4579_5); canrChucklehuck = canrChucklehuck + flip(x4579_5); sumrChucklehuck = sumrChucklehuck - x4579_5 end --Chucklehuck Woods Cave Room 2 Block
    if has("BeanbeanBrooch") then local x4579_4 = {4, 0x4579}; x4579_4 = locFlag(x4579_4); canrChucklehuck = canrChucklehuck + flip(x4579_4); sumrChucklehuck = sumrChucklehuck - x4579_4 end --Chucklehuck Woods Cave Room 2 Coin Block
    if has("BeanbeanBrooch") then local x4579_6 = {6, 0x4579}; x4579_6 = locFlag(x4579_6); canrChucklehuck = canrChucklehuck + flip(x4579_6); sumrChucklehuck = sumrChucklehuck - x4579_6 end --Chucklehuck Woods Cave Room 3 Block
    if has("BeanbeanBrooch") then local x4579_7 = {7, 0x4579}; x4579_7 = locFlag(x4579_7); canrChucklehuck = canrChucklehuck + flip(x4579_7); sumrChucklehuck = sumrChucklehuck - x4579_7 end --Chucklehuck Woods Cave Room 3 Coin Block
    if has("BeanbeanBrooch") and canDig() then local x457C_0 = {0, 0x457C}; x457C_0 = locFlag(x457C_0); canrChucklehuck = canrChucklehuck + flip(x457C_0); sumrChucklehuck = sumrChucklehuck - x457C_0 end --Chucklehuck Woods East of Chuckleroot Digspot
    if has("BeanbeanBrooch") then local x457E_6 = {6, 0x457E}; x457E_6 = locFlag(x457E_6); canrChucklehuck = canrChucklehuck + flip(x457E_6); sumrChucklehuck = sumrChucklehuck - x457E_6 end --Chucklehuck Woods Koopa Room Block 1
    if has("BeanbeanBrooch") then local x457F_0 = {0, 0x457F}; x457F_0 = locFlag(x457F_0); canrChucklehuck = canrChucklehuck + flip(x457F_0); sumrChucklehuck = sumrChucklehuck - x457F_0 end --Chucklehuck Woods Koopa Room Block 2
    if has("BeanbeanBrooch") then local x457E_7 = {7, 0x457E}; x457E_7 = locFlag(x457E_7); canrChucklehuck = canrChucklehuck + flip(x457E_7); sumrChucklehuck = sumrChucklehuck - x457E_7 end --Chucklehuck Woods Koopa Room Coin Block
    if has("BeanbeanBrooch") and canDig() then local x457F_1 = {1, 0x457F}; x457F_1 = locFlag(x457F_1); canrChucklehuck = canrChucklehuck + flip(x457F_1); sumrChucklehuck = sumrChucklehuck - x457F_1 end --Chucklehuck Woods Koopa Room Digspot
    if has("BeanbeanBrooch") and canDig() then local x457C_1 = {1, 0x457C}; x457C_1 = locFlag(x457C_1); canrChucklehuck = canrChucklehuck + flip(x457C_1); sumrChucklehuck = sumrChucklehuck - x457C_1 end --Chucklehuck Woods Northeast of Chuckleroot Digspot 1
    if has("BeanbeanBrooch") and canDig() then local x457C_2 = {2, 0x457C}; x457C_2 = locFlag(x457C_2); canrChucklehuck = canrChucklehuck + flip(x457C_2); sumrChucklehuck = sumrChucklehuck - x457C_2 end --Chucklehuck Woods Northeast of Chuckleroot Digspot 2
    if has("BeanbeanBrooch") and canDig() then local x457C_3 = {3, 0x457C}; x457C_3 = locFlag(x457C_3); canrChucklehuck = canrChucklehuck + flip(x457C_3); sumrChucklehuck = sumrChucklehuck - x457C_3 end --Chucklehuck Woods Northeast of Chuckleroot Digspot 3
    if has("BeanbeanBrooch") and canDig() then local x457C_4 = {4, 0x457C}; x457C_4 = locFlag(x457C_4); canrChucklehuck = canrChucklehuck + flip(x457C_4); sumrChucklehuck = sumrChucklehuck - x457C_4 end --Chucklehuck Woods Northeast of Chuckleroot Digspot 4
    if canPreChuckolator() then local x457D_4 = {4, 0x457D}; x457D_4 = locFlag(x457D_4); canrChucklehuck = canrChucklehuck + flip(x457D_4); sumrChucklehuck = sumrChucklehuck - x457D_4 end --Chucklehuck Woods Past Chuckleroot Block 1
    if canPreChuckolator() then local x457D_5 = {5, 0x457D}; x457D_5 = locFlag(x457D_5); canrChucklehuck = canrChucklehuck + flip(x457D_5); sumrChucklehuck = sumrChucklehuck - x457D_5 end --Chucklehuck Woods Past Chuckleroot Block 2
    if canPreChuckolator() then local x457D_6 = {6, 0x457D}; x457D_6 = locFlag(x457D_6); canrChucklehuck = canrChucklehuck + flip(x457D_6); sumrChucklehuck = sumrChucklehuck - x457D_6 end --Chucklehuck Woods Past Chuckleroot Block 3
    if canPreChuckolator() then local x457D_7 = {7, 0x457D}; x457D_7 = locFlag(x457D_7); canrChucklehuck = canrChucklehuck + flip(x457D_7); sumrChucklehuck = sumrChucklehuck - x457D_7 end --Chucklehuck Woods Past Chuckleroot Block 4
    if canPreChuckolator() then local x457E_0 = {0, 0x457E}; x457E_0 = locFlag(x457E_0); canrChucklehuck = canrChucklehuck + flip(x457E_0); sumrChucklehuck = sumrChucklehuck - x457E_0 end --Chucklehuck Woods Past Chuckleroot Block 5
    if canPreChuckolator() then local x457E_1 = {1, 0x457E}; x457E_1 = locFlag(x457E_1); canrChucklehuck = canrChucklehuck + flip(x457E_1); sumrChucklehuck = sumrChucklehuck - x457E_1 end --Chucklehuck Woods Past Chuckleroot Block 6
    if canPreChuckolator() then local x457E_2 = {2, 0x457E}; x457E_2 = locFlag(x457E_2); canrChucklehuck = canrChucklehuck + flip(x457E_2); sumrChucklehuck = sumrChucklehuck - x457E_2 end --Chucklehuck Woods Past Chuckleroot Coin Block
    if has("BeanbeanBrooch") and has("Hammers1") then local x457A_4 = {4, 0x457A}; x457A_4 = locFlag(x457A_4); canrChucklehuck = canrChucklehuck + flip(x457A_4); sumrChucklehuck = sumrChucklehuck - x457A_4 end --Chucklehuck Woods Pipe 5 Room Coin Block
    if has("BeanbeanBrooch") and has("Hammers1") then local x457A_2 = {2, 0x457A}; x457A_2 = locFlag(x457A_2); canrChucklehuck = canrChucklehuck + flip(x457A_2); sumrChucklehuck = sumrChucklehuck - x457A_2 end --Chucklehuck Woods Pipe Room Block 1
    if has("BeanbeanBrooch") and has("Hammers1") then local x457A_3 = {3, 0x457A}; x457A_3 = locFlag(x457A_3); canrChucklehuck = canrChucklehuck + flip(x457A_3); sumrChucklehuck = sumrChucklehuck - x457A_3 end --Chucklehuck Woods Pipe Room Block 2
    if has("BeanbeanBrooch") and canDig() then local x457A_5 = {5, 0x457A}; x457A_5 = locFlag(x457A_5); canrChucklehuck = canrChucklehuck + flip(x457A_5); sumrChucklehuck = sumrChucklehuck - x457A_5 end --Chucklehuck Woods Pipe Room Digspot 1
    if has("BeanbeanBrooch") and canDig() then local x457A_6 = {6, 0x457A}; x457A_6 = locFlag(x457A_6); canrChucklehuck = canrChucklehuck + flip(x457A_6); sumrChucklehuck = sumrChucklehuck - x457A_6 end --Chucklehuck Woods Pipe Room Digspot 2
    if has("BeanbeanBrooch") then local x42FE_7 = {7, 0x42FE}; x42FE_7 = locFlag(x42FE_7); canrChucklehuck = canrChucklehuck + flip(x42FE_7); sumrChucklehuck = sumrChucklehuck - x42FE_7 end --Chucklehuck Woods Purple Chuckola Fruit
    if has("BeanbeanBrooch") and canMini() then local x4301_4 = {4, 0x4301}; x4301_4 = locFlag(x4301_4); canrChucklehuck = canrChucklehuck + flip(x4301_4); sumrChucklehuck = sumrChucklehuck - x4301_4 end --Chucklehuck Woods Red Chuckola Fruit
    if has("BeanbeanBrooch") and canDig() then local x4585_1 = {1, 0x4585}; x4585_1 = locFlag(x4585_1); canrChucklehuck = canrChucklehuck + flip(x4585_1); sumrChucklehuck = sumrChucklehuck - x4585_1 end --Chucklehuck Woods Room 1 Digspot
    if has("BeanbeanBrooch") then local x457A_0 = {0, 0x457A}; x457A_0 = locFlag(x457A_0); canrChucklehuck = canrChucklehuck + flip(x457A_0); sumrChucklehuck = sumrChucklehuck - x457A_0 end --Chucklehuck Woods Room 2 Block
    if has("BeanbeanBrooch") and canDig() then local x457A_1 = {1, 0x457A}; x457A_1 = locFlag(x457A_1); canrChucklehuck = canrChucklehuck + flip(x457A_1); sumrChucklehuck = sumrChucklehuck - x457A_1 end --Chucklehuck Woods Room 2 Digspot
    if has("BeanbeanBrooch") and canMini() then local x457A_7 = {7, 0x457A}; x457A_7 = locFlag(x457A_7); canrChucklehuck = canrChucklehuck + flip(x457A_7); sumrChucklehuck = sumrChucklehuck - x457A_7 end --Chucklehuck Woods Room 4 Block 1
    if has("BeanbeanBrooch") and canMini() then local x457B_0 = {0, 0x457B}; x457B_0 = locFlag(x457B_0); canrChucklehuck = canrChucklehuck + flip(x457B_0); sumrChucklehuck = sumrChucklehuck - x457B_0 end --Chucklehuck Woods Room 4 Block 2
    if has("BeanbeanBrooch") and canMini() then local x457B_1 = {1, 0x457B}; x457B_1 = locFlag(x457B_1); canrChucklehuck = canrChucklehuck + flip(x457B_1); sumrChucklehuck = sumrChucklehuck - x457B_1 end --Chucklehuck Woods Room 4 Block 3
    if has("BeanbeanBrooch") and has("Hammers1") then local x457B_2 = {2, 0x457B}; x457B_2 = locFlag(x457B_2); canrChucklehuck = canrChucklehuck + flip(x457B_2); sumrChucklehuck = sumrChucklehuck - x457B_2 end --Chucklehuck Woods Room 7 Block 1
    if has("BeanbeanBrooch") and has("Hammers1") then local x457B_4 = {4, 0x457B}; x457B_4 = locFlag(x457B_4); canrChucklehuck = canrChucklehuck + flip(x457B_4); sumrChucklehuck = sumrChucklehuck - x457B_4 end --Chucklehuck Woods Room 7 Block 2
    if has("BeanbeanBrooch") and has("Hammers1") then local x457B_3 = {3, 0x457B}; x457B_3 = locFlag(x457B_3); canrChucklehuck = canrChucklehuck + flip(x457B_3); sumrChucklehuck = sumrChucklehuck - x457B_3 end --Chucklehuck Woods Room 7 Coin Block
    if has("BeanbeanBrooch") and canDig() then local x457B_5 = {5, 0x457B}; x457B_5 = locFlag(x457B_5); canrChucklehuck = canrChucklehuck + flip(x457B_5); sumrChucklehuck = sumrChucklehuck - x457B_5 end --Chucklehuck Woods Room 7 Digspot 1
    if has("BeanbeanBrooch") and canDig() then local x457B_6 = {6, 0x457B}; x457B_6 = locFlag(x457B_6); canrChucklehuck = canrChucklehuck + flip(x457B_6); sumrChucklehuck = sumrChucklehuck - x457B_6 end --Chucklehuck Woods Room 7 Digspot 2
    if has("BeanbeanBrooch") and canDig() then local x457B_7 = {7, 0x457B}; x457B_7 = locFlag(x457B_7); canrChucklehuck = canrChucklehuck + flip(x457B_7); sumrChucklehuck = sumrChucklehuck - x457B_7 end --Chucklehuck Woods Room 8 Digspot
    if has("BeanbeanBrooch") then local x457D_1 = {1, 0x457D}; x457D_1 = locFlag(x457D_1); canrChucklehuck = canrChucklehuck + flip(x457D_1); sumrChucklehuck = sumrChucklehuck - x457D_1 end --Chucklehuck Woods Southwest of Chuckleroot Block
    if has("BeanbeanBrooch") then local x457D_0 = {0, 0x457D}; x457D_0 = locFlag(x457D_0); canrChucklehuck = canrChucklehuck + flip(x457D_0); sumrChucklehuck = sumrChucklehuck - x457D_0 end --Chucklehuck Woods West of Chuckleroot Block
    if has("BeanbeanBrooch") and canGoblets() then local x4302_2 = {2, 0x4302}; x4302_2 = locFlag(x4302_2); canrChucklehuck = canrChucklehuck + flip(x4302_2); sumrChucklehuck = sumrChucklehuck - x4302_2 end --Chucklehuck Woods White Chuckola Fruit
    if has("BeanbeanBrooch") and canDig() then local x457C_5 = {5, 0x457C}; x457C_5 = locFlag(x457C_5); canrChucklehuck = canrChucklehuck + flip(x457C_5); sumrChucklehuck = sumrChucklehuck - x457C_5 end --Chucklehuck Woods White Fruit Room Digspot 1
    if has("BeanbeanBrooch") and canGoblets() then local x457C_6 = {6, 0x457C}; x457C_6 = locFlag(x457C_6); canrChucklehuck = canrChucklehuck + flip(x457C_6); sumrChucklehuck = sumrChucklehuck - x457C_6 end --Chucklehuck Woods White Fruit Room Digspot 2
    if has("BeanbeanBrooch") and canGoblets() then local x457C_7 = {7, 0x457C}; x457C_7 = locFlag(x457C_7); canrChucklehuck = canrChucklehuck + flip(x457C_7); sumrChucklehuck = sumrChucklehuck - x457C_7 end --Chucklehuck Woods White Fruit Room Digspot 3
    if has("BeanbeanBrooch") and canDig() then local x457D_2 = {2, 0x457D}; x457D_2 = locFlag(x457D_2); canrChucklehuck = canrChucklehuck + flip(x457D_2); sumrChucklehuck = sumrChucklehuck - x457D_2 end --Chucklehuck Woods Wiggler room Digspot 1
    if has("BeanbeanBrooch") and canDig() then local x457D_3 = {3, 0x457D}; x457D_3 = locFlag(x457D_3); canrChucklehuck = canrChucklehuck + flip(x457D_3); sumrChucklehuck = sumrChucklehuck - x457D_3 end --Chucklehuck Woods Wiggler room Digspot 2
    if has("BeanbeanBrooch") and canDash() then local x457F_4 = {4, 0x457F}; x457F_4 = locFlag(x457F_4); canrChucklehuck = canrChucklehuck + flip(x457F_4); sumrChucklehuck = sumrChucklehuck - x457F_4 end --Chucklehuck Woods Winkle Area Cave Coin Block
    if has("BeanbeanBrooch") and canDash() then local x457F_3 = {3, 0x457F}; x457F_3 = locFlag(x457F_3); canrChucklehuck = canrChucklehuck + flip(x457F_3); sumrChucklehuck = sumrChucklehuck - x457F_3 end --Chucklehuck Woods Winkle Cave Block 1
    if has("BeanbeanBrooch") and canDash() then local x457F_2 = {2, 0x457F}; x457F_2 = locFlag(x457F_2); canrChucklehuck = canrChucklehuck + flip(x457F_2); sumrChucklehuck = sumrChucklehuck - x457F_2 end --Chucklehuck Woods Winkle Cave Block 2
    if canChuckolator() then local x4375_5 = {5, 0x4375}; x4375_5 = locFlag(x4375_5); canrCastleTown = canrCastleTown + flip(x4375_5); sumrCastleTown = sumrCastleTown - x4375_5 end --Coffee Shop Brew Reward 1
    if canChuckolator() then local x4375_6 = {6, 0x4375}; x4375_6 = locFlag(x4375_6); canrCastleTown = canrCastleTown + flip(x4375_6); sumrCastleTown = sumrCastleTown - x4375_6 end --Coffee Shop Brew Reward 2
    if canChuckolator() then local x4375_7 = {7, 0x4375}; x4375_7 = locFlag(x4375_7); canrCastleTown = canrCastleTown + flip(x4375_7); sumrCastleTown = sumrCastleTown - x4375_7 end --Coffee Shop Brew Reward 3
    if canChuckolator() then local x4376_0 = {0, 0x4376}; x4376_0 = locFlag(x4376_0); canrCastleTown = canrCastleTown + flip(x4376_0); sumrCastleTown = sumrCastleTown - x4376_0 end --Coffee Shop Brew Reward 4
    if canChuckolator() then local x4376_1 = {1, 0x4376}; x4376_1 = locFlag(x4376_1); canrCastleTown = canrCastleTown + flip(x4376_1); sumrCastleTown = sumrCastleTown - x4376_1 end --Coffee Shop Brew Reward 5
    if canChuckolator() then local x4376_2 = {2, 0x4376}; x4376_2 = locFlag(x4376_2); canrCastleTown = canrCastleTown + flip(x4376_2); sumrCastleTown = sumrCastleTown - x4376_2 end --Coffee Shop Brew Reward 6
    if canChuckolator() then local x4376_3 = {3, 0x4376}; x4376_3 = locFlag(x4376_3); canrCastleTown = canrCastleTown + flip(x4376_3); sumrCastleTown = sumrCastleTown - x4376_3 end --Coffee Shop Brew Reward 7
    if canChuckolator() then local x4372_0 = {0, 0x4372}; x4372_0 = locFlag(x4372_0); canrCastleTown = canrCastleTown + flip(x4372_0); sumrCastleTown = sumrCastleTown - x4372_0 end --Coffee Shop Chuckle Blend
    if canChuckolator() then local x4372_3 = {3, 0x4372}; x4372_3 = locFlag(x4372_3); canrCastleTown = canrCastleTown + flip(x4372_3); sumrCastleTown = sumrCastleTown - x4372_3 end --Coffee Shop Chuckoccino
    if canChuckolator() then local x4371_7 = {7, 0x4371}; x4371_7 = locFlag(x4371_7); canrCastleTown = canrCastleTown + flip(x4371_7); sumrCastleTown = sumrCastleTown - x4371_7 end --Coffee Shop Hoohoo Blend
    if canChuckolator() then local x4372_2 = {2, 0x4372}; x4372_2 = locFlag(x4372_2); canrCastleTown = canrCastleTown + flip(x4372_2); sumrCastleTown = sumrCastleTown - x4372_2 end --Coffee Shop Hoolumbian
    if canChuckolator() then local x4372_1 = {1, 0x4372}; x4372_1 = locFlag(x4372_1); canrCastleTown = canrCastleTown + flip(x4372_1); sumrCastleTown = sumrCastleTown - x4372_1 end --Coffee Shop Teehee Blend
    if canChuckolator() then local x4372_4 = {4, 0x4372}; x4372_4 = locFlag(x4372_4); canrCastleTown = canrCastleTown + flip(x4372_4); sumrCastleTown = sumrCastleTown - x4372_4 end --Coffee Shop Teeheespresso
    if canChuckolator() then local x4371_6 = {6, 0x4371}; x4371_6 = locFlag(x4371_6); canrCastleTown = canrCastleTown + flip(x4371_6); sumrCastleTown = sumrCastleTown - x4371_6 end --Coffee Shop Woohoo Blend
    if canFungitown() then local x4591_7 = {7, 0x4591}; x4591_7 = locFlag(x4591_7); canrTeehee = canrTeehee + flip(x4591_7); sumrTeehee = sumrTeehee - x4591_7 end --Fungitown Embassy Room Block
    if canFungitown() then local x4592_0 = {0, 0x4592}; x4592_0 = locFlag(x4592_0); canrTeehee = canrTeehee + flip(x4592_0); sumrTeehee = sumrTeehee - x4592_0 end --Fungitown Entrance Room Block
    if canGwarhar() and canDash() then local x458C_0 = {0, 0x458C}; x458C_0 = locFlag(x458C_0); canrGwarhar = canrGwarhar + flip(x458C_0); sumrGwarhar = sumrGwarhar - x458C_0 end --Gwarhar Lagoon First Underwater Area Room 1 Block
    if canGwarhar() and canDash() then local x458C_1 = {1, 0x458C}; x458C_1 = locFlag(x458C_1); canrGwarhar = canrGwarhar + flip(x458C_1); sumrGwarhar = sumrGwarhar - x458C_1 end --Gwarhar Lagoon First Underwater Area Room 2 Block 1
    if canGwarhar() and canDash() then local x458C_2 = {2, 0x458C}; x458C_2 = locFlag(x458C_2); canrGwarhar = canrGwarhar + flip(x458C_2); sumrGwarhar = sumrGwarhar - x458C_2 end --Gwarhar Lagoon First Underwater Area Room 2 Block 2
    if canGwarhar() and canDash() then local x458C_3 = {3, 0x458C}; x458C_3 = locFlag(x458C_3); canrGwarhar = canrGwarhar + flip(x458C_3); sumrGwarhar = sumrGwarhar - x458C_3 end --Gwarhar Lagoon First Underwater Area Room 2 Coin Block
    if canGwarhar() and canDig() then local x458A_4 = {4, 0x458A}; x458A_4 = locFlag(x458A_4); canrGwarhar = canrGwarhar + flip(x458A_4); sumrGwarhar = sumrGwarhar - x458A_4 end --Gwarhar Lagoon Massage Parlor Entrance Digspot
    if canGwarhar() and canDig() then local x458A_3 = {3, 0x458A}; x458A_3 = locFlag(x458A_3); canrGwarhar = canrGwarhar + flip(x458A_3); sumrGwarhar = sumrGwarhar - x458A_3 end --Gwarhar Lagoon Pipe Room Digspot
    if canGwarhar() and has("Firebrand") and has("Thunderhand") then local x4346_6 = {6, 0x4346}; x4346_6 = locFlag(x4346_6); canrGwarhar = canrGwarhar + flip(x4346_6); sumrGwarhar = sumrGwarhar - x4346_6 end --Gwarhar Lagoon Green Pearl Bean
    if canGwarhar() and has("Firebrand") and has("Thunderhand") then local x4346_7 = {7, 0x4346}; x4346_7 = locFlag(x4346_7); canrGwarhar = canrGwarhar + flip(x4346_7); sumrGwarhar = sumrGwarhar - x4346_7 end --Gwarhar Lagoon Red Pearl Bean
    if canGwarharDeep() then local x458B_4 = {4, 0x458B}; x458B_4 = locFlag(x458B_4); canrGwarhar = canrGwarhar + flip(x458B_4); sumrGwarhar = sumrGwarhar - x458B_4 end --Gwarhar Lagoon East of Stone Bridge Block
    if canGwarharDeep() and canDig() then local x458A_6 = {6, 0x458A}; x458A_6 = locFlag(x458A_6); canrGwarhar = canrGwarhar + flip(x458A_6); sumrGwarhar = sumrGwarhar - x458A_6 end --Gwarhar Lagoon Entrance to West Underwater Area Digspot
    if canGwarharDeep() and canDig() then local x458A_7 = {7, 0x458A}; x458A_7 = locFlag(x458A_7); canrGwarhar = canrGwarhar + flip(x458A_7); sumrGwarhar = sumrGwarhar - x458A_7 end --Gwarhar Lagoon Fire Dash Puzzle Room 1 Digspot 1
    if canGwarharDeep() and canDig() then local x458B_0 = {0, 0x458B}; x458B_0 = locFlag(x458B_0); canrGwarhar = canrGwarhar + flip(x458B_0); sumrGwarhar = sumrGwarhar - x458B_0 end --Gwarhar Lagoon Fire Dash Puzzle Room 1 Digspot 2
    if canGwarharDeep() and canDig() then local x458B_1 = {1, 0x458B}; x458B_1 = locFlag(x458B_1); canrGwarhar = canrGwarhar + flip(x458B_1); sumrGwarhar = sumrGwarhar - x458B_1 end --Gwarhar Lagoon Fire Dash Puzzle Room 2 Digspot
    if canGwarharDeep() and canDig() then local x458B_2 = {2, 0x458B}; x458B_2 = locFlag(x458B_2); canrGwarhar = canrGwarhar + flip(x458B_2); sumrGwarhar = sumrGwarhar - x458B_2 end --Gwarhar Lagoon Fire Dash Puzzle Room 3 Digspot 1
    if canGwarharDeep() and canDig() then local x458B_3 = {3, 0x458B}; x458B_3 = locFlag(x458B_3); canrGwarhar = canrGwarhar + flip(x458B_3); sumrGwarhar = sumrGwarhar - x458B_3 end --Gwarhar Lagoon Fire Dash Puzzle Room 3 Digspot 2
    if canGwarharDeep() and canDig() then local x458B_5 = {5, 0x458B}; x458B_5 = locFlag(x458B_5); canrGwarhar = canrGwarhar + flip(x458B_5); sumrGwarhar = sumrGwarhar - x458B_5 end --Gwarhar Lagoon North of Spangle Room Digspot
    if canGwarharDeep() and canDig() and canCrash() then local x458A_5 = {5, 0x458A}; x458A_5 = locFlag(x458A_5); canrGwarhar = canrGwarhar + flip(x458A_5); sumrGwarhar = sumrGwarhar - x458A_5 end --Gwarhar Lagoon Past Hermie Digspot
    if canGwarharDeep() then local x458D_2 = {2, 0x458D}; x458D_2 = locFlag(x458D_2); canrGwarhar = canrGwarhar + flip(x458D_2); sumrGwarhar = sumrGwarhar - x458D_2 end --Gwarhar Lagoon Second Underwater Area Room 1 Block
    if canGwarharDeep() and canDig() then local x458C_5 = {5, 0x458C}; x458C_5 = locFlag(x458C_5); canrGwarhar = canrGwarhar + flip(x458C_5); sumrGwarhar = sumrGwarhar - x458C_5 end --Gwarhar Lagoon Second Underwater Area Room 2 Digspot 1
    if canGwarharDeep() and canDig() then local x458C_6 = {6, 0x458C}; x458C_6 = locFlag(x458C_6); canrGwarhar = canrGwarhar + flip(x458C_6); sumrGwarhar = sumrGwarhar - x458C_6 end --Gwarhar Lagoon Second Underwater Area Room 2 Digspot 2
    if canGwarharDeep() then local x458C_7 = {7, 0x458C}; x458C_7 = locFlag(x458C_7); canrGwarhar = canrGwarhar + flip(x458C_7); sumrGwarhar = sumrGwarhar - x458C_7 end --Gwarhar Lagoon Second Underwater Area Room 3 Block 1
    if canGwarharDeep() then local x458D_0 = {0, 0x458D}; x458D_0 = locFlag(x458D_0); canrGwarhar = canrGwarhar + flip(x458D_0); sumrGwarhar = sumrGwarhar - x458D_0 end --Gwarhar Lagoon Second Underwater Area Room 3 Block 2
    if canGwarharDeep() then local x458D_1 = {1, 0x458D}; x458D_1 = locFlag(x458D_1); canrGwarhar = canrGwarhar + flip(x458D_1); sumrGwarhar = sumrGwarhar - x458D_1 end --Gwarhar Lagoon Second Underwater Area Room 3 Block 3
    if canGwarharDeep() and canDig() then local x458C_4 = {4, 0x458C}; x458C_4 = locFlag(x458C_4); canrGwarhar = canrGwarhar + flip(x458C_4); sumrGwarhar = sumrGwarhar - x458C_4 end --Gwarhar Lagoon Second Underwater Area Room 4 Digspot
    if canGwarharDeep() and has("Hammers3") then local x434A_6 = {6, 0x434A}; x434A_6 = locFlag(x434A_6); canrGwarhar = canrGwarhar + flip(x434A_6); sumrGwarhar = sumrGwarhar - x434A_6 end --Gwarhar Lagoon Spangle
    if canGwarharDeep() and canCrash() and has("Spangle") then local x434A_7 = {7, 0x434A}; x434A_7 = locFlag(x434A_7); canrGwarhar = canrGwarhar + flip(x434A_7); sumrGwarhar = sumrGwarhar - x434A_7 end --Gwarhar Lagoon Spangle Reward
    if canGwarharDeep() and has("Hammers3") then local x458B_7 = {7, 0x458B}; x458B_7 = locFlag(x458B_7); canrGwarhar = canrGwarhar + flip(x458B_7); sumrGwarhar = sumrGwarhar - x458B_7 end --Gwarhar Lagoon Spangle Room Block
    if canGwarharDeep() and canDig() then local x458B_6 = {6, 0x458B}; x458B_6 = locFlag(x458B_6); canrGwarhar = canrGwarhar + flip(x458B_6); sumrGwarhar = sumrGwarhar - x458B_6 end --Gwarhar Lagoon West of Spangle Room Digspot
    if canCrash() then local x434D_3 = {3, 0x434D}; x434D_3 = locFlag(x434D_3); canrOutskirts = canrOutskirts + flip(x434D_3); sumrOutskirts = sumrOutskirts - x434D_3 end --Harhall's Pants
    if canCrash() or has("Hammers2") then local x4570_7 = {7, 0x4570}; x4570_7 = locFlag(x4570_7); canrHoohoo = canrHoohoo + flip(x4570_7); sumrHoohoo = sumrHoohoo - x4570_7 end --Hoohoo Mountain Base Boo Statue Cave Coin Block 1
    if canCrash() or has("Hammers2") then local x4571_1 = {1, 0x4571}; x4571_1 = locFlag(x4571_1); canrHoohoo = canrHoohoo + flip(x4571_1); sumrHoohoo = sumrHoohoo - x4571_1 end --Hoohoo Mountain Base Boo Statue Cave Coin Block 2
    if canCrash() or has("Hammers2") then local x4571_2 = {2, 0x4571}; x4571_2 = locFlag(x4571_2); canrHoohoo = canrHoohoo + flip(x4571_2); sumrHoohoo = sumrHoohoo - x4571_2 end --Hoohoo Mountain Base Boo Statue Cave Coin Block 3
    local x456D_7 = {7, 0x456D}; x456D_7 = locFlag(x456D_7); canrHoohoo = canrHoohoo + flip(x456D_7); sumrHoohoo = sumrHoohoo - x456D_7 --Hoohoo Mountain Base Boostatue Room Block 1
    if canCrash() or has("Hammers2") then local x456E_0 = {0, 0x456E}; x456E_0 = locFlag(x456E_0); canrHoohoo = canrHoohoo + flip(x456E_0); sumrHoohoo = sumrHoohoo - x456E_0 end --Hoohoo Mountain Base Boostatue Room Block 2
    if canDig() then local x456E_1 = {1, 0x456E}; x456E_1 = locFlag(x456E_1); canrHoohoo = canrHoohoo + flip(x456E_1); sumrHoohoo = sumrHoohoo - x456E_1 end --Hoohoo Mountain Base Boostatue Room Digspot 1
    if canDig() then local x456E_2 = {2, 0x456E}; x456E_2 = locFlag(x456E_2); canrHoohoo = canrHoohoo + flip(x456E_2); sumrHoohoo = sumrHoohoo - x456E_2 end --Hoohoo Mountain Base Boostatue Room Digspot 2
    if has("Hammers3") and canDig() then local x456E_3 = {3, 0x456E}; x456E_3 = locFlag(x456E_3); canrHoohoo = canrHoohoo + flip(x456E_3); sumrHoohoo = sumrHoohoo - x456E_3 end --Hoohoo Mountain Base Boostatue Room Digspot 3 (Right Side)
    local x456D_2 = {2, 0x456D}; x456D_2 = locFlag(x456D_2); canrHoohoo = canrHoohoo + flip(x456D_2); sumrHoohoo = sumrHoohoo - x456D_2 --Hoohoo Mountain Base Bridge Room Block 1
    local x456D_3 = {3, 0x456D}; x456D_3 = locFlag(x456D_3); canrHoohoo = canrHoohoo + flip(x456D_3); sumrHoohoo = sumrHoohoo - x456D_3 --Hoohoo Mountain Base Bridge Room Block 2
    local x456D_4 = {4, 0x456D}; x456D_4 = locFlag(x456D_4); canrHoohoo = canrHoohoo + flip(x456D_4); sumrHoohoo = sumrHoohoo - x456D_4 --Hoohoo Mountain Base Bridge Room Block 3
    local x456D_5 = {5, 0x456D}; x456D_5 = locFlag(x456D_5); canrHoohoo = canrHoohoo + flip(x456D_5); sumrHoohoo = sumrHoohoo - x456D_5 --Hoohoo Mountain Base Bridge Room Block 4
    if canDig() then local x456D_6 = {6, 0x456D}; x456D_6 = locFlag(x456D_6); canrHoohoo = canrHoohoo + flip(x456D_6); sumrHoohoo = sumrHoohoo - x456D_6 end --Hoohoo Mountain Base Bridge Room Digspot
    local x456E_5 = {5, 0x456E}; x456E_5 = locFlag(x456E_5); canrHoohoo = canrHoohoo + flip(x456E_5); sumrHoohoo = sumrHoohoo - x456E_5 --Hoohoo Mountain Base Grassy Area Block 1
    local x456E_4 = {4, 0x456E}; x456E_4 = locFlag(x456E_4); canrHoohoo = canrHoohoo + flip(x456E_4); sumrHoohoo = sumrHoohoo - x456E_4 --Hoohoo Mountain Base Grassy Area Block 2
    if has("Hammers3") and canDig() then local x456E_6 = {6, 0x456E}; x456E_6 = locFlag(x456E_6); canrHoohoo = canrHoohoo + flip(x456E_6); sumrHoohoo = sumrHoohoo - x456E_6 end --Hoohoo Mountain Base Guffawha Ruins Entrance Digspot
    -- if canDig() then local x4571_4 = {4, 0x4571}; x4571_4 = locFlag(x4571_4); canrHoohoo = canrHoohoo + flip(x4571_4); sumrHoohoo = sumrHoohoo - x4571_4 end --Hoohoo Mountain Base Minecart Cave Digspot
    if has("Hammers3") then local x4373_4 = {4, 0x4373}; x4373_4 = locFlag(x4373_4); canrHoohoo = canrHoohoo + flip(x4373_4); sumrHoohoo = sumrHoohoo - x4373_4 end --Hoohoo Mountain Base Mole Near Teehee Valley
    local x456F_2 = {2, 0x456F}; x456F_2 = locFlag(x456F_2); canrHoohoo = canrHoohoo + flip(x456F_2); sumrHoohoo = sumrHoohoo - x456F_2 --Hoohoo Mountain Base Past Minecart Minigame Block 1
    local x456F_1 = {1, 0x456F}; x456F_1 = locFlag(x456F_1); canrHoohoo = canrHoohoo + flip(x456F_1); sumrHoohoo = sumrHoohoo - x456F_1 --Hoohoo Mountain Base Past Minecart Minigame Block 2
    if has("Hammers3") then local x456F_3 = {3, 0x456F}; x456F_3 = locFlag(x456F_3); canrHoohoo = canrHoohoo + flip(x456F_3); sumrHoohoo = sumrHoohoo - x456F_3 end --Hoohoo Mountain Base Past Ultra Hammer Rocks Block 1
    if has("Hammers3") then local x456F_4 = {4, 0x456F}; x456F_4 = locFlag(x456F_4); canrHoohoo = canrHoohoo + flip(x456F_4); sumrHoohoo = sumrHoohoo - x456F_4 end --Hoohoo Mountain Base Past Ultra Hammer Rocks Block 2
    if has("Hammers3") then local x456F_5 = {5, 0x456F}; x456F_5 = locFlag(x456F_5); canrHoohoo = canrHoohoo + flip(x456F_5); sumrHoohoo = sumrHoohoo - x456F_5 end --Hoohoo Mountain Base Past Ultra Hammer Rocks Block 3
    local x456C_1 = {1, 0x456C}; x456C_1 = locFlag(x456C_1); canrHoohoo = canrHoohoo + flip(x456C_1); sumrHoohoo = sumrHoohoo - x456C_1 --Hoohoo Mountain Base Room 1 Block
    if canDig() then local x456C_2 = {2, 0x456C}; x456C_2 = locFlag(x456C_2); canrHoohoo = canrHoohoo + flip(x456C_2); sumrHoohoo = sumrHoohoo - x456C_2 end --Hoohoo Mountain Base Room 1 Digspot
    if has("Hammers3") then local x456E_7 = {7, 0x456E}; x456E_7 = locFlag(x456E_7); canrHoohoo = canrHoohoo + flip(x456E_7); sumrHoohoo = sumrHoohoo - x456E_7 end --Hoohoo Mountain Base Teehee Valley Entrance Block
    if has("Hammers3") and canDig() then local x456F_0 = {0, 0x456F}; x456F_0 = locFlag(x456F_0); canrHoohoo = canrHoohoo + flip(x456F_0); sumrHoohoo = sumrHoohoo - x456F_0 end --Hoohoo Mountain Base Teehee Valley Entrance Digspot
    local x456A_7 = {7, 0x456A}; x456A_7 = locFlag(x456A_7); canrHoohoo = canrHoohoo + flip(x456A_7); sumrHoohoo = sumrHoohoo - x456A_7 --Hoohoo Mountain Before Hoohooros Block
    local x456B_0 = {0, 0x456B}; x456B_0 = locFlag(x456B_0); canrHoohoo = canrHoohoo + flip(x456B_0); sumrHoohoo = sumrHoohoo - x456B_0 --Hoohoo Mountain Before Hoohooros Coin Block
    if canDig() then local x456B_1 = {1, 0x456B}; x456B_1 = locFlag(x456B_1); canrHoohoo = canrHoohoo + flip(x456B_1); sumrHoohoo = sumrHoohoo - x456B_1 end --Hoohoo Mountain Before Hoohooros Digspot
    local x4569_5 = {5, 0x4569}; x4569_5 = locFlag(x4569_5); canrHoohoo = canrHoohoo + flip(x4569_5); sumrHoohoo = sumrHoohoo - x4569_5 --Hoohoo Mountain Below Summit Block 1
    local x4569_6 = {6, 0x4569}; x4569_6 = locFlag(x4569_6); canrHoohoo = canrHoohoo + flip(x4569_6); sumrHoohoo = sumrHoohoo - x4569_6 --Hoohoo Mountain Below Summit Block 2
    local x4569_7 = {7, 0x4569}; x4569_7 = locFlag(x4569_7); canrHoohoo = canrHoohoo + flip(x4569_7); sumrHoohoo = sumrHoohoo - x4569_7 --Hoohoo Mountain Below Summit Block 3
    if canDig() then local x4569_4 = {4, 0x4569}; x4569_4 = locFlag(x4569_4); canrHoohoo = canrHoohoo + flip(x4569_4); sumrHoohoo = sumrHoohoo - x4569_4 end --Hoohoo Mountain Below Summit Digspot
    local x4597_3 = {3, 0x4597}; x4597_3 = locFlag(x4597_3); canrHoohoo = canrHoohoo + flip(x4597_3); sumrHoohoo = sumrHoohoo - x4597_3 --Hoohoo Mountain Fountain Room 2 Block
    if canDig() then local x4597_4 = {4, 0x4597}; x4597_4 = locFlag(x4597_4); canrHoohoo = canrHoohoo + flip(x4597_4); sumrHoohoo = sumrHoohoo - x4597_4 end --Hoohoo Mountain Fountain Room 2 Digspot
    local x456B_2 = {2, 0x456B}; x456B_2 = locFlag(x456B_2); canrHoohoo = canrHoohoo + flip(x456B_2); sumrHoohoo = sumrHoohoo - x456B_2 --Hoohoo Mountain Fountain Room Block 1
    local x456B_3 = {3, 0x456B}; x456B_3 = locFlag(x456B_3); canrHoohoo = canrHoohoo + flip(x456B_3); sumrHoohoo = sumrHoohoo - x456B_3 --Hoohoo Mountain Fountain Room Block 2
    local x456A_3 = {3, 0x456A}; x456A_3 = locFlag(x456A_3); canrHoohoo = canrHoohoo + flip(x456A_3); sumrHoohoo = sumrHoohoo - x456A_3 --Hoohoo Mountain Hoohooros Room Block 1
    local x456A_4 = {4, 0x456A}; x456A_4 = locFlag(x456A_4); canrHoohoo = canrHoohoo + flip(x456A_4); sumrHoohoo = sumrHoohoo - x456A_4 --Hoohoo Mountain Hoohooros Room Block 2
    if canDig() then local x456A_5 = {5, 0x456A}; x456A_5 = locFlag(x456A_5); canrHoohoo = canrHoohoo + flip(x456A_5); sumrHoohoo = sumrHoohoo - x456A_5 end --Hoohoo Mountain Hoohooros Room Digspot 1
    if canDig() then local x456A_6 = {6, 0x456A}; x456A_6 = locFlag(x456A_6); canrHoohoo = canrHoohoo + flip(x456A_6); sumrHoohoo = sumrHoohoo - x456A_6 end --Hoohoo Mountain Hoohooros Room Digspot 2
    local x456A_0 = {0, 0x456A}; x456A_0 = locFlag(x456A_0); canrHoohoo = canrHoohoo + flip(x456A_0); sumrHoohoo = sumrHoohoo - x456A_0 --Hoohoo Mountain Past Hoohooros Block 1
    local x456A_2 = {2, 0x456A}; x456A_2 = locFlag(x456A_2); canrHoohoo = canrHoohoo + flip(x456A_2); sumrHoohoo = sumrHoohoo - x456A_2 --Hoohoo Mountain Past Hoohooros Block 2
    local x4597_6 = {6, 0x4597}; x4597_6 = locFlag(x4597_6); canrHoohoo = canrHoohoo + flip(x4597_6); sumrHoohoo = sumrHoohoo - x4597_6 --Hoohoo Mountain Past Hoohooros Connector Room Block
    if canDig() then local x4597_5 = {5, 0x4597}; x4597_5 = locFlag(x4597_5); canrHoohoo = canrHoohoo + flip(x4597_5); sumrHoohoo = sumrHoohoo - x4597_5 end --Hoohoo Mountain Past Hoohooros Connector Room Digspot 1
    if canDig() then local x4597_7 = {7, 0x4597}; x4597_7 = locFlag(x4597_7); canrHoohoo = canrHoohoo + flip(x4597_7); sumrHoohoo = sumrHoohoo - x4597_7 end --Hoohoo Mountain Past Hoohooros Connector Room Digspot 2
    if canDig() then local x456A_1 = {1, 0x456A}; x456A_1 = locFlag(x456A_1); canrHoohoo = canrHoohoo + flip(x456A_1); sumrHoohoo = sumrHoohoo - x456A_1 end --Hoohoo Mountain Past Hoohooros Digspot
    local x42F9_1 = {1, 0x42F9}; x42F9_1 = locFlag(x42F9_1); canrHoohoo = canrHoohoo + flip(x42F9_1); sumrHoohoo = sumrHoohoo - x42F9_1 --Hoohoo Mountain Peasley's Rose
    local x456B_6 = {6, 0x456B}; x456B_6 = locFlag(x456B_6); canrHoohoo = canrHoohoo + flip(x456B_6); sumrHoohoo = sumrHoohoo - x456B_6 --Hoohoo Mountain Room 1 Block 1
    local x456B_7 = {7, 0x456B}; x456B_7 = locFlag(x456B_7); canrHoohoo = canrHoohoo + flip(x456B_7); sumrHoohoo = sumrHoohoo - x456B_7 --Hoohoo Mountain Room 1 Block 2
    local x456C_0 = {0, 0x456C}; x456C_0 = locFlag(x456C_0); canrHoohoo = canrHoohoo + flip(x456C_0); sumrHoohoo = sumrHoohoo - x456C_0 --Hoohoo Mountain Room 1 Block 3
    if canDig() then local x456B_4 = {4, 0x456B}; x456B_4 = locFlag(x456B_4); canrHoohoo = canrHoohoo + flip(x456B_4); sumrHoohoo = sumrHoohoo - x456B_4 end --Hoohoo Mountain Room 2 Digspot 1
    if canDig() then local x456B_5 = {5, 0x456B}; x456B_5 = locFlag(x456B_5); canrHoohoo = canrHoohoo + flip(x456B_5); sumrHoohoo = sumrHoohoo - x456B_5 end --Hoohoo Mountain Room 2 Digspot 2
    if canDig() then local x4569_3 = {3, 0x4569}; x4569_3 = locFlag(x4569_3); canrHoohoo = canrHoohoo + flip(x4569_3); sumrHoohoo = sumrHoohoo - x4569_3 end --Hoohoo Mountain Summit Digspot
    local x456C_5 = {5, 0x456C}; x456C_5 = locFlag(x456C_5); canrHoohoo = canrHoohoo + flip(x456C_5); sumrHoohoo = sumrHoohoo - x456C_5 --Hoohoo Village Bridge Room Block 1
    local x456C_7 = {7, 0x456C}; x456C_7 = locFlag(x456C_7); canrHoohoo = canrHoohoo + flip(x456C_7); sumrHoohoo = sumrHoohoo - x456C_7 --Hoohoo Village Bridge Room Block 2
    local x456D_1 = {1, 0x456D}; x456D_1 = locFlag(x456D_1); canrHoohoo = canrHoohoo + flip(x456D_1); sumrHoohoo = sumrHoohoo - x456D_1 --Hoohoo Village Bridge Room Block 3
    local x456C_6 = {6, 0x456C}; x456C_6 = locFlag(x456C_6); canrHoohoo = canrHoohoo + flip(x456C_6); sumrHoohoo = sumrHoohoo - x456C_6 --Hoohoo Village Bridge Room Coin Block 1
    local x456D_0 = {0, 0x456D}; x456D_0 = locFlag(x456D_0); canrHoohoo = canrHoohoo + flip(x456D_0); sumrHoohoo = sumrHoohoo - x456D_0 --Hoohoo Village Bridge Room Coin Block 2
    local x456C_3 = {3, 0x456C}; x456C_3 = locFlag(x456C_3); canrHoohoo = canrHoohoo + flip(x456C_3); sumrHoohoo = sumrHoohoo - x456C_3 --Hoohoo Village Eastside Block
    if canDig() then local x456C_4 = {4, 0x456C}; x456C_4 = locFlag(x456C_4); canrHoohoo = canrHoohoo + flip(x456C_4); sumrHoohoo = sumrHoohoo - x456C_4 end --Hoohoo Village Eastside Digspot
    if has("Hammers1") then local x4566_2 = {2, 0x4566}; x4566_2 = locFlag(x4566_2); canrHoohoo = canrHoohoo + flip(x4566_2); sumrHoohoo = sumrHoohoo - x4566_2 end --Hoohoo Village Hammer House Block
    local x42F9_2 = {2, 0x42F9}; x42F9_2 = locFlag(x42F9_2); canrHoohoo = canrHoohoo + flip(x42F9_2); sumrHoohoo = sumrHoohoo - x42F9_2 --Hoohoo Village Hammers
    if canDash() then local x4373_5 = {5, 0x4373}; x4373_5 = locFlag(x4373_5); canrHoohoo = canrHoohoo + flip(x4373_5); sumrHoohoo = sumrHoohoo - x4373_5 end --Hoohoo Village Mole Behind Turtle
    local x4570_0 = {0, 0x4570}; x4570_0 = locFlag(x4570_0); canrHoohoo = canrHoohoo + flip(x4570_0); sumrHoohoo = sumrHoohoo - x4570_0 --Hoohoo Village North Cave Room 1 Block
    local x4570_1 = {1, 0x4570}; x4570_1 = locFlag(x4570_1); canrHoohoo = canrHoohoo + flip(x4570_1); sumrHoohoo = sumrHoohoo - x4570_1 --Hoohoo Village North Cave Room 1 Coin Block
    local x4570_2 = {2, 0x4570}; x4570_2 = locFlag(x4570_2); canrHoohoo = canrHoohoo + flip(x4570_2); sumrHoohoo = sumrHoohoo - x4570_2 --Hoohoo Village North Cave Room 2 Block
    if canDig() then local x4570_3 = {3, 0x4570}; x4570_3 = locFlag(x4570_3); canrHoohoo = canrHoohoo + flip(x4570_3); sumrHoohoo = sumrHoohoo - x4570_3 end --Hoohoo Village North Cave Room 2 Digspot
    local x4570_5 = {5, 0x4570}; x4570_5 = locFlag(x4570_5); canrHoohoo = canrHoohoo + flip(x4570_5); sumrHoohoo = sumrHoohoo - x4570_5 --Hoohoo Village South Cave Block
    local x4570_4 = {4, 0x4570}; x4570_4 = locFlag(x4570_4); canrHoohoo = canrHoohoo + flip(x4570_4); sumrHoohoo = sumrHoohoo - x4570_4 --Hoohoo Village South Cave Coin Block 1
    local x4570_6 = {6, 0x4570}; x4570_6 = locFlag(x4570_6); canrHoohoo = canrHoohoo + flip(x4570_6); sumrHoohoo = sumrHoohoo - x4570_6 --Hoohoo Village South Cave Coin Block 2
    if canCrash() or has("Hammers2") then local x4571_0 = {0, 0x4571}; x4571_0 = locFlag(x4571_0); canrHoohoo = canrHoohoo + flip(x4571_0); sumrHoohoo = sumrHoohoo - x4571_0 end --Hoohoo Village Super Hammer Cave Block
    if (canCrash() or has("Hammers2")) and canDig() then local x4571_3 = {3, 0x4571}; x4571_3 = locFlag(x4571_3); canrHoohoo = canrHoohoo + flip(x4571_3); sumrHoohoo = sumrHoohoo - x4571_3 end --Hoohoo Village Super Hammer Cave Digspot
    if canJokes() and canDig() then local x4592_6 = {6, 0x4592}; x4592_6 = locFlag(x4592_6); canrJokes = canrJokes + flip(x4592_6); sumrJokes = sumrJokes - x4592_6 end --Joke's End First Boiler Room Digspot 1
    if canJokes() and canDig() then local x4592_7 = {7, 0x4592}; x4592_7 = locFlag(x4592_7); canrJokes = canrJokes + flip(x4592_7); sumrJokes = sumrJokes - x4592_7 end --Joke's End First Boiler Room Digspot 2
    if canJokes() and canDig() then local x4592_2 = {2, 0x4592}; x4592_2 = locFlag(x4592_2); canrJokes = canrJokes + flip(x4592_2); sumrJokes = sumrJokes - x4592_2 end --Joke's End Pipe Digspot
    if canJokes() and canHardLogic() then local x4593_0 = {0, 0x4593}; x4593_0 = locFlag(x4593_0); canrJokes = canrJokes + flip(x4593_0); sumrJokes = sumrJokes - x4593_0 end --Joke's End Furnace Room 1 Block 1
    if canJokes() and canHardLogic() then local x4593_1 = {1, 0x4593}; x4593_1 = locFlag(x4593_1); canrJokes = canrJokes + flip(x4593_1); sumrJokes = sumrJokes - x4593_1 end --Joke's End Furnace Room 1 Block 2
    if canJokes() and canHardLogic() then local x4593_2 = {2, 0x4593}; x4593_2 = locFlag(x4593_2); canrJokes = canrJokes + flip(x4593_2); sumrJokes = sumrJokes - x4593_2 end --Joke's End Furnace Room 1 Block 3
    if canJokes() and canHardLogic() then local x4593_3 = {3, 0x4593}; x4593_3 = locFlag(x4593_3); canrJokes = canrJokes + flip(x4593_3); sumrJokes = sumrJokes - x4593_3 end --Joke's End Northeast of Boiler Room 1 Block
    if canJokes() and canHardLogic() then local x4593_5 = {5, 0x4593}; x4593_5 = locFlag(x4593_5); canrJokes = canrJokes + flip(x4593_5); sumrJokes = sumrJokes - x4593_5 end --Joke's End Northeast of Boiler Room 2 Block
    if canSurf() and canDig() then local x4592_3 = {3, 0x4592}; x4592_3 = locFlag(x4592_3); canrJokes = canrJokes + flip(x4592_3); sumrJokes = sumrJokes - x4592_3 end --Joke's End Staircase Digspot
    if canJokes() then local x4372_7 = {7, 0x4372}; x4372_7 = locFlag(x4372_7); canrJokes = canrJokes + flip(x4372_7); sumrJokes = sumrJokes - x4372_7 end --Joke's End Mole Reward 1
    if canJokes() then local x4372_7 = {7, 0x4372}; x4372_7 = locFlag(x4372_7); canrJokes = canrJokes + flip(x4372_7); sumrJokes = sumrJokes - x4372_7 end --Joke's End Mole Reward 2
    if canJokes() then local x4593_7 = {7, 0x4593}; x4593_7 = locFlag(x4593_7); canrJokes = canrJokes + flip(x4593_7); sumrJokes = sumrJokes - x4593_7 end --Joke's End Second Floor West Room Block 1
    if canJokes() then local x4594_0 = {0, 0x4594}; x4594_0 = locFlag(x4594_0); canrJokes = canrJokes + flip(x4594_0); sumrJokes = sumrJokes - x4594_0 end --Joke's End Second Floor West Room Block 2
    if canJokes() then local x4594_2 = {2, 0x4594}; x4594_2 = locFlag(x4594_2); canrJokes = canrJokes + flip(x4594_2); sumrJokes = sumrJokes - x4594_2 end --Joke's End Second Floor West Room Block 3
    if canJokes() then local x4594_3 = {3, 0x4594}; x4594_3 = locFlag(x4594_3); canrJokes = canrJokes + flip(x4594_3); sumrJokes = sumrJokes - x4594_3 end --Joke's End Second Floor West Room Block 4
    if canJokes() then local x4594_1 = {1, 0x4594}; x4594_1 = locFlag(x4594_1); canrJokes = canrJokes + flip(x4594_1); sumrJokes = sumrJokes - x4594_1 end --Joke's End Second Floor West Room Coin Block
    if canJokes() then local x4592_4 = {4, 0x4592}; x4592_4 = locFlag(x4592_4); canrJokes = canrJokes + flip(x4592_4); sumrJokes = sumrJokes - x4592_4 end --Joke's End West of First Boiler Room Block 1
    if canJokes() then local x4592_5 = {5, 0x4592}; x4592_5 = locFlag(x4592_5); canrJokes = canrJokes + flip(x4592_5); sumrJokes = sumrJokes - x4592_5 end --Joke's End West of First Boiler Room Block 2
    if canJokesDeep() then local x4593_6 = {6, 0x4593}; x4593_6 = locFlag(x4593_6); canrJokes = canrJokes + flip(x4593_6); sumrJokes = sumrJokes - x4593_6 end --Joke's End Northeast of Boiler Room 2 Digspot
    if canJokesDeep() then local x4593_4 = {4, 0x4593}; x4593_4 = locFlag(x4593_4); canrJokes = canrJokes + flip(x4593_4); sumrJokes = sumrJokes - x4593_4 end --Joke's End Northeast of Boiler Room 3 Digspot
    if canJokesDeep() then local x4598_0 = {0, 0x4598}; x4598_0 = locFlag(x4598_0); canrJokes = canrJokes + flip(x4598_0); sumrJokes = sumrJokes - x4598_0 end --Joke's End Before Jojora Room Block 1
    if canJokesDeep() then local x4598_1 = {1, 0x4598}; x4598_1 = locFlag(x4598_1); canrJokes = canrJokes + flip(x4598_1); sumrJokes = sumrJokes - x4598_1 end --Joke's End Before Jojora Room Block 2
    if canJokesDeep() then local x4598_2 = {2, 0x4598}; x4598_2 = locFlag(x4598_2); canrJokes = canrJokes + flip(x4598_2); sumrJokes = sumrJokes - x4598_2 end --Joke's End Before Jojora Room Digspot
    if canJokesDeep() then local x4594_5 = {5, 0x4594}; x4594_5 = locFlag(x4594_5); canrJokes = canrJokes + flip(x4594_5); sumrJokes = sumrJokes - x4594_5 end --Joke's End Final Split up Room Digspot
    if canJokesDeep() and has("RedPearlBean") then local x4598_3 = {3, 0x4598}; x4598_3 = locFlag(x4598_3); canrJokes = canrJokes + flip(x4598_3); sumrJokes = sumrJokes - x4598_3 end --Joke's End Jojora Room Digspot
    if canJokesDeep() then local x4596_1 = {1, 0x4596}; x4596_1 = locFlag(x4596_1); canrJokes = canrJokes + flip(x4596_1); sumrJokes = sumrJokes - x4596_1 end --Joke's End North of Bridge Room Coin Block
    if canJokesDeep() then local x4596_4 = {4, 0x4596}; x4596_4 = locFlag(x4596_4); canrJokes = canrJokes + flip(x4596_4); sumrJokes = sumrJokes - x4596_4 end --Joke's End North of Second Boiler Room Block 1
    if canJokesDeep() then local x4596_5 = {5, 0x4596}; x4596_5 = locFlag(x4596_5); canrJokes = canrJokes + flip(x4596_5); sumrJokes = sumrJokes - x4596_5 end --Joke's End North of Second Boiler Room Block 2
    if canJokesDeep() then local x4596_2 = {2, 0x4596}; x4596_2 = locFlag(x4596_2); canrJokes = canrJokes + flip(x4596_2); sumrJokes = sumrJokes - x4596_2 end --Joke's End Second Boiler Room Digspot 1
    if canJokesDeep() then local x4596_3 = {3, 0x4596}; x4596_3 = locFlag(x4596_3); canrJokes = canrJokes + flip(x4596_3); sumrJokes = sumrJokes - x4596_3 end --Joke's End Second Boiler Room Digspot 2
    if canJokesDeep() then local x4594_4 = {4, 0x4594}; x4594_4 = locFlag(x4594_4); canrJokes = canrJokes + flip(x4594_4); sumrJokes = sumrJokes - x4594_4 end --Joke's End Second Floor East Room Digspot
    if canJokesDeep() then local x4594_7 = {7, 0x4594}; x4594_7 = locFlag(x4594_7); canrJokes = canrJokes + flip(x4594_7); sumrJokes = sumrJokes - x4594_7 end --Joke's End Solo Luigi Room 1 Block
    if canJokesDeep() then local x4595_0 = {0, 0x4595}; x4595_0 = locFlag(x4595_0); canrJokes = canrJokes + flip(x4595_0); sumrJokes = sumrJokes - x4595_0 end --Joke's End Solo Luigi Room 1 Digspot
    if canJokesDeep() then local x4595_4 = {4, 0x4595}; x4595_4 = locFlag(x4595_4); canrJokes = canrJokes + flip(x4595_4); sumrJokes = sumrJokes - x4595_4 end --Joke's End Solo Luigi Room 2 Digspot
    if canJokesDeep() then local x4595_1 = {1, 0x4595}; x4595_1 = locFlag(x4595_1); canrJokes = canrJokes + flip(x4595_1); sumrJokes = sumrJokes - x4595_1 end --Joke's End Solo Mario Final Room Block 1
    if canJokesDeep() then local x4595_2 = {2, 0x4595}; x4595_2 = locFlag(x4595_2); canrJokes = canrJokes + flip(x4595_2); sumrJokes = sumrJokes - x4595_2 end --Joke's End Solo Mario Final Room Block 2
    if canJokesDeep() then local x4595_3 = {3, 0x4595}; x4595_3 = locFlag(x4595_3); canrJokes = canrJokes + flip(x4595_3); sumrJokes = sumrJokes - x4595_3 end --Joke's End Solo Mario Final Room Block 3
    if canJokesDeep() then local x4595_5 = {5, 0x4595}; x4595_5 = locFlag(x4595_5); canrJokes = canrJokes + flip(x4595_5); sumrJokes = sumrJokes - x4595_5 end --Joke's End Solo Mario Room 1 Digspot
    if canJokesDeep() then local x4595_6 = {6, 0x4595}; x4595_6 = locFlag(x4595_6); canrJokes = canrJokes + flip(x4595_6); sumrJokes = sumrJokes - x4595_6 end --Joke's End Solo Mario Room 2 Block 1
    if canJokesDeep() then local x4595_7 = {7, 0x4595}; x4595_7 = locFlag(x4595_7); canrJokes = canrJokes + flip(x4595_7); sumrJokes = sumrJokes - x4595_7 end --Joke's End Solo Mario Room 2 Block 2
    if canJokesDeep() then local x4596_0 = {0, 0x4596}; x4596_0 = locFlag(x4596_0); canrJokes = canrJokes + flip(x4596_0); sumrJokes = sumrJokes - x4596_0 end --Joke's End Solo Mario Room 2 Block 3
    if canJokesDeep() then local x4594_6 = {6, 0x4594}; x4594_6 = locFlag(x4594_6); canrJokes = canrJokes + flip(x4594_6); sumrJokes = sumrJokes - x4594_6 end --Joke's End South of Bridge Room Block
    if canSurf() then local x4373_0 = {0, 0x4373}; x4373_0 = locFlag(x4373_0); canrOasis = canrOasis + flip(x4373_0); sumrOasis = sumrOasis - x4373_0 end --North Ocean Whirlpool Mole
    if canOasis() then local x457F_6 = {6, 0x457F}; x457F_6 = locFlag(x457F_6); canrOasis = canrOasis + flip(x457F_6); sumrOasis = sumrOasis - x457F_6 end --Oho Oasis Fire Palace Block
    if canOasis() and canMini() then local x4345_3 = {3, 0x4345}; x4345_3 = locFlag(x4345_3); canrOasis = canrOasis + flip(x4345_3); sumrOasis = sumrOasis - x4345_3 end --Oho Oasis Firebrand
    if canOasis() and canDig() then local x4345_2 = {2, 0x4345}; x4345_2 = locFlag(x4345_2); canrOasis = canrOasis + flip(x4345_2); sumrOasis = sumrOasis - x4345_2 end --Oho Oasis Thunderhand
    if canOasis() and canDig() then local x457F_5 = {5, 0x457F}; x457F_5 = locFlag(x457F_5); canrOasis = canrOasis + flip(x457F_5); sumrOasis = sumrOasis - x457F_5 end --Oho Oasis West Digspot
    if canSurf() and canDig() then local x4581_1 = {1, 0x4581}; x4581_1 = locFlag(x4581_1); canrOasis = canrOasis + flip(x4581_1); sumrOasis = sumrOasis - x4581_1 end --Oho Ocean Fire Puzzle Room Digspot
    if canSurf() then local x4581_6 = {6, 0x4581}; x4581_6 = locFlag(x4581_6); canrOasis = canrOasis + flip(x4581_6); sumrOasis = sumrOasis - x4581_6 end --Oho Ocean North Whirlpool Block 1
    if canSurf() then local x4581_7 = {7, 0x4581}; x4581_7 = locFlag(x4581_7); canrOasis = canrOasis + flip(x4581_7); sumrOasis = sumrOasis - x4581_7 end --Oho Ocean North Whirlpool Block 2
    if canSurf() then local x4582_0 = {0, 0x4582}; x4582_0 = locFlag(x4582_0); canrOasis = canrOasis + flip(x4582_0); sumrOasis = sumrOasis - x4582_0 end --Oho Ocean North Whirlpool Block 3
    if canSurf() then local x4582_1 = {1, 0x4582}; x4582_1 = locFlag(x4582_1); canrOasis = canrOasis + flip(x4582_1); sumrOasis = sumrOasis - x4582_1 end --Oho Ocean North Whirlpool Block 4
    if canSurf() and canDig() then local x4582_2 = {2, 0x4582}; x4582_2 = locFlag(x4582_2); canrOasis = canrOasis + flip(x4582_2); sumrOasis = sumrOasis - x4582_2 end --Oho Ocean North Whirlpool Digspot 1
    if canSurf() and canDig() then local x4582_3 = {3, 0x4582}; x4582_3 = locFlag(x4582_3); canrOasis = canrOasis + flip(x4582_3); sumrOasis = sumrOasis - x4582_3 end --Oho Ocean North Whirlpool Digspot 2
    if canGwarhar() then local x4581_2 = {2, 0x4581}; x4581_2 = locFlag(x4581_2); canrOasis = canrOasis + flip(x4581_2); sumrOasis = sumrOasis - x4581_2 end --Oho Ocean South Room 1 Block
    if canGwarhar() and canDig() then local x4581_3 = {3, 0x4581}; x4581_3 = locFlag(x4581_3); canrOasis = canrOasis + flip(x4581_3); sumrOasis = sumrOasis - x4581_3 end --Oho Ocean South Room 2 Digspot
    if canSurf() and canDig() then local x4582_4 = {4, 0x4582}; x4582_4 = locFlag(x4582_4); canrOasis = canrOasis + flip(x4582_4); sumrOasis = sumrOasis - x4582_4 end --Oho Ocean South Whirlpool Digspot 1
    if canSurf() and canDig() then local x4582_5 = {5, 0x4582}; x4582_5 = locFlag(x4582_5); canrOasis = canrOasis + flip(x4582_5); sumrOasis = sumrOasis - x4582_5 end --Oho Ocean South Whirlpool Digspot 2
    if canSurf() and canDig() then local x4582_6 = {6, 0x4582}; x4582_6 = locFlag(x4582_6); canrOasis = canrOasis + flip(x4582_6); sumrOasis = sumrOasis - x4582_6 end --Oho Ocean South Whirlpool Digspot 3
    if canSurf() and canDig() then local x4582_7 = {7, 0x4582}; x4582_7 = locFlag(x4582_7); canrOasis = canrOasis + flip(x4582_7); sumrOasis = sumrOasis - x4582_7 end --Oho Ocean South Whirlpool Digspot 4
    if canSurf() and canDig() then local x4583_0 = {0, 0x4583}; x4583_0 = locFlag(x4583_0); canrOasis = canrOasis + flip(x4583_0); sumrOasis = sumrOasis - x4583_0 end --Oho Ocean South Whirlpool Digspot 5
    if canSurf() and canDig() then local x4583_1 = {1, 0x4583}; x4583_1 = locFlag(x4583_1); canrOasis = canrOasis + flip(x4583_1); sumrOasis = sumrOasis - x4583_1 end --Oho Ocean South Whirlpool Digspot 6
    if canSurf() and canDig() then local x4583_2 = {2, 0x4583}; x4583_2 = locFlag(x4583_2); canrOasis = canrOasis + flip(x4583_2); sumrOasis = sumrOasis - x4583_2 end --Oho Ocean South Whirlpool Room 2 Digspot
    if canOasis() and canDig() then local x4581_4 = {4, 0x4581}; x4581_4 = locFlag(x4581_4); canrOasis = canrOasis + flip(x4581_4); sumrOasis = sumrOasis - x4581_4 end --Oho Ocean Spike Room Digspot 1
    if canOasis() and canDig() then local x4581_5 = {5, 0x4581}; x4581_5 = locFlag(x4581_5); canrOasis = canrOasis + flip(x4581_5); sumrOasis = sumrOasis - x4581_5 end --Oho Ocean Spike Room Digspot 2
    local x4599_6 = {6, 0x4599}; x4599_6 = locFlag(x4599_6); canrOutskirts = canrOutskirts + flip(x4599_6); sumrOutskirts = sumrOutskirts - x4599_6 --Outside Woohoo Hooniversity Block
    local x4599_5 = {5, 0x4599}; x4599_5 = locFlag(x4599_5); canrOutskirts = canrOutskirts + flip(x4599_5); sumrOutskirts = sumrOutskirts - x4599_5 --Outside Woohoo Hooniversity Coin Block 1
    local x4599_7 = {7, 0x4599}; x4599_7 = locFlag(x4599_7); canrOutskirts = canrOutskirts + flip(x4599_7); sumrOutskirts = sumrOutskirts - x4599_7 --Outside Woohoo Hooniversity Coin Block 2
    local x459A_0 = {0, 0x459A}; x459A_0 = locFlag(x459A_0); canrOutskirts = canrOutskirts + flip(x459A_0); sumrOutskirts = sumrOutskirts - x459A_0 --Outside Woohoo Hooniversity Coin Block 3
    if canTeehee() then local x4374_3 = {3, 0x4374}; x4374_3 = locFlag(x4374_3); canrTeehee = canrTeehee + flip(x4374_3); sumrTeehee = sumrTeehee - x4374_3 end --S.S. Chuckola Membership Card
    if canTeehee() then local x4591_1 = {1, 0x4591}; x4591_1 = locFlag(x4591_1); canrTeehee = canrTeehee + flip(x4591_1); sumrTeehee = sumrTeehee - x4591_1 end --S.S. Chuckola Storage Room Block 1
    if canTeehee() then local x4591_4 = {4, 0x4591}; x4591_4 = locFlag(x4591_4); canrTeehee = canrTeehee + flip(x4591_4); sumrTeehee = sumrTeehee - x4591_4 end --S.S. Chuckola Storage Room Block 2
    if canTeehee() then local x4591_2 = {2, 0x4591}; x4591_2 = locFlag(x4591_2); canrTeehee = canrTeehee + flip(x4591_2); sumrTeehee = sumrTeehee - x4591_2 end --S.S. Chuckola Storage Room Coin Block 1
    if canTeehee() then local x4591_3 = {3, 0x4591}; x4591_3 = locFlag(x4591_3); canrTeehee = canrTeehee + flip(x4591_3); sumrTeehee = sumrTeehee - x4591_3 end --S.S. Chuckola Storage Room Coin Block 2
    if has("PeasleysRose") then local x4580_5 = {5, 0x4580}; x4580_5 = locFlag(x4580_5); canrCastleTown = canrCastleTown + flip(x4580_5); sumrCastleTown = sumrCastleTown - x4580_5 end --Sewers Prison Room Block 1
    if has("PeasleysRose") then local x4580_6 = {6, 0x4580}; x4580_6 = locFlag(x4580_6); canrCastleTown = canrCastleTown + flip(x4580_6); sumrCastleTown = sumrCastleTown - x4580_6 end --Sewers Prison Room Block 2
    if has("PeasleysRose") then local x4580_7 = {7, 0x4580}; x4580_7 = locFlag(x4580_7); canrCastleTown = canrCastleTown + flip(x4580_7); sumrCastleTown = sumrCastleTown - x4580_7 end --Sewers Prison Room Block 3
    if has("PeasleysRose") then local x4581_0 = {0, 0x4581}; x4581_0 = locFlag(x4581_0); canrCastleTown = canrCastleTown + flip(x4581_0); sumrCastleTown = sumrCastleTown - x4581_0 end --Sewers Prison Room Block 4
    if has("PeasleysRose") then local x4580_4 = {4, 0x4580}; x4580_4 = locFlag(x4580_4); canrCastleTown = canrCastleTown + flip(x4580_4); sumrCastleTown = sumrCastleTown - x4580_4 end --Sewers Prison Room Coin Block
    if has("PeasleysRose") then local x457F_7 = {7, 0x457F}; x457F_7 = locFlag(x457F_7); canrCastleTown = canrCastleTown + flip(x457F_7); sumrCastleTown = sumrCastleTown - x457F_7 end --Sewers Room 3 Block 1
    if has("PeasleysRose") then local x4580_0 = {0, 0x4580}; x4580_0 = locFlag(x4580_0); canrCastleTown = canrCastleTown + flip(x4580_0); sumrCastleTown = sumrCastleTown - x4580_0 end --Sewers Room 3 Block 2
    if has("PeasleysRose") then local x4580_1 = {1, 0x4580}; x4580_1 = locFlag(x4580_1); canrCastleTown = canrCastleTown + flip(x4580_1); sumrCastleTown = sumrCastleTown - x4580_1 end --Sewers Room 3 Block 3
    if has("PeasleysRose") and has("Hammers1") then local x4580_2 = {2, 0x4580}; x4580_2 = locFlag(x4580_2); canrCastleTown = canrCastleTown + flip(x4580_2); sumrCastleTown = sumrCastleTown - x4580_2 end --Sewers Room 5 Block 1
    if has("PeasleysRose") and has("Hammers1") then local x4580_3 = {3, 0x4580}; x4580_3 = locFlag(x4580_3); canrCastleTown = canrCastleTown + flip(x4580_3); sumrCastleTown = sumrCastleTown - x4580_3 end --Sewers Room 5 Block 2
    local x4564_0 = {0, 0x4564}; x4564_0 = locFlag(x4564_0); canrStardust = canrStardust + flip(x4564_0); sumrStardust = sumrStardust - x4564_0 --Stardust Fields Room 1 Block 1
    local x4564_1 = {1, 0x4564}; x4564_1 = locFlag(x4564_1); canrStardust = canrStardust + flip(x4564_1); sumrStardust = sumrStardust - x4564_1 --Stardust Fields Room 1 Block 2
    local x4564_2 = {2, 0x4564}; x4564_2 = locFlag(x4564_2); canrStardust = canrStardust + flip(x4564_2); sumrStardust = sumrStardust - x4564_2 --Stardust Fields Room 2 Block
    local x4564_3 = {3, 0x4564}; x4564_3 = locFlag(x4564_3); canrStardust = canrStardust + flip(x4564_3); sumrStardust = sumrStardust - x4564_3 --Stardust Fields Room 2 Coin Block 1
    local x4564_4 = {4, 0x4564}; x4564_4 = locFlag(x4564_4); canrStardust = canrStardust + flip(x4564_4); sumrStardust = sumrStardust - x4564_4 --Stardust Fields Room 2 Coin Block 2
    local x4564_5 = {5, 0x4564}; x4564_5 = locFlag(x4564_5); canrStardust = canrStardust + flip(x4564_5); sumrStardust = sumrStardust - x4564_5 --Stardust Fields Room 2 Coin Block 3
    local x4565_0 = {0, 0x4565}; x4565_0 = locFlag(x4565_0); canrStardust = canrStardust + flip(x4565_0); sumrStardust = sumrStardust - x4565_0 --Stardust Fields Room 3 Block
    local x4564_6 = {6, 0x4564}; x4564_6 = locFlag(x4564_6); canrStardust = canrStardust + flip(x4564_6); sumrStardust = sumrStardust - x4564_6 --Stardust Fields Room 3 Coin Block 1
    local x4564_7 = {7, 0x4564}; x4564_7 = locFlag(x4564_7); canrStardust = canrStardust + flip(x4564_7); sumrStardust = sumrStardust - x4564_7 --Stardust Fields Room 3 Coin Block 2
    local x4565_3 = {3, 0x4565}; x4565_3 = locFlag(x4565_3); canrStardust = canrStardust + flip(x4565_3); sumrStardust = sumrStardust - x4565_3 --Stardust Fields Room 4 Block 1
    local x4565_2 = {2, 0x4565}; x4565_2 = locFlag(x4565_2); canrStardust = canrStardust + flip(x4565_2); sumrStardust = sumrStardust - x4565_2 --Stardust Fields Room 4 Block 2
    local x4565_1 = {1, 0x4565}; x4565_1 = locFlag(x4565_1); canrStardust = canrStardust + flip(x4565_1); sumrStardust = sumrStardust - x4565_1 --Stardust Fields Room 4 Block 3
    local x4566_0 = {0, 0x4566}; x4566_0 = locFlag(x4566_0); canrStardust = canrStardust + flip(x4566_0); sumrStardust = sumrStardust - x4566_0 --Stardust Fields Room 5 Block
    local x4565_7 = {7, 0x4565}; x4565_7 = locFlag(x4565_7); canrStardust = canrStardust + flip(x4565_7); sumrStardust = sumrStardust - x4565_7 --Stardust Fields Room 5 Coin Block 1
    local x4566_1 = {1, 0x4566}; x4566_1 = locFlag(x4566_1); canrStardust = canrStardust + flip(x4566_1); sumrStardust = sumrStardust - x4566_1 --Stardust Fields Room 5 Coin Block 2
    local x4565_4 = {4, 0x4565}; x4565_4 = locFlag(x4565_4); canrStardust = canrStardust + flip(x4565_4); sumrStardust = sumrStardust - x4565_4 --Stardust Fields Room 7 Coin Block 1
    local x4565_5 = {5, 0x4565}; x4565_5 = locFlag(x4565_5); canrStardust = canrStardust + flip(x4565_5); sumrStardust = sumrStardust - x4565_5 --Stardust Fields Room 7 Coin Block 2
    if canSurf() then local x4375_1 = {1, 0x4375}; x4375_1 = locFlag(x4375_1); canrOasis = canrOasis + flip(x4375_1); sumrOasis = sumrOasis - x4375_1 end --Surf Minigame
    if canBirdo() then local x458F_1 = {1, 0x458F}; x458F_1 = locFlag(x458F_1); canrTeehee = canrTeehee + flip(x458F_1); sumrTeehee = sumrTeehee - x458F_1 end --Teehee Valley Before Birdo Digspot 1
    if canBirdo() then local x458F_2 = {2, 0x458F}; x458F_2 = locFlag(x458F_2); canrTeehee = canrTeehee + flip(x458F_2); sumrTeehee = sumrTeehee - x458F_2 end --Teehee Valley Before Birdo Digspot 2
    if canBirdo() then local x458F_3 = {3, 0x458F}; x458F_3 = locFlag(x458F_3); canrTeehee = canrTeehee + flip(x458F_3); sumrTeehee = sumrTeehee - x458F_3 end --Teehee Valley Before Birdo Digspot 3
    if canBirdo() then local x458F_4 = {4, 0x458F}; x458F_4 = locFlag(x458F_4); canrTeehee = canrTeehee + flip(x458F_4); sumrTeehee = sumrTeehee - x458F_4 end --Teehee Valley Before Birdo Digspot 4
    if canTeehee() and canDig() then local x4590_7 = {7, 0x4590}; x4590_7 = locFlag(x4590_7); canrTeehee = canrTeehee + flip(x4590_7); sumrTeehee = sumrTeehee - x4590_7 end --Teehee Valley Before Trunkle Digspot
    if has("Hammers3") and canDig() then local x4590_3 = {3, 0x4590}; x4590_3 = locFlag(x4590_3); canrTeehee = canrTeehee + flip(x4590_3); sumrTeehee = sumrTeehee - x4590_3 end --Teehee Valley Entrance To Hoohoo Mountain Digspot
    if has("Hammers3") then local x458F_5 = {5, 0x458F}; x458F_5 = locFlag(x458F_5); canrTeehee = canrTeehee + flip(x458F_5); sumrTeehee = sumrTeehee - x458F_5 end --Teehee Valley Past Ultra Hammer Rock Block 1
    if has("Hammers3") then local x458F_7 = {7, 0x458F}; x458F_7 = locFlag(x458F_7); canrTeehee = canrTeehee + flip(x458F_7); sumrTeehee = sumrTeehee - x458F_7 end --Teehee Valley Past Ultra Hammer Rock Block 2
    if has("Hammers3") and canDig() then local x4590_0 = {0, 0x4590}; x4590_0 = locFlag(x4590_0); canrTeehee = canrTeehee + flip(x4590_0); sumrTeehee = sumrTeehee - x4590_0 end --Teehee Valley Past Ultra Hammer Rock Digspot 1
    if canBirdo() then local x4590_1 = {1, 0x4590}; x4590_1 = locFlag(x4590_1); canrTeehee = canrTeehee + flip(x4590_1); sumrTeehee = sumrTeehee - x4590_1 end --Teehee Valley Past Ultra Hammer Rock Digspot 2 (Post-Birdo)
    if has("Hammers3") and canDig() then local x4590_2 = {2, 0x4590}; x4590_2 = locFlag(x4590_2); canrTeehee = canrTeehee + flip(x4590_2); sumrTeehee = sumrTeehee - x4590_2 end --Teehee Valley Past Ultra Hammer Rock Digspot 3
    if has("Hammers3") then local x458F_6 = {6, 0x458F}; x458F_6 = locFlag(x458F_6); canrTeehee = canrTeehee + flip(x458F_6); sumrTeehee = sumrTeehee - x458F_6 end --Teehee Valley Past Ultra Hammer Rocks Coin Block
    if canTeehee() and canDig() then local x458E_3 = {3, 0x458E}; x458E_3 = locFlag(x458E_3); canrTeehee = canrTeehee + flip(x458E_3); sumrTeehee = sumrTeehee - x458E_3 end --Teehee Valley Room 1 Digspot 1
    if canTeehee() and canDig() then local x458E_4 = {4, 0x458E}; x458E_4 = locFlag(x458E_4); canrTeehee = canrTeehee + flip(x458E_4); sumrTeehee = sumrTeehee - x458E_4 end --Teehee Valley Room 1 Digspot 2
    if canTeehee() and canDig() then local x458E_5 = {5, 0x458E}; x458E_5 = locFlag(x458E_5); canrTeehee = canrTeehee + flip(x458E_5); sumrTeehee = sumrTeehee - x458E_5 end --Teehee Valley Room 1 Digspot 3
    if canTeehee() and canDig() then local x458E_6 = {6, 0x458E}; x458E_6 = locFlag(x458E_6); canrTeehee = canrTeehee + flip(x458E_6); sumrTeehee = sumrTeehee - x458E_6 end --Teehee Valley Room 2 Digspot 1
    if canTeehee() and canDig() then local x458E_7 = {7, 0x458E}; x458E_7 = locFlag(x458E_7); canrTeehee = canrTeehee + flip(x458E_7); sumrTeehee = sumrTeehee - x458E_7 end --Teehee Valley Room 2 Digspot 2
    if canTeehee() and canDig() then local x458F_0 = {0, 0x458F}; x458F_0 = locFlag(x458F_0); canrTeehee = canrTeehee + flip(x458F_0); sumrTeehee = sumrTeehee - x458F_0 end --Teehee Valley Room 2 Digspot 3
    if canFungitown() and canDig() then local x4591_0 = {0, 0x4591}; x4591_0 = locFlag(x4591_0); canrTeehee = canrTeehee + flip(x4591_0); sumrTeehee = sumrTeehee - x4591_0 end --Teehee Valley Trunkle Room Digspot
    if has("Hammers3") then local x4590_6 = {6, 0x4590}; x4590_6 = locFlag(x4590_6); canrTeehee = canrTeehee + flip(x4590_6); sumrTeehee = sumrTeehee - x4590_6 end --Teehee Valley Upper Maze Room 1 Block
    if has("Hammers3") and canDig() then local x4590_4 = {4, 0x4590}; x4590_4 = locFlag(x4590_4); canrTeehee = canrTeehee + flip(x4590_4); sumrTeehee = sumrTeehee - x4590_4 end --Teehee Valley Upper Maze Room 2 Digspot 1
    if has("Hammers3") and canDig() then local x4590_5 = {5, 0x4590}; x4590_5 = locFlag(x4590_5); canrTeehee = canrTeehee + flip(x4590_5); sumrTeehee = sumrTeehee - x4590_5 end --Teehee Valley Upper Maze Room 2 Digspot 2
    if has("BeanbeanBrooch") and canDash() and has("WinkleCard") then local x457E_3 = {3, 0x457E}; x457E_3 = locFlag(x457E_3); canrChucklehuck = canrChucklehuck + flip(x457E_3); sumrChucklehuck = sumrChucklehuck - x457E_3 end --Winkle Area Beanstar Room Block
    if has("BeanbeanBrooch") and canDash() and canDig() then local x4596_6 = {6, 0x4596}; x4596_6 = locFlag(x4596_6); canrChucklehuck = canrChucklehuck + flip(x4596_6); sumrChucklehuck = sumrChucklehuck - x4596_6 end --Winkle Area Colloseum Digspot
    if has("BeanbeanBrooch") and canDash() and canDig() then local x457E_4 = {4, 0x457E}; x457E_4 = locFlag(x457E_4); canrChucklehuck = canrChucklehuck + flip(x457E_4); sumrChucklehuck = sumrChucklehuck - x457E_4 end --Winkle Area Digspot
    if has("BeanbeanBrooch") and canDash() then local x457E_5 = {5, 0x457E}; x457E_5 = locFlag(x457E_5); canrChucklehuck = canrChucklehuck + flip(x457E_5); sumrChucklehuck = sumrChucklehuck - x457E_5 end --Winkle Area Outside Colloseum Block
    if has("BeanbeanBrooch") and canDash() then local x430C_7 = {7, 0x430C}; x430C_7 = locFlag(x430C_7); canrChucklehuck = canrChucklehuck + flip(x430C_7); sumrChucklehuck = sumrChucklehuck - x430C_7 end --Winkle Area Winkle Card
    if canGoblets() then local x4584_4 = {4, 0x4584}; x4584_4 = locFlag(x4584_4); canrHooniversity = canrHooniversity + flip(x4584_4); sumrHooniversity = sumrHooniversity - x4584_4 end --Woohoo Hooniversity Barrel Puzzle Entrance Block 1
    if canGoblets() then local x4584_5 = {5, 0x4584}; x4584_5 = locFlag(x4584_5); canrHooniversity = canrHooniversity + flip(x4584_5); sumrHooniversity = sumrHooniversity - x4584_5 end --Woohoo Hooniversity Barrel Puzzle Entrance Block 2
    if canGoblets() then local x4584_6 = {6, 0x4584}; x4584_6 = locFlag(x4584_6); canrHooniversity = canrHooniversity + flip(x4584_6); sumrHooniversity = sumrHooniversity - x4584_6 end --Woohoo Hooniversity Barrel Puzzle Entrance Block 3
    if canGoblets() then local x4584_7 = {7, 0x4584}; x4584_7 = locFlag(x4584_7); canrHooniversity = canrHooniversity + flip(x4584_7); sumrHooniversity = sumrHooniversity - x4584_7 end --Woohoo Hooniversity Barrel Puzzle Entrance Block 4
    if canGoblets() then local x4584_3 = {3, 0x4584}; x4584_3 = locFlag(x4584_3); canrHooniversity = canrHooniversity + flip(x4584_3); sumrHooniversity = sumrHooniversity - x4584_3 end --Woohoo Hooniversity Barrel Puzzle Entrance Digspot 1
    if canGoblets() then local x4585_0 = {0, 0x4585}; x4585_0 = locFlag(x4585_0); canrHooniversity = canrHooniversity + flip(x4585_0); sumrHooniversity = sumrHooniversity - x4585_0 end --Woohoo Hooniversity Barrel Puzzle Entrance Digspot 2
    if canGoblets() then local x458D_5 = {5, 0x458D}; x458D_5 = locFlag(x458D_5); canrHooniversity = canrHooniversity + flip(x458D_5); sumrHooniversity = sumrHooniversity - x458D_5 end --Woohoo Hooniversity Basement Room 1 Digspot
    if canGoblets() then local x458D_6 = {6, 0x458D}; x458D_6 = locFlag(x458D_6); canrHooniversity = canrHooniversity + flip(x458D_6); sumrHooniversity = sumrHooniversity - x458D_6 end --Woohoo Hooniversity Basement Room 2 Digspot
    if canGoblets() then local x458D_7 = {7, 0x458D}; x458D_7 = locFlag(x458D_7); canrHooniversity = canrHooniversity + flip(x458D_7); sumrHooniversity = sumrHooniversity - x458D_7 end --Woohoo Hooniversity Basement Room 3 Block
    if canGoblets() then local x458E_0 = {0, 0x458E}; x458E_0 = locFlag(x458E_0); canrHooniversity = canrHooniversity + flip(x458E_0); sumrHooniversity = sumrHooniversity - x458E_0 end --Woohoo Hooniversity Basement Room 4 Block
    if canDig() then local x4586_4 = {4, 0x4586}; x4586_4 = locFlag(x4586_4); canrHooniversity = canrHooniversity + flip(x4586_4); sumrHooniversity = sumrHooniversity - x4586_4 end --Woohoo Hooniversity Entrance to Mini Mario Room 2 Digspot
    if canDig() then local x4586_2 = {2, 0x4586}; x4586_2 = locFlag(x4586_2); canrHooniversity = canrHooniversity + flip(x4586_2); sumrHooniversity = sumrHooniversity - x4586_2 end --Woohoo Hooniversity Entrance to Mini Mario Room Digspot 1
    if canDig() then local x4586_3 = {3, 0x4586}; x4586_3 = locFlag(x4586_3); canrHooniversity = canrHooniversity + flip(x4586_3); sumrHooniversity = sumrHooniversity - x4586_3 end --Woohoo Hooniversity Entrance to Mini Mario Room Digspot 2
    if canMini() then local x4586_5 = {5, 0x4586}; x4586_5 = locFlag(x4586_5); canrHooniversity = canrHooniversity + flip(x4586_5); sumrHooniversity = sumrHooniversity - x4586_5 end --Woohoo Hooniversity Mini Mario Puzzle Block
    if canDig() then local x4586_6 = {6, 0x4586}; x4586_6 = locFlag(x4586_6); canrHooniversity = canrHooniversity + flip(x4586_6); sumrHooniversity = sumrHooniversity - x4586_6 end --Woohoo Hooniversity Mini Mario Puzzle Digspot
    if canMini() then local x4586_7 = {7, 0x4586}; x4586_7 = locFlag(x4586_7); canrHooniversity = canrHooniversity + flip(x4586_7); sumrHooniversity = sumrHooniversity - x4586_7 end --Woohoo Hooniversity Mini Mario Puzzle Secret Area Block 1
    if canMini() then local x4587_0 = {0, 0x4587}; x4587_0 = locFlag(x4587_0); canrHooniversity = canrHooniversity + flip(x4587_0); sumrHooniversity = sumrHooniversity - x4587_0 end --Woohoo Hooniversity Mini Mario Puzzle Secret Area Block 2
    if canMini() then local x4587_1 = {1, 0x4587}; x4587_1 = locFlag(x4587_1); canrHooniversity = canrHooniversity + flip(x4587_1); sumrHooniversity = sumrHooniversity - x4587_1 end --Woohoo Hooniversity Mini Mario Puzzle Secret Area Block 3
    if canMini() then local x4587_2 = {2, 0x4587}; x4587_2 = locFlag(x4587_2); canrHooniversity = canrHooniversity + flip(x4587_2); sumrHooniversity = sumrHooniversity - x4587_2 end --Woohoo Hooniversity Mini Mario Puzzle Secret Area Block 4
    if canGoblets() then local x4587_6 = {6, 0x4587}; x4587_6 = locFlag(x4587_6); canrHooniversity = canrHooniversity + flip(x4587_6); sumrHooniversity = sumrHooniversity - x4587_6 end --Woohoo Hooniversity Past Cackletta Room 1 Block
    if canGoblets() then local x4587_7 = {7, 0x4587}; x4587_7 = locFlag(x4587_7); canrHooniversity = canrHooniversity + flip(x4587_7); sumrHooniversity = sumrHooniversity - x4587_7 end --Woohoo Hooniversity Past Cackletta Room 2 Block 1
    if canGoblets() then local x4588_0 = {0, 0x4588}; x4588_0 = locFlag(x4588_0); canrHooniversity = canrHooniversity + flip(x4588_0); sumrHooniversity = sumrHooniversity - x4588_0 end --Woohoo Hooniversity Past Cackletta Room 2 Block 2
    if canGoblets() then local x4588_1 = {1, 0x4588}; x4588_1 = locFlag(x4588_1); canrHooniversity = canrHooniversity + flip(x4588_1); sumrHooniversity = sumrHooniversity - x4588_1 end --Woohoo Hooniversity Past Cackletta Room 2 Digspot
    if canGoblets() then local x4587_3 = {3, 0x4587}; x4587_3 = locFlag(x4587_3); canrHooniversity = canrHooniversity + flip(x4587_3); sumrHooniversity = sumrHooniversity - x4587_3 end --Woohoo Hooniversity Past Sun Door Block 1
    if canGoblets() then local x4587_4 = {4, 0x4587}; x4587_4 = locFlag(x4587_4); canrHooniversity = canrHooniversity + flip(x4587_4); sumrHooniversity = sumrHooniversity - x4587_4 end --Woohoo Hooniversity Past Sun Door Block 2
    if canGoblets() then local x4587_5 = {5, 0x4587}; x4587_5 = locFlag(x4587_5); canrHooniversity = canrHooniversity + flip(x4587_5); sumrHooniversity = sumrHooniversity - x4587_5 end --Woohoo Hooniversity Past Sun Door Block 3
    if canGoblets() then local x458E_1 = {1, 0x458E}; x458E_1 = locFlag(x458E_1); canrHooniversity = canrHooniversity + flip(x458E_1); sumrHooniversity = sumrHooniversity - x458E_1 end --Woohoo Hooniversity Popple Room Digspot 1
    if canGoblets() then local x458E_2 = {2, 0x458E}; x458E_2 = locFlag(x458E_2); canrHooniversity = canrHooniversity + flip(x458E_2); sumrHooniversity = sumrHooniversity - x458E_2 end --Woohoo Hooniversity Popple Room Digspot 2
    if canGoblets() then local x459E_3 = {3, 0x459E}; x459E_3 = locFlag(x459E_3); canrHooniversity = canrHooniversity + flip(x459E_3); sumrHooniversity = sumrHooniversity - x459E_3 end --Woohoo Hooniversity Solo Mario Barrel Area Block 1
    if canGoblets() then local x459E_4 = {4, 0x459E}; x459E_4 = locFlag(x459E_4); canrHooniversity = canrHooniversity + flip(x459E_4); sumrHooniversity = sumrHooniversity - x459E_4 end --Woohoo Hooniversity Solo Mario Barrel Area Block 2
    if canGoblets() then local x459E_5 = {5, 0x459E}; x459E_5 = locFlag(x459E_5); canrHooniversity = canrHooniversity + flip(x459E_5); sumrHooniversity = sumrHooniversity - x459E_5 end --Woohoo Hooniversity Solo Mario Barrel Area Block 3
    if canGoblets() then local x4584_0 = {0, 0x4584}; x4584_0 = locFlag(x4584_0); canrHooniversity = canrHooniversity + flip(x4584_0); sumrHooniversity = sumrHooniversity - x4584_0 end --Woohoo Hooniversity South Of Star Room Block
    local x4583_3 = {3, 0x4583}; x4583_3 = locFlag(x4583_3); canrHooniversity = canrHooniversity + flip(x4583_3); sumrHooniversity = sumrHooniversity - x4583_3 --Woohoo Hooniversity Star Room Block 1
    local x4583_4 = {4, 0x4583}; x4583_4 = locFlag(x4583_4); canrHooniversity = canrHooniversity + flip(x4583_4); sumrHooniversity = sumrHooniversity - x4583_4 --Woohoo Hooniversity Star Room Block 2
    local x4583_5 = {5, 0x4583}; x4583_5 = locFlag(x4583_5); canrHooniversity = canrHooniversity + flip(x4583_5); sumrHooniversity = sumrHooniversity - x4583_5 --Woohoo Hooniversity Star Room Block 3
    local x4583_6 = {6, 0x4583}; x4583_6 = locFlag(x4583_6); canrHooniversity = canrHooniversity + flip(x4583_6); sumrHooniversity = sumrHooniversity - x4583_6 --Woohoo Hooniversity Sun Door Block 1
    local x4583_7 = {7, 0x4583}; x4583_7 = locFlag(x4583_7); canrHooniversity = canrHooniversity + flip(x4583_7); sumrHooniversity = sumrHooniversity - x4583_7 --Woohoo Hooniversity Sun Door Block 2
    if canDig() then local x4585_2 = {2, 0x4585}; x4585_2 = locFlag(x4585_2); canrHooniversity = canrHooniversity + flip(x4585_2); sumrHooniversity = sumrHooniversity - x4585_2 end --Woohoo Hooniversity West of Star Room 2 Digspot
    if canDig() then local x4585_3 = {3, 0x4585}; x4585_3 = locFlag(x4585_3); canrHooniversity = canrHooniversity + flip(x4585_3); sumrHooniversity = sumrHooniversity - x4585_3 end --Woohoo Hooniversity West of Star Room 3 Digspot
    local x4585_4 = {4, 0x4585}; x4585_4 = locFlag(x4585_4); canrHooniversity = canrHooniversity + flip(x4585_4); sumrHooniversity = sumrHooniversity - x4585_4 --Woohoo Hooniversity West of Star Room 4 Block 1
    local x4585_5 = {5, 0x4585}; x4585_5 = locFlag(x4585_5); canrHooniversity = canrHooniversity + flip(x4585_5); sumrHooniversity = sumrHooniversity - x4585_5 --Woohoo Hooniversity West of Star Room 4 Block 2
    local x4585_6 = {6, 0x4585}; x4585_6 = locFlag(x4585_6); canrHooniversity = canrHooniversity + flip(x4585_6); sumrHooniversity = sumrHooniversity - x4585_6 --Woohoo Hooniversity West of Star Room 4 Block 3
    if canDig() then local x4585_7 = {7, 0x4585}; x4585_7 = locFlag(x4585_7); canrHooniversity = canrHooniversity + flip(x4585_7); sumrHooniversity = sumrHooniversity - x4585_7 end --Woohoo Hooniversity West of Star Room 4 Digspot 1
    if canDig() then local x4586_0 = {0, 0x4586}; x4586_0 = locFlag(x4586_0); canrHooniversity = canrHooniversity + flip(x4586_0); sumrHooniversity = sumrHooniversity - x4586_0 end --Woohoo Hooniversity West of Star Room 4 Digspot 2
    if canDig() then local x4586_1 = {1, 0x4586}; x4586_1 = locFlag(x4586_1); canrHooniversity = canrHooniversity + flip(x4586_1); sumrHooniversity = sumrHooniversity - x4586_1 end --Woohoo Hooniversity West of Star Room 5 Digspot
    if canDig() then local x4584_1 = {1, 0x4584}; x4584_1 = locFlag(x4584_1); canrHooniversity = canrHooniversity + flip(x4584_1); sumrHooniversity = sumrHooniversity - x4584_1 end --Woohoo Hooniversity West of Star Room Digspot 1
    if canDig() then local x4584_2 = {2, 0x4584}; x4584_2 = locFlag(x4584_2); canrHooniversity = canrHooniversity + flip(x4584_2); sumrHooniversity = sumrHooniversity - x4584_2 end --Woohoo Hooniversity West of Star Room Digspot 2
    local x434C_4 = {4, 0x434C}; x434C_4 = locFlag(x434C_4) --Yoshi Theater Azure Yoshi
    local x434C_6 = {6, 0x434C}; x434C_6 = locFlag(x434C_6) --Yoshi Theater Blue Yoshi
    local x434C_3 = {3, 0x434C}; x434C_3 = locFlag(x434C_3) --Yoshi Theater Green Yoshi
    local x434C_7 = {7, 0x434C}; x434C_7 = locFlag(x434C_7) --Yoshi Theater Orange Yoshi
    local x434D_1 = {1, 0x434D}; x434D_1 = locFlag(x434D_1) --Yoshi Theater Purple Yoshi
    local x434D_0 = {0, 0x434D}; x434D_0 = locFlag(x434D_0) --Yoshi Theater Red Yoshi
    local x434C_5 = {5, 0x434C}; x434C_5 = locFlag(x434C_5) --Yoshi Theater Yellow Yoshi
        
	if canDash() then -- Yoshi Theatre check
		local doneBeanFruits = (x434C_3 + x434C_4 + x434C_5 + x434C_6 + x434C_7 + x434D_0 + x434D_1)
		local hasrBeanFruits = canBeanFruits()
		local remainingBeanFruits = 7 - doneBeanFruits
		if remainingBeanFruits < hasrBeanFruits then
			hasrBeanFruits = remainingBeanFruits
		end
		canrOutskirts = canrOutskirts + hasrBeanFruits; sumrOutskirts = sumrOutskirts - doneBeanFruits
	end
	
	if canrStardust > 5 then
		gui.text(1, 60, "YES: Stardust Fields")
	elseif canrStardust > 0 then
		gui.text(1, 60, "YES: Stardust Fields (" .. canrStardust .. " remaining)")
	else
		gui.text(1, 60, " NO: Stardust Fields")
	end
	
	if canrHoohoo > 5 then
		gui.text(1, 75, "YES: Hoohoo Mountain")
	elseif canrHoohoo > 0 then
		gui.text(1, 75, "YES: Hoohoo Mountain (" .. canrHoohoo .. " remaining)")
	else
		gui.text(1, 75, " NO: Hoohoo Mountain")
	end
	
	if canrOutskirts > 5 then
		gui.text(1, 90, "YES: Beanbean Outskirts")
	elseif canrOutskirts > 0 then
		gui.text(1, 90, "YES: Beanbean Outskirts (" .. canrOutskirts .. " remaining)")
	else
		gui.text(1, 90, " NO: Beanbean Outskirts")
	end
	
	if canrCastleTown > 5 then
		gui.text(1, 105, "YES: Beanbean Castle Town")
	elseif canrCastleTown > 0 then
		gui.text(1, 105, "YES: Beanbean Castle Town (" .. canrCastleTown .. " remaining)")
	else
		gui.text(1, 105, " NO: Beanbean Castle Town")
	end
	
	if canrChucklehuck > 5 then
		gui.text(1, 120, "YES: Chucklehuck Woods")
	elseif canrChucklehuck > 0 then
		gui.text(1, 120, "YES: Chucklehuck Woods (" .. canrChucklehuck .. " remaining)")
	else
		gui.text(1, 120, " NO: Chucklehuck Woods")
	end
	
	if canrHooniversity > 5 then
		gui.text(1, 135, "YES: Woohoo Hooniversity")
	elseif canrHooniversity > 0 then
		gui.text(1, 135, "YES: Woohoo Hooniversity (" .. canrHooniversity .. " remaining)")
	else
		gui.text(1, 135, " NO: Woohoo Hooniversity")
	end
	
	if canrOasis > 5 then
		gui.text(1, 150, "YES: Oho Oasis")
	elseif canrOasis > 0 then
		gui.text(1, 150, "YES: Oho Oasis (" .. canrOasis .. " remaining)")
	else
		gui.text(1, 150, " NO: Oho Oasis")
	end
	
	if canrTeehee > 5 then
		gui.text(1, 165, "YES: Teehee Valley")
	elseif canrTeehee > 0 then
		gui.text(1, 165, "YES: Teehee Valley (" .. canrTeehee .. " remaining)")
	else
		gui.text(1, 165, " NO: Teehee Valley")
	end
	
	if canrGwarhar > 5 then
		gui.text(1, 180, "YES: Gwarhar Lagoon")
	elseif canrGwarhar > 0 then
		gui.text(1, 180, "YES: Gwarhar Lagoon (" .. canrGwarhar .. " remaining)")
	else
		gui.text(1, 180, " NO: Gwarhar Lagoon")
	end
	
	if canrJokes > 5 then
		gui.text(1, 195, "YES: Joke's End")
	elseif canrJokes > 0 then
		gui.text(1, 195, "YES: Joke's End (" .. canrJokes .. " remaining)")
	else
		gui.text(1, 195, " NO: Joke's End")
	end
	
	
	
	
	--gui.text(1, 45, canrStardust .. " / " .. sumrStardust .. " - Stardust")
	--gui.text(1, 60, canrHoohoo .. " / " .. sumrHoohoo .. " - Mountain")
	--gui.text(1, 75, canrOutskirts .. " / " .. sumrOutskirts .. " - Outskirts")
	--gui.text(1, 90, canrCastleTown .. " / " .. sumrCastleTown .. " - Town")
	--gui.text(1, 105, canrChucklehuck .. " / " .. sumrChucklehuck .. " - Woods")
	--gui.text(1, 120, canrHooniversity .. " / " .. sumrHooniversity .. " - Hooniv.")
	--gui.text(1, 135, canrOasis .. " / " .. sumrOasis .. " - Oasis")
	--gui.text(1, 150, canrTeehee .. " / " .. sumrTeehee .. " - Teehee")
	--gui.text(1, 165, canrGwarhar .. " / " .. sumrGwarhar .. " - Gwarhar")
	--gui.text(1, 180, canrJokes .. " / " .. sumrJokes .. " - Joke's")
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

client.SetClientExtraPadding(220,0,0,0)

while true do
	--console.clear()
	local moduloRefresh = emu.framecount() % refreshRate
	if moduloRefresh == 0 then loadLocFlags() end
	emu.frameadvance();
end	