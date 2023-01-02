Orthodox C++ vs Beef Comparing
------------------------------
I found [Orthodox C++](https://gist.github.com/bkaradzic/2e39896bc7d8c34e042b) and [Beef](https://www.beeflang.org/) are very similar.

Delegate and lambdas
--------------------

Orthodox C++:
```c++
struct DeferDelete
{
    void* memoryToDelete;
    // Maybe need allocator field

    DeferDelete(memory)
        : memoryToDelete(memory)
    {
    }

    ~DeferDelete()
    {
        delete memoryToDelete;
        // C++ cannot pass allocator, show maybe allocator->free base on memory system
    }

};

const auto memory = new int(10));
const auto lambda = [memory](){
    DeferDelete deferDelete(memory); // C++ does not have destructor block like Beef

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