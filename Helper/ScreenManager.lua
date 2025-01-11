local ScreenManager = {};

function ScreenManager:__call()
	return SCREENMAN:GetTopScreen();
end

return setmetatable(ScreenManager, ScreenManager);
