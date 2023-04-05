namespace VectorMath;

using System;

public class Program
{
	public static void Main()
	{
		Console.WriteLine("VectorMath smiling to say Hello World!");

		TestVector2:
		{
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
		}

		TestVector4:
		{
			let a = Vector4(1, 2, 3, 4);
			let b = Vector4(5, 6, 7, 8);

			let c = a + b;
			Console.WriteLine("({0}, {1}, {2}, {3}) + ({4}, {5}, {6}, {7}) = ({8}, {9}, {10}, {11})",
				a.x, a.y, a.z, a.w,
				b.x, b.y, b.z, b.w,
				c.x, c.y, c.z, c.w);

			let d = a - b;
			Console.WriteLine("({0}, {1}, {2}, {3}) - ({4}, {5}, {6}, {7}) = ({8}, {9}, {10}, {11})",
				a.x, a.y, a.z, a.w,
				b.x, b.y, b.z, b.w,
				d.x, d.y, d.z, d.w);

			let f = a * b;
			Console.WriteLine("({0}, {1}, {2}, {3}) * ({4}, {5}, {6}, {7}) = ({8}, {9}, {10}, {11})",
				a.x, a.y, a.z, a.w,
				b.x, b.y, b.z, b.w,
				f.x, f.y, f.z, f.w);

			let e = a / b;
			Console.WriteLine("({0}, {1}, {2}, {3}) / ({4}, {5}, {6}, {7}) = ({8}, {9}, {10}, {11})",
				a.x, a.y, a.z, a.w,
				b.x, b.y, b.z, b.w,
				e.x, e.y, e.z, e.w);
		}
		
		Console.WriteLine("Press any key to close console...");
		Console.Read();
	}
}