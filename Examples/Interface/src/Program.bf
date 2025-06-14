namespace Interface;

using System;

[AlwaysInclude]
interface ISimple
{
    [AlwaysInclude]
    void SomeMethod();
    
    [AlwaysInclude]
    void SomeMethod2(String str);
    
    [AlwaysInclude]
    void SomeMethod3(String str);
}

interface IConcrete
{
    [AlwaysInclude]
    concrete void SomeMethod();
    
    [AlwaysInclude]
    concrete void SomeMethod2(String str);
    
    [AlwaysInclude]
    concrete void SomeMethod3(String str);
}

[AlwaysInclude]
struct SimpleStruct : ISimple, IConcrete
{
    public void SomeMethod()
    {
    }

    public void SomeMethod2(String str)
    {
    }

    public void SomeMethod3(String str)
    {
    }
}

struct InterfaceContainer
{
    ISimple simple;
}

class Program
{
    static void Main()
    {
        Console.WriteLine("Beef Interface");

        Console.WriteLine("ISimple.FullName: {}", typeof(ISimple).GetFullName(..scope String()));

        Console.WriteLine("ISimple.IsBoxed: {}", typeof(ISimple).IsBoxed);
        Console.WriteLine("ISimple.IsBoxedStructPtr: {}", typeof(ISimple).IsBoxedStructPtr);
        Console.WriteLine("ISimple.IsBoxedPrimitivePtr: {}", typeof(ISimple).IsBoxedPrimitivePtr);
        
        Console.WriteLine("ISimple.BaseType: {}", typeof(ISimple).BaseType);
        Console.WriteLine("ISimple.IsNullable: {}", typeof(ISimple).IsNullable);
        Console.WriteLine("ISimple.IsObject: {}", typeof(ISimple).IsObject);
        Console.WriteLine("ISimple.IsPointer: {}", typeof(ISimple).IsPointer);
        Console.WriteLine("ISimple.IsSplattable: {}", typeof(ISimple).IsSplattable);

        Console.WriteLine("Size of ISimple: {}", sizeof(ISimple));
        Console.WriteLine("Stride of ISimple: {}", strideof(ISimple));

        //Console.WriteLine("Size of ISimple.UnderlyingType: {}", typeof(ISimple).Size);
        //Console.WriteLine("Stride of ISimple.UnderlyingType: {}", typeof(ISimple).Stride);

        Console.WriteLine("InstanceSize of ISimple: {}", typeof(ISimple).InstanceSize);
        Console.WriteLine("InstanceStride of ISimple: {}", typeof(ISimple).InstanceStride);

        Console.WriteLine("Size of ISimple.UnderlyingType: {}", typeof(ISimple).UnderlyingType.Size);
        Console.WriteLine("Stride of ISimple.UnderlyingType: {}", typeof(ISimple).UnderlyingType.Stride);

        Console.WriteLine("Size of IConcrete: {}", sizeof(IConcrete));
        Console.WriteLine("Stride of IConcrete: {}", strideof(IConcrete));

        Console.WriteLine("Size of IConcrete.UnderlyingType: {}", typeof(IConcrete).Size);
        Console.WriteLine("Stride of IConcrete.UnderlyingType: {}", typeof(IConcrete).Stride);

        Console.WriteLine("Size of IConcrete.UnderlyingType: {}", typeof(IConcrete).UnderlyingType.Size);
        Console.WriteLine("Stride of IConcrete.UnderlyingType: {}", typeof(IConcrete).UnderlyingType.Stride);

        Console.WriteLine("Size of InterfaceContainer: {}", sizeof(InterfaceContainer));
        Console.WriteLine("Stride of InterfaceContainer: {}", strideof(InterfaceContainer));

        // Crash in Runtime
        //Console.WriteLine("Size of ISimple.BoxedPtrType: {}", typeof(ISimple).BoxedPtrType.Size);
        //Console.WriteLine("Stride of ISimple.BoxedPtrType: {}", typeof(ISimple).BoxedPtrType.Stride);

        // Crash in Runtime
        //Console.WriteLine("Size of ISimple.BoxedType: {}", typeof(ISimple).BoxedType.Size);
        //Console.WriteLine("Stride of ISimple.BoxedType: {}", typeof(ISimple).BoxedType.Stride);

        // Crash in Runtime
        //Console.WriteLine("Size of ISimple.OuterType: {}", typeof(ISimple).OuterType.Size);
        //Console.WriteLine("Stride of ISimple.OuterType: {}", typeof(ISimple).OuterType.Stride);

        let simpleStruct = SimpleStruct();
        let simple = (ISimple)simpleStruct;
        let iConcrete = (IConcrete)simpleStruct;

        simple.SomeMethod();
        simple.SomeMethod2(..scope String());
        simple.SomeMethod3(..scope String());
        
        // Crash in Runtime
        //Console.WriteLine("Size of ISimple.BoxedPtrType: {}", simple.GetType().BoxedPtrType.Size);
        //Console.WriteLine("Stride of ISimple.BoxedPtrType: {}", simple.GetType().BoxedPtrType.Stride);

        Console.WriteLine("Size of ISimple.BoxedType: {}", simple.GetType().BoxedType.Size);
        Console.WriteLine("Stride of ISimple.BoxedType: {}", simple.GetType().BoxedType.Stride);

        // Crash in Runtime
        //Console.WriteLine("Size of ISimple.OuterType: {}", simple.GetType().OuterType.Size);
        //Console.WriteLine("Stride of ISimple.OuterType: {}", simple.GetType().OuterType.Stride);

        Console.WriteLine("Size of IConcrete.BoxedType: {}", iConcrete.GetType().BoxedType.Size);
        Console.WriteLine("Stride of IConcrete.BoxedType: {}", iConcrete.GetType().BoxedType.Stride);

        Console.WriteLine("ISimple.WrappedType: {}", simple.GetType().WrappedType);
    }
}