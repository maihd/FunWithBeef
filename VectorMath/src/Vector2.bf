namespace VectorMath;

using System;

public struct Vector2
{
	public float x;
	public float y;

	public this()
	{
		this = default;
	}

	public this(float x, float y)
	{
		this.x = x;
		this.y = y;
	}

	public static Self operator+(Self lhs, Self rhs)
	{
		return .(lhs.x + rhs.x, lhs.y + rhs.y);
	}

	public static Self operator-(Self lhs, Self rhs)
	{
		return .(lhs.x - rhs.x, lhs.y - rhs.y);
	}

	public static Self operator*(Self lhs, Self rhs)
	{
		return .(lhs.x * rhs.x, lhs.y * rhs.y);
	}

	public static Self operator/(Self lhs, Self rhs)
	{
		return .(lhs.x / rhs.x, lhs.y / rhs.y);
	}

	/* Crashing on 0.43.4
	[Intrinsic("add")]
	public static extern Self operator+(Self lhs, Self rhs);

	[Intrinsic("sub")]
	public static extern Self operator-(Self lhs, Self rhs);

	[Intrinsic("mul")]
	public static extern Self operator*(Self lhs, Self rhs);

	[Intrinsic("div")]
	public static extern Self operator/(Self lhs, Self rhs);
	*/
}