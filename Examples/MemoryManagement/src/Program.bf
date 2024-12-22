namespace MemoryManagement;

using System;

struct PrivateArena
{
	private void* Alloc(int size, int align, String fileName = Compiler.CallerFileName, int lineNum = Compiler.CallerLineNum)
	{
		return null;
	}

	private void Free(void* ptr)
	{

	}
}

struct Arena
{
	[Inline]
	public void* Alloc(int size, int align, String fileName = Compiler.CallerFilePath, int lineNum = Compiler.CallerLineNum) mut
	{
        Console.WriteLine("Allocate from {}:{}", Compiler.CallerFilePath, Compiler.CallerLineNum); // Will print null:0, because new syntax have no knowledge of caller
        Console.WriteLine("Allocate from {}:{}", fileName, lineNum); // Will print <ProjectPath>/src/Program.bf:45, that how Beef compiler work
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

		/*IRawAllocator allocator = arena;
 		let pointerFromAlloc = new:allocator int();
		delete:allocator pointerFromAlloc;*/

        Console.Read();
	}
}