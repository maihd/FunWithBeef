namespace VectorMath;

using System;
using System.Numerics;

[Swizzle(2)]
public struct Vector2
{
	public using float2 data;

	public this()
	{
		this = default;
	}

	public this(float2 data)
	{
		this.data = data;
	}

	public this(float x, float y)
	{
		this.x = x;
		this.y = y;
	}
	
	public static Self operator+(Self lhs, Self rhs)
	{
		//crash
		//return .(lhs.data + rhs.data);
		return .(lhs.x - rhs.x, lhs.y - rhs.y);
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
	

	/* Crashing on 0.43.4, CANNOT BUILD ON BEEF NIGHTLY 4/5/2023
	-> Beef compiler does not support intrinsic for custom type
	[Intrinsic("add")]
	public static extern Vector2 operator+(Vector2 lhs, Vector2 rhs);
	[Intrinsic("add"), Commutable]
	public static extern Vector2 operator+(Vector2 lhs, float rhs);

	[Intrinsic("sub")]
	public static extern Vector2 operator-(Vector2 lhs, Vector2 rhs);
	[Intrinsic("sub"), Commutable]
	public static extern Vector2 operator-(Vector2 lhs, float rhs);

	[Intrinsic("mul")]
	public static extern Vector2 operator*(Vector2 lhs, Vector2 rhs);
	[Intrinsic("mul"), Commutable]
	public static extern Vector2 operator*(Vector2 lhs, float rhs);

	[Intrinsic("div")]
	public static extern Vector2 operator/(Vector2 lhs, Vector2 rhs);
	[Intrinsic("div")]
	public static extern Vector2 operator/(Vector2 lhs, float rhs);
	[Intrinsic("div")]
	public static extern Vector2 operator/(float lhs, Vector2 rhs);
	
	[Intrinsic("mod")]
	public static extern Vector2 operator%(Vector2 lhs, Vector2 rhs);
	[Intrinsic("mod")]
	public static extern Vector2 operator%(Vector2 lhs, float rhs);
	[Intrinsic("mod")]
	public static extern Vector2 operator%(float lhs, Vector2 rhs);

	[Intrinsic("eq")]
	public static extern bool2 operator==(Vector2 lhs, Vector2 rhs);
	[Intrinsic("eq"), Commutable]
	public static extern bool2 operator==(Vector2 lhs, float rhs);

	[Intrinsic("neq")]
	public static extern bool2 operator!=(Vector2 lhs, Vector2 rhs);
	[Intrinsic("neq"), Commutable]
	public static extern bool2 operator!=(Vector2 lhs, float rhs);

	[Intrinsic("lt")]
	public static extern bool2 operator<(Vector2 lhs, Vector2 rhs);
	[Intrinsic("lt")]
	public static extern bool2 operator<(Vector2 lhs, float rhs);

	[Intrinsic("lte")]
	public static extern bool2 operator<=(Vector2 lhs, Vector2 rhs);
	[Intrinsic("lte")]
	public static extern bool2 operator<=(Vector2 lhs, float rhs);

	[Intrinsic("gt")]
	public static extern bool2 operator>(Vector2 lhs, Vector2 rhs);
	[Intrinsic("gt")]
	public static extern bool2 operator>(Vector2 lhs, float rhs);

	[Intrinsic("gte")]
	public static extern bool2 operator>=(Vector2 lhs, Vector2 rhs);
	[Intrinsic("gte")]
	public static extern bool2 operator>=(Vector2 lhs, float rhs);
	*/
}