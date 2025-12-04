namespace UnityScripting;

using System;
using System.Interop;

[CRepr]
public struct NativeStringViewUtf8
{
	public char8* 	data;
	public int 		length;

	public static implicit operator Self(StringView strview)
	{
		Self self = .
			{
				data = strview.Ptr,
				length = strview.Length
			};

		return self;
	}

	public static implicit operator Self(String str)
	{
		Self self = .
			{
				data = str.Ptr,
				length = str.Length
			};

		return self;
	}
}

[CRepr]
struct Vector4
{
	public float x, y, z, w;
}

function void FnDebugLog(NativeStringViewUtf8 text);
function int FnGameObjectNew();
function int FnGameObjectGetTransform(int thisHandle);
function void FnTransformSetPosition(int thisHandle, Vector3 position);

class Transform
{
}

static
{
	static UnityAllocator Allocator;
	static FnDebugLog DebugLog;
	static FnGameObjectNew GameObjectNew;
	static FnGameObjectGetTransform GameObjectGetTransform;
	static FnTransformSetPosition TransformSetPosition;
}

struct UnityAllocator
{
	public void* Alloc(int size, int align)
	{
		return Internal.Dbg_RawAlloc(size);
	}

	public void Free(void* ptr)
	{
		Internal.Dbg_RawFree(ptr);
	}
}


class Library
{
	[Export, CLink]
	public static void Init(FnDebugLog fnLog, FnGameObjectNew fnGameObjectNew, FnGameObjectGetTransform fnGameObjectGetTransform, FnTransformSetPosition fnTransformSetPosition)
	{
		DebugLog = fnLog;
		GameObjectNew = fnGameObjectNew;

		GameObjectGetTransform = fnGameObjectGetTransform;
		TransformSetPosition = fnTransformSetPosition;
	}
}
