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

		let helloClass = HelloClass.Create();
		defer HelloClass.Destroy(helloClass);

		helloClass.SayHi();
		helloClass.ShowMessage();

		helloClass.message = "BeefLang is fun!";
		helloClass.ShowMessage();
	}
}