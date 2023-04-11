using System;

public static class CppLib
{
	//?Intro@CppLib@@YAXXZ
	//?Intro@CppLib@@SAXXZ
	[LinkName(.CPP)]
	public static extern void Intro();
}

[CRepr]
public struct HelloClass
{
	public char8* message = null;

	[LinkName(.CPP)]
	public static extern HelloClass* Create();

	[LinkName(.CPP)]
	public static extern void Destroy(HelloClass* helloClass);

	[LinkName(.CPP)]
	public extern void SayHi();

	[LinkName(.CPP)]
	public extern void ShowMessage();
}