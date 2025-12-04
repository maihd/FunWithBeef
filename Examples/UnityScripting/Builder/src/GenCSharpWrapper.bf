namespace UnityScripting.Builder;

using System;
using System.IO;
using System.Reflection;
using System.Collections;

static class GenCSharpWrapper
{
    [Comptime]
    public static void GenerateAll(StringView targetDir)
    {
        for (let typeDecl in Type.TypeDeclarations)
        {
            if (typeDecl.GetCustomAttribute<UnityScripting.UnityExportAttribute>() case .Ok(let attr))
            {
                Generate(typeDecl.ResolvedType, typeDecl.BaseType.GetFullName(..scope String()), "", targetDir);
            }
        }
    }

    [Comptime]
    public static void Generate(Type type, StringView parentClass, StringView targetTypeName = "", StringView targetDir = "cpp_generated")
    {
        let typeName = !targetTypeName.IsEmpty ? targetTypeName : type.GetName(..scope .());

        let targetFilePath = scope $"{targetDir}/{typeName}.cs";
        let content =
			scope $$"""
            // This code is auto-generated, donot editting
            // C# wrapper for {{typeName}}

            using System;
            using System.Runtime.InteropServices;

            using UnityEngine;

            {{GenerateExternFuncs(type, ..scope .())}}

            public class {{typeName}} : {{parentClass}}
            {
                {{GenerateClassFields(type, ..scope .())}}

                {{GenerateClassBody(type, ..scope .())}}
            };
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
	private static void GenerateClassFields(Type type, String output)
	{
	    for (let field in type.GetFields())
	    {
            if (!field.IsInstanceField)
            {
                continue;
            }

            if (type.BaseType.GetField(scope .(field.Name)) case .Ok(let _))
            {
                continue;
            }

            var modifiers = "";

			if (field.IsPrivate)
			{
				modifiers = "private";
			}
			if (field.IsProtected)
			{
				modifiers = "protected";
			}
			if (field.IsPublic)
			{
				modifiers = "public";
			}

            let csharpType = GetCSharpType(field.FieldType, ..scope String());
            
            output.Append(scope
			    $$"{{modifiers}} {{csharpType}} {{field.Name}};\n    "
			);
	    }
	}

    private static readonly Dictionary<StringView, StringView> TypeMappings = new .()
    {
        ("System.String", "string"),
        ("System.StringView", "string"),
        ("int", "int"),
        ("uint", "uint"), 
    } ~ {
        Console.WriteLine("Destroying TypeMappings...");
        delete TypeMappings;
    };

    [Comptime]
    private static void GetCSharpType(Type type, String output)
    {
        if (type.GetCustomAttribute<UnityTypeAttribute>() case .Ok(let attr) && !String.IsNullOrEmpty(attr.Name))
        {
            output.Clear();
            output.Append(attr.Name);
            return;
        }

        let typeFullName = type.GetFullName(..output);
        if (TypeMappings.TryGetValue(typeFullName, let result))
        {
            output.Clear();
            output.Append(result);
            return;
        }
    }

    [Comptime]
    private static void GenerateClassBody(Type type, String output)
    {
        let typeName = type.GetName(..scope .());

        for (let method in type.GetMethods())
        {
            if (method.Name == "Start")
            {
                output.Append(scope $$"""
                    [UnmanagedFunctionPointer(CallingConvention.Cdecl)]
                    delegate void {{typeName}}_{{method.Name}}_Delegate(IntPtr ptr);

                    static {{typeName}}_{{method.Name}}_Delegate {{typeName}}_{{method.Name}};

                    void {{method.Name}}()
                    {
                        if ({{typeName}}_{{method.Name}} == null)
                        {
                            {{typeName}}_{{method.Name}} = BeefLibs.GetFnPtrFromNative<{{typeName}}_{{method.Name}}_Delegate>("{{typeName}}_{{method.Name}}");
                        }

                        {{typeName}}_{{method.Name}}(IntPtr.Zero);
                    }
                """);
            }

            if (method.GetCustomAttribute<UnityScripting.UnityExportAttribute>() case .Ok(let attr)) 
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
            if (!method.HasCustomAttribute<UnityScripting.UnityExportAttribute>())
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