namespace UnityScripting;

using System;

public enum UnityLogType
{
	Error = 0,
	Warning = 2,
	Log = 3,
	Exception = 4,
}

[CallingConvention(.Stdcall)]
public function void UnityLogFn(UnityLogType type, char8* message, char8* fileName, int32 fileLine);

[CRepr]
public struct IUnityLog
{
	public const UnityInterfaceGUID Guid = .(0xBAF9E57C61A811ECUL, 0xC5A7CC7861A811ECUL);

	public UnityLogFn Log;
}