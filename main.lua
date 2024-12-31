dofile("./options.lua")
dofile("./lua_required/tables.lua")
refreshItemFlags()
dofile("./lua_required/logic.lua")

boxWidth = 0
boxHeight = 0
backgroundColor = "#111111"

if item_tracker == true and location_tracker == true then
	boxWidth = 15
	boxHeight = 10
	if optionBowser() then boxHeight = boxHeight + 0.8 end
	
elseif item_tracker == true and location_tracker == false then
	boxWidth = 7
	boxHeight = 6
	if readRam("requiredEmblems") > 0 then boxHeight = boxHeight + 1.5 end
	
elseif item_tracker == false and location_tracker == true then
	boxWidth = 7
	boxHeight = 9.9
	if optionBowser() then boxHeight = boxHeight + 0.9 end
	
end

itemtracker = forms.newform(20+(55*boxWidth), 20+(55*boxHeight), "MLSS Randomizer Item Tracker")
picture_box = forms.pictureBox(itemtracker, 0, 0, 20+(55*boxWidth), 20+(55*boxHeight))
forms.setDefaultBackgroundColor(picture_box, backgroundColor)
forms.drawBox(picture_box,-5, -5, 25+(55*boxWidth), 25+(55*boxHeight), 0xFF00)

local readTitleScreen = readRam("titleScreen")

if item_tracker == true then
	dofile("./lua_required/item_tracker.lua")
	if readTitleScreen ~= 0 then refreshItems() else forms.drawText(picture_box, 30, 200, "Load save file!", "#FFFFFF", "#111111", 36, nil, "bold") end
end

if location_tracker == true then
	dofile("./lua_required/location_tracker.lua")
	if item_tracker == false then if readTitleScreen ~= 0 then loadLocFlags() else forms.drawText(picture_box, 30, 200, "Load save file!", "#FFFFFF", "#111111", 36, nil, "bold") end
	else if readTitleScreen ~= 0 then loadLocFlags() else forms.drawText(picture_box, 30, 200, "Load save file!", "#FFFFFF", "#111111", 36, nil, "bold") end end
end

local framecount_old = 0
local framecount = 0

local ItemValues_old = 0
local ItemValues = refreshRawItemValues()

local LocationValues_old = 0
local LocationValues = refreshRawLocationValues()

local currentRoom_old = 0
local currentRoom_now = readRam("currentRoom")

local nextRoom_old = 0
local nextRoom_now = readRam("nextRoom")

local roomDoFreeze_old = false
local roomDoFreeze = false
local roomRefresh = false

while true do
	framecount_old = framecount + 1
	framecount = emu.framecount()
	moduloRefresh = framecount % refreshRate
	readTitleScreen = readRam("titleScreen")
	framecount_difference = math.abs(framecount - framecount_old)
	nextRoom_now = readRam("nextRoom")
	currentRoom_old = currentRoom_now
	currentRoom_now = readRam("currentRoom")
	roomDoFreeze_old = roomDoFreeze
	if nextRoom_now == 0x095 or 								-- Chuckleroot room
	  (nextRoom_now >= 0x0B0 and nextRoom_now <= 0x0B7) or		-- Palace rooms
	   nextRoom_now == 0x0FD or									-- Gwarhar Relaxation room
	  (nextRoom_now >= 0x1D5 and nextRoom_now <= 0x1DD) or		-- Pearl Bean Tutorial rooms
	   nextRoom_now == 0x0FF then 								-- Hermie room
		roomDoFreeze = true else roomDoFreeze = false
	end
	local nextRoomChanged = currentRoom_old ~= nextRoom_now
	local roomDoFreezeChanged = roomDoFreeze_old ~= roomDoFreeze
	
	
	if nextRoomChanged and roomDoFreezeChanged then roomRefresh = true else roomRefresh = false end
	
	if readTitleScreen == 0 or readTitleScreen == 226 then
		if moduloRefresh == 0 then
			forms.clear(picture_box, backgroundColor)
			forms.drawText(picture_box, 30, 200, "Load save file!", "#FFFFFF", "#111111", 36, nil, "bold") 
			forms.refresh(picture_box)
		end 
	else
		if roomDoFreeze == true then 
		elseif (moduloRefresh == 0) or (framecount_difference > 7) or (roomRefresh == true) then
			emu.frameadvance()
			dofile("./options.lua")
			ItemValues_old = ItemValues
			ItemValues = refreshRawItemValues()
			booleanItem = ItemValues_old ~= ItemValues
			booleanRoom = currentRoom_old ~= currentRoom_now
			LocationValues_old = LocationValues
			LocationValues = refreshRawLocationValues()
			if booleanItem or booleanRoom or (LocationValues_old ~= LocationValues) then
				forms.clear(picture_box, backgroundColor)
				if item_tracker == true then refreshItems()	end
				if location_tracker == true then loadLocFlags() end
				forms.refresh(picture_box)
				forms.drawBox(picture_box, 400, -5, 415, 650, nil, "#777777")
			end
		end
	end
	emu.frameadvance()
end