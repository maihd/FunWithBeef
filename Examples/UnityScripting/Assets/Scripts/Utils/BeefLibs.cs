using System;
using UnityEngine;

public static class BeefLibs
{
#if UNITY_EDITOR_OSX
	const string LIB_PATH = "/Beef/UnityScriptingBeef.dylib";
#elif UNITY_EDITOR_LINUX
	const string LIB_PATH = "/Beef/UnityScriptingBeef.so";
#elif UNITY_EDITOR_WIN
    const string LIB_PATH = "/Beef/UnityScriptingBeef.dll";
#endif

    static IntPtr LibHandle;

    [RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.AfterAssembliesLoaded)]
    public static void Init()
    {
        Debug.Log("Initialize BeefLibs");

        if (LibHandle != IntPtr.Zero)
        {
            return;
        }

        LibHandle = DylibHelper.OpenLibrary(Application.dataPath + LIB_PATH);
        if (LibHandle == IntPtr.Zero)
        {
            Debug.LogError("Failed to load LibHandle");
        }

    #if UNITY_EDITOR
        Action<UnityEditor.PlayModeStateChange> handle = null;
        handle = (state) =>
        {
            if (state == UnityEditor.PlayModeStateChange.EnteredEditMode) 
            {
                UnityEditor.EditorApplication.playModeStateChanged -= handle;
                handle = null;

                Shutdown();
            }
        };

        UnityEditor.EditorApplication.playModeStateChanged += handle;
    #endif
    }

    public static void Shutdown()
    {
        DylibHelper.CloseLibrary(LibHandle);
        LibHandle = IntPtr.Zero;
    }

    public static T GetDelegateFromNative<T>(string functionName)
        where T : class
    {
        if (LibHandle == IntPtr.Zero)
        {
            Init();
        }

        return DylibHelper.GetDelegateFromNative<T>(LibHandle, functionName);
    }

    public static T GetFnPtrFromNative<T>(string functionName)
    {
        if (LibHandle == IntPtr.Zero)
        {
            Init();
        }

        return DylibHelper.GetFnPtrFromNative<T>(LibHandle, functionName);
    }
}