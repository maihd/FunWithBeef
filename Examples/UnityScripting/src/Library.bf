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

public class BeefBehaviour
{
	int numCreated;
	Vector3 position;

	int goHandle;
	int transformHandle;

	public this()
	{
		numCreated = 0;

		//if (UnityPluginEntry.IsLoaded)
		//{
		//	numCreated -= 5;
		//}

		goHandle = GameObjectNew();

		transformHandle = GameObjectGetTransform(goHandle);
		TransformSetPosition(transformHandle, position);
	}

	public virtual void Update()
	{
		DebugLog("MonoBehaviourUpdate in Beef!");

		if (numCreated < 5)
		{
			//int32 goHandle = GameObjectNew();
			//int32 transformHandle = GameObjectGetTransform(goHandle);

			/*int goHandle = GameObjectNew();
			int transformHandle = GameObjectGetTransform(goHandle);

			float comp = (float)numCreated;
			Vector3 position = .() { x = comp, y = comp, z = comp };
			TransformSetPosition(transformHandle, position);
			numCreated++;*/
		}

		float comp = 0.01f;
		position += .{ x = comp, y = comp, z = comp };

		// int transformHandle = GameObjectGetTransform(goHandle);
		TransformSetPosition(transformHandle, position);
	}
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

	[Export, CLink]
	public static BeefBehaviour MonoBehaviourCreate()
	{
		DebugLog("Create BeefBehaviour");
		return new:Allocator BeefBehaviour();
	}

	[Export, CLink]
	public static void MonoBehaviourDestroy(BeefBehaviour behaviour)
	{
		DebugLog("Destroy BeefBehaviour");
		delete:Allocator behaviour;
	}

	[Export, CLink]
	public static void MonoBehaviourUpdate(BeefBehaviour behaviour)
	{
		behaviour.Update();
	}
}