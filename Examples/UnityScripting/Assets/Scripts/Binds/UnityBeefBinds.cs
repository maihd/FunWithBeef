using System;
using System.Runtime.InteropServices;
using AOT;

using UnityEngine;

public static class UnityBeefBinds
{
    delegate int GameObjectNewDelegate();
    delegate int GameObjectGetTransformDelegate(
        int thisHandle);
    delegate void TransformSetPositionDelegate(
        int thisHandle,
    Vector3 position);

    delegate IntPtr GameObjectNewPtrDelegate();
    delegate IntPtr GameObjectGetTransformPtrDelegate(IntPtr ptr);
    delegate void TransformSetPositionPtrDelegate(IntPtr ptr, Vector3 position);

    [UnmanagedFunctionPointer(CallingConvention.Cdecl)]
    delegate IntPtr GameObjectNewFnPtr();

    [UnmanagedFunctionPointer(CallingConvention.Cdecl)]
    delegate IntPtr GameObjectGetTransformFnPtr(IntPtr ptr);

    [UnmanagedFunctionPointer(CallingConvention.Cdecl)]
    delegate void TransformSetPositionFnPtr(IntPtr ptr, Vector3 position);


#if UNITY_EDITOR
    public delegate void InitDelegate(
        IntPtr gameObjectNew,
        IntPtr gameObjectGetTransform,
        IntPtr transformSetPosition);

    [UnmanagedFunctionPointer(CallingConvention.Cdecl)]
    delegate void InitDelegateFnPtr(
        LoggerExports.DebugLogFnPtr log,
        GameObjectNewFnPtr gameObjectNew,
        GameObjectGetTransformFnPtr gameObjectGetTransform,
        TransformSetPositionFnPtr transformSetPosition);
#else
    private const string LIB_PATH = "UnityScriptingBeef";

    [DllImport(LIB_PATH)]
    static extern void Init(
        LoggerExports.DebugLogFnPtr log,
        GameObjectNewFnPtr gameObjectNew,
        GameObjectGetTransformFnPtr gameObjectGetTransform,
        TransformSetPositionFnPtr transformSetPosition);
#endif


    [RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.BeforeSplashScreen)]
    private static void LoadFunctions()
    {
        Debug.Log("Load functions");

#if UNITY_EDITOR
        var Init = BeefLibs.GetFnPtrFromNative<InitDelegateFnPtr>("Init");

        // Action<UnityEditor.PlayModeStateChange> handle = null;
        // handle = (state) =>
        // {
        //     if (state == UnityEditor.PlayModeStateChange.EnteredEditMode) 
        //     {
        //         UnityEditor.EditorApplication.playModeStateChanged += handle;
        //         handle = null;
        //     }
        // };

        // UnityEditor.EditorApplication.playModeStateChanged += handle;
#endif

        Init(LoggerExports.DebugLog, GameObjectNewPtr, GameObjectGetTransformPtr, TransformSetPositionPtr);
    }

    [MonoPInvokeCallback(typeof(GameObjectNewPtrDelegate))]
    static IntPtr GameObjectNewPtr()
    {
        GameObject go = new GameObject();
        return PtrUtils.ToPointer(go);
    }

    [MonoPInvokeCallback(typeof(GameObjectGetTransformPtrDelegate))]
    static IntPtr GameObjectGetTransformPtr(IntPtr ptr)
    {
        GameObject thiz = PtrUtils.FromPointer<GameObject>(ptr);
        Transform transform = thiz.transform;
        return PtrUtils.ToPointer(transform);
    }

    [MonoPInvokeCallback(typeof(TransformSetPositionPtrDelegate))]
    static void TransformSetPositionPtr(IntPtr ptr, Vector3 position)
    {
        Transform thiz = PtrUtils.FromPointer<Transform>(ptr);
        thiz.position = position;
    }
}