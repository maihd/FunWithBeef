namespace BitsquidFoundation;

using System;

public extension Array<T>
{
    public void Grow(uint32 minCapacity = 0) mut
    {
        var newCapacity = _capacity * 2 + 8;
        if (newCapacity < minCapacity)
        {
            newCapacity = minCapacity;
        }

        SetCapacity(newCapacity);
    }
    
    public void Resize(uint32 newSize) mut
    {
        if (newSize > _capacity)
        {
            Grow(newSize);
        }

        _size = newSize;
    }

    public void SetCapacity(uint32 newCapacity) mut
    {
        if (newCapacity == _capacity)
        {
            return;
        }

        if (newCapacity < _size)
        {
            Resize(newCapacity);
        }

        T* newData = null;
        if (newCapacity > 0)
        {
            newData = (T*)_allocator.Alloc(strideof(T) * (int)newCapacity, alignof(T));
            Internal.MemCpy(newData, _data, strideof(T) * (int)_size);
        }

        _allocator.Free(_data);
        _data = newData;
        _capacity = newCapacity;
    }

    [Inline]
    public void Clear() mut
    {
        Resize(0);
    }

    [Inline]
    public void Trim() mut
    {
        SetCapacity(_size);
    }

    [Inline]
    public void PushBack(T item) mut
    {
        if (_size + 1 > _capacity)
        {
            Grow();
        }
        _data[_size++] = item;
    }

    [Inline]
    public void PopBack() mut
    {
        _size--;
    }
}