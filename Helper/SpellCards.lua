---@diagnostic disable: deprecated, undefined-global
local rgba = require "Helper.rgba";

local getn   = table.getn;
local insert = table.insert;
local sort   = table.sort;

local Song = GAMESTATE:GetCurrentSong();

local GetSpellCards          = Song.GetSpellCards;
local SetNumSpellCards       = Song.SetNumSpellCards;
local SetSpellCardColor      = Song.SetSpellCardColor;
local SetSpellCardDifficulty = Song.SetSpellCardDifficulty;
local SetSpellCardName       = Song.SetSpellCardName;
local SetSpellCardTiming     = Song.SetSpellCardTiming;

local function comp(a, b)
	return a[1] < b[1];
end

local function Get()
	local list = {};
	local data = GetSpellCards(Song);
	for i = 1, getn(data) do
		local param = {
			data[i].StartBeat,
			data[i].EndBeat,
			data[i].Difficulty,
			data[i].Name,
			data[i].Color,
		};
		insert(list, param);
	end
	return list;
end

local function Set(data)
	local n = getn(data);
	SetNumSpellCards(Song, n);
	for i = 1, n do
		local list = data[i];
		SetSpellCardTiming(Song, i - 1, list[1], list[2]);
		SetSpellCardDifficulty(Song, i - 1, list[3]);
		SetSpellCardName(Song, i - 1, list[4]);
		SetSpellCardColor(Song, i - 1, rgba(list[5]));
	end
end

local function Add(...)
	local data = Get();
	insert(data, arg);
	sort(data, comp);
	Set(data);
end

local function Clear()
	SetNumSpellCards(Song, 0);
end

return {
	Add   = Add,
	Clear = Clear,
	Get   = Get,
	Set   = Set,
};
