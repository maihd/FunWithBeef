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

        var encoding = Encoding.GetEncoding("utf-8");

        unsafe
        {
            // Create a ReadOnlySpan<byte> from the byte*
            ReadOnlySpan<byte> byteSpan = new ReadOnlySpan<byte>((byte*)data, (int)length);

            // Get the number of characters required for the string
            int charCount = encoding.GetCharCount(byteSpan);

            // Allocate a char array to hold the decoded characters
            char[] charBuffer = new char[charCount];

            // Use a fixed statement to get a pointer to the charBuffer
            fixed (char* charPtr = charBuffer)
            {
                // Decode the bytes into the char buffer
                encoding.GetChars(byteSpan, new Span<char>(charPtr, charCount));
            }

            // Create a string from the char array
            return new string(charBuffer);
        }
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