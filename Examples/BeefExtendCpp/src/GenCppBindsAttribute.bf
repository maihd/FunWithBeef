namespace BeefExtendCpp;

using System;
using System.Reflection;
using System.Collections;

[AttributeUsage(.Class)]
struct GenCppBindsAttribute : this(Type targetType), Attribute, IOnTypeInit
{
    [Comptime]
    public void OnTypeInit(Type type, Self* prev)
    {
        let typeName = targetType.GetName(..scope .());
        let typeFullName = targetType.GetFullName(.. scope .());

        //var ctorCount = 0; 

        for (let method in targetType.GetMethods())
        {
            if (!method.HasCustomAttribute<GenCppMethodAttribute>())
            {
                continue;
            }

            if (method.IsConstructor)
            {
                let paramsDecl = method.ParamCount > 0
                    ? scope $"(void* memory, {method.GetParamsDecl(..scope .())})"
                    : scope $"(void* memory)";

                Compiler.EmitTypeBody(type, scope $$"""
                    [Export, LinkName("{{typeName}}_Ctor")]
                    public static {{typeFullName}} {{typeName}}_Ctor{{paramsDecl}}
                    {
                        Console.WriteLine("{{typeName}}.Ctor");

                        let alloc = PlacementAlloc(memory);
                        let self = new:alloc {{typeFullName}}({{method.GetArgsList(..scope .())}});
                        return self;
                    }


                """);

                continue;
            }

            if (method.IsDestructor)
            {
                Compiler.EmitTypeBody(type, scope $$"""
                    [Export, LinkName("{{typeName}}_Dtor")]
                    public static void {{typeName}}_Dtor({{typeFullName}} self)
                    {
                        Console.WriteLine("{{typeName}}.Dtor");
                    
                        delete:null self;
                    }


                """);

                continue;
            }

            if (method.ParamCount > 0)
            {
                Compiler.EmitTypeBody(type, scope $$"""
                    [Export, LinkName("{{typeName}}_{{method.Name}}")]
                    public static void {{typeName}}_{{method.Name}}({{typeFullName}} self, {{method.GetParamsDecl(..scope .())}})
                    {
                        self.{{method.Name}}({{method.GetArgsList(..scope .())}});
                    }


                """);
            }
            else
            {
                Compiler.EmitTypeBody(type, scope $$"""
                    [Export, LinkName("{{typeName}}_{{method.Name}}")]
                    public static void {{typeName}}_{{method.Name}}({{typeFullName}} self)
                    {
                        self.{{method.Name}}();
                    }


                """);
            }
        }
    }
}