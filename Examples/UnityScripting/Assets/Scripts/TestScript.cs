using System;
using System.Collections;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using AOT;
using Unity.VisualScripting;
using UnityEditor;
using UnityEngine;

public class TestScript : MonoBehaviour
{
    public GameObject prefab;

    static GameObject sPrefab;

#if UNITY_EDITOR

    // Handle to the C++ DLL
    static IntPtr libraryHandle;

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
    delegate void MonoBehaviourUpdateFnPtr(IntPtr BeefyObject);

    [UnmanagedFunctionPointer(CallingConvention.Cdecl)]
    delegate IntPtr MonoBehaviourCreateFnPtr();

    [UnmanagedFunctionPointer(CallingConvention.Cdecl)]
    delegate void MonoBehaviourDestroyFnPtr(IntPtr BeefyObject);

    public delegate void MonoBehaviourUpdateDelegate();

    static InitDelegateFnPtr        Init;
    static MonoBehaviourUpdateFnPtr MonoBehaviourUpdate;
    static MonoBehaviourCreateFnPtr MonoBehaviourCreate;
    static MonoBehaviourDestroyFnPtr MonoBehaviourDestroy;
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
    static extern void MonoBehaviourUpdate(IntPtr BeefyObject);

    [DllImport("UnityScriptingBeef")]
    static extern IntPtr MonoBehaviourCreate();

    [DllImport("UnityScriptingBeef")]
    static extern void MonoBehaviourDestroy(IntPtr BeefyObject);
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

    private IntPtr BeefyObject;

    


    [RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.AfterAssembliesLoaded)]
    private static void LoadFunctions()
    {
#if UNITY_EDITOR
        // Open native library
        libraryHandle = DylibHelper.OpenLibrary(Application.dataPath + LIB_PATH);
        
        MonoBehaviourCreate = DylibHelper.GetFnPtrFromNative<MonoBehaviourCreateFnPtr>(libraryHandle, "MonoBehaviourCreate");
        MonoBehaviourDestroy = DylibHelper.GetFnPtrFromNative<MonoBehaviourDestroyFnPtr>(libraryHandle, "MonoBehaviourDestroy");

        MonoBehaviourUpdate = DylibHelper.GetFnPtrFromNative<MonoBehaviourUpdateFnPtr>(libraryHandle, "MonoBehaviourUpdate");

        Init = DylibHelper.GetFnPtrFromNative<InitDelegateFnPtr>(libraryHandle, "Init");

        Action<PlayModeStateChange> handle = null;
        handle = (state) =>
        {
            if (state == PlayModeStateChange.EnteredEditMode) 
            {
                EditorApplication.playModeStateChanged += handle;

                DylibHelper.CloseLibrary(libraryHandle);
                libraryHandle = IntPtr.Zero;
            }
        };

        EditorApplication.playModeStateChanged += handle;
#endif

        Init(LoggerExports.DebugLog, GameObjectNewPtr, GameObjectGetTransformPtr, TransformSetPositionPtr);

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
    }

    void Awake()
    {
        sPrefab = prefab;

        BeefyObject = MonoBehaviourCreate();
    }

    void Update()
    {
        MonoBehaviourUpdate(BeefyObject);
    }

    void OnDestroy()
    {
        MonoBehaviourDestroy(BeefyObject);
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