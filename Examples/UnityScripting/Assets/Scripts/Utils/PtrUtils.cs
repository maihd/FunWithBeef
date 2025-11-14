using System;
using System.Runtime.InteropServices;

public unsafe static class PtrUtils
{
    [StructLayout(LayoutKind.Sequential)]
    struct PointerWrapper<T>
        where T : class
    {
        public T data;
    }

    static object[] tempArray = new object[1];

    static IntPtr* arrayPtr = (IntPtr*)Marshal.UnsafeAddrOfPinnedArrayElement(tempArray, 0);

    public static IntPtr ToPointer(object obj)
    {
        unsafe
        {
            // var wrapper = new PointerWrapper<T>
            // {
            //     data = obj
            // };
            // var wrapperPtr = &wrapper;
            // return *(IntPtr*)wrapperPtr;

            tempArray[0] = obj;
            var objPtr = arrayPtr[0];
            return objPtr;
        }
    }

    public static T FromPointer<T>(IntPtr ptr)
    {
        unsafe
        {
            // var wrapper = *(PointerWrapper<T>*)&ptr;
            // return wrapper.data;

            arrayPtr[0] = ptr;
            return (T)tempArray[0];
        }
    }
}