function()
    -- Soul Shard Bar Predict
    local amount = aura_env.getPowerFromCast()
    local c = aura_env.fragCount+amount-aura_env.fragTotal
    if amount > 0 then
        if aura_env.shardCount > aura_env.shardTotal then
            return "foward", 0
        end
        if c <= 0 then
            return "forward", 0
        elseif c >= 10 then
            return "forward", math.min(10,aura_env.fragTotal+10-aura_env.fragCount)
        else
            return "forward", math.min(c,amount)
        end
    elseif amount < 0 then
        if aura_env.fragCount <= aura_env.fragTotal then
            return "backward",0
        end
        if c <= 0 then
            return "backward", math.min(10,aura_env.fragCount-aura_env.fragTotal)
        elseif c >= 10 then
            return "backward", 0
        else
            return "backward", math.min(10-c,-1*amount)
        end
    else
        return "forward", 0
    end
end
--
function()
    local check = aura_env.fragCount - aura_env.fragTotal
    if check >= 10 then
        return 10,10,true
    elseif check <= 0 then
        return 0,10,true
    else
        return check,10,true
    end
end