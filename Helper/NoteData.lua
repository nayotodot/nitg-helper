---@diagnostic disable: undefined-global
local NoteType = require "Helper.NoteType";

local Steps         = GAMESTATE:GetCurrentSteps(GAMESTATE:GetMasterPlayerNumber());
local GetNoteData   = Steps.GetNoteData;
local NoteRowToBeat = NoteType.NoteRowToBeat;

-- The max number of rows allowed for a Steps pattern.
local MAX_NOTE_ROW = 1073741824;

local NoteData = {};

function NoteData.GetNoteData(first, last)
	last = last or NoteRowToBeat(MAX_NOTE_ROW);
	local list = {};
	local data = GetNoteData(Steps, first, last);
	for i = 1, #data do
		if data[i][1] < last then
			list[#list + 1] = data[i];
		end
	end
	return list;
end

return NoteData;
