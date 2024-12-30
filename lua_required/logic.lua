function has(item)
	local hasitem = FT[item]
	if hasitem == 1 then hasitem = true else hasitem = false end
	return hasitem
end

-- Special functions for options
function optionCoins()
	local hasitem = nil
	if has("coinBlockOption") then hasitem = true else hasitem = false end
	return hasitem
end

function optionDigspots()
	local countitem = 0
	if visible_digspots then 
		countitem = countitem + 1
		if hidden_digspots then
			countitem = countitem + 1
		end
	end
	return countitem
end

function optionSurfing()
	local hasitem = nil
	if has("surfingOption") then hasitem = true else hasitem = false end
	return hasitem
end

function optionMinecart()
	local hasitem = nil
	if has("minecartOption") then hasitem = true else hasitem = false end
	return hasitem
end

function optionHarhall()
	local hasitem = nil
	if has("harhallOption") then hasitem = true else hasitem = false end
	return hasitem
end

function optionBowser()
	local hasitem = nil
	if has("bowserOption") then hasitem = true else hasitem = false end
	return hasitem
end

function optionEnemies()
	local hasitem = nil
	if has("enemyOption") then hasitem = true else hasitem = false end
	return hasitem
end

-- Special functions for when you temporarily lose singular items
function canFirebrand()
	local hasitem = nil
	if has("Firebrand") or has("FirebrandRando") then hasitem = true else hasitem = false end
	return hasitem
end

function canThunderhand()
	local hasitem = nil
	if has("Thunderhand") or has("ThunderhandRando") then hasitem = true else hasitem = false end
	return hasitem
end

-- Normal functions
function canDig()
	local hasitem = nil
	if has("GreenGoblet") and has("Hammers1") then hasitem = true else hasitem = false end
	return hasitem
end

function canMini()
	local hasitem = nil
	if has("RedGoblet") and has("Hammers1") then hasitem = true else hasitem = false end
	return hasitem
end

function canDash()
	local hasitem = nil
	if (has("RedPearlBean") or has("RedPearlBeanRando")) and canFirebrand() then hasitem = true else hasitem = false end
	return hasitem
end

function canCrash()
	local hasitem = nil
	if (has("GreenPearlBean") or has("GreenPearlBeanRando")) and canThunderhand() then hasitem = true else hasitem = false end
	return hasitem
end

function optionHardLogic()
	local hasitem = nil
	if has("hardLogicOption") then hasitem = true
	elseif canCrash() then hasitem = true else hasitem = false end
	return hasitem
end

function canGoblets()
	local hasitem = nil
	if has("GreenGoblet") and has("RedGoblet") and has("Hammers1") then hasitem = true else hasitem = false end
	return hasitem
end

function canPearls()
	local hasitem = nil
	if canCrash() and canDash() then hasitem = true else hasitem = false end
	return hasitem
end

function canPreChuckolator()
	local hasitem = nil
	if has("ChuckolasReturned") or (has("BeanbeanBrooch") and has("RedChuckolaFruit") and has("WhiteChuckolaFruit") and has("PurpleChuckolaFruit")) then hasitem = true else hasitem = false end
	return hasitem
end

function canChuckolator()
	local hasitem = nil
	if canPreChuckolator() and (has("Hammers1") or canFirebrand() or canThunderhand()) then hasitem = true else hasitem = false end
	return hasitem -- include MushBadge?
end

function canTeehee()
	local hasitem = nil
	if has("Hammers2") or canDash() then hasitem = true else hasitem = false end
	return hasitem
end

function canFungitown()
	local hasitem = nil
	if (canTeehee() and canChuckolator() and has("PeasleysRose") and canThunderhand()) then hasitem = true else hasitem = false end
	return hasitem
end

function canSink()
	local hasitem = nil
	if (canTeehee() and canFirebrand() and has("MembershipCard")) then hasitem = true else hasitem = false end
	return hasitem
end

function canOasis()
	local hasitem = nil
	if canGoblets() or canSink() then hasitem = true else hasitem = false end
	return hasitem
end

function canSurf()
	local hasitem = nil
	if (canOasis() and has("Hammers3")) then hasitem = true else hasitem = false end
	return hasitem
end

function canGwarhar()
	local hasitem = nil
	if (canSink() or canSurf()) then hasitem = true else hasitem = false end
	return hasitem
end

function canGwarharDeep()
	local hasitem = nil
	if (canGwarhar() and has("RedPearlBean") and optionHardLogic) then hasitem = true else hasitem = false end
	return hasitem
end

function canJokes()
	local hasitem = nil
	if (canSurf() and canFirebrand()) then hasitem = true else hasitem = false end
	return hasitem
end

function canJokesDeep()
	local hasitem = nil
	if (canJokes() and optionHardLogic and canDig()) then hasitem = true else hasitem = false end
	return hasitem
end

function canBeanFruits()
	local countitem = 0
	if has("BeanFruit1") then countitem = countitem + 1 end
	if has("BeanFruit2") then countitem = countitem + 1 end
	if has("BeanFruit3") then countitem = countitem + 1 end
	if has("BeanFruit4") then countitem = countitem + 1 end
	if has("BeanFruit5") then countitem = countitem + 1 end
	if has("BeanFruit6") then countitem = countitem + 1 end
	if has("BeanFruit7") then countitem = countitem + 1 end
	return countitem
end

function canNeonEggs()
	local hasitem = nil
	if has("NeonEggsComplete") or (has("NeonEggBlue") and has("NeonEggRed") and has("NeonEggGreen") and has("NeonEggYellow") and has("NeonEggPurple") and has("NeonEggOrange") and has("NeonEggAzure")) then hasitem = true else hasitem = false end
	return hasitem
end

function canBeanstar()
	local hasitem = nil
	if has("BeanstarComplete") or (canChuckolator() and has("PeasleysRose") and has("BeanstarPiece1") and has("BeanstarPiece2") and has("BeanstarPiece3") and has("BeanstarPiece4")) then hasitem = true else hasitem = false end
	return hasitem
end

function canBirdo()
	local hasitem = nil
	if has("JokesEndComplete") or (canJokesDeep() and canBeanstar() and has("FakeBeanstar") and has("PeachsExtraDress")) then hasitem = true else hasitem = false end
	return hasitem
end

function canShopStartingGear()
	local hasitem = nil
	if has("PeasleysRose") or canChuckolator() then hasitem = true else hasitem = false end
	return hasitem
end

function canShopChuckolatorGear()
	if (has("PeasleysRose") and canThunderhand()) or canChuckolator() then hasitem = true else hasitem = false end
	return hasitem
end

function canShopMomPiranhaGear()
	if has("PeasleysRose") and (canThunderhand() or canBeanstar()) then hasitem = true else hasitem = false end
	return hasitem
end

function canShopChuckolatorItems()
	if canThunderhand() or canChuckolator() then hasitem = true else hasitem = false end
	return hasitem
end

function canShopMomPiranhaItems()
	if canThunderhand() or (has("PeasleysRose") and canBeanstar()) then hasitem = true else hasitem = false end
	return hasitem
end

function canShopTrunkle()
	if canFungitown() or canBeanstar() then hasitem = true else hasitem = false end
	return hasitem
end

function canShopBeanstar()
	if canBeanstar() then hasitem = true else hasitem = false end
	return hasitem
end

function canShopBirdo()
	if canBirdo() then hasitem = true else hasitem = false end
	return hasitem
end

function canFungiShopStarting()
	if canFungitown() then hasitem = true else hasitem = false end
	return hasitem
end

function canFungiShopBeanstar()
	if canFungitown() and canBeanstar() then hasitem = true else hasitem = false end
	return hasitem
end

function canFungiShopBirdo()
	if canFungitown() and canBirdo() then hasitem = true else hasitem = false end
	return hasitem
end