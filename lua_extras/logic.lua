function has(item)
	local hasitem = FT[item]
	if hasitem == 1 then hasitem = true else hasitem = false end
	return hasitem
end

-- Special functions for when you temporarily lose singular items
function canFirebrand()
	local hasitem = nil
	if has("Firebrand") or has("FirebrandRando") then hasitem = true else hasitem = false end
	return hasitem
end

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
	if (has("RedPearlBean") and canFirebrand()) then hasitem = true else hasitem = false end
	return hasitem
end

function canCrash()
	local hasitem = nil
	if has("GreenPearlBean") and has("Thunderhand") then hasitem = true else hasitem = false end
	return hasitem
end

function canHardLogic()
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
	if has("GreenPearlBean") and has("Thunderhand") and canDash() then hasitem = true else hasitem = false end
	return hasitem
end

function canPreChuckolator()
	local hasitem = nil
	if has("ChuckolasReturned") or (has("BeanbeanBrooch") and has("RedChuckolaFruit") and has("WhiteChuckolaFruit") and has("PurpleChuckolaFruit")) then hasitem = true else hasitem = false end
	return hasitem
end

function canChuckolator()
	local hasitem = nil
	if canPreChuckolator() and (has("Hammers1") or canFirebrand() or has("Thunderhand")) then hasitem = true else hasitem = false end
	return hasitem -- include MushBadge?
end

function canTeehee()
	local hasitem = nil
	if has("Hammers2") or canDash() then hasitem = true else hasitem = false end
	return hasitem
end

function canFungitown()
	local hasitem = nil
	if (canTeehee() and canChuckolator() and has("PeasleysRose") and has("Thunderhand")) then hasitem = true else hasitem = false end
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
	if (canGwarhar() and has("RedPearlBean") and canHardLogic()) then hasitem = true else hasitem = false end
	return hasitem
end

function canJokes()
	local hasitem = nil
	if (canSurf() and canFirebrand()) then hasitem = true else hasitem = false end
	return hasitem
end

function canJokesDeep()
	local hasitem = nil
	if (canJokes() and canHardLogic() and canDig()) then hasitem = true else hasitem = false end
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