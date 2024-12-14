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


--iMushroom1 = {8, 0x48E2, "EWRAM", "Mushroom"}, -- 48E2
--iMushroom2 = {8, 0x48E3, "EWRAM", "Super Mushroom"},
--iMushroom3 = {8, 0x48E4, "EWRAM", "Ultra Mushroom"},
--iMushroom4 = {8, 0x48E5, "EWRAM", "Max Mushroom"},
--iNuts1 = {8, 0x48E6, "EWRAM", "Nuts"},
--iNuts2 = {8, 0x48E7, "EWRAM", "Super Nuts"},
--iNuts3 = {8, 0x48E8, "EWRAM", "Ultra Nuts"},
--iNuts4 = {8, 0x48E9, "EWRAM", "Max Nuts"},
--iSyrup1 = {8, 0x48EA, "EWRAM", "Syrup"},
--iSyrup2 = {8, 0x48EB, "EWRAM", "Super Syrup"},
--iSyrup3 = {8, 0x48EC, "EWRAM", "Ultra Syrup"},
--iSyrup4 = {8, 0x48ED, "EWRAM", "Max Syrup"},
--iRevivemushroom1 = {8, 0x48EE, "EWRAM", "1-Up Mushroom"},
--iRevivemushroom2 = {8, 0x48EF, "EWRAM", "1-Up Super"},
--iMushroomgold = {8, 0x48F0, "EWRAM", "Golden Mushroom"},
--iRefreshingherb = {8, 0x48F1, "EWRAM", "Refreshing Herb"},
--iPepperred = {8, 0x48F2, "EWRAM", "Red Pepper"},
--iPeppergreen = {8, 0x48F3, "EWRAM", "Green Pepper"},
--iWoohooblend = {8, 0x48F4, "EWRAM", "Woohoo Blend"},
--iHoohooblend = {8, 0x48F5, "EWRAM", "Hoohoo Blend"},
--iChuckleblend = {8, 0x48F6, "EWRAM", "Chuckle Blend"},
--iTeeheeblend = {8, 0x48F7, "EWRAM", "Teehee Blend"},
--iHoolumbian = {8, 0x48F8, "EWRAM", "Hoolumbian"},
--iChuckoccino = {8, 0x48F9, "EWRAM", "Chuckoccino"},
--iTeeheespresso = {8, 0x48FA, "EWRAM", "Teeheespresso"},
--iBeanbeanMap  = {1, 0x490A, "EWRAM", "Beanbean Map"}, -- Byte, 26
iPeasleysRose = {1, 0x490A, "EWRAM", "Peasley's Rose"}, 
iBeanbeanBrooch = {2, 0x490A, "EWRAM", "Beanbean Brooch"}, 
iRedGoblet = {3, 0x490A, "EWRAM", "Red Goblet"}, 
iGreenGoblet = {4, 0x490A, "EWRAM", "Green Goblet"}, 
iRedChuckolaFruit = {5, 0x490A, "EWRAM", "Red Chuckola Fruit"}, 
iWhiteChuckolaFruit = {6, 0x490A, "EWRAM", "White Chuckola Fruit"}, 
iPurpleChuckoloaFruit = {7, 0x490A, "EWRAM", "Purple Chuckola Fruit"}, 
iMembershipCard = {0, 0x490B, "EWRAM", "Membership Card"}, 
iWinkleCard = {1, 0x490B, "EWRAM", "Winkle Card"}, 
iPeachsExtraDress = {2, 0x490B, "EWRAM", "Peach's Extra Dress"}, 
iFakeBeanstar = {3, 0x490B, "EWRAM", "Fake Beanstar"}, 
iCrabbieGrass = {4, 0x490B, "EWRAM", "Crabbie Grass"}, 
iRedPearlBean = {5, 0x490B, "EWRAM", "Red Pearl Bean"}, 
iGreenPearlBean = {6, 0x490B, "EWRAM", "Green Pearl Bean"}, 
iBeanFruit1 = {7, 0x490B, "EWRAM", "Bean Fruit (1)"}, 
iBeanFruit2 = {0, 0x490C, "EWRAM", "Bean Fruit (2)"}, 
iBeanFruit3 = {1, 0x490C, "EWRAM", "Bean Fruit (3)"}, 
iBeanFruit4 = {2, 0x490C, "EWRAM", "Bean Fruit (4)"}, 
iBeanFruit5 = {3, 0x490C, "EWRAM", "Bean Fruit (5)"}, 
iBeanFruit6 = {4, 0x490C, "EWRAM", "Bean Fruit (6)"}, 
iBeanFruit7 = {5, 0x490C, "EWRAM", "Bean Fruit (7)"}, 
iNeonEggBlue = {6, 0x490C, "EWRAM", "Blue Neon Egg"}, 
iNeonEggRed = {7, 0x490C, "EWRAM", "Red Neon Egg"}, 
iNeonEggGreen = {0, 0x490D, "EWRAM", "Green Neon Egg"}, 
iNeonEggYellow = {1, 0x490D, "EWRAM", "Yellow Neon Egg"}, 
iNeonEggPurple = {2, 0x490D, "EWRAM", "Purple Neon Egg"}, 
iNeonEggOrange = {3, 0x490D, "EWRAM", "Orange Neon Egg"}, 
iNeonEggAzure = {4, 0x490D, "EWRAM", "Azure Neon Egg"}, 
iBeanstarPiece1 = {5, 0x490D, "EWRAM", "Beanstar Piece (1)"}, 
iBeanstarPiece2 = {6, 0x490D, "EWRAM", "Beanstar Piece (2)"}, 
iBeanstarPiece3 = {7, 0x490D, "EWRAM", "Beanstar Piece (3)"}, 
iBeanstarPiece4 = {0, 0x490E, "EWRAM", "Beanstar Piece (4)"}, 
iRealBeanstar = {1, 0x490E, "EWRAM", "Beanstar"}, 
iSpangle = {2, 0x490E, "EWRAM", "Spangle"}, 
iBeanlet1 = {3, 0x490E, "EWRAM", "Beanlet (1)"}, -- 61
iBeanlet2 = {4, 0x490E, "EWRAM", "Beanlet (2)"}, -- 62
iBeanlet3 = {5, 0x490E, "EWRAM", "Beanlet (3)"}, -- 63
iBeanlet4 = {6, 0x490E, "EWRAM", "Beanlet (4)"}, -- 64
iBeanlet5 = {7, 0x490E, "EWRAM", "Beanlet (5)"}, -- 65
iBeanstone1 = {0, 0x490F, "EWRAM", "Beanstone (1)"}, -- Byte, 66
iBeanstone2 = {1, 0x490F, "EWRAM", "Beanstone (2)"}, -- 67
iBeanstone3 = {2, 0x490F, "EWRAM", "Beanstone (3)"}, -- 68
iBeanstone4 = {3, 0x490F, "EWRAM", "Beanstone (4)"}, -- 69
iBeanstone5 = {4, 0x490F, "EWRAM", "Beanstone (5)"}, -- 70
iBeanstone6 = {5, 0x490F, "EWRAM", "Beanstone (6)"}, -- 71
iBeanstone7 = {6, 0x490F, "EWRAM", "Beanstone (7)"}, -- 72
iBeanstone8 = {7, 0x490F, "EWRAM", "Beanstone (8)"}, -- 73
iBeanstone9 = {0, 0x4910, "EWRAM", "Beanstone (9)"}, -- 74
iBeanstone10 = {1, 0x4910, "EWRAM", "Beanstone (10)"}, -- 75
iSecretScroll1 = {2, 0x4910, "EWRAM", "Secret Scroll 1", "./items/SecretScroll1.png", "./disabled_items/SecretScroll1.png"}, -- 76
iSecretScroll2 = {3, 0x4910, "EWRAM", "Secret Scroll 2", "./items/SecretScroll2.png", "./disabled_items/SecretScroll2.png"}, -- 77
iHammers1 = {3, 0x4338, "EWRAM", "Hammers"}, -- 78
iHammers2 = {4, 0x4338, "EWRAM", "Super Hammers"}, -- 79
iHammers3 = {5, 0x4338, "EWRAM", "Ultra Hammers"}, -- 80
iFirebrand = {0, 0x4339, "EWRAM", "Firebrand"},
iThunderhand = {1, 0x4339, "EWRAM", "Thunderhand"},
iGreedWallet = {8, 0x4982, "EWRAM", "Greed Wallet"},
iBonusRing = {8, 0x4983, "EWRAM", "Bonus Ring"},
iExciteSpring = {8, 0x4984, "EWRAM", "Excite Spring"},
iGreatForce = {8, 0x4985, "EWRAM", "Great Force"},
iPowerGrip = {8, 0x4986, "EWRAM", "Power Grip"},
iCobaltNecktie = {8, 0x4987, "EWRAM", "Cobalt Necktie"},
iGameBoyHorrorSP = {8, 0x4988, "EWRAM", "Game Boy Horror SP"},


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
	-- numbers 0-7: read bit, 8: consumables/equipment
	bytevalue = memory.read_u8(ramTable[ItemAddress][2], ramTable[ItemAddress][3])
	
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
	
function drawItem(ItemAddress, XPos, YPos, ImageON, ImageOFF)
	itemType = ramTable[ItemAddress][1]
	-- Special check for Hammers
	if (ItemAddress == "iHammers1") or (ItemAddress == "iHammers2") or (ItemAddress == "iHammers3") then
		ReadHammers = itemFlag("iHammers1") + itemFlag("iHammers2") + itemFlag("iHammers3")
		if ReadHammers == 0 then
			drawImage = forms.drawImage(picture_box, "./disabled_items/Hammers.png", 10+((XPos-1)*55), 10+((YPos-1)*55))
		elseif ReadHammers == 1 then
			drawImage = forms.drawImage(picture_box, "./items/Hammers.png", 10+((XPos-1)*55), 10+((YPos-1)*55))
		elseif ReadHammers == 2 then
			drawImage = forms.drawImage(picture_box, "./items/Hammers2.png", 10+((XPos-1)*55), 10+((YPos-1)*55))
		elseif ReadHammers == 3 then
			drawImage = forms.drawImage(picture_box, "./items/Hammers3.png", 10+((XPos-1)*55), 10+((YPos-1)*55))
		end
	
	
	-- Special check for Beanstar Pieces + Real Beanstar special behaviour
	elseif (ItemAddress == "iBeanstarPiece1") or (ItemAddress == "iBeanstarPiece2") or (ItemAddress == "iBeanstarPiece3") or (ItemAddress == "iBeanstarPiece4") then
		--ReadBeanstarPieces = itemFlag("iBeanstarPiece1") + itemFlag("iBeanstarPiece2") + itemFlag("iBeanstarPiece3") + itemFlag("iBeanstarPiece4")
		if itemFlag("BeanstarFlag2_Rando") == 1 then
			drawImage = forms.drawImage(picture_box, "./items/RealBeanstar.png", 10+((6.25-1)*55), 10+((1.25-1)*55))
		elseif (itemFlag("iRealBeanstar") == 0) and ((itemFlag("BeanstarFlag1") == 0) or (itemFlag("BeanstarFlag1") == 1)) then
			if (itemFlag(ItemAddress)) == 1 or (itemFlag("BeanstarFlag1") == 1) then
				drawImage = forms.drawImage(picture_box, ImageON, 10+((XPos-1)*55), 10+((YPos-1)*55))
			else
				drawImage = forms.drawImage(picture_box, ImageOFF, 10+((XPos-1)*55), 10+((YPos-1)*55))
			end
		elseif (itemFlag("iRealBeanstar") == 1) and (itemFlag("BeanstarFlag1") == 0) then
			drawImage = forms.drawImage(picture_box, "./items/RealBeanstar.png", 10+((6.25-1)*55), 10+((1.3-1)*55))
			if itemFlag(ItemAddress) == 0 then
				drawImage = forms.drawImage(picture_box, ImageOFF, 10+((XPos-1)*55), 10+((YPos-1)*55))
			else
				drawImage = forms.drawImage(picture_box, ImageON, 10+((XPos-1)*55), 10+((YPos-1)*55))
			end
		elseif (itemFlag("iRealBeanstar") == 1) and (itemFlag("BeanstarFlag1") == 1) then
			drawImage = forms.drawImage(picture_box, "./items/RealBeanstar.png", 10+((6.25-1)*55), 10+((1.3-1)*55))
		end
	
	-- Generic item check
	elseif itemType == 1 then
		if itemFlag(ItemAddress) == 0 then
			drawImage = forms.drawImage(picture_box, ImageOFF, 10+((XPos-1)*55), 10+((YPos-1)*55))
		else
			drawImage = forms.drawImage(picture_box, ImageON, 10+((XPos-1)*55), 10+((YPos-1)*55))
		end
	else
		if itemFlag(ItemAddress) == 0 then
			drawImage = forms.drawImage(picture_box, ImageOFF, 10+((XPos-1)*55), 10+((YPos-1)*55))
		else
			drawImage = forms.drawImage(picture_box, ImageON, 10+((XPos-1)*55), 10+((YPos-1)*55))
		end
	end
	
	return drawImage
end

function refreshItems()
	PeasleysRose = drawItem("iPeasleysRose", 2, 1, "./items/PeasleysRose.png", "./disabled_items/PeasleysRose.png")
	BeanbeanBrooch = drawItem("iBeanbeanBrooch", 3, 1, "./items/BeanbeanBrooch.png", "./disabled_items/BeanbeanBrooch.png")
	RedGoblet = drawItem("iRedGoblet", 1, 2, "./items/RedGoblet.png", "./disabled_items/RedGoblet.png")
	GreenGoblet = drawItem("iGreenGoblet", 1, 3, "./items/GreenGoblet.png", "./disabled_items/GreenGoblet.png")
	RedChuckolaFruit = drawItem("iRedChuckolaFruit", 4, 1, "./items/ChuckolaFruitRed.png", "./disabled_items/ChuckolaFruitRed.png")
	WhiteChuckolaFruit = drawItem("iWhiteChuckolaFruit",4, 2, "./items/ChuckolaFruitWhite.png", "./disabled_items/ChuckolaFruitWhite.png")
	PurpleChuckoloaFruit = drawItem("iPurpleChuckoloaFruit", 4, 3, "./items/ChuckolaFruitPurple.png", "./disabled_items/ChuckolaFruitPurple.png")
	MembershipCard = drawItem("iMembershipCard", 5, 3, "./items/MembershipCard.png", "./disabled_items/MembershipCard.png")
	WinkleCard = drawItem("iWinkleCard", 6, 3, "./items/WinkleCard.png", "./disabled_items/WinkleCard.png")
	PeachsExtraDress = drawItem("iPeachsExtraDress", 5, 2, "./items/PeachsExtraDress.png", "./disabled_items/PeachsExtraDress.png")
	FakeBeanstar = drawItem("iFakeBeanstar", 5, 1, "./items/FakeBeanstar.png", "./disabled_items/FakeBeanstar.png")
	RedPearlBean = drawItem("iRedPearlBean", 3, 2, "./items/RedPearlBean.png", "./disabled_items/RedPearlBean.png")
	GreenPearlBean = drawItem("iGreenPearlBean", 3, 3, "./items/GreenPearlBean.png", "./disabled_items/GreenPearlBean.png")
	BeanFruit1 = drawItem("iBeanFruit1", 1, 4, "./items/BeanFruit.png", "./disabled_items/BeanFruit.png")
	BeanFruit2 = drawItem("iBeanFruit2", 2, 4, "./items/BeanFruit.png", "./disabled_items/BeanFruit.png")
	BeanFruit3 = drawItem("iBeanFruit3", 3, 4, "./items/BeanFruit.png", "./disabled_items/BeanFruit.png")
	BeanFruit4 = drawItem("iBeanFruit4", 4, 4, "./items/BeanFruit.png", "./disabled_items/BeanFruit.png")
	BeanFruit5 = drawItem("iBeanFruit5", 5, 4, "./items/BeanFruit.png", "./disabled_items/BeanFruit.png")
	BeanFruit6 = drawItem("iBeanFruit6", 6, 4, "./items/BeanFruit.png", "./disabled_items/BeanFruit.png")
	BeanFruit7 = drawItem("iBeanFruit7", 7, 4, "./items/BeanFruit.png", "./disabled_items/BeanFruit.png")
	NeonEggBlue = drawItem("iNeonEggBlue", 1, 5, "./items/NeonEggBlue.png", "./disabled_items/NeonEggBlue.png")
	NeonEggRed = drawItem("iNeonEggRed", 2, 5, "./items/NeonEggRed.png", "./disabled_items/NeonEggRed.png")
	NeonEggGreen = drawItem("iNeonEggGreen", 3, 5, "./items/NeonEggGreen.png", "./disabled_items/NeonEggGreen.png")
	NeonEggYellow = drawItem("iNeonEggYellow", 4, 5, "./items/NeonEggYellow.png", "./disabled_items/NeonEggYellow.png")
	NeonEggPurple = drawItem("iNeonEggPurple", 5, 5, "./items/NeonEggPurple.png", "./disabled_items/NeonEggPurple.png")
	NeonEggOrange = drawItem("iNeonEggOrange", 6, 5, "./items/NeonEggOrange.png", "./disabled_items/NeonEggOrange.png")
	NeonEggAzure = drawItem("iNeonEggAzure", 7, 5, "./items/NeonEggAzure.png", "./disabled_items/NeonEggAzure.png")
	BeanstarPiece1 = drawItem("iBeanstarPiece1", 6, 1, "./items/BeanstarPiece1.png", "./disabled_items/BeanstarPiece1.png")
	BeanstarPiece2 = drawItem("iBeanstarPiece2", 7, 1, "./items/BeanstarPiece2.png", "./disabled_items/BeanstarPiece2.png")
	BeanstarPiece3 = drawItem("iBeanstarPiece3", 7, 2, "./items/BeanstarPiece3.png", "./disabled_items/BeanstarPiece3.png")
	BeanstarPiece4 = drawItem("iBeanstarPiece4", 6, 2, "./items/BeanstarPiece4.png", "./disabled_items/BeanstarPiece4.png")
	Spangle = drawItem("iSpangle", 7, 3, "./items/Spangle.png", "./disabled_items/Spangle.png")
	Hammers = drawItem("iHammers1", 1, 1, nil, nil)
	Firebrand = drawItem("iFirebrand", 2, 2, "./items/GameBoyHorrorSP.png", "./disabled_items/GameBoyHorrorSP.png")
	Thunderhand = drawItem("iThunderhand", 2, 3, "./items/CobaltNecktie.png", "./disabled_items/CobaltNecktie.png")
	GreedWallet = drawItem("iGreedWallet", 1, 6, "./items/PowerGrip.png", "./disabled_items/PowerGrip.png")
	BonusRing = drawItem("iBonusRing", 2, 6, "./items/GreatForce.png", "./disabled_items/GreatForce.png")
	ExciteSpring = drawItem("iExciteSpring", 3, 6, "./items/ExciteSpring.png", "./disabled_items/ExciteSpring.png")
	GreatForce = drawItem("iGreatForce", 4, 6, "./items/BonusRing.png", "./disabled_items/BonusRing.png")
	PowerGrip = drawItem("iPowerGrip", 5, 6, "./items/GreedWallet.png", "./disabled_items/GreedWallet.png")
	CobaltNecktie = drawItem("iCobaltNecktie", 6, 6, "./items/ThunderhandSpark.png", "./disabled_items/ThunderhandSpark.png")
	GameBoyHorrorSP = drawItem("iGameBoyHorrorSP", 7, 6, "./items/FirebrandFlame.png", "./disabled_items/FirebrandFlame.png")
	forms.clearImageCache(picture_box)
	--"SecretScroll1 "= drawItem(i--)
	--"SecretScroll2 "= drawItem(i--)
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