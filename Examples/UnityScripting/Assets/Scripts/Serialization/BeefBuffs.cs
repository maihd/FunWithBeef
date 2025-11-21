using System;
using System.Collections.Generic;
using Newtonsoft.Json;
using UnityEditor;
using UnityEngine;

[Serializable]
public class BeefBuffs
{
    [SerializeField]
    private string schemaName;

    [SerializeField]
    public byte[] Data;

    [SerializeField]
    private string JsonStr;

    [SerializeField]
    public BeefSchema Schema;

    [SerializeField]
    public List<UnityEngine.Object> Objects = new List<UnityEngine.Object>();

    public Dictionary<string, object> Fields { get; private set; }

    public BeefBuffs()
    {
        Debug.Log("Called constructor of BeefBuffs");
    }

    public void Validate()
    {
        if (Schema != null && Schema.Fields == null)
        {
            Schema = null;
        }

        if (!string.IsNullOrEmpty(JsonStr))
        {
            ReadFieldsFromJson();
        }
    }

    public void UpdateSchema(BeefSchema schema)
    {
        if (!(schemaName != schema.Name || Fields == null))
        {
            return;
        }

        Schema = schema;
        schemaName = schema.Name;

        // keys = new List<string>();
        // values = new List<object>();

        // foreach (var field in schema.Fields)
        // {
        //     keys.Add(field.Name);
        //     values.Add(field.DefaultValue);
        // }

        Fields = new Dictionary<string, object>();
        foreach (var field in schema.Fields)
        {
            if (field.IsRef)
            {
                Objects.Add((UnityEngine.Object)field.DefaultValue);
                Fields.Add(field.Name, Objects.Count - 1);
            }
            else
            {
                Fields.Add(field.Name, field.DefaultValue);
            }
        }

        PopulateJson();
    }

    public void SetField(string path, object value)
    {
        // for (int i = 0; i < keys.Count; i++)
        // {
        //     if (keys[i] == path)
        //     {
        //         values[i] = value;
        //         break;
        //     }
        // }
        Fields[path] = value;
    }

    public object GetField(string path)
    {
        // for (int i = 0; i < keys.Count; i++)
        // {
        //     if (keys[i] == path)
        //     {
        //         return values[i];
        //     }
        // }

        if (Fields.TryGetValue(path, out var value))
        {
            return value;
        }

        return null;
    }

    public void SetUnityObject(string path, UnityEngine.Object value)
    {
        // for (int i = 0; i < keys.Count; i++)
        // {
        //     if (keys[i] == path)
        //     {
        //         values[i] = value;
        //         break;
        //     }
        // }

        if (Fields.TryGetValue(path, out var index))
        {
            Objects[(int)(long)index] = value;
        }
    }

    public UnityEngine.Object GetUnityObject(string path)
    {
        // for (int i = 0; i < keys.Count; i++)
        // {
        //     if (keys[i] == path)
        //     {
        //         return values[i];
        //     }
        // }

        if (Fields.TryGetValue(path, out var index))
        {
            return Objects[(int)(long)index];
        }

        return null;
    }

    public void PopulateJson()
    {
        // var jsonObject = "{";
        
        // int count = 0;
        // foreach (var field in Schema.Fields)
        // {
        //     if (count > 0)
        //     {
        //         jsonObject += ",";
        //     }

        //     switch (field.Type)
        //     {
        //         case "int":
        //             int valueInt = (int)GetField(field.Name);
        //             jsonObject += $"\"{field.Name}\": {valueInt}";
        //             break;
        //     }

        //     count++;
        // }

        // JsonStr = jsonObject + "}";
        JsonStr = Fields != null ? JsonConvert.SerializeObject(Fields) : "";
    }

    public string GetJson()
    {
        return JsonStr;
    }

    public void ReadFieldsFromJson()
    {
        Fields = JsonConvert.DeserializeObject<Dictionary<string, object>>(JsonStr);
    }

    public void PopulateData()
    {
        // int offset = 0;
        var bytes = new List<byte>();

        foreach (var field in Schema.Fields)
        {
            switch (field.Type)
            {
                case "int":
                    int valueInt = (int)GetField(field.Name);
                    bytes.Add((byte)((valueInt << 24) & 0xff));
                    bytes.Add((byte)((valueInt << 16) & 0xff));
                    bytes.Add((byte)((valueInt <<  8) & 0xff));
                    bytes.Add((byte)((valueInt <<  0) & 0xff));
                    break;
            }
        }

        Data = bytes.ToArray();
    }

    public void ReadFieldsFromData()
    {
        int offset = 0;
        foreach (var field in Schema.Fields)
        {
            switch (field.Type)
            {
                case "int":
                    int valueInt = 0;
                    valueInt |= Data[offset + 0] << 24;
                    valueInt |= Data[offset + 1] << 16;
                    valueInt |= Data[offset + 2] <<  8;
                    valueInt |= Data[offset + 3] <<  0;
                    offset += 4;

                    SetField(field.Name, valueInt);
                    break;
            }
        }
    }
}

[Serializable]
public struct BeefInjection
{
    public UnityEngine.Object   Object;
    public Type                 Type;
}
