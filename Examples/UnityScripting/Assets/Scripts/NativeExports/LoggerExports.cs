using System;
using System.Text;
using System.Runtime.InteropServices;
using AOT;

[StructLayout(LayoutKind.Sequential)]
public struct NativeStringViewUtf8
{
    public IntPtr data;
    public IntPtr length;

    public override string ToString()
    {
        if (data == IntPtr.Zero || length == IntPtr.Zero)
        {
            return string.Empty;
        }

        return Marshal.PtrToStringUTF8(data, (int)length);
    }
}

public static class LoggerExports
{
    [UnmanagedFunctionPointer(CallingConvention.Cdecl)]
    public delegate void DebugLogFnPtr(NativeStringViewUtf8 stringview);

    [MonoPInvokeCallback(typeof(DebugLogFnPtr))]
    public static void DebugLog(NativeStringViewUtf8 stringview)
    {
        // UnityEngine.Debug.Log("Calling debug log");

        UnityEngine.Debug.Log(stringview.ToString());
    }
}