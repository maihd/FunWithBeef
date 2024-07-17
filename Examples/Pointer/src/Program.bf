namespace Pointer;

using System;

public class Data
{
	public uint unused = 0;

	public virtual void Hello()
	{
		Console.WriteLine("Hello world!");
	}
}

public struct InplaceAlloc
{
	public void* pointer;
    
    [Inline]
    public void* Alloc(int size, int align)
    {
        return pointer;
    } 

    [Inline]
    public void* AllocTyped(Type type, int size, int align)
    {
        void* data = Alloc(size, align);
        return data;
    }
    
    [Inline]
    public void Free(void* ptr)
    {
    }
}


public static class PointerCast
{
	public static T Cast<T>(void* pointer)
		where T: class, new
	{
		var alloc = InplaceAlloc();
		alloc.pointer = pointer;
		return new:alloc T();
	}
}

public static class Program
{
	public static void Main()
	{
		//void* dataPtr = Internal.StdMalloc(strideof(Data) + 16); // Need added, min size requirment of bf.Object is 16, because strideof(Data) always return 8
                                                                   // How can Beef compiler detect stride of class when using new?

        void* dataPtr = Internal.StdMalloc(typeof(Data).InstanceStride); // This works, show class in Beef have the concept of instance type
                                                                         // and in conclusion, sizeof/strideof only use for value type
		defer Internal.StdFree(dataPtr);

		Data data = PointerCast.Cast<Data>(dataPtr);
		data.Hello();

        // Reverse engineering array object in Beef

        int[] arrayObject = new int[10];
        defer delete arrayObject;

        Console.WriteLine("Size of arrayObject: {}", sizeof(int[]));        // Always print 8, because Beef class is just pointer, is this a bug?
        Console.WriteLine("Stride of arrayObject: {}", strideof(int[]));    // Always print 8, because Beef class is just pointer, is this a bug?

        Console.WriteLine("InstanceSize of arrayObject: {}", typeof(int[]).InstanceSize);
        Console.WriteLine("InstanceStride of arrayObject: {}", typeof(int[]).InstanceStride);

        int* arrayObjectPtr = (.)Internal.UnsafeCastToPtr(arrayObject);
        Console.WriteLine("First int of array: {}", arrayObjectPtr[0]);     // This will print address of mClassVData
        Console.WriteLine("Second int of array: {}", arrayObjectPtr[1]);    // This will print value mDebugFlags or arrayObject.Count
        Console.WriteLine("Third int of array: {}", arrayObjectPtr[2]);     // This will print value arrayObject.Count or first item value

        // Fixed array reverse engineering

        int[10] array = default; // Notes: cannot new int[10], if you want dynamic allocations fixed size array, use pointer or span
        Console.WriteLine("Size of array: {}", sizeof(int[10]));
        Console.WriteLine("Stride of array: {}", strideof(int[10]));
        Console.WriteLine("InstanceSize of array: {}", typeof(int[10]).InstanceSize);
        Console.WriteLine("InstanceStride of array: {}", typeof(int[10]).InstanceStride);

        // Span reverse engineering

        int* spanPtr = new int[10]*; // like malloc(sizeof(int) * 10) in C
        defer delete spanPtr;

        Span<int> span = .(spanPtr, 10);
        Console.WriteLine("Ptr of span: {}", span.Ptr);
        Console.WriteLine("Length of span: {}", span.Length);

        Console.WriteLine("Size of span: {}", sizeof(Span<int>));
        Console.WriteLine("Stride of span: {}", strideof(Span<int>));
        Console.WriteLine("InstanceSize of span: {}", typeof(Span<int>).InstanceSize);
        Console.WriteLine("InstanceStride of span: {}", typeof(Span<int>).InstanceStride);

        /* END OF PROGRAM */
        Console.Read();
	}
}