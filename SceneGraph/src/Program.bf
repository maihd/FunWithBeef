namespace SceneGraph;

using System;

class Program
{
	static void Main()
	{
		Console.WriteLine("FunWithBeef: SceneGraph demo");

		Node root = new Node()
			.AddChild(new Sprite())
			.AddChild(new Node());

		root.Update(0.0f);
		root.Draw();
		root.Release();

		Console.Read();
	}
}
