namespace BitsquidFoundation;

using System;

enum TestEnum
{
    case X;
    case Y;
    case Z(int);
}

class Program
{
	static void Main()
	{
		Console.WriteLine("Hello world, this is a showcase that Beef can help Bitsquid Foundation better!");

		Array<TestEnum> array;
	}
}