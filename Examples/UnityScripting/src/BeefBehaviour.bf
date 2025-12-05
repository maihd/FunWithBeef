namespace UnityScripting;

using System;
using System.Interop;
using System.Collections;

struct PNAlloc : this(void* ptr)
{
    public void* Alloc(int size, int align)
    {
        DebugLog("Call alloc");
        return ptr;
    }

    public static void Ctor<T>(T ptr)
        where T: class, new
    {
        let placement = PNAlloc(Internal.UnsafeCastToPtr(ptr));
        new:placement T();
    }

    public static void Ctor<T>(void* ptr)
        where T: class, new
    {
        let placement = PNAlloc(ptr);
        new:placement T();
    }
}

[CRepr]
[UnityType(Name = "BeefBehaviour")]
public abstract class BeefBehaviour : Object
{
    private void HandleUnityAwake()
    {
        OnAwake();
    }
    
    private void HandleUnityOnDestroy()
    {
        OnDestroy();
    }

    private void HandleUnityStart()
    {
        OnStart();
    }

	private void HandleUnityUpdate()
	{
        OnUpdate();   
	}

#region Unity Events
    private static Dictionary<uint64, function void(void*)> Ctors = new .() ~ { delete Ctors; Ctors = null; };

    public static void RegisterConstructor(uint64 typeId, function void(void*) ctor)
    {
        if (!Ctors.ContainsKey(typeId))
        {
            Ctors.Add(typeId, ctor);
        }
    }

    public static void CallCtor(uint64 typeId, void* ptr)
    {
        if (Ctors.TryGetValue(typeId, let func))
        {
            func(ptr);
        }

        //PNAlloc.Ctor<BeefBehaviour>(ptr);
    }

    protected virtual void OnAwake()
    {
    }

    protected virtual void OnDestroy()
    {
    }

    protected virtual void OnStart()
    {
    }

    protected virtual void OnUpdate()
    {
    }
#endregion

#region Unity Exports
    [Export]
    [AlwaysInclude]
    [CallingConvention(.Stdcall), LinkName("BeefBehaviourAwake")]
    private static void UnityExports_Awake(BeefBehaviour behaviour, uint64 typeId)
    {
        DebugLog("UnityExports_Awake");

        CallCtor(typeId, Internal.UnsafeCastToPtr(behaviour));
        behaviour.HandleUnityAwake();
    }
    
    [Export]
    [AlwaysInclude]
    [CallingConvention(.Stdcall), LinkName("BeefBehaviourOnDestroy")]
    private static void UnityExports_OnDestroy(BeefBehaviour behaviour)
    {
        DebugLog("UnityExports_OnDestroy");

        behaviour.HandleUnityOnDestroy();
    }
    
    [Export]
    [AlwaysInclude]
    [CallingConvention(.Stdcall), LinkName("BeefBehaviourStart")]
    private static void UnityExports_Start(BeefBehaviour behaviour)
    {
        DebugLog("UnityExports_Start");

        behaviour.HandleUnityStart();
    }
    
    [Export]
    [AlwaysInclude]
    [CallingConvention(.Stdcall), LinkName("BeefBehaviourUpdate")]
    private static void UnityExports_Update(BeefBehaviour behaviour)
    {
        //DebugLog("UnityExports_Update");

        behaviour.HandleUnityUpdate();
    }
#endregion
}