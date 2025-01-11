local tonumber = tonumber;
local type     = type;

local find   = string.find;
local gmatch = string.gmatch or string.gfind;

local unpack = table.unpack or unpack;

local function rgba(s)
	if type(s) == "table" then
		return unpack(s);
	end
	local i = 1;
	local t = { 1, 1, 1, 1 };
	local comma = find(s, ",");
	local pattern = comma and "[^,]+" or "%x%x";
	local base = comma and 10 or 16;
	local div = comma and 1 or 255;
	for w in gmatch(s, pattern) do
		t[i] = tonumber(w, base) / div;
		i = i + 1;
	end
	return unpack(t);
end

return rgba;
