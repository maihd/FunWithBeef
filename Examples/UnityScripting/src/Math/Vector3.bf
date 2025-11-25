namespace UnityScripting;

using System;

[CRepr]
public struct Vector3
{
	public float x, y, z;

	public static Vector3 operator +(Vector3 lhs, Vector3 rhs)
	{
		return .{
			x = lhs.x + rhs.x,
			y = lhs.y + rhs.y,
			z = lhs.z + rhs.z
		};
	}
}