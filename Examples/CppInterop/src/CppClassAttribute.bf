using System;

struct CppClassBuffer<T>
{
#if BF_ENABLE_OBJECT_DEBUG_FLAGS
    const let stride = strideof(T) - sizeof(int) * 2;
#else
    const let stride = strideof(T) - sizeof(int);
#endif

    [System.NoShow] private uint8[stride > 0 ? stride : 0] __data_buffer__;
}

struct CppClassBuffer<T, TSuper>
{
#if BF_ENABLE_OBJECT_DEBUG_FLAGS
    const let stride = strideof(TSuper) - strideof(T) - sizeof(int) * 2;
#else
    const let stride = strideof(TSuper) - strideof(T) - sizeof(int);
#endif

    [System.NoShow] private uint8[stride > 0 ? stride : 0] __data_buffer__;
}

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
        let stride = dataType.Stride + sizeof(int) * 2;
#else
        let stride = dataType.Stride + sizeof(int);
#endif
        if (stride > 0)
        {
            // This field never be touched by programmer
            Compiler.EmitTypeBody(type, scope $"[System.NoShow] private uint8[{stride}] __data_buffer__{Compiler.CallerLineNum};");
        }
        
        let offset = sizeof(int);
        Compiler.EmitTypeBody(type, scope $"[Inline] public {dataTypeName}* Data => (.)(void*)((int)System.Internal.UnsafeCastToPtr(this) + {offset});");

        // Todos: any properties base on fields of Data
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

[AttributeUsage(.Interface)]
struct BeefVTableAttribute : this(Type classType), Attribute, IOnTypeInit
{
    [Comptime]
    public void OnTypeInit(Type selfType, Self* prev)
    {
        for (let method in classType.GetMethods())
        {
            if (method.IsConstructor || method.IsDestructor)
            {
                continue;
            }

            if (method.IsVirtual || method.IsAbstract)
            {
                let interfaceMethod = scope String();
                interfaceMethod.AppendF("{}", method.ReturnType.GetFullName(..scope String()));
                interfaceMethod.AppendF(" {}", method.Name);
                
                interfaceMethod.AppendF("(");
                interfaceMethod.AppendF("{}", method.GetParamsDecl(..scope String()));
                interfaceMethod.AppendF(");\n");

                Compiler.EmitTypeBody(selfType, interfaceMethod);
            }
        }
    }
}


[AttributeUsage(.Interface)]
struct CppVTableAttribute : this(Type classType), Attribute, IOnTypeInit
{
    const StringView[?] BfObjectDefaultVirtualMethods = .(
        "DynamicCastToTypeId",
        "DynamicCastToInterface",
        "DynamicCastToSignature",
        "ToString",
        "GCMarkMembers"
    );

    [Comptime]
    public void OnTypeInit(Type selfType, Self* prev)
    {
        for (let method in classType.GetMethods())
        {
            if (method.IsConstructor || method.IsDestructor)
            {
                continue;
            }

            if (method.Name.StartsWith("get__") || method.Name.StartsWith("set__"))
            {
                continue;
            }

            if (BfObjectDefaultVirtualMethods.Contains(method.Name))
            {
                continue;
            }

            if (method.IsVirtual || method.IsAbstract)
            {
                let interfaceMethod = scope String();
                interfaceMethod.AppendF("{}", method.ReturnType.GetFullName(..scope String()));
                interfaceMethod.AppendF(" {}", method.Name);
                
                interfaceMethod.AppendF("(");
                interfaceMethod.AppendF("{}", method.GetParamsDecl(..scope String()));
                interfaceMethod.AppendF(");\n");

                Compiler.EmitTypeBody(selfType, interfaceMethod);
            }
        }
    }
}

[AttributeUsage(.Struct)]
struct CppVFuncsAttribute : this(Type classType), Attribute, IOnTypeInit
{
    const StringView[?] BfObjectDefaultVirtualMethods = .(
        "DynamicCastToTypeId",
        "DynamicCastToInterface",
        "DynamicCastToSignature",
        "ToString",
        "GCMarkMembers"
    );

    [Comptime]
    public void OnTypeInit(Type selfType, Self* prev)
    {
        GenVFuncs(selfType, prev);

        var content = new String();
        defer delete content;

        content.AppendF("\n\n");
        content.AppendF("public static Self Create({} target)\n", classType.GetFullName(..scope String()));

        content.Append("{\n");
        content.AppendF("    Self vfuncs = .();\n\n");
        
        for (let method in classType.GetMethods())
        {
            if (!IsValidMethod(method))
            {
                continue;
            }
            
            content.AppendF("    // {} {}", method.Name, "\n");
            content.Append("    {\n");
            {
                content.AppendF("        delegate {}({}) del = scope => target.{};\n",
                    method.ReturnType.GetFullName(..scope String()),
                    method.GetParamsDecl(..scope String()),
                    method.Name
                );
    
                content.AppendF("        vfuncs.{0} = (.)del.[Friend]mFuncPtr;\n", method.Name);
            }
            content.Append("    }\n");
        }
        
        content.AppendF("\n");
        content.AppendF("    return vfuncs;\n");
        content.Append("}\n");

        Compiler.EmitTypeBody(selfType, content);
    }

    [Comptime]
    private void GenVFuncs(Type selfType, Self* prev)
    {
        for (let method in classType.GetMethods())
        {
            if (IsValidMethod(method))
            {
                let funcPtrDecl = scope String();
                funcPtrDecl.AppendF("public function {}", method.ReturnType.GetFullName(..scope String()));
                
                funcPtrDecl.AppendF("(");

                if (classType.IsObject)
                {
                    funcPtrDecl.AppendF("{} self", classType.GetFullName(..scope String()));
                }
                else
                {
                    funcPtrDecl.AppendF("{}* self", classType.GetFullName(..scope String()));
                }

                let paramsDecl = method.GetParamsDecl(..scope String());
                if (!paramsDecl.IsEmpty)
                {
                    funcPtrDecl.AppendF(", {}", paramsDecl);
                } 

                funcPtrDecl.AppendF(")");

                funcPtrDecl.AppendF(" {};\n", method.Name);

                Compiler.EmitTypeBody(selfType, funcPtrDecl);
            }
        }
    }

    private bool IsValidMethod(System.Reflection.MethodInfo method)
    {
        if (method.IsConstructor || method.IsDestructor)
        {
            return false;
        }

        if (method.Name.StartsWith("get__") || method.Name.StartsWith("set__"))
        {
            return false;
        }

        if (BfObjectDefaultVirtualMethods.Contains(method.Name))
        {
            return false;
        }

        return method.IsVirtual || method.IsAbstract;
    }
}

namespace System.Reflection
{
    extension MethodInfo
    {
        public bool IsVirtual => Compiler.IsComptime
            ? (Type.[Friend]Comptime_Method_GetInfo(mData.mComptimeMethodInstance).mMethodFlags & .Virtual) != 0
            : (mData.mMethodData.[Friend]mFlags & .Virtual) != 0;

        public bool IsAbstract => Compiler.IsComptime
        	? (Type.[Friend]Comptime_Method_GetInfo(mData.mComptimeMethodInstance).mMethodFlags & .Abstract) != 0
            : (mData.mMethodData.[Friend]mFlags & .Abstract) != 0;
    }
}