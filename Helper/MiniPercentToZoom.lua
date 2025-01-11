local function MiniPercentToZoom(MiniPercent)
	return 1 - (MiniPercent * 0.5);
end

return MiniPercentToZoom;
