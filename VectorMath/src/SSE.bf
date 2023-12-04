namespace VectorMath;

using System;

public struct m128
{
	float x, y, z, w;
}

public static class SSE
{
	[LinkName("_mm_add_ps"), CallingConvention(.Fastcall)]
	public static extern m128 add(m128 x, m128 y);
}