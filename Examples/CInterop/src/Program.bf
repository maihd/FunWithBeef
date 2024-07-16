namespace CInterop;

using System;

class Program
{
	[LinkName("add")]
	static extern int32 Add(int32 a, int32 b);

	public static void Main()
	{
		Console.WriteLine("Add(1, 2) = {0}", Add(1, 2));
		Console.Read();
	}
}