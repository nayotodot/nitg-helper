local function compare(step, idx, limit)
	if 0 < step then
		return idx < limit;
	else
		return limit < idx;
	end
end

local function range(init, limit, step)
	step = step or 1;
	local idx = init - step;
	local function iter()
		idx = idx + step;
		if compare(step, idx, limit) then
			return idx;
		end
	end
	return iter;
end

return range;
