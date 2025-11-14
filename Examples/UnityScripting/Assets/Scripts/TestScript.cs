using System;
using System.Collections;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using AOT;
using Unity.VisualScripting;
using UnityEngine;

class TestScript : MonoBehaviour
{
    public GameObject prefab;

    static GameObject sPrefab;

#if UNITY_EDITOR

    // Handle to the C++ DLL
    public IntPtr libraryHandle;

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

    [UnmanagedFunctionPointer(CallingConvention.Cdecl)]
    delegate void MonoBehaviourUpdateFnPtr();

    public delegate void MonoBehaviourUpdateDelegate();

    MonoBehaviourUpdateFnPtr MonoBehaviourUpdate;

#endif

#if UNITY_EDITOR_OSX || UNITY_EDITOR_LINUX
#elif UNITY_EDITOR_WIN
#else
    [DllImport("UnityScriptingBeef")]
    static extern void Init(
        LoggerExports.DebugLogFnPtr log,
        GameObjectNewFnPtr gameObjectNew,
        GameObjectGetTransformFnPtr gameObjectGetTransform,
        TransformSetPositionFnPtr transformSetPosition);

    [DllImport("UnityScriptingBeef")]
    static extern void MonoBehaviourUpdate();

#endif

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

#if UNITY_EDITOR_OSX
	const string LIB_PATH = "/Beef/UnityScriptingBeef.dylib";
#elif UNITY_EDITOR_LINUX
	const string LIB_PATH = "/Beef/UnityScriptingBeef.so";
#elif UNITY_EDITOR_WIN
    const string LIB_PATH = "/Beef/UnityScriptingBeef.dll";
#endif

    void Awake()
    {
        sPrefab = prefab;

#if UNITY_EDITOR

        // Open native library
        libraryHandle = DylibHelper.OpenLibrary(Application.dataPath + LIB_PATH);
        // InitDelegate Init = GetDelegateFromNative<InitDelegate>(
        //     libraryHandle,
        //     "Init");
        MonoBehaviourUpdate = DylibHelper.GetFnPtrFromNative<MonoBehaviourUpdateFnPtr>(libraryHandle, "MonoBehaviourUpdate");

        var Init = DylibHelper.GetFnPtrFromNative<InitDelegateFnPtr>(libraryHandle, "Init");

#endif

        // Below code is naive implemented version
        // Init C++ library
        // ObjectStore.Init(1024);
        // Init(
        //     Marshal.GetFunctionPointerForDelegate(
        //         new GameObjectNewPtrDelegate(
        //             GameObjectNewPtr)),
        //     Marshal.GetFunctionPointerForDelegate(
        //         new GameObjectGetTransformPtrDelegate(
        //             GameObjectGetTransformPtr)),
        //     Marshal.GetFunctionPointerForDelegate(
        //         new TransformSetPositionPtrDelegate(
        //             TransformSetPositionPtr)));

        Init(LoggerExports.DebugLog, GameObjectNewPtr, GameObjectGetTransformPtr, TransformSetPositionPtr);
    }

    void Update()
    {
        MonoBehaviourUpdate();
    }

    void OnApplicationQuit()
    {
#if UNITY_EDITOR
        DylibHelper.CloseLibrary(libraryHandle);
        libraryHandle = IntPtr.Zero;
#endif
    }

    ////////////////////////////////////////////////////////////////
    // C# functions for C++ to call
    ////////////////////////////////////////////////////////////////

    // static int GameObjectNew()
    // {
    //     GameObject go = Instantiate(sPrefab);
    //     return ObjectStore.Store(go);
    // }

    // static int GameObjectGetTransform(int thisHandle)
    // {
    //     GameObject thiz = (GameObject)ObjectStore.Get(thisHandle);
    //     Transform transform = thiz.transform;
    //     return ObjectStore.Store(transform);
    // }

    // static void TransformSetPosition(int thisHandle, Vector3 position)
    // {
    //     Transform thiz = (Transform)ObjectStore.Get(thisHandle);
    //     thiz.position = position;
    // }

    [MonoPInvokeCallback(typeof(GameObjectNewPtrDelegate))]
    static IntPtr GameObjectNewPtr()
    {
        GameObject go = Instantiate(sPrefab);
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