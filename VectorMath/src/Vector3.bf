namespace VectorMath;

using System;
using System.Numerics;

[Align(16)]
[Swizzle(3)]
public struct Vector3
{
	public float x;
	public float y;
	public float z;

	public this()
	{
		this = default;
	}

	public this(float x, float y, float z)
	{
		this.x = x;
		this.y = y;
		this.z = z;
	}

	public static Self operator+(Self lhs, Self rhs)
	{
		return .(lhs.x + rhs.x, lhs.y + rhs.y, lhs.z + lhs.z);
	}

	public static Self operator-(Self lhs, Self rhs)
	{
		return .(lhs.x - rhs.x, lhs.y - rhs.y, lhs.z - lhs.z);
	}

	public static Self operator*(Self lhs, Self rhs)
	{
		return .(lhs.x * rhs.x, lhs.y * rhs.y, lhs.z * rhs.z);
	}

	public static Self operator/(Self lhs, Self rhs)
	{
		return .(lhs.x / rhs.x, lhs.y / rhs.y, lhs.z / rhs.z);
	}
}