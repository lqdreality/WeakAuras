function()
    local start_time, d, gcd = GetSpellCooldown(104316)
    if start_time == nil or start_time == 0 then -- If spell wasn't cast, skip it
        aura_env.remaining_time = ""
    elseif d <= 0 or d == WeakAuras.gcdDuration() then
        aura_env.remaining_time = ""
    else
        aura_env.remaining_time = cd_precision(start_time+d)
    end
    local demonic_calling = select(1,WA_GetUnitBuff("player","Demonic Calling"))
    if demonic_calling ~= nil then
        aura_env.region:SetGlow(true)
    else
        aura_env.region:SetGlow(false)
    end
    return true
end