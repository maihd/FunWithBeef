using System;
using System.Collections;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using AOT;
using UnityEngine;

unsafe class TestScript : MonoBehaviour
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

    public delegate void MonoBehaviourUpdateDelegate();
    public MonoBehaviourUpdateDelegate MonoBehaviourUpdate;

#endif

#if UNITY_EDITOR_OSX || UNITY_EDITOR_LINUX
 
	[DllImport("__Internal")]
	public static extern IntPtr dlopen(
		string path,
		int flag);
 
	[DllImport("__Internal")]
	public static extern IntPtr dlsym(
		IntPtr handle,
		string symbolName);
 
	[DllImport("__Internal")]
	public static extern int dlclose(
		IntPtr handle);
 
	public static IntPtr OpenLibrary(string path)
	{
		IntPtr handle = dlopen(path, 0);
		if (handle == IntPtr.Zero)
		{
			throw new Exception("Couldn't open native library: " + path);
		}
		return handle;
	}
 
	public static void CloseLibrary(IntPtr libraryHandle)
	{
		dlclose(libraryHandle);
	}
 
	public static T GetDelegate<T>(IntPtr libraryHandle, string functionName) 
        where T : class
	{
		IntPtr symbol = dlsym(libraryHandle, functionName);
		if (symbol == IntPtr.Zero)
		{
			throw new Exception("Couldn't get function: " + functionName);
		}
		return Marshal.GetDelegateForFunctionPointer(
			symbol,
			typeof(T)) as T;
	}
 
 
#elif UNITY_EDITOR_WIN

    [DllImport("kernel32")]
    public static extern IntPtr LoadLibrary(
        string path);

    [DllImport("kernel32")]
    public static extern IntPtr GetProcAddress(
        IntPtr libraryHandle,
        string symbolName);

    [DllImport("kernel32")]
    public static extern bool FreeLibrary(
        IntPtr libraryHandle);

    public static IntPtr OpenLibrary(string path)
    {
        IntPtr handle = LoadLibrary(path);
        if (handle == IntPtr.Zero)
        {
            throw new Exception("Couldn't open native library: " + path);
        }
        return handle;
    }

    public static void CloseLibrary(IntPtr libraryHandle)
    {
        FreeLibrary(libraryHandle);
    }

    public static T GetDelegate<T>(
        IntPtr libraryHandle,
        string functionName) where T : class
    {
        IntPtr symbol = GetProcAddress(libraryHandle, functionName);
        if (symbol == IntPtr.Zero)
        {
            throw new Exception("Couldn't get function: " + functionName);
        }
        return Marshal.GetDelegateForFunctionPointer(
            symbol,
            typeof(T)) as T;
    }

#else

    [DllImport("UnityScripting")]
    static extern void Init(
        IntPtr gameObjectNew,
        IntPtr gameObjectGetTransform,
        IntPtr transformSetPosition);

    [DllImport("UnityScripting")]
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

#if UNITY_EDITOR_OSX
	const string LIB_PATH = "/UnityScripting.bundle/Contents/MacOS/UnityScriptingAAA";
#elif UNITY_EDITOR_LINUX
	const string LIB_PATH = "/Beef/UnityScriptingAAA.so";
#elif UNITY_EDITOR_WIN
    const string LIB_PATH = "/Beef/UnityScriptingAAA.dll";
#endif

    void Awake()
    {
        sPrefab = prefab;

#if UNITY_EDITOR

        // Open native library
        libraryHandle = OpenLibrary(Application.dataPath + LIB_PATH);
        InitDelegate Init = GetDelegate<InitDelegate>(
            libraryHandle,
            "Init");
        MonoBehaviourUpdate = GetDelegate<MonoBehaviourUpdateDelegate>(
            libraryHandle,
            "MonoBehaviourUpdate");

#endif

        // Init C++ library
        ObjectStore.Init(1024);
        Init(
            Marshal.GetFunctionPointerForDelegate(
                new GameObjectNewPtrDelegate(
                    GameObjectNewPtr)),
            Marshal.GetFunctionPointerForDelegate(
                new GameObjectGetTransformPtrDelegate(
                    GameObjectGetTransformPtr)),
            Marshal.GetFunctionPointerForDelegate(
                new TransformSetPositionPtrDelegate(
                    TransformSetPositionPtr)));
    }

    void Update()
    {
        MonoBehaviourUpdate();
    }

    void OnApplicationQuit()
    {
#if UNITY_EDITOR
        CloseLibrary(libraryHandle);
        libraryHandle = IntPtr.Zero;
#endif
    }

    ////////////////////////////////////////////////////////////////
    // C# functions for C++ to call
    ////////////////////////////////////////////////////////////////

    static int GameObjectNew()
    {
        GameObject go = Instantiate(sPrefab);
        return ObjectStore.Store(go);
    }

    static int GameObjectGetTransform(int thisHandle)
    {
        GameObject thiz = (GameObject)ObjectStore.Get(thisHandle);
        Transform transform = thiz.transform;
        return ObjectStore.Store(transform);
    }

    static void TransformSetPosition(int thisHandle, Vector3 position)
    {
        Transform thiz = (Transform)ObjectStore.Get(thisHandle);
        thiz.position = position;
    }

    [MonoPInvokeCallback(typeof(GameObjectNewPtrDelegate))]
    static IntPtr GameObjectNewPtr()
    {
        GameObject go = Instantiate(sPrefab);
        return ToPointer(go);
    }

    [MonoPInvokeCallback(typeof(GameObjectGetTransformPtrDelegate))]
    static IntPtr GameObjectGetTransformPtr(IntPtr ptr)
    {
        GameObject thiz = FromPointer<GameObject>(ptr);
        Transform transform = thiz.transform;
        return ToPointer(transform);
    }

    [MonoPInvokeCallback(typeof(TransformSetPositionPtrDelegate))]
    static void TransformSetPositionPtr(IntPtr ptr, Vector3 position)
    {
        Transform thiz = FromPointer<Transform>(ptr);
        thiz.position = position;
    }

    [StructLayout(LayoutKind.Sequential)]
    struct PointerWrapper<T>
    {
        public T data;
    }

    static object[] tempArray = new object[1];

    static IntPtr* arrayPtr = (IntPtr*)Marshal.UnsafeAddrOfPinnedArrayElement(tempArray, 0);

    public static IntPtr ToPointer(object obj)
    {
        unsafe
        {
            // var wrapper = new PointerWrapper<T>
            // {
            //     data = obj
            // };
            // var wrapperPtr = &wrapper;
            // return *(IntPtr*)wrapperPtr;

            tempArray[0] = obj;
            var objPtr = arrayPtr[0];
            return objPtr;
        }
    }

    public static T FromPointer<T>(IntPtr ptr)
    {
        unsafe
        {
            // var wrapper = *(PointerWrapper<T>*)&ptr;
            // return wrapper.data;

            arrayPtr[0] = ptr;
            return (T)tempArray[0];
        }
    }
}