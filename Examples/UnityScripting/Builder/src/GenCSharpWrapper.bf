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
                var parentClass = typeDecl.BaseType.GetFullName(..scope String());
                if (typeDecl.BaseType.GetCustomAttribute<UnityTypeAttribute>() case .Ok(let unityType))
                {
                    parentClass = unityType.Name;
                }

                Generate(typeDecl.ResolvedType, parentClass, "", targetDir);
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

            public class {{typeName}} : {{parentClass}}
            {
                protected override ulong BeefTypeId => {{(int32)type.TypeDeclaration.TypeId}};

                {{GenerateCSharpClassFields(type, ..scope .())}}

                {{GenerateCSharpClassBody(type, ..scope .())}}
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
	private static void GenerateCSharpClassFields(Type type, String output)
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
        ("int8", "sbyte"),
        ("uint8", "byte"), 
        ("int16", "short"),
        ("uint16", "ushort"),
        ("int32", "int"),
        ("uint32", "uint"), 
        ("int64", "long"),
        ("uint64", "ulong"),
        ("int", "IntPtr"),
        ("uint", "UIntPtr"), 
        ("char8", "byte"), 
        ("char16", "char"),
        ("char32", "int"), 
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
    private static void GenerateCSharpClassBody(Type type, String output)
    {
        let typeName = type.GetName(..scope .());

        for (let method in type.GetMethods())
        {
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
                            {{modifiers}} void {{method.Name}}({{GetCSharpMethodParamsDecl(method, ..scope .())}})
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
                            {{modifiers}} void {{method.Name}}({{GetCSharpMethodParamsDecl(method, ..scope .())}})
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
    private static void GetCSharpMethodParamsDecl(MethodInfo method, String output)
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