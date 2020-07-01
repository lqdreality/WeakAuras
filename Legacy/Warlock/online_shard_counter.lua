function()
    
    if _G["Scarllet_Destruction_Warlock_HUD_Options"] and not _G["Scarllet_Destruction_Warlock_HUD_Options"].SoulShardText then return end
    
    local specId = GetSpecialization()
    local ssCount = UnitPower("player", Enum.PowerType.SoulShards, false)
    local fragCount = UnitPower("player", Enum.PowerType.SoulShards, true)
    local amount = aura_env.getPowerFromCast()
    if specId == 3 then
        if aura_env.fragDisplay == "shortened" then
            shardValue = fragCount - ssCount*10
            if shardValue == 0 and fragCount > 0 then
                shardValue = 10 
            end
        elseif aura_env.fragDisplay == "decimal" then
            shardValue = format("%.1f", fragCount/10)
        elseif aura_env.fragDisplay == "whole" then
            shardValue = fragCount
        end
        
    elseif specId == 1 or specId == 2 then
        shardValue = ssCount
    end
    if aura_env.textPrediction[specId] then
        if specId == 3 then
            if aura_env.fragDisplay == "decimal" then
                shardValue = format("%.1f", shardValue - amount)
            elseif aura_env.fragDisplay == "shortened" then
                shardValue = shardValue
            elseif aura_env.fragDisplay == "whole" then
                shardValue = shardValue - amount*10
            end
        else
            shardValue = shardValue - amount
        end
    end
    local point, relativeTo, relativePoint, xOff, yOff = aura_env.region.timer:GetPoint() 
    if point ~= aura_env.textPosition 
    and relativeTo ~= aura_env.region 
    and relativePoint ~= aura_env.textPosition 
    and xOff ~= aura_env.textPositionX 
    or yOff ~= aura_env.textPositionY then
        aura_env.region.timer:ClearAllPoints()
        aura_env.region.timer:SetPoint(
            aura_env.textPosition, 
            aura_env.region, 
            aura_env.textPosition, 
            aura_env.textPositionX, 
            aura_env.textPositionY
        )
    end
    if aura_env.shardNumber == aura_env.centerCounter then
        return shardValue
    elseif aura_env.centerCounter == 0 then
        if (specId == 3 and math.ceil(fragCount) == (aura_env.shardNumber+1)*10) or (specId ~= 3 and ssCount == aura_env.shardNumber) then
            return shardValue
        end
    end
end