dofile("./options.lua")
dofile("./lua_extras/tables.lua")
dofile("./lua_extras/logic.lua")

local readTitleScreen = readRam("titleScreen")

if item_tracker == true then
	dofile("./lua_extras/item_tracker.lua")
	if readTitleScreen ~= 0 then refreshItems() else forms.drawText(picture_box, 30, 400, "Load save file!", "#FFFFFF", "#111111", 36, nil, "bold")  end
end

if location_tracker == true then
	dofile("./lua_extras/location_tracker.lua")
end

local refreshRate = 120
local framecount_old = 0
local framecount = 0




while true do
	moduloRefresh = emu.framecount() % refreshRate
	readTitleScreen = readRam("titleScreen")
	framecount_old = framecount + 1
	framecount = emu.framecount()
	
	if readTitleScreen == 0 then
		if moduloRefresh == 0 then
			forms.clear(picture_box, backgroundColor)
			forms.drawText(picture_box, 30, 400, "Load save file!", "#FFFFFF", "#111111", 36, nil, "bold") 
			forms.refresh(picture_box)
		end 
	else
		if (moduloRefresh == 0) or (framecount_old ~= framecount) then
			dofile("./options.lua")
			forms.clear(picture_box, backgroundColor)
			
			if item_tracker == true then
				refreshItems()
			end
			
			refreshItemFlags()
			
			if location_tracker == true then
				loadLocFlags()
			end
			
			forms.refresh(picture_box)
		end
	end
	emu.frameadvance()
end