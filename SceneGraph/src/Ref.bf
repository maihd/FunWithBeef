namespace SceneGraph;

using System;
using System.Diagnostics;

class Ref
{
	int refCount = 1;

	public void Retain()
	{
		refCount++;
	}

	public void Release()
	{
		Debug.Assert(refCount > 0);

		refCount--;
		if (refCount == 0)
		{
			delete this;
		}
	}

	public void AutoRelease()
	{

	}
}