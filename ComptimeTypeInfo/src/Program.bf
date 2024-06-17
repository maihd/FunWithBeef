using System;

namespace ComptimeTypeInfo;

class Program
{
	[Comptime]
	public static void PrintTypeInfo<T>()
	{
		Type type = typeof(T);
		String name = type.GetName(..scope String(1024));
		Compiler.MixinRoot(scope $"""
			System.Console.WriteLine($"typeof(T) = ${name}");
		""");
	}

	public static int Main(String[] args)
	{
		Console.WriteLine("Comptime Type Info");
		defer Console.Read();

		PrintTypeInfo<StringView>();

		return 0;
	}
}