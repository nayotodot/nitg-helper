local ceil  = math.ceil;
local floor = math.floor;

local function round(n)
	return (n < 0 and ceil or floor)(n + (n < 0 and -0.5 or 0.5));
end

-- This is a divisor for our "fixed-point" time/beat representation.  It must be evenly divisible
-- by 2, 3, and 4, to exactly represent 8th, 12th and 16th notes.
local ROWS_PER_BEAT = 48;

-- The number of beats per measure.
local BEATS_PER_MEASURE = 4;

-- The number of rows used in a measure.
local ROWS_PER_MEASURE = ROWS_PER_BEAT * BEATS_PER_MEASURE;

local NoteType = {};

function NoteType.GetNoteType(row)
	if row % (ROWS_PER_MEASURE / 4) == 0 then
		return 1;
	elseif row % (ROWS_PER_MEASURE / 8) == 0 then
		return 2;
	elseif row % (ROWS_PER_MEASURE / 12) == 0 then
		return 3;
	elseif row % (ROWS_PER_MEASURE / 16) == 0 then
		return 4;
	elseif row % (ROWS_PER_MEASURE / 24) == 0 then
		return 5;
	elseif row % (ROWS_PER_MEASURE / 32) == 0 then
		return 6;
	elseif row % (ROWS_PER_MEASURE / 48) == 0 then
		return 7;
	elseif row % (ROWS_PER_MEASURE / 64) == 0 then
		return 8;
	elseif row % (ROWS_PER_MEASURE / 192) == 0 then
		return 9;
	end
end
local GetNoteType = NoteType.GetNoteType;

function NoteType.BeatToNoteRow(beat)
	return round(beat * ROWS_PER_BEAT);
end
local BeatToNoteRow = NoteType.BeatToNoteRow;

function NoteType.BeatToNoteType(beat)
	return GetNoteType(BeatToNoteRow(beat));
end

function NoteType.NoteRowToBeat(row)
	return row / ROWS_PER_BEAT;
end

return NoteType;
