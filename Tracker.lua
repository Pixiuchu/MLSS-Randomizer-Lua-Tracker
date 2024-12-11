local bizwidth = client.screenwidth()
local bizheight = client.screenheight()
local GameWidth = client.bufferwidth()
local GameHeight = client.screenheight()
itemtracker = forms.newform(405, 295, "MLSS Randomizer Item Tracker") 
picture_box = forms.pictureBox(itemtracker, 0, 0, 405, 295)
forms.setDefaultBackgroundColor(picture_box,0xFF111111)
forms.drawBox(picture_box,-5, -5, 410, 300, 0xFF00)
forms.clearImageCache(picture_box)

local ItemByte = 0x48E2
local ItemTable = { 
{0, "Mushroom"}, -- 48E2
{1, "Super Mushroom"},
{2, "Ultra Mushroom"},
{3, "Max Mushroom"},
{4, "Nuts"},
{5, "Super Nuts"},
{6, "Ultra Nuts"},
{7, "Max Nuts"},
{8, "Syrup"},
{9, "Super Syrup"},
{10, "Ultra Syrup"},
{11, "Max Syrup"},
{12, "1-Up Mushroom"},
{13, "1-Up Super"},
{14, "Golden Mushroom"},
{15, "Refreshing Herb"},
{16, "Red Pepper"},
{17, "Green Pepper"},
{18, "Woohoo Blend"},
{19, "Hoohoo Blend"},
{20, "Chuckle Blend"},
{21, "Teehee Blend"},
{22, "Hoolumbian"},
{23, "Chuckoccino"},
{24, "Teeheespresso"},
{40, 0, "Beanbean Map"}, -- Byte, 26
{40, 1, "Peasley's Rose", "./items/PeasleysRose.png", "./disabled_items/PeasleysRose.png"}, -- 27
{40, 2, "Beanbean Brooch", "./items/BeanbeanBrooch.png", "./disabled_items/BeanbeanBrooch.png"}, -- 28
{40, 3, "Red Goblet", "./items/RedGoblet.png", "./disabled_items/RedGoblet.png"}, -- 29
{40, 4, "Green Goblet", "./items/GreenGoblet.png", "./disabled_items/GreenGoblet.png"}, -- 30
{40, 5, "Red Chuckola Fruit", "./items/ChuckolaFruitRed.png", "./disabled_items/ChuckolaFruitRed.png"}, -- 31
{40, 6, "White Chuckola Fruit", "./items/ChuckolaFruitWhite.png", "./disabled_items/ChuckolaFruitWhite.png"}, -- 32
{40, 7, "Purple Chuckola Fruit", "./items/ChuckolaFruitPurple.png", "./disabled_items/ChuckolaFruitPurple.png"}, -- 33
{41, 0, "Membership Card", "./items/MembershipCard.png", "./disabled_items/MembershipCard.png"}, -- Byte, 34
{41, 1, "Winkle Card", "./items/WinkleCard.png", "./disabled_items/WinkleCard.png"}, -- 35
{41, 2, "Peach's Extra Dress", "./items/PeachsExtraDress.png", "./disabled_items/PeachsExtraDress.png"}, -- 36
{41, 3, "Fake Beanstar", "./items/FakeBeanstar.png", "./disabled_items/FakeBeanstar.png"}, -- 37
{41, 4, "Crabbie Grass"}, -- 38
{41, 5, "Red Pearl Bean", "./items/RedPearlBean.png", "./disabled_items/RedPearlBean.png"}, -- 39
{41, 6, "Green Pearl Bean", "./items/GreenPearlBeanGreenPearlBean.png", "./disabled_items/GreenPearlBean.png"}, -- 40
{41, 7, "Bean Fruit (1)", "./items/BeanFruit.png", "./disabled_items/BeanFruit.png"}, -- 41
{42, 0, "Bean Fruit (2)", "./items/BeanFruit.png", "./disabled_items/BeanFruit.png"}, -- Byte, 42
{42, 1, "Bean Fruit (3)", "./items/BeanFruit.png", "./disabled_items/BeanFruit.png"}, -- 43
{42, 2, "Bean Fruit (4)", "./items/BeanFruit.png", "./disabled_items/BeanFruit.png"}, -- 44
{42, 3, "Bean Fruit (5)", "./items/BeanFruit.png", "./disabled_items/BeanFruit.png"}, -- 45
{42, 4, "Bean Fruit (6)", "./items/BeanFruit.png", "./disabled_items/BeanFruit.png"}, -- 46
{42, 5, "Bean Fruit (7)", "./items/BeanFruit.png", "./disabled_items/BeanFruit.png"}, -- 47
{42, 6, "Blue Neon Egg", "./items/NeonEggBlue.png", "./disabled_items/NeonEggBlue.png"}, -- 48
{42, 7, "Red Neon Egg", "./items/NeonEggRed.png", "./disabled_items/NeonEggRed.png"}, -- 49
{43, 0, "Green Neon Egg", "./items/NeonEggGreen.png", "./disabled_items/NeonEggGreen.png"}, -- Byte, 50
{43, 1, "Yellow Neon Egg", "./items/NeonEggYellow.png", "./disabled_items/NeonEggYellow.png"}, -- 51
{43, 2, "Purple Neon Egg", "./items/NeonEggPurple.png", "./disabled_items/NeonEggPurple.png"}, -- 52
{43, 3, "Orange Neon Egg", "./items/NeonEggOrange.png", "./disabled_items/NeonEggOrange.png"}, -- 53
{43, 4, "Azure Neon Egg", "./items/NeonEggAzure.png", "./disabled_items/NeonEggAzure.png"}, -- 54
{43, 5, "Beanstar Piece (1)", "./items/BeanstarPiece1.png", "./disabled_items/BeanstarPiece1.png"}, -- 55
{43, 6, "Beanstar Piece (2)", "./items/BeanstarPiece2.png", "./disabled_items/BeanstarPiece2.png"}, -- 56
{43, 7, "Beanstar Piece (3)", "./items/BeanstarPiece3.png", "./disabled_items/BeanstarPiece3.png"}, -- 57
{44, 0, "Beanstar Piece (4)", "./items/BeanstarPiece4.png", "./disabled_items/BeanstarPiece4.png"}, -- Byte, 58
{44, 1, "Beanstar", "./items/RealBeanstar.png", "./disabled_items/RealBeanstar.png"}, -- 59
{44, 2, "Spangle", "./items/Spangle.png", "./disabled_items/Spangle.png"}, -- 60
{44, 3, "Beanlet (1)"}, -- 61
{44, 4, "Beanlet (2)"}, -- 62
{44, 5, "Beanlet (3)"}, -- 63
{44, 6, "Beanlet (4)"}, -- 64
{44, 7, "Beanlet (5)"}, -- 65
{45, 0, "Beanstone (1)"}, -- Byte, 66
{45, 1, "Beanstone (2)"}, -- 67
{45, 2, "Beanstone (3)"}, -- 68
{45, 3, "Beanstone (4)"}, -- 69
{45, 4, "Beanstone (5)"}, -- 70
{45, 5, "Beanstone (6)"}, -- 71
{45, 6, "Beanstone (7)"}, -- 72
{45, 7, "Beanstone (8)"}, -- 73
{46, 0, "Beanstone (9)"}, -- 74
{46, 1, "Beanstone (10)"}, -- 75
{46, 2, "Secret Scroll 1", "./items/SecretScroll1.png", "./disabled_items/SecretScroll1.png"}, -- 76
{46, 3, "Secret Scroll 2", "./items/SecretScroll2.png", "./disabled_items/SecretScroll2.png"}, -- 77
{-1450, 3, "Hammers", "./items/Hammers.png", "./disabled_items/Hammers.png"}, -- 78
{-1450, 4, "Super Hammeres", "./items/Hammers2.png"}, -- 79
{-1450, 5, "Ultra Hammers", "./items/Hammers3.png"}, -- 80
{-1449, 0, "Firebrand", "./items/FirebrandFlame.png", "./disabled_items/FirebrandFlame.png"}, -- 81
{-1449, 1, "Thunderhand", "./items/ThunderhandSpark.png", "./disabled_items/ThunderhandSpark.png"}, -- 82
{160, "Greed Wallet"}, -- $4982, 78
{161, "Bonus Ring"}, -- 79
{162, "Excite Spring"}, -- 80
{163, "Great Force"}, -- 81
{164, "Power Grip"}, -- 82
{165, "Cobalt Necktie"}, -- 83
{166, "GameBoy Horror SP"} -- 84
--
---- Badges
--[48] = {"Bean Badge"},
--[49] = {"Castle Badge"},
--[50] = {"Pea Badge"},
--[51] = {"Bean B. Badge"},
--[52] = {"Counter Badge"},
--[53] = {"Charity Badge"},
--[54] = {"Bros. Badge"},
--[55] = {"Miracle Badge"},
--[56] = {"Ohoracle Badge"},
--[57] = {"Mush Badge"},
--[58] = {"Mari-Lui Badge"},
--[59] = {"Muscle Badge"},
--[60] = {"Spiny Badge AA"},
--[61] = {"Mush Badge A"},
--[62] = {"Grab Badge"},
--[63] = {"Mush Badge AA"},
--[64] = {"Power Badge"},
--[65] = {"Wonder Badge"},
--[66] = {"Beauty Badge"},
--[67] = {"Salvage Badge"},
--[68] = {"Oh-Pah Badge"},
--[69] = {"Brilliant Badge"},
--[70] = {"Sarge Badge"},
--[71] = {"General Badge"},
--[72] = {"Tank Badge"},
--[73] = {"School Emblem"},
--[74] = {"Steady Badge"},
--[75] = {"Oho Jee Symbol"},
--[76] = {"Spiny Badge A"},
--[77] = {"Bros. Life"},
--[78] = {"Piranha Swing"},
--[79] = {"Bros. Rock"},
--[80] = {"Lucky Ribbon"},
--[81] = {"Mush Badge A"}, 
--[82] = {"Soulful Bros."},
--[83] = {"High-End Badge"},
--[84] = {"Hand Aura"},
--[85] = {"Sledge Heart"},
--[86] = {"Lucky Bros."},
--[87] = {"Bros. Respect"},
--[88] = {"Bowser Fist"},
--[89] = {"Bowser Fang"},
--[90] = {"Spike Badge"},
--[91] = {"Chuckola Badge"},
--
---- Pants
--[104] = {"Work Pants"},
--[105] = {"Work Jeans"},
--[106] = {"Bean Pants"},
--[107] = {"Bean Trousers"},
--[108] = {"Blue Jeans"},
--[109] = {"Parasol Pants"},
--[110] = {"Hard Pants"},
--[111] = {"Heart Jeans"},
--[112] = {"Plaid Trousers"},
--[113] = {"#1 Trousers"},
--[114] = {"Safety Slacks"},
--[115] = {"Shroom Pants"},
--[116] = {"Shroom Bells"},
--[117] = {"Shroom Slacks"},
--[118] = {"Peachy Jeans"},
--[119] = {"Mushwin Pants"},
--[120] = {"Mushluck Pants"},
--[121] = {"Scandal Jeans"},
--[122] = {"Street Jeans"},
--[123] = {"Tropic Slacks"},
--[124] = {"Hermetic Pants"},
--[125] = {"Beanstar Pants"},
--[126] = {"Peasley Slacks"},
--[127] = {"Queen B. Jeans"},
--[128] = {"B. Brand Jeans"},
--[129] = {"Heart Slacks"},
--[130] = {"Casual Slacks"},
--[131] = {"Bubble's Gear"},
--[132] = {"Chuckola Pants"}, 
--[133] = {"Smart Pants"},
--[134] = {"School Slacks"},
--[135] = {"Oho Jee Wear"},
--[136] = {"Oho Gear"},
--[137] = {"Casual Coral"},
--[138] = {"Piranha Suit"},
--[139] = {"Anuboo Jeans"},
--[140] = {"Ancient Pants"},
--[141] = {"Heavy Slacks"},
--[142] = {"Light Slacks"},
--[143] = {"Harhall's Pants"},
--[144] = {"Jeanie Jeans"},
--[145] = {"Wool Trousers"},
--[146] = {"Random Slacks"},
--[147] = {"Jeaniest Jeans"},
--[148] = {"Safe Guard"},
--[149] = {"Iron Pants"},
--
}

function itemFlag(ItemAddress)
	value1 = memory.read_u8(ItemTable[ItemAddress][1]+ItemByte, "EWRAM")
	value2 = 2^ItemTable[ItemAddress][2]
	andedvalues = value1 & value2
	if andedvalues > 0 then
		bitresult = 1
	else
		bitresult = 0
	end
	
	return bitresult
end
	
function itemStatus(ItemAddress, XPos, YPos)
	if ItemAddress >= 78 and ItemAddress <= 80 then
		ReadHammers = itemFlag(78) + itemFlag(79) + itemFlag(80)
		if ReadHammers == 0 then
			drawImage = forms.drawImage(picture_box, ItemTable[78][5], 10+((XPos-1)*55), 10+((YPos-1)*55))
		elseif ReadHammers == 1 then
			drawImage = forms.drawImage(picture_box, ItemTable[78][4], 10+((XPos-1)*55), 10+((YPos-1)*55))
		elseif ReadHammers == 2 then
			drawImage = forms.drawImage(picture_box, ItemTable[79][4], 10+((XPos-1)*55), 10+((YPos-1)*55))
		elseif ReadHammers == 3 then
			drawImage = forms.drawImage(picture_box, ItemTable[80][4], 10+((XPos-1)*55), 10+((YPos-1)*55))
		end
	else
		if itemFlag(ItemAddress) == 0 then
			drawImage = forms.drawImage(picture_box, ItemTable[ItemAddress][5], 10+((XPos-1)*55), 10+((YPos-1)*55))
		else
			drawImage = forms.drawImage(picture_box, ItemTable[ItemAddress][4], 10+((XPos-1)*55), 10+((YPos-1)*55))
		end
	end
	
	return drawImage
end

function refreshItems()
	PeasleysRose = itemStatus(27, 2, 1)
	BeanbeanBrooch = itemStatus(28, 3, 1)
	RedGoblet = itemStatus(29, 1, 2)
	GreenGoblet = itemStatus(30, 1, 3)
	RedChuckolaFruit = itemStatus(31, 4, 1)
	WhiteChuckolaFruit = itemStatus(32,4, 2)
	PurpleChuckoloaFruit = itemStatus(33, 4, 3)
	MembershipCard = itemStatus(34, 5, 3)
	WinkleCard = itemStatus(35, 6, 3)
	PeachsExtraDress = itemStatus(36, 5, 2)
	FakeBeanstar = itemStatus(37, 5, 1)
	RedPearlBean = itemStatus(39, 3, 2)
	GreenPearlBean = itemStatus(40, 3, 3)
	BeanFruit1 = itemStatus(41, 1, 4)
	BeanFruit2 = itemStatus(42, 2, 4)
	BeanFruit3 = itemStatus(43, 3, 4)
	BeanFruit4 = itemStatus(44, 4, 4)
	BeanFruit5 = itemStatus(45, 5, 4)
	BeanFruit6 = itemStatus(46, 6, 4)
	BeanFruit7 = itemStatus(47, 7, 4)
	NeonEggBlue = itemStatus(48, 1, 5)
	NeonEggRed = itemStatus(49, 2, 5)
	NeonEggGreen = itemStatus(50, 3, 5)
	NeonEggYellow = itemStatus(51, 4, 5)
	NeonEggPurple = itemStatus(52, 5, 5)
	NeonEggOrange = itemStatus(53, 6, 5)
	NeonEggAzure = itemStatus(54, 7, 5)
	BeanstarPiece1 = itemStatus(55, 6, 1)
	BeanstarPiece2 = itemStatus(56, 7, 1)
	BeanstarPiece3 = itemStatus(57, 7, 2)
	BeanstarPiece4 = itemStatus(58, 6, 2)
	--RealBeanstar = itemStatus(59)
	Spangle = itemStatus(60, 7, 3)
	--SecretScroll1 = itemStatus(76)
	--SecretScroll2 = itemStatus(77)
	Hammers = itemStatus(78, 1, 1)
	SuperHammers = itemStatus(79, 1, 1)
	UltraHammers = itemStatus(80, 1, 1)
	Firebrand = itemStatus(81, 2, 2)
	Thunderhand = itemStatus(82, 2, 3)
end


while true do
	refreshItems()
	forms.refresh(picture_box)
	emu.frameadvance();
end

