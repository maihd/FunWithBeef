namespace UnityEngine;

using System;

public struct Object
{
    public void* Ptr { get; private set mut; }
    
    [Inline]
    public this(void* ptr)
    {
        Ptr = ptr;
    }
}