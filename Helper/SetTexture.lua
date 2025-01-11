local DISPLAY       = DISPLAY;
local SCREEN_WIDTH  = SCREEN_WIDTH;
local SCREEN_HEIGHT = SCREEN_HEIGHT;

local function SetTexture(self, target)
	self:basezoomx(SCREEN_WIDTH / DISPLAY:GetDisplayWidth());
	self:basezoomy(-(SCREEN_HEIGHT / DISPLAY:GetDisplayHeight()));
	if target and target.GetTexture then
		self:SetTexture(target:GetTexture());
	end
	return self;
end

return SetTexture;
