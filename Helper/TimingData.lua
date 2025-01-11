local Preference   = require "Helper.PrefsManager";

local TimingData = {};

local Song = GAMESTATE:GetCurrentSong();
local GetElapsedTimeFromBeat = Song.GetElapsedTimeFromBeat;
local GetBeatFromElapsedTime = Song.GetBeatFromElapsedTime;

local GlobalOffsetSeconds = Preference("GlobalOffsetSeconds");
TimingData.GlobalOffsetSeconds = GlobalOffsetSeconds;

function TimingData.GetElapsedTimeFromBeatNoOffset(Beat)
	return GetElapsedTimeFromBeat(Song, Beat);
end

function TimingData.GetBeatFromElapsedTimeNoOffset(Time)
	return GetBeatFromElapsedTime(Song, Time);
end

function TimingData.GetElapsedTimeFromBeat(Beat)
	return GetElapsedTimeFromBeat(Song, Beat) + GlobalOffsetSeconds;
end

function TimingData.GetBeatFromElapsedTime(Time)
	return GetBeatFromElapsedTime(Song, Time + GlobalOffsetSeconds);
end

return TimingData;
