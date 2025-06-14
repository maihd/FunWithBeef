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

public class CppObject : Object, IHashable
{
    public override void ToString(String output)
    {
        output.AppendF("({})", this.GetHashCode());
    }

    public int GetHashCode()
    {
        return (int)Internal.UnsafeCastToPtr(this);
    }
}

[CRepr, AlwaysInclude]
public class HelloClass : CppObject
{
	public c_char* message = null;
    /*{
        get
        {
            return ((uint8*)Internal.UnsafeCastToPtr(this))
        }
    }*/
	
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

[CRepr]
public struct NativeCppClassData
{
    public c_char* message = null;
}

[CppClass(typeof(NativeCppClassData))]
public class NativeCppClass
{
    [LinkName("NativeCppClass_Create")]
    public static extern NativeCppClass Create();

    [LinkName("NativeCppClass_Destroy")]
    public static extern void Destroy(NativeCppClass nativeCppClass);

    public c_char* message
	{
        get => Data.message;
        set => Data.message = value;
    }

    //[NoShow] CppClassBuffer<NativeCppClassData> __internal_buffer;

    [LinkName(.CPP)]
	public extern virtual void SayHi();
    
    [LinkName("NativeCppClass_GetSayHiPtr")]
    public static extern void* GetSayHiPtr();
}

// Click the "Emit" button to view CppVTable methods (should be)
// @note(maihd): I commonly comment this code because editting this file can crash IDE
[CppVTable(typeof(NativeCppClass))]
public interface INativeCppVTable
{
}

// Click the "Emit" button to view BeefVTable methods
// @note(maihd): I commonly comment this code because editting this file can crash IDE
[BeefVTable(typeof(NativeCppClass))]
public interface INativeBeefVTable
{
}

[CppVFuncs(typeof(NativeCppClass))]
public struct NativeCppVFuncs
{

}

struct A
{
}