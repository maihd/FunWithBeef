namespace UnityEngine;

using System;

public struct GameObject : UnityEngine.Object
{
    [Inline]
    public this(void* ptr) : base(ptr) {}
}