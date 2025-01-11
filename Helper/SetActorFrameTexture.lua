local function SetActorFrameTexture(self)
	self:SetWidth(DISPLAY:GetDisplayWidth());
	self:SetHeight(DISPLAY:GetDisplayHeight());
	self:EnablePreserveTexture(true);
	self:Create();
	return self;
end

return SetActorFrameTexture;
