function()
    if aura_env.loaded_fns == nil then
        spec_id = GetSpecialization()
        -- Establish CD Time Precision Variables and Functions
        cd_precision_dur = 5.0
        cd_precision = function(expirationTime,duration)
            local testTime = expirationTime-GetTime()
            if testTime >= cd_precision_dur and testTime < expirationTime then
                return ("%i"):format(expirationTime-GetTime())
            elseif duration == WeakAuras.gcdDuration() then
                return ""
            elseif testTime > 0.0 and testTime < expirationTime then
                return ("%.1f"):format(expirationTime-GetTime())
            else
                return ""
            end
        end
        -- End CD Time Precision Code
        
        -- Establish CD Color Variables and Functions
        cd_color = function(progress, r1, g1, b1, a1, r2, g2, b2, a2, spell_name)
            local start_time, duration = GetSpellCooldown(spell_name)
            if start_time == nil or start_time == 0 then
                return 1,1,1,a1 --Transparent
            end
            local dt = GetTime() - start_time
            if dt <= 0 or duration == WeakAuras.gcdDuration() then
                return 1,1,1,a1 --Transparent
            else
                return 1,0,0,a1 --Red
            end
        end
        -- End CD Color Code
        
        -- Start new precision function
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
        -- End New Precision function
        
        aura_env.num_calls = 0
        aura_env.loaded_fns = true
        return true
    else -- if these functions have been loaded before
        aura_env.num_calls = aura_env.num_calls + 1