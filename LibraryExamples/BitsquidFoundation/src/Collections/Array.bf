namespace BitsquidFoundation;

public struct Array<T>
    where T: struct
{
	public uint32 	size;
	public uint32 	capacity;
	public T* 		data;

	public ref T this[uint32 i] mut => ref data[i];
	public readonly ref T this[uint32 i] => ref data[i];
}