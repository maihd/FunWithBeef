namespace SceneGraph;

using System;
using System.Collections;
using System.Diagnostics;

class Node : Ref
{
	public float Position;
	public float Rotation;
	public float Scale;

	public List<Node> Children
	{
		get; private set;
	}

	public this()
	{
		Children = new List<Node>();
	}

	public ~this()
	{
		for (var child in Children)
		{
			child.Release();
		}

		delete Children;
	}

	public virtual void Update(float dt)
	{
		for (var child in Children)
		{
			child.Update(dt);
		}
	}

	public virtual void Draw()
	{
		for (var child in Children)
		{
			child.Draw();
		}
	}

	public virtual Node AddChild(Node child)
	{
		Debug.Assert(child != null);

		//child.Retain();
		Children.Add(child);

		return this;
	}

	public virtual Node DetachChild(Node child)
	{
		Children.Remove(child);
		child.Release();

		return this;
	}
}