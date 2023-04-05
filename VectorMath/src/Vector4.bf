namespace VectorMath;

using System;

//typealias Vector4 = System.Numerics.float4;

public struct Vector4
{
	public float x;
	public float y;
	public float z;
	public float w;

	[Inline]
	public this()
	{
		this = default;
	}

	[Inline]
	public this(float x, float y, float z, float w)
	{
		this.x = x;
		this.y = y;
		this.z = z;
		this.w = w;
	}

	[Inline]
	public static Self operator+(Self lhs, Self rhs)
	{
		return .(lhs.x + rhs.x, lhs.y + rhs.y, lhs.z + rhs.z, lhs.w + rhs.w);
	}

	[Inline]
	public static Self operator-(Self lhs, Self rhs)
	{
		return .(lhs.x - rhs.x, lhs.y - rhs.y, lhs.z * rhs.z, lhs.w * rhs.w);
	}

	[Inline]
	public static Self operator*(Self lhs, Self rhs)
	{
		return .(lhs.x * rhs.x, lhs.y * rhs.y, lhs.z * rhs.z, lhs.w * rhs.w);
	}

	[Inline]
	public static Self operator/(Self lhs, Self rhs)
	{
		return .(lhs.x / rhs.x, lhs.y / rhs.y, lhs.z / rhs.z, lhs.w / rhs.w);
	}

	/*  Crashing on 0.43.4, CANNOT BUILD ON BEEF NIGHTLY 4/4/2023
	[System.Intrinsic("add")]
	public static extern Self operator+(Self lhs, Self rhs);
	[System.Intrinsic("add"), System.Commutable]
	public static extern Self operator+(Self lhs, float rhs);

	[System.Intrinsic("sub")]
	public static extern Self operator-(Self lhs, Self rhs);
	[System.Intrinsic("sub"), System.Commutable]
	public static extern Self operator-(Self lhs, float rhs);

	[System.Intrinsic("mul")]
	public static extern Self operator*(Self lhs, Self rhs);
	[System.Intrinsic("mul"), System.Commutable]
	public static extern Self operator*(Self lhs, float rhs);

	[System.Intrinsic("div")]
	public static extern Self operator/(Self lhs, Self rhs);
	[System.Intrinsic("div"), System.Commutable]
	public static extern Self operator/(Self lhs, float rhs);
	*/
}