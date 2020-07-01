function()
    local start, d, _, _ = GetSpellCooldown(aura_env.spell_name);
    aura_env.color = {1,1,1,1}
    if start == 0 then -- Spell is NOT on CD
        aura_env.duration = nil
        aura_env.exp_time = nil
        return true
    end
    aura_env.duration = select(5,WA_GetUnitBuff("player",aura_env.buff_name))
    if aura_env.duration ~= nil then -- Spell on CD and buff is ACTIVE
        aura_env.region:SetGlow(true)
        aura_env.duration = start + aura_env.duration - GetTime()
        aura_env.exp_time = nil
    else -- Spell on CD and buff is NOT ACTIVE
        aura_env.region:SetGlow(false)
        aura_env.duration = start + d - GetTime()
        aura_env.exp_time = d
        aura_env.color = {1,0,0,1}
    end
    return true
end

-- Init Function
aura_env.spell_name = "Aspect of the Turtle"
aura_env.buff_name = aura_env.spell_name
aura_env.cd_precision = 5.0
aura_env.color = {1,1,1,1}

function()
    if aura_env.duration == nil then
        return ""
    elseif aura_env.exp_time == nil then
        return display_cd(1)
    else
        return display_cd()
    end
end

display_cd = function(precision)
	precision = precision or aura_env.cd_precision
	if aura_env.exp_time ~= nil then
		diff = aura_env.exp_time - aura_env.duration
	else
		diff = aura_env.duration
	end
	if diff <= precision then
		return ("%.1f"):format(aura_env.duration)
	else
		return ("%i"):format(aura_env.duration)
	end
end

function()
	return unpack(aura_env.color)
end