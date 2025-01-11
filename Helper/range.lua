local epsilon = 0.000001;

local function range(from, to, step)
	step = step or 1;
	from = from - step;
	to = to - epsilon;
	return function()
		from = from + step;
		if from < to then
			return from;
		end
	end
end

return range;
