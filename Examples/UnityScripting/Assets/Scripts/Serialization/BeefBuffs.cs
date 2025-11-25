using System;
using System.Collections.Generic;
using Newtonsoft.Json;
using UnityEngine;

[Serializable]
public class BeefBuffs
{
    [SerializeField]
    public string schemaName;

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

    public void SyncSchema(BeefSchema schema)
    {
        if (Fields == null)
        {
            Fields = new Dictionary<string, object>();
        }

        if (Objects == null)
        {
            Objects = new List<UnityEngine.Object>();
        }

        foreach (var field in schema.Fields)
        {
            if (Fields.ContainsKey(field.Name))
            {
                continue;
            }

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
    }

    public void UpdateSchema(BeefSchema schema)
    {
        if (!(schemaName != schema.Name || Fields == null))
        {
            return;
        }

        Schema = schema;
        schemaName = schema.Name;

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
        Fields[path] = value;
    }

    public object GetField(string path)
    {
        if (Fields.TryGetValue(path, out var value))
        {
            return value;
        }

        return null;
    }

    public void SetUnityObject(string path, UnityEngine.Object value)
    {
        if (Fields.TryGetValue(path, out var index))
        {
            Objects[(int)(long)index] = value;
        }
    }

    public UnityEngine.Object GetUnityObject(string path)
    {
        if (Fields.TryGetValue(path, out var index))
        {
            return Objects[(int)(long)index];
        }

        return null;
    }

    public void PopulateJson()
    {
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