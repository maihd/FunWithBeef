namespace UnityScripting;

using System;

[CRepr]
public struct IUnityInterface
{
}

[CallingConvention(.Stdcall)]
public function IUnityInterface* GetInterfaceFn(UnityInterfaceGUID guid);

[CallingConvention(.Stdcall)]
public function void RegisterInterfaceFn(UnityInterfaceGUID guid, IUnityInterface* ptr);

[CallingConvention(.Stdcall)]
public function IUnityInterface* GetInterfaceSplitFn(uint64 guidHigh, uint64 guidLow);

[CallingConvention(.Stdcall)]
public function void RegisterInterfaceSplitFn(uint64 guidHigh, uint64 guidLow, IUnityInterface* ptr);

[CRepr]
public struct IUnityInterfaces
{
	public GetInterfaceFn 				GetInterface;
	public RegisterInterfaceFn 			RegisterInterface;

	public GetInterfaceSplitFn			GetInterfaceSplit;
	public RegisterInterfaceSplitFn 	RegisterInterfaceSplit;
}