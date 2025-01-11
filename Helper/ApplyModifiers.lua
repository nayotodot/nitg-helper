local CustomPlayerOptions = require "Helper.CustomPlayerOptions";
local NUM_PLAYFIELDS      = require "Helper.NUM_PLAYFIELDS";
local PlayerOptions       = require "Helper.PlayerOptions";

local function ApplyModifiers(pn, name, level, speed)
	local mod = CustomPlayerOptions[name];
	if mod then
		if pn then
			mod(PlayerOptions[pn], level, speed);
		else
			for i = 1, NUM_PLAYFIELDS do
				mod(PlayerOptions[i], level, speed);
			end
		end
	end
end

return ApplyModifiers;
