local floor = math.floor;

local function loop(x, l, h)
	local y = x - l;
	local z = h - l;
	return y - floor(y / z) * z + l;
end

return loop;
