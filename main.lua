-- TODO: Fix Chucklehuck Woods bug


dofile("./options.lua")
dofile("./lua_required/tables.lua")
refreshItemFlags()
dofile("./lua_required/logic.lua")

boxWidth = 7
boxHeight = 0
backgroundColor = "#111111"

if item_tracker == true and location_tracker == true then
	boxHeight = 16.3
	if optionBowser() then boxHeight = boxHeight + 0.9 end
	
elseif item_tracker == true and location_tracker == false then
	boxHeight = 6
	
elseif item_tracker == false and location_tracker == true then
	boxHeight = 9.9
	if optionBowser() then boxHeight = boxHeight + 0.9 end
	
end

itemtracker = forms.newform(20+(55*boxWidth), 20+(55*boxHeight), "MLSS Randomizer Item Tracker")



local readTitleScreen = readRam("titleScreen")

if item_tracker == true then
	dofile("./lua_required/item_tracker.lua")
	if readTitleScreen ~= 0 then refreshItems() else forms.drawText(picture_box_items, 30, 100, "Load save file!", "#FFFFFF", "#111111", 36, nil, "bold") end
end

if location_tracker == true then
	dofile("./lua_required/location_tracker.lua")
	if item_tracker == false then if readTitleScreen ~= 0 then loadLocFlags() else forms.drawText(picture_box_locations, 30, 100, "Load save file!", "#FFFFFF", "#111111", 36, nil, "bold") end
	else if readTitleScreen ~= 0 then loadLocFlags() else forms.drawText(picture_box_locations, 30, 100, "Load save file!", "#FFFFFF", "#111111", 36, nil, "bold") end end
end

local framecount_old = 0
local framecount = 0

local ItemValues_old = 0
local ItemValues = refreshRawItemValues()

local LocationValues_old = 0
local LocationValues = refreshRawLocationValues()

local currentRoom_old = 0
local currentRoom_now = readRam("currentRoom")


while true do
	moduloRefresh = emu.framecount() % refreshRate
	readTitleScreen = readRam("titleScreen")
	framecount_old = framecount + 1
	framecount = emu.framecount()
	framecount_difference = math.abs(framecount - framecount_old)
	
	
	if readTitleScreen == 0 then
		if moduloRefresh == 0 then
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
		if (moduloRefresh == 0) or (framecount_difference > 7) then
			dofile("./options.lua")
			ItemValues_old = ItemValues
			ItemValues = refreshRawItemValues()
			currentRoom_old = currentRoom_now
			currentRoom_now = readRam("currentRoom")
			booleanItem = ItemValues_old ~= ItemValues
			booleanRoom = currentRoom_old ~= currentRoom_now
			if item_tracker == true and (booleanItem or booleanRoom) then
				forms.clear(picture_box_items, backgroundColor)
				refreshItems()	
				forms.refresh(picture_box_items)
			end
			
			if location_tracker == true then
				LocationValues_old = LocationValues
				LocationValues = refreshRawLocationValues()
				if (LocationValues_old ~= LocationValues) or booleanItem or booleanRoom then
					forms.clear(picture_box_locations, backgroundColor)
					loadLocFlags()
					forms.refresh(picture_box_locations)
				end
			end
		end
	end
	emu.frameadvance()
end