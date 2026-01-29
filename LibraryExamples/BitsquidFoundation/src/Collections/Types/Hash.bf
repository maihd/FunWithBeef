namespace BitsquidFoundation;

/// Hash from an uint64 to POD objects. If you want to use a generic key
/// object, use hash functiion to map that object to an uint64
/// @note(maihd): Differences from C++ implement
///    - this data type is trivial copy
///    - have no destructor, use Dispose pattern instead
///    - have no copy operator, use Clone function instead
public struct Hash<T>
     where T: struct
{
    public struct Entry
    {
        public uint64   key;
        public uint32   next;
        public T        value;
    }
}