Orthodox C++ vs Beef Comparing
------------------------------

I found [Orthodox C++](https://gist.github.com/bkaradzic/2e39896bc7d8c34e042b) and [Beef](https://www.beeflang.org/) are very similar.

Delegates and lambdas
---------------------

Orthodox C++:
```c++
struct DeferDelete<T>
{
    T* memoryToDelete;
    // Maybe need allocator field

    DeferDelete(memory)
        : memoryToDelete(memory)
    {
    }

    ~DeferDelete()
    {
        delete memoryToDelete;
        // C++ delete cannot pass allocator (weird syntax: operator delete(memory allocator))
        // So you need call destructor (memory->~T()), later allocator->free base on your memory system
    }

};

const auto memory = new int(10);
const auto lambda = [memory](){
    // Hacks: C++ does not have lambda's destructor block like Beef
    DeferDelete<int> deferDelete(memory);

    // Work here
};
lambda();
```

Beef:
```beef
let memory = new:allocator int(10);
let lambda = [=memory]()
{
    // Work here
}
~
{
    delete:allocator memory;
};
lambda();
```

Winner: Beef is cleaner, but no difference work.