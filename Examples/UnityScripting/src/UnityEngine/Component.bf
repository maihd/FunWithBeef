namespace UnityEngine;

using System;

public struct Component : UnityEngine.Object
{
    [Inline]
    public this(void* ptr) : base(ptr) {}
}