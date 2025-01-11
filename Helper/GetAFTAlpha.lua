local PrefsManager = require "Helper.PrefsManager";

local find  = string.find;
local lower = string.lower;

local LastSeenVideoDriver = lower(PrefsManager("LastSeenVideoDriver"));

local function GetAFTAlpha()
	if find(LastSeenVideoDriver, "nvidia") then
		return 0.875;
	end
	return 1.0;
end

return GetAFTAlpha;
