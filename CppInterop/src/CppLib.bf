using System;
using System.Interop;


[AlwaysInclude]
public static class CppLib
{
	//?Intro@CppLib@@YAXXZ
	//?Intro@CppLib@@SAXXZ
	[LinkName(.CPP)]
	public static extern void Intro();
}

// This is where Beef failed to handle C++ naming mangle
namespace CppLibNamespace
{
	static
	{
		[LinkName(.CPP)]
		public static extern void Outro();
	}
}

namespace CStrContainer
{
	[CRepr, AlwaysInclude]
	public struct CStr
	{
		public char8* ptr;

		[Inline]
		public this(char8* ptr)
		{
			this.ptr = ptr;
		}
	}
}

[CRepr, AlwaysInclude]
public class HelloClass
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

	[LinkName(.CPP)]
	public extern void SetMessage([MangleConst] ref CStrContainer.CStr message);

	//[LinkName("HelloClass::SayHi")]
	[LinkName(.CPP)]
	public extern virtual void SayHi();

	//[LinkName("HelloClass::ShowMessage")]
	[LinkName(.CPP)]
	public extern virtual void ShowMessage();
}