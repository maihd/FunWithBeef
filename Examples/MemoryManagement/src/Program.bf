namespace MemoryManagement;

using System;

struct PrivateArena
{
	private void* Alloc(int size, int align)
	{
		return null;
	}

	private void Free(void* ptr)
	{

	}
}

struct Arena : IRawAllocator
{
	[Inline]
	public void* Alloc(int size, int align) mut
	{
        Console.WriteLine("Allocate from {}:{}", Compiler.CallerFileName, Compiler.CallerLineNum); // Will print null:0, because new syntax have no knowledge of caller
		return null;
	}

	[Inline]
	public void Free(void* ptr) mut
	{

	}
}

class Program
{
	static void Main()
	{
		/* This code can compile
		let privateArena = PrivateArena();
		let pointer = new:privateArena int();
		delete:privateArena pointer;
		*/

		let arena = Arena();
		let pointer = new:arena int();
		delete:arena pointer;

		IRawAllocator allocator = arena;
 		let pointerFromAlloc = new:allocator int();
		delete:allocator pointerFromAlloc;

<<<<<<< HEAD
		Console.Write("Press any key to exit...");
		Console.Read();
=======
        Console.Read();
>>>>>>> edaf176cddd3b731b8c3ec50d396ade025985853
	}
}