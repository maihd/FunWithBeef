namespace UnityScripting;

using System;
using System.Interop;

[CRepr]
struct Vector3
{
	public float x, y, z;
}

[CRepr]
struct Vector4
{
    public float x, y, z, w;
}

function int32 FnGameObjectNew();
function int32 FnGameObjectGetTransform(int32 thisHandle);
function void FnTransformSetPosition(int32 thisHandle, Vector3 position);

class Transform
{

}

class Library
{
	static int numCreated;

	static FnGameObjectNew GameObjectNew;
	static FnGameObjectGetTransform GameObjectGetTransform;
	static FnTransformSetPosition TransformSetPosition;

	[Export, CLink]
	public static void Init(FnGameObjectNew fnGameObjectNew, FnGameObjectGetTransform fnGameObjectGetTransform, FnTransformSetPosition fnTransformSetPosition)
	{
		GameObjectNew = fnGameObjectNew;
		GameObjectGetTransform = fnGameObjectGetTransform;
		TransformSetPosition = fnTransformSetPosition;

		numCreated = 0;
	}

	[Export, CLink]
	public static void MonoBehaviourUpdate()
	{
		if (numCreated < 5)
		{
			int32 goHandle = GameObjectNew();
			int32 transformHandle = GameObjectGetTransform(goHandle);
			float comp = (float)numCreated;
			Vector3 position = .() { x = comp, y = comp, z = comp };
			TransformSetPosition(transformHandle, position);
			numCreated++;
		}
	}
}