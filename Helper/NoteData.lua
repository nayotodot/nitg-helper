local NoteType = require "Helper.NoteType";
local Player   = require "Helper.Player";

local NoteRowToBeat = NoteType.NoteRowToBeat;

-- The max number of rows allowed for a Steps pattern.
local MAX_NOTE_ROW = 1073741824;

local NoteData = {};

function NoteData.GetNoteData(first, last)
	last = last or NoteRowToBeat(MAX_NOTE_ROW);
	local result = {};
	local nd = Player(GAMESTATE:GetMasterPlayerNumber() + 1):GetNoteData(first, last);
	for i = 1, #nd do
		local data = nd[i];
		if data[1] < last then
			result[#result + 1] = data;
		end
	end
	return result;
end

return NoteData;
