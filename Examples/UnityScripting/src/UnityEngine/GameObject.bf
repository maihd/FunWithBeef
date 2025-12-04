namespace UnityEngine;

using System;
using UnityScripting;

[UnityType(Name = "UnityEngine.GameObject")]
public struct GameObject : UnityEngine.Object
{
    [Inline]
    public this(void* ptr) : base(ptr) {}
}