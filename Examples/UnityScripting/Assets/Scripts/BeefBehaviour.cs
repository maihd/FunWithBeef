using System;
using System.Reflection;
using System.Runtime.InteropServices;

using Unity.Collections.LowLevel.Unsafe;
using UnityEngine;

[StructLayout(LayoutKind.Sequential, Pack = 4)]
public abstract class BeefBehaviour : MonoBehaviour
{
    protected IntPtr BeefPtr;
    protected IntPtr BeefMeta0;
    protected IntPtr BeefMeta1;

    protected virtual ulong BeefTypeId => 0;

    // Start is called once before the first execution of Update after the MonoBehaviour is created
    protected virtual void Awake()
    {
        var field0 = GetType().GetField(nameof(BeefMeta0), BindingFlags.NonPublic | BindingFlags.GetField | BindingFlags.Instance);
        Debug.Log(field0);

        var offset0 = UnsafeUtility.GetFieldOffset(field0);
        // var offset1 = UnsafeUtility.GetFieldOffset(GetType().GetField("BeefMeta1"));
        // var offset0 = Marshal.OffsetOf(typeof(BeefBehaviour), nameof(BeefMeta0));
        // var offset1 = Marshal.OffsetOf(typeof(BeefBehaviour), nameof(BeefMeta1));
        var address = (IntPtr)((long)PtrUtils.ToPointer(this) + (long)offset0);
        BeefPtr = address;

        BeefBehaviourAwake(BeefPtr, BeefTypeId);
    }

    protected virtual void Start()
    {
        BeefBehaviourStart(BeefPtr);
    }

    // Update is called once per frame
    protected virtual void Update()
    {
        BeefBehaviourUpdate(BeefPtr);
    }

    protected virtual void OnDestroy()
    {
        BeefBehaviourOnDestroy(BeefPtr);
    }

#if UNITY_EDITOR
    [UnmanagedFunctionPointer(CallingConvention.Cdecl)]
    delegate IntPtr BeefBehaviourAwakeFnPtr(IntPtr BeefyObject, ulong BeefTypeId);

    [UnmanagedFunctionPointer(CallingConvention.Cdecl)]
    delegate void BeefBehaviourOnDestroyFnPtr(IntPtr BeefyObject);

    [UnmanagedFunctionPointer(CallingConvention.Cdecl)]
    delegate IntPtr BeefBehaviourStartFnPtr(IntPtr BeefyObject);

    [UnmanagedFunctionPointer(CallingConvention.Cdecl)]
    delegate void BeefBehaviourUpdateFnPtr(IntPtr BeefyObject);

    public delegate void MonoBehaviourUpdateDelegate();

    static BeefBehaviourAwakeFnPtr      BeefBehaviourAwake;
    static BeefBehaviourOnDestroyFnPtr  BeefBehaviourOnDestroy;

    static BeefBehaviourStartFnPtr      BeefBehaviourStart;
    static BeefBehaviourUpdateFnPtr     BeefBehaviourUpdate;
#endif

#if UNITY_EDITOR_OSX || UNITY_EDITOR_LINUX
#elif UNITY_EDITOR_WIN
#else
    // private const string LIB_PATH = "__Internal";
    private const string LIB_PATH = "UnityScriptingBeef";

    [DllImport(LIB_PATH)]
    static extern void BeefBehaviourUpdate(IntPtr BeefyObject);

    [DllImport(LIB_PATH)]
    static extern IntPtr BeefBehaviourCreate();

    [DllImport(LIB_PATH)]
    static extern void BeefBehaviourDestroy(IntPtr BeefyObject);
#endif
    
#if UNITY_EDITOR
    [RuntimeInitializeOnLoadMethod(RuntimeInitializeLoadType.BeforeSceneLoad)]
    private static void LoadFunctions()
    {
        // Open native library
        BeefBehaviourAwake = BeefLibs.GetFnPtrFromNative<BeefBehaviourAwakeFnPtr>("BeefBehaviourAwake");
        BeefBehaviourOnDestroy = BeefLibs.GetFnPtrFromNative<BeefBehaviourOnDestroyFnPtr>("BeefBehaviourOnDestroy");

        BeefBehaviourStart = BeefLibs.GetFnPtrFromNative<BeefBehaviourStartFnPtr>("BeefBehaviourStart");
        BeefBehaviourUpdate = BeefLibs.GetFnPtrFromNative<BeefBehaviourUpdateFnPtr>("BeefBehaviourUpdate");

        UnityEditor.EditorApplication.playModeStateChanged += UnloadFunctions;
    }

    private static void UnloadFunctions(UnityEditor.PlayModeStateChange state)
    {
        if (state == UnityEditor.PlayModeStateChange.EnteredEditMode) 
        {
            BeefBehaviourAwake = null;
            BeefBehaviourOnDestroy = null;

            BeefBehaviourStart = null;
            BeefBehaviourUpdate = null;
        }
    }
#endif
}
