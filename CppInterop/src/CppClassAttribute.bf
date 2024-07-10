using System;

[AttributeUsage(.Class)]
struct CppClassAttribute : this(Type dataType), Attribute, IOnTypeInit, IOnTypeDone
{
    [Comptime]
    public void OnTypeInit(Type type, Self* prev)
    {
        let dataTypeName = dataType.GetFullName(..scope .());

        if (!dataType.IsStruct)
        {
            Runtime.FatalError(scope $"dataType must be struct. Given: {dataTypeName}");
        }

#if BF_ENABLE_OBJECT_DEBUG_FLAGS
        let stride = dataType.Stride - sizeof(int) * 2;
#else
        let stride = dataType.Stride - sizeof(int);
#endif
        if (stride > 0)
        {
            // This field never be touch by programmer
            Compiler.EmitTypeBody(type, scope $"[System.NoShow] private uint8[{stride}] __data_buffer__{Compiler.CallerLineNum};");
        }

        Compiler.EmitTypeBody(type, scope $"public {dataTypeName}* Data => (.)&this.[Friend]mClassVData;");
    }

    [Comptime]
    public void OnTypeDone(Type type, Self* prev)
    {
        //if (type.GetField("vtable") case .Ok(let field))
        //{
        //    if (field.MemberOffset != 0)
        //	{
        //        Runtime.FatalError(scope $"vtable must be the first member for struct. Current offset: {field.MemberOffset}");
        //    }
        //}
        //else
        //{
        //    Runtime.FatalError(scope $"Missing vtable in {type.GetFullName(..scope .())}");
        //}
    }
}