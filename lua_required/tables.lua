function convertBool(option)
	-- Converts a bool into a 1 or 0 number
	local optionresult
	if option == true then optionresult = 1 else optionresult = 0 end
	return optionresult
end

function readRam(ItemAddress)
	local bytevalue
	local size = ramTable[ItemAddress][1]
	if size == 1 then
		bytevalue = memory.read_u8(ramTable[ItemAddress][2], ramTable[ItemAddress][3])
	elseif size == 2 then
		bytevalue = memory.read_u16_le(ramTable[ItemAddress][2], ramTable[ItemAddress][3])
	else
		bytevalue = memory.read_u32_le(ramTable[ItemAddress][2], ramTable[ItemAddress][3])
	end
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

---- List of flags and items
-- i stands for item
-- any name ending with _Rando is a ram address specific to the randomizer
ramTable = {
-- Generic values
titleScreen = {1, 0x0FFB, "IWRAM"},
currentRoom = {2, 0x2332, "IWRAM"},


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
iPurpleChuckolaFruit = {7, 0x490A, "EWRAM", "Purple Chuckola Fruit"}, 
iMembershipCard = {0, 0x490B, "EWRAM", "Membership Card"}, 
iWinkleCard = {1, 0x490B, "EWRAM", "Winkle Card"}, 
iPeachsExtraDress = {2, 0x490B, "EWRAM", "Peach's Extra Dress"}, 
iFakeBeanstar = {3, 0x490B, "EWRAM", "Fake Beanstar"}, 
iCrabbieGrass = {4, 0x490B, "EWRAM", "Crabbie Grass"}, 
iRedPearlBean = {5, 0x490B, "EWRAM", "Red Pearl Bean"}, 
iRedPearlBeanRAM = {0, 0x302F, "EWRAM"},
iGreenPearlBean = {6, 0x490B, "EWRAM", "Green Pearl Bean"}, 
iGreenPearlBeanRAM = {1, 0x302F, "EWRAM"},
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
iFirebrandRAM = {4, 0x3016, "EWRAM"}, -- Is enabled when you enter fire palace room
iThunderhand = {1, 0x4339, "EWRAM", "Thunderhand"},
iThunderhandRAM = {5, 0x3016, "EWRAM"}, -- Is enabled when you enter thunder palace room
iGreedWallet = {8, 0x4982, "EWRAM", "Greed Wallet"},
iBonusRing = {8, 0x4983, "EWRAM", "Bonus Ring"},
iExciteSpring = {8, 0x4984, "EWRAM", "Excite Spring"},
iGreatForce = {8, 0x4985, "EWRAM", "Great Force"},
iPowerGrip = {8, 0x4986, "EWRAM", "Power Grip"},
iCobaltNecktie = {8, 0x4987, "EWRAM", "Cobalt Necktie"},
iGameBoyHorrorSP = {8, 0x4988, "EWRAM", "Game Boy Horror SP"},


-- Story Flags
ChuckolaFruitFlag = {3, 0x4302, "EWRAM"}, --Enables after Chuckroot moves
SpangleGivenFlag = {7, 0x434A, "EWRAM"}, --Enables after you give Hermie Spangle
NeonEggsGivenFlag = {5, 0x434D, "EWRAM"}, --Enables after you hand over the Neon Eggs; 0x4406_3 would also work 5, 0x434D
BeanstarFlag1 = {3, 0x433D, "EWRAM"},--Cutscene where you get Beanstar, Dress, Fake Beanstar, ...; also the Beanstar shop flag!
BeanstarFlag2_Rando = {0, 0x3003, "EWRAM"}, --Cutscene where you get Beanstar, Dress, Fake Beanstar, ... 0x430B, but rando stores at 0x3003
JokesEndFawfulFlag = {7, 0x430B, "EWRAM"}, --Enables after you meet Fawful in Joke's End x430B_7 
}


function refreshItemFlags()
	-- FT = Flag Table
	FT = {
		PeasleysRose = itemFlag("iPeasleysRose"),
		BeanbeanBrooch = itemFlag("iBeanbeanBrooch"),
		RedGoblet = itemFlag("iRedGoblet"),
		GreenGoblet = itemFlag("iGreenGoblet"),
		RedChuckolaFruit = itemFlag("iRedChuckolaFruit"),
		WhiteChuckolaFruit = itemFlag("iWhiteChuckolaFruit"),
		PurpleChuckolaFruit = itemFlag("iPurpleChuckolaFruit"),
		MembershipCard = itemFlag("iMembershipCard"),
		WinkleCard = itemFlag("iWinkleCard"),
		PeachsExtraDress = itemFlag("iPeachsExtraDress"),
		FakeBeanstar = itemFlag("iFakeBeanstar"),
		RedPearlBean = itemFlag("iRedPearlBean"),
		GreenPearlBean = itemFlag("iGreenPearlBean"),
		BeanFruit1 = itemFlag("iBeanFruit1"),
		BeanFruit2 = itemFlag("iBeanFruit2"),
		BeanFruit3 = itemFlag("iBeanFruit3"),
		BeanFruit4 = itemFlag("iBeanFruit4"),
		BeanFruit5 = itemFlag("iBeanFruit5"),
		BeanFruit6 = itemFlag("iBeanFruit6"),
		BeanFruit7 = itemFlag("iBeanFruit7"),
		NeonEggBlue = itemFlag("iNeonEggBlue"),
		NeonEggRed = itemFlag("iNeonEggRed"),
		NeonEggGreen = itemFlag("iNeonEggGreen"),
		NeonEggYellow = itemFlag("iNeonEggYellow"),
		NeonEggPurple = itemFlag("iNeonEggPurple"),
		NeonEggOrange = itemFlag("iNeonEggOrange"),
		NeonEggAzure = itemFlag("iNeonEggAzure"),
		BeanstarPiece1 = itemFlag("iBeanstarPiece1"),
		BeanstarPiece2 = itemFlag("iBeanstarPiece2"),
		BeanstarPiece3 = itemFlag("iBeanstarPiece3"),
		BeanstarPiece4 = itemFlag("iBeanstarPiece4"),
		Spangle = itemFlag("iSpangle"),
		Hammers1 = itemFlag("iHammers1"),
		Hammers2 = itemFlag("iHammers2"),
		Hammers3 = itemFlag("iHammers3"),
		Firebrand = itemFlag("iFirebrand"),
		Thunderhand = itemFlag("iThunderhand"),
		GreedWallet = itemFlag("iGreedWallet"),
		BonusRing = itemFlag("iBonusRing"),
		ExciteSpring = itemFlag("iExciteSpring"),
		GreatForce = itemFlag("iGreatForce"),
		PowerGrip = itemFlag("iPowerGrip"),
		CobaltNecktie = itemFlag("iCobaltNecktie"),
		GameBoyHorrorSP = itemFlag("iGameBoyHorrorSP"),
		
		-- Special flags
		FirebrandRando = itemFlag("iFirebrandRAM"),
		ThunderhandRando = itemFlag("iThunderhandRAM"),
		RedPearlBeanRando = itemFlag("iRedPearlBeanRAM"),
		GreenPearlBeanRando = itemFlag("iGreenPearlBeanRAM"),
		
		ChuckolasReturned = itemFlag("ChuckolaFruitFlag"),
		SpangleComplete = itemFlag("SpangleGivenFlag"),
		NeonEggsComplete = itemFlag("NeonEggsGivenFlag"),
		BeanstarComplete = itemFlag("BeanstarFlag1"),
		JokesEndComplete = itemFlag("JokesEndFawfulFlag"),
		
		-- Option flags
		coinBlockOption = convertBool(coin_blocks),
		--digspotVisibleOption = convertBool(visible_digspots),
		--digspotHiddenOption = convertBool(hidden_digspots),
		minecartOption = convertBool(minecart),
		harhallOption = convertBool(harhalls_pants),
		surfingOption = convertBool(surfing),
		bowserOption = convertBool(bowsers_castle),
		hardLogicOption = convertBool(difficult_logic),
		enemyOption = convertBool(randomize_enemies),
	}
end

function refreshRawItemValues()
	local sumItemValues = 0
	sumItemValues = sumItemValues + memory.read_u8(0x4988, "EWRAM")
	sumItemValues = sumItemValues + memory.read_u8(0x4987, "EWRAM")
	sumItemValues = sumItemValues + memory.read_u8(0x4986, "EWRAM")
	sumItemValues = sumItemValues + memory.read_u8(0x4985, "EWRAM")
	sumItemValues = sumItemValues + memory.read_u8(0x4984, "EWRAM")
	sumItemValues = sumItemValues + memory.read_u8(0x4983, "EWRAM")
	sumItemValues = sumItemValues + memory.read_u8(0x4982, "EWRAM")
	sumItemValues = sumItemValues + memory.read_u8(0x3016, "EWRAM")
	sumItemValues = sumItemValues + memory.read_u8(0x4339, "EWRAM")
	sumItemValues = sumItemValues + memory.read_u8(0x4338, "EWRAM")
	sumItemValues = sumItemValues + memory.read_u8(0x4910, "EWRAM")
	sumItemValues = sumItemValues + memory.read_u8(0x490F, "EWRAM")
	sumItemValues = sumItemValues + memory.read_u8(0x490E, "EWRAM")
	sumItemValues = sumItemValues + memory.read_u8(0x490D, "EWRAM")
	sumItemValues = sumItemValues + memory.read_u8(0x490C, "EWRAM")
	sumItemValues = sumItemValues + memory.read_u8(0x490B, "EWRAM")
	sumItemValues = sumItemValues + memory.read_u8(0x302F, "EWRAM")
	sumItemValues = sumItemValues + memory.read_u8(0x490A, "EWRAM")
	return sumItemValues
end

function refreshRawLocationValues()
	local sumLocationValues = 0
	sumLocationValues = sumLocationValues + memory.read_u8(0x4589, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x458A, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x4588, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x4300, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x433D, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x42FF, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x4302, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x4303, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x4568, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x4569, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x4567, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x432C, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x432D, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x432B, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x434B, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x4598, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x4599, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x4576, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x459D, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x4571, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x4574, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x4572, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x4573, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x4577, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x459E, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x4575, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x434E, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x4359, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x4578, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x4373, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x432E, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x4340, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x430F, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x434D, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x459B, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x459A, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x459C, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x456F, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x4579, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x42FE, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x457C, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x457E, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x457F, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x457D, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x457A, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x4301, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x4585, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x457B, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x4375, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x4376, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x4372, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x4371, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x4591, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x4592, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x458C, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x4346, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x458B, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x458D, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x434A, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x4570, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x456D, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x456E, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x456C, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x456A, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x456B, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x4597, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x42F9, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x4566, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x4593, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x4594, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x4596, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x4595, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x4345, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x4581, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x4582, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x4583, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x4374, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x4580, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x4564, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x4565, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x458F, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x4590, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x458E, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x430C, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x4584, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x4586, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x4587, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x434C, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x47F0, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x47F1, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x47F4, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x47F5, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x47F6, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x47F8, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x47F9, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x47FA, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x47F2, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x47F3, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x47FC, "EWRAM")
	sumLocationValues = sumLocationValues + memory.read_u8(0x47FD, "EWRAM")
	return sumLocationValues
end