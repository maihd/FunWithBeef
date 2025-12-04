namespace UnityScripting;

using System;

[AttributeUsage(.Class | .Struct | .Enum | .Interface)]
public struct UnityTypeAttribute : Attribute
{
    public String Name;
}