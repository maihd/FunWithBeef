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

    // Constructors

    private this()
    {
        this.prev = null;
        this.curr = null;
        this.size = 0;
        this.head = null;
        this.tail = null;
    }

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

struct ArenaTemp : IDisposable
{
    Arena* arena;
    uint8* mark;

    public this(Arena* arena)
    {
        this.arena = arena;
        this.mark = arena.head;
    }

    public void Dispose() mut
    {
        if (this.arena != null)
        {
            this.arena.head = this.mark;
    
            this.arena = null;
            this.mark = null;
        }
    }

    // Scope (choose one name you prefered)

    public mixin DeferDispose() mut
    {
        defer:: Dispose();
    }

    public mixin AutoDispose() mut
    {
        defer:: Dispose();
    }

    // BeefLang allocator's methods

    [Inline]
    public void* Alloc(int size, int align, String fileName = Compiler.CallerFilePath, int lineNum = Compiler.CallerLineNum) mut
    {
        return arena.Alloc(size, align, fileName, lineNum);
    }

    [Inline]
    public void Free(void* ptr) mut
    {
        arena.Free(ptr);
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

        var arenaTemp = ArenaTemp(arena);
        arenaTemp.AutoDispose!();

        Console.WriteLine("[Before] Address of arena: {}, tail of arena: {}", (void*)arena, arena.tail);

		let pointer = new:arenaTemp int();
        Console.WriteLine("[After] Address of pointer: {}", (void*)pointer);
        Console.WriteLine("[After] Address of arena: {}, tail of arena: {}", (void*)arena, arena.tail);

		delete:arena pointer; // No need
        Console.WriteLine("[AfterDiposeTemp] Address of arena: {}, tail of arena: {}", (void*)arena, arena.tail);

        Arena.Destroy(arena);

		/*IRawAllocator allocator = arena;
 		let pointerFromAlloc = new:allocator int();
		delete:allocator pointerFromAlloc;*/

        /*Console.WriteLine("Press any key to close...");
        Console.Read();*/
	}
}