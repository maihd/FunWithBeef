namespace UnityScripting;

using System;
using System.Reflection;

[AttributeUsage(.Class | .Struct)]
public struct UnityExportAttribute : CReprAttribute, IOnTypeInit
{
    [Comptime]
    public void OnTypeInit(Type type, Self* previous) mut
    {
        GenCode(type);
    }

    [Comptime]
    private void GenCode(Type type)
    {
        let methodNames = StringView[?]("Awake", "Start", "Update", "Fixed", "LateUpdate");
        for (let methodName in methodNames)
        {
            //GenMethodBinding(type, methodName);
        }
    }

    [Comptime]
    private void GenMethodBinding(Type type, StringView methodName)
    {
        let typeDecl = type.TypeDeclaration;
        if (typeDecl.HasDeclaredMethod(methodName))
        {
            Compiler.EmitTypeBody(type, scope $$"""

                [AlwaysInclude]
                [Export, CallingConvention(.Stdcall)]
                [LinkName("{{typeDecl.GetName(..scope .())..Replace(".", "_")}}_{{methodName}}")]
                public static void Exports_{{methodName}}(Self* ptr)
                {
                    ptr.{{methodName}}();
                }

            """);
        }
    }
}