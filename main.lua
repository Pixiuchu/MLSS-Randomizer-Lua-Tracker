dofile("./options.lua")
dofile("./lua_extras/tables.lua")
dofile("./lua_extras/logic.lua")

boxWidth = 7
boxHeight = 0
backgroundColor = "#111111"

if item_tracker == true and location_tracker == true then
	boxHeight = 15.4
	if optionBowser() then boxHeight = boxHeight + 0.9 end
	
elseif item_tracker == true and location_tracker == false then
	boxHeight = 6
	
elseif item_tracker == false and location_tracker == true then
	boxHeight = 9
	if optionBowser() then boxHeight = boxHeight + 0.9 end
	
end

itemtracker = forms.newform(20+(55*boxWidth), 20+(55*boxHeight), "MLSS Randomizer Item Tracker")



local readTitleScreen = readRam("titleScreen")

if item_tracker == true then
	dofile("./lua_extras/item_tracker.lua")
	if readTitleScreen ~= 0 then refreshItems() else forms.drawText(picture_box_items, 30, 100, "Load save file!", "#FFFFFF", "#111111", 36, nil, "bold") end
end

if location_tracker == true then
	dofile("./lua_extras/location_tracker.lua")
	if item_tracker == false then if readTitleScreen ~= 0 then loadLocFlags() else forms.drawText(picture_box_locations, 30, 100, "Load save file!", "#FFFFFF", "#111111", 36, nil, "bold") end
	else if readTitleScreen ~= 0 then loadLocFlags() else forms.drawText(picture_box_locations, 30, 100, "Load save file!", "#FFFFFF", "#111111", 36, nil, "bold") end end
end

local framecount_old = 0
local framecount = 0

local ItemValues_old = 0
local ItemValues = refreshRawItemValues()

local LocationValues_old = 0
local LocationValues = refreshRawLocationValues()


while true do
	moduloRefreshItems = emu.framecount() % items_refreshRate
	moduloRefreshLocations = emu.framecount() % locations_refreshRate
	readTitleScreen = readRam("titleScreen")
	framecount_old = framecount + 1
	framecount = emu.framecount()
	framecount_difference = math.abs(framecount - framecount_old)
	
	if readTitleScreen == 0 then
		if moduloRefreshItems == 0 then
			if item_tracker == true then
				forms.clear(picture_box_items, backgroundColor)
				forms.drawText(picture_box_items, 30, 200, "Load save file!", "#FFFFFF", "#111111", 36, nil, "bold") 
				forms.refresh(picture_box_items)
			else
				forms.clear(picture_box_locations, backgroundColor)
				forms.drawText(picture_box_locations, 30, 200, "Load save file!", "#FFFFFF", "#111111", 36, nil, "bold") 
				forms.refresh(picture_box_locations)
			end
		end 
	else
		if item_tracker == true then
			if (moduloRefreshItems == 0) or (framecount_difference > 7) then
				dofile("./options.lua")
				ItemValues_old = ItemValues
				ItemValues = refreshRawItemValues()
				if ItemValues_old ~= ItemValues then
					forms.clear(picture_box_items, backgroundColor)
					refreshItems()	
					forms.refresh(picture_box_items)
				end
			end
		end
		if location_tracker == true then
			if (moduloRefreshLocations == 0) then
				dofile("./options.lua")
				LocationValues_old = LocationValues
				LocationValues = refreshRawLocationValues()
				if LocationValues_old ~= LocationValues then
					forms.clear(picture_box_locations, backgroundColor)
					loadLocFlags()
					forms.refresh(picture_box_locations)
				end
			end
		end
				
	end
	emu.frameadvance()
end