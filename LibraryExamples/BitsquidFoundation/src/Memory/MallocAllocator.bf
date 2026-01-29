namespace BitsquidFoundation;

using System;

public class MallocAllocator : IAllocator
{
    public void* Alloc(int size, int align)
    {
        return Internal.StdMalloc(size);
    }

    public void Free(void* ptr)
    {
        Internal.StdFree(ptr);
    }
}    