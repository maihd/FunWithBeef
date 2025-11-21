using UnityEngine;
using UnityEditor;

[CustomEditor(typeof(BeefSerializer))]
public class BeefSerializerEditor : Editor
{
    public override void OnInspectorGUI()
    {

        var serializer = target as BeefSerializer;
        serializer.Buffs.Validate();

        // var injectedObject = serializer.Injection.Object as TestScript;
        // injectedObject = EditorGUILayout.ObjectField("Object as TestScript", injectedObject, typeof(TestScript), true) as TestScript;

        if (serializer.Buffs.Schema != null)
        {
            foreach (var field in serializer.Buffs.Schema.Fields)
            {
                switch (field.Type)
                {
                    case "int":
                    {
                        var input = (int)(long)serializer.Buffs.GetField(field.Name);
                        var result = EditorGUILayout.IntField(field.Name, input);
                        serializer.Buffs.SetField(field.Name, result);
                        break;
                    }

                    case "TestScript":
                    {
                        var input = serializer.Buffs.GetUnityObject(field.Name) as TestScript;
                        var result = EditorGUILayout.ObjectField(field.Name, input, typeof(TestScript), true);
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

        // EditorGUILayout.PropertyField(serializedObject.FindProperty("Buffs").FindPropertyRelative("Data"));
        // serializedObject.ApplyModifiedProperties();

        serializer.Buffs.PopulateJson();

        GUILayout.Label("Json");
        GUILayout.Label(serializer.Buffs.GetJson());

        if (GUILayout.Button("Update Schema"))
        {
            var schema = BeefSchemaRegistry.FindSchema("Test2");
            serializer.Buffs.UpdateSchema(schema);
        }

        // serializer.Injection.Object = injectedObject;
        serializedObject.Update();
    }
} 