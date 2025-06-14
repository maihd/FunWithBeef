namespace CppInterop;

using System;


[AlwaysInclude]
class SubHelloClass : HelloClass
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

struct CppAlloc
{
    [Inline]
	public void* Alloc(int size, int align)
	{
		return Internal.Malloc(size);
	}

    [Inline]
	public void* AllocTyped(Type type, int size, int align)
    {
        void* data = Alloc(size, align);
        if (type.HasDestructor)
            MarkRequiresDeletion(data);
        return data;
    }
    
    [Inline]
	public void Free(void* ptr)
	{
		Internal.Free(ptr);
	}
    
    [Inline]
    public void MarkRequiresDeletion(void* obj)
    {
        /* TODO: call this object's destructor when the allocator is disposed */
    }
}

class Program
{
	[CLink]
	public static extern void cIntro();

	public static void Main()
	{
		defer Console.Read();
		

		Console.WriteLine("Demo C++ Interop");

		Console.WriteLine("Call cIntro()");
		cIntro();

		Console.WriteLine("Call CppLib::Intro()");
		CppLib.Intro();

		// Beef cannot handle namespace mangle
		//defer CppLibNamespace.Outro();

		// Below code cannot compiled:
		/*
		let helloClass = HelloClass.Create();
		defer HelloClass.Destroy(helloClass);
		*/

        let allocator = CppAlloc();
        let nativeCppClass = new:allocator NativeCppClass();
        //defer delete:allocator nativeCppClass; // Uncomment to if leak detector work or not -> Beef cannot track Object without BfObject fields in object

        Console.WriteLine("NativeCppClass stride in Beef: {}", sizeof(NativeCppClass));

		//let nativeCppClass = NativeCppClass.Create();
        //defer NativeCppClass.Destroy(nativeCppClass);

        //INativeCppVTable nativeVTable = null;

        // IDE will raise exception here
        //nativeCppClass.SayHi();

        // Enable object access check IDE will raise exception
        nativeCppClass.Data.message = "NativeCppClass";
        let nativeCppClassData = nativeCppClass.Data;
        nativeCppClass.SayHi();

        Object bfObject = nativeCppClass;
        Console.WriteLine("bfObject: {}", bfObject.ToString(..scope String()));

		let helloClass = new HelloClass();
		defer delete helloClass;
		
		Console.WriteLine("Call HelloClass::SayHi()");
		helloClass.SayHi();

		Console.WriteLine("Call HelloClass::ShowMessage() with message = null");
		helloClass.ShowMessage();

		Console.WriteLine("Call HelloClass::ShowMessage() with message = \"BeefLang is Fun!\"");
		helloClass.message = "BeefLang is Fun!";
		helloClass.ShowMessage();
		
		Console.WriteLine("Call HelloClass::ShowMessage() with SetMessage(\"BeefLang is Fun!\")");
		helloClass.SetMessage(ref CStrContainer.CStr("BeefLang is Fun!"));
		helloClass.ShowMessage();
		

		let subHelloClass = new SubHelloClass();
		defer delete subHelloClass;
		
		Console.WriteLine("Call SubHelloClass::SayHi()");
		subHelloClass.SayHi();

		Console.WriteLine("Call SubHelloClass::ShowMessage() with message = null");
		subHelloClass.ShowMessage();

		Console.WriteLine("Call SubHelloClass::ShowMessage() with message = \"BeefLang is Fun!\"");
		subHelloClass.message = "BeefLang is Fun!";
		subHelloClass.ShowMessage();
		
		Console.WriteLine("Call SubHelloClass::ShowMessage() with SetMessage(\"BeefLang is Fun!\")");
		subHelloClass.SetMessage("BeefLang is Fun!");
		subHelloClass.ShowMessage();
	}
}