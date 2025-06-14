namespace OOP;

using System;

//[AttributeUsage(.Class)]
//struct CppClassAttribute : this(int align = 4), CReprAttribute, IOnTypeInit
//{
//    [Comptime]
//    public void OnTypeInit(Type target, Self* prev)
//    {
//    }
//}

[CRepr, Packed, Align(4)]
class Super
{
    public int32 i;
    public String str;
    public bool b;
}

[CRepr, Packed, Align(4)]
class Child : Super
{
    public uint32 u;
}

class Program
{
    static void Main()
    {
        Console.WriteLine("Beef OOP");

        Console.WriteLine("Size of Super: {}", typeof(Super).InstanceSize);
        Console.WriteLine("Stride of Super: {}", typeof(Super).InstanceStride);
        Console.WriteLine();

        Console.WriteLine("Size of Child: {}", typeof(Child).InstanceSize);
        Console.WriteLine("Stride of Child: {}", typeof(Child).InstanceStride);
        Console.WriteLine();

        Console.WriteLine("Offset of Super.i: {}", offsetof(Super, i));
        Console.WriteLine("Offset of Super.str: {}", offsetof(Super, str));
        Console.WriteLine("Offset of Super.b: {}", offsetof(Super, b));
        Console.WriteLine();

        Console.WriteLine("Offset of Child.i: {}", offsetof(Child, i));
        Console.WriteLine("Offset of Child.str: {}", offsetof(Child, str));
        Console.WriteLine("Offset of Child.b: {}", offsetof(Child, b));
        Console.WriteLine("Offset of Child.u: {}", offsetof(Child, u));
        Console.WriteLine();

        var super = scope Super();
        super.i = 32;
        super.str = scope String("Super");
        super.b = true;

        let superDataPtr = (uint8*)&super.i;

        let iPtr = *(int32*)superDataPtr;
        Console.WriteLine("super.i: {}", iPtr);

        let strPtr = *(String*)(superDataPtr + strideof(int32));
        Console.WriteLine("super.str: {}", strPtr);

        let bPtr = *(bool*)(superDataPtr + strideof(int32) + strideof(String));
        Console.WriteLine("super.b: {}", bPtr);
    }
}