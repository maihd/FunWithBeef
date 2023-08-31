namespace CppInterop;

using System;

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

		// Below code cannot compiled:
		/*
		let helloClass = HelloClass.Create();
		defer HelloClass.Destroy(helloClass);
		*/
		
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
		helloClass.SetMessage("BeefLang is Fun!");
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