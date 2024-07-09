namespace Win32Window;

using System;
using System.Threading;

class Program
{
	static void Main()
	{
		Console.WriteLine("FunWithBeef: Win32 Windowing");

        Window window = scope Window();
        window.Create();

        var time = DateTime.Now;
        while (!window.shouldClose)
        {
            window.Update();

            let now = DateTime.Now;
            let deltaTime = (now - time).TotalMilliseconds;
            if (deltaTime < 1000 / 60.0f)
            {
                let sleepTime = (int32)(1000 / 60.0f - deltaTime);
                Thread.Sleep(sleepTime);
            }
            time = now;
        }

        window.Destroy();
	}
}