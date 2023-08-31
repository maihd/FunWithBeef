using System;
using System.Interop;

public static class CppLib
{
	//?Intro@CppLib@@YAXXZ
	//?Intro@CppLib@@SAXXZ
	[LinkName(.CPP)]
	public static extern void Intro();
}

[CRepr]
public class HelloClass : Object
{
	public c_char* message = null;
	
	// Below code cannot compiled:
	//[LinkName("HelloClass::Create")]
	//[LinkName(.CPP)]
	//public static extern HelloClass Create();

	//[LinkName("HelloClass::Destroy")]
	//[LinkName(.CPP)]
	//public static extern void Destroy(HelloClass helloClass);

	[LinkName(.CPP)]
	public extern void SetMessage([MangleConst] c_char* message);

	//[LinkName("HelloClass::SayHi")]
	[LinkName(.CPP)]
	public extern virtual void SayHi();

	//[LinkName("HelloClass::ShowMessage")]
	[LinkName(.CPP)]
	public extern virtual void ShowMessage();
}

public class SubHelloClass : HelloClass
{
	public override void SayHi()
	{
		Console.WriteLine("SubHelloClass say hi");
	}

	public override void ShowMessage()
	{
		Console.WriteLine("Message from HelloClass: {0}", message == null ? StringView("(null)") : StringView(message));
	}
}