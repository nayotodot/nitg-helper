local lerp = require("Helper.lerp");
local rgba = require("Helper.rgba");

local function colorlerp(x, before, after)
	local t = { 1, 1, 1, 1 };
	local l = { rgba(before) };
	local h = { rgba(after) };
	for i = 1, 4 do
		t[i] = lerp(x, l[i], h[i]);
	end
	return t;
end

return colorlerp;
