Orthodox C++ vs Beef Comparing
------------------------------
I found [Orthodox C++](https://gist.github.com/bkaradzic/2e39896bc7d8c34e042b) and [Beef](https://www.beeflang.org/) are very similar.


Common features
---------------
- Prefer C code that works, good C interop
- Don't do [this](https://archive.md/2014.04.28-125041/http://www.boost.org/doc/libs/1_55_0/libs/geometry/doc/html/geometry/design.html), the end of "design rationale" in Beef/Orthodox C++ should be immedately after "Quite simple, and it is usable. EOF".
- No runtime C wrapper
- No exceptions
- No bad RTTI (Beef provide good and familiar Reflection system, with additional comptime code generation)
- No complicated metaprogramming with templates
- Standard library with good memory management, unify implementation for all platforms (2 main reasons gamedev avoid STL)
- Support all syntaxes sugar of C++17 (but simpler):
    > As of January 14th 2022, Orthodox C++ committee approved use of C++17.


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
let lambda = [=memory]() =>
{
    // Work here
}
~
{
    delete:allocator memory;
};
lambda();
```

Winner: Beef is cleaner, but no different works. What Orthodox C++ can do, Beef can and with simpler ways.