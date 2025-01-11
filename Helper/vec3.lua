-- Vector3
local setmetatable = setmetatable;
local type         = type;
local unpack       = unpack;
local abs          = math.abs;

local vector3 = {};

function vector3:create(x, y, z)
	local t = {
		x or 0,
		y or 0,
		z or 0,
	};
	return setmetatable(t, self);
end
local create = vector3.create;

function vector3:identity()
	return create(self);
end

function vector3:clone()
	return create(self, self[1], self[2], self[3]);
end
local clone = vector3.clone;

function vector3:cross(other)
	return create(
		self,
		self[2] * other[3] - self[3] * other[2],
		self[1] * other[3] - self[3] * other[1],
		self[1] * other[2] - self[2] * other[1]
	);
end

function vector3:length()
	return (self[1] ^ 2 + self[2] ^ 2 + self[3] ^ 2) ^ 0.5;
end
local length = vector3.length;

function vector3:lerp(other, t)
	return create(
		self,
		t * (other[1] - self[1]) + self[1],
		t * (other[2] - self[2]) + self[2],
		t * (other[3] - self[3]) + self[3]
	);
end

function vector3:approach(other, speed)
	for i = 1, 3 do
		if self[i] ~= other[i] then
			local delta = other[i] - self[i];
			local sign = delta / abs(delta);
			local tomove = sign * speed;
			if abs(tomove) > abs(delta) then
				tomove = delta;
			end
			self[i] = self[i] + tomove;
		end
	end
	return clone(self);
end

function vector3:normalize()
	local scale = 1 / length(self);
	return create(
		self,
		self[1] * scale,
		self[2] * scale,
		self[3] * scale
	);
end

local function check(operand)
	if type(operand) ~= "table" then
		operand = { operand, operand, operand };
	end
	return operand;
end

vector3.__index = vector3;

function vector3.__add(lhs, rhs)
	lhs, rhs = check(lhs), check(rhs);
	for i = 1, 3 do
		lhs[i] = lhs[i] + rhs[i];
	end
	return lhs;
end

function vector3.__sub(lhs, rhs)
	lhs, rhs = check(lhs), check(rhs);
	for i = 1, 3 do
		lhs[i] = lhs[i] - rhs[i];
	end
	return lhs;
end

function vector3.__mul(lhs, rhs)
	lhs, rhs = check(lhs), check(rhs);
	for i = 1, 3 do
		lhs[i] = lhs[i] * rhs[i];
	end
	return lhs;
end

function vector3.__div(lhs, rhs)
	lhs, rhs = check(lhs), check(rhs);
	for i = 1, 3 do
		lhs[i] = lhs[i] / rhs[i];
	end
	return lhs;
end

function vector3.__pow(lhs, rhs)
	lhs, rhs = check(lhs), check(rhs);
	for i = 1, 3 do
		lhs[i] = lhs[i] ^ rhs[i];
	end
	return lhs;
end

function vector3.__unm(self)
	for i = 1, 3 do
		self[i] = -self[i];
	end
	return self;
end

function vector3.__eq(lhs, rhs)
	lhs, rhs = check(lhs), check(rhs);
	for i = 1, 3 do
		if lhs[i] ~= rhs[i] then
			return false;
		end
	end
	return true;
end

function vector3.__call(self, ...)
	return create(self, unpack(arg));
end

return setmetatable(vector3, vector3);
