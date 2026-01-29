namespace BitsquidFoundation.Collections.Tests;

using System;

public static class ArrayTest
{
    [Test]
    public static void TestArray()
    {
        MemoryGlobals.Init();
        defer MemoryGlobals.Shutdown();

        Array<int> array = .(MemoryGlobals.DefaultAllocator);
        defer array.Dispose();

        Test.Assert(array._size == 0);

        array.PushBack(3);
        Test.Assert(array._size == 1);
        Test.Assert(array[0] == 3);

        Array<int> array2 = array.Clone();
        Test.Assert(array2._size == array2._size);
        Test.Assert(array2[0] == 3);

        array2[0] = 5;
        Test.Assert(array[0] == 3);
        Test.Assert(array2[0] == 5);

        array2 = array.Clone();
        Test.Assert(array2._size == array2._size);
        Test.Assert(array[0] == 3);

        array.PopBack();
        Test.Assert(array._size == 0);

        for (let i in 0..<100)
        {
            array.PushBack(i);
        }
        Test.Assert(array._size == 100);
    }
}