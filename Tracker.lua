refreshRate = 180
backgroundColor = "#111111"
boxWidth = 7
boxHeight = 6
itemtracker = forms.newform(20+(55*boxWidth), 20+(55*boxHeight), "MLSS Randomizer Item Tracker")
picture_box = forms.pictureBox(itemtracker, 0, 0, 20+(55*boxWidth), 20+(55*boxHeight))
forms.setDefaultBackgroundColor(picture_box, backgroundColor)
forms.drawBox(picture_box,-5, -5, 25+(55*boxWidth), 25+(55*boxHeight), 0xFF00)



---- List of items
-- i stands for item
-- any name ending with _Rando is a ram address specific to the randomizer
ramTable = {
-- Generic values
titleScreen = {0, 0x0FFB, "IWRAM"},
currentRoom = {0, 0x2332, "IWRAM"},


--iMushroom1 = {0, 0x48E2, "EWRAM", "Mushroom"}, -- 48E2
--iMushroom2 = {0, 0x48E3, "EWRAM", "Super Mushroom"},
--iMushroom3 = {0, 0x48E4, "EWRAM", "Ultra Mushroom"},
--iMushroom4 = {0, 0x48E5, "EWRAM", "Max Mushroom"},
--iNuts1 = {0, 0x48E6, "EWRAM", "Nuts"},
--iNuts2 = {0, 0x48E7, "EWRAM", "Super Nuts"},
--iNuts3 = {0, 0x48E8, "EWRAM", "Ultra Nuts"},
--iNuts4 = {0, 0x48E9, "EWRAM", "Max Nuts"},
--iSyrup1 = {0, 0x48EA, "EWRAM", "Syrup"},
--iSyrup2 = {0, 0x48EB, "EWRAM", "Super Syrup"},
--iSyrup3 = {0, 0x48EC, "EWRAM", "Ultra Syrup"},
--iSyrup4 = {0, 0x48ED, "EWRAM", "Max Syrup"},
--iRevivemushroom1 = {0, 0x48EE, "EWRAM", "1-Up Mushroom"},
--iRevivemushroom2 = {0, 0x48EF, "EWRAM", "1-Up Super"},
--iMushroomgold = {0, 0x48F0, "EWRAM", "Golden Mushroom"},
--iRefreshingherb = {0, 0x48F1, "EWRAM", "Refreshing Herb"},
--iPepperred = {0, 0x48F2, "EWRAM", "Red Pepper"},
--iPeppergreen = {0, 0x48F3, "EWRAM", "Green Pepper"},
--iWoohooblend = {0, 0x48F4, "EWRAM", "Woohoo Blend"},
--iHoohooblend = {0, 0x48F5, "EWRAM", "Hoohoo Blend"},
--iChuckleblend = {0, 0x48F6, "EWRAM", "Chuckle Blend"},
--iTeeheeblend = {0, 0x48F7, "EWRAM", "Teehee Blend"},
--iHoolumbian = {0, 0x48F8, "EWRAM", "Hoolumbian"},
--iChuckoccino = {0, 0x48F9, "EWRAM", "Chuckoccino"},
--iTeeheespresso = {0, 0x48FA, "EWRAM", "Teeheespresso"},
--iBeanbeanMap  = {1, 0x490A, "EWRAM", 0, "Beanbean Map"}, -- Byte, 26
iPeasleysRose = {1, 0x490A, "EWRAM", 1, "Peasley's Rose", "./items/PeasleysRose.png", "./disabled_items/PeasleysRose.png"}, -- 27
iBeanbeanBrooch = {1, 0x490A, "EWRAM", 2, "Beanbean Brooch", "./items/BeanbeanBrooch.png", "./disabled_items/BeanbeanBrooch.png"}, -- 28
iRedGoblet = {1, 0x490A, "EWRAM", 3, "Red Goblet", "./items/RedGoblet.png", "./disabled_items/RedGoblet.png"}, -- 29
iGreenGoblet = {1, 0x490A, "EWRAM", 4, "Green Goblet", "./items/GreenGoblet.png", "./disabled_items/GreenGoblet.png"}, -- 30
iRedChuckolaFruit = {1, 0x490A, "EWRAM", 5, "Red Chuckola Fruit", "./items/ChuckolaFruitRed.png", "./disabled_items/ChuckolaFruitRed.png"}, -- 31
iWhiteChuckolaFruit = {1, 0x490A, "EWRAM", 6, "White Chuckola Fruit", "./items/ChuckolaFruitWhite.png", "./disabled_items/ChuckolaFruitWhite.png"}, -- 32
iPurpleChuckoloaFruit = {1, 0x490A, "EWRAM", 7, "Purple Chuckola Fruit", "./items/ChuckolaFruitPurple.png", "./disabled_items/ChuckolaFruitPurple.png"}, -- 33
iMembershipCard = {1, 0x490B, "EWRAM", 0, "Membership Card", "./items/MembershipCard.png", "./disabled_items/MembershipCard.png"}, -- Byte, 34
iWinkleCard = {1, 0x490B, "EWRAM", 1, "Winkle Card", "./items/WinkleCard.png", "./disabled_items/WinkleCard.png"}, -- 35
iPeachsExtraDress = {1, 0x490B, "EWRAM", 2, "Peach's Extra Dress", "./items/PeachsExtraDress.png", "./disabled_items/PeachsExtraDress.png"}, -- 36
iFakeBeanstar = {1, 0x490B, "EWRAM", 3, "Fake Beanstar", "./items/FakeBeanstar.png", "./disabled_items/FakeBeanstar.png"}, -- 37
iCrabbieGrass = {1, 0x490B, "EWRAM", 4, "Crabbie Grass"}, -- 38
iRedPearlBean = {1, 0x490B, "EWRAM", 5, "Red Pearl Bean", "./items/RedPearlBean.png", "./disabled_items/RedPearlBean.png"}, -- 39
iGreenPearlBean = {1, 0x490B, "EWRAM", 6, "Green Pearl Bean", "./items/GreenPearlBean.png", "./disabled_items/GreenPearlBean.png"}, -- 40
iBeanFruit1 = {1, 0x490B, "EWRAM", 7, "Bean Fruit (1)", "./items/BeanFruit.png", "./disabled_items/BeanFruit.png"}, -- 41
iBeanFruit2 = {1, 0x490C, "EWRAM", 0, "Bean Fruit (2)", "./items/BeanFruit.png", "./disabled_items/BeanFruit.png"}, -- Byte, 42
iBeanFruit3 = {1, 0x490C, "EWRAM", 1, "Bean Fruit (3)", "./items/BeanFruit.png", "./disabled_items/BeanFruit.png"}, -- 43
iBeanFruit4 = {1, 0x490C, "EWRAM", 2, "Bean Fruit (4)", "./items/BeanFruit.png", "./disabled_items/BeanFruit.png"}, -- 44
iBeanFruit5 = {1, 0x490C, "EWRAM", 3, "Bean Fruit (5)", "./items/BeanFruit.png", "./disabled_items/BeanFruit.png"}, -- 45
iBeanFruit6 = {1, 0x490C, "EWRAM", 4, "Bean Fruit (6)", "./items/BeanFruit.png", "./disabled_items/BeanFruit.png"}, -- 46
iBeanFruit7 = {1, 0x490C, "EWRAM", 5, "Bean Fruit (7)", "./items/BeanFruit.png", "./disabled_items/BeanFruit.png"}, -- 47
iNeonEggBlue = {1, 0x490C, "EWRAM", 6, "Blue Neon Egg", "./items/NeonEggBlue.png", "./disabled_items/NeonEggBlue.png"}, -- 48
iNeonEggRed = {1, 0x490C, "EWRAM", 7, "Red Neon Egg", "./items/NeonEggRed.png", "./disabled_items/NeonEggRed.png"}, -- 49
iNeonEggGreen = {1, 0x490D, "EWRAM", 0, "Green Neon Egg", "./items/NeonEggGreen.png", "./disabled_items/NeonEggGreen.png"}, -- Byte, 50
iNeonEggYellow = {1, 0x490D, "EWRAM", 1, "Yellow Neon Egg", "./items/NeonEggYellow.png", "./disabled_items/NeonEggYellow.png"}, -- 51
iNeonEggPurple = {1, 0x490D, "EWRAM", 2, "Purple Neon Egg", "./items/NeonEggPurple.png", "./disabled_items/NeonEggPurple.png"}, -- 52
iNeonEggOrange = {1, 0x490D, "EWRAM", 3, "Orange Neon Egg", "./items/NeonEggOrange.png", "./disabled_items/NeonEggOrange.png"}, -- 53
iNeonEggAzure = {1, 0x490D, "EWRAM", 4, "Azure Neon Egg", "./items/NeonEggAzure.png", "./disabled_items/NeonEggAzure.png"}, -- 54
iBeanstarPiece1 = {1, 0x490D, "EWRAM", 5, "Beanstar Piece (1)", "./items/BeanstarPiece1.png", "./disabled_items/BeanstarPiece1.png"}, -- 55
iBeanstarPiece2 = {1, 0x490D, "EWRAM", 6, "Beanstar Piece (2)", "./items/BeanstarPiece2.png", "./disabled_items/BeanstarPiece2.png"}, -- 56
iBeanstarPiece3 = {1, 0x490D, "EWRAM", 7, "Beanstar Piece (3)", "./items/BeanstarPiece3.png", "./disabled_items/BeanstarPiece3.png"}, -- 57
iBeanstarPiece4 = {1, 0x490E, "EWRAM", 0, "Beanstar Piece (4)", "./items/BeanstarPiece4.png", "./disabled_items/BeanstarPiece4.png"}, -- Byte, 58
iRealBeanstar = {1, 0x490E, "EWRAM", 1, "Beanstar", "./items/RealBeanstar.png", "./disabled_items/RealBeanstar.png"}, -- 59
iSpangle = {1, 0x490E, "EWRAM", 2, "Spangle", "./items/Spangle.png", "./disabled_items/Spangle.png"}, -- 60
iBeanlet1 = {1, 0x490E, "EWRAM", 3, "Beanlet (1)"}, -- 61
iBeanlet2 = {1, 0x490E, "EWRAM", 4, "Beanlet (2)"}, -- 62
iBeanlet3 = {1, 0x490E, "EWRAM", 5, "Beanlet (3)"}, -- 63
iBeanlet4 = {1, 0x490E, "EWRAM", 6, "Beanlet (4)"}, -- 64
iBeanlet5 = {1, 0x490E, "EWRAM", 7, "Beanlet (5)"}, -- 65
iBeanstone1 = {1, 0x490F, "EWRAM", 0, "Beanstone (1)"}, -- Byte, 66
iBeanstone2 = {1, 0x490F, "EWRAM", 1, "Beanstone (2)"}, -- 67
iBeanstone3 = {1, 0x490F, "EWRAM", 2, "Beanstone (3)"}, -- 68
iBeanstone4 = {1, 0x490F, "EWRAM", 3, "Beanstone (4)"}, -- 69
iBeanstone5 = {1, 0x490F, "EWRAM", 4, "Beanstone (5)"}, -- 70
iBeanstone6 = {1, 0x490F, "EWRAM", 5, "Beanstone (6)"}, -- 71
iBeanstone7 = {1, 0x490F, "EWRAM", 6, "Beanstone (7)"}, -- 72
iBeanstone8 = {1, 0x490F, "EWRAM", 7, "Beanstone (8)"}, -- 73
iBeanstone9 = {1, 0x4910, "EWRAM", 0, "Beanstone (9)"}, -- 74
iBeanstone10 = {1, 0x4910, "EWRAM", 1, "Beanstone (10)"}, -- 75
iSecretScroll1 = {1, 0x4910, "EWRAM", 2, "Secret Scroll 1", "./items/SecretScroll1.png", "./disabled_items/SecretScroll1.png"}, -- 76
iSecretScroll2 = {1, 0x4910, "EWRAM", 3, "Secret Scroll 2", "./items/SecretScroll2.png", "./disabled_items/SecretScroll2.png"}, -- 77
iHammers1 = {1, 0x4338, "EWRAM", 3, "Hammers", "./items/Hammers.png", "./disabled_items/Hammers.png"}, -- 78
iHammers2 = {1, 0x4338, "EWRAM", 4, "Super Hammers", "./items/Hammers2.png"}, -- 79
iHammers3 = {1, 0x4338, "EWRAM", 5, "Ultra Hammers", "./items/Hammers3.png"}, -- 80
iFirebrand = {1, 0x4339, "EWRAM", 0, "Firebrand", "./items/FirebrandFlame.png", "./disabled_items/FirebrandFlame.png"}, -- 81
iThunderhand = {1, 0x4339, "EWRAM", 1, "Thunderhand", "./items/ThunderhandSpark.png", "./disabled_items/ThunderhandSpark.png"}, -- 82
iGreedWallet = {0, 0x4982, "EWRAM", "Greed Wallet", "./items/GreedWallet.png", "./disabled_items/GreedWallet.png"}, -- $4982, 78
iBonusRing = {0, 0x4983, "EWRAM", "Bonus Ring", "./items/BonusRing.png", "./disabled_items/BonusRing.png"}, -- 79
iExciteSpring = {0, 0x4984, "EWRAM", "Excite Spring", "./items/ExciteSpring.png", "./disabled_items/ExciteSpring.png"}, -- 80
iGreatForce = {0, 0x4985, "EWRAM", "Great Force", "./items/GreatForce.png", "./disabled_items/GreatForce.png"}, -- 81
iPowerGrip = {0, 0x4986, "EWRAM", "Power Grip", "./items/PowerGrip.png", "./disabled_items/PowerGrip.png"}, -- 82
iCobaltNecktie = {0, 0x4987, "EWRAM", "Cobalt Necktie", "./items/CobaltNecktie.png", "./disabled_items/CobaltNecktie.png"}, -- 83
iGameBoyHorrorSP = {0, 0x4988, "EWRAM", "Game Boy Horror SP", "./items/GameBoyHorrorSP.png", "./disabled_items/GameBoyHorrorSP.png"}, -- 84


-- Story Flags
BeanstarFlag1 = {1, 0x430B, "EWRAM", 3},--Cutscene where you get Beanstar, Dress, Fake Beanstar, ...
BeanstarFlag2_Rando = {1, 0x3003, "EWRAM", 0}, --Cutscene where you get Beanstar, Dress, Fake Beanstar, ... 0x430B, but rando stores at 0x3003
}

function readRam(ItemAddress)
	bytevalue = memory.read_u8(ramTable[ItemAddress][2], ramTable[ItemAddress][3])
	return bytevalue
end

function itemFlag(ItemAddress)
	itemType = ramTable[ItemAddress][1]
	-- item type 0: integer
	-- item type 1: bit flag
	bytevalue = memory.read_u8(ramTable[ItemAddress][2], ramTable[ItemAddress][3])
	
	if itemType == 0 then
		if (bytevalue == 255) or (bytevalue == 0) then
			bitresult = 0
		else
			bitresult = 1
		end
	elseif itemType == 1 then
		bitvalue = 2^ramTable[ItemAddress][4]
		andedvalues = bytevalue & bitvalue
		if andedvalues > 0 then
			bitresult = 1
		else
			bitresult = 0
		end
	end
	return bitresult
end
	
function itemStatus(ItemAddress, XPos, YPos)
	itemType = ramTable[ItemAddress][1]
	-- Special check for Hammers
	if (ItemAddress == "iHammers1") or (ItemAddress == "iHammers2") or (ItemAddress == "iHammers3") then
		ReadHammers = itemFlag("iHammers1") + itemFlag("iHammers2") + itemFlag("iHammers3")
		if ReadHammers == 0 then
			drawImage = forms.drawImage(picture_box, ramTable["iHammers1"][7], 10+((XPos-1)*55), 10+((YPos-1)*55))
		elseif ReadHammers == 1 then
			drawImage = forms.drawImage(picture_box, ramTable["iHammers1"][6], 10+((XPos-1)*55), 10+((YPos-1)*55))
		elseif ReadHammers == 2 then
			drawImage = forms.drawImage(picture_box, ramTable["iHammers2"][6], 10+((XPos-1)*55), 10+((YPos-1)*55))
		elseif ReadHammers == 3 then
			drawImage = forms.drawImage(picture_box, ramTable["iHammers3"][6], 10+((XPos-1)*55), 10+((YPos-1)*55))
		end
	
	
	-- Special check for Beanstar Pieces + Real Beanstar special behaviour
	elseif (ItemAddress == "iBeanstarPiece1") or (ItemAddress == "iBeanstarPiece2") or (ItemAddress == "iBeanstarPiece3") or (ItemAddress == "iBeanstarPiece4") then
		--ReadBeanstarPieces = itemFlag("iBeanstarPiece1") + itemFlag("iBeanstarPiece2") + itemFlag("iBeanstarPiece3") + itemFlag("iBeanstarPiece4")
		if itemFlag("BeanstarFlag2_Rando") == 1 then
			drawImage = forms.drawImage(picture_box, ramTable["iRealBeanstar"][6], 10+((6.25-1)*55), 10+((1.25-1)*55))
		elseif (itemFlag("iRealBeanstar") == 0) and ((itemFlag("BeanstarFlag1") == 0) or (itemFlag("BeanstarFlag1") == 1)) then
			if (itemFlag(ItemAddress)) == 1 or (itemFlag("BeanstarFlag1") == 1) then
				drawImage = forms.drawImage(picture_box, ramTable[ItemAddress][6], 10+((XPos-1)*55), 10+((YPos-1)*55))
			else
				drawImage = forms.drawImage(picture_box, ramTable[ItemAddress][7], 10+((XPos-1)*55), 10+((YPos-1)*55))
			end
		elseif (itemFlag("iRealBeanstar") == 1) and (itemFlag("BeanstarFlag1") == 0) then
			drawImage = forms.drawImage(picture_box, ramTable["iRealBeanstar"][6], 10+((6.25-1)*55), 10+((1.3-1)*55))
			if itemFlag(ItemAddress) == 0 then
				drawImage = forms.drawImage(picture_box, ramTable[ItemAddress][7], 10+((XPos-1)*55), 10+((YPos-1)*55))
			else
				drawImage = forms.drawImage(picture_box, ramTable[ItemAddress][6], 10+((XPos-1)*55), 10+((YPos-1)*55))
			end
		elseif (itemFlag("iRealBeanstar") == 1) and (itemFlag("BeanstarFlag1") == 1) then
			drawImage = forms.drawImage(picture_box, ramTable["iRealBeanstar"][6], 10+((6.25-1)*55), 10+((1.3-1)*55))
		end
	
	-- Generic item check
	elseif itemType == 1 then
		if itemFlag(ItemAddress) == 0 then
			drawImage = forms.drawImage(picture_box, ramTable[ItemAddress][7], 10+((XPos-1)*55), 10+((YPos-1)*55))
		else
			drawImage = forms.drawImage(picture_box, ramTable[ItemAddress][6], 10+((XPos-1)*55), 10+((YPos-1)*55))
		end
	else
		if itemFlag(ItemAddress) == 0 then
			drawImage = forms.drawImage(picture_box, ramTable[ItemAddress][6], 10+((XPos-1)*55), 10+((YPos-1)*55))
		else
			drawImage = forms.drawImage(picture_box, ramTable[ItemAddress][5], 10+((XPos-1)*55), 10+((YPos-1)*55))
		end
	end
	
	return drawImage
end

function refreshItems()
	PeasleysRose = itemStatus("iPeasleysRose", 2, 1)
	BeanbeanBrooch = itemStatus("iBeanbeanBrooch", 3, 1)
	RedGoblet = itemStatus("iRedGoblet", 1, 2)
	GreenGoblet = itemStatus("iGreenGoblet", 1, 3)
	RedChuckolaFruit = itemStatus("iRedChuckolaFruit", 4, 1)
	WhiteChuckolaFruit = itemStatus("iWhiteChuckolaFruit",4, 2)
	PurpleChuckoloaFruit = itemStatus("iPurpleChuckoloaFruit", 4, 3)
	MembershipCard = itemStatus("iMembershipCard", 5, 3)
	WinkleCard = itemStatus("iWinkleCard", 6, 3)
	PeachsExtraDress = itemStatus("iPeachsExtraDress", 5, 2)
	FakeBeanstar = itemStatus("iFakeBeanstar", 5, 1)
	RedPearlBean = itemStatus("iRedPearlBean", 3, 2)
	GreenPearlBean = itemStatus("iGreenPearlBean", 3, 3)
	BeanFruit1 = itemStatus("iBeanFruit1", 1, 4)
	BeanFruit2 = itemStatus("iBeanFruit2", 2, 4)
	BeanFruit3 = itemStatus("iBeanFruit3", 3, 4)
	BeanFruit4 = itemStatus("iBeanFruit4", 4, 4)
	BeanFruit5 = itemStatus("iBeanFruit5", 5, 4)
	BeanFruit6 = itemStatus("iBeanFruit6", 6, 4)
	BeanFruit7 = itemStatus("iBeanFruit7", 7, 4)
	NeonEggBlue = itemStatus("iNeonEggBlue", 1, 5)
	NeonEggRed = itemStatus("iNeonEggRed", 2, 5)
	NeonEggGreen = itemStatus("iNeonEggGreen", 3, 5)
	NeonEggYellow = itemStatus("iNeonEggYellow", 4, 5)
	NeonEggPurple = itemStatus("iNeonEggPurple", 5, 5)
	NeonEggOrange = itemStatus("iNeonEggOrange", 6, 5)
	NeonEggAzure = itemStatus("iNeonEggAzure", 7, 5)
	BeanstarPiece1 = itemStatus("iBeanstarPiece1", 6, 1)
	BeanstarPiece2 = itemStatus("iBeanstarPiece2", 7, 1)
	BeanstarPiece3 = itemStatus("iBeanstarPiece3", 7, 2)
	BeanstarPiece4 = itemStatus("iBeanstarPiece4", 6, 2)
	--RealBeanstar = itemStatus("iRealBeanstar", 6.5, 1.5)
	Spangle = itemStatus("iSpangle", 7, 3)
	--"SecretScroll1 "= itemStatus(i--)
	--"SecretScroll2 "= itemStatus(i--)
	Hammers = itemStatus("iHammers1", 1, 1)
	--SuperHammers = itemStatus("iHammers2", 1, 1)
	--UltraHammers = itemStatus("iHammers3", 1, 1)
	Firebrand = itemStatus("iFirebrand", 2, 2)
	Thunderhand = itemStatus("iThunderhand", 2, 3)
	GreedWallet = itemStatus("iGreedWallet", 1, 6)
	BonusRing = itemStatus("iBonusRing", 2, 6)
	ExciteSpring = itemStatus("iExciteSpring", 3, 6)
	GreatForce = itemStatus("iGreatForce", 4, 6)
	PowerGrip = itemStatus("iPowerGrip", 5, 6)
	CobaltNecktie = itemStatus("iCobaltNecktie", 6, 6)
	GameBoyHorrorSP = itemStatus("iGameBoyHorrorSP", 7, 6)
	forms.clearImageCache(picture_box)
	-- Mush Badge, Secret Scrolls, 
end

readTitleScreen = readRam("titleScreen")
if readTitleScreen ~= 0 then refreshItems() else forms.drawText(picture_box, 30, 140, "Load save file!", "#FFFFFF", "#111111", 36, nil, "bold")  end

while true do
	moduloRefresh = emu.framecount() % refreshRate
	readTitleScreen = readRam("titleScreen")	
	if readTitleScreen == 0 then
		if moduloRefresh == 0 then
			forms.clear(picture_box, backgroundColor)
			forms.drawText(picture_box, 30, 140, "Load save file!", "#FFFFFF", "#111111", 36, nil, "bold") 
			forms.refresh(picture_box)
		end
	else
		if moduloRefresh == 0 then
			forms.clear(picture_box, backgroundColor)
			refreshItems()
			forms.refresh(picture_box)
		end
	end
	emu.frameadvance();
end	