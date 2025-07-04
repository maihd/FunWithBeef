namespace BeefExtendCpp;

using System;
using System.IO;
using System.Reflection;

static class GenCppWrapper
{
    [Comptime]
    public static void GenerateAll(StringView targetDir)
    {
        for (let typeDecl in Type.TypeDeclarations)
        {
            if (typeDecl.GetCustomAttribute<GenCppWrapperAttribute>() case .Ok(let attr))
            {
                Generate(typeDecl.ResolvedType, attr.ParentClass, attr.TargetTypeName, targetDir);
            }
        }
    }

    [Comptime]
    public static void Generate(Type type, StringView parentClass, StringView targetTypeName = "", StringView targetDir = "cpp_generated")
    {
        let typeName = !targetTypeName.IsEmpty ? targetTypeName : type.GetName(..scope .());

        let targetFilePath = scope $"{targetDir}/{typeName}.h";
        let content = scope $$"""
            // C++ wrapper for {{typeName}}

            #include "CppLib.h"

            {{GenerateExternFuncs(type, ..scope .())}}

            class {{typeName}} : public {{parentClass}}
            {
            public:

            {{GenerateClassBody(type, ..scope .())}}

            private:
                char buffer[{{type.InstanceStride}}];
            };

            //! EOF

            """;

        if (!Directory.Exists(targetDir))
        {
            Directory.CreateDirectory(targetDir);
        }

        var result = File.WriteAll(targetFilePath, .((uint8*)content.CStr(), content.Length));
        if (result case .Err)
        {
            Runtime.FatalError(scope $"Failed to written at path: {targetFilePath}");
        }
    }

    [Comptime]
    private static void GenerateClassBody(Type type, String output)
    {
        let typeName = type.GetName(..scope .());

        for (let method in type.GetMethods())
        {
            if (method.GetCustomAttribute<GenCppMethodAttribute>() case .Ok(let attr)) 
            {
                if (method.IsConstructor)
                {
                    output.Append(scope
                        $$"""
                            {{typeName}}()
                            {
                                auto self = this;
                                {{typeName}}_Ctor(buffer, self);
                            }


                        """
                    );
                    continue;
                }

                if (method.IsDestructor)
                {
                    output.Append(scope
                        $$"""
                            ~{{typeName}}()
                            {
                                {{typeName}}_Dtor(buffer);
                            }


                        """
                    );
                    continue;
                }

                let modifiers = "virtual"; // For simple, assume all methods are virtually
                
                if (method.ParamCount > 0)
                {
                    output.Append(scope
                        $$"""
                            {{modifiers}} void {{method.Name}}({{GetCppMethodParamsDecl(method, ..scope .())}})
                            {
                                {{typeName}}_{{method.Name}}(buffer, {{method.GetArgsList(..scope .())}});
                            }
        
        
                        """
                    );
                }
                else
                {
                    output.Append(scope
                        $$"""
                            {{modifiers}} void {{method.Name}}({{GetCppMethodParamsDecl(method, ..scope .())}})
                            {
                                {{typeName}}_{{method.Name}}(buffer);
                            }


                        """
                    );
                }
            }
        }
    }

    [Comptime]
    private static void GenerateExternFuncs(Type type, String output)
    {
        let typeName = type.GetName(..scope .());
        //let typeFullName = type.GetFullName(.. scope .());

        //var ctorCount = 0;


        //output.Append(scope $$"struct {{externTypeName}};\n");

        for (let method in type.GetMethods())
        {
            if (!method.HasCustomAttribute<GenCppMethodAttribute>())
            {
                continue;
            }

            if (method.IsConstructor)
            {
                let paramsDecl = method.ParamCount > 0
                    ? scope $"(void* memory, {GetCppMethodParamsDecl(method, ..scope .())})"
                    : scope $"(void* memory)";

                output.Append(scope $$"extern \"C\" __declspec(dllimport) void* {{typeName}}_Ctor{{paramsDecl}};\n");
                continue;
            }

            if (method.IsDestructor)
            {
                output.Append(scope $$"extern \"C\" __declspec(dllimport) void {{typeName}}_Dtor(void* self);\n");
                continue;
            }

            if (method.ParamCount > 0)
            {
                output.Append(scope $$"extern \"C\" __declspec(dllimport) void {{typeName}}_{{method.Name}}(void* self, {{GetCppMethodParamsDecl(method, ..scope .())}});\n");
            }
            else
            {
                output.Append(scope $$"extern \"C\" __declspec(dllimport) void {{typeName}}_{{method.Name}}(void* self);\n");
            }
        }
    }

    [Comptime]
    private static void GetCppMethodParamsDecl(MethodInfo method, String output)
    {
        for (let i < method.ParamCount)
        {
            if (i > 0)
            {
                output.Append(", ");
            }

            let paramName = method.GetParamName(i);
            let paramType = method.GetParamType(i);
            if (paramType.IsPointer)
            {
                output.AppendF("void* {}", paramName);
            }
            else
            {
                output.AppendF("{} {}", paramType.GetName(..scope .()), paramName);
            }
        }
    }
}