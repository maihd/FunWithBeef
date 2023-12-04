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

    public void* Alloc(int size, int align)
    {
        return pointer;
    } 

    public void* AllocTyped(Type type, int size, int align)
    {
        void* data = Alloc(size, align);
        return data;
    }

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
		/*void* dataPtr = Internal.StdMalloc(sizeof(Data));
		defer Internal.StdFree(dataPtr);

		Data data = PointerCast.Cast<Data>(dataPtr);
		data.Hello();*/
	}
}