refreshRate = 120
--backgroundColor = "#111111"
--boxWidth = 10
--boxHeight = 10
--itemtracker = forms.newform(20+(55*boxWidth), 20+(55*boxHeight), "MLSS Randomizer Item Tracker")
--picture_box = forms.pictureBox(itemtracker, 0, 0, 20+(55*boxWidth), 20+(55*boxHeight))
--forms.setDefaultBackgroundColor(picture_box, backgroundColor)
--forms.drawBox(picture_box,-5, -5, 25+(55*boxWidth), 25+(55*boxHeight), 0xFF00)



---- List of items
ramTable = {
-- Blocks
block_0x4564_1 = {1, 0x4564, "EWRAM", 1}, -- Stardust Fields
block_0x4564_0 = {1, 0x4564, "EWRAM", 0}, -- Stardust Fields
block_0x4564_2 = {1, 0x4564, "EWRAM", 2}, -- Stardust Fields
block_0x4564_4 = {1, 0x4564, "EWRAM", 4}, -- Stardust Fields
block_0x4564_5 = {1, 0x4564, "EWRAM", 5}, -- Stardust Fields
block_0x4564_3 = {1, 0x4564, "EWRAM", 3}, -- Stardust Fields
block_0x4564_6 = {1, 0x4564, "EWRAM", 6}, -- Stardust Fields
block_0x4565_0 = {1, 0x4565, "EWRAM", 0}, -- Stardust Fields
block_0x4564_7 = {1, 0x4564, "EWRAM", 7}, -- Stardust Fields
block_0x4565_1 = {1, 0x4565, "EWRAM", 1}, -- Stardust Fields
block_0x4565_2 = {1, 0x4565, "EWRAM", 2}, -- Stardust Fields
block_0x4565_3 = {1, 0x4565, "EWRAM", 3}, -- Stardust Fields
block_0x4565_7 = {1, 0x4565, "EWRAM", 7}, -- Stardust Fields
block_0x4566_0 = {1, 0x4566, "EWRAM", 0}, -- Stardust Fields
block_0x4566_1 = {1, 0x4566, "EWRAM", 1}, -- Stardust Fields
block_0x4565_4 = {1, 0x4565, "EWRAM", 4}, -- Stardust Fields
block_0x4565_5 = {1, 0x4565, "EWRAM", 5}, -- Stardust Fields
block_0x456F_6 = {1, 0x456F, "EWRAM", 6}, -- Stardust Fields
block_0x456F_7 = {1, 0x456F, "EWRAM", 7} -- Stardust Fields
}

function locationFlag(ItemAddress)
	bytevalue = memory.read_u8(ramTable[ItemAddress][2], ramTable[ItemAddress][3])
	
	bitvalue = 2^ramTable[ItemAddress][4]
	andedvalues = bytevalue & bitvalue
	if andedvalues > 0 then
		bitresult = 1
	else
		bitresult = 0
	end
	return bitresult
end

function refreshItems()
	locationTotal = 0
	locationTotal = locationTotal + locationFlag("block_0x4564_1")
	locationTotal = locationTotal + locationFlag("block_0x4564_0")
	locationTotal = locationTotal + locationFlag("block_0x4564_2")
	locationTotal = locationTotal + locationFlag("block_0x4564_4")
	locationTotal = locationTotal + locationFlag("block_0x4564_5")
	locationTotal = locationTotal + locationFlag("block_0x4564_3")
	locationTotal = locationTotal + locationFlag("block_0x4564_6")
	locationTotal = locationTotal + locationFlag("block_0x4565_0")
	locationTotal = locationTotal + locationFlag("block_0x4564_7")
	locationTotal = locationTotal + locationFlag("block_0x4565_1")
	locationTotal = locationTotal + locationFlag("block_0x4565_2")
	locationTotal = locationTotal + locationFlag("block_0x4565_3")
	locationTotal = locationTotal + locationFlag("block_0x4565_7")
	locationTotal = locationTotal + locationFlag("block_0x4566_0")
	locationTotal = locationTotal + locationFlag("block_0x4566_1")
	locationTotal = locationTotal + locationFlag("block_0x4565_4")
	locationTotal = locationTotal + locationFlag("block_0x4565_5")
	locationTotal = locationTotal + locationFlag("block_0x456F_6")
	locationTotal = locationTotal + locationFlag("block_0x456F_7")
	print(locationTotal)
end

while true do
	moduloRefresh = emu.framecount() % refreshRate
	if moduloRefresh == 0 then refreshItems() end
	emu.frameadvance();
end	