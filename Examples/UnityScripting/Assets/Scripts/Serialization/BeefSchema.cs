using System;
using System.Collections.Generic;
using Unity.VisualScripting;
using UnityEditor;
using UnityEngine;

[Serializable]
public class BeefSchema
{
    public string               Name;
    public bool                 IsRef;
    public BeefSchemaField[]    Fields;
}

[Serializable]
public struct BeefSchemaField
{
    public string   Name;
    public string   Type;
    public bool     IsRef;
    public object   DefaultValue;
}

public static class BeefSchemaRegistry
{
    private static Dictionary<string, BeefSchema> Schemas = new Dictionary<string, BeefSchema>();

    public static BeefSchema FindSchema(string name)
    {
        if (Schemas.TryGetValue(name, out var schema))
        {
            return schema;
        }

        return Schemas["UnityEngine.Object"];
    }

    #if UNITY_EDITOR
    [InitializeOnLoadMethod]
    private static void SetupDefaultSchemas()
    {
        Schemas["int"] = new()
        {
            Name = "int",
            IsRef = false,
            Fields = new BeefSchemaField[]
            {
            }
        };

        
        Schemas["Test"] = new()
        {
            Name = "Test",
            IsRef = true,
            Fields = new BeefSchemaField[]
            {
                new()
                {
                    Name = "Value",
                    Type = "int",
                    IsRef = false,
                    DefaultValue = 10
                }
            }
        };

        
        Schemas["Test2"] = new()
        {
            Name = "Test2",
            IsRef = true,
            Fields = new BeefSchemaField[]
            {
                new()
                {
                    Name = "Value",
                    Type = "TestScript",
                    IsRef = true,
                    DefaultValue = null
                }
            }
        };
    }
    #endif
}