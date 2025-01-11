local getmetatable, ipairs, setmetatable, tostring, type =
      getmetatable, ipairs, setmetatable, tostring, type;

local match  = string.match;
local find   = string.find;
local sub    = string.sub;
local insert = table.insert;

if not match then
	function match(s, pattern, init)
		local from, to = find(s, pattern, init);
		if from then
			return sub(s, from, to);
		end
		return nil;
	end
end

local memoize = {};

local function GetChildren(self)
	if memoize[self] then
		return memoize[self];
	elseif not (match(tostring(self), "^%S+") == "ActorFrame" and self.GetChildren) then
		return self;
	end
	local children = {};
	memoize[self] = children;
	for i, v in ipairs(self:GetChildren()) do
		local name = v:GetName();
		local actor = children[name];
		if actor then
			local tbl = {};
			if type(actor) == "table" then
				tbl = actor;
			else
				insert(tbl, actor);
			end
			insert(tbl, v);
			children[name] = tbl;
		else
			children[name] = v;
		end
	end
	return setmetatable(children, getmetatable(self));
end

return GetChildren;
