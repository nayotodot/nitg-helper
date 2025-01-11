local PrefsManager = {};

local PREFSMAN = PREFSMAN;
local tonumber = tonumber;

local function Get(name)
	local value = PREFSMAN:GetPreference(name);
	local num = tonumber(value);
	if num then
		value = num;
	end
	return value;
end

local function Set(name, value)
	return PREFSMAN:SetPreference(name, value);
end

function PrefsManager:__call(name, value)
	if value then
		return Set(name, value);
	else
		return Get(name);
	end
end

return setmetatable(PrefsManager, PrefsManager);
