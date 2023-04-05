namespace VectorMath;

using System;

public class Program
{
	public static void Main()
	{
		Console.WriteLine("VectorMath smiling to say Hello World!");

		let a = Vector2(1, 2);
		let b = Vector2(3, 4);

		let c = a + b;
		Console.WriteLine("({0}, {1}) + ({2}, {3}) = ({4}, {5})", a.x, a.y, b.x, b.y, c.x, c.y);

		let d = a - b;
		Console.WriteLine("({0}, {1}) - ({2}, {3}) = ({4}, {5})", a.x, a.y, b.x, b.y, d.x, d.y);

		let f = a * b;
		Console.WriteLine("({0}, {1}) * ({2}, {3}) = ({4}, {5})", a.x, a.y, b.x, b.y, f.x, f.y);

		let e = a / b;
		Console.WriteLine("({0}, {1}) / ({2}, {3}) = ({4}, {5})", a.x, a.y, b.x, b.y, e.x, e.y);

		Console.Read();
	}
}