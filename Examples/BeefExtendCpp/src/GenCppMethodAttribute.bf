namespace BeefExtendCpp;

using System;

[AttributeUsage(.Method | .Constructor)]
struct GenCppMethodAttribute : Attribute
{
}