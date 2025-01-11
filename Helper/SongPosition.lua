local TimingData = require "Helper.TimingData";

local SongPosition = {};

local GAMESTATE = GAMESTATE;
local GameState = GameState;

local GetSongTimeVisible = GameState.GetSongTimeVisible;
local GetSongBeatVisible = GameState.GetSongBeatVisible;
local GetSongTime        = GameState.GetSongTime;
local GetSongBeat        = GameState.GetSongBeat;

local GlobalOffsetSeconds = TimingData.GlobalOffsetSeconds;

function SongPosition.GetMusicSecondsVisible()
	return GetSongTimeVisible(GAMESTATE);
end

function SongPosition.GetSongBeatVisible()
	return GetSongBeatVisible(GAMESTATE);
end

function SongPosition.GetMusicSeconds()
	return GetSongTime(GAMESTATE) + GlobalOffsetSeconds;
end

function SongPosition.GetSongBeat()
	return GetSongBeat(GAMESTATE);
end

function SongPosition.GetSongBeatNoOffset()
	return TimingData.GetBeatFromElapsedTimeNoOffset(GetSongTime(GAMESTATE));
end

return SongPosition;
