namespace BitsquidFoundation;

/// A double-ended queue/ring buffer
/// @note(maihd): Differences from C++ implement
///    - this data type is trivial copy
///    - have no destructor, use Dispose pattern instead
///    - have no copy operator, use Clone function instead
public struct Queue<T>
    where T: struct
{
    public Array<T> _data;
    public uint32   _size;
    public uint32   _offset;

	public ref T this[uint32 i] mut => ref _data[i];
	public readonly ref T this[uint32 i] => ref _data[i];
}