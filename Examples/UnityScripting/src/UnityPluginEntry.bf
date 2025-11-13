namespace UnityScripting;

using System;

[AlwaysInclude]
public static class UnityPluginEntry
{
	public static bool IsLoaded { get; private set; }

	[Export, LinkName("UnityPluginLoad"), CallingConvention(.Stdcall)]
	private static void OnLoad(in IUnityInterfaces interfaces)
	{
		IsLoaded = true;

		Debug.sLogger = (.)interfaces.GetInterfaceSplit(0xBAF9E57C61A811ECUL, 0xC5A7CC7861A811ECUL);
		Debug.Log("Unity Scripting OnLoad");
	}

	[Export, LinkName("UnityPluginUnload"), CallingConvention(.Stdcall)]
	private static void OnUnload()
	{
	}
}