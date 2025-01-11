local GameState = {};

local GAMESTATE = GAMESTATE;

function GameState:__index(key)
	return GAMESTATE[key];
end

return setmetatable(GameState, GameState);
