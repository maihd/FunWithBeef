namespace BitsquidFoundation;

using System;

public static struct Memory
{
	[Inline]
	public static uint PtrAddress(void* ptr)
	{
		return BitConverter.Convert<void*, uint>(ptr);
	}
	
	[Inline]
	public static void* ToPtr(uint address)
	{
		return BitConverter.Convert<uint, void*>(address);
	}

	/// Aligns ptr to specified alignment by moving it forward
	/// if necessary and returns the result.
	[Inline]
	public static void* AlignForward(void* ptr, uint32 align)
	{
		var pi = BitConverter.Convert<void*, uint>(ptr);
		let mod = pi % align;
 		pi += BitConverter.Convert<bool, uint>(mod > 0) * (align - mod);
		return BitConverter.Convert<uint, void*>(pi);
	}

	/// Returns the result of advancing ptr by the specified number of bytes
	[Inline]
	public static void* PtrAdd(void* ptr, uint32 bytes)
	{
		var pi = PtrAddress(ptr);
		return ToPtr(pi + bytes);
	}

	/// Returns the result of moving ptr back by the specified number of bytes
	[Inline]
	public static void* PtrSub(void* ptr, uint32 bytes)
	{
		var pi = PtrAddress(ptr);
		return ToPtr(pi - bytes);
	}
}