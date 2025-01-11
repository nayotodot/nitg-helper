local NOTITG_VERSION = require "Helper.NOTITG_VERSION";

local function SetLastSecondHint(Time)
	GAMESTATE:SetSongEndTime(Time * (NOTITG_VERSION < 20210711 and GAMESTATE:GetMusicRate() or 1.0));
end

return SetLastSecondHint;
