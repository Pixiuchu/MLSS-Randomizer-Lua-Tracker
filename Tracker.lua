--refreshRate = 180
backgroundColor = "#111111"
boxWidth = 7
boxHeight = 14.2
itemtracker = forms.newform(20+(55*boxWidth), 20+(55*boxHeight), "MLSS Randomizer Item Tracker")
picture_box = forms.pictureBox(itemtracker, 0, 0, 20+(55*boxWidth), 20+(55*boxHeight))
forms.setDefaultBackgroundColor(picture_box, backgroundColor)
forms.drawBox(picture_box,-5, -5, 25+(55*boxWidth), 25+(55*boxHeight), 0xFF00)



---- List of items
-- i stands for item

function readRam(ItemAddress)
	local bytevalue = memory.read_u8(ramTable[ItemAddress][2], ramTable[ItemAddress][3])
	return bytevalue
end

function itemFlag(ItemAddress)
	local itemType = ramTable[ItemAddress][1]
	-- numbers 0-7: read bit, 8: consumables/equipment
	local bytevalue = memory.read_u8(ramTable[ItemAddress][2], ramTable[ItemAddress][3])
	local bitresult = nil
	
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
	local itemType = ramTable[ItemAddress][1]
	-- Special check for Hammers
	if (ItemAddress == "iHammers1") or (ItemAddress == "iHammers2") or (ItemAddress == "iHammers3") then
		local ReadHammers = itemFlag("iHammers1") + itemFlag("iHammers2") + itemFlag("iHammers3")
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
	
	-- Special check for Chuckola Fruits
	elseif (ItemAddress == "iRedChuckolaFruit") or (ItemAddress == "iPurpleChuckolaFruit") or (ItemAddress == "iWhiteChuckolaFruit") then
		if itemFlag("ChuckolaFruitFlag") == 1 then
			drawImage = forms.drawImage(picture_box, ImageON, 10+((XPos-1)*55), 10+((YPos-1)*55))
		elseif itemFlag(ItemAddress) == 0 then
			drawImage = forms.drawImage(picture_box, ImageOFF, 10+((XPos-1)*55), 10+((YPos-1)*55))
		else
			drawImage = forms.drawImage(picture_box, ImageON, 10+((XPos-1)*55), 10+((YPos-1)*55))
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
	PurpleChuckolaFruit = drawItem("iPurpleChuckolaFruit", 4, 3, "./items/ChuckolaFruitPurple.png", "./disabled_items/ChuckolaFruitPurple.png")
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
	Firebrand = drawItem("iFirebrand", 2, 2, "./items/FirebrandFlame.png", "./disabled_items/FirebrandFlame.png")
	Thunderhand = drawItem("iThunderhand", 2, 3, "./items/ThunderhandSpark.png", "./disabled_items/ThunderhandSpark.png")
	GreedWallet = drawItem("iGreedWallet", 1, 6, "./items/GreedWallet.png", "./disabled_items/GreedWallet.png")
	BonusRing = drawItem("iBonusRing", 2, 6, "./items/BonusRing.png", "./disabled_items/BonusRing.png")
	ExciteSpring = drawItem("iExciteSpring", 3, 6, "./items/ExciteSpring.png", "./disabled_items/ExciteSpring.png")
	GreatForce = drawItem("iGreatForce", 4, 6, "./items/GreatForce.png", "./disabled_items/GreatForce.png")
	PowerGrip = drawItem("iPowerGrip", 5, 6, "./items/PowerGrip.png", "./disabled_items/PowerGrip.png")
	CobaltNecktie = drawItem("iCobaltNecktie", 6, 6, "./items/CobaltNecktie.png", "./disabled_items/CobaltNecktie.png")
	GameBoyHorrorSP = drawItem("iGameBoyHorrorSP", 7, 6, "./items/GameBoyHorrorSP.png", "./disabled_items/GameBoyHorrorSP.png")
	forms.clearImageCache(picture_box)
	--"SecretScroll1 "= drawItem(i--)
	--"SecretScroll2 "= drawItem(i--)
	-- Mush Badge, Secret Scrolls, 
end

local readTitleScreen = readRam("titleScreen")
if readTitleScreen ~= 0 then refreshItems() else forms.drawText(picture_box, 30, 140, "Load save file!", "#FFFFFF", "#111111", 36, nil, "bold")  end