function()
    local loc,ft = cd_slider("Channel Demonfire")
    if loc == nil then
    	return false
    else
    	if ft ~= nil and ft <= 3 then
    		aura_env.ft = ("%.1f"):format(ft)
    	else
    		aura_env.ft = nil
    	end
    	aura_env.region:SetOffset(loc,cd_slider_y_offset)
    	return true
    end
end