local Preference = require "Helper.PrefsManager";

local function SetInputPlayer(self, pn, ip)
	if self then
		self:SetAwake(true);
		self:SetInputPlayer(ip or (pn - 1) % 2);
		self:SetPlayerController(Preference("AutoPlay"));
		return self;
	end
end

return SetInputPlayer;
