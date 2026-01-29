namespace BitsquidFoundation;

using System;

/// Dynamically resizable array of POD objects
/// @note(maihd): Differences from C++ implement
///    - this data type is trivial copy
///    - have no destructor, use Dispose pattern instead
///    - have no copy operator, use Clone function instead
public struct Array<T> : IDisposable
    where T: struct
{
    public IAllocator    _allocator;
	public uint32 	     _size;
	public uint32 	     _capacity;
	public T* 		     _data;

	public ref T this[uint32 i] mut => ref _data[i];
	public readonly ref T this[uint32 i] => ref _data[i];

    public this(IAllocator allocator)
    {
        _allocator = allocator;
        _size = 0;
        _capacity = 0;
        _data = null;
    }

    /// Dispose memory usage of this array
    /// @note(maihd): this function use to mimic behavior of destructor in C++
    public void Dispose() mut
    {
        _allocator.Free(_data);
        _size = 0;
        _capacity = 0;
        _data = null;
    }

    /// Clone this array with new memory allocation
    /// @note(maihd): this function use to mimic behavior of copy operator in C++
    public Array<T> Clone()
    {
        var result = Array<T>(_allocator);
        let n = _size;

        result.SetCapacity(n);
        Internal.MemCpy(result._data, _data, strideof(T) * (int)n, alignof(T));

        return result;
    }
}