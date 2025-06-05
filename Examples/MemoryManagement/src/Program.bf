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
    public Arena* prev;
    public Arena* curr;

    public int    size;

    public uint8* head;
    public uint8* tail;

    // Factory

    public static Arena* Create(int bufferSize, Arena* prev = null)
    {
        void* buffer = Internal.Malloc(bufferSize);

        Arena* arena = (.)buffer;
        arena.prev = prev;
        arena.curr = arena;
        arena.size = bufferSize;
        arena.head = (uint8*)buffer + sizeof(Arena);
        arena.tail = (uint8*)buffer + bufferSize;

        var prev;
        while (prev != null)
        {
            var beforePrev = prev.prev;

            prev.curr = arena;
            prev = beforePrev;
        }

        return arena;
    }

    public static void Destroy(Arena* arena)
    {
        var arena;
        while (arena != null)
        {
            var prev = arena.prev;

            Internal.Free(arena);

            arena = prev;
        }
    }

    // BeefLang allocator's methods

	[Inline]
	public void* Alloc(int size, int align, String fileName = Compiler.CallerFilePath, int lineNum = Compiler.CallerLineNum) mut
	{
        // Belove is info to tracking memory allocations
        Console.WriteLine("Allocate from {}:{}", Compiler.CallerFilePath, Compiler.CallerLineNum); // Will print null:0, because new syntax have no knowledge of caller
        Console.WriteLine("Allocate from {}:{}", fileName, lineNum); // Will print <ProjectPath>/src/Program.bf:45, that how Beef compiler work

        if (size > this.size - sizeof(Arena))
        {
            return null;
        }

        var arena = this.curr;
        if (arena.head + size > arena.tail) {
            arena = Create(arena.size, arena);
        }

        let ptr = (void*)arena.head;
        arena.head += size;

		return ptr;
	}

	[Inline]
	public void Free(void* ptr) mut
	{
        // noops
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

		var arena = Arena.Create(1024);
        Console.WriteLine("[Before] Address of arena: {}, tail of arena: {}", (void*)arena, arena.tail);

		let pointer = new:arena int();
        Console.WriteLine("[After] Address of pointer: {}", (void*)pointer);
        Console.WriteLine("[After] Address of arena: {}, tail of arena: {}", (void*)arena, arena.tail);

		delete:arena pointer; // No need

		/*IRawAllocator allocator = arena;
 		let pointerFromAlloc = new:allocator int();
		delete:allocator pointerFromAlloc;*/

        Console.Read();
	}
}