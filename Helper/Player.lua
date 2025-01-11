local ScreenManager = require "Helper.ScreenManager";

local function Player(pn)
	return ScreenManager():GetChild("PlayerP" .. pn);
end

return Player;
