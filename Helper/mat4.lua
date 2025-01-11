-- Matrix4
local setmetatable = setmetatable;
local unpack       = unpack;
local rad          = math.rad;
local cos          = math.cos;
local sin          = math.sin;

local matrix4 = {};
local vector3 = require "Helper.vec3";

function matrix4:create(
	v00, v01, v02, v03,
	v10, v11, v12, v13,
	v20, v21, v22, v23,
	v30, v31, v32, v33
)
	local t = {
		{ v00, v01, v02, v03 },
		{ v10, v11, v12, v13 },
		{ v20, v21, v22, v23 },
		{ v30, v31, v32, v33 },
	};
	return setmetatable(t, self);
end
local create = matrix4.create;

function matrix4:identity()
	return create(self, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
end
local identity = matrix4.identity;

function matrix4:multiply(a, b)
	return create(
		self,
		b[1][1] * a[1][1] + b[1][2] * a[2][1] + b[1][3] * a[3][1] + b[1][4] * a[4][1],
		b[1][1] * a[1][2] + b[1][2] * a[2][2] + b[1][3] * a[3][2] + b[1][4] * a[4][2],
		b[1][1] * a[1][3] + b[1][2] * a[2][3] + b[1][3] * a[3][3] + b[1][4] * a[4][3],
		b[1][1] * a[1][4] + b[1][2] * a[2][4] + b[1][3] * a[3][4] + b[1][4] * a[4][4],
		b[2][1] * a[1][1] + b[2][2] * a[2][1] + b[2][3] * a[3][1] + b[2][4] * a[4][1],
		b[2][1] * a[1][2] + b[2][2] * a[2][2] + b[2][3] * a[3][2] + b[2][4] * a[4][2],
		b[2][1] * a[1][3] + b[2][2] * a[2][3] + b[2][3] * a[3][3] + b[2][4] * a[4][3],
		b[2][1] * a[1][4] + b[2][2] * a[2][4] + b[2][3] * a[3][4] + b[2][4] * a[4][4],
		b[3][1] * a[1][1] + b[3][2] * a[2][1] + b[3][3] * a[3][1] + b[3][4] * a[4][1],
		b[3][1] * a[1][2] + b[3][2] * a[2][2] + b[3][3] * a[3][2] + b[3][4] * a[4][2],
		b[3][1] * a[1][3] + b[3][2] * a[2][3] + b[3][3] * a[3][3] + b[3][4] * a[4][3],
		b[3][1] * a[1][4] + b[3][2] * a[2][4] + b[3][3] * a[3][4] + b[3][4] * a[4][4],
		b[4][1] * a[1][1] + b[4][2] * a[2][1] + b[4][3] * a[3][1] + b[4][4] * a[4][1],
		b[4][1] * a[1][2] + b[4][2] * a[2][2] + b[4][3] * a[3][2] + b[4][4] * a[4][2],
		b[4][1] * a[1][3] + b[4][2] * a[2][3] + b[4][3] * a[3][3] + b[4][4] * a[4][3],
		b[4][1] * a[1][4] + b[4][2] * a[2][4] + b[4][3] * a[3][4] + b[4][4] * a[4][4]
	);
end
local multiply = matrix4.multiply;

function matrix4:translation(x, y, z)
	local out = identity(self);
	out[4][1] = x or 0;
	out[4][2] = y or 0;
	out[4][3] = z or 0;
	return out;
end
local translation = matrix4.translation;

function matrix4:scaling(x, y, z)
	local out = identity(self);
	out[1][1] = x or 1;
	out[2][2] = y or 1;
	out[3][3] = z or 1;
	return out;
end

function matrix4:axisangle(axis, angle)
	local r = rad(angle);
	local c = cos(r);
	local s = sin(r);
	local t = 1.0 - c;

	local m00 = c + axis[1] * axis[1] * t;
	local m01 = axis[1] * axis[2] * t - axis[3] * s;
	local m02 = axis[1] * axis[3] * t + axis[2] * s;
	local m03 = 0;

	local m10 = axis[1] * axis[2] * t + axis[3] * s;
	local m11 = c + axis[2] * axis[2] * t;
	local m12 = axis[2] * axis[3] * t - axis[1] * s;
	local m13 = 0;

	local m20 = axis[1] * axis[3] * t - axis[2] * s;
	local m21 = axis[2] * axis[3] * t + axis[1] * s;
	local m22 = c + axis[3] * axis[3] * t;
	local m23 = 0;

	local m30 = axis[1];
	local m31 = axis[2];
	local m32 = axis[3];
	local m33 = 1;

	return create(
		self,
		m00, m01, m02, m03,
		m10, m11, m12, m13,
		m20, m21, m22, m23,
		m30, m31, m32, m33
	);
end

function matrix4:translate(x, y, z)
	local m00 = 1;
	local m01 = 0;
	local m02 = 0;
	local m03 = 0;

	local m10 = 0;
	local m11 = 1;
	local m12 = 0;
	local m13 = 0;

	local m20 = 0;
	local m21 = 0;
	local m22 = 1;
	local m23 = 0;

	local m30 = x;
	local m31 = y;
	local m32 = z;
	local m33 = 1;

	return create(
		self,
		m00, m01, m02, m03,
		m10, m11, m12, m13,
		m20, m21, m22, m23,
		m30, m31, m32, m33
	);
end

function matrix4:scale(x, y, z)
	local m00 = x;
	local m01 = 0;
	local m02 = 0;
	local m03 = 0;

	local m10 = 0;
	local m11 = y;
	local m12 = 0;
	local m13 = 0;

	local m20 = 0;
	local m21 = 0;
	local m22 = z;
	local m23 = 0;

	local m30 = 0;
	local m31 = 0;
	local m32 = 0;
	local m33 = 1;

	return create(
		self,
		m00, m01, m02, m03,
		m10, m11, m12, m13,
		m20, m21, m22, m23,
		m30, m31, m32, m33
	);
end

--- @param angle number
--- @return table
function matrix4:rotationx(angle)
	local theta = rad(angle);
	local out = identity(self);

	out[2][2] = cos(theta);
	out[3][3] = out[2][2];

	out[3][2] = sin(theta);
	out[2][3] = -out[3][2];

	return out;
end

--- @param angle number
--- @return table
function matrix4:rotationy(angle)
	local theta = rad(angle);
	local out = identity(self);

	out[1][1] = cos(theta);
	out[3][3] = out[1][1];

	out[1][3] = sin(theta);
	out[3][1] = -out[1][3];

	return out;
end

--- @param angle number
--- @return table
function matrix4:rotationz(angle)
	local theta = rad(angle);
	local out = identity(self);

	out[1][1] = cos(theta);
	out[2][2] = out[1][1];

	out[1][2] = sin(theta);
	out[2][1] = -out[1][2];

	return out;
end

--- @param rotx number
--- @param roty number
--- @param rotz number
--- @return table
function matrix4:rotationxyz(rotx, roty, rotz)
	rotx, roty, rotz = rad(rotx), rad(roty), rad(rotz);

	local cx = cos(rotx);
	local cy = cos(roty);
	local cz = cos(rotz);
	local sx = sin(rotx);
	local sy = sin(roty);
	local sz = sin(rotz);

	local m00 = cz * cy;
	local m01 = cz * sy * sx + sz * cx;
	local m02 = cz * sy * cx + sz * -sx;
	local m03 = 0;

	local m10 = -sz * cy;
	local m11 = -sz * sy * sx + cz * cx;
	local m12 = -sz * sy * cx + cz * -sx;
	local m13 = 0;

	local m20 = -sy;
	local m21 = cy * sx;
	local m22 = cy * cx;
	local m23 = 0;

	local m30 = 0;
	local m31 = 0;
	local m32 = 0;
	local m33 = 1;

	return create(
		self,
		m00, m01, m02, m03,
		m10, m11, m12, m13,
		m20, m21, m22, m23,
		m30, m31, m32, m33
	);
end

function matrix4:lookat(eye, center, up)
	local Z = vector3(
		eye[1] - center[1],
		eye[2] - center[2],
		eye[3] - center[3]
	);
	Z = Z:normalize();
	local Y = vector3(up[1], up[2], up[3]);
	local X = vector3(
		Y[2] * Z[3] - Y[3] * Z[2],
		-Y[1] * Z[3] + Y[3] * Z[1],
		Y[1] * Z[2] - Y[2] * Z[1]
	);
	Y = vector3(
		Z[2] * X[3] - Z[3] * X[2],
		-Z[1] * X[3] + Z[3] * X[1],
		Z[1] * X[2] - Z[2] * X[1]
	);
	X = X:normalize();
	Y = Y:normalize();
	local m1 = create(
		self,
		X[0], Y[0], Z[0], 0,
		X[1], Y[1], Z[1], 0,
		X[2], Y[2], Z[2], 0,
		0, 0, 0, 1
	);
	local m2 = translation(self, -eye[1], -eye[2], -eye[3]);
	return multiply(self, m1, m2);
end

matrix4.__index = matrix4;

function matrix4:__mul(op1, op2)
	return multiply(self, op1, op2);
end

function matrix4:__call(...)
	return create(self, unpack(arg));
end

return setmetatable(matrix4, matrix4);
