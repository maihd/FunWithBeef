namespace UnityScripting;

using System;
using System.Interop;

[CRepr]
struct Vector3
{
	public float x, y, z;

	public static Vector3 operator+(Vector3 lhs, Vector3 rhs)
	{
		return .{
			x = lhs.x + rhs.x,
			y = lhs.y + rhs.y,
			z = lhs.z + rhs.z,
		};
	}
}

[CRepr]
struct Vector4
{
    public float x, y, z, w;
}

function int FnGameObjectNew();
function int FnGameObjectGetTransform(int thisHandle);
function void FnTransformSetPosition(int thisHandle, Vector3 position);

class Transform
{

}

class Library
{
	static int numCreated;

	static int goHandle;
	static Vector3 position;

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

		//if (UnityPluginEntry.IsLoaded)
		//{
		//	numCreated -= 5;
		//}
		goHandle = GameObjectNew();
		
		int transformHandle = GameObjectGetTransform(goHandle);
		TransformSetPosition(transformHandle, position);
	}

	[Export, CLink]
	public static void MonoBehaviourUpdate()
	{
		Debug.Log("MonoBehaviourUpdate in Beef!");

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
		int transformHandle = GameObjectGetTransform(goHandle);
		TransformSetPosition(transformHandle, position);
	}
}