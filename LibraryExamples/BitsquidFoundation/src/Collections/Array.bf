namespace BitsquidFoundation;

struct Array<T>
{
	uint32 	size;
	uint32 	capacity;
	T* 		data;

	public ref T this[uint32 i] mut => ref data[i];
	public readonly ref T this[uint32 i] => ref data[i];
}