itemtracker = forms.newform(405, 295, "MLSS Randomizer Item Tracker") 
picture_box = forms.pictureBox(itemtracker, 0, 0, 405, 295)
forms.setDefaultBackgroundColor(picture_box,0xFF111111)
forms.drawBox(picture_box,-5, -5, 410, 300, 0xFF00)


---- List of items
-- i stands for item
iMushroom1 = {0x48E2, "Mushroom"} -- 48E2
iMushroom2 = {0x48E3, "Super Mushroom"}
iMushroom3 = {0x48E4, "Ultra Mushroom"}
iMushroom4 = {0x48E5, "Max Mushroom"}
iNuts1 = {0x48E6, "Nuts"}
iNuts2 = {0x48E7, "Super Nuts"}
iNuts3 = {0x48E8, "Ultra Nuts"}
iNuts4 = {0x48E9, "Max Nuts"}
iSyrup1 = {0x48EA, "Syrup"}
iSyrup2 = {0x48EB, "Super Syrup"}
iSyrup3 = {0x48EC, "Ultra Syrup"}
iSyrup4 = {0x48ED, "Max Syrup"}
iRevivemushroom1 = {0x48EE, "1-Up Mushroom"}
iRevivemushroom2 = {0x48EF, "1-Up Super"}
iMushroomgold = {0x48F0, "Golden Mushroom"}
iRefreshingherb = {0x48F1, "Refreshing Herb"}
iPepperred = {0x48F2, "Red Pepper"}
iPeppergreen = {0x48F3, "Green Pepper"}
iWoohooblend = {0x48F4, "Woohoo Blend"}
iHoohooblend = {0x48F5, "Hoohoo Blend"}
iChuckleblend = {0x48F6, "Chuckle Blend"}
iTeeheeblend = {0x48F7, "Teehee Blend"}
iHoolumbian = {0x48F8, "Hoolumbian"}
iChuckoccino = {0x48F9, "Chuckoccino"}
iTeeheespresso = {0x48FA, "Teeheespresso"}
iBeanbeanMap  = {0x490A, 0, "Beanbean Map"} -- Byte, 26
iPeasleysRose = {0x490A, 1, "Peasley's Rose", "./items/PeasleysRose.png", "./disabled_items/PeasleysRose.png"} -- 27
iBeanbeanBrooch = {0x490A, 2, "Beanbean Brooch", "./items/BeanbeanBrooch.png", "./disabled_items/BeanbeanBrooch.png"} -- 28
iRedGoblet = {0x490A, 3, "Red Goblet", "./items/RedGoblet.png", "./disabled_items/RedGoblet.png"} -- 29
iGreenGoblet = {0x490A, 4, "Green Goblet", "./items/GreenGoblet.png", "./disabled_items/GreenGoblet.png"} -- 30
iRedChuckolaFruit = {0x490A, 5, "Red Chuckola Fruit", "./items/ChuckolaFruitRed.png", "./disabled_items/ChuckolaFruitRed.png"} -- 31
iWhiteChuckolaFruit = {0x490A, 6, "White Chuckola Fruit", "./items/ChuckolaFruitWhite.png", "./disabled_items/ChuckolaFruitWhite.png"} -- 32
iPurpleChuckoloaFruit = {0x490A, 7, "Purple Chuckola Fruit", "./items/ChuckolaFruitPurple.png", "./disabled_items/ChuckolaFruitPurple.png"} -- 33
iMembershipCard = {0x490B, 0, "Membership Card", "./items/MembershipCard.png", "./disabled_items/MembershipCard.png"} -- Byte, 34
iWinkleCard = {0x490B, 1, "Winkle Card", "./items/WinkleCard.png", "./disabled_items/WinkleCard.png"} -- 35
iPeachsExtraDress = {0x490B, 2, "Peach's Extra Dress", "./items/PeachsExtraDress.png", "./disabled_items/PeachsExtraDress.png"} -- 36
iFakeBeanstar = {0x490B, 3, "Fake Beanstar", "./items/FakeBeanstar.png", "./disabled_items/FakeBeanstar.png"} -- 37
iCrabbieGrass = {0x490B, 4, "Crabbie Grass"} -- 38
iRedPearlBean = {0x490B, 5, "Red Pearl Bean", "./items/RedPearlBean.png", "./disabled_items/RedPearlBean.png"} -- 39
iGreenPearlBean = {0x490B, 6, "Green Pearl Bean", "./items/GreenPearlBeanGreenPearlBean.png", "./disabled_items/GreenPearlBean.png"} -- 40
iBeanFruit1 = {0x490B, 7, "Bean Fruit (1)", "./items/BeanFruit.png", "./disabled_items/BeanFruit.png"} -- 41
iBeanFruit2 = {0x490C, 0, "Bean Fruit (2)", "./items/BeanFruit.png", "./disabled_items/BeanFruit.png"} -- Byte, 42
iBeanFruit3 = {0x490C, 1, "Bean Fruit (3)", "./items/BeanFruit.png", "./disabled_items/BeanFruit.png"} -- 43
iBeanFruit4 = {0x490C, 2, "Bean Fruit (4)", "./items/BeanFruit.png", "./disabled_items/BeanFruit.png"} -- 44
iBeanFruit5 = {0x490C, 3, "Bean Fruit (5)", "./items/BeanFruit.png", "./disabled_items/BeanFruit.png"} -- 45
iBeanFruit6 = {0x490C, 4, "Bean Fruit (6)", "./items/BeanFruit.png", "./disabled_items/BeanFruit.png"} -- 46
iBeanFruit7 = {0x490C, 5, "Bean Fruit (7)", "./items/BeanFruit.png", "./disabled_items/BeanFruit.png"} -- 47
iNeonEggBlue = {0x490C, 6, "Blue Neon Egg", "./items/NeonEggBlue.png", "./disabled_items/NeonEggBlue.png"} -- 48
iNeonEggRed = {0x490C, 7, "Red Neon Egg", "./items/NeonEggRed.png", "./disabled_items/NeonEggRed.png"} -- 49
iNeonEggGreen = {0x490D, 0, "Green Neon Egg", "./items/NeonEggGreen.png", "./disabled_items/NeonEggGreen.png"} -- Byte, 50
iNeonEggYellow = {0x490D, 1, "Yellow Neon Egg", "./items/NeonEggYellow.png", "./disabled_items/NeonEggYellow.png"} -- 51
iNeonEggPurple = {0x490D, 2, "Purple Neon Egg", "./items/NeonEggPurple.png", "./disabled_items/NeonEggPurple.png"} -- 52
iNeonEggOrange = {0x490D, 3, "Orange Neon Egg", "./items/NeonEggOrange.png", "./disabled_items/NeonEggOrange.png"} -- 53
iNeonEggAzure = {0x490D, 4, "Azure Neon Egg", "./items/NeonEggAzure.png", "./disabled_items/NeonEggAzure.png"} -- 54
iBeanstarPiece1 = {0x490D, 5, "Beanstar Piece (1)", "./items/BeanstarPiece1.png", "./disabled_items/BeanstarPiece1.png"} -- 55
iBeanstarPiece2 = {0x490D, 6, "Beanstar Piece (2)", "./items/BeanstarPiece2.png", "./disabled_items/BeanstarPiece2.png"} -- 56
iBeanstarPiece3 = {0x490D, 7, "Beanstar Piece (3)", "./items/BeanstarPiece3.png", "./disabled_items/BeanstarPiece3.png"} -- 57
iBeanstarPiece4 = {0x490E, 0, "Beanstar Piece (4)", "./items/BeanstarPiece4.png", "./disabled_items/BeanstarPiece4.png"} -- Byte, 58
iBeanstar = {0x490E, 1, "Beanstar", "./items/RealBeanstar.png", "./disabled_items/RealBeanstar.png"} -- 59
iSpangle = {0x490E, 2, "Spangle", "./items/Spangle.png", "./disabled_items/Spangle.png"} -- 60
iBeanlet1 = {0x490E, 3, "Beanlet (1)"} -- 61
iBeanlet1 = {0x490E, 4, "Beanlet (2)"} -- 62
iBeanlet1 = {0x490E, 5, "Beanlet (3)"} -- 63
iBeanlet1 = {0x490E, 6, "Beanlet (4)"} -- 64
iBeanlet1 = {0x490E, 7, "Beanlet (5)"} -- 65
iBeanstone1 = {0x490F, 0, "Beanstone (1)"} -- Byte, 66
iBeanstone2 = {0x490F, 1, "Beanstone (2)"} -- 67
iBeanstone3 = {0x490F, 2, "Beanstone (3)"} -- 68
iBeanstone4 = {0x490F, 3, "Beanstone (4)"} -- 69
iBeanstone5 = {0x490F, 4, "Beanstone (5)"} -- 70
iBeanstone6 = {0x490F, 5, "Beanstone (6)"} -- 71
iBeanstone7 = {0x490F, 6, "Beanstone (7)"} -- 72
iBeanstone8 = {0x490F, 7, "Beanstone (8)"} -- 73
iBeanstone9 = {0x4910, 0, "Beanstone (9)"} -- 74
iBeanstone10 = {0x4910, 1, "Beanstone (10)"} -- 75
iSecretScroll1 = {0x4910, 2, "Secret Scroll 1", "./items/SecretScroll1.png", "./disabled_items/SecretScroll1.png"} -- 76
iSecretScroll2 = {0x4910, 3, "Secret Scroll 2", "./items/SecretScroll2.png", "./disabled_items/SecretScroll2.png"} -- 77
iHammers1 = {0x4338, 3, "Hammers", "./items/Hammers.png", "./disabled_items/Hammers.png"} -- 78
iHammers2 = {0x4338, 4, "Super Hammers", "./items/Hammers2.png"} -- 79
iHammers3 = {0x4338, 5, "Ultra Hammers", "./items/Hammers3.png"} -- 80
iFirebrand = {0x4339, 0, "Firebrand", "./items/FirebrandFlame.png", "./disabled_items/FirebrandFlame.png"} -- 81
iThunderhand = {0x4339, 1, "Thunderhand", "./items/ThunderhandSpark.png", "./disabled_items/ThunderhandSpark.png"} -- 82
iGreedWallet = {0x4982, "Greed Wallet"} -- $4982, 78
iBonusRing = {0x4983, "Bonus Ring"} -- 79
iExciteSpring = {0x4984, "Excite Spring"} -- 80
iGreatForce = {0x4985, "Great Force"} -- 81
iPowerGrip = {0x4986, "Power Grip"} -- 82
iCobaltNecktie = {0x4987, "Cobalt Necktie"} -- 83
iGameBoyHorrorSP = {0x4988, "GameBoy Horror SP"} -- 84

function itemFlag(ItemAddress)
	value1 = memory.read_u8(ItemAddress[1], "EWRAM")
	value2 = 2^ItemAddress[2]
	andedvalues = value1 & value2
	if andedvalues > 0 then
		bitresult = 1
	else
		bitresult = 0
	end
	
	return bitresult
end
	
function itemStatus(ItemAddress, XPos, YPos)
	-- Special check for Hammers
	if (ItemAddress == iHammers1) or (ItemAddress == iHammers2) or (ItemAddress == iHammers3) then
		ReadHammers = itemFlag(iHammers1) + itemFlag(iHammers2) + itemFlag(iHammers3)
		if ReadHammers == 0 then
			drawImage = forms.drawImage(picture_box, iHammers1[5], 10+((XPos-1)*55), 10+((YPos-1)*55))
		elseif ReadHammers == 1 then
			drawImage = forms.drawImage(picture_box, iHammers1[4], 10+((XPos-1)*55), 10+((YPos-1)*55))
		elseif ReadHammers == 2 then
			drawImage = forms.drawImage(picture_box, iHammers2[4], 10+((XPos-1)*55), 10+((YPos-1)*55))
		elseif ReadHammers == 3 then
			drawImage = forms.drawImage(picture_box, iHammers3[4], 10+((XPos-1)*55), 10+((YPos-1)*55))
		end
	else
		if itemFlag(ItemAddress) == 0 then
			drawImage = forms.drawImage(picture_box, ItemAddress[5], 10+((XPos-1)*55), 10+((YPos-1)*55))
		else
			drawImage = forms.drawImage(picture_box, ItemAddress[4], 10+((XPos-1)*55), 10+((YPos-1)*55))
		end
	end
	
	return drawImage
end

function refreshItems()
	forms.clearImageCache(picture_box)
	PeasleysRose = itemStatus(iPeasleysRose, 2, 1)
	BeanbeanBrooch = itemStatus(iBeanbeanBrooch, 3, 1)
	RedGoblet = itemStatus(iRedGoblet, 1, 2)
	GreenGoblet = itemStatus(iGreenGoblet, 1, 3)
	RedChuckolaFruit = itemStatus(iRedChuckolaFruit, 4, 1)
	WhiteChuckolaFruit = itemStatus(iWhiteChuckolaFruit,4, 2)
	PurpleChuckoloaFruit = itemStatus(iPurpleChuckoloaFruit, 4, 3)
	MembershipCard = itemStatus(iMembershipCard, 5, 3)
	WinkleCard = itemStatus(iWinkleCard, 6, 3)
	PeachsExtraDress = itemStatus(iPeachsExtraDress, 5, 2)
	FakeBeanstar = itemStatus(iFakeBeanstar, 5, 1)
	RedPearlBean = itemStatus(iRedPearlBean, 3, 2)
	GreenPearlBean = itemStatus(iGreenPearlBean, 3, 3)
	BeanFruit1 = itemStatus(iBeanFruit1, 1, 4)
	BeanFruit2 = itemStatus(iBeanFruit2, 2, 4)
	BeanFruit3 = itemStatus(iBeanFruit3, 3, 4)
	BeanFruit4 = itemStatus(iBeanFruit4, 4, 4)
	BeanFruit5 = itemStatus(iBeanFruit5, 5, 4)
	BeanFruit6 = itemStatus(iBeanFruit6, 6, 4)
	BeanFruit7 = itemStatus(iBeanFruit7, 7, 4)
	NeonEggBlue = itemStatus(iNeonEggBlue, 1, 5)
	NeonEggRed = itemStatus(iNeonEggRed, 2, 5)
	NeonEggGreen = itemStatus(iNeonEggGreen, 3, 5)
	NeonEggYellow = itemStatus(iNeonEggYellow, 4, 5)
	NeonEggPurple = itemStatus(iNeonEggPurple, 5, 5)
	NeonEggOrange = itemStatus(iNeonEggOrange, 6, 5)
	NeonEggAzure = itemStatus(iNeonEggAzure, 7, 5)
	BeanstarPiece1 = itemStatus(iBeanstarPiece1, 6, 1)
	BeanstarPiece2 = itemStatus(iBeanstarPiece2, 7, 1)
	BeanstarPiece3 = itemStatus(iBeanstarPiece3, 7, 2)
	BeanstarPiece4 = itemStatus(iBeanstarPiece4, 6, 2)
	----RealBeanstar = itemStatus(i--)
	Spangle = itemStatus(iSpangle, 7, 3)
	--SecretScroll1 = itemStatus(i--)
	--SecretScroll2 = itemStatus(i--)
	Hammers = itemStatus(iHammers1, 1, 1)
	SuperHammers = itemStatus(iHammers2, 1, 1)
	UltraHammers = itemStatus(iHammers3, 1, 1)
	Firebrand = itemStatus(iFirebrand, 2, 2)
	Thunderhand = itemStatus(iThunderhand, 2, 3)
end


while true do
	refreshrate = emu.framecount() % 120
	if refreshrate == 0 then
		refreshItems()
		forms.refresh(picture_box)
	end
	emu.frameadvance();
end	