namespace UnityScripting;

using System;

struct BeefBehaviourRegistryAttribute : Attribute, IOnTypeInit
{
    [Comptime]
    public void OnTypeInit(Type type, Self* previous)
    {
        GenRegisterBeefBahaviours(type);
    }

    [Comptime]
    private static void GenRegisterBeefBahaviours(Type type)
    {
        Compiler.EmitTypeBody(type, "private static void RegisterBeefBehaviours() {\n");
        for (let typeDecl in TypeDeclaration.TypeDeclarations)
        {
            if (!typeDecl.HasCustomAttribute<UnityExportAttribute>())
            {
                continue;
            }

            let fullName = typeDecl.GetFullName(..scope .());
            Compiler.EmitTypeBody(type, scope $"    BeefBehaviour.RegisterConstructor({(int32)typeDecl.TypeId}, => {fullName}.CallCtor);\n");
        }
        Compiler.EmitTypeBody(type, "}");
    }
}