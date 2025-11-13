namespace UnityScripting;

using System;

[CRepr]
public struct UnityInterfaceGUID
{
	uint64 high;
	uint64 low;

	[Inline]
	public this(uint64 high, uint64 low)
	{
		this.high = high;
		this.low = low;
	}
}