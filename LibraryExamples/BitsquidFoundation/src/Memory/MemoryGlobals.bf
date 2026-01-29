namespace BitsquidFoundation;

/// Functions for accessing global memory data.
public static struct MemoryGlobals
{
    private static MallocAllocator s_MallocAllocator;
    public static IAllocator DefaultAllocator => s_MallocAllocator;

	public static void Init(uint32 scratchBufferSize = 4 * 1024 * 1024)
	{
        s_MallocAllocator = new MallocAllocator();
	}

	public static void Shutdown()
	{
        delete s_MallocAllocator;
        s_MallocAllocator = null;
    }
}