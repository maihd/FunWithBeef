namespace OOP;

using System;

[CRepr]
class Super
{
    public int32 i;
    public String str;
    public bool b;
}

[CRepr, Align(4)]
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

        Console.WriteLine("Size of Child: {}", typeof(Child).InstanceSize);
        Console.WriteLine("Stride of Child: {}", typeof(Child).InstanceStride);
    }
}