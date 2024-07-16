namespace VectorMath;

using System;
using System.Reflection;

public struct SwizzleAttribute : this(int size, bool isStdType = false), Attribute, IOnTypeInit
{
	private static readonly let VectorTypeNames = String[?]("float", "Vector2", "Vector3", "Vector4");

	[Comptime]
	public void OnTypeInit(Type type, Self* prev)
	{
		if (size < 2 || size > 4)
		{
			Runtime.FatalError("Only vector with size in [2, 4] are support swizzle.");
		}

		let xyzw = StringView[?]("x", "y", "z", "w");
		GenerateSwizzles(type, xyzw);
	}
	
	[Comptime]
	private void GenerateSwizzles(Type type, Span<StringView> keys)
	{
		for (let i in 0..<size)
		{
			for (let j in 0..<size)
			{
				GenerateSwizzleProperty(type, keys, int[?](i, j));
			}
		}

		if (size < 3)
		{
			return;
		}

		for (let i in 0..<size)
		{
			for (let j in 0..<size)
			{
				for (let k in 0..<size)
				{
					GenerateSwizzleProperty(type, keys, int[?](i, j, k));
				}
			}
		}

		if (size < 4)
		{
			return;
		}


		for (let i in 0..<size)
		{
			for (let j in 0..<size)
			{
				for (let k in 0..<size)
				{
					for (let l in 0..<size)
					{
						GenerateSwizzleProperty(type, keys, int[?](i, j, k, l));
					}
				}
			}
		}
	}

	[Comptime]
	private void GenerateSwizzleProperty(Type type, Span<StringView> keys, Span<int> swizzles)
	{
		let code = scope String();
		let isReadonly = HasDuplicate(swizzles);

		let typeName = VectorTypeNames[swizzles.Length - 1];

		let propertyName = scope String();
		for (let i in swizzles)
		{
			propertyName.Append(keys[i]);
		}

		if (isStdType)
		{
			switch(propertyName)
			{
			case "yx": 		return;
			case "wzyx": 	return;
			}
		}

		code.Append(scope $"public {typeName} {propertyName} ");
		code.Append("{ get => .(");
		
		for (let i < swizzles.Length)
		{
			code.Append(keys[swizzles[i]]);
			if (i < swizzles.Length - 1)
			{
				code.Append(", ");
			}
		}

		code.Append("); ");

		if (!isReadonly)
		{
			code.Append("set mut { ");

			for (let i < swizzles.Length)
			{
				code.Append(scope $"{keys[swizzles[i]]} = value.{keys[i]}; ");
			}

			code.Append("} ");
		}

		code.Append("}\n");

		Compiler.EmitTypeBody(type, code);
	}

	[Comptime]
	private bool HasDuplicate(Span<int> array)
	{
		for (let i < array.Length)
		{
			for (let j in (i + 1)..<array.Length)
			{
				if (array[i] == array[j])
				{
					return true;
				}
			}
		}

		return false;
	}
}