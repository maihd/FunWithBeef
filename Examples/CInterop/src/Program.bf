namespace CInterop;

using System;
using System.Interop;

[AlwaysInclude]
class Program
{
    // Require from zig runtime
    [Export, LinkName("___chkstk_ms")]
    static void ___chkstk_ms(c_intptr frame_size)
    {
        const c_intptr PAGE_SIZE = 4096;
        c_char* frame = scope c_char[frame_size]*;  // NOTE: variable-length array
        for (c_intptr i = frame_size - PAGE_SIZE; i >= 0; i -= PAGE_SIZE) {
            frame[i] = 0;  // touch the guard page
        }
    }

	[LinkName("add")]
	static extern int32 Add(int32 a, int32 b);

	public static void Main()
	{
		Console.WriteLine("Add(1, 2) = {0}", Add(1, 2));
		Console.Read();
	}
}