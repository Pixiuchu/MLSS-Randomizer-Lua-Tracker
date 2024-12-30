refreshItemFlags()

local small_window = 0
if item_tracker == false then small_window = 350 end
picture_box_locations = forms.pictureBox(itemtracker, 0, 0, 20+(55*boxWidth), 20+(55*boxHeight))
forms.setDefaultBackgroundColor(picture_box_locations, backgroundColor)
forms.drawBox(picture_box_locations,-5, -5, 25+(55*boxWidth), 25+(55*boxHeight), 0xFF00)

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

local numberTable = {
	[0] = "./location_names/Number0.png",
	[1] = "./location_names/Number1.png",
	[2] = "./location_names/Number2.png",
	[3] = "./location_names/Number3.png",
	[4] = "./location_names/Number4.png",
	[5] = "./location_names/Number5.png",
	[6] = "./location_names/Number6.png",
	[7] = "./location_names/Number7.png",
	[8] = "./location_names/Number8.png",
	[9] = "./location_names/Number9.png",
	[10] = "./location_names/Number0Red.png",
	[11] = "./location_names/Number1Red.png",
	[12] = "./location_names/Number2Red.png",
	[13] = "./location_names/Number3Red.png",
	[14] = "./location_names/Number4Red.png",
	[15] = "./location_names/Number5Red.png",
	[16] = "./location_names/Number6Red.png",
	[17] = "./location_names/Number7Red.png",
	[18] = "./location_names/Number8Red.png",
	[19] = "./location_names/Number9Red.png",
	[20] = "./location_names/NumberSlash.png",
	[21] = "./location_names/NumberMinus.png",
}


function drawNumbers(LocationAvailability, LocationsDone, YPos)
	if LocationsDone>0 then
		local canrLoc1 = math.floor(LocationAvailability/100 % 10)
		local canrLoc2 = math.floor(LocationAvailability/10 % 10)
		local canrLoc3 = math.floor(LocationAvailability/1 % 10)
		local sumrLoc1 = math.floor(LocationsDone/100 % 10)
		local sumrLoc2 = math.floor(LocationsDone/10 % 10)
		local sumrLoc3 = math.floor(LocationsDone/1 % 10)
		
		if show_available == true then
			if LocationAvailability >= 100 then
				forms.drawImage(picture_box_locations, numberTable[21], 291-20, YPos-small_window+14)
				forms.drawImage(picture_box_locations, numberTable[canrLoc1], 291, YPos-small_window+14)
				forms.drawImage(picture_box_locations, numberTable[canrLoc2], 291+14, YPos-small_window+14)
				forms.drawImage(picture_box_locations, numberTable[canrLoc3], 291+28, YPos-small_window+14)
				if show_available == true and show_remaining == true then
					forms.drawImage(picture_box_locations, numberTable[20], 291+45, YPos-small_window+12)
				end
			elseif LocationAvailability >= 10 then
				forms.drawImage(picture_box_locations, numberTable[21], 291-20, YPos-small_window+14)
				forms.drawImage(picture_box_locations, numberTable[canrLoc2], 291+14, YPos-small_window+14)
				forms.drawImage(picture_box_locations, numberTable[canrLoc3], 291+28, YPos-small_window+14)
				if show_available == true and show_remaining == true then
					forms.drawImage(picture_box_locations, numberTable[20], 291+45, YPos-small_window+12)
				end
			elseif LocationAvailability > 0 then
				if show_available == true and show_remaining == true then
					forms.drawImage(picture_box_locations, numberTable[20], 291+45, YPos-small_window+12)
				end
				forms.drawImage(picture_box_locations, numberTable[21], 291-20, YPos-small_window+14)
				forms.drawImage(picture_box_locations, numberTable[canrLoc3], 291+28, YPos-small_window+14)
			end
		end
		
		if show_remaining == true then
			if LocationAvailability == 0 then
				sumrLoc1 = sumrLoc1 + 10
				sumrLoc2 = sumrLoc2 + 10
				sumrLoc3 = sumrLoc3 + 10
			end
			
			if LocationsDone >= 100 then
				forms.drawImage(picture_box_locations, numberTable[sumrLoc1], 291+56, YPos-small_window+14)
				forms.drawImage(picture_box_locations, numberTable[sumrLoc2], 291+70, YPos-small_window+14)
				forms.drawImage(picture_box_locations, numberTable[sumrLoc3], 291+84, YPos-small_window+14)
			elseif LocationsDone >= 10 then
				forms.drawImage(picture_box_locations, numberTable[sumrLoc2], 291+70, YPos-small_window+14)
				forms.drawImage(picture_box_locations, numberTable[sumrLoc3], 291+84, YPos-small_window+14)
			else
				forms.drawImage(picture_box_locations, numberTable[sumrLoc3], 291+84, YPos-small_window+14)
			end
		end
			
	end
	
	--if canrStardust3 == 9 then
	--	forms.drawImage(picture_box_locations, "./location_names/Number9.png", 310, 400)
	--end

end


function drawLocation(LocationAvailability, LocationsDone, Location1, Location2, Location3, YPos)
	if LocationAvailability > 5 then
		forms.drawImage(picture_box_locations, Location1, -20, YPos-small_window)
	elseif LocationAvailability == 5 then
		forms.drawImage(picture_box_locations, Location1, -20, YPos-small_window)
	elseif LocationAvailability == 4 then
		forms.drawImage(picture_box_locations, Location1, -20, YPos-small_window)
	elseif LocationAvailability == 3 then
		forms.drawImage(picture_box_locations, Location1, -20, YPos-small_window)
	elseif LocationAvailability == 2 then
		forms.drawImage(picture_box_locations, Location1, -20, YPos-small_window)
	elseif LocationAvailability == 1 then
		forms.drawImage(picture_box_locations, Location1, -20, YPos-small_window)
	elseif LocationAvailability == 0 and LocationsDone > 0 then
		forms.drawImage(picture_box_locations, Location2, -20, YPos-small_window)
	elseif LocationAvailability > 0 then
		forms.drawImage(picture_box_locations, Location2, -20, YPos-small_window)
	elseif LocationsDone == 0 then
		forms.drawImage(picture_box_locations, Location3, -20, YPos-small_window)
	end	
end

function loadLocFlags()
	refreshItemFlags()
	
	--[[ Special flags:
		0x3040.0 -> 0x42F9.2
		Room ID: 0x04D
	]]--
	
	local canrStardust = 0
	local sumrStardust = 19
	local canrHoohoo = 0
	local sumrHoohoo = 75
	local canrCastleTown = 0
	local sumrCastleTown = 58
	local canrOutskirts = 0
	local sumrOutskirts = 102
	local canrChucklehuck = 0
	local sumrChucklehuck = 74
	local canrHooniversity = 0
	local sumrHooniversity = 47
	local canrOasis = 0
	local sumrOasis = 24
	local canrTeehee = 0
	local sumrTeehee = 29
	local canrGwarhar = 0
	local sumrGwarhar = 29
	local canrJokes = 0
	local sumrJokes = 42
	local canrBowser = 0
	local sumrBowser = 28
	local canrShop = 0
	local sumrShop = 73

	if optionCoins() == false then
		sumrStardust = sumrStardust - 9
		sumrHoohoo = sumrHoohoo - 9
		sumrCastleTown = sumrCastleTown - 2
		sumrOutskirts = sumrOutskirts - 6
		sumrChucklehuck = sumrChucklehuck - 12
		sumrTeehee = sumrTeehee - 3
		sumrGwarhar = sumrGwarhar - 1
		sumrJokes = sumrJokes - 2
	end
	
	if optionDigspots() == 1 then
		sumrHoohoo = sumrHoohoo - 6
		sumrOutskirts = sumrOutskirts - 20
		sumrChucklehuck = sumrChucklehuck - 6
		sumrHooniversity = sumrHooniversity - 5
		sumrOasis = sumrOasis - 5
		sumrTeehee = sumrTeehee - 6
		sumrGwarhar = sumrGwarhar - 5
		sumrJokes = sumrJokes - 5
	end
	
	if optionDigspots() == 0 then 
		sumrHoohoo = sumrHoohoo - 13
		sumrOutskirts = sumrOutskirts - 42
		sumrChucklehuck = sumrChucklehuck - 18
		sumrHooniversity = sumrHooniversity - 13
		sumrOasis = sumrOasis - 9
		sumrTeehee = sumrTeehee - 12
		sumrGwarhar = sumrGwarhar - 9
		sumrJokes = sumrJokes - 10
	end
	
	if optionMinecart() == false then
		sumrHoohoo = sumrHoohoo - 1
	elseif optionMinecart() == true and optionDigspots() ~= 2 then
		sumrHoohoo = sumrHoohoo - 1
	end
	
	if optionSurfing() == false then
		sumrOasis = sumrOasis - 1
	end
	
	if optionHarhall() == false then
		sumrOutskirts = sumrOutskirts - 1
	end
	
	if optionBowser() == false then
		sumrBowser = sumrBowser - 28
	elseif optionDigspots() == 0 then
		sumrBowser = sumrBowser - 5
	end
	
	
	
	-- Special flag for room 0x04D
	if readRam("currentRoom") == 0x04D then 
		x3040_0 = {0, 0x3040}; x3040_0 = locFlag(x3040_0); -- Check if Peasley's Rose is done
		sumrHoohoo = sumrHoohoo + x3040_0
		canrHoohoo = canrHoohoo + x3040_0
	end
	
	
    x4302_2 = {2, 0x4302}; x4302_2 = locFlag(x4302_2); if has("BeanbeanBrooch") and canGoblets() then canrChucklehuck = canrChucklehuck + flip(x4302_2) end; sumrChucklehuck = sumrChucklehuck - x4302_2 --Chucklehuck Woods White Chuckola Fruit
    x4301_4 = {4, 0x4301}; x4301_4 = locFlag(x4301_4); if has("BeanbeanBrooch") and canMini() then canrChucklehuck = canrChucklehuck + flip(x4301_4) end; sumrChucklehuck = sumrChucklehuck - x4301_4 --Chucklehuck Woods Red Chuckola Fruit
    x42FE_7 = {7, 0x42FE}; x42FE_7 = locFlag(x42FE_7); if has("BeanbeanBrooch") then canrChucklehuck = canrChucklehuck + flip(x42FE_7) end; sumrChucklehuck = sumrChucklehuck - x42FE_7 --Chucklehuck Woods Purple Chuckola Fruit
	
	--console.clear()
	-- Special flags for room 0x095 (Chuckleroot)
	if readRam("currentRoom") == 0x095 then 
		x30A1_0 = {0, 0x30A1}; x30A1_0 = locFlag(x30A1_0); -- Check if White Chuckola Fruit is done; needs logic canGoblets()!
		x30A1_1 = {1, 0x30A1}; x30A1_1 = locFlag(x30A1_1); -- Check if Red Chuckola Fruit is done; needs logic canMini()!
		x30A1_2 = {2, 0x30A1}; x30A1_2 = locFlag(x30A1_2); -- Check if Purple Chuckola Fruit is done
		x30A2_0 = {0, 0x30A2}; x30A2_0 = locFlag(x30A2_0); -- Check if White Chuckola Fruit has been obtained; needs logic canGoblets()!
		x30A2_1 = {1, 0x30A2}; x30A2_1 = locFlag(x30A2_1); -- Check if Red Chuckola Fruit has been obtained; needs logic canMini()!
		x30A2_2 = {2, 0x30A2}; x30A2_2 = locFlag(x30A2_2); -- Check if Purple Chuckola Fruit has been obtained
		
		--[[
		x30A1 -> sets to 1 (fruit or      location)
		x30A2 -> sets to 1 (fruit and not location)		
		]]
		local sumFruit = 0
		local whiteFruit = 0
		local redFruit = 0
		local purpleFruit = 0
		
		
		
		if not has("WhiteChuckolaFruit") and x30A1_0 == 1 then
		elseif has("WhiteChuckolaFruit") and x30A1_0 == 1 and x30A2_0 == 0 then
		else whiteFruit = whiteFruit + 1 end
		
		if not has("RedChuckolaFruit") and x30A1_1 == 1 then 
		elseif has("RedChuckolaFruit") and x30A1_1 == 1 and x30A2_1 == 0 then 
		else redFruit = redFruit + 1 end
		
		if not has("PurpleChuckolaFruit") and x30A1_2 == 1 then 
		elseif has("PurpleChuckolaFruit") and x30A1_2 == 1 and x30A2_2 == 0 then 
		else purpleFruit = purpleFruit + 1 end
		local sumFruits = whiteFruit + redFruit + purpleFruit
		--print(sumFruits)
		--print("iuhoiuh : " .. purpleFruit)
		local sumItemFruits = 0
		if has("WhiteChuckolaFruit") then sumItemFruits = sumItemFruits + 1 end
		if has("RedChuckolaFruit") then sumItemFruits = sumItemFruits + 1 end
		if has("PurpleChuckolaFruit") then sumItemFruits = sumItemFruits + 1 end
		
		
		
		
		sumrChucklehuck = sumrChucklehuck - (3 - sumFruits) + sumItemFruits
		
		--print("Red: " .. redFruit)
		--print("White: " .. whiteFruit)
		--print("Purple: " .. purpleFruit)
		if has("RedChuckolaFruit") == true and redFruit == 1 and canMini() == false then redFruit = 0 
		elseif has("RedChuckolaFruit") == false and redFruit == 1 and canMini() == true then redFruit = 0
		elseif has("RedChuckolaFruit") == false and redFruit == 1 and canMini() == false then redFruit = 0 end
		
		if has("WhiteChuckolaFruit") == true and whiteFruit == 1 and canGoblets() == false then whiteFruit = 0 
		elseif has("WhiteChuckolaFruit") == false and whiteFruit == 1 and canGoblets() == true then whiteFruit = 0
		elseif has("WhiteChuckolaFruit") == false and whiteFruit == 1 and canGoblets() == false then whiteFruit = 0 end
		
		if has("PurpleChuckolaFruit") == false and purpleFruit == 0 then purpleFruit = -1 
		elseif has("PurpleChuckolaFruit") == false and purpleFruit == 1 then purpleFruit = 0 end
		--print("White: " .. whiteFruit)
		--print("Red: " .. redFruit)
		--print("Purple: " .. purpleFruit)
		
		
		sumFruits = whiteFruit + redFruit + purpleFruit
		--print("Can checks: " .. canrChucklehuck)		
		--print("Sum fruits: " .. sumFruits)		
		canrChucklehuck = canrChucklehuck + sumFruits
		--print("Can checks: " .. canrChucklehuck)
	end

		--print("")
		--print("x30A1_0:" .. x30A1_0)
		--print("x30A1_1:" .. x30A1_1)
		--print("x30A1_2:" .. x30A1_2)
		--print("sum A1 :" .. sumA1)
		--print("")
		--print("x30A2_0:" .. x30A2_0)
		--print("x30A2_1:" .. x30A2_1)
		--print("x30A2_2:" .. x30A2_2)
		--print("sum A2 :" .. sumA2)
		--print("")
		--print(emu.framecount() % 1000)
	
	-- Special flags for room 0x09E (Winkle Area)
	if readRam("currentRoom") == 0x09E then 
		x3014_7 = {7, 0x3014}; x3014_7 = locFlag(x3014_7); -- Check if White Chuckola Fruit is done
		sumrChucklehuck = sumrChucklehuck + x3014_7
		canrChucklehuck = canrChucklehuck + x3014_7
	end
	
	
    if optionDigspots() >= 1 then x4589_1 = {1, 0x4589}; x4589_1 = locFlag(x4589_1); if canThunderhand() and canDig() then canrOutskirts = canrOutskirts + flip(x4589_1) end; sumrOutskirts = sumrOutskirts - x4589_1 end --Airport Center Digspot 1
    if optionDigspots() >= 1 then x4589_2 = {2, 0x4589}; x4589_2 = locFlag(x4589_2); if canThunderhand() and canDig() then canrOutskirts = canrOutskirts + flip(x4589_2) end; sumrOutskirts = sumrOutskirts - x4589_2 end --Airport Center Digspot 2
    if optionDigspots() >= 1 then x4589_3 = {3, 0x4589}; x4589_3 = locFlag(x4589_3); if canThunderhand() and canDig() then canrOutskirts = canrOutskirts + flip(x4589_3) end; sumrOutskirts = sumrOutskirts - x4589_3 end --Airport Center Digspot 3
    if optionDigspots() >= 1 then x4589_4 = {4, 0x4589}; x4589_4 = locFlag(x4589_4); if canThunderhand() and canDig() then canrOutskirts = canrOutskirts + flip(x4589_4) end; sumrOutskirts = sumrOutskirts - x4589_4 end --Airport Center Digspot 4
    if optionDigspots() == 2 then x4589_5 = {5, 0x4589}; x4589_5 = locFlag(x4589_5); if canThunderhand() and canDig() then canrOutskirts = canrOutskirts + flip(x4589_5) end; sumrOutskirts = sumrOutskirts - x4589_5 end --Airport Center Digspot 5
    if optionDigspots() >= 1 then x4589_6 = {6, 0x4589}; x4589_6 = locFlag(x4589_6); if canThunderhand() and canDig() then canrOutskirts = canrOutskirts + flip(x4589_6) end; sumrOutskirts = sumrOutskirts - x4589_6 end --Airport Eastside Digspot 1
    if optionDigspots() >= 1 then x4589_7 = {7, 0x4589}; x4589_7 = locFlag(x4589_7); if canThunderhand() and canDig() then canrOutskirts = canrOutskirts + flip(x4589_7) end; sumrOutskirts = sumrOutskirts - x4589_7 end --Airport Eastside Digspot 2
    if optionDigspots() >= 1 then x458A_0 = {0, 0x458A}; x458A_0 = locFlag(x458A_0); if canThunderhand() and canDig() then canrOutskirts = canrOutskirts + flip(x458A_0) end; sumrOutskirts = sumrOutskirts - x458A_0 end --Airport Eastside Digspot 3
    if optionDigspots() >= 1 then x458A_1 = {1, 0x458A}; x458A_1 = locFlag(x458A_1); if canThunderhand() and canDig() then canrOutskirts = canrOutskirts + flip(x458A_1) end; sumrOutskirts = sumrOutskirts - x458A_1 end --Airport Eastside Digspot 4
    if optionDigspots() == 2 then x458A_2 = {2, 0x458A}; x458A_2 = locFlag(x458A_2); if canThunderhand() and canDig() then canrOutskirts = canrOutskirts + flip(x458A_2) end; sumrOutskirts = sumrOutskirts - x458A_2 end --Airport Eastside Digspot 5
    if optionDigspots() == 2 then x4588_2 = {2, 0x4588}; x4588_2 = locFlag(x4588_2); if canThunderhand() and canDig() then canrOutskirts = canrOutskirts + flip(x4588_2) end; sumrOutskirts = sumrOutskirts - x4588_2 end --Airport Entrance Digspot
    if optionDigspots() == 2 then x4588_3 = {3, 0x4588}; x4588_3 = locFlag(x4588_3); if canThunderhand() and canDig() then canrOutskirts = canrOutskirts + flip(x4588_3) end; sumrOutskirts = sumrOutskirts - x4588_3 end --Airport Lobby Digspot
    if optionDigspots() >= 1 then x4588_4 = {4, 0x4588}; x4588_4 = locFlag(x4588_4); if canThunderhand() and canDig() then canrOutskirts = canrOutskirts + flip(x4588_4) end; sumrOutskirts = sumrOutskirts - x4588_4 end --Airport Westside Digspot 1
    if optionDigspots() >= 1 then x4588_5 = {5, 0x4588}; x4588_5 = locFlag(x4588_5); if canThunderhand() and canDig() then canrOutskirts = canrOutskirts + flip(x4588_5) end; sumrOutskirts = sumrOutskirts - x4588_5 end --Airport Westside Digspot 2
    if optionDigspots() >= 1 then x4588_6 = {6, 0x4588}; x4588_6 = locFlag(x4588_6); if canThunderhand() and canDig() then canrOutskirts = canrOutskirts + flip(x4588_6) end; sumrOutskirts = sumrOutskirts - x4588_6 end --Airport Westside Digspot 3
    if optionDigspots() >= 1 then x4588_7 = {7, 0x4588}; x4588_7 = locFlag(x4588_7); if canThunderhand() and canDig() then canrOutskirts = canrOutskirts + flip(x4588_7) end; sumrOutskirts = sumrOutskirts - x4588_7 end --Airport Westside Digspot 4
    if optionDigspots() == 2 then x4589_0 = {0, 0x4589}; x4589_0 = locFlag(x4589_0); if canThunderhand() and canDig() then canrOutskirts = canrOutskirts + flip(x4589_0) end; sumrOutskirts = sumrOutskirts - x4589_0 end --Airport Westside Digspot 5
    x4300_6 = {6, 0x4300}; x4300_6 = locFlag(x4300_6); if has("PeasleysRose") then canrCastleTown = canrCastleTown + flip(x4300_6) end; sumrCastleTown = sumrCastleTown - x4300_6 --Beanbean Castle Beanbean Brooch
    x433D_3 = {3, 0x433D}; x433D_3 = locFlag(x433D_3); if canBeanstar() then canrCastleTown = canrCastleTown + flip(x433D_3) end; sumrCastleTown = sumrCastleTown - x433D_3 --Beanbean Castle Fake Beanstar
    x433D_3 = {3, 0x433D}; x433D_3 = locFlag(x433D_3); if canBeanstar() then canrCastleTown = canrCastleTown + flip(x433D_3) end; sumrCastleTown = sumrCastleTown - x433D_3 --Beanbean Castle Peach's Extra Dress
    x42FF_3 = {3, 0x42FF}; x42FF_3 = locFlag(x42FF_3); if canChuckolator() then canrCastleTown = canrCastleTown + flip(x42FF_3) end; sumrCastleTown = sumrCastleTown - x42FF_3 --Beanbean Castle Town Beanlet 1
    x42FF_5 = {5, 0x42FF}; x42FF_5 = locFlag(x42FF_5); if canChuckolator() then canrCastleTown = canrCastleTown + flip(x42FF_5) end; sumrCastleTown = sumrCastleTown - x42FF_5 --Beanbean Castle Town Beanlet 2
    x42FF_4 = {4, 0x42FF}; x42FF_4 = locFlag(x42FF_4); if canChuckolator() then canrCastleTown = canrCastleTown + flip(x42FF_4) end; sumrCastleTown = sumrCastleTown - x42FF_4 --Beanbean Castle Town Beanlet 3
    x42FF_2 = {2, 0x42FF}; x42FF_2 = locFlag(x42FF_2); if canChuckolator() then canrCastleTown = canrCastleTown + flip(x42FF_2) end; sumrCastleTown = sumrCastleTown - x42FF_2 --Beanbean Castle Town Beanlet 4
    x42FF_1 = {1, 0x42FF}; x42FF_1 = locFlag(x42FF_1); if canChuckolator() then canrCastleTown = canrCastleTown + flip(x42FF_1) end; sumrCastleTown = sumrCastleTown - x42FF_1 --Beanbean Castle Town Beanlet 5
    x42FF_0 = {0, 0x42FF}; x42FF_0 = locFlag(x42FF_0); if canChuckolator() then canrCastleTown = canrCastleTown + flip(x42FF_0) end; sumrCastleTown = sumrCastleTown - x42FF_0 --Beanbean Castle Town Beanlet Reward
    x4302_4 = {4, 0x4302}; x4302_4 = locFlag(x4302_4); if canChuckolator() and canDig() then canrCastleTown = canrCastleTown + flip(x4302_4) end; sumrCastleTown = sumrCastleTown - x4302_4 --Beanbean Castle Town Beanstone 1
    x4302_5 = {5, 0x4302}; x4302_5 = locFlag(x4302_5); if canChuckolator() and canDig() then canrCastleTown = canrCastleTown + flip(x4302_5) end; sumrCastleTown = sumrCastleTown - x4302_5 --Beanbean Castle Town Beanstone 2
    x4302_6 = {6, 0x4302}; x4302_6 = locFlag(x4302_6); if canChuckolator() and canDig() then canrCastleTown = canrCastleTown + flip(x4302_6) end; sumrCastleTown = sumrCastleTown - x4302_6 --Beanbean Castle Town Beanstone 3
    x4302_7 = {7, 0x4302}; x4302_7 = locFlag(x4302_7); if canChuckolator() and canDig() then canrCastleTown = canrCastleTown + flip(x4302_7) end; sumrCastleTown = sumrCastleTown - x4302_7 --Beanbean Castle Town Beanstone 4
    x4303_0 = {0, 0x4303}; x4303_0 = locFlag(x4303_0); if canChuckolator() and canDig() then canrCastleTown = canrCastleTown + flip(x4303_0) end; sumrCastleTown = sumrCastleTown - x4303_0 --Beanbean Castle Town Beanstone 5
    x4303_1 = {1, 0x4303}; x4303_1 = locFlag(x4303_1); if canChuckolator() and canDig() then canrCastleTown = canrCastleTown + flip(x4303_1) end; sumrCastleTown = sumrCastleTown - x4303_1 --Beanbean Castle Town Beanstone 6
    x4303_2 = {2, 0x4303}; x4303_2 = locFlag(x4303_2); if canChuckolator() and canDig() then canrCastleTown = canrCastleTown + flip(x4303_2) end; sumrCastleTown = sumrCastleTown - x4303_2 --Beanbean Castle Town Beanstone 7
    x4303_3 = {3, 0x4303}; x4303_3 = locFlag(x4303_3); if canChuckolator() and canDig() then canrCastleTown = canrCastleTown + flip(x4303_3) end; sumrCastleTown = sumrCastleTown - x4303_3 --Beanbean Castle Town Beanstone 8
    x4303_4 = {4, 0x4303}; x4303_4 = locFlag(x4303_4); if canChuckolator() and canDig() then canrCastleTown = canrCastleTown + flip(x4303_4) end; sumrCastleTown = sumrCastleTown - x4303_4 --Beanbean Castle Town Beanstone 9
    x4303_5 = {5, 0x4303}; x4303_5 = locFlag(x4303_5); if canChuckolator() and canDig() then canrCastleTown = canrCastleTown + flip(x4303_5) end; sumrCastleTown = sumrCastleTown - x4303_5 --Beanbean Castle Town Beanstone 10
    x42FF_7 = {7, 0x42FF}; x42FF_7 = locFlag(x42FF_7); if canChuckolator() and canDig() then canrCastleTown = canrCastleTown + flip(x42FF_7) end; sumrCastleTown = sumrCastleTown - x42FF_7 --Beanbean Castle Town Beanstone Reward
    x4568_1 = {1, 0x4568}; x4568_1 = locFlag(x4568_1); if canChuckolator() then canrCastleTown = canrCastleTown + flip(x4568_1) end; sumrCastleTown = sumrCastleTown - x4568_1 --Beanbean Castle Town East Side House Block 1
    x4568_2 = {2, 0x4568}; x4568_2 = locFlag(x4568_2); if canChuckolator() then canrCastleTown = canrCastleTown + flip(x4568_2) end; sumrCastleTown = sumrCastleTown - x4568_2 --Beanbean Castle Town East Side House Block 2
    x4568_3 = {3, 0x4568}; x4568_3 = locFlag(x4568_3); if canChuckolator() then canrCastleTown = canrCastleTown + flip(x4568_3) end; sumrCastleTown = sumrCastleTown - x4568_3 --Beanbean Castle Town East Side House Block 3
    x4568_4 = {4, 0x4568}; x4568_4 = locFlag(x4568_4); if canChuckolator() then canrCastleTown = canrCastleTown + flip(x4568_4) end; sumrCastleTown = sumrCastleTown - x4568_4 --Beanbean Castle Town East Side House Block 4
    x4568_6 = {6, 0x4568}; x4568_6 = locFlag(x4568_6); if canMini() then canrCastleTown = canrCastleTown + flip(x4568_6) end; sumrCastleTown = sumrCastleTown - x4568_6 --Beanbean Castle Town Mini Mario Block 1
    x4568_7 = {7, 0x4568}; x4568_7 = locFlag(x4568_7); if canMini() then canrCastleTown = canrCastleTown + flip(x4568_7) end; sumrCastleTown = sumrCastleTown - x4568_7 --Beanbean Castle Town Mini Mario Block 2
    x4569_0 = {0, 0x4569}; x4569_0 = locFlag(x4569_0); if canMini() then canrCastleTown = canrCastleTown + flip(x4569_0) end; sumrCastleTown = sumrCastleTown - x4569_0 --Beanbean Castle Town Mini Mario Block 3
    x4569_1 = {1, 0x4569}; x4569_1 = locFlag(x4569_1); if canMini() then canrCastleTown = canrCastleTown + flip(x4569_1) end; sumrCastleTown = sumrCastleTown - x4569_1 --Beanbean Castle Town Mini Mario Block 4
    x4569_2 = {2, 0x4569}; x4569_2 = locFlag(x4569_2); if canMini() then canrCastleTown = canrCastleTown + flip(x4569_2) end; sumrCastleTown = sumrCastleTown - x4569_2 --Beanbean Castle Town Mini Mario Block 5
    if optionCoins() then x4568_5 = {5, 0x4568}; x4568_5 = locFlag(x4568_5); canrCastleTown = canrCastleTown + flip(x4568_5); sumrCastleTown = sumrCastleTown - x4568_5 end --Beanbean Castle Town Passport Photo Room Coin Block
    x4567_5 = {5, 0x4567}; x4567_5 = locFlag(x4567_5); if canChuckolator() then canrCastleTown = canrCastleTown + flip(x4567_5) end; sumrCastleTown = sumrCastleTown - x4567_5 --Beanbean Castle Town West Side House Block 1
    x4567_6 = {6, 0x4567}; x4567_6 = locFlag(x4567_6); if canChuckolator() then canrCastleTown = canrCastleTown + flip(x4567_6) end; sumrCastleTown = sumrCastleTown - x4567_6 --Beanbean Castle Town West Side House Block 2
    x4567_7 = {7, 0x4567}; x4567_7 = locFlag(x4567_7); if canChuckolator() then canrCastleTown = canrCastleTown + flip(x4567_7) end; sumrCastleTown = sumrCastleTown - x4567_7 --Beanbean Castle Town West Side House Block 3
    x4568_0 = {0, 0x4568}; x4568_0 = locFlag(x4568_0); if canChuckolator() then canrCastleTown = canrCastleTown + flip(x4568_0) end; sumrCastleTown = sumrCastleTown - x4568_0 --Beanbean Castle Town West Side House Block 4
    x432C_6 = {6, 0x432C}; x432C_6 = locFlag(x432C_6); if canDig() then canrOutskirts = canrOutskirts + flip(x432C_6) end; sumrOutskirts = sumrOutskirts - x432C_6 --Beanbean Outskirts Bean Fruit 1
    x432D_1 = {1, 0x432D}; x432D_1 = locFlag(x432D_1); if canDig() then canrOutskirts = canrOutskirts + flip(x432D_1) end; sumrOutskirts = sumrOutskirts - x432D_1 --Beanbean Outskirts Bean Fruit 2
    x432B_4 = {4, 0x432B}; x432B_4 = locFlag(x432B_4); if canDig() then canrOutskirts = canrOutskirts + flip(x432B_4) end; sumrOutskirts = sumrOutskirts - x432B_4 --Beanbean Outskirts Bean Fruit 3
    x432B_7 = {7, 0x432B}; x432B_7 = locFlag(x432B_7); if canDig() and has("Hammers2") then canrOutskirts = canrOutskirts + flip(x432B_7) end; sumrOutskirts = sumrOutskirts - x432B_7 --Beanbean Outskirts Bean Fruit 4
    x434B_1 = {1, 0x434B}; x434B_1 = locFlag(x434B_1); if canDig() and has("Hammers2") then canrOutskirts = canrOutskirts + flip(x434B_1) end; sumrOutskirts = sumrOutskirts - x434B_1 --Beanbean Outskirts Bean Fruit 5
    x432B_2 = {2, 0x432B}; x432B_2 = locFlag(x432B_2); if canDig() then canrOutskirts = canrOutskirts + flip(x432B_2) end; sumrOutskirts = sumrOutskirts - x432B_2 --Beanbean Outskirts Bean Fruit 6
    x432D_5 = {5, 0x432D}; x432D_5 = locFlag(x432D_5); if canTeehee() and canDig() then canrOutskirts = canrOutskirts + flip(x432D_5) end; sumrOutskirts = sumrOutskirts - x432D_5 --Beanbean Outskirts Bean Fruit 7
    if optionDigspots() >= 1 then x4598_4 = {4, 0x4598}; x4598_4 = locFlag(x4598_4); if canCrash() and canDig() then canrOutskirts = canrOutskirts + flip(x4598_4) end; sumrOutskirts = sumrOutskirts - x4598_4 end --Beanbean Outskirts Before Harhall Digspot 1
    if optionDigspots() == 2 then x4598_5 = {5, 0x4598}; x4598_5 = locFlag(x4598_5); if canCrash() and canDig() then canrOutskirts = canrOutskirts + flip(x4598_5) end; sumrOutskirts = sumrOutskirts - x4598_5 end --Beanbean Outskirts Before Harhall Digspot 2
    x434B_3 = {3, 0x434B}; x434B_3 = locFlag(x434B_3); if canCrash() and canMini() then canrOutskirts = canrOutskirts + flip(x434B_3) end; sumrOutskirts = sumrOutskirts - x434B_3 --Beanbean Outskirts Boo Statue Mole
    if optionDigspots() >= 1 then x4598_6 = {6, 0x4598}; x4598_6 = locFlag(x4598_6); if canDig() and has("BeanbeanBrooch") then canrOutskirts = canrOutskirts + flip(x4598_6) end; sumrOutskirts = sumrOutskirts - x4598_6 end --Beanbean Outskirts Brooch Guards Room Digspot 1
    if optionDigspots() >= 1 then x4598_7 = {7, 0x4598}; x4598_7 = locFlag(x4598_7); if canDig() and has("BeanbeanBrooch") then canrOutskirts = canrOutskirts + flip(x4598_7) end; sumrOutskirts = sumrOutskirts - x4598_7 end --Beanbean Outskirts Brooch Guards Room Digspot 2
    if optionDigspots() >= 1 then x4599_0 = {0, 0x4599}; x4599_0 = locFlag(x4599_0); if canDig() and has("BeanbeanBrooch") then canrOutskirts = canrOutskirts + flip(x4599_0) end; sumrOutskirts = sumrOutskirts - x4599_0 end --Beanbean Outskirts Chateau Entrance Digspot 1
    if optionDigspots() == 2 then x4599_1 = {1, 0x4599}; x4599_1 = locFlag(x4599_1); if canDig() and has("BeanbeanBrooch") then canrOutskirts = canrOutskirts + flip(x4599_1) end; sumrOutskirts = sumrOutskirts - x4599_1 end --Beanbean Outskirts Chateau Entrance Digspot 2
    if optionDigspots() >= 1 then x4576_2 = {2, 0x4576}; x4576_2 = locFlag(x4576_2); if canDig() then canrOutskirts = canrOutskirts + flip(x4576_2) end; sumrOutskirts = sumrOutskirts - x4576_2 end --Beanbean Outskirts E Digspot 1
    if optionDigspots() >= 1 then x4576_3 = {3, 0x4576}; x4576_3 = locFlag(x4576_3); if canDig() and canThunderhand() then canrOutskirts = canrOutskirts + flip(x4576_3) end; sumrOutskirts = sumrOutskirts - x4576_3 end --Beanbean Outskirts E Digspot 2
    if optionDigspots() >= 1 then x4576_4 = {4, 0x4576}; x4576_4 = locFlag(x4576_4); if canDig() then canrOutskirts = canrOutskirts + flip(x4576_4) end; sumrOutskirts = sumrOutskirts - x4576_4 end --Beanbean Outskirts E Digspot 3
    if optionDigspots() >= 1 then x459D_3 = {3, 0x459D}; x459D_3 = locFlag(x459D_3); if canDig() then canrOutskirts = canrOutskirts + flip(x459D_3) end; sumrOutskirts = sumrOutskirts - x459D_3 end --Beanbean Outskirts Entrance to Hoohoo Mountain Base Digspot 1
    if optionDigspots() >= 1 then x459D_4 = {4, 0x459D}; x459D_4 = locFlag(x459D_4); if canDig() then canrOutskirts = canrOutskirts + flip(x459D_4) end; sumrOutskirts = sumrOutskirts - x459D_4 end --Beanbean Outskirts Entrance to Hoohoo Mountain Base Digspot 2
    if optionDigspots() >= 1 then x4571_5 = {5, 0x4571}; x4571_5 = locFlag(x4571_5); if canDig() and canThunderhand() then canrOutskirts = canrOutskirts + flip(x4571_5) end; sumrOutskirts = sumrOutskirts - x4571_5 end --Beanbean Outskirts Farm Room Digspot 1
    if optionDigspots() == 2 then x4571_6 = {6, 0x4571}; x4571_6 = locFlag(x4571_6); if canDig() and canThunderhand() then canrOutskirts = canrOutskirts + flip(x4571_6) end; sumrOutskirts = sumrOutskirts - x4571_6 end --Beanbean Outskirts Farm Room Digspot 2
    if optionDigspots() == 2 then x4571_7 = {7, 0x4571}; x4571_7 = locFlag(x4571_7); if canDig() and canThunderhand() then canrOutskirts = canrOutskirts + flip(x4571_7) end; sumrOutskirts = sumrOutskirts - x4571_7 end --Beanbean Outskirts Farm Room Digspot 3
    x434B_0 = {0, 0x434B}; x434B_0 = locFlag(x434B_0); if canThunderhand() then canrOutskirts = canrOutskirts + flip(x434B_0) end; sumrOutskirts = sumrOutskirts - x434B_0 --Beanbean Outskirts Farm Room Mole Reward 1
    x434B_0 = {0, 0x434B}; x434B_0 = locFlag(x434B_0); if canThunderhand() then canrOutskirts = canrOutskirts + flip(x434B_0) end; sumrOutskirts = sumrOutskirts - x434B_0 --Beanbean Outskirts Farm Room Mole Reward 2
    if optionDigspots() >= 1 then x4574_1 = {1, 0x4574}; x4574_1 = locFlag(x4574_1); if canDig() then canrOutskirts = canrOutskirts + flip(x4574_1) end; sumrOutskirts = sumrOutskirts - x4574_1 end --Beanbean Outskirts N Room 1 Digspot
    if optionDigspots() >= 1 then x4574_2 = {2, 0x4574}; x4574_2 = locFlag(x4574_2); if canDig() then canrOutskirts = canrOutskirts + flip(x4574_2) end; sumrOutskirts = sumrOutskirts - x4574_2 end --Beanbean Outskirts N Room 2 Digspot
    if optionDigspots() >= 1 then x4576_0 = {0, 0x4576}; x4576_0 = locFlag(x4576_0); if canDig() and canThunderhand() then canrOutskirts = canrOutskirts + flip(x4576_0) end; sumrOutskirts = sumrOutskirts - x4576_0 end --Beanbean Outskirts NE Digspot 1
    if optionDigspots() == 2 then x4576_1 = {1, 0x4576}; x4576_1 = locFlag(x4576_1); if canDig() then canrOutskirts = canrOutskirts + flip(x4576_1) end; sumrOutskirts = sumrOutskirts - x4576_1 end --Beanbean Outskirts NE Digspot 2
    x434B_4 = {4, 0x434B}; x434B_4 = locFlag(x434B_4); if canMini() then canrOutskirts = canrOutskirts + flip(x434B_4) end; sumrOutskirts = sumrOutskirts - x434B_4 --Beanbean Outskirts NE Solo Mario Mole 1
    x434B_5 = {5, 0x434B}; x434B_5 = locFlag(x434B_5); if canMini() then canrOutskirts = canrOutskirts + flip(x434B_5) end; sumrOutskirts = sumrOutskirts - x434B_5 --Beanbean Outskirts NE Solo Mario Mole 2
    x4572_6 = {6, 0x4572}; x4572_6 = locFlag(x4572_6); if has("Hammers2") then canrOutskirts = canrOutskirts + flip(x4572_6) end; sumrOutskirts = sumrOutskirts - x4572_6 --Beanbean Outskirts NW Block
    if optionCoins() then x4572_7 = {7, 0x4572}; x4572_7 = locFlag(x4572_7); if has("Hammers2") then canrOutskirts = canrOutskirts + flip(x4572_7) end; sumrOutskirts = sumrOutskirts - x4572_7 end --Beanbean Outskirts NW Coin Block
    if optionDigspots() >= 1 then x4573_0 = {0, 0x4573}; x4573_0 = locFlag(x4573_0); if canDig() then canrOutskirts = canrOutskirts + flip(x4573_0) end; sumrOutskirts = sumrOutskirts - x4573_0 end --Beanbean Outskirts NW Digspot
    if optionDigspots() >= 1 then x4577_1 = {1, 0x4577}; x4577_1 = locFlag(x4577_1); if canDig() then canrOutskirts = canrOutskirts + flip(x4577_1) end; sumrOutskirts = sumrOutskirts - x4577_1 end --Beanbean Outskirts North Beach Digspot 1
    if optionDigspots() == 2 then x4577_3 = {3, 0x4577}; x4577_3 = locFlag(x4577_3); if canDig() then canrOutskirts = canrOutskirts + flip(x4577_3) end; sumrOutskirts = sumrOutskirts - x4577_3 end --Beanbean Outskirts North Beach Digspot 2
    if optionDigspots() >= 1 then x4577_2 = {2, 0x4577}; x4577_2 = locFlag(x4577_2); if canTeehee() and canDig() then canrOutskirts = canrOutskirts + flip(x4577_2) end; sumrOutskirts = sumrOutskirts - x4577_2 end --Beanbean Outskirts North Beach Digspot 3
    if optionDigspots() == 2 then x459E_6 = {6, 0x459E}; x459E_6 = locFlag(x459E_6); if canDig() then canrOutskirts = canrOutskirts + flip(x459E_6) end; sumrOutskirts = sumrOutskirts - x459E_6 end --Beanbean Outskirts Pipe 2 Room Digspot
    if optionDigspots() == 2 then x459E_7 = {7, 0x459E}; x459E_7 = locFlag(x459E_7); if canDig() then canrOutskirts = canrOutskirts + flip(x459E_7) end; sumrOutskirts = sumrOutskirts - x459E_7 end --Beanbean Outskirts Pipe 4 Room Digspot
    x4574_6 = {6, 0x4574}; x4574_6 = locFlag(x4574_6); if canThunderhand() and has("Hammers3") then canrOutskirts = canrOutskirts + flip(x4574_6) end; sumrOutskirts = sumrOutskirts - x4574_6 --Beanbean Outskirts S Room 1 Block
    if optionCoins() then x4574_5 = {5, 0x4574}; x4574_5 = locFlag(x4574_5); if canThunderhand() and has("Hammers3") then canrOutskirts = canrOutskirts + flip(x4574_5) end; sumrOutskirts = sumrOutskirts - x4574_5 end --Beanbean Outskirts S Room 1 Coin Block
    if optionDigspots() >= 1 then x4574_3 = {3, 0x4574}; x4574_3 = locFlag(x4574_3); if canDig() then canrOutskirts = canrOutskirts + flip(x4574_3) end; sumrOutskirts = sumrOutskirts - x4574_3 end --Beanbean Outskirts S Room 1 Digspot 1
    if optionDigspots() >= 1 then x4574_7 = {7, 0x4574}; x4574_7 = locFlag(x4574_7); if canThunderhand() and has("Hammers3") and canDig() then canrOutskirts = canrOutskirts + flip(x4574_7) end; sumrOutskirts = sumrOutskirts - x4574_7 end --Beanbean Outskirts S Room 1 Digspot 2
    x4575_3 = {3, 0x4575}; x4575_3 = locFlag(x4575_3); if canDig() then canrOutskirts = canrOutskirts + flip(x4575_3) end; sumrOutskirts = sumrOutskirts - x4575_3 --Beanbean Outskirts S Room 2 Block 1
    x4575_1 = {1, 0x4575}; x4575_1 = locFlag(x4575_1); if canCrash() then canrOutskirts = canrOutskirts + flip(x4575_1) end; sumrOutskirts = sumrOutskirts - x4575_1 --Beanbean Outskirts S Room 2 Block 2
    if optionCoins() then x4575_2 = {2, 0x4575}; x4575_2 = locFlag(x4575_2); if canCrash() then canrOutskirts = canrOutskirts + flip(x4575_2) end; sumrOutskirts = sumrOutskirts - x4575_2 end --Beanbean Outskirts S Room 2 Coin Block
    if optionDigspots() == 2 then x4575_6 = {6, 0x4575}; x4575_6 = locFlag(x4575_6); if canCrash() and canDig() then canrOutskirts = canrOutskirts + flip(x4575_6) end; sumrOutskirts = sumrOutskirts - x4575_6 end --Beanbean Outskirts S Room 2 Digspot 1
    if optionDigspots() == 2 then x4575_5 = {5, 0x4575}; x4575_5 = locFlag(x4575_5); if canCrash() and canDig() then canrOutskirts = canrOutskirts + flip(x4575_5) end; sumrOutskirts = sumrOutskirts - x4575_5 end --Beanbean Outskirts S Room 2 Digspot 2
    if optionDigspots() >= 1 then x4575_0 = {0, 0x4575}; x4575_0 = locFlag(x4575_0); if canCrash() and canDig() then canrOutskirts = canrOutskirts + flip(x4575_0) end; sumrOutskirts = sumrOutskirts - x4575_0 end --Beanbean Outskirts S Room 2 Digspot 3
    if optionDigspots() >= 1 then x4576_5 = {5, 0x4576}; x4576_5 = locFlag(x4576_5); if canDig() then canrOutskirts = canrOutskirts + flip(x4576_5) end; sumrOutskirts = sumrOutskirts - x4576_5 end --Beanbean Outskirts SE Digspot 1
    if optionDigspots() >= 1 then x4576_7 = {7, 0x4576}; x4576_7 = locFlag(x4576_7); if canDig() then canrOutskirts = canrOutskirts + flip(x4576_7) end; sumrOutskirts = sumrOutskirts - x4576_7 end --Beanbean Outskirts SE Digspot 2
    if optionDigspots() == 2 then x4577_0 = {0, 0x4577}; x4577_0 = locFlag(x4577_0); if canDig() then canrOutskirts = canrOutskirts + flip(x4577_0) end; sumrOutskirts = sumrOutskirts - x4577_0 end --Beanbean Outskirts SE Digspot 3
    if optionDigspots() >= 1 then x4573_5 = {5, 0x4573}; x4573_5 = locFlag(x4573_5); if canDig() then canrOutskirts = canrOutskirts + flip(x4573_5) end; sumrOutskirts = sumrOutskirts - x4573_5 end --Beanbean Outskirts SW Digspot 1
    if optionDigspots() >= 1 then x4573_7 = {7, 0x4573}; x4573_7 = locFlag(x4573_7); if canDig() then canrOutskirts = canrOutskirts + flip(x4573_7) end; sumrOutskirts = sumrOutskirts - x4573_7 end --Beanbean Outskirts SW Digspot 2
    if optionDigspots() == 2 then x4574_0 = {0, 0x4574}; x4574_0 = locFlag(x4574_0); if canDig() then canrOutskirts = canrOutskirts + flip(x4574_0) end; sumrOutskirts = sumrOutskirts - x4574_0 end --Beanbean Outskirts SW Digspot 3
    x434E_1 = {1, 0x434E}; x434E_1 = locFlag(x434E_1); if canThunderhand() and has("Hammers2") then canrOutskirts = canrOutskirts + flip(x434E_1) end; sumrOutskirts = sumrOutskirts - x434E_1 --Beanbean Outskirts Secret Scroll 1
    x434E_2 = {2, 0x434E}; x434E_2 = locFlag(x434E_2); if canThunderhand() and has("Hammers3") then canrOutskirts = canrOutskirts + flip(x434E_2) end; sumrOutskirts = sumrOutskirts - x434E_2 --Beanbean Outskirts Secret Scroll 2
    x434B_2 = {2, 0x434B}; x434B_2 = locFlag(x434B_2); if canDig() then canrOutskirts = canrOutskirts + flip(x434B_2) end; sumrOutskirts = sumrOutskirts - x434B_2 --Beanbean Outskirts Solo Luigi Cave Mole
    if optionDigspots() >= 1 then x4577_4 = {4, 0x4577}; x4577_4 = locFlag(x4577_4); if canDig() then canrOutskirts = canrOutskirts + flip(x4577_4) end; sumrOutskirts = sumrOutskirts - x4577_4 end --Beanbean Outskirts South Beach Digspot
    if optionDigspots() >= 1 then x4599_2 = {2, 0x4599}; x4599_2 = locFlag(x4599_2); if canDig() then canrOutskirts = canrOutskirts + flip(x4599_2) end; sumrOutskirts = sumrOutskirts - x4599_2 end --Beanbean Outskirts South of Hooniversity Guards Digspot 1
    if optionDigspots() >= 1 then x4599_3 = {3, 0x4599}; x4599_3 = locFlag(x4599_3); if canDig() then canrOutskirts = canrOutskirts + flip(x4599_3) end; sumrOutskirts = sumrOutskirts - x4599_3 end --Beanbean Outskirts South of Hooniversity Guards Digspot 2
    if optionDigspots() == 2 then x4599_4 = {4, 0x4599}; x4599_4 = locFlag(x4599_4); if canDig() then canrOutskirts = canrOutskirts + flip(x4599_4) end; sumrOutskirts = sumrOutskirts - x4599_4 end --Beanbean Outskirts South of Hooniversity Guards Digspot 3
    x4359_5 = {5, 0x4359}; x4359_5 = locFlag(x4359_5); if canThunderhand() then canrOutskirts = canrOutskirts + flip(x4359_5) end; sumrOutskirts = sumrOutskirts - x4359_5 --Beanbean Outskirts Super Hammer Upgrade
    x4577_6 = {6, 0x4577}; x4577_6 = locFlag(x4577_6); canrOutskirts = canrOutskirts + flip(x4577_6); sumrOutskirts = sumrOutskirts - x4577_6 --Beanbean Outskirts Surf Beach Block
    if optionDigspots() >= 1 then x4577_5 = {5, 0x4577}; x4577_5 = locFlag(x4577_5); if canSurf() and canDig() then canrOutskirts = canrOutskirts + flip(x4577_5) end; sumrOutskirts = sumrOutskirts - x4577_5 end --Beanbean Outskirts Surf Beach Digspot 1
    if optionDigspots() >= 1 then x4577_7 = {7, 0x4577}; x4577_7 = locFlag(x4577_7); if canSurf() and canDig() then canrOutskirts = canrOutskirts + flip(x4577_7) end; sumrOutskirts = sumrOutskirts - x4577_7 end --Beanbean Outskirts Surf Beach Digspot 2
    if optionDigspots() == 2 then x4578_0 = {0, 0x4578}; x4578_0 = locFlag(x4578_0); if canSurf() and canDig() then canrOutskirts = canrOutskirts + flip(x4578_0) end; sumrOutskirts = sumrOutskirts - x4578_0 end --Beanbean Outskirts Surf Beach Digspot 3
    x4373_3 = {3, 0x4373}; x4373_3 = locFlag(x4373_3); if canThunderhand() then canrOutskirts = canrOutskirts + flip(x4373_3) end; sumrOutskirts = sumrOutskirts - x4373_3 --Beanbean Outskirts Thunderhand Mole
    x4359_6 = {6, 0x4359}; x4359_6 = locFlag(x4359_6); if canThunderhand() and canBeanstar() then canrOutskirts = canrOutskirts + flip(x4359_6) end; sumrOutskirts = sumrOutskirts - x4359_6 --Beanbean Outskirts Ultra Hammer Upgrade
    if optionDigspots() >= 1 then x4573_2 = {2, 0x4573}; x4573_2 = locFlag(x4573_2); if canDig() then canrOutskirts = canrOutskirts + flip(x4573_2) end; sumrOutskirts = sumrOutskirts - x4573_2 end --Beanbean Outskirts W Digspot 1
    if optionDigspots() >= 1 then x4573_3 = {3, 0x4573}; x4573_3 = locFlag(x4573_3); if canDig() then canrOutskirts = canrOutskirts + flip(x4573_3) end; sumrOutskirts = sumrOutskirts - x4573_3 end --Beanbean Outskirts W Digspot 2
    if optionDigspots() == 2 then x4573_4 = {4, 0x4573}; x4573_4 = locFlag(x4573_4); if canDig() then canrOutskirts = canrOutskirts + flip(x4573_4) end; sumrOutskirts = sumrOutskirts - x4573_4 end --Beanbean Outskirts W Digspot 3
    x432E_4 = {4, 0x432E}; x432E_4 = locFlag(x432E_4); if canCrash() then canrOutskirts = canrOutskirts + flip(x432E_4) end; sumrOutskirts = sumrOutskirts - x432E_4 --Beanstar Piece Harhall
    x4340_5 = {5, 0x4340}; x4340_5 = locFlag(x4340_5); if canGwarharDeep() and canCrash() then canrGwarhar = canrGwarhar + flip(x4340_5) end; sumrGwarhar = sumrGwarhar - x4340_5 --Beanstar Piece Hermie
    x430F_0 = {0, 0x430F}; x430F_0 = locFlag(x430F_0); if has("BeanbeanBrooch") and canDash() and has("WinkleCard") then canrChucklehuck = canrChucklehuck + flip(x430F_0) end; sumrChucklehuck = sumrChucklehuck - x430F_0 --Beanstar Piece Winkle Area
    x434D_5 = {5, 0x434D}; x434D_5 = locFlag(x434D_5); if canDash() and canNeonEggs() then canrOutskirts = canrOutskirts + flip(x434D_5) end; sumrOutskirts = sumrOutskirts - x434D_5 --Beanstar Piece Yoshi Theater
    if optionBowser() then --
		x459B_5 = {5, 0x459B}; x459B_5 = locFlag(x459B_5); if canBirdo() and optionHardLogic() and has("RedGoblet") and canThunderhand() then canrBowser = canrBowser + flip(x459B_5) end; sumrBowser = sumrBowser - x459B_5 --Bowser's Castle Before Fawful Fight Block 1
		x459B_6 = {6, 0x459B}; x459B_6 = locFlag(x459B_6); if canBirdo() and optionHardLogic() and has("RedGoblet") and canThunderhand() then canrBowser = canrBowser + flip(x459B_6) end; sumrBowser = sumrBowser - x459B_6 --Bowser's Castle Before Fawful Fight Block 2
		x459D_1 = {1, 0x459D}; x459D_1 = locFlag(x459D_1); if canBirdo() and optionHardLogic() and has("RedGoblet") and canThunderhand() then canrBowser = canrBowser + flip(x459D_1) end; sumrBowser = sumrBowser - x459D_1 --Bowser's Castle Before Wendy Fight Block 1
		x459D_2 = {2, 0x459D}; x459D_2 = locFlag(x459D_2); if canBirdo() and optionHardLogic() and has("RedGoblet") and canThunderhand() then canrBowser = canrBowser + flip(x459D_2) end; sumrBowser = sumrBowser - x459D_2 --Bowser's Castle Before Wendy Fight Block 2
		x459A_1 = {1, 0x459A}; x459A_1 = locFlag(x459A_1); if canBirdo() then canrBowser = canrBowser + flip(x459A_1) end; sumrBowser = sumrBowser - x459A_1 --Bowser's Castle Entrance Block 1
		x459A_2 = {2, 0x459A}; x459A_2 = locFlag(x459A_2); if canBirdo() then canrBowser = canrBowser + flip(x459A_2) end; sumrBowser = sumrBowser - x459A_2 --Bowser's Castle Entrance Block 2
		if optionDigspots() >= 1 then x459A_3 = {3, 0x459A}; x459A_3 = locFlag(x459A_3); if canBirdo() then canrBowser = canrBowser + flip(x459A_3) end; sumrBowser = sumrBowser - x459A_3 end --Bowser's Castle Entrance Digspot
		x459B_7 = {7, 0x459B}; x459B_7 = locFlag(x459B_7); if canBirdo() and optionHardLogic() and has("RedGoblet") and canThunderhand() then canrBowser = canrBowser + flip(x459B_7) end; sumrBowser = sumrBowser - x459B_7 --Bowser's Castle Great Door Block 1
		x459C_0 = {0, 0x459C}; x459C_0 = locFlag(x459C_0); if canBirdo() and optionHardLogic() and has("RedGoblet") and canThunderhand() then canrBowser = canrBowser + flip(x459C_0) end; sumrBowser = sumrBowser - x459C_0 --Bowser's Castle Great Door Block 2
		x459A_4 = {4, 0x459A}; x459A_4 = locFlag(x459A_4); if canBirdo() then canrBowser = canrBowser + flip(x459A_4) end; sumrBowser = sumrBowser - x459A_4 --Bowser's Castle Iggy & Morton Hallway Block 1
		x459A_5 = {5, 0x459A}; x459A_5 = locFlag(x459A_5); if canBirdo() then canrBowser = canrBowser + flip(x459A_5) end; sumrBowser = sumrBowser - x459A_5 --Bowser's Castle Iggy & Morton Hallway Block 2
		if optionDigspots() >= 1 then x459A_6 = {6, 0x459A}; x459A_6 = locFlag(x459A_6); if canBirdo() then canrBowser = canrBowser + flip(x459A_6) end; sumrBowser = sumrBowser - x459A_6 end --Bowser's Castle Iggy & Morton Hallway Digspot
		x459E_2 = {2, 0x459E}; x459E_2 = locFlag(x459E_2); if canBirdo() and optionHardLogic() and has("RedGoblet") and canThunderhand() then canrBowser = canrBowser + flip(x459E_2) end; sumrBowser = sumrBowser - x459E_2 --Bowser's Castle Larry Room Block
		x459C_2 = {2, 0x459C}; x459C_2 = locFlag(x459C_2); if canBirdo() then canrBowser = canrBowser + flip(x459C_2) end; sumrBowser = sumrBowser - x459C_2 --Bowser's Castle Lemmy Room 1 Block
		if optionDigspots() >= 1 then x459C_3 = {3, 0x459C}; x459C_3 = locFlag(x459C_3); if canBirdo() then canrBowser = canrBowser + flip(x459C_3) end; sumrBowser = sumrBowser - x459C_3 end --Bowser's Castle Lemmy Room 1 Digspot
		x4373_6 = {6, 0x4373}; x4373_6 = locFlag(x4373_6); if canBirdo() then canrBowser = canrBowser + flip(x4373_6) end; sumrBowser = sumrBowser - x4373_6 --Bowser's Castle Lemmy Room Mole
		x459B_0 = {0, 0x459B}; x459B_0 = locFlag(x459B_0); if canBirdo() and optionHardLogic() and has("RedGoblet") and canThunderhand() then canrBowser = canrBowser + flip(x459B_0) end; sumrBowser = sumrBowser - x459B_0 --Bowser's Castle Ludwig & Roy Hallway Block 1
		x459B_1 = {1, 0x459B}; x459B_1 = locFlag(x459B_1); if canBirdo() and optionHardLogic() and has("RedGoblet") and canThunderhand() then canrBowser = canrBowser + flip(x459B_1) end; sumrBowser = sumrBowser - x459B_1 --Bowser's Castle Ludwig & Roy Hallway Block 2
		x459C_4 = {4, 0x459C}; x459C_4 = locFlag(x459C_4); if canBirdo() then canrBowser = canrBowser + flip(x459C_4) end; sumrBowser = sumrBowser - x459C_4 --Bowser's Castle Ludwig Room 1 Block
		x459C_7 = {7, 0x459C}; x459C_7 = locFlag(x459C_7); if canBirdo() and optionHardLogic() and has("RedGoblet") and canThunderhand() then canrBowser = canrBowser + flip(x459C_7) end; sumrBowser = sumrBowser - x459C_7 --Bowser's Castle Mini Mario Maze Block 1
		x459D_0 = {0, 0x459D}; x459D_0 = locFlag(x459D_0); if canBirdo() and optionHardLogic() and has("RedGoblet") and canThunderhand() then canrBowser = canrBowser + flip(x459D_0) end; sumrBowser = sumrBowser - x459D_0 --Bowser's Castle Mini Mario Maze Block 2
		x459C_5 = {5, 0x459C}; x459C_5 = locFlag(x459C_5); if canBirdo() and optionHardLogic() and has("RedGoblet") and canThunderhand() then canrBowser = canrBowser + flip(x459C_5) end; sumrBowser = sumrBowser - x459C_5 --Bowser's Castle Mini Mario Sidescroller Block 1
		x459C_6 = {6, 0x459C}; x459C_6 = locFlag(x459C_6); if canBirdo() and optionHardLogic() and has("RedGoblet") and canThunderhand() then canrBowser = canrBowser + flip(x459C_6) end; sumrBowser = sumrBowser - x459C_6 --Bowser's Castle Mini Mario Sidescroller Block 2
		if optionDigspots() >= 1 then x459C_1 = {1, 0x459C}; x459C_1 = locFlag(x459C_1); if canBirdo() then canrBowser = canrBowser + flip(x459C_1) end; sumrBowser = sumrBowser - x459C_1 end --Bowser's Castle Morton Room 1 Digspot
		x459A_7 = {7, 0x459A}; x459A_7 = locFlag(x459A_7); if canBirdo() then canrBowser = canrBowser + flip(x459A_7) end; sumrBowser = sumrBowser - x459A_7 --Bowser's Castle Past Morton Block
		x459B_2 = {2, 0x459B}; x459B_2 = locFlag(x459B_2); if canBirdo() and optionHardLogic() and has("RedGoblet") and canThunderhand() then canrBowser = canrBowser + flip(x459B_2) end; sumrBowser = sumrBowser - x459B_2 --Bowser's Castle Roy Corridor Block 1
		x459B_3 = {3, 0x459B}; x459B_3 = locFlag(x459B_3); if canBirdo() and optionHardLogic() and has("RedGoblet") and canThunderhand() then canrBowser = canrBowser + flip(x459B_3) end; sumrBowser = sumrBowser - x459B_3 --Bowser's Castle Roy Corridor Block 2
		if optionDigspots() >= 1 then x459B_4 = {4, 0x459B}; x459B_4 = locFlag(x459B_4); if canBirdo() and optionHardLogic() and has("RedGoblet") and canThunderhand() then canrBowser = canrBowser + flip(x459B_4) end; sumrBowser = sumrBowser - x459B_4 end --Bowser's Castle Wendy & Larry Hallway Digspot
    end --
    x456F_6 = {6, 0x456F}; x456F_6 = locFlag(x456F_6); canrStardust = canrStardust + flip(x456F_6); sumrStardust = sumrStardust - x456F_6 --Cave Connecting Stardust Fields and Hoohoo Village Block 1
    x456F_7 = {7, 0x456F}; x456F_7 = locFlag(x456F_7); canrStardust = canrStardust + flip(x456F_7); sumrStardust = sumrStardust - x456F_7 --Cave Connecting Stardust Fields and Hoohoo Village Block 2
    if optionDigspots() >= 1 then x4578_7 = {7, 0x4578}; x4578_7 = locFlag(x4578_7); if has("BeanbeanBrooch") and canDig() then canrChucklehuck = canrChucklehuck + flip(x4578_7) end; sumrChucklehuck = sumrChucklehuck - x4578_7 end --Chateau Barrel Room Digspot
    if optionDigspots() >= 1 then x4579_0 = {0, 0x4579}; x4579_0 = locFlag(x4579_0); if has("BeanbeanBrooch") and canDig() then canrChucklehuck = canrChucklehuck + flip(x4579_0) end; sumrChucklehuck = sumrChucklehuck - x4579_0 end --Chateau Goblet Room Digspot
    x42FE_2 = {2, 0x42FE}; x42FE_2 = locFlag(x42FE_2); if has("BeanbeanBrooch") and canDig() then canrChucklehuck = canrChucklehuck + flip(x42FE_2) end; sumrChucklehuck = sumrChucklehuck - x42FE_2 --Chateau Green Goblet
    x4578_3 = {3, 0x4578}; x4578_3 = locFlag(x4578_3); if has("BeanbeanBrooch") then canrChucklehuck = canrChucklehuck + flip(x4578_3) end; sumrChucklehuck = sumrChucklehuck - x4578_3 --Chateau Popple Fight Room Block 1
    x4578_5 = {5, 0x4578}; x4578_5 = locFlag(x4578_5); if has("BeanbeanBrooch") then canrChucklehuck = canrChucklehuck + flip(x4578_5) end; sumrChucklehuck = sumrChucklehuck - x4578_5 --Chateau Popple Fight Room Block 2
    if optionDigspots() >= 1 then x4578_6 = {6, 0x4578}; x4578_6 = locFlag(x4578_6); if has("BeanbeanBrooch") and canDig() then canrChucklehuck = canrChucklehuck + flip(x4578_6) end; sumrChucklehuck = sumrChucklehuck - x4578_6 end --Chateau Popple Fight Room Digspot
    if optionCoins() then x4578_2 = {2, 0x4578}; x4578_2 = locFlag(x4578_2); if has("BeanbeanBrooch") then canrChucklehuck = canrChucklehuck + flip(x4578_2) end; sumrChucklehuck = sumrChucklehuck - x4578_2 end --Chateau Popple Room Coin Block 1
    if optionCoins() then x4578_4 = {4, 0x4578}; x4578_4 = locFlag(x4578_4); if has("BeanbeanBrooch") then canrChucklehuck = canrChucklehuck + flip(x4578_4) end; sumrChucklehuck = sumrChucklehuck - x4578_4 end --Chateau Popple Room Coin Block 2
    x42FE_1 = {1, 0x42FE}; x42FE_1 = locFlag(x42FE_1); if has("BeanbeanBrooch") and canMini() then canrChucklehuck = canrChucklehuck + flip(x42FE_1) end; sumrChucklehuck = sumrChucklehuck - x42FE_1 --Chateau Red Goblet
    if optionDigspots() >= 1 then x4578_1 = {1, 0x4578}; x4578_1 = locFlag(x4578_1); if has("BeanbeanBrooch") and canDig() then canrChucklehuck = canrChucklehuck + flip(x4578_1) end; sumrChucklehuck = sumrChucklehuck - x4578_1 end --Chateau Room 1 Digspot
    x4579_2 = {2, 0x4579}; x4579_2 = locFlag(x4579_2); if has("BeanbeanBrooch") then canrChucklehuck = canrChucklehuck + flip(x4579_2) end; sumrChucklehuck = sumrChucklehuck - x4579_2 --Chucklehuck Woods Cave Room 1 Block 1
    x4579_3 = {3, 0x4579}; x4579_3 = locFlag(x4579_3); if has("BeanbeanBrooch") then canrChucklehuck = canrChucklehuck + flip(x4579_3) end; sumrChucklehuck = sumrChucklehuck - x4579_3 --Chucklehuck Woods Cave Room 1 Block 2
    if optionCoins() then x4579_1 = {1, 0x4579}; x4579_1 = locFlag(x4579_1); if has("BeanbeanBrooch") then canrChucklehuck = canrChucklehuck + flip(x4579_1) end; sumrChucklehuck = sumrChucklehuck - x4579_1 end --Chucklehuck Woods Cave Room 1 Coin Block
    x4579_5 = {5, 0x4579}; x4579_5 = locFlag(x4579_5); if has("BeanbeanBrooch") then canrChucklehuck = canrChucklehuck + flip(x4579_5) end; sumrChucklehuck = sumrChucklehuck - x4579_5 --Chucklehuck Woods Cave Room 2 Block
    if optionCoins() then x4579_4 = {4, 0x4579}; x4579_4 = locFlag(x4579_4); if has("BeanbeanBrooch") then canrChucklehuck = canrChucklehuck + flip(x4579_4) end; sumrChucklehuck = sumrChucklehuck - x4579_4 end --Chucklehuck Woods Cave Room 2 Coin Block
    x4579_6 = {6, 0x4579}; x4579_6 = locFlag(x4579_6); if has("BeanbeanBrooch") then canrChucklehuck = canrChucklehuck + flip(x4579_6) end; sumrChucklehuck = sumrChucklehuck - x4579_6 --Chucklehuck Woods Cave Room 3 Block
    if optionCoins() then x4579_7 = {7, 0x4579}; x4579_7 = locFlag(x4579_7); if has("BeanbeanBrooch") then canrChucklehuck = canrChucklehuck + flip(x4579_7) end; sumrChucklehuck = sumrChucklehuck - x4579_7 end --Chucklehuck Woods Cave Room 3 Coin Block
    if optionDigspots() >= 1 then x457C_0 = {0, 0x457C}; x457C_0 = locFlag(x457C_0); if has("BeanbeanBrooch") and canDig() then canrChucklehuck = canrChucklehuck + flip(x457C_0) end; sumrChucklehuck = sumrChucklehuck - x457C_0 end --Chucklehuck Woods East of Chuckleroot Digspot
    x457E_6 = {6, 0x457E}; x457E_6 = locFlag(x457E_6); if has("BeanbeanBrooch") then canrChucklehuck = canrChucklehuck + flip(x457E_6) end; sumrChucklehuck = sumrChucklehuck - x457E_6 --Chucklehuck Woods Koopa Room Block 1
    x457F_0 = {0, 0x457F}; x457F_0 = locFlag(x457F_0); if has("BeanbeanBrooch") then canrChucklehuck = canrChucklehuck + flip(x457F_0) end; sumrChucklehuck = sumrChucklehuck - x457F_0 --Chucklehuck Woods Koopa Room Block 2
    if optionCoins() then x457E_7 = {7, 0x457E}; x457E_7 = locFlag(x457E_7); if has("BeanbeanBrooch") then canrChucklehuck = canrChucklehuck + flip(x457E_7) end; sumrChucklehuck = sumrChucklehuck - x457E_7 end --Chucklehuck Woods Koopa Room Coin Block
    if optionDigspots() == 2 then x457F_1 = {1, 0x457F}; x457F_1 = locFlag(x457F_1); if has("BeanbeanBrooch") and canDig() then canrChucklehuck = canrChucklehuck + flip(x457F_1) end; sumrChucklehuck = sumrChucklehuck - x457F_1 end --Chucklehuck Woods Koopa Room Digspot
    if optionDigspots() >= 1 then x457C_1 = {1, 0x457C}; x457C_1 = locFlag(x457C_1); if has("BeanbeanBrooch") and canDig() then canrChucklehuck = canrChucklehuck + flip(x457C_1) end; sumrChucklehuck = sumrChucklehuck - x457C_1 end --Chucklehuck Woods Northeast of Chuckleroot Digspot 1
    if optionDigspots() >= 1 then x457C_2 = {2, 0x457C}; x457C_2 = locFlag(x457C_2); if has("BeanbeanBrooch") and canDig() then canrChucklehuck = canrChucklehuck + flip(x457C_2) end; sumrChucklehuck = sumrChucklehuck - x457C_2 end --Chucklehuck Woods Northeast of Chuckleroot Digspot 2
    if optionDigspots() >= 1 then x457C_3 = {3, 0x457C}; x457C_3 = locFlag(x457C_3); if has("BeanbeanBrooch") and canDig() then canrChucklehuck = canrChucklehuck + flip(x457C_3) end; sumrChucklehuck = sumrChucklehuck - x457C_3 end --Chucklehuck Woods Northeast of Chuckleroot Digspot 3
    if optionDigspots() >= 1 then x457C_4 = {4, 0x457C}; x457C_4 = locFlag(x457C_4); if has("BeanbeanBrooch") and canDig() then canrChucklehuck = canrChucklehuck + flip(x457C_4) end; sumrChucklehuck = sumrChucklehuck - x457C_4 end --Chucklehuck Woods Northeast of Chuckleroot Digspot 4
    x457D_4 = {4, 0x457D}; x457D_4 = locFlag(x457D_4); if canPreChuckolator() then canrChucklehuck = canrChucklehuck + flip(x457D_4) end; sumrChucklehuck = sumrChucklehuck - x457D_4 --Chucklehuck Woods Past Chuckleroot Block 1
    x457D_5 = {5, 0x457D}; x457D_5 = locFlag(x457D_5); if canPreChuckolator() then canrChucklehuck = canrChucklehuck + flip(x457D_5) end; sumrChucklehuck = sumrChucklehuck - x457D_5 --Chucklehuck Woods Past Chuckleroot Block 2
    x457D_6 = {6, 0x457D}; x457D_6 = locFlag(x457D_6); if canPreChuckolator() then canrChucklehuck = canrChucklehuck + flip(x457D_6) end; sumrChucklehuck = sumrChucklehuck - x457D_6 --Chucklehuck Woods Past Chuckleroot Block 3
    x457D_7 = {7, 0x457D}; x457D_7 = locFlag(x457D_7); if canPreChuckolator() then canrChucklehuck = canrChucklehuck + flip(x457D_7) end; sumrChucklehuck = sumrChucklehuck - x457D_7 --Chucklehuck Woods Past Chuckleroot Block 4
    x457E_0 = {0, 0x457E}; x457E_0 = locFlag(x457E_0); if canPreChuckolator() then canrChucklehuck = canrChucklehuck + flip(x457E_0) end; sumrChucklehuck = sumrChucklehuck - x457E_0 --Chucklehuck Woods Past Chuckleroot Block 5
    x457E_1 = {1, 0x457E}; x457E_1 = locFlag(x457E_1); if canPreChuckolator() then canrChucklehuck = canrChucklehuck + flip(x457E_1) end; sumrChucklehuck = sumrChucklehuck - x457E_1 --Chucklehuck Woods Past Chuckleroot Block 6
    if optionCoins() then x457E_2 = {2, 0x457E}; x457E_2 = locFlag(x457E_2); if canPreChuckolator() then canrChucklehuck = canrChucklehuck + flip(x457E_2) end; sumrChucklehuck = sumrChucklehuck - x457E_2 end --Chucklehuck Woods Past Chuckleroot Coin Block
    if optionCoins() then x457A_4 = {4, 0x457A}; x457A_4 = locFlag(x457A_4); if has("BeanbeanBrooch") and has("Hammers1") then canrChucklehuck = canrChucklehuck + flip(x457A_4) end; sumrChucklehuck = sumrChucklehuck - x457A_4 end --Chucklehuck Woods Pipe 5 Room Coin Block
    x457A_2 = {2, 0x457A}; x457A_2 = locFlag(x457A_2); if has("BeanbeanBrooch") and has("Hammers1") then canrChucklehuck = canrChucklehuck + flip(x457A_2) end; sumrChucklehuck = sumrChucklehuck - x457A_2 --Chucklehuck Woods Pipe Room Block 1
    x457A_3 = {3, 0x457A}; x457A_3 = locFlag(x457A_3); if has("BeanbeanBrooch") and has("Hammers1") then canrChucklehuck = canrChucklehuck + flip(x457A_3) end; sumrChucklehuck = sumrChucklehuck - x457A_3 --Chucklehuck Woods Pipe Room Block 2
    if optionDigspots() >= 1 then x457A_5 = {5, 0x457A}; x457A_5 = locFlag(x457A_5); if has("BeanbeanBrooch") and canDig() then canrChucklehuck = canrChucklehuck + flip(x457A_5) end; sumrChucklehuck = sumrChucklehuck - x457A_5 end --Chucklehuck Woods Pipe Room Digspot 1
    if optionDigspots() == 2 then x457A_6 = {6, 0x457A}; x457A_6 = locFlag(x457A_6); if has("BeanbeanBrooch") and canDig() then canrChucklehuck = canrChucklehuck + flip(x457A_6) end; sumrChucklehuck = sumrChucklehuck - x457A_6 end --Chucklehuck Woods Pipe Room Digspot 2
    if optionDigspots() == 2 then x4585_1 = {1, 0x4585}; x4585_1 = locFlag(x4585_1); if has("BeanbeanBrooch") and canDig() then canrChucklehuck = canrChucklehuck + flip(x4585_1) end; sumrChucklehuck = sumrChucklehuck - x4585_1 end --Chucklehuck Woods Room 1 Digspot
    x457A_0 = {0, 0x457A}; x457A_0 = locFlag(x457A_0); if has("BeanbeanBrooch") then canrChucklehuck = canrChucklehuck + flip(x457A_0) end; sumrChucklehuck = sumrChucklehuck - x457A_0 --Chucklehuck Woods Room 2 Block
    if optionDigspots() >= 1 then x457A_1 = {1, 0x457A}; x457A_1 = locFlag(x457A_1); if has("BeanbeanBrooch") and canDig() then canrChucklehuck = canrChucklehuck + flip(x457A_1) end; sumrChucklehuck = sumrChucklehuck - x457A_1 end --Chucklehuck Woods Room 2 Digspot
    x457A_7 = {7, 0x457A}; x457A_7 = locFlag(x457A_7); if has("BeanbeanBrooch") and canMini() then canrChucklehuck = canrChucklehuck + flip(x457A_7) end; sumrChucklehuck = sumrChucklehuck - x457A_7 --Chucklehuck Woods Room 4 Block 1
    x457B_0 = {0, 0x457B}; x457B_0 = locFlag(x457B_0); if has("BeanbeanBrooch") and canMini() then canrChucklehuck = canrChucklehuck + flip(x457B_0) end; sumrChucklehuck = sumrChucklehuck - x457B_0 --Chucklehuck Woods Room 4 Block 2
    x457B_1 = {1, 0x457B}; x457B_1 = locFlag(x457B_1); if has("BeanbeanBrooch") and canMini() then canrChucklehuck = canrChucklehuck + flip(x457B_1) end; sumrChucklehuck = sumrChucklehuck - x457B_1 --Chucklehuck Woods Room 4 Block 3
    x457B_2 = {2, 0x457B}; x457B_2 = locFlag(x457B_2); if has("BeanbeanBrooch") and has("Hammers1") then canrChucklehuck = canrChucklehuck + flip(x457B_2) end; sumrChucklehuck = sumrChucklehuck - x457B_2 --Chucklehuck Woods Room 7 Block 1
    x457B_4 = {4, 0x457B}; x457B_4 = locFlag(x457B_4); if has("BeanbeanBrooch") and has("Hammers1") then canrChucklehuck = canrChucklehuck + flip(x457B_4) end; sumrChucklehuck = sumrChucklehuck - x457B_4 --Chucklehuck Woods Room 7 Block 2
    if optionCoins() then x457B_3 = {3, 0x457B}; x457B_3 = locFlag(x457B_3); if has("BeanbeanBrooch") and has("Hammers1") then canrChucklehuck = canrChucklehuck + flip(x457B_3) end; sumrChucklehuck = sumrChucklehuck - x457B_3 end --Chucklehuck Woods Room 7 Coin Block
    if optionDigspots() >= 1 then x457B_5 = {5, 0x457B}; x457B_5 = locFlag(x457B_5); if has("BeanbeanBrooch") and canDig() then canrChucklehuck = canrChucklehuck + flip(x457B_5) end; sumrChucklehuck = sumrChucklehuck - x457B_5 end --Chucklehuck Woods Room 7 Digspot 1
    if optionDigspots() >= 1 then x457B_6 = {6, 0x457B}; x457B_6 = locFlag(x457B_6); if has("BeanbeanBrooch") and canDig() then canrChucklehuck = canrChucklehuck + flip(x457B_6) end; sumrChucklehuck = sumrChucklehuck - x457B_6 end --Chucklehuck Woods Room 7 Digspot 2
    if optionDigspots() >= 1 then x457B_7 = {7, 0x457B}; x457B_7 = locFlag(x457B_7); if has("BeanbeanBrooch") and canDig() then canrChucklehuck = canrChucklehuck + flip(x457B_7) end; sumrChucklehuck = sumrChucklehuck - x457B_7 end --Chucklehuck Woods Room 8 Digspot
    x457D_1 = {1, 0x457D}; x457D_1 = locFlag(x457D_1); if has("BeanbeanBrooch") then canrChucklehuck = canrChucklehuck + flip(x457D_1) end; sumrChucklehuck = sumrChucklehuck - x457D_1 --Chucklehuck Woods Southwest of Chuckleroot Block
    x457D_0 = {0, 0x457D}; x457D_0 = locFlag(x457D_0); if has("BeanbeanBrooch") then canrChucklehuck = canrChucklehuck + flip(x457D_0) end; sumrChucklehuck = sumrChucklehuck - x457D_0 --Chucklehuck Woods West of Chuckleroot Block
    if optionDigspots() >= 1 then x457C_5 = {5, 0x457C}; x457C_5 = locFlag(x457C_5); if has("BeanbeanBrooch") and canDig() then canrChucklehuck = canrChucklehuck + flip(x457C_5) end; sumrChucklehuck = sumrChucklehuck - x457C_5 end --Chucklehuck Woods White Fruit Room Digspot 1
    if optionDigspots() >= 1 then x457C_6 = {6, 0x457C}; x457C_6 = locFlag(x457C_6); if has("BeanbeanBrooch") and canGoblets() then canrChucklehuck = canrChucklehuck + flip(x457C_6) end; sumrChucklehuck = sumrChucklehuck - x457C_6 end --Chucklehuck Woods White Fruit Room Digspot 2
    if optionDigspots() == 2 then x457C_7 = {7, 0x457C}; x457C_7 = locFlag(x457C_7); if has("BeanbeanBrooch") and canGoblets() then canrChucklehuck = canrChucklehuck + flip(x457C_7) end; sumrChucklehuck = sumrChucklehuck - x457C_7 end --Chucklehuck Woods White Fruit Room Digspot 3
    if optionDigspots() >= 1 then x457D_2 = {2, 0x457D}; x457D_2 = locFlag(x457D_2); if has("BeanbeanBrooch") and canDig() then canrChucklehuck = canrChucklehuck + flip(x457D_2) end; sumrChucklehuck = sumrChucklehuck - x457D_2 end --Chucklehuck Woods Wiggler room Digspot 1
    if optionDigspots() == 2 then x457D_3 = {3, 0x457D}; x457D_3 = locFlag(x457D_3); if has("BeanbeanBrooch") and canDig() then canrChucklehuck = canrChucklehuck + flip(x457D_3) end; sumrChucklehuck = sumrChucklehuck - x457D_3 end --Chucklehuck Woods Wiggler room Digspot 2
    if optionCoins() then x457F_4 = {4, 0x457F}; x457F_4 = locFlag(x457F_4); if has("BeanbeanBrooch") and canDash() then canrChucklehuck = canrChucklehuck + flip(x457F_4) end; sumrChucklehuck = sumrChucklehuck - x457F_4 end --Chucklehuck Woods Winkle Area Cave Coin Block
    x457F_3 = {3, 0x457F}; x457F_3 = locFlag(x457F_3); if has("BeanbeanBrooch") and canDash() then canrChucklehuck = canrChucklehuck + flip(x457F_3) end; sumrChucklehuck = sumrChucklehuck - x457F_3 --Chucklehuck Woods Winkle Cave Block 1
    x457F_2 = {2, 0x457F}; x457F_2 = locFlag(x457F_2); if has("BeanbeanBrooch") and canDash() then canrChucklehuck = canrChucklehuck + flip(x457F_2) end; sumrChucklehuck = sumrChucklehuck - x457F_2 --Chucklehuck Woods Winkle Cave Block 2
    x4375_5 = {5, 0x4375}; x4375_5 = locFlag(x4375_5); if canChuckolator() then canrCastleTown = canrCastleTown + flip(x4375_5) end; sumrCastleTown = sumrCastleTown - x4375_5 --Coffee Shop Brew Reward 1
    x4375_6 = {6, 0x4375}; x4375_6 = locFlag(x4375_6); if canChuckolator() then canrCastleTown = canrCastleTown + flip(x4375_6) end; sumrCastleTown = sumrCastleTown - x4375_6 --Coffee Shop Brew Reward 2
    x4375_7 = {7, 0x4375}; x4375_7 = locFlag(x4375_7); if canChuckolator() then canrCastleTown = canrCastleTown + flip(x4375_7) end; sumrCastleTown = sumrCastleTown - x4375_7 --Coffee Shop Brew Reward 3
    x4376_0 = {0, 0x4376}; x4376_0 = locFlag(x4376_0); if canChuckolator() then canrCastleTown = canrCastleTown + flip(x4376_0) end; sumrCastleTown = sumrCastleTown - x4376_0 --Coffee Shop Brew Reward 4
    x4376_1 = {1, 0x4376}; x4376_1 = locFlag(x4376_1); if canChuckolator() then canrCastleTown = canrCastleTown + flip(x4376_1) end; sumrCastleTown = sumrCastleTown - x4376_1 --Coffee Shop Brew Reward 5
    x4376_2 = {2, 0x4376}; x4376_2 = locFlag(x4376_2); if canChuckolator() then canrCastleTown = canrCastleTown + flip(x4376_2) end; sumrCastleTown = sumrCastleTown - x4376_2 --Coffee Shop Brew Reward 6
    x4376_3 = {3, 0x4376}; x4376_3 = locFlag(x4376_3); if canChuckolator() then canrCastleTown = canrCastleTown + flip(x4376_3) end; sumrCastleTown = sumrCastleTown - x4376_3 --Coffee Shop Brew Reward 7
    x4372_0 = {0, 0x4372}; x4372_0 = locFlag(x4372_0); if canChuckolator() then canrCastleTown = canrCastleTown + flip(x4372_0) end; sumrCastleTown = sumrCastleTown - x4372_0 --Coffee Shop Chuckle Blend
    x4372_3 = {3, 0x4372}; x4372_3 = locFlag(x4372_3); if canChuckolator() then canrCastleTown = canrCastleTown + flip(x4372_3) end; sumrCastleTown = sumrCastleTown - x4372_3 --Coffee Shop Chuckoccino
    x4371_7 = {7, 0x4371}; x4371_7 = locFlag(x4371_7); if canChuckolator() then canrCastleTown = canrCastleTown + flip(x4371_7) end; sumrCastleTown = sumrCastleTown - x4371_7 --Coffee Shop Hoohoo Blend
    x4372_2 = {2, 0x4372}; x4372_2 = locFlag(x4372_2); if canChuckolator() then canrCastleTown = canrCastleTown + flip(x4372_2) end; sumrCastleTown = sumrCastleTown - x4372_2 --Coffee Shop Hoolumbian
    x4372_1 = {1, 0x4372}; x4372_1 = locFlag(x4372_1); if canChuckolator() then canrCastleTown = canrCastleTown + flip(x4372_1) end; sumrCastleTown = sumrCastleTown - x4372_1 --Coffee Shop Teehee Blend
    x4372_4 = {4, 0x4372}; x4372_4 = locFlag(x4372_4); if canChuckolator() then canrCastleTown = canrCastleTown + flip(x4372_4) end; sumrCastleTown = sumrCastleTown - x4372_4 --Coffee Shop Teeheespresso
    x4371_6 = {6, 0x4371}; x4371_6 = locFlag(x4371_6); if canChuckolator() then canrCastleTown = canrCastleTown + flip(x4371_6) end; sumrCastleTown = sumrCastleTown - x4371_6 --Coffee Shop Woohoo Blend
    x4591_7 = {7, 0x4591}; x4591_7 = locFlag(x4591_7); if canFungitown() then canrTeehee = canrTeehee + flip(x4591_7) end; sumrTeehee = sumrTeehee - x4591_7 --Fungitown Embassy Room Block
    x4592_0 = {0, 0x4592}; x4592_0 = locFlag(x4592_0); if canFungitown() then canrTeehee = canrTeehee + flip(x4592_0) end; sumrTeehee = sumrTeehee - x4592_0 --Fungitown Entrance Room Block
    x458C_0 = {0, 0x458C}; x458C_0 = locFlag(x458C_0); if canGwarhar() and canDash() then canrGwarhar = canrGwarhar + flip(x458C_0) end; sumrGwarhar = sumrGwarhar - x458C_0 --Gwarhar Lagoon First Underwater Area Room 1 Block
    x458C_1 = {1, 0x458C}; x458C_1 = locFlag(x458C_1); if canGwarhar() and canDash() then canrGwarhar = canrGwarhar + flip(x458C_1) end; sumrGwarhar = sumrGwarhar - x458C_1 --Gwarhar Lagoon First Underwater Area Room 2 Block 1
    x458C_2 = {2, 0x458C}; x458C_2 = locFlag(x458C_2); if canGwarhar() and canDash() then canrGwarhar = canrGwarhar + flip(x458C_2) end; sumrGwarhar = sumrGwarhar - x458C_2 --Gwarhar Lagoon First Underwater Area Room 2 Block 2
    if optionCoins() then x458C_3 = {3, 0x458C}; x458C_3 = locFlag(x458C_3); if canGwarhar() and canDash() then canrGwarhar = canrGwarhar + flip(x458C_3) end; sumrGwarhar = sumrGwarhar - x458C_3 end --Gwarhar Lagoon First Underwater Area Room 2 Coin Block
    if optionDigspots() == 2 then x458A_4 = {4, 0x458A}; x458A_4 = locFlag(x458A_4); if canGwarhar() and canDig() then canrGwarhar = canrGwarhar + flip(x458A_4) end; sumrGwarhar = sumrGwarhar - x458A_4 end --Gwarhar Lagoon Massage Parlor Entrance Digspot
    if optionDigspots() >= 1 then x458A_3 = {3, 0x458A}; x458A_3 = locFlag(x458A_3); if canGwarhar() and canDig() then canrGwarhar = canrGwarhar + flip(x458A_3) end; sumrGwarhar = sumrGwarhar - x458A_3 end --Gwarhar Lagoon Pipe Room Digspot
    x4346_6 = {6, 0x4346}; x4346_6 = locFlag(x4346_6); if canGwarhar() and canFirebrand() and canThunderhand() then canrGwarhar = canrGwarhar + flip(x4346_6) end; sumrGwarhar = sumrGwarhar - x4346_6 --Gwarhar Lagoon Green Pearl Bean
    x4346_7 = {7, 0x4346}; x4346_7 = locFlag(x4346_7); if canGwarhar() and canFirebrand() and canThunderhand() then canrGwarhar = canrGwarhar + flip(x4346_7) end; sumrGwarhar = sumrGwarhar - x4346_7 --Gwarhar Lagoon Red Pearl Bean
    x458B_4 = {4, 0x458B}; x458B_4 = locFlag(x458B_4); if canGwarharDeep() then canrGwarhar = canrGwarhar + flip(x458B_4) end; sumrGwarhar = sumrGwarhar - x458B_4 --Gwarhar Lagoon East of Stone Bridge Block
    if optionDigspots() >= 1 then x458A_6 = {6, 0x458A}; x458A_6 = locFlag(x458A_6); if canGwarharDeep() and canDig() then canrGwarhar = canrGwarhar + flip(x458A_6) end; sumrGwarhar = sumrGwarhar - x458A_6 end --Gwarhar Lagoon Entrance to West Underwater Area Digspot
    if optionDigspots() >= 1 then x458A_7 = {7, 0x458A}; x458A_7 = locFlag(x458A_7); if canGwarharDeep() and canDig() then canrGwarhar = canrGwarhar + flip(x458A_7) end; sumrGwarhar = sumrGwarhar - x458A_7 end --Gwarhar Lagoon Fire Dash Puzzle Room 1 Digspot 1
    if optionDigspots() == 2 then x458B_0 = {0, 0x458B}; x458B_0 = locFlag(x458B_0); if canGwarharDeep() and canDig() then canrGwarhar = canrGwarhar + flip(x458B_0) end; sumrGwarhar = sumrGwarhar - x458B_0 end --Gwarhar Lagoon Fire Dash Puzzle Room 1 Digspot 2
    if optionDigspots() >= 1 then x458B_1 = {1, 0x458B}; x458B_1 = locFlag(x458B_1); if canGwarharDeep() and canDig() then canrGwarhar = canrGwarhar + flip(x458B_1) end; sumrGwarhar = sumrGwarhar - x458B_1 end --Gwarhar Lagoon Fire Dash Puzzle Room 2 Digspot
    if optionDigspots() >= 1 then x458B_2 = {2, 0x458B}; x458B_2 = locFlag(x458B_2); if canGwarharDeep() and canDig() then canrGwarhar = canrGwarhar + flip(x458B_2) end; sumrGwarhar = sumrGwarhar - x458B_2 end --Gwarhar Lagoon Fire Dash Puzzle Room 3 Digspot 1
    if optionDigspots() == 2 then x458B_3 = {3, 0x458B}; x458B_3 = locFlag(x458B_3); if canGwarharDeep() and canDig() then canrGwarhar = canrGwarhar + flip(x458B_3) end; sumrGwarhar = sumrGwarhar - x458B_3 end --Gwarhar Lagoon Fire Dash Puzzle Room 3 Digspot 2
    if optionDigspots() >= 1 then x458B_5 = {5, 0x458B}; x458B_5 = locFlag(x458B_5); if canGwarharDeep() and canDig() then canrGwarhar = canrGwarhar + flip(x458B_5) end; sumrGwarhar = sumrGwarhar - x458B_5 end --Gwarhar Lagoon North of Spangle Room Digspot
    if optionDigspots() >= 1 then x458A_5 = {5, 0x458A}; x458A_5 = locFlag(x458A_5); if canGwarharDeep() and canDig() and canCrash() then canrGwarhar = canrGwarhar + flip(x458A_5) end; sumrGwarhar = sumrGwarhar - x458A_5 end --Gwarhar Lagoon Past Hermie Digspot
    x458D_2 = {2, 0x458D}; x458D_2 = locFlag(x458D_2); if canGwarharDeep() then canrGwarhar = canrGwarhar + flip(x458D_2) end; sumrGwarhar = sumrGwarhar - x458D_2 --Gwarhar Lagoon Second Underwater Area Room 1 Block
    if optionDigspots() >= 1 then x458C_5 = {5, 0x458C}; x458C_5 = locFlag(x458C_5); if canGwarharDeep() and canDig() then canrGwarhar = canrGwarhar + flip(x458C_5) end; sumrGwarhar = sumrGwarhar - x458C_5 end --Gwarhar Lagoon Second Underwater Area Room 2 Digspot 1
    if optionDigspots() == 2 then x458C_6 = {6, 0x458C}; x458C_6 = locFlag(x458C_6); if canGwarharDeep() and canDig() then canrGwarhar = canrGwarhar + flip(x458C_6) end; sumrGwarhar = sumrGwarhar - x458C_6 end --Gwarhar Lagoon Second Underwater Area Room 2 Digspot 2
    x458C_7 = {7, 0x458C}; x458C_7 = locFlag(x458C_7); if canGwarharDeep() then canrGwarhar = canrGwarhar + flip(x458C_7) end; sumrGwarhar = sumrGwarhar - x458C_7 --Gwarhar Lagoon Second Underwater Area Room 3 Block 1
    x458D_0 = {0, 0x458D}; x458D_0 = locFlag(x458D_0); if canGwarharDeep() then canrGwarhar = canrGwarhar + flip(x458D_0) end; sumrGwarhar = sumrGwarhar - x458D_0 --Gwarhar Lagoon Second Underwater Area Room 3 Block 2
    x458D_1 = {1, 0x458D}; x458D_1 = locFlag(x458D_1); if canGwarharDeep() then canrGwarhar = canrGwarhar + flip(x458D_1) end; sumrGwarhar = sumrGwarhar - x458D_1 --Gwarhar Lagoon Second Underwater Area Room 3 Block 3
    if optionDigspots() == 2 then x458C_4 = {4, 0x458C}; x458C_4 = locFlag(x458C_4); if canGwarharDeep() and canDig() then canrGwarhar = canrGwarhar + flip(x458C_4) end; sumrGwarhar = sumrGwarhar - x458C_4 end --Gwarhar Lagoon Second Underwater Area Room 4 Digspot
    x434A_6 = {6, 0x434A}; x434A_6 = locFlag(x434A_6); if canGwarharDeep() and has("Hammers3") then canrGwarhar = canrGwarhar + flip(x434A_6) end; sumrGwarhar = sumrGwarhar - x434A_6 --Gwarhar Lagoon Spangle
    x434A_7 = {7, 0x434A}; x434A_7 = locFlag(x434A_7); if canGwarharDeep() and canCrash() and has("Spangle") then canrGwarhar = canrGwarhar + flip(x434A_7) end; sumrGwarhar = sumrGwarhar - x434A_7 --Gwarhar Lagoon Spangle Reward
    x458B_7 = {7, 0x458B}; x458B_7 = locFlag(x458B_7); if canGwarharDeep() and has("Hammers3") then canrGwarhar = canrGwarhar + flip(x458B_7) end; sumrGwarhar = sumrGwarhar - x458B_7 --Gwarhar Lagoon Spangle Room Block
    if optionDigspots() >= 1 then x458B_6 = {6, 0x458B}; x458B_6 = locFlag(x458B_6); if canGwarharDeep() and canDig() then canrGwarhar = canrGwarhar + flip(x458B_6) end; sumrGwarhar = sumrGwarhar - x458B_6 end --Gwarhar Lagoon West of Spangle Room Digspot
    if optionHarhall() then x434D_3 = {3, 0x434D}; x434D_3 = locFlag(x434D_3); if canCrash() then canrOutskirts = canrOutskirts + flip(x434D_3) end; sumrOutskirts = sumrOutskirts - x434D_3 end --Harhall's Pants
    if optionCoins() then x4570_7 = {7, 0x4570}; x4570_7 = locFlag(x4570_7); if canCrash() or has("Hammers2") then canrHoohoo = canrHoohoo + flip(x4570_7) end; sumrHoohoo = sumrHoohoo - x4570_7 end --Hoohoo Mountain Base Boo Statue Cave Coin Block 1
    if optionCoins() then x4571_1 = {1, 0x4571}; x4571_1 = locFlag(x4571_1); if canCrash() or has("Hammers2") then canrHoohoo = canrHoohoo + flip(x4571_1) end; sumrHoohoo = sumrHoohoo - x4571_1 end --Hoohoo Mountain Base Boo Statue Cave Coin Block 2
    if optionCoins() then x4571_2 = {2, 0x4571}; x4571_2 = locFlag(x4571_2); if canCrash() or has("Hammers2") then canrHoohoo = canrHoohoo + flip(x4571_2) end; sumrHoohoo = sumrHoohoo - x4571_2 end --Hoohoo Mountain Base Boo Statue Cave Coin Block 3
    x456D_7 = {7, 0x456D}; x456D_7 = locFlag(x456D_7); canrHoohoo = canrHoohoo + flip(x456D_7); sumrHoohoo = sumrHoohoo - x456D_7 --Hoohoo Mountain Base Boostatue Room Block 1
    x456E_0 = {0, 0x456E}; x456E_0 = locFlag(x456E_0); if canCrash() or has("Hammers2") then canrHoohoo = canrHoohoo + flip(x456E_0) end; sumrHoohoo = sumrHoohoo - x456E_0 --Hoohoo Mountain Base Boostatue Room Block 2
    if optionDigspots() >= 1 then x456E_1 = {1, 0x456E}; x456E_1 = locFlag(x456E_1); if canDig() then canrHoohoo = canrHoohoo + flip(x456E_1) end; sumrHoohoo = sumrHoohoo - x456E_1 end --Hoohoo Mountain Base Boostatue Room Digspot 1
    if optionDigspots() >= 1 then x456E_2 = {2, 0x456E}; x456E_2 = locFlag(x456E_2); if canDig() and (canCrash() or has("Hammers2")) then canrHoohoo = canrHoohoo + flip(x456E_2) end; sumrHoohoo = sumrHoohoo - x456E_2 end --Hoohoo Mountain Base Boostatue Room Digspot 2
    if optionDigspots() == 2 then x456E_3 = {3, 0x456E}; x456E_3 = locFlag(x456E_3); if has("Hammers3") and canDig() then canrHoohoo = canrHoohoo + flip(x456E_3) end; sumrHoohoo = sumrHoohoo - x456E_3 end --Hoohoo Mountain Base Boostatue Room Digspot 3 (Right Side)
    x456D_2 = {2, 0x456D}; x456D_2 = locFlag(x456D_2); canrHoohoo = canrHoohoo + flip(x456D_2); sumrHoohoo = sumrHoohoo - x456D_2 --Hoohoo Mountain Base Bridge Room Block 1
    x456D_3 = {3, 0x456D}; x456D_3 = locFlag(x456D_3); canrHoohoo = canrHoohoo + flip(x456D_3); sumrHoohoo = sumrHoohoo - x456D_3 --Hoohoo Mountain Base Bridge Room Block 2
    x456D_4 = {4, 0x456D}; x456D_4 = locFlag(x456D_4); canrHoohoo = canrHoohoo + flip(x456D_4); sumrHoohoo = sumrHoohoo - x456D_4 --Hoohoo Mountain Base Bridge Room Block 3
    x456D_5 = {5, 0x456D}; x456D_5 = locFlag(x456D_5); canrHoohoo = canrHoohoo + flip(x456D_5); sumrHoohoo = sumrHoohoo - x456D_5 --Hoohoo Mountain Base Bridge Room Block 4
    if optionDigspots() >= 1 then x456D_6 = {6, 0x456D}; x456D_6 = locFlag(x456D_6); if canDig() then canrHoohoo = canrHoohoo + flip(x456D_6) end; sumrHoohoo = sumrHoohoo - x456D_6 end --Hoohoo Mountain Base Bridge Room Digspot
    x456E_5 = {5, 0x456E}; x456E_5 = locFlag(x456E_5); canrHoohoo = canrHoohoo + flip(x456E_5); sumrHoohoo = sumrHoohoo - x456E_5 --Hoohoo Mountain Base Grassy Area Block 1
    x456E_4 = {4, 0x456E}; x456E_4 = locFlag(x456E_4); canrHoohoo = canrHoohoo + flip(x456E_4); sumrHoohoo = sumrHoohoo - x456E_4 --Hoohoo Mountain Base Grassy Area Block 2
    if optionDigspots() >= 1 then x456E_6 = {6, 0x456E}; x456E_6 = locFlag(x456E_6); if has("Hammers3") and canDig() then canrHoohoo = canrHoohoo + flip(x456E_6) end; sumrHoohoo = sumrHoohoo - x456E_6 end --Hoohoo Mountain Base Guffawha Ruins Entrance Digspot
    if optionMinecart() and optionDigspots() == 2 then x4571_4 = {4, 0x4571}; x4571_4 = locFlag(x4571_4); if canDig() then canrHoohoo = canrHoohoo + flip(x4571_4) end; sumrHoohoo = sumrHoohoo - x4571_4 end --Hoohoo Mountain Base Minecart Cave Digspot
    x4373_4 = {4, 0x4373}; x4373_4 = locFlag(x4373_4); if has("Hammers3") then canrHoohoo = canrHoohoo + flip(x4373_4) end; sumrHoohoo = sumrHoohoo - x4373_4 --Hoohoo Mountain Base Mole Near Teehee Valley
    x456F_2 = {2, 0x456F}; x456F_2 = locFlag(x456F_2); canrHoohoo = canrHoohoo + flip(x456F_2); sumrHoohoo = sumrHoohoo - x456F_2 --Hoohoo Mountain Base Past Minecart Minigame Block 1
    x456F_1 = {1, 0x456F}; x456F_1 = locFlag(x456F_1); canrHoohoo = canrHoohoo + flip(x456F_1); sumrHoohoo = sumrHoohoo - x456F_1 --Hoohoo Mountain Base Past Minecart Minigame Block 2
    x456F_3 = {3, 0x456F}; x456F_3 = locFlag(x456F_3); if has("Hammers3") then canrHoohoo = canrHoohoo + flip(x456F_3) end; sumrHoohoo = sumrHoohoo - x456F_3 --Hoohoo Mountain Base Past Ultra Hammer Rocks Block 1
    x456F_4 = {4, 0x456F}; x456F_4 = locFlag(x456F_4); if has("Hammers3") then canrHoohoo = canrHoohoo + flip(x456F_4) end; sumrHoohoo = sumrHoohoo - x456F_4 --Hoohoo Mountain Base Past Ultra Hammer Rocks Block 2
    x456F_5 = {5, 0x456F}; x456F_5 = locFlag(x456F_5); if has("Hammers3") then canrHoohoo = canrHoohoo + flip(x456F_5) end; sumrHoohoo = sumrHoohoo - x456F_5 --Hoohoo Mountain Base Past Ultra Hammer Rocks Block 3
    x456C_1 = {1, 0x456C}; x456C_1 = locFlag(x456C_1); canrHoohoo = canrHoohoo + flip(x456C_1); sumrHoohoo = sumrHoohoo - x456C_1 --Hoohoo Mountain Base Room 1 Block
    if optionDigspots() >= 1 then x456C_2 = {2, 0x456C}; x456C_2 = locFlag(x456C_2); if canDig() then canrHoohoo = canrHoohoo + flip(x456C_2) end; sumrHoohoo = sumrHoohoo - x456C_2 end --Hoohoo Mountain Base Room 1 Digspot
    x456E_7 = {7, 0x456E}; x456E_7 = locFlag(x456E_7); if has("Hammers3") then canrHoohoo = canrHoohoo + flip(x456E_7) end; sumrHoohoo = sumrHoohoo - x456E_7 --Hoohoo Mountain Base Teehee Valley Entrance Block
    if optionDigspots() >= 1 then x456F_0 = {0, 0x456F}; x456F_0 = locFlag(x456F_0); if has("Hammers3") and canDig() then canrHoohoo = canrHoohoo + flip(x456F_0) end; sumrHoohoo = sumrHoohoo - x456F_0 end --Hoohoo Mountain Base Teehee Valley Entrance Digspot
    x456A_7 = {7, 0x456A}; x456A_7 = locFlag(x456A_7); canrHoohoo = canrHoohoo + flip(x456A_7); sumrHoohoo = sumrHoohoo - x456A_7 --Hoohoo Mountain Before Hoohooros Block
    if optionCoins() then x456B_0 = {0, 0x456B}; x456B_0 = locFlag(x456B_0); canrHoohoo = canrHoohoo + flip(x456B_0); sumrHoohoo = sumrHoohoo - x456B_0 end --Hoohoo Mountain Before Hoohooros Coin Block
    if optionDigspots() >= 1 then x456B_1 = {1, 0x456B}; x456B_1 = locFlag(x456B_1); if canDig() then canrHoohoo = canrHoohoo + flip(x456B_1) end; sumrHoohoo = sumrHoohoo - x456B_1 end --Hoohoo Mountain Before Hoohooros Digspot
    x4597_3 = {3, 0x4597}; x4597_3 = locFlag(x4597_3); canrHoohoo = canrHoohoo + flip(x4597_3); sumrHoohoo = sumrHoohoo - x4597_3 --Hoohoo Mountain Fountain Room 2 Block
    if optionDigspots() >= 1 then x4597_4 = {4, 0x4597}; x4597_4 = locFlag(x4597_4); if canDig() then canrHoohoo = canrHoohoo + flip(x4597_4) end; sumrHoohoo = sumrHoohoo - x4597_4 end --Hoohoo Mountain Fountain Room 2 Digspot
    x456B_2 = {2, 0x456B}; x456B_2 = locFlag(x456B_2); canrHoohoo = canrHoohoo + flip(x456B_2); sumrHoohoo = sumrHoohoo - x456B_2 --Hoohoo Mountain Fountain Room Block 1
    x456B_3 = {3, 0x456B}; x456B_3 = locFlag(x456B_3); canrHoohoo = canrHoohoo + flip(x456B_3); sumrHoohoo = sumrHoohoo - x456B_3 --Hoohoo Mountain Fountain Room Block 2
    x456B_6 = {6, 0x456B}; x456B_6 = locFlag(x456B_6); canrHoohoo = canrHoohoo + flip(x456B_6); sumrHoohoo = sumrHoohoo - x456B_6 --Hoohoo Mountain Room 1 Block 1
    x456B_7 = {7, 0x456B}; x456B_7 = locFlag(x456B_7); canrHoohoo = canrHoohoo + flip(x456B_7); sumrHoohoo = sumrHoohoo - x456B_7 --Hoohoo Mountain Room 1 Block 2
    x456C_0 = {0, 0x456C}; x456C_0 = locFlag(x456C_0); canrHoohoo = canrHoohoo + flip(x456C_0); sumrHoohoo = sumrHoohoo - x456C_0 --Hoohoo Mountain Room 1 Block 3
    if optionDigspots() >= 1 then x456B_4 = {4, 0x456B}; x456B_4 = locFlag(x456B_4); if canDig() then canrHoohoo = canrHoohoo + flip(x456B_4) end; sumrHoohoo = sumrHoohoo - x456B_4 end --Hoohoo Mountain Room 2 Digspot 1
    if optionDigspots() == 2 then x456B_5 = {5, 0x456B}; x456B_5 = locFlag(x456B_5); if canDig() then canrHoohoo = canrHoohoo + flip(x456B_5) end; sumrHoohoo = sumrHoohoo - x456B_5 end --Hoohoo Mountain Room 2 Digspot 2
    if optionDigspots() >= 1 then x456A_5 = {5, 0x456A}; x456A_5 = locFlag(x456A_5); if canDig() then canrHoohoo = canrHoohoo + flip(x456A_5) end; sumrHoohoo = sumrHoohoo - x456A_5 end --Hoohoo Mountain Hoohooros Room Digspot 1
    x456A_3 = {3, 0x456A}; x456A_3 = locFlag(x456A_3); if optionEnemies() == false or (optionEnemies() and has("Hammers1")) then canrHoohoo = canrHoohoo + flip(x456A_3) end; sumrHoohoo = sumrHoohoo - x456A_3 --Hoohoo Mountain Hoohooros Room Block 1
    x456A_4 = {4, 0x456A}; x456A_4 = locFlag(x456A_4); if optionEnemies() == false or (optionEnemies() and has("Hammers1")) then canrHoohoo = canrHoohoo + flip(x456A_4) end; sumrHoohoo = sumrHoohoo - x456A_4 --Hoohoo Mountain Hoohooros Room Block 2
    if optionDigspots() == 2 then x456A_6 = {6, 0x456A}; x456A_6 = locFlag(x456A_6); if canDig() then canrHoohoo = canrHoohoo + flip(x456A_6) end; sumrHoohoo = sumrHoohoo - x456A_6 end --Hoohoo Mountain Hoohooros Room Digspot 2
    x456A_0 = {0, 0x456A}; x456A_0 = locFlag(x456A_0); if optionEnemies() == false or (optionEnemies() and has("Hammers1")) then canrHoohoo = canrHoohoo + flip(x456A_0) end; sumrHoohoo = sumrHoohoo - x456A_0 --Hoohoo Mountain Past Hoohooros Block 1
    x456A_2 = {2, 0x456A}; x456A_2 = locFlag(x456A_2); if optionEnemies() == false or (optionEnemies() and has("Hammers1")) then canrHoohoo = canrHoohoo + flip(x456A_2) end; sumrHoohoo = sumrHoohoo - x456A_2 --Hoohoo Mountain Past Hoohooros Block 2
    x4597_6 = {6, 0x4597}; x4597_6 = locFlag(x4597_6); if optionEnemies() == false or (optionEnemies() and has("Hammers1")) then canrHoohoo = canrHoohoo + flip(x4597_6) end; sumrHoohoo = sumrHoohoo - x4597_6 --Hoohoo Mountain Past Hoohooros Connector Room Block
    if optionDigspots() >= 1 then x4597_5 = {5, 0x4597}; x4597_5 = locFlag(x4597_5); if canDig() then canrHoohoo = canrHoohoo + flip(x4597_5) end; sumrHoohoo = sumrHoohoo - x4597_5 end --Hoohoo Mountain Past Hoohooros Connector Room Digspot 1
    if optionDigspots() == 2 then x4597_7 = {7, 0x4597}; x4597_7 = locFlag(x4597_7); if canDig() then canrHoohoo = canrHoohoo + flip(x4597_7) end; sumrHoohoo = sumrHoohoo - x4597_7 end --Hoohoo Mountain Past Hoohooros Connector Room Digspot 2
    if optionDigspots() >= 1 then x456A_1 = {1, 0x456A}; x456A_1 = locFlag(x456A_1); if canDig() then canrHoohoo = canrHoohoo + flip(x456A_1) end; sumrHoohoo = sumrHoohoo - x456A_1 end --Hoohoo Mountain Past Hoohooros Digspot
    x4569_5 = {5, 0x4569}; x4569_5 = locFlag(x4569_5); if optionEnemies() == false or (optionEnemies() and has("Hammers1")) then canrHoohoo = canrHoohoo + flip(x4569_5) end; sumrHoohoo = sumrHoohoo - x4569_5 --Hoohoo Mountain Below Summit Block 1
    x4569_6 = {6, 0x4569}; x4569_6 = locFlag(x4569_6); if optionEnemies() == false or (optionEnemies() and has("Hammers1")) then canrHoohoo = canrHoohoo + flip(x4569_6) end; sumrHoohoo = sumrHoohoo - x4569_6 --Hoohoo Mountain Below Summit Block 2
    x4569_7 = {7, 0x4569}; x4569_7 = locFlag(x4569_7); if optionEnemies() == false or (optionEnemies() and has("Hammers1")) then canrHoohoo = canrHoohoo + flip(x4569_7) end; sumrHoohoo = sumrHoohoo - x4569_7 --Hoohoo Mountain Below Summit Block 3
    if optionDigspots() >= 1 then x4569_4 = {4, 0x4569}; x4569_4 = locFlag(x4569_4); if canDig() then canrHoohoo = canrHoohoo + flip(x4569_4) end; sumrHoohoo = sumrHoohoo - x4569_4 end --Hoohoo Mountain Below Summit Digspot
    if optionDigspots() >= 1 then x4569_3 = {3, 0x4569}; x4569_3 = locFlag(x4569_3); if canDig() then canrHoohoo = canrHoohoo + flip(x4569_3) end; sumrHoohoo = sumrHoohoo - x4569_3 end --Hoohoo Mountain Summit Digspot
    x42F9_1 = {1, 0x42F9}; x42F9_1 = locFlag(x42F9_1); if optionEnemies() == false or (optionEnemies() and has("Hammers1")) then canrHoohoo = canrHoohoo + flip(x42F9_1) end; sumrHoohoo = sumrHoohoo - x42F9_1 --Hoohoo Mountain Peasley's Rose
    x42F9_2 = {2, 0x42F9}; x42F9_2 = locFlag(x42F9_2); if optionEnemies() == false or (optionEnemies() and has("Hammers1")) then canrHoohoo = canrHoohoo + flip(x42F9_2) end; sumrHoohoo = sumrHoohoo - x42F9_2 --Hoohoo Village Hammers
    x456C_5 = {5, 0x456C}; x456C_5 = locFlag(x456C_5); canrHoohoo = canrHoohoo + flip(x456C_5); sumrHoohoo = sumrHoohoo - x456C_5 --Hoohoo Village Bridge Room Block 1
    x456C_7 = {7, 0x456C}; x456C_7 = locFlag(x456C_7); canrHoohoo = canrHoohoo + flip(x456C_7); sumrHoohoo = sumrHoohoo - x456C_7 --Hoohoo Village Bridge Room Block 2
    x456D_1 = {1, 0x456D}; x456D_1 = locFlag(x456D_1); canrHoohoo = canrHoohoo + flip(x456D_1); sumrHoohoo = sumrHoohoo - x456D_1 --Hoohoo Village Bridge Room Block 3
    if optionCoins() then x456C_6 = {6, 0x456C}; x456C_6 = locFlag(x456C_6); canrHoohoo = canrHoohoo + flip(x456C_6); sumrHoohoo = sumrHoohoo - x456C_6 end --Hoohoo Village Bridge Room Coin Block 1
    if optionCoins() then x456D_0 = {0, 0x456D}; x456D_0 = locFlag(x456D_0); canrHoohoo = canrHoohoo + flip(x456D_0); sumrHoohoo = sumrHoohoo - x456D_0 end --Hoohoo Village Bridge Room Coin Block 2
    x456C_3 = {3, 0x456C}; x456C_3 = locFlag(x456C_3); canrHoohoo = canrHoohoo + flip(x456C_3); sumrHoohoo = sumrHoohoo - x456C_3 --Hoohoo Village Eastside Block
    if optionDigspots() >= 1 then x456C_4 = {4, 0x456C}; x456C_4 = locFlag(x456C_4); if canDig() then canrHoohoo = canrHoohoo + flip(x456C_4) end; sumrHoohoo = sumrHoohoo - x456C_4 end --Hoohoo Village Eastside Digspot
    x4566_2 = {2, 0x4566}; x4566_2 = locFlag(x4566_2); if has("Hammers1") then canrHoohoo = canrHoohoo + flip(x4566_2) end; sumrHoohoo = sumrHoohoo - x4566_2 --Hoohoo Village Hammer House Block
    x4373_5 = {5, 0x4373}; x4373_5 = locFlag(x4373_5); if canDash() then canrHoohoo = canrHoohoo + flip(x4373_5) end; sumrHoohoo = sumrHoohoo - x4373_5 --Hoohoo Village Mole Behind Turtle
    x4570_0 = {0, 0x4570}; x4570_0 = locFlag(x4570_0); canrHoohoo = canrHoohoo + flip(x4570_0); sumrHoohoo = sumrHoohoo - x4570_0 --Hoohoo Village North Cave Room 1 Block
    if optionCoins() then x4570_1 = {1, 0x4570}; x4570_1 = locFlag(x4570_1); canrHoohoo = canrHoohoo + flip(x4570_1); sumrHoohoo = sumrHoohoo - x4570_1 end --Hoohoo Village North Cave Room 1 Coin Block
    x4570_2 = {2, 0x4570}; x4570_2 = locFlag(x4570_2); canrHoohoo = canrHoohoo + flip(x4570_2); sumrHoohoo = sumrHoohoo - x4570_2 --Hoohoo Village North Cave Room 2 Block
    if optionDigspots() == 2 then x4570_3 = {3, 0x4570}; x4570_3 = locFlag(x4570_3); if canDig() then canrHoohoo = canrHoohoo + flip(x4570_3) end; sumrHoohoo = sumrHoohoo - x4570_3 end --Hoohoo Village North Cave Room 2 Digspot
    x4570_5 = {5, 0x4570}; x4570_5 = locFlag(x4570_5); canrHoohoo = canrHoohoo + flip(x4570_5); sumrHoohoo = sumrHoohoo - x4570_5 --Hoohoo Village South Cave Block
    if optionCoins() then x4570_4 = {4, 0x4570}; x4570_4 = locFlag(x4570_4); canrHoohoo = canrHoohoo + flip(x4570_4); sumrHoohoo = sumrHoohoo - x4570_4 end --Hoohoo Village South Cave Coin Block 1
    if optionCoins() then x4570_6 = {6, 0x4570}; x4570_6 = locFlag(x4570_6); canrHoohoo = canrHoohoo + flip(x4570_6); sumrHoohoo = sumrHoohoo - x4570_6 end --Hoohoo Village South Cave Coin Block 2
    x4571_0 = {0, 0x4571}; x4571_0 = locFlag(x4571_0); if canCrash() or has("Hammers2") then canrHoohoo = canrHoohoo + flip(x4571_0) end; sumrHoohoo = sumrHoohoo - x4571_0 --Hoohoo Village Super Hammer Cave Block
    if optionDigspots() == 2 then x4571_3 = {3, 0x4571}; x4571_3 = locFlag(x4571_3); if canDig() and (canCrash() or has("Hammers2")) then canrHoohoo = canrHoohoo + flip(x4571_3) end; sumrHoohoo = sumrHoohoo - x4571_3 end --Hoohoo Village Super Hammer Cave Digspot
    if optionDigspots() >= 1 then x4592_6 = {6, 0x4592}; x4592_6 = locFlag(x4592_6); if canJokes() and canDig() then canrJokes = canrJokes + flip(x4592_6) end; sumrJokes = sumrJokes - x4592_6 end --Joke's End First Boiler Room Digspot 1
    if optionDigspots() == 2 then x4592_7 = {7, 0x4592}; x4592_7 = locFlag(x4592_7); if canJokes() and canDig() then canrJokes = canrJokes + flip(x4592_7) end; sumrJokes = sumrJokes - x4592_7 end --Joke's End First Boiler Room Digspot 2
    if optionDigspots() == 2 then x4592_2 = {2, 0x4592}; x4592_2 = locFlag(x4592_2); if canSurf() and canDig() then canrJokes = canrJokes + flip(x4592_2) end; sumrJokes = sumrJokes - x4592_2 end --Joke's End Pipe Digspot
    x4593_0 = {0, 0x4593}; x4593_0 = locFlag(x4593_0); if canJokes() and optionHardLogic() then canrJokes = canrJokes + flip(x4593_0) end; sumrJokes = sumrJokes - x4593_0 --Joke's End Furnace Room 1 Block 1
    x4593_1 = {1, 0x4593}; x4593_1 = locFlag(x4593_1); if canJokes() and optionHardLogic() then canrJokes = canrJokes + flip(x4593_1) end; sumrJokes = sumrJokes - x4593_1 --Joke's End Furnace Room 1 Block 2
    x4593_2 = {2, 0x4593}; x4593_2 = locFlag(x4593_2); if canJokes() and optionHardLogic() then canrJokes = canrJokes + flip(x4593_2) end; sumrJokes = sumrJokes - x4593_2 --Joke's End Furnace Room 1 Block 3
    x4593_3 = {3, 0x4593}; x4593_3 = locFlag(x4593_3); if canJokes() and optionHardLogic() then canrJokes = canrJokes + flip(x4593_3) end; sumrJokes = sumrJokes - x4593_3 --Joke's End Northeast of Boiler Room 1 Block
    x4593_5 = {5, 0x4593}; x4593_5 = locFlag(x4593_5); if canJokes() and optionHardLogic() then canrJokes = canrJokes + flip(x4593_5) end; sumrJokes = sumrJokes - x4593_5 --Joke's End Northeast of Boiler Room 2 Block
    if optionDigspots() == 2 then x4592_3 = {3, 0x4592}; x4592_3 = locFlag(x4592_3); if canSurf() and canDig() then canrJokes = canrJokes + flip(x4592_3) end; sumrJokes = sumrJokes - x4592_3 end --Joke's End Staircase Digspot
    x4372_7 = {7, 0x4372}; x4372_7 = locFlag(x4372_7); if canJokes() then canrJokes = canrJokes + flip(x4372_7) end; sumrJokes = sumrJokes - x4372_7 --Joke's End Mole Reward 1
    x4372_7 = {7, 0x4372}; x4372_7 = locFlag(x4372_7); if canJokes() then canrJokes = canrJokes + flip(x4372_7) end; sumrJokes = sumrJokes - x4372_7 --Joke's End Mole Reward 2
    x4593_7 = {7, 0x4593}; x4593_7 = locFlag(x4593_7); if canJokes() then canrJokes = canrJokes + flip(x4593_7) end; sumrJokes = sumrJokes - x4593_7 --Joke's End Second Floor West Room Block 1
    x4594_0 = {0, 0x4594}; x4594_0 = locFlag(x4594_0); if canJokes() then canrJokes = canrJokes + flip(x4594_0) end; sumrJokes = sumrJokes - x4594_0 --Joke's End Second Floor West Room Block 2
    x4594_2 = {2, 0x4594}; x4594_2 = locFlag(x4594_2); if canJokes() then canrJokes = canrJokes + flip(x4594_2) end; sumrJokes = sumrJokes - x4594_2 --Joke's End Second Floor West Room Block 3
    x4594_3 = {3, 0x4594}; x4594_3 = locFlag(x4594_3); if canJokes() then canrJokes = canrJokes + flip(x4594_3) end; sumrJokes = sumrJokes - x4594_3 --Joke's End Second Floor West Room Block 4
    if optionCoins() then x4594_1 = {1, 0x4594}; x4594_1 = locFlag(x4594_1); if canJokes() then canrJokes = canrJokes + flip(x4594_1) end; sumrJokes = sumrJokes - x4594_1 end --Joke's End Second Floor West Room Coin Block
    x4592_4 = {4, 0x4592}; x4592_4 = locFlag(x4592_4); if canJokes() then canrJokes = canrJokes + flip(x4592_4) end; sumrJokes = sumrJokes - x4592_4 --Joke's End West of First Boiler Room Block 1
    x4592_5 = {5, 0x4592}; x4592_5 = locFlag(x4592_5); if canJokes() then canrJokes = canrJokes + flip(x4592_5) end; sumrJokes = sumrJokes - x4592_5 --Joke's End West of First Boiler Room Block 2
    if optionDigspots() >= 1 then x4593_6 = {6, 0x4593}; x4593_6 = locFlag(x4593_6); if canJokesDeep() then canrJokes = canrJokes + flip(x4593_6) end; sumrJokes = sumrJokes - x4593_6 end --Joke's End Northeast of Boiler Room 2 Digspot
    if optionDigspots() >= 1 then x4593_4 = {4, 0x4593}; x4593_4 = locFlag(x4593_4); if canJokesDeep() then canrJokes = canrJokes + flip(x4593_4) end; sumrJokes = sumrJokes - x4593_4 end --Joke's End Northeast of Boiler Room 3 Digspot
    x4598_0 = {0, 0x4598}; x4598_0 = locFlag(x4598_0); if canJokesDeep() then canrJokes = canrJokes + flip(x4598_0) end; sumrJokes = sumrJokes - x4598_0 --Joke's End Before Jojora Room Block 1
    x4598_1 = {1, 0x4598}; x4598_1 = locFlag(x4598_1); if canJokesDeep() then canrJokes = canrJokes + flip(x4598_1) end; sumrJokes = sumrJokes - x4598_1 --Joke's End Before Jojora Room Block 2
    if optionDigspots() >= 1 then x4598_2 = {2, 0x4598}; x4598_2 = locFlag(x4598_2); if canJokesDeep() then canrJokes = canrJokes + flip(x4598_2) end; sumrJokes = sumrJokes - x4598_2 end --Joke's End Before Jojora Room Digspot
    if optionDigspots() >= 1 then x4594_5 = {5, 0x4594}; x4594_5 = locFlag(x4594_5); if canJokesDeep() then canrJokes = canrJokes + flip(x4594_5) end; sumrJokes = sumrJokes - x4594_5 end --Joke's End Final Split up Room Digspot
    if optionDigspots() == 2 then x4598_3 = {3, 0x4598}; x4598_3 = locFlag(x4598_3); if canJokesDeep() and has("RedPearlBean") then canrJokes = canrJokes + flip(x4598_3) end; sumrJokes = sumrJokes - x4598_3 end --Joke's End Jojora Room Digspot
    if optionCoins() then x4596_1 = {1, 0x4596}; x4596_1 = locFlag(x4596_1); if canJokesDeep() then canrJokes = canrJokes + flip(x4596_1) end; sumrJokes = sumrJokes - x4596_1 end --Joke's End North of Bridge Room Coin Block
    x4596_4 = {4, 0x4596}; x4596_4 = locFlag(x4596_4); if canJokesDeep() then canrJokes = canrJokes + flip(x4596_4) end; sumrJokes = sumrJokes - x4596_4 --Joke's End North of Second Boiler Room Block 1
    x4596_5 = {5, 0x4596}; x4596_5 = locFlag(x4596_5); if canJokesDeep() then canrJokes = canrJokes + flip(x4596_5) end; sumrJokes = sumrJokes - x4596_5 --Joke's End North of Second Boiler Room Block 2
    if optionDigspots() >= 1 then x4596_2 = {2, 0x4596}; x4596_2 = locFlag(x4596_2); if canJokesDeep() then canrJokes = canrJokes + flip(x4596_2) end; sumrJokes = sumrJokes - x4596_2 end --Joke's End Second Boiler Room Digspot 1
    if optionDigspots() == 2 then x4596_3 = {3, 0x4596}; x4596_3 = locFlag(x4596_3); if canJokesDeep() then canrJokes = canrJokes + flip(x4596_3) end; sumrJokes = sumrJokes - x4596_3 end --Joke's End Second Boiler Room Digspot 2
    if optionDigspots() >= 1 then x4594_4 = {4, 0x4594}; x4594_4 = locFlag(x4594_4); if canJokesDeep() then canrJokes = canrJokes + flip(x4594_4) end; sumrJokes = sumrJokes - x4594_4 end --Joke's End Second Floor East Room Digspot
    x4594_7 = {7, 0x4594}; x4594_7 = locFlag(x4594_7); if canJokesDeep() then canrJokes = canrJokes + flip(x4594_7) end; sumrJokes = sumrJokes - x4594_7 --Joke's End Solo Luigi Room 1 Block
    if optionDigspots() >= 1 then x4595_0 = {0, 0x4595}; x4595_0 = locFlag(x4595_0); if canJokesDeep() then canrJokes = canrJokes + flip(x4595_0) end; sumrJokes = sumrJokes - x4595_0 end --Joke's End Solo Luigi Room 1 Digspot
    if optionDigspots() >= 1 then x4595_4 = {4, 0x4595}; x4595_4 = locFlag(x4595_4); if canJokesDeep() then canrJokes = canrJokes + flip(x4595_4) end; sumrJokes = sumrJokes - x4595_4 end --Joke's End Solo Luigi Room 2 Digspot
    x4595_1 = {1, 0x4595}; x4595_1 = locFlag(x4595_1); if canJokesDeep() then canrJokes = canrJokes + flip(x4595_1) end; sumrJokes = sumrJokes - x4595_1 --Joke's End Solo Mario Final Room Block 1
    x4595_2 = {2, 0x4595}; x4595_2 = locFlag(x4595_2); if canJokesDeep() then canrJokes = canrJokes + flip(x4595_2) end; sumrJokes = sumrJokes - x4595_2 --Joke's End Solo Mario Final Room Block 2
    x4595_3 = {3, 0x4595}; x4595_3 = locFlag(x4595_3); if canJokesDeep() then canrJokes = canrJokes + flip(x4595_3) end; sumrJokes = sumrJokes - x4595_3 --Joke's End Solo Mario Final Room Block 3
    if optionDigspots() >= 1 then x4595_5 = {5, 0x4595}; x4595_5 = locFlag(x4595_5); if canJokesDeep() then canrJokes = canrJokes + flip(x4595_5) end; sumrJokes = sumrJokes - x4595_5 end --Joke's End Solo Mario Room 1 Digspot
    x4595_6 = {6, 0x4595}; x4595_6 = locFlag(x4595_6); if canJokesDeep() then canrJokes = canrJokes + flip(x4595_6) end; sumrJokes = sumrJokes - x4595_6 --Joke's End Solo Mario Room 2 Block 1
    x4595_7 = {7, 0x4595}; x4595_7 = locFlag(x4595_7); if canJokesDeep() then canrJokes = canrJokes + flip(x4595_7) end; sumrJokes = sumrJokes - x4595_7 --Joke's End Solo Mario Room 2 Block 2
    x4596_0 = {0, 0x4596}; x4596_0 = locFlag(x4596_0); if canJokesDeep() then canrJokes = canrJokes + flip(x4596_0) end; sumrJokes = sumrJokes - x4596_0 --Joke's End Solo Mario Room 2 Block 3
    x4594_6 = {6, 0x4594}; x4594_6 = locFlag(x4594_6); if canJokesDeep() then canrJokes = canrJokes + flip(x4594_6) end; sumrJokes = sumrJokes - x4594_6 --Joke's End South of Bridge Room Block
    x4373_0 = {0, 0x4373}; x4373_0 = locFlag(x4373_0); if canSurf() then canrOasis = canrOasis + flip(x4373_0) end; sumrOasis = sumrOasis - x4373_0 --North Ocean Whirlpool Mole
    x457F_6 = {6, 0x457F}; x457F_6 = locFlag(x457F_6); if canOasis() then canrOasis = canrOasis + flip(x457F_6) end; sumrOasis = sumrOasis - x457F_6 --Oho Oasis Fire Palace Block
    x4345_3 = {3, 0x4345}; x4345_3 = locFlag(x4345_3); if canOasis() and canMini() then canrOasis = canrOasis + flip(x4345_3) end; sumrOasis = sumrOasis - x4345_3 --Oho Oasis Firebrand
    x4345_2 = {2, 0x4345}; x4345_2 = locFlag(x4345_2); if canOasis() and canDig() then canrOasis = canrOasis + flip(x4345_2) end; sumrOasis = sumrOasis - x4345_2 --Oho Oasis Thunderhand
    if optionDigspots() >= 1 then x457F_5 = {5, 0x457F}; x457F_5 = locFlag(x457F_5); if canOasis() and canDig() then canrOasis = canrOasis + flip(x457F_5) end; sumrOasis = sumrOasis - x457F_5 end --Oho Oasis West Digspot
    if optionDigspots() >= 1 then x4581_1 = {1, 0x4581}; x4581_1 = locFlag(x4581_1); if canSurf() and canDig() then canrOasis = canrOasis + flip(x4581_1) end; sumrOasis = sumrOasis - x4581_1 end --Oho Ocean Fire Puzzle Room Digspot
    x4581_6 = {6, 0x4581}; x4581_6 = locFlag(x4581_6); if canSurf() then canrOasis = canrOasis + flip(x4581_6) end; sumrOasis = sumrOasis - x4581_6 --Oho Ocean North Whirlpool Block 1
    x4581_7 = {7, 0x4581}; x4581_7 = locFlag(x4581_7); if canSurf() then canrOasis = canrOasis + flip(x4581_7) end; sumrOasis = sumrOasis - x4581_7 --Oho Ocean North Whirlpool Block 2
    x4582_0 = {0, 0x4582}; x4582_0 = locFlag(x4582_0); if canSurf() then canrOasis = canrOasis + flip(x4582_0) end; sumrOasis = sumrOasis - x4582_0 --Oho Ocean North Whirlpool Block 3
    x4582_1 = {1, 0x4582}; x4582_1 = locFlag(x4582_1); if canSurf() then canrOasis = canrOasis + flip(x4582_1) end; sumrOasis = sumrOasis - x4582_1 --Oho Ocean North Whirlpool Block 4
    if optionDigspots() >= 1 then x4582_2 = {2, 0x4582}; x4582_2 = locFlag(x4582_2); if canSurf() and canDig() then canrOasis = canrOasis + flip(x4582_2) end; sumrOasis = sumrOasis - x4582_2 end --Oho Ocean North Whirlpool Digspot 1
    if optionDigspots() == 2 then x4582_3 = {3, 0x4582}; x4582_3 = locFlag(x4582_3); if canSurf() and canDig() then canrOasis = canrOasis + flip(x4582_3) end; sumrOasis = sumrOasis - x4582_3 end --Oho Ocean North Whirlpool Digspot 2
    x4581_2 = {2, 0x4581}; x4581_2 = locFlag(x4581_2); if canGwarhar() then canrOasis = canrOasis + flip(x4581_2) end; sumrOasis = sumrOasis - x4581_2 --Oho Ocean South Room 1 Block
    if optionDigspots() == 2 then x4581_3 = {3, 0x4581}; x4581_3 = locFlag(x4581_3); if canGwarhar() and canDig() then canrOasis = canrOasis + flip(x4581_3) end; sumrOasis = sumrOasis - x4581_3 end --Oho Ocean South Room 2 Digspot
    if optionDigspots() >= 1 then x4582_4 = {4, 0x4582}; x4582_4 = locFlag(x4582_4); if canSurf() and canDig() then canrOasis = canrOasis + flip(x4582_4) end; sumrOasis = sumrOasis - x4582_4 end --Oho Ocean South Whirlpool Digspot 1
    if optionDigspots() >= 1 then x4582_5 = {5, 0x4582}; x4582_5 = locFlag(x4582_5); if canSurf() and canDig() then canrOasis = canrOasis + flip(x4582_5) end; sumrOasis = sumrOasis - x4582_5 end --Oho Ocean South Whirlpool Digspot 2
    if optionDigspots() >= 1 then x4582_6 = {6, 0x4582}; x4582_6 = locFlag(x4582_6); if canSurf() and canDig() then canrOasis = canrOasis + flip(x4582_6) end; sumrOasis = sumrOasis - x4582_6 end --Oho Ocean South Whirlpool Digspot 3
    if optionDigspots() >= 1 then x4582_7 = {7, 0x4582}; x4582_7 = locFlag(x4582_7); if canSurf() and canDig() then canrOasis = canrOasis + flip(x4582_7) end; sumrOasis = sumrOasis - x4582_7 end --Oho Ocean South Whirlpool Digspot 4
    if optionDigspots() == 2 then x4583_0 = {0, 0x4583}; x4583_0 = locFlag(x4583_0); if canSurf() and canDig() then canrOasis = canrOasis + flip(x4583_0) end; sumrOasis = sumrOasis - x4583_0 end --Oho Ocean South Whirlpool Digspot 5
    if optionDigspots() == 2 then x4583_1 = {1, 0x4583}; x4583_1 = locFlag(x4583_1); if canSurf() and canDig() then canrOasis = canrOasis + flip(x4583_1) end; sumrOasis = sumrOasis - x4583_1 end --Oho Ocean South Whirlpool Digspot 6
    if optionDigspots() >= 1 then x4583_2 = {2, 0x4583}; x4583_2 = locFlag(x4583_2); if canSurf() and canDig() then canrOasis = canrOasis + flip(x4583_2) end; sumrOasis = sumrOasis - x4583_2 end --Oho Ocean South Whirlpool Room 2 Digspot
    if optionDigspots() >= 1 then x4581_4 = {4, 0x4581}; x4581_4 = locFlag(x4581_4); if canOasis() and canDig() then canrOasis = canrOasis + flip(x4581_4) end; sumrOasis = sumrOasis - x4581_4 end --Oho Ocean Spike Room Digspot 1
    if optionDigspots() == 2 then x4581_5 = {5, 0x4581}; x4581_5 = locFlag(x4581_5); if canOasis() and canDig() then canrOasis = canrOasis + flip(x4581_5) end; sumrOasis = sumrOasis - x4581_5 end --Oho Ocean Spike Room Digspot 2
    x4599_6 = {6, 0x4599}; x4599_6 = locFlag(x4599_6); canrOutskirts = canrOutskirts + flip(x4599_6); sumrOutskirts = sumrOutskirts - x4599_6 --Outside Woohoo Hooniversity Block
    if optionCoins() then x4599_5 = {5, 0x4599}; x4599_5 = locFlag(x4599_5); canrOutskirts = canrOutskirts + flip(x4599_5); sumrOutskirts = sumrOutskirts - x4599_5 end --Outside Woohoo Hooniversity Coin Block 1
    if optionCoins() then x4599_7 = {7, 0x4599}; x4599_7 = locFlag(x4599_7); canrOutskirts = canrOutskirts + flip(x4599_7); sumrOutskirts = sumrOutskirts - x4599_7 end --Outside Woohoo Hooniversity Coin Block 2
    if optionCoins() then x459A_0 = {0, 0x459A}; x459A_0 = locFlag(x459A_0); canrOutskirts = canrOutskirts + flip(x459A_0); sumrOutskirts = sumrOutskirts - x459A_0 end --Outside Woohoo Hooniversity Coin Block 3
    x4374_3 = {3, 0x4374}; x4374_3 = locFlag(x4374_3); if canTeehee() then canrTeehee = canrTeehee + flip(x4374_3) end; sumrTeehee = sumrTeehee - x4374_3 --S.S. Chuckola Membership Card
    x4591_1 = {1, 0x4591}; x4591_1 = locFlag(x4591_1); if canTeehee() then canrTeehee = canrTeehee + flip(x4591_1) end; sumrTeehee = sumrTeehee - x4591_1 --S.S. Chuckola Storage Room Block 1
    x4591_4 = {4, 0x4591}; x4591_4 = locFlag(x4591_4); if canTeehee() then canrTeehee = canrTeehee + flip(x4591_4) end; sumrTeehee = sumrTeehee - x4591_4 --S.S. Chuckola Storage Room Block 2
    if optionCoins() then x4591_2 = {2, 0x4591}; x4591_2 = locFlag(x4591_2); if canTeehee() then canrTeehee = canrTeehee + flip(x4591_2) end; sumrTeehee = sumrTeehee - x4591_2 end --S.S. Chuckola Storage Room Coin Block 1
    if optionCoins() then x4591_3 = {3, 0x4591}; x4591_3 = locFlag(x4591_3); if canTeehee() then canrTeehee = canrTeehee + flip(x4591_3) end; sumrTeehee = sumrTeehee - x4591_3 end --S.S. Chuckola Storage Room Coin Block 2
    x4580_5 = {5, 0x4580}; x4580_5 = locFlag(x4580_5); if has("PeasleysRose") then canrCastleTown = canrCastleTown + flip(x4580_5) end; sumrCastleTown = sumrCastleTown - x4580_5 --Sewers Prison Room Block 1
    x4580_6 = {6, 0x4580}; x4580_6 = locFlag(x4580_6); if has("PeasleysRose") then canrCastleTown = canrCastleTown + flip(x4580_6) end; sumrCastleTown = sumrCastleTown - x4580_6 --Sewers Prison Room Block 2
    x4580_7 = {7, 0x4580}; x4580_7 = locFlag(x4580_7); if has("PeasleysRose") then canrCastleTown = canrCastleTown + flip(x4580_7) end; sumrCastleTown = sumrCastleTown - x4580_7 --Sewers Prison Room Block 3
    x4581_0 = {0, 0x4581}; x4581_0 = locFlag(x4581_0); if has("PeasleysRose") then canrCastleTown = canrCastleTown + flip(x4581_0) end; sumrCastleTown = sumrCastleTown - x4581_0 --Sewers Prison Room Block 4
    if optionCoins() then x4580_4 = {4, 0x4580}; x4580_4 = locFlag(x4580_4); if has("PeasleysRose") then canrCastleTown = canrCastleTown + flip(x4580_4) end; sumrCastleTown = sumrCastleTown - x4580_4 end --Sewers Prison Room Coin Block
    x457F_7 = {7, 0x457F}; x457F_7 = locFlag(x457F_7); if has("PeasleysRose") then canrCastleTown = canrCastleTown + flip(x457F_7) end; sumrCastleTown = sumrCastleTown - x457F_7 --Sewers Room 3 Block 1
    x4580_0 = {0, 0x4580}; x4580_0 = locFlag(x4580_0); if has("PeasleysRose") then canrCastleTown = canrCastleTown + flip(x4580_0) end; sumrCastleTown = sumrCastleTown - x4580_0 --Sewers Room 3 Block 2
    x4580_1 = {1, 0x4580}; x4580_1 = locFlag(x4580_1); if has("PeasleysRose") then canrCastleTown = canrCastleTown + flip(x4580_1) end; sumrCastleTown = sumrCastleTown - x4580_1 --Sewers Room 3 Block 3
    x4580_2 = {2, 0x4580}; x4580_2 = locFlag(x4580_2); if has("PeasleysRose") and has("Hammers1") then canrCastleTown = canrCastleTown + flip(x4580_2) end; sumrCastleTown = sumrCastleTown - x4580_2 --Sewers Room 5 Block 1
    x4580_3 = {3, 0x4580}; x4580_3 = locFlag(x4580_3); if has("PeasleysRose") and has("Hammers1") then canrCastleTown = canrCastleTown + flip(x4580_3) end; sumrCastleTown = sumrCastleTown - x4580_3 --Sewers Room 5 Block 2
    x4564_0 = {0, 0x4564}; x4564_0 = locFlag(x4564_0); canrStardust = canrStardust + flip(x4564_0); sumrStardust = sumrStardust - x4564_0 --Stardust Fields Room 1 Block 1
    x4564_1 = {1, 0x4564}; x4564_1 = locFlag(x4564_1); canrStardust = canrStardust + flip(x4564_1); sumrStardust = sumrStardust - x4564_1 --Stardust Fields Room 1 Block 2
    x4564_2 = {2, 0x4564}; x4564_2 = locFlag(x4564_2); canrStardust = canrStardust + flip(x4564_2); sumrStardust = sumrStardust - x4564_2 --Stardust Fields Room 2 Block
    if optionCoins() then x4564_3 = {3, 0x4564}; x4564_3 = locFlag(x4564_3); canrStardust = canrStardust + flip(x4564_3); sumrStardust = sumrStardust - x4564_3 end --Stardust Fields Room 2 Coin Block 1
    if optionCoins() then x4564_4 = {4, 0x4564}; x4564_4 = locFlag(x4564_4); canrStardust = canrStardust + flip(x4564_4); sumrStardust = sumrStardust - x4564_4 end --Stardust Fields Room 2 Coin Block 2
    if optionCoins() then x4564_5 = {5, 0x4564}; x4564_5 = locFlag(x4564_5); canrStardust = canrStardust + flip(x4564_5); sumrStardust = sumrStardust - x4564_5 end --Stardust Fields Room 2 Coin Block 3
    x4565_0 = {0, 0x4565}; x4565_0 = locFlag(x4565_0); canrStardust = canrStardust + flip(x4565_0); sumrStardust = sumrStardust - x4565_0 --Stardust Fields Room 3 Block
    if optionCoins() then x4564_6 = {6, 0x4564}; x4564_6 = locFlag(x4564_6); canrStardust = canrStardust + flip(x4564_6); sumrStardust = sumrStardust - x4564_6 end --Stardust Fields Room 3 Coin Block 1
    if optionCoins() then x4564_7 = {7, 0x4564}; x4564_7 = locFlag(x4564_7); canrStardust = canrStardust + flip(x4564_7); sumrStardust = sumrStardust - x4564_7 end --Stardust Fields Room 3 Coin Block 2
    x4565_3 = {3, 0x4565}; x4565_3 = locFlag(x4565_3); canrStardust = canrStardust + flip(x4565_3); sumrStardust = sumrStardust - x4565_3 --Stardust Fields Room 4 Block 1
    x4565_2 = {2, 0x4565}; x4565_2 = locFlag(x4565_2); canrStardust = canrStardust + flip(x4565_2); sumrStardust = sumrStardust - x4565_2 --Stardust Fields Room 4 Block 2
    x4565_1 = {1, 0x4565}; x4565_1 = locFlag(x4565_1); canrStardust = canrStardust + flip(x4565_1); sumrStardust = sumrStardust - x4565_1 --Stardust Fields Room 4 Block 3
    x4566_0 = {0, 0x4566}; x4566_0 = locFlag(x4566_0); canrStardust = canrStardust + flip(x4566_0); sumrStardust = sumrStardust - x4566_0 --Stardust Fields Room 5 Block
    if optionCoins() then x4565_7 = {7, 0x4565}; x4565_7 = locFlag(x4565_7); canrStardust = canrStardust + flip(x4565_7); sumrStardust = sumrStardust - x4565_7 end --Stardust Fields Room 5 Coin Block 1
    if optionCoins() then x4566_1 = {1, 0x4566}; x4566_1 = locFlag(x4566_1); canrStardust = canrStardust + flip(x4566_1); sumrStardust = sumrStardust - x4566_1 end --Stardust Fields Room 5 Coin Block 2
    if optionCoins() then x4565_4 = {4, 0x4565}; x4565_4 = locFlag(x4565_4); canrStardust = canrStardust + flip(x4565_4); sumrStardust = sumrStardust - x4565_4 end --Stardust Fields Room 7 Coin Block 1
    if optionCoins() then x4565_5 = {5, 0x4565}; x4565_5 = locFlag(x4565_5); canrStardust = canrStardust + flip(x4565_5); sumrStardust = sumrStardust - x4565_5 end --Stardust Fields Room 7 Coin Block 2
    if optionSurfing() then x4375_1 = {1, 0x4375}; x4375_1 = locFlag(x4375_1); if canSurf() then canrOasis = canrOasis + flip(x4375_1) end; sumrOasis = sumrOasis - x4375_1 end --Surf Minigame
    if optionDigspots() >= 1 then x458F_1 = {1, 0x458F}; x458F_1 = locFlag(x458F_1); if canBirdo() then canrTeehee = canrTeehee + flip(x458F_1) end; sumrTeehee = sumrTeehee - x458F_1 end --Teehee Valley Before Birdo Digspot 1
    if optionDigspots() >= 1 then x458F_2 = {2, 0x458F}; x458F_2 = locFlag(x458F_2); if canBirdo() then canrTeehee = canrTeehee + flip(x458F_2) end; sumrTeehee = sumrTeehee - x458F_2 end --Teehee Valley Before Birdo Digspot 2
    if optionDigspots() >= 1 then x458F_3 = {3, 0x458F}; x458F_3 = locFlag(x458F_3); if canBirdo() then canrTeehee = canrTeehee + flip(x458F_3) end; sumrTeehee = sumrTeehee - x458F_3 end --Teehee Valley Before Birdo Digspot 3
    if optionDigspots() >= 1 then x458F_4 = {4, 0x458F}; x458F_4 = locFlag(x458F_4); if canBirdo() then canrTeehee = canrTeehee + flip(x458F_4) end; sumrTeehee = sumrTeehee - x458F_4 end --Teehee Valley Before Birdo Digspot 4
    if optionDigspots() == 2 then x4590_7 = {7, 0x4590}; x4590_7 = locFlag(x4590_7); if canTeehee() and canDig() then canrTeehee = canrTeehee + flip(x4590_7) end; sumrTeehee = sumrTeehee - x4590_7 end --Teehee Valley Before Trunkle Digspot
    if optionDigspots() == 2 then x4590_3 = {3, 0x4590}; x4590_3 = locFlag(x4590_3); if has("Hammers3") and canDig() then canrTeehee = canrTeehee + flip(x4590_3) end; sumrTeehee = sumrTeehee - x4590_3 end --Teehee Valley Entrance To Hoohoo Mountain Digspot
    x458F_5 = {5, 0x458F}; x458F_5 = locFlag(x458F_5); if has("Hammers3") then canrTeehee = canrTeehee + flip(x458F_5) end; sumrTeehee = sumrTeehee - x458F_5 --Teehee Valley Past Ultra Hammer Rock Block 1
    x458F_7 = {7, 0x458F}; x458F_7 = locFlag(x458F_7); if has("Hammers3") then canrTeehee = canrTeehee + flip(x458F_7) end; sumrTeehee = sumrTeehee - x458F_7 --Teehee Valley Past Ultra Hammer Rock Block 2
    if optionDigspots() >= 1 then x4590_0 = {0, 0x4590}; x4590_0 = locFlag(x4590_0); if has("Hammers3") and canDig() then canrTeehee = canrTeehee + flip(x4590_0) end; sumrTeehee = sumrTeehee - x4590_0 end --Teehee Valley Past Ultra Hammer Rock Digspot 1
    if optionDigspots() >= 1 then x4590_1 = {1, 0x4590}; x4590_1 = locFlag(x4590_1); if canBirdo() then canrTeehee = canrTeehee + flip(x4590_1) end; sumrTeehee = sumrTeehee - x4590_1 end --Teehee Valley Past Ultra Hammer Rock Digspot 2 (Post-Birdo)
    if optionDigspots() >= 1 then x4590_2 = {2, 0x4590}; x4590_2 = locFlag(x4590_2); if has("Hammers3") and canDig() then canrTeehee = canrTeehee + flip(x4590_2) end; sumrTeehee = sumrTeehee - x4590_2 end --Teehee Valley Past Ultra Hammer Rock Digspot 3
    if optionCoins() then x458F_6 = {6, 0x458F}; x458F_6 = locFlag(x458F_6); if has("Hammers3") then canrTeehee = canrTeehee + flip(x458F_6) end; sumrTeehee = sumrTeehee - x458F_6 end --Teehee Valley Past Ultra Hammer Rocks Coin Block
    if optionDigspots() == 2 then x458E_3 = {3, 0x458E}; x458E_3 = locFlag(x458E_3); if canTeehee() and canDig() then canrTeehee = canrTeehee + flip(x458E_3) end; sumrTeehee = sumrTeehee - x458E_3 end --Teehee Valley Room 1 Digspot 1
    if optionDigspots() >= 1 then x458E_4 = {4, 0x458E}; x458E_4 = locFlag(x458E_4); if canTeehee() and canDig() then canrTeehee = canrTeehee + flip(x458E_4) end; sumrTeehee = sumrTeehee - x458E_4 end --Teehee Valley Room 1 Digspot 2
    if optionDigspots() >= 1 then x458E_5 = {5, 0x458E}; x458E_5 = locFlag(x458E_5); if canTeehee() and canDig() then canrTeehee = canrTeehee + flip(x458E_5) end; sumrTeehee = sumrTeehee - x458E_5 end --Teehee Valley Room 1 Digspot 3
    if optionDigspots() >= 1 then x458E_6 = {6, 0x458E}; x458E_6 = locFlag(x458E_6); if canTeehee() and canDig() then canrTeehee = canrTeehee + flip(x458E_6) end; sumrTeehee = sumrTeehee - x458E_6 end --Teehee Valley Room 2 Digspot 1
    if optionDigspots() >= 1 then x458E_7 = {7, 0x458E}; x458E_7 = locFlag(x458E_7); if canTeehee() and canDig() then canrTeehee = canrTeehee + flip(x458E_7) end; sumrTeehee = sumrTeehee - x458E_7 end --Teehee Valley Room 2 Digspot 2
    if optionDigspots() >= 1 then x458F_0 = {0, 0x458F}; x458F_0 = locFlag(x458F_0); if canTeehee() and canDig() then canrTeehee = canrTeehee + flip(x458F_0) end; sumrTeehee = sumrTeehee - x458F_0 end --Teehee Valley Room 2 Digspot 3
    if optionDigspots() == 2 then x4591_0 = {0, 0x4591}; x4591_0 = locFlag(x4591_0); if canFungitown() and canDig() then canrTeehee = canrTeehee + flip(x4591_0) end; sumrTeehee = sumrTeehee - x4591_0 end --Teehee Valley Trunkle Room Digspot
    x4590_6 = {6, 0x4590}; x4590_6 = locFlag(x4590_6); if has("Hammers3") then canrTeehee = canrTeehee + flip(x4590_6) end; sumrTeehee = sumrTeehee - x4590_6 --Teehee Valley Upper Maze Room 1 Block
    if optionDigspots() == 2 then x4590_4 = {4, 0x4590}; x4590_4 = locFlag(x4590_4); if has("Hammers3") and canDig() then canrTeehee = canrTeehee + flip(x4590_4) end; sumrTeehee = sumrTeehee - x4590_4 end --Teehee Valley Upper Maze Room 2 Digspot 1
    if optionDigspots() == 2 then x4590_5 = {5, 0x4590}; x4590_5 = locFlag(x4590_5); if has("Hammers3") and canDig() then canrTeehee = canrTeehee + flip(x4590_5) end; sumrTeehee = sumrTeehee - x4590_5 end --Teehee Valley Upper Maze Room 2 Digspot 2
    x457E_3 = {3, 0x457E}; x457E_3 = locFlag(x457E_3); if has("BeanbeanBrooch") and canDash() and has("WinkleCard") then canrChucklehuck = canrChucklehuck + flip(x457E_3) end; sumrChucklehuck = sumrChucklehuck - x457E_3 --Winkle Area Beanstar Room Block
    if optionDigspots() == 2 then x4596_6 = {6, 0x4596}; x4596_6 = locFlag(x4596_6); if has("BeanbeanBrooch") and canDash() and canDig() then canrChucklehuck = canrChucklehuck + flip(x4596_6) end; sumrChucklehuck = sumrChucklehuck - x4596_6 end --Winkle Area Colloseum Digspot
    if optionDigspots() >= 1 then x457E_4 = {4, 0x457E}; x457E_4 = locFlag(x457E_4); if has("BeanbeanBrooch") and canDash() and canDig() then canrChucklehuck = canrChucklehuck + flip(x457E_4) end; sumrChucklehuck = sumrChucklehuck - x457E_4 end --Winkle Area Digspot
    x457E_5 = {5, 0x457E}; x457E_5 = locFlag(x457E_5); if has("BeanbeanBrooch") and canDash() then canrChucklehuck = canrChucklehuck + flip(x457E_5) end; sumrChucklehuck = sumrChucklehuck - x457E_5 --Winkle Area Outside Colloseum Block
    x430C_7 = {7, 0x430C}; x430C_7 = locFlag(x430C_7); if has("BeanbeanBrooch") and canDash() then canrChucklehuck = canrChucklehuck + flip(x430C_7) end; sumrChucklehuck = sumrChucklehuck - x430C_7 --Winkle Area Winkle Card
    x4584_4 = {4, 0x4584}; x4584_4 = locFlag(x4584_4); if canGoblets() then canrHooniversity = canrHooniversity + flip(x4584_4) end; sumrHooniversity = sumrHooniversity - x4584_4 --Woohoo Hooniversity Barrel Puzzle Entrance Block 1
    x4584_5 = {5, 0x4584}; x4584_5 = locFlag(x4584_5); if canGoblets() then canrHooniversity = canrHooniversity + flip(x4584_5) end; sumrHooniversity = sumrHooniversity - x4584_5 --Woohoo Hooniversity Barrel Puzzle Entrance Block 2
    x4584_6 = {6, 0x4584}; x4584_6 = locFlag(x4584_6); if canGoblets() then canrHooniversity = canrHooniversity + flip(x4584_6) end; sumrHooniversity = sumrHooniversity - x4584_6 --Woohoo Hooniversity Barrel Puzzle Entrance Block 3
    x4584_7 = {7, 0x4584}; x4584_7 = locFlag(x4584_7); if canGoblets() then canrHooniversity = canrHooniversity + flip(x4584_7) end; sumrHooniversity = sumrHooniversity - x4584_7 --Woohoo Hooniversity Barrel Puzzle Entrance Block 4
    if optionDigspots() >= 1 then x4584_3 = {3, 0x4584}; x4584_3 = locFlag(x4584_3); if canGoblets() then canrHooniversity = canrHooniversity + flip(x4584_3) end; sumrHooniversity = sumrHooniversity - x4584_3 end --Woohoo Hooniversity Barrel Puzzle Entrance Digspot 1
    if optionDigspots() == 2 then x4585_0 = {0, 0x4585}; x4585_0 = locFlag(x4585_0); if canGoblets() then canrHooniversity = canrHooniversity + flip(x4585_0) end; sumrHooniversity = sumrHooniversity - x4585_0 end --Woohoo Hooniversity Barrel Puzzle Entrance Digspot 2
    if optionDigspots() >= 1 then x458D_5 = {5, 0x458D}; x458D_5 = locFlag(x458D_5); if canGoblets() then canrHooniversity = canrHooniversity + flip(x458D_5) end; sumrHooniversity = sumrHooniversity - x458D_5 end --Woohoo Hooniversity Basement Room 1 Digspot
    if optionDigspots() >= 1 then x458D_6 = {6, 0x458D}; x458D_6 = locFlag(x458D_6); if canGoblets() then canrHooniversity = canrHooniversity + flip(x458D_6) end; sumrHooniversity = sumrHooniversity - x458D_6 end --Woohoo Hooniversity Basement Room 2 Digspot
    x458D_7 = {7, 0x458D}; x458D_7 = locFlag(x458D_7); if canGoblets() then canrHooniversity = canrHooniversity + flip(x458D_7) end; sumrHooniversity = sumrHooniversity - x458D_7 --Woohoo Hooniversity Basement Room 3 Block
    x458E_0 = {0, 0x458E}; x458E_0 = locFlag(x458E_0); if canGoblets() then canrHooniversity = canrHooniversity + flip(x458E_0) end; sumrHooniversity = sumrHooniversity - x458E_0 --Woohoo Hooniversity Basement Room 4 Block
    if optionDigspots() >= 1 then x4586_4 = {4, 0x4586}; x4586_4 = locFlag(x4586_4); if canDig() then canrHooniversity = canrHooniversity + flip(x4586_4) end; sumrHooniversity = sumrHooniversity - x4586_4 end --Woohoo Hooniversity Entrance to Mini Mario Room 2 Digspot
    if optionDigspots() >= 1 then x4586_2 = {2, 0x4586}; x4586_2 = locFlag(x4586_2); if canDig() then canrHooniversity = canrHooniversity + flip(x4586_2) end; sumrHooniversity = sumrHooniversity - x4586_2 end --Woohoo Hooniversity Entrance to Mini Mario Room Digspot 1
    if optionDigspots() == 2 then x4586_3 = {3, 0x4586}; x4586_3 = locFlag(x4586_3); if canDig() then canrHooniversity = canrHooniversity + flip(x4586_3) end; sumrHooniversity = sumrHooniversity - x4586_3 end --Woohoo Hooniversity Entrance to Mini Mario Room Digspot 2
    x4586_5 = {5, 0x4586}; x4586_5 = locFlag(x4586_5); if canMini() then canrHooniversity = canrHooniversity + flip(x4586_5) end; sumrHooniversity = sumrHooniversity - x4586_5 --Woohoo Hooniversity Mini Mario Puzzle Block
    if optionDigspots() >= 1 then x4586_6 = {6, 0x4586}; x4586_6 = locFlag(x4586_6); if canDig() then canrHooniversity = canrHooniversity + flip(x4586_6) end; sumrHooniversity = sumrHooniversity - x4586_6 end --Woohoo Hooniversity Mini Mario Puzzle Digspot
    x4586_7 = {7, 0x4586}; x4586_7 = locFlag(x4586_7); if canMini() then canrHooniversity = canrHooniversity + flip(x4586_7) end; sumrHooniversity = sumrHooniversity - x4586_7 --Woohoo Hooniversity Mini Mario Puzzle Secret Area Block 1
    x4587_0 = {0, 0x4587}; x4587_0 = locFlag(x4587_0); if canMini() then canrHooniversity = canrHooniversity + flip(x4587_0) end; sumrHooniversity = sumrHooniversity - x4587_0 --Woohoo Hooniversity Mini Mario Puzzle Secret Area Block 2
    x4587_1 = {1, 0x4587}; x4587_1 = locFlag(x4587_1); if canMini() then canrHooniversity = canrHooniversity + flip(x4587_1) end; sumrHooniversity = sumrHooniversity - x4587_1 --Woohoo Hooniversity Mini Mario Puzzle Secret Area Block 3
    x4587_2 = {2, 0x4587}; x4587_2 = locFlag(x4587_2); if canMini() then canrHooniversity = canrHooniversity + flip(x4587_2) end; sumrHooniversity = sumrHooniversity - x4587_2 --Woohoo Hooniversity Mini Mario Puzzle Secret Area Block 4
    x4587_6 = {6, 0x4587}; x4587_6 = locFlag(x4587_6); if canGoblets() then canrHooniversity = canrHooniversity + flip(x4587_6) end; sumrHooniversity = sumrHooniversity - x4587_6 --Woohoo Hooniversity Past Cackletta Room 1 Block
    x4587_7 = {7, 0x4587}; x4587_7 = locFlag(x4587_7); if canGoblets() then canrHooniversity = canrHooniversity + flip(x4587_7) end; sumrHooniversity = sumrHooniversity - x4587_7 --Woohoo Hooniversity Past Cackletta Room 2 Block 1
    x4588_0 = {0, 0x4588}; x4588_0 = locFlag(x4588_0); if canGoblets() then canrHooniversity = canrHooniversity + flip(x4588_0) end; sumrHooniversity = sumrHooniversity - x4588_0 --Woohoo Hooniversity Past Cackletta Room 2 Block 2
    if optionDigspots() >= 1 then x4588_1 = {1, 0x4588}; x4588_1 = locFlag(x4588_1); if canGoblets() then canrHooniversity = canrHooniversity + flip(x4588_1) end; sumrHooniversity = sumrHooniversity - x4588_1 end --Woohoo Hooniversity Past Cackletta Room 2 Digspot
    x4587_3 = {3, 0x4587}; x4587_3 = locFlag(x4587_3); if canGoblets() then canrHooniversity = canrHooniversity + flip(x4587_3) end; sumrHooniversity = sumrHooniversity - x4587_3 --Woohoo Hooniversity Past Sun Door Block 1
    x4587_4 = {4, 0x4587}; x4587_4 = locFlag(x4587_4); if canGoblets() then canrHooniversity = canrHooniversity + flip(x4587_4) end; sumrHooniversity = sumrHooniversity - x4587_4 --Woohoo Hooniversity Past Sun Door Block 2
    x4587_5 = {5, 0x4587}; x4587_5 = locFlag(x4587_5); if canGoblets() then canrHooniversity = canrHooniversity + flip(x4587_5) end; sumrHooniversity = sumrHooniversity - x4587_5 --Woohoo Hooniversity Past Sun Door Block 3
    if optionDigspots() >= 1 then x458E_1 = {1, 0x458E}; x458E_1 = locFlag(x458E_1); if canGoblets() then canrHooniversity = canrHooniversity + flip(x458E_1) end; sumrHooniversity = sumrHooniversity - x458E_1 end --Woohoo Hooniversity Popple Room Digspot 1
    if optionDigspots() >= 1 then x458E_2 = {2, 0x458E}; x458E_2 = locFlag(x458E_2); if canGoblets() then canrHooniversity = canrHooniversity + flip(x458E_2) end; sumrHooniversity = sumrHooniversity - x458E_2 end --Woohoo Hooniversity Popple Room Digspot 2
    x459E_3 = {3, 0x459E}; x459E_3 = locFlag(x459E_3); if canGoblets() then canrHooniversity = canrHooniversity + flip(x459E_3) end; sumrHooniversity = sumrHooniversity - x459E_3 --Woohoo Hooniversity Solo Mario Barrel Area Block 1
    x459E_4 = {4, 0x459E}; x459E_4 = locFlag(x459E_4); if canGoblets() then canrHooniversity = canrHooniversity + flip(x459E_4) end; sumrHooniversity = sumrHooniversity - x459E_4 --Woohoo Hooniversity Solo Mario Barrel Area Block 2
    x459E_5 = {5, 0x459E}; x459E_5 = locFlag(x459E_5); if canGoblets() then canrHooniversity = canrHooniversity + flip(x459E_5) end; sumrHooniversity = sumrHooniversity - x459E_5 --Woohoo Hooniversity Solo Mario Barrel Area Block 3
    x4584_0 = {0, 0x4584}; x4584_0 = locFlag(x4584_0); if canGoblets() then canrHooniversity = canrHooniversity + flip(x4584_0) end; sumrHooniversity = sumrHooniversity - x4584_0 --Woohoo Hooniversity South Of Star Room Block
    x4583_3 = {3, 0x4583}; x4583_3 = locFlag(x4583_3); canrHooniversity = canrHooniversity + flip(x4583_3); sumrHooniversity = sumrHooniversity - x4583_3 --Woohoo Hooniversity Star Room Block 1
    x4583_4 = {4, 0x4583}; x4583_4 = locFlag(x4583_4); canrHooniversity = canrHooniversity + flip(x4583_4); sumrHooniversity = sumrHooniversity - x4583_4 --Woohoo Hooniversity Star Room Block 2
    x4583_5 = {5, 0x4583}; x4583_5 = locFlag(x4583_5); canrHooniversity = canrHooniversity + flip(x4583_5); sumrHooniversity = sumrHooniversity - x4583_5 --Woohoo Hooniversity Star Room Block 3
    x4583_6 = {6, 0x4583}; x4583_6 = locFlag(x4583_6); canrHooniversity = canrHooniversity + flip(x4583_6); sumrHooniversity = sumrHooniversity - x4583_6 --Woohoo Hooniversity Sun Door Block 1
    x4583_7 = {7, 0x4583}; x4583_7 = locFlag(x4583_7); canrHooniversity = canrHooniversity + flip(x4583_7); sumrHooniversity = sumrHooniversity - x4583_7 --Woohoo Hooniversity Sun Door Block 2
    if optionDigspots() >= 1 then x4585_2 = {2, 0x4585}; x4585_2 = locFlag(x4585_2); if canDig() then canrHooniversity = canrHooniversity + flip(x4585_2) end; sumrHooniversity = sumrHooniversity - x4585_2 end --Woohoo Hooniversity West of Star Room 2 Digspot
    if optionDigspots() == 2 then x4585_3 = {3, 0x4585}; x4585_3 = locFlag(x4585_3); if canDig() then canrHooniversity = canrHooniversity + flip(x4585_3) end; sumrHooniversity = sumrHooniversity - x4585_3 end --Woohoo Hooniversity West of Star Room 3 Digspot
    x4585_4 = {4, 0x4585}; x4585_4 = locFlag(x4585_4); canrHooniversity = canrHooniversity + flip(x4585_4); sumrHooniversity = sumrHooniversity - x4585_4 --Woohoo Hooniversity West of Star Room 4 Block 1
    x4585_5 = {5, 0x4585}; x4585_5 = locFlag(x4585_5); canrHooniversity = canrHooniversity + flip(x4585_5); sumrHooniversity = sumrHooniversity - x4585_5 --Woohoo Hooniversity West of Star Room 4 Block 2
    x4585_6 = {6, 0x4585}; x4585_6 = locFlag(x4585_6); canrHooniversity = canrHooniversity + flip(x4585_6); sumrHooniversity = sumrHooniversity - x4585_6 --Woohoo Hooniversity West of Star Room 4 Block 3
    if optionDigspots() >= 1 then x4585_7 = {7, 0x4585}; x4585_7 = locFlag(x4585_7); if canDig() then canrHooniversity = canrHooniversity + flip(x4585_7) end; sumrHooniversity = sumrHooniversity - x4585_7 end --Woohoo Hooniversity West of Star Room 4 Digspot 1
    if optionDigspots() >= 1 then x4586_0 = {0, 0x4586}; x4586_0 = locFlag(x4586_0); if canDig() then canrHooniversity = canrHooniversity + flip(x4586_0) end; sumrHooniversity = sumrHooniversity - x4586_0 end --Woohoo Hooniversity West of Star Room 4 Digspot 2
    if optionDigspots() == 2 then x4586_1 = {1, 0x4586}; x4586_1 = locFlag(x4586_1); if canDig() then canrHooniversity = canrHooniversity + flip(x4586_1) end; sumrHooniversity = sumrHooniversity - x4586_1 end --Woohoo Hooniversity West of Star Room 5 Digspot
    if optionDigspots() >= 1 then x4584_1 = {1, 0x4584}; x4584_1 = locFlag(x4584_1); if canDig() then canrHooniversity = canrHooniversity + flip(x4584_1) end; sumrHooniversity = sumrHooniversity - x4584_1 end --Woohoo Hooniversity West of Star Room Digspot 1
    if optionDigspots() == 2 then x4584_2 = {2, 0x4584}; x4584_2 = locFlag(x4584_2); if canDig() then canrHooniversity = canrHooniversity + flip(x4584_2) end; sumrHooniversity = sumrHooniversity - x4584_2 end --Woohoo Hooniversity West of Star Room Digspot 2
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
	
	-- New items as of v1.9.14
	x4592_1 = {1, 0x4592}; x4592_1 = locFlag(x4592_1); if has("Hammers3") and canThunderhand() then canrHoohoo = canrHoohoo + flip(x4592_1) end; sumrHoohoo = sumrHoohoo - x4592_1 --Guffawha Ruins Block
    if optionCoins() then x4572_0 = {0, 0x4572}; x4572_0 = locFlag(x4572_0); if has("BeanbeanBrooch") and canDig() then canrChucklehuck = canrChucklehuck + flip(x4572_0) end; sumrChucklehuck = sumrChucklehuck - x4572_0 end --Chucklehuck Woods Solo Luigi Cave Room 1 Coin Block 1
    if optionCoins() then x4572_1 = {1, 0x4572}; x4572_1 = locFlag(x4572_1); if has("BeanbeanBrooch") and canDig() then canrChucklehuck = canrChucklehuck + flip(x4572_1) end; sumrChucklehuck = sumrChucklehuck - x4572_1 end --Chucklehuck Woods Solo Luigi Cave Room 1 Coin Block 2
    x4572_2 = {2, 0x4572}; x4572_2 = locFlag(x4572_2); if has("BeanbeanBrooch") and canDig() then canrChucklehuck = canrChucklehuck + flip(x4572_2) end; sumrChucklehuck = sumrChucklehuck - x4572_2 --Chucklehuck Woods Solo Luigi Cave Room 2 Block 1
    x4572_3 = {3, 0x4572}; x4572_3 = locFlag(x4572_3); if has("BeanbeanBrooch") and canDig() then canrChucklehuck = canrChucklehuck + flip(x4572_3) end; sumrChucklehuck = sumrChucklehuck - x4572_3 --Chucklehuck Woods Solo Luigi Cave Room 2 Block 2
    x4572_4 = {4, 0x4572}; x4572_4 = locFlag(x4572_4); if has("BeanbeanBrooch") and canDig() then canrChucklehuck = canrChucklehuck + flip(x4572_4) end; sumrChucklehuck = sumrChucklehuck - x4572_4 --Chucklehuck Woods Solo Luigi Cave Room 3 Block
	x47F0_0 = {0, 0x47F0}; x47F0_0 = locFlag(x47F0_0); canrShop = canrShop + flip(x47F0_0); sumrShop = sumrShop - x47F0_0 --Shop Starting Flag 1
    x47F0_1 = {1, 0x47F0}; x47F0_1 = locFlag(x47F0_1); canrShop = canrShop + flip(x47F0_1); sumrShop = sumrShop - x47F0_1 --Shop Starting Flag 2
    x47F0_2 = {2, 0x47F0}; x47F0_2 = locFlag(x47F0_2); canrShop = canrShop + flip(x47F0_2); sumrShop = sumrShop - x47F0_2 --Shop Starting Flag 3
    x47F0_3 = {3, 0x47F0}; x47F0_3 = locFlag(x47F0_3); if canShopChuckolatorItems() then canrShop = canrShop + flip(x47F0_3) end; sumrShop = sumrShop - x47F0_3 --Shop Chuckolator Flag
    x47F0_4 = {4, 0x47F0}; x47F0_4 = locFlag(x47F0_4); if canShopMomPiranhaItems() then canrShop = canrShop + flip(x47F0_4) end; sumrShop = sumrShop - x47F0_4 --Shop Mom Piranha Flag 1
    x47F0_5 = {5, 0x47F0}; x47F0_5 = locFlag(x47F0_5); if canShopMomPiranhaItems() then canrShop = canrShop + flip(x47F0_5) end; sumrShop = sumrShop - x47F0_5 --Shop Mom Piranha Flag 2
    x47F0_6 = {6, 0x47F0}; x47F0_6 = locFlag(x47F0_6); if canShopMomPiranhaItems() then canrShop = canrShop + flip(x47F0_6) end; sumrShop = sumrShop - x47F0_6 --Shop Mom Piranha Flag 3
    x47F0_7 = {7, 0x47F0}; x47F0_7 = locFlag(x47F0_7); if canShopMomPiranhaItems() then canrShop = canrShop + flip(x47F0_7) end; sumrShop = sumrShop - x47F0_7 --Shop Mom Piranha Flag 4
    x47F1_0 = {0, 0x47F1}; x47F1_0 = locFlag(x47F1_0); if canShopTrunkle() then canrShop = canrShop + flip(x47F1_0) end; sumrShop = sumrShop - x47F1_0 --Shop Trunkle Flag 1
    x47F1_1 = {1, 0x47F1}; x47F1_1 = locFlag(x47F1_1); if canShopTrunkle() then canrShop = canrShop + flip(x47F1_1) end; sumrShop = sumrShop - x47F1_1 --Shop Trunkle Flag 2
    x47F1_2 = {2, 0x47F1}; x47F1_2 = locFlag(x47F1_2); if canShopBeanstar() then canrShop = canrShop + flip(x47F1_2) end; sumrShop = sumrShop - x47F1_2 --Shop Beanstar Complete Flag 1
    x47F1_3 = {3, 0x47F1}; x47F1_3 = locFlag(x47F1_3); if canShopBeanstar() then canrShop = canrShop + flip(x47F1_3) end; sumrShop = sumrShop - x47F1_3 --Shop Beanstar Complete Flag 2
    x47F1_4 = {4, 0x47F1}; x47F1_4 = locFlag(x47F1_4); if canShopBeanstar() then canrShop = canrShop + flip(x47F1_4) end; sumrShop = sumrShop - x47F1_4 --Shop Beanstar Complete Flag 3
    x47F1_5 = {5, 0x47F1}; x47F1_5 = locFlag(x47F1_5); if canShopBirdo() then canrShop = canrShop + flip(x47F1_5) end; sumrShop = sumrShop - x47F1_5 --Shop Birdo Flag
    x47F4_0 = {0, 0x47F4}; x47F4_0 = locFlag(x47F4_0); if canShopStartingGear() then canrShop = canrShop + flip(x47F4_0) end; sumrShop = sumrShop - x47F4_0 --Pants Shop Starting Flag 1
    x47F4_1 = {1, 0x47F4}; x47F4_1 = locFlag(x47F4_1); if canShopStartingGear() then canrShop = canrShop + flip(x47F4_1) end; sumrShop = sumrShop - x47F4_1 --Pants Shop Starting Flag 2
    x47F4_2 = {2, 0x47F4}; x47F4_2 = locFlag(x47F4_2); if canShopStartingGear() then canrShop = canrShop + flip(x47F4_2) end; sumrShop = sumrShop - x47F4_2 --Pants Shop Starting Flag 3
    x47F4_3 = {3, 0x47F4}; x47F4_3 = locFlag(x47F4_3); if canShopChuckolatorGear() then canrShop = canrShop + flip(x47F4_3) end; sumrShop = sumrShop - x47F4_3 --Pants Shop Chuckolator Flag 1
    x47F4_4 = {4, 0x47F4}; x47F4_4 = locFlag(x47F4_4); if canShopChuckolatorGear() then canrShop = canrShop + flip(x47F4_4) end; sumrShop = sumrShop - x47F4_4 --Pants Shop Chuckolator Flag 2
    x47F4_5 = {5, 0x47F4}; x47F4_5 = locFlag(x47F4_5); if canShopChuckolatorGear() then canrShop = canrShop + flip(x47F4_5) end; sumrShop = sumrShop - x47F4_5 --Pants Shop Chuckolator Flag 3
    x47F4_6 = {6, 0x47F4}; x47F4_6 = locFlag(x47F4_6); if canShopMomPiranhaGear() then canrShop = canrShop + flip(x47F4_6) end; sumrShop = sumrShop - x47F4_6 --Pants Shop Mom Piranha Flag 1
    x47F4_7 = {7, 0x47F4}; x47F4_7 = locFlag(x47F4_7); if canShopMomPiranhaGear() then canrShop = canrShop + flip(x47F4_7) end; sumrShop = sumrShop - x47F4_7 --Pants Shop Mom Piranha Flag 2
    x47F5_0 = {0, 0x47F5}; x47F5_0 = locFlag(x47F5_0); if canShopMomPiranhaGear() then canrShop = canrShop + flip(x47F5_0) end; sumrShop = sumrShop - x47F5_0 --Pants Shop Mom Piranha Flag 3
    x47F5_1 = {1, 0x47F5}; x47F5_1 = locFlag(x47F5_1); if canShopTrunkle() then canrShop = canrShop + flip(x47F5_1) end; sumrShop = sumrShop - x47F5_1 --Pants Shop Trunkle Flag 1
    x47F5_2 = {2, 0x47F5}; x47F5_2 = locFlag(x47F5_2); if canShopTrunkle() then canrShop = canrShop + flip(x47F5_2) end; sumrShop = sumrShop - x47F5_2 --Pants Shop Trunkle Flag 2
    x47F5_3 = {3, 0x47F5}; x47F5_3 = locFlag(x47F5_3); if canShopTrunkle() then canrShop = canrShop + flip(x47F5_3) end; sumrShop = sumrShop - x47F5_3 --Pants Shop Trunkle Flag 3
    x47F5_4 = {4, 0x47F5}; x47F5_4 = locFlag(x47F5_4); if canShopBeanstar() then canrShop = canrShop + flip(x47F5_4) end; sumrShop = sumrShop - x47F5_4 --Pants Shop Beanstar Complete Flag 1
    x47F5_5 = {5, 0x47F5}; x47F5_5 = locFlag(x47F5_5); if canShopBeanstar() then canrShop = canrShop + flip(x47F5_5) end; sumrShop = sumrShop - x47F5_5 --Pants Shop Beanstar Complete Flag 2
    x47F5_6 = {6, 0x47F5}; x47F5_6 = locFlag(x47F5_6); if canShopBeanstar() then canrShop = canrShop + flip(x47F5_6) end; sumrShop = sumrShop - x47F5_6 --Pants Shop Beanstar Complete Flag 3
    x47F5_7 = {7, 0x47F5}; x47F5_7 = locFlag(x47F5_7); if canShopBirdo() then canrShop = canrShop + flip(x47F5_7) end; sumrShop = sumrShop - x47F5_7 --Pants Shop Birdo Flag 1
    x47F6_0 = {0, 0x47F6}; x47F6_0 = locFlag(x47F6_0); if canShopBirdo() then canrShop = canrShop + flip(x47F6_0) end; sumrShop = sumrShop - x47F6_0 --Pants Shop Birdo Flag 2
    x47F6_1 = {1, 0x47F6}; x47F6_1 = locFlag(x47F6_1); if canShopBirdo() then canrShop = canrShop + flip(x47F6_1) end; sumrShop = sumrShop - x47F6_1 --Pants Shop Birdo Flag 3
    x47F8_0 = {0, 0x47F8}; x47F8_0 = locFlag(x47F8_0); if canShopStartingGear() then canrShop = canrShop + flip(x47F8_0) end; sumrShop = sumrShop - x47F8_0 --Badge Shop Starting Flag 1
    x47F8_1 = {1, 0x47F8}; x47F8_1 = locFlag(x47F8_1); if canShopStartingGear() then canrShop = canrShop + flip(x47F8_1) end; sumrShop = sumrShop - x47F8_1 --Badge Shop Starting Flag 2
    x47F8_2 = {2, 0x47F8}; x47F8_2 = locFlag(x47F8_2); if canShopChuckolatorGear() then canrShop = canrShop + flip(x47F8_2) end; sumrShop = sumrShop - x47F8_2 --Badge Shop Chuckolator Flag 1
    x47F8_3 = {3, 0x47F8}; x47F8_3 = locFlag(x47F8_3); if canShopChuckolatorGear() then canrShop = canrShop + flip(x47F8_3) end; sumrShop = sumrShop - x47F8_3 --Badge Shop Chuckolator Flag 2
    x47F8_4 = {4, 0x47F8}; x47F8_4 = locFlag(x47F8_4); if canShopChuckolatorGear() then canrShop = canrShop + flip(x47F8_4) end; sumrShop = sumrShop - x47F8_4 --Badge Shop Chuckolator Flag 3
    x47F8_5 = {5, 0x47F8}; x47F8_5 = locFlag(x47F8_5); if canShopMomPiranhaGear() then canrShop = canrShop + flip(x47F8_5) end; sumrShop = sumrShop - x47F8_5 --Badge Shop Mom Piranha Flag 1
    x47F8_6 = {6, 0x47F8}; x47F8_6 = locFlag(x47F8_6); if canShopMomPiranhaGear() then canrShop = canrShop + flip(x47F8_6) end; sumrShop = sumrShop - x47F8_6 --Badge Shop Mom Piranha Flag 2
    x47F8_7 = {7, 0x47F8}; x47F8_7 = locFlag(x47F8_7); if canShopMomPiranhaGear() then canrShop = canrShop + flip(x47F8_7) end; sumrShop = sumrShop - x47F8_7 --Badge Shop Mom Piranha Flag 3
    x47F9_0 = {0, 0x47F9}; x47F9_0 = locFlag(x47F9_0); if canShopTrunkle() then canrShop = canrShop + flip(x47F9_0) end; sumrShop = sumrShop - x47F9_0 --Badge Shop Trunkle Flag 1
    x47F9_1 = {1, 0x47F9}; x47F9_1 = locFlag(x47F9_1); if canShopTrunkle() then canrShop = canrShop + flip(x47F9_1) end; sumrShop = sumrShop - x47F9_1 --Badge Shop Trunkle Flag 2
    x47F9_2 = {2, 0x47F9}; x47F9_2 = locFlag(x47F9_2); if canShopTrunkle() then canrShop = canrShop + flip(x47F9_2) end; sumrShop = sumrShop - x47F9_2 --Badge Shop Trunkle Flag 3
    x47F9_3 = {3, 0x47F9}; x47F9_3 = locFlag(x47F9_3); if canShopBeanstar() then canrShop = canrShop + flip(x47F9_3) end; sumrShop = sumrShop - x47F9_3 --Badge Shop Beanstar Complete Flag 1
    x47F9_4 = {4, 0x47F9}; x47F9_4 = locFlag(x47F9_4); if canShopBeanstar() then canrShop = canrShop + flip(x47F9_4) end; sumrShop = sumrShop - x47F9_4 --Badge Shop Beanstar Complete Flag 2
    x47F9_5 = {5, 0x47F9}; x47F9_5 = locFlag(x47F9_5); if canShopBeanstar() then canrShop = canrShop + flip(x47F9_5) end; sumrShop = sumrShop - x47F9_5 --Badge Shop Beanstar Complete Flag 3
    x47F9_6 = {6, 0x47F9}; x47F9_6 = locFlag(x47F9_6); if canShopBirdo() then canrShop = canrShop + flip(x47F9_6) end; sumrShop = sumrShop - x47F9_6 --Badge Shop Birdo Flag 1
    x47F9_7 = {7, 0x47F9}; x47F9_7 = locFlag(x47F9_7); if canShopBirdo() then canrShop = canrShop + flip(x47F9_7) end; sumrShop = sumrShop - x47F9_7 --Badge Shop Birdo Flag 2
    x47FA_0 = {0, 0x47FA}; x47FA_0 = locFlag(x47FA_0); if canShopBirdo() then canrShop = canrShop + flip(x47FA_0) end; sumrShop = sumrShop - x47FA_0 --Badge Shop Birdo Flag 3
    x47F2_0 = {0, 0x47F2}; x47F2_0 = locFlag(x47F2_0); if canFungiShopStarting() then canrShop = canrShop + flip(x47F2_0) end; sumrShop = sumrShop - x47F2_0 --Fungitown Shop Starting Flag 1
    x47F2_1 = {1, 0x47F2}; x47F2_1 = locFlag(x47F2_1); if canFungiShopStarting() then canrShop = canrShop + flip(x47F2_1) end; sumrShop = sumrShop - x47F2_1 --Fungitown Shop Starting Flag 2
    x47F2_2 = {2, 0x47F2}; x47F2_2 = locFlag(x47F2_2); if canFungiShopStarting() then canrShop = canrShop + flip(x47F2_2) end; sumrShop = sumrShop - x47F2_2 --Fungitown Shop Starting Flag 3
    x47F2_3 = {3, 0x47F2}; x47F2_3 = locFlag(x47F2_3); if canFungiShopStarting() then canrShop = canrShop + flip(x47F2_3) end; sumrShop = sumrShop - x47F2_3 --Fungitown Shop Starting Flag 4
    x47F2_4 = {4, 0x47F2}; x47F2_4 = locFlag(x47F2_4); if canFungiShopStarting() then canrShop = canrShop + flip(x47F2_4) end; sumrShop = sumrShop - x47F2_4 --Fungitown Shop Starting Flag 5
    x47F2_5 = {5, 0x47F2}; x47F2_5 = locFlag(x47F2_5); if canFungiShopStarting() then canrShop = canrShop + flip(x47F2_5) end; sumrShop = sumrShop - x47F2_5 --Fungitown Shop Starting Flag 6
    x47F2_6 = {6, 0x47F2}; x47F2_6 = locFlag(x47F2_6); if canFungiShopStarting() then canrShop = canrShop + flip(x47F2_6) end; sumrShop = sumrShop - x47F2_6 --Fungitown Shop Starting Flag 7
    x47F2_7 = {7, 0x47F2}; x47F2_7 = locFlag(x47F2_7); if canFungiShopStarting() then canrShop = canrShop + flip(x47F2_7) end; sumrShop = sumrShop - x47F2_7 --Fungitown Shop Starting Flag 8
    x47F3_0 = {0, 0x47F3}; x47F3_0 = locFlag(x47F3_0); if canFungiShopBeanstar() then canrShop = canrShop + flip(x47F3_0) end; sumrShop = sumrShop - x47F3_0 --Fungitown Shop Beanstar Complete Flag
    x47F3_1 = {1, 0x47F3}; x47F3_1 = locFlag(x47F3_1); if canFungiShopBirdo() then canrShop = canrShop + flip(x47F3_1) end; sumrShop = sumrShop - x47F3_1 --Fungitown Shop Birdo Flag
    x47FC_0 = {0, 0x47FC}; x47FC_0 = locFlag(x47FC_0); if canFungiShopStarting() then canrShop = canrShop + flip(x47FC_0) end; sumrShop = sumrShop - x47FC_0 --Fungitown Pants Shop Starting Flag 1
    x47FC_1 = {1, 0x47FC}; x47FC_1 = locFlag(x47FC_1); if canFungiShopStarting() then canrShop = canrShop + flip(x47FC_1) end; sumrShop = sumrShop - x47FC_1 --Fungitown Pants Shop Starting Flag 2
    x47FC_2 = {2, 0x47FC}; x47FC_2 = locFlag(x47FC_2); if canFungiShopStarting() then canrShop = canrShop + flip(x47FC_2) end; sumrShop = sumrShop - x47FC_2 --Fungitown Pants Shop Starting Flag 3
    x47FC_3 = {3, 0x47FC}; x47FC_3 = locFlag(x47FC_3); if canFungiShopBeanstar() then canrShop = canrShop + flip(x47FC_3) end; sumrShop = sumrShop - x47FC_3 --Fungitown Pants Shop Beanstar Complete Flag 1
    x47FC_4 = {4, 0x47FC}; x47FC_4 = locFlag(x47FC_4); if canFungiShopBeanstar() then canrShop = canrShop + flip(x47FC_4) end; sumrShop = sumrShop - x47FC_4 --Fungitown Pants Shop Beanstar Complete Flag 2
    x47FC_5 = {5, 0x47FC}; x47FC_5 = locFlag(x47FC_5); if canFungiShopBirdo() then canrShop = canrShop + flip(x47FC_5) end; sumrShop = sumrShop - x47FC_5 --Fungitown Pants Shop Birdo Flag 1
    x47FC_6 = {6, 0x47FC}; x47FC_6 = locFlag(x47FC_6); if canFungiShopBirdo() then canrShop = canrShop + flip(x47FC_6) end; sumrShop = sumrShop - x47FC_6 --Fungitown Pants Shop Birdo Flag 2
    x47FD_0 = {0, 0x47FD}; x47FD_0 = locFlag(x47FD_0); if canFungiShopStarting() then canrShop = canrShop + flip(x47FD_0) end; sumrShop = sumrShop - x47FD_0 --Fungitown Badge Shop Starting Flag 1
    x47FD_1 = {1, 0x47FD}; x47FD_1 = locFlag(x47FD_1); if canFungiShopStarting() then canrShop = canrShop + flip(x47FD_1) end; sumrShop = sumrShop - x47FD_1 --Fungitown Badge Shop Starting Flag 2
    x47FD_2 = {2, 0x47FD}; x47FD_2 = locFlag(x47FD_2); if canFungiShopStarting() then canrShop = canrShop + flip(x47FD_2) end; sumrShop = sumrShop - x47FD_2 --Fungitown Badge Shop Starting Flag 3
    x47FD_3 = {3, 0x47FD}; x47FD_3 = locFlag(x47FD_3); if canFungiShopBeanstar() then canrShop = canrShop + flip(x47FD_3) end; sumrShop = sumrShop - x47FD_3 --Fungitown Badge Shop Beanstar Complete Flag 1
    x47FD_4 = {4, 0x47FD}; x47FD_4 = locFlag(x47FD_4); if canFungiShopBeanstar() then canrShop = canrShop + flip(x47FD_4) end; sumrShop = sumrShop - x47FD_4 --Fungitown Badge Shop Beanstar Complete Flag 2
    x47FD_5 = {5, 0x47FD}; x47FD_5 = locFlag(x47FD_5); if canFungiShopBirdo() then canrShop = canrShop + flip(x47FD_5) end; sumrShop = sumrShop - x47FD_5 --Fungitown Badge Shop Birdo Flag 1
    x47FD_6 = {6, 0x47FD}; x47FD_6 = locFlag(x47FD_6); if canFungiShopBirdo() then canrShop = canrShop + flip(x47FD_6) end; sumrShop = sumrShop - x47FD_6 --Fungitown Badge Shop Birdo Flag 2
	
	
	
	local canrTotal = canrStardust + canrHoohoo + canrOutskirts + canrCastleTown + canrChucklehuck + canrHooniversity + canrOasis + canrTeehee + canrGwarhar + canrJokes + canrBowser + canrShop
	local sumrTotal = sumrStardust + sumrHoohoo + sumrOutskirts + sumrCastleTown + sumrChucklehuck + sumrHooniversity + sumrOasis + sumrTeehee + sumrGwarhar + sumrJokes + sumrBowser + sumrShop
	
	
	-- Draw location availabity to item tracker
	--drawLocation(LocationAvailability, LocationsDone, Location1, Location2, Location3, YPos)
	drawLocation(canrStardust, sumrStardust, "./location_names/StardustFields1.png", "./location_names/StardustFields2.png", "./location_names/StardustFields3.png", 350)
	drawLocation(canrHoohoo, sumrHoohoo, "./location_names/HoohooMountain1.png", "./location_names/HoohooMountain2.png", "./location_names/HoohooMountain3.png", 395)
	drawLocation(canrOutskirts, sumrOutskirts, "./location_names/Outskirts1.png", "./location_names/Outskirts2.png", "./location_names/Outskirts3.png", 440)
	drawLocation(canrCastleTown, sumrCastleTown, "./location_names/BeanbeanCastleTown1.png", "./location_names/BeanbeanCastleTown2.png", "./location_names/BeanbeanCastleTown3.png", 485)
	drawLocation(canrChucklehuck, sumrChucklehuck, "./location_names/ChucklehuckWoods1.png", "./location_names/ChucklehuckWoods2.png", "./location_names/ChucklehuckWoods3.png", 530)
	drawLocation(canrHooniversity, sumrHooniversity, "./location_names/Hooniversity1.png", "./location_names/Hooniversity2.png", "./location_names/Hooniversity3.png", 575)
	drawLocation(canrOasis, sumrOasis, "./location_names/OhoOasis1.png", "./location_names/OhoOasis2.png", "./location_names/OhoOasis3.png", 620)
	drawLocation(canrTeehee, sumrTeehee, "./location_names/TeeheeValley1.png", "./location_names/TeeheeValley2.png", "./location_names/TeeheeValley3.png", 665)
	drawLocation(canrGwarhar, sumrGwarhar, "./location_names/GwarharLagoon1.png", "./location_names/GwarharLagoon2.png", "./location_names/GwarharLagoon3.png", 710)
	drawLocation(canrJokes, sumrJokes, "./location_names/JokesEnd1.png", "./location_names/JokesEnd2.png", "./location_names/JokesEnd3.png", 755)
	
	if optionBowser() then
		drawLocation(canrBowser, sumrBowser, "./location_names/BowsersCastle1.png", "./location_names/BowsersCastle2.png", "./location_names/BowsersCastle3.png", 800)
		drawLocation(canrShop, sumrShop, "./location_names/Shops1.png", "./location_names/Shops2.png", "./location_names/Shops3.png", 868)
		drawLocation(canrTotal, sumrTotal, "./location_names/TOTAL1.png", "./location_names/TOTAL2.png", "./location_names/TOTAL3.png", 913)
		drawNumbers(canrBowser, sumrBowser, 800)
		drawNumbers(canrShop, sumrShop, 868)
		drawNumbers(canrTotal, sumrTotal, 913)
	else
		drawLocation(canrShop, sumrShop, "./location_names/Shops1.png", "./location_names/Shops2.png", "./location_names/Shops3.png", 823)
		drawLocation(canrTotal, sumrTotal, "./location_names/TOTAL1.png", "./location_names/TOTAL2.png", "./location_names/TOTAL3.png", 868)
		drawNumbers(canrShop, sumrShop, 823)
		drawNumbers(canrTotal, sumrTotal, 868)
	end
	
	
	drawNumbers(canrStardust, sumrStardust, 350)
	drawNumbers(canrHoohoo, sumrHoohoo, 395)
	drawNumbers(canrOutskirts, sumrOutskirts, 440)
	drawNumbers(canrCastleTown, sumrCastleTown, 485)
	drawNumbers(canrChucklehuck, sumrChucklehuck, 530)
	drawNumbers(canrHooniversity, sumrHooniversity, 575)
	drawNumbers(canrOasis, sumrOasis, 620)
	drawNumbers(canrTeehee, sumrTeehee, 665)
	drawNumbers(canrGwarhar, sumrGwarhar, 710)
	drawNumbers(canrJokes, sumrJokes, 755)
	
	
	
	
	
	
	
	
	-- gui.text(1, 45, canrStardust .. " / " .. sumrStardust .. " - Stardust")
	-- gui.text(1, 60, canrHoohoo .. " / " .. sumrHoohoo .. " - Mountain")
	-- gui.text(1, 75, canrOutskirts .. " / " .. sumrOutskirts .. " - Outskirts")
	-- gui.text(1, 90, canrCastleTown .. " / " .. sumrCastleTown .. " - Town")
	-- gui.text(1, 105, canrChucklehuck .. " / " .. sumrChucklehuck .. " - Woods")
	-- gui.text(1, 120, canrHooniversity .. " / " .. sumrHooniversity .. " - Hooniv.")
	-- gui.text(1, 135, canrOasis .. " / " .. sumrOasis .. " - Oasis")
	-- gui.text(1, 150, canrTeehee .. " / " .. sumrTeehee .. " - Teehee")
	-- gui.text(1, 165, canrGwarhar .. " / " .. sumrGwarhar .. " - Gwarhar")
	-- gui.text(1, 180, canrJokes .. " / " .. sumrJokes .. " - Joke's")

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	--[[ gui.text leftovers
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
	]]
end