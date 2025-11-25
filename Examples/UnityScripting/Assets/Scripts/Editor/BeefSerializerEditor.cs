using UnityEngine;
using UnityEditor;
using System;
using System.CodeDom;
using Unity.VisualScripting;
using System.Reflection;

[CustomEditor(typeof(BeefSerializer))]
public class BeefSerializerEditor : Editor
{
    public override void OnInspectorGUI()
    {

        var serializer = target as BeefSerializer;
        serializer.Buffs.Validate();

        // var injectedObject = serializer.Injection.Object as TestScript;
        // injectedObject = EditorGUILayout.ObjectField("Object as TestScript", injectedObject, typeof(TestScript), true) as TestScript;

        var schema = BeefSchemaRegistry.FindSchema(serializer.Buffs.schemaName);
        if (schema != null)
        {
            serializer.Buffs.SyncSchema(schema);

            foreach (var field in schema.Fields)
            {
                switch (field.Type)
                {
                    case "int":
                    {
                        var input = Convert.ToInt32(serializer.Buffs.GetField(field.Name));
                        var result = EditorGUILayout.IntField(field.Name, input);
                        serializer.Buffs.SetField(field.Name, result);
                        break;
                    }

                    case "float":
                    {
                        var input = Convert.ToSingle(serializer.Buffs.GetField(field.Name));
                        var result = EditorGUILayout.FloatField(field.Name, input);
                        serializer.Buffs.SetField(field.Name, result);
                        break;
                    }

                    default:
                    {
                        var type = Assembly.GetAssembly(typeof(UnityEngine.Object)).GetType(field.Type);
                        if (type == null)
                        {
                            break;
                        }

                        var input = serializer.Buffs.GetUnityObject(field.Name);
                        if (!type.IsInstanceOfType(input))
                        {
                            input = null;
                        }

                        var result = EditorGUILayout.ObjectField(field.Name, input, type, true);
                        serializer.Buffs.SetUnityObject(field.Name, result);
                        break;
                    }
                }
            }
        }
        else
        {
            EditorGUILayout.LabelField("No Schema");
        }

        serializer.Buffs.PopulateJson();

        GUILayout.Label("Json");
        GUILayout.Label(serializer.Buffs.GetJson());

        if (GUILayout.Button("Update Schema"))
        {
            var newSchema = BeefSchemaRegistry.FindSchema("Test2");
            serializer.Buffs.UpdateSchema(newSchema);
        }

        serializedObject.Update();
    }
} 