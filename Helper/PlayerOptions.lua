local NUM_PLAYFIELDS = require "Helper.NUM_PLAYFIELDS";

local PlayerOptions = {};
for i = 1, NUM_PLAYFIELDS do
	PlayerOptions[i] = GAMESTATE:GetPlayerState(i - 1):GetPlayerOptions();
end

return PlayerOptions;
