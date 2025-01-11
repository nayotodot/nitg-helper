local TimingData        = require "Helper.TimingData";
local SetLastSecondHint = require "Helper.SetLastSecondHint";

local GetElapsedTimeFromBeatNoOffset = TimingData.GetElapsedTimeFromBeatNoOffset;

local function SetLastBeatHint(Beat)
	SetLastSecondHint(GetElapsedTimeFromBeatNoOffset(Beat));
end

return SetLastBeatHint;
