local Player = require "Helper.Player";

local function SetPlayerProxy(self, pn, name)
	local c = Player(pn);
	if c then
		local target = name and c:GetChild(name) or c;
		self:SetTarget(target);
		target:hidden(1);
		return self;
	end
end

return SetPlayerProxy;
