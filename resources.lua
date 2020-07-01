-- Health Bar Text
function()
    if aura_env.state.percenthealth ~= nil then
        return string.format("%.1f", aura_env.state.percenthealth)
    else
    	return ""
    end
end

-- Resource Bar Text
function()
	local power_id,power_str = UnitPowerType("player")
	local power = UnitPower("player")
	local power_max = UnitPowerMax("player")
	if power_id == Enum.PowerType.Mana then
		return string.format("%.1f",100*power/power_max)
	else
		return power
	end
end

-- Destro Lock Resource Bar
function()
    local power = UnitPower("player",Enum.PowerType.SoulShards,true)
    return power
end

-- Health Bar Color
function(progress,r1,g1,b1,a1,r2,g2,b2,a2)
	local alpha = 0.0
	if InCombatLockdown() then
		alpha = 1
	else 
		alpha = 0.4
	end
	local health = UnitHealth("player")
	local health_max = UnitHealthMax("player")
	local percent_health = health/health_max
	local green = min(1,2*percent_health)
	local red = min(2*(1-percent_health),1)
	return red,green,0,alpha
end

-- Resource Bar Color
function(progress,r1,g1,b1,a1,r2,g2,b2,a2)
	local alpha = 0.0
	if InCombatLockdown() then
		alpha = 1
	else 
		alpha = 0.4
	end
	local power_id,power_str = UnitPowerType("player") --UnitPowerType("",idx)
	if power_id == Enum.PowerType.Mana then -- Mana
		return 0,0.35,1,alpha
	elseif power_id == Enum.PowerType.Rage then -- Rage
		return 1,0,0,alpha
	elseif power_id == Enum.PowerType.Focus or power_id == Enum.PowerType.Pain then -- Focus or Pain
		return 1,0.65,0,alpha
	elseif power_id == Enum.PowerType.Energy then -- Energy
		return 1,0.85,0,alpha
	elseif power_id == Enum.PowerType.RunicPower or power_id == Enum.PowerType.LunarPower then -- Runic Power or Astral Power
		return 0,0.85,1,alpha
	elseif power_id == Enum.PowerType.Insanity or power_id == Enum.PowerType.Fury or power_id == Enum.PowerType.SoulShards then -- Insanity or Fury
		return 0.65,0,0.85,alpha
	else -- default is white
		return 1,1,1,alpha
	end
end