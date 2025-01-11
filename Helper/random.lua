-- minstd_rand (MINSTD)
-- https://en.wikipedia.org/wiki/MINSTD
local ceil  = math.ceil;
local floor = math.floor;
local fmod  = math.fmod or (function(x, y) return x - floor(x / y) * y; end);

local seed = 1;
local a = 48271;
local m = 2147483647;	-- 0x7FFFFFFF

local function random(x, y)
	seed = fmod(seed * a, m);
	local r = seed / m;
	if not x then
		return r;
	end
	x = floor(x);
	if not y then
		return ceil(r * x);
	end
	return floor(r * (floor(y) - x + 1) + x);
end

local function randomseed(x)
	if x then
		seed = fmod(x, m);
	end
	return seed;
end

return {
	random     = random,
	randomseed = randomseed,
};
