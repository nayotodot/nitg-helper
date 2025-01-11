local ARROW_SIZE = require "Helper.ARROW_SIZE";

local function PixelToPercent(Pixel)
	return Pixel / ARROW_SIZE;
end

return PixelToPercent;
